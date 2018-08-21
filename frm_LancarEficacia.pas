unit frm_LancarEficacia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, DBCtrls, rxCurrEdit,
  DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, IdMailBox;

type
  TFormLancarEficacia = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    lbl13: TLabel;
    dblTreinamentos: TDBLookupComboBox;
    shp1: TShape;
    lblTituloColaboradores: TLabel;
    lblTituloLista: TLabel;
    shp2: TShape;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    dbgListaColaboradores: TDBGrid;
    dbgIncluidos: TDBGrid;
    cdsIncluido: TClientDataSet;
    dsIncluido: TDataSource;
    cdsIncluidoNome: TStringField;
    cdsIncluidoCodigo: TIntegerField;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    dsTreinamentos: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    lbllb1: TLabel;
    mmoAcao: TMemo;
    lbl1: TLabel;
    dblResponsavel: TDBLookupComboBox;
    lbllb2: TLabel;
    dblEficaz: TDBLookupComboBox;
    mmoVerif_eficacia: TMemo;
    lbl2: TLabel;
    lbl3: TLabel;
    dtData: TDateEdit;
    zqryEficaz: TZQuery;
    dspEficaz: TDataSetProvider;
    cdsEficaz: TClientDataSet;
    cdsEficazcodi_com: TLargeintField;
    cdsEficazvalo_com: TWideStringField;
    dsEficaz: TDataSource;
    zqryResp: TZQuery;
    dspResp: TDataSetProvider;
    cdsResp: TClientDataSet;
    dsResp: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgIncluidosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgIncluidosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgListaColaboradoresEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure dbgListaColaboradoresColEnter(Sender: TObject);
    function VerificarDados(): Boolean;
    procedure btnGravarClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure dbgIncluidosCellClick(Column: TColumn);
    procedure mmoAcaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLancarEficacia: TFormLancarEficacia;

implementation

uses
   Funcoes, frm_dm;

{$R *.dfm}

procedure TFormLancarEficacia.btnGravarClick(Sender: TObject);
var
   sNovoCodigo  : string;
   lExisteVerif : Boolean;
   lConfirmaSubs: Boolean;
begin
   lExisteVerif:= False;

   try
      if ValidarDados() then begin
         cdsIncluido.First;

         while not cdsIncluido.Eof do begin
            // Verifica se existem verificações de eficácias já gravadas para os colaboradores
            // e pergunta se o usuário quer substituir pela verificação de eficácia da rotina
            with dm.cdsAux2 do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) as Qtd ' +
                             ' FROM colab_treinamentos T' +
                             ' WHERE ((codi_pla is not null) AND (codi_pla > 0))' +
                             ' AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue) +
                             '       AND codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString;
               Active:= True;

               if FieldByName('Qtd').AsInteger > 0 then begin
                  lExisteVerif:= True;
               end;
            end;

            cdsIncluido.Next;
         end;

         cdsIncluido.First;

         if lExisteVerif = True then begin
            if Application.MessageBox('Existem verificações de eficácia do treinamento ' +
                                      'já cadastradas para alguns colaboradores selecionados. ' +
                                      'Deseja substituir a verificação de eficácia pelo lançamento atual?',
               'Aviso', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
               lConfirmaSubs:= True;
            end
            else begin
               lConfirmaSubs:= False;
            end;
         end;

         while not cdsIncluido.Eof do begin
            if lConfirmaSubs = False then begin // Não substitui o lançamento atual
               // Verifica se existe verificação de eficácia para o treinamento do colaborador
               // Se existir não substitui
               with dm.cdsAux2 do begin
                  Active:= False;
                  CommandText:= ' SELECT COUNT(*) as Qtd ' +
                                ' FROM colab_treinamentos T' +
                                ' WHERE ((codi_pla is not null) AND (codi_pla > 0))' +
                                ' AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue) +
                                '       AND codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString;
                  Active:= True;

                  if FieldByName('Qtd').AsInteger > 0 then begin
                     cdsIncluido.Next;
                     Continue; // Volta para a comparação do while e lê o próximo registro
                  end;
               end;
            end;

            // Verifica se existem treinamentos cadastrados para os colaboradores selecionados
            // Se não existir não grava a verificação de eficácia pra eles
            with dm.cdsAux2 do begin
               Active:= False;
               CommandText:= ' SELECT T.codi_col, C.nome_col, codi_tre, dtpr_tre, ' +
                             ' dtre_tre, codi_pla, tipo_tre, tre_certificado,' +
                             '        tre_tempo, tre_custo' +
                             ' FROM colab_treinamentos T' +
                             ' INNER JOIN colaboradores C ON C.codi_col = T.codi_col' +
                             ' WHERE codi_tre = ' + IntToStr(dblTreinamentos.KeyValue) +
                             '       AND C.codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString;
               Active:= True;
            end;

            if dm.cdsAux2.RecordCount > 0 then begin
               sNovoCodigo:= BuscarNovoCodigo('planoacao', 'codi_pla');
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO planoacao (codi_pla, acao_pla, resp_pla, praz_pla, ' +
                                ' come_pla, efic_pla, cola_pla) VALUES (' +
                                sNovoCodigo +  ',' +
                                QuotedStr(mmoAcao.Text) + ',' +
                                IntToStr(dblResponsavel.KeyValue) + ',' +
                                ArrumaDataSQL(dtData.Date) + ',' +
                                QuotedStr(mmoVerif_eficacia.Text) + ',' +
                                IntToStr(dblEficaz.KeyValue) + ',' +
                                cdsIncluido.FieldByName('Codigo').AsString +
                                ')';
                  Execute;
               end;

               // Atualiza o registro de treinamento com o código do Plano de Ação correspondente
               with dm.cdsAuxiliar do begin
                  Active:= False;
                     CommandText:= ' UPDATE colab_treinamentos ' +
                                   ' SET codi_pla = ' + QuotedStr(sNovoCodigo) +
                                   ' WHERE codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString +
                                   ' AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue);
                     Execute;
               end;
            end;
            cdsIncluido.Next;
         end;
         Auditoria('LANÇAMENTO DE VERIFICAÇÃO DE EFICÁCIA', dblTreinamentos.Text + '-' + dtData.Text, 'I', '');
         Application.MessageBox('Registros gravados corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end; // try
end;

procedure TFormLancarEficacia.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormLancarEficacia.dbgIncluidosCellClick(Column: TColumn);
begin
   if cdsIncluido.RecordCount > 0 then begin
      cdsIncluido.Delete;
   end;
end;

procedure TFormLancarEficacia.dbgIncluidosDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
   dbgListaColaboradores.EndDrag(True); // comanda o final da operacao
end;

procedure TFormLancarEficacia.dbgIncluidosDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   // Preparando para receber os dados
   Accept:= Source is TDBGrid;
end;

procedure TFormLancarEficacia.dbgListaColaboradoresColEnter(
  Sender: TObject);
begin
   // Ativando o arrastar
   dbgListaColaboradores.BeginDrag(False);
end;

procedure TFormLancarEficacia.dbgListaColaboradoresEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
   if VerificarDados() then begin
      cdsIncluido.Append;
      cdsIncluido.FieldByName('Codigo').AsInteger:= dbgListaColaboradores.DataSource.DataSet.FieldByName('codi_col').AsInteger;
      cdsIncluido.FieldByName('Nome').AsString   := dbgListaColaboradores.DataSource.DataSet.FieldByName('nome_col').AsString;
      cdsIncluido.Post;
   end
   else begin
      Application.MessageBox('Colaborador já inserido na lista', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormLancarEficacia.FormShow(Sender: TObject);
begin
   lblTituloColaboradores.Width:= 465;
   lblTituloLista.Width        := 465;

   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT codi_tre, desc_tre' +
                    ' FROM treinamentos' +
                    ' WHERE tre_status = 1' + // Ativos
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   with cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsResp do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsEficaz do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   dblEficaz.KeyValue:= 0;

   // Abre o dataset pra receber os colaboradores incluídos
   cdsIncluido.CreateDataSet;
   cdsIncluido.Open;
   cdsIncluido.EmptyDataSet;
end;

procedure TFormLancarEficacia.mmoAcaoKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

function TFormLancarEficacia.ValidarDados: Boolean;
begin
   if (dblTreinamentos.KeyValue = -1) or (dblTreinamentos.KeyValue = Null) then begin
      Application.MessageBox('Selecione um treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTreinamentos);
      Result:= False;
      Exit;
   end;

   if (dblEficaz.KeyValue = 0) and (Alltrim(mmoVerif_eficacia.Text) = EmptyStr) then begin
      Application.MessageBox('Preencha o campo Verificação da Eficácia do Treinamento','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      TryFocus(mmoVerif_eficacia);
      Exit;
   end;

   if mmoAcao.Text = '' then begin
      Application.MessageBox('Digite as Observações !','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      mmoAcao.SetFocus;
      Exit;
   end;

   if (dblResponsavel.KeyValue = -1) or (dblResponsavel.KeyValue = Null) then begin
      Application.MessageBox('Escolha o responsável pela Verificação da Eficácia !','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      TryFocus(dblResponsavel);
      Exit;
   end;

   if dtData.Text <> '  /  /    ' then begin
      try
         StrToDate(dtData.Text);
      except
         Application.MessageBox('Data inválida', 'Aviso', MB_OK + MB_ICONWARNING);
         dtData.SetFocus;
         Exit;
      end;
   end
   else begin
      Application.MessageBox('Digite a data da verificação de eficácia', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      TryFocus(dtData);
      Exit;
   end;

   if cdsIncluido.RecordCount = 0 then begin
      Application.MessageBox('Selecione pelo menos um colaborador', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormLancarEficacia.VerificarDados: Boolean;
var
   lFlag: Boolean;
begin
   // Verifica se o colaborador já foi inserido na grid
   lFlag:= True;
   with cdsIncluido do begin
      First;
      while not Eof do begin
         if cdsColaboradores.FieldByName('codi_col').AsInteger = cdsIncluido.FieldByName('codigo').AsInteger then begin
            lFlag:= False;
         end;

         Next;
      end;
   end;

   Result:= lFlag;
end;

end.
