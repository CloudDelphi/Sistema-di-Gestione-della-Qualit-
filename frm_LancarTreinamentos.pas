unit frm_LancarTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, DBCtrls, rxCurrEdit,
  DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, IdMailBox;

type
  TFormLancarTreinamentos = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    lbl13: TLabel;
    dblTreinamentos: TDBLookupComboBox;
    lbl15: TLabel;
    dtDataPrevista: TDateEdit;
    dtDataRealizacao: TDateEdit;
    lbl32: TLabel;
    cbbTipo: TComboBox;
    lbl16: TLabel;
    shp1: TShape;
    lblTituloColaboradores: TLabel;
    lblTituloLista: TLabel;
    shp2: TShape;
    lbllb3: TLabel;
    lbl63: TLabel;
    medtTempoTrein: TMaskEdit;
    edtCustoTrein: TCurrencyEdit;
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
    cdsIncluidoDataRealizado: TDateField;
    cdsIncluidoDataPrevista: TDateField;
    cdsIncluidoTipo: TStringField;
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
    function BuscarDadosData(TipoData: Integer): TDateTime;
    function BuscarDadosString(): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLancarTreinamentos: TFormLancarTreinamentos;

implementation

uses
   Funcoes, frm_dm;

{$R *.dfm}

procedure TFormLancarTreinamentos.btnGravarClick(Sender: TObject);
var
   bTreinRealizado: Boolean;
   bTrocaDados: Boolean;
begin
   try
      // Verifica se existem treinamentos já realizados para os
      // colaboradores selecionados na lista
      bTreinRealizado:= False;
      cdsIncluido.First;

      while not cdsIncluido.Eof do begin
         // Verifica se já tem o treinamento gravado (na mesma data)
         with dm.cdsauxiliar do begin
            Active:= False;
            CommandText:= ' SELECT COUNT(*) as Qtd' +
                          ' FROM colab_treinamentos' +
                          ' WHERE codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString +
                          ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue) +
                          ' AND dtre_tre notnull';
            Active:= True;

            if dm.cdsAuxiliar.FieldByName('Qtd').AsInteger > 0 then begin
               bTreinRealizado:= True;
            end;
         end;

         cdsIncluido.Next;
      end;

      if ValidarDados() = True then begin
         if bTreinRealizado = True then begin
            if Application.MessageBox('O treinamento selecionado consta como realizado para alguns colaboradores selecionados. Deseja substituir as informações ?', 'Aviso', MB_YESNO + MB_ICONWARNING +
               MB_DEFBUTTON2) = IDYES then begin
               bTrocaDados:= True;
            end
            else begin
               bTrocaDados:= False;
            end;
         end;

         cdsIncluido.First;

         while not cdsIncluido.Eof do begin
            // Verifica se já tem o treinamento gravado
            with dm.cdsauxiliar do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) as Qtd' +
                             ' FROM colab_treinamentos' +
                             ' WHERE codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString +
                             ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue);
//                             ' AND dtre_tre = ' + ArrumaDataSQL(dtDataRealizacao.Date);
               Active:= True;
            end;

            if dm.cdsAuxiliar.FieldByName('Qtd').AsInteger = 0 then begin
               with cdsGravar do begin
                Active:= False;
                  CommandText:= ' INSERT INTO colab_treinamentos(' +
                                ' codi_col, codi_tre, dtpr_tre, dtre_tre, tipo_tre, ' +
                                ' tre_tempo, tre_custo) VALUES (' +
                                cdsIncluido.FieldByName('Codigo').AsString + ',' +
                                QuotedStr(dblTreinamentos.KeyValue) + ',' +
                                ArrumaDataSQL(dtDataPrevista.Date) + ',' +
                                ArrumaDataSQL(dtDataRealizacao.Date) + ',' +
                                QuotedStr(Copy(cbbTipo.Text, 1, 1)) + ',' +
                                QuotedStr(medtTempoTrein.Text) + ',' +
                                VirgulaParaPonto(edtCustoTrein.Value, 2) +
                                ');';
                  Execute;
               end;
            end
            else begin
               if bTrocaDados = True then begin
                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' UPDATE colab_treinamentos SET' +
                                   ' dtpr_tre = ' + ArrumaDataSQL(dtDataPrevista.Date) + ',' +
                                   ' dtre_tre = ' + ArrumaDataSQL(dtDataRealizacao.Date) + ',' +
                                   ' tipo_tre = ' + QuotedStr(Copy(cbbTipo.Text, 1, 1)) + ',' +
                                   ' tre_tempo = ' + QuotedStr(medtTempoTrein.Text) + ',' +
                                   ' tre_custo = ' + VirgulaParaPonto(edtCustoTrein.Value, 2) +
                                   ' WHERE codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString +
                                   ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue);
                     Execute;
                  end;
               end
               else begin
                  if cdsIncluido.FieldByName('DataRealizado').AsString = '30/12/1899' then begin
                     with cdsGravar do begin
                        Active:= False;
                        CommandText:= ' UPDATE colab_treinamentos SET';
                        if cdsIncluido.FieldByName('DataPrevista').AsString = '30/12/1899' then begin
                           CommandText:= CommandText + ' dtpr_tre = ' + ArrumaDataSQL(dtDataPrevista.Date) + ',';
                        end;
                        if cdsIncluido.FieldByName('Tipo').AsString = '' then begin
                           CommandText:= CommandText + ' tipo_tre = ' + QuotedStr(Copy(cbbTipo.Text, 1, 1)) + ',';
                        end;
                        CommandText:= CommandText +
                                      ' dtre_tre = ' + ArrumaDataSQL(dtDataRealizacao.Date) + ',' +
                                      ' tre_tempo = ' + QuotedStr(medtTempoTrein.Text) + ',' +
                                      ' tre_custo = ' + VirgulaParaPonto(edtCustoTrein.Value, 2) +
                                      ' WHERE codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString +
                                      ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue);
                        Execute;
                     end;
                  end;
               end;
            end;

            cdsIncluido.Next;
         end;

         Application.MessageBox('Treinamentos gravados com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E:Exception do begin
         MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormLancarTreinamentos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormLancarTreinamentos.dbgIncluidosCellClick(Column: TColumn);
begin
   if cdsIncluido.RecordCount > 0 then begin
      cdsIncluido.Delete;
   end;
end;

procedure TFormLancarTreinamentos.dbgIncluidosDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
   dbgListaColaboradores.EndDrag(True); // comanda o final da operacao
end;

procedure TFormLancarTreinamentos.dbgIncluidosDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   // Preparando para receber os dados
   Accept:= Source is TDBGrid;
end;

procedure TFormLancarTreinamentos.dbgListaColaboradoresColEnter(
  Sender: TObject);
begin
   if (dblTreinamentos.KeyValue = -1) or (dblTreinamentos.KeyValue = null) then begin
      Application.MessageBox('Selecione o treinamento primeiro', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
      TryFocus(dblTreinamentos);
      Exit;
   end;
   // Ativando o arrastar
   dbgListaColaboradores.BeginDrag(False);
end;

procedure TFormLancarTreinamentos.dbgListaColaboradoresEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
   if VerificarDados() then begin
      cdsIncluido.Append;
      cdsIncluido.FieldByName('Codigo').AsInteger        := dbgListaColaboradores.DataSource.DataSet.FieldByName('codi_col').AsInteger;
      cdsIncluido.FieldByName('Nome').AsString           := dbgListaColaboradores.DataSource.DataSet.FieldByName('nome_col').AsString;
      cdsIncluido.FieldByName('DataPrevista').AsDateTime := BuscarDadosData(1);
      cdsIncluido.FieldByName('DataRealizado').AsDateTime:= BuscarDadosData(2);
      cdsIncluido.FieldByName('Tipo').AsString           := BuscarDadosString();
      cdsIncluido.Post;
   end
   else begin
      Application.MessageBox('Colaborador já inserido na lista', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

function TFormLancarTreinamentos.BuscarDadosData(TipoData: Integer): TDateTime;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT dtpr_tre, dtre_tre ' +
                    ' FROM colab_treinamentos' +
                    ' WHERE codi_col = ' + dbgListaColaboradores.DataSource.DataSet.FieldByName('codi_col').AsString +
                    ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue);
      Active:= True;

      if TipoData = 1 then begin // Data Prevista
         if FieldByName('dtpr_tre').AsString <> '' then begin
            Result:= FieldByName('dtpr_tre').AsDateTime;
         end
         else begin
            Result:= FieldByName('dtpr_tre').AsDateTime;
         end;
      end;

      if TipoData = 2 then begin // Data Realizada
         if FieldByName('dtre_tre').AsString <> '' then begin
            Result:= FieldByName('dtre_tre').AsDateTime;
         end
         else begin
            Result:= FieldByName('dtre_tre').AsDateTime;
         end;
      end;
   end;

end;

function TFormLancarTreinamentos.BuscarDadosString: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT tipo_tre ' +
                    ' FROM colab_treinamentos' +
                    ' WHERE codi_col = ' + dbgListaColaboradores.DataSource.DataSet.FieldByName('codi_col').AsString +
                    ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue);
      Active:= True;

      Result:= FieldByName('tipo_tre').AsString;
   end;
end;

procedure TFormLancarTreinamentos.FormShow(Sender: TObject);
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

   cbbTipo.ItemIndex:= 0; // Mandatório

   // Abre o dataset pra receber os colaboradores incluídos
   cdsIncluido.CreateDataSet;
   cdsIncluido.Open;
   cdsIncluido.EmptyDataSet;
end;

function TFormLancarTreinamentos.ValidarDados: Boolean;
begin
    if (dblTreinamentos.KeyValue = -1) or (dblTreinamentos.KeyValue = Null) then begin
      Application.MessageBox('Selecione um treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTreinamentos);
      Result:= False;
      Exit;
   end;

   if dtDataPrevista.Text <> '  /  /    ' then begin
      try
         StrToDate(dtDataPrevista.Text);
      except
         Application.MessageBox('Data prevista inválida', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataPrevista.SetFocus;
         Exit;
      end;
   end
   else begin
      Application.MessageBox('Digite a data de prevista do treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      Exit;
   end;

   if dtDataRealizacao.Text <> '  /  /    ' then begin
      try
         StrToDate(dtDataRealizacao.Text);
      except
         Application.MessageBox('Data de realização inválida', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataRealizacao.SetFocus;
         Exit;
      end;
   end
   else begin
      Application.MessageBox('Digite a data de realização do treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      Exit;
   end;

   if cdsIncluido.RecordCount = 0 then begin
      Application.MessageBox('Selecione pelo menos um colaborador', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormLancarTreinamentos.VerificarDados: Boolean;
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
