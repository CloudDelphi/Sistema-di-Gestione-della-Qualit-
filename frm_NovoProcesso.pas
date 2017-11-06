unit frm_NovoProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  Tt_NovoProcesso = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    BbtnNovo: TSpeedButton;
    edNome: TEdit;
    dbgProcessos: TDBGrid;
    cbClassificacao: TComboBox;
    Label2: TLabel;
    cbGestor: TComboBox;
    Label3: TLabel;
    mEntradas: TMemo;
    Label4: TLabel;
    BbtnImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    Label5: TLabel;
    mSaidas: TMemo;
    Label6: TLabel;
    mRequisitos: TMemo;
    procedure dbgProcessosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProcessosCellClick(Column: TColumn);
    procedure BbtnNovoClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure LimpaCampos;
    procedure PreencheCampos;
    function ValidaCampos: Boolean;
    procedure mEntradasKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure BbtnImprimirClick(Sender: TObject);
    procedure mSaidasExit(Sender: TObject);
    procedure mRequisitosExit(Sender: TObject);
    procedure GravaAuditoriaInterna(sCodigo: string);
    procedure mEntradasExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  t_NovoProcesso: Tt_NovoProcesso;

implementation

uses frm_dm, frm_Principal, DBClient, DB, Funcoes, frm_Inicial;

{$R *.dfm}

procedure Tt_NovoProcesso.sbExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 2, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         try
            Auditoria('PROCESSOS',edNome.Text,'E', '');
            dm.cdsProcessos.Delete;
            dm.cdsProcessos.ApplyUpdates(0);
            LimpaCampos;

            if not (t_Principal = nil) then begin
               t_Principal.IniciaTela;
            end;

            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;
end;

procedure Tt_NovoProcesso.sbGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
begin
   try
      if ValidaCampos then begin
         with dm.cdsAuxiliar do begin
            Close;
            CommandText:= 'SELECT MAX(codi_pro) + 1 NovoCodigo FROM processos';
            Open;
            iNovoCodigo:= FieldByName('NovoCodigo').AsInteger;
         end;
         with dm.cdsProcessos do begin
            Active:= True;
            if sbGravar.Caption = 'Gravar' then begin
               if (Acesso(cUsuario, 2, 'cadastro') = 1) then begin
                  cOperacao:= 'I';
                  Insert;
                  FieldByName('codi_pro').AsInteger:= iNovoCodigo;
               end
               else begin
                  Exit;
               end;
            end
            else begin
               if (Acesso(cUsuario, 2, 'alteracao') = 1) then begin
                  cOperacao:= 'A';
                  Edit;
                  sbGravar.Caption:= 'Gravar';
               end
               else begin
                  Exit;
               end;
            end;

            FieldByName('nome_pro').AsString:= edNome.Text;

            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' Select codi_cla from classificacoes' +
                             ' where desc_cla = ' + QuotedStr(cbClassificacao.Text);
               Active:= True;
               dm.cdsProcessos.FieldByName('clas_pro').AsInteger:= FieldByName('codi_cla').AsInteger;
            end;

            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' Select codi_col from colaboradores' +
                             ' where nome_col = ' + QuotedStr(cbGestor.Text);
               Active:= True;
               dm.cdsProcessos.FieldByName('gest_pro').AsInteger:= FieldByName('codi_col').AsInteger;
            end;

            FieldByName('entr_pro').AsString:= mEntradas.Text;
            FieldByName('said_pro').AsString:= mSaidas.Text;
            FieldByName('requ_pro').AsString:= mRequisitos.Text;
            Post;
            Auditoria('PROCESSOS',edNome.Text, cOperacao, '');
         end;
         LimpaCampos;
      end;
      dm.cdsAuxiliar.Active:= False;
      if cOperacao = 'I' then begin
         GravaAuditoriaInterna(IntToStr(iNovoCodigo));
      end;

      if not (t_Principal = nil) then begin
         t_Principal.IniciaTela;
      end;

      Application.MessageBox('Processo gravado corretamente','Sucesso',MB_OK+MB_ICONINFORMATION);
   except
      on E: Exception do begin
         edNome.SetFocus;
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end; // try
end;

procedure Tt_NovoProcesso.BbtnImprimirClick(Sender: TObject);
begin
//   Auditoria('PROCESSOS','','R', '');
end;

procedure Tt_NovoProcesso.BbtnNovoClick(Sender: TObject);
begin
   LimpaCampos;
   edNome.SetFocus;
   sbGravar.Caption:= 'Gravar';
end;

procedure Tt_NovoProcesso.dbgProcessosCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_NovoProcesso.dbgProcessosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure Tt_NovoProcesso.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   MudaEdicao(t_NovoProcesso,Sender,Key);
end;

procedure Tt_NovoProcesso.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_NovoProcesso.FormShow(Sender: TObject);
begin
   cbClassificacao.Hint:= 'POC - Processo Orientado ao Cliente' + #13 +
                          'PAP - Processo de Apoio ' + #13 +
                          'PCH - Processo Chave ';
   cbClassificacao.ShowHint:= True;

   MontaCombosGeral(9,cbClassificacao);

   with dm.cdsAuxiliar do begin
     Active:= False;
     CommandText:= ' SELECT nome_col FROM Colaboradores '+
                   ' ORDER BY nome_col';
     Active:= True;
     First;

     cbGestor.Items.Clear;
     while not Eof do
     begin
       cbGestor.Items.Add(FieldByName('nome_col').AsString);
       Next;
     end;
     cbGestor.ItemIndex:= -1;
   end;

   with dm.cdsProcessos do begin
     Active:= False;
     CommandText:= ' SELECT codi_pro, nome_pro, clas_pro, gest_pro,' +
                   ' entr_pro, said_pro, requ_pro' +
                   ' FROM processos' +
                   ' ORDER BY nome_pro';
     Active:= True;
   end;

   sbExcluir.Enabled:= False;
end;

procedure Tt_NovoProcesso.GravaAuditoriaInterna(sCodigo: string);
var
   dData: TDateTime;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT distinct data_aud FROM auditoria_interna';
      Active:= True;
      First;

//      if FieldByName('ProxCod').AsString = EmptyStr then begin
//         iUltCod:= 0
//      end
//      else begin
//         iUltCod:= FieldByName('ProxCod').AsInteger;
//      end;

//   iUltCod:= iUltCod + 1;
      while not Eof do begin
         dData:= FieldByName('data_aud').AsDateTime;

         dm.cdsAux.Active:= False;
         dm.cdsAux.CommandText:= 'INSERT INTO Auditoria_Interna VALUES (' +
                       ArrumaDataSQL(dData) + ',' +
                       sCodigo + ',' +
                       '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,' +
                       '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0' +
//                       '"",' +
//                       '"",' +
//                       '"",' +
//                       '""' +
                       ')';
         dm.cdsAux.Execute;

         Next;
      end;
   end;

end;

procedure Tt_NovoProcesso.LimpaCampos;
begin
   edNome.Clear;
   cbClassificacao.Text:= '';
   cbGestor.Text:= '';
   mEntradas.Text:= '';
   mSaidas.Text:= '';
   mRequisitos.Text:= '';
   sbExcluir.Enabled:= False;
   edNome.SetFocus;
   sbGravar.Caption:= 'Gravar';
   edNome.SetFocus;
end;

procedure Tt_NovoProcesso.mEntradasExit(Sender: TObject);
begin
   mEntradas.Text:= AcertaUpper(mEntradas.Text);
end;

procedure Tt_NovoProcesso.mEntradasKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure Tt_NovoProcesso.mRequisitosExit(Sender: TObject);
begin
   mRequisitos.Text:= AcertaUpper(mRequisitos.Text);
end;

procedure Tt_NovoProcesso.mSaidasExit(Sender: TObject);
begin
   mSaidas.Text:= AcertaUpper(mSaidas.Text);
end;

procedure Tt_NovoProcesso.PreencheCampos;
begin
   if dm.cdsProcessos.RecordCount > 0 then begin
      edNome.Text   := dm.cdsProcessos.FieldByName('nome_pro').AsString;

      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT desc_cla FROM classificacoes'+
                       ' WHERE codi_cla = ' + '''' + dm.cdsProcessos.FieldByName('clas_pro').AsString + '''';
         Active:= True;
      end;
      cbClassificacao.Text:= dm.cdsAuxiliar.FieldByName('desc_cla').AsString;

      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT nome_col FROM colaboradores'+
                        ' WHERE codi_col = ' + '''' + dm.cdsProcessos.FieldByName('gest_pro').AsString + '''';
         Active:= True;
      end;
      cbGestor.Text:= dm.cdsAuxiliar.FieldByName('nome_col').AsString;

      mEntradas.Text  := dm.cdsProcessos.FieldByName('entr_pro').AsString;
      mSaidas.Text    := dm.cdsProcessos.FieldByName('said_pro').AsString;
      mRequisitos.Text:= dm.cdsProcessos.FieldByName('requ_pro').AsString;

      sbGravar.Caption:= 'Alterar';
      sbExcluir.Enabled:= True;
   end;
end;

procedure Tt_NovoProcesso.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

function Tt_NovoProcesso.ValidaCampos: Boolean;
begin
   Result:= True;
   if edNome.Text = '' then begin
      Application.MessageBox('Digite o nome do processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edNome.SetFocus;
      Exit;
   end;

   if cbClassificacao.Text = '' then begin
      Application.MessageBox('Escolha uma classificação para o processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbClassificacao.SetFocus;
      Exit;
   end;

//  if cbGestor.Text = '' then
//  begin
//    Application.MessageBox('Escolha um gestor para o processo !','Aviso',MB_OK+MB_ICONWARNING);
//    Result:= False;
//    cbGestor.SetFocus;
//    Exit;
//  end;

   if mEntradas.Text = '' then begin
      Application.MessageBox('Digite as entradas do processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      mEntradas.SetFocus;
      Exit;
   end;
   if mSaidas.Text = '' then begin
      Application.MessageBox('Digite as saídas do processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      mSaidas.SetFocus;
      Exit;
   end;
   if mRequisitos.Text = '' then begin
      Application.MessageBox('Digite os requisitos do processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      mRequisitos.SetFocus;
      Exit;
   end;
end;

end.
