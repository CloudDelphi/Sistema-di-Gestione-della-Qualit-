unit frm_CadForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, FMTBcd, DB, DBClient,
  Provider, SqlExpr, frxClass, frxDBSet, Mask, rxToolEdit, rxCurrEdit, ShellAPI,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormCadForn = class(TForm)
    pnl1: TPanel;
    sbGravar: TSpeedButton;
    sbBbtnSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    lbl1: TLabel;
    edtNome: TEdit;
    lbl2: TLabel;
    edtCodigo: TEdit;
    dbgForn: TDBGrid;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    lbl3: TLabel;
    edtEnd: TEdit;
    lbl4: TLabel;
    edtFone: TEdit;
    lbl5: TLabel;
    edtBairro: TEdit;
    lbl6: TLabel;
    edtCidade: TEdit;
    lblCEP: TLabel;
    edtNota: TCurrencyEdit;
    lbl7: TLabel;
    cbEstado: TComboBox;
    lbl8: TLabel;
    lbl9: TLabel;
    edtFantasia: TEdit;
    lbl10: TLabel;
    edtNumero: TEdit;
    lbl11: TLabel;
    edtValidade: TDateEdit;
    lbl12: TLabel;
    edtCNPJ: TEdit;
    lbl13: TLabel;
    edtInscEst: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    edtContato: TEdit;
    lbl16: TLabel;
    edtMail: TEdit;
    mmoObs: TMemo;
    lbl17: TLabel;
    edtCEP: TMaskEdit;
    frxdbCadForn: TfrxDBDataset;
    zqryForn: TZQuery;
    cdsFornforn_avaliacao: TFloatField;
    CdsFornforn_bairro1: TWideStringField;
    CdsFornforn_cep1: TWideStringField;
    CdsFornforn_cidade1: TWideStringField;
    CdsFornforn_CNPJ1: TWideStringField;
    CdsFornforn_codigo1: TWideStringField;
    CdsFornforn_contato1: TWideStringField;
    CdsFornforn_endereco1: TWideStringField;
    CdsFornforn_estado1: TWideStringField;
    CdsFornforn_fantasia1: TWideStringField;
    CdsFornforn_fone1: TWideStringField;
    CdsFornforn_inscEst1: TWideStringField;
    CdsFornforn_mail1: TWideStringField;
    CdsFornforn_nome1: TWideStringField;
    CdsFornforn_numero1: TWideStringField;
    cdsFornforn_obs: TMemoField;
    cdsFornforn_validade: TDateTimeField;
    zqryImprimir: TZQuery;
    CdsImprimirforn_codigo1: TWideStringField;
    CdsImprimirforn_nome1: TWideStringField;
    cdsImprimirforn_avaliacao: TFloatField;
    cdsImprimirforn_validade: TDateTimeField;
    lbl18: TLabel;
    sbBbtnArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    edtArquivo: TEdit;
    opd1: TOpenDialog;
    CdsFornforn_certificado1: TWideStringField;
    cdsFornforn_area: TMemoField;
    mmoArea: TMemo;
    procedure FormShow(Sender: TObject);
    procedure dbgFornCellClick(Column: TColumn);
    procedure sbImprimirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbBbtnSairClick(Sender: TObject);
    procedure sbBbtnArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure dbgFornKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    cOperacao: Char;
    procedure LimparCampos;
    procedure Botoes(Flag: Boolean);
    function ValidarCampos: Boolean;
    procedure PreencherCampos;
    function NovoCodigo(): string;
    procedure AtualizarDados;
  public
    { Public declarations }
  end;

var
  FormCadForn: TFormCadForn;

implementation

uses frm_Principal, Funcoes, frm_dm, frm_Inicial, frm_Funcoes;

{$R *.dfm}

procedure TFormCadForn.AtualizarDados;
begin
   with cdsForn do begin
      Active:= False;
      CommandText:= ' SELECT * FROM Fornecedores' +
                    ' ORDER BY forn_nome';
      Active:= True;
   end;
end;

procedure TFormCadForn.Botoes(Flag: Boolean);
begin
   sbNovo.Enabled    := Flag;
   sbExcluir.Enabled := not Flag;
   sbGravar.Enabled  := not Flag;
   sbCancelar.Enabled:= not Flag;
   sbImprimir.Enabled:= Flag;
end;

procedure TFormCadForn.dbgFornCellClick(Column: TColumn);
begin
   PreencherCampos;
   Botoes(False);
   dbgForn.Enabled:= True;
end;

procedure TFormCadForn.dbgFornKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
   Botoes(False);
   dbgForn.Enabled:= True;
end;

procedure TFormCadForn.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure TFormCadForn.FormShow(Sender: TObject);
begin
   AtualizarDados();

   edtNome.SetFocus;
   LimparCampos;
   Botoes(True);
end;

procedure TFormCadForn.LimparCampos;
begin
   edtCodigo.Clear;
   edtNome.Clear;
   edtFantasia.Clear;
   edtEnd.Clear;
   edtNumero.Clear;
   edtBairro.Clear;
   edtCidade.Clear;
   edtCEP.Clear;
   edtFone.Clear;
   edtCNPJ.Clear;
   edtInscEst.Clear;
   edtValidade.Clear;
   mmoArea.Clear;
   edtContato.Clear;
   edtMail.Clear;
   cbEstado.ItemIndex:= -1;
   edtNota.Value:= 0;
   mmoObs.Clear;
//   edtCodigo.SetFocus;
   edtArquivo.Clear;
end;

procedure TFormCadForn.PreencherCampos;
begin
   if cdsForn.RecordCount > 0 then begin
      edtCodigo.Text  := cdsForn.FieldByName('forn_codigo').AsString;
      edtNome.Text    := cdsForn.FieldByName('forn_nome').AsString;
      edtFantasia.Text:= cdsForn.FieldByName('forn_fantasia').AsString;
      edtEnd.Text     := cdsForn.FieldByName('forn_endereco').AsString;
      edtNumero.Text  := cdsForn.FieldByName('forn_numero').AsString;
      edtBairro.Text  := cdsForn.FieldByName('forn_bairro').AsString;
      edtCidade.Text  := cdsForn.FieldByName('forn_cidade').AsString;
      edtCEP.Text     := cdsForn.FieldByName('forn_cep').AsString;
      cbEstado.Text   := cdsForn.FieldByName('forn_estado').AsString;
      edtNota.Value   := cdsForn.FieldByName('forn_avaliacao').AsFloat;
      mmoObs.Text     := cdsForn.FieldByName('forn_obs').AsString;
      edtFone.Text    := cdsForn.FieldByName('forn_fone').AsString;
      edtCNPJ.Text    := cdsForn.FieldByName('forn_CNPJ').AsString;
      edtInscEst.Text := cdsForn.FieldByName('forn_InscEst').AsString;
      edtValidade.Date:= cdsForn.FieldByName('forn_validade').AsDateTime;
      mmoArea.Text    := cdsForn.FieldByName('forn_area').AsString;
      edtContato.Text := cdsForn.FieldByName('forn_contato').AsString;
      edtMail.Text    := cdsForn.FieldByName('forn_mail').AsString;
      edtArquivo.Text := cdsForn.FieldByName('forn_certificado').AsString;

      if AllTrim(edtArquivo.Text) = EmptyStr then begin
         sbVisualizar.Enabled:= False;
      end
      else begin
         sbVisualizar.Enabled:= True;
      end;

      sbGravar.Caption:= 'Alterar';
   end;
end;

procedure TFormCadForn.sbBbtnArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   if OPD1.FileName <> '' then begin
      edtArquivo.Text:= OPD1.FileName;
      sbVisualizar.Enabled:= True;
   end
   else begin
      sbVisualizar.Enabled:= False;
   end;
end;

procedure TFormCadForn.sbBbtnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadForn.sbCancelarClick(Sender: TObject);
begin
   Botoes(True);
   LimparCampos;
end;

procedure TFormCadForn.sbExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 25, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then
      begin
         try
            cdsForn.Delete;
            cdsForn.ApplyUpdates(0);
            LimparCampos;
            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
            Auditoria('FORNECEDORES',edtCodigo.Text + '-' + edtNome.Text,'E', '');
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;

   Botoes(True);
end;

procedure TFormCadForn.sbGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
begin
   if ValidarCampos then begin
      if sbGravar.Caption = 'Gravar' then begin
//            with dm.cdsAuxiliar do begin
//               Close;
//               CommandText:= 'SELECT MAX(forn_codigo) + 1 NovoCodigo FROM Fornecedores';
//               Open;
//               iNovoCodigo:= FieldByName('NovoCodigo').AsInteger;
//            end;

         if (Acesso(cUsuario, 25, 'cadastro') = 1) then begin
            cOperacao:= 'I';
            with cdsForn do begin
               Active:= False;
               CommandText:= ' INSERT INTO Fornecedores' +
                             ' (forn_codigo, forn_nome, forn_endereco, forn_numero, forn_bairro, ' +
                             ' forn_cidade, forn_estado, forn_cep, forn_avaliacao, forn_obs, forn_fantasia, ' +
                             ' forn_fone, forn_CNPJ, forn_inscEst, forn_validade, forn_area, forn_contato, ' +
                             ' forn_certificado, forn_mail)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(edtNome.Text) + ',' +
                             QuotedStr(edtEnd.Text) + ',' +
                             QuotedStr(edtNumero.Text) + ',' +
                             QuotedStr(edtBairro.Text) + ',' +
                             QuotedStr(edtCidade.Text) + ',' +
                             QuotedStr(cbEstado.Text) + ',' +
                             QuotedStr(edtCEP.Text) + ',' +
                             VirgulaParaPonto(edtNota.Value,2) + ',' +
                             QuotedStr(mmoObs.Text) + ',' +
                             QuotedStr(edtFantasia.Text) + ',' +
                             QuotedStr(edtFone.Text) + ',' +
                             QuotedStr(edtCNPJ.Text) + ',' +
                             QuotedStr(edtInscEst.Text) + ',' +
                             ArrumaDataSQL(edtValidade.Date) + ',' +
                             QuotedStr(mmoArea.Text) + ',' +
                             QuotedStr(edtContato.Text) + ',' +
                             QuotedStr(DuploBar(edtArquivo.Text)) + ',' +
                             QuotedStr(edtMail.Text) +
                             ' )';
               Execute;
            end;

//               FieldByName('forn_codigo').AsInteger := iNovoCodigo;
         end
         else begin
            Exit;
         end;
      end
      else begin
         if (Acesso(cUsuario, 25, 'alteracao') = 1) then begin
            cOperacao:= 'A';
            with cdsForn do begin
               Active:= False;
               CommandText:= ' UPDATE Fornecedores SET' +
//                             ' forn_codigo = ' + QuotedStr(edtCodigo.Text) + ',' +
                             ' forn_nome = ' + QuotedStr(edtNome.Text) + ',' +
                             ' forn_endereco = ' + QuotedStr(edtEnd.Text) + ',' +
                             ' forn_numero = ' + QuotedStr(edtNumero.Text) + ',' +
                             ' forn_bairro = ' + QuotedStr(edtBairro.Text) + ',' +
                             ' forn_cidade = ' + QuotedStr(edtCidade.Text) + ',' +
                             ' forn_estado = ' + QuotedStr(cbEstado.Text) + ',' +
                             ' forn_cep = ' + QuotedStr(edtCEP.Text) + ',' +
                             ' forn_avaliacao = ' + VirgulaParaPonto(edtNota.Value,2) + ',' +
                             ' forn_obs = ' + QuotedStr(mmoObs.Text) + ',' +
                             ' forn_fantasia = ' + QuotedStr(edtFantasia.Text) + ',' +
                             ' forn_fone = ' + QuotedStr(edtFone.Text) + ',' +
                             ' forn_CNPJ = ' + QuotedStr(edtCNPJ.Text) + ',' +
                             ' forn_inscEst = ' + QuotedStr(edtInscEst.Text) + ',' +
                             ' forn_validade = ' + ArrumaDataSQL(edtValidade.Date) + ',' +
                             ' forn_area = ' + QuotedStr(mmoArea.Text) + ',' +
                             ' forn_contato = ' + QuotedStr(edtContato.Text) + ',' +
                             ' forn_certificado = ' + QuotedStr(DuploBar(edtArquivo.Text)) + ',' +
                             ' forn_mail = ' + QuotedStr(edtMail.Text) +
                             ' WHERE forn_codigo = ' + QuotedStr(edtCodigo.Text);
               Execute;
            end;
            sbGravar.Caption:= 'Gravar';
         end
         else begin
            Exit;
         end;
      end;


//         FieldByName('forn_codigo').AsString    := edtCodigo.Text;
//         FieldByName('forn_nome').AsString      := edtNome.Text;
//         FieldByName('forn_fantasia').AsString  := edtFantasia.Text;
//         FieldByName('forn_endereco').AsString  := edtEnd.Text;
//         FieldByName('forn_numero').AsString    := edtNumero.Text;
//         FieldByName('forn_bairro').AsString    := edtBairro.Text;
//         FieldByName('forn_cidade').AsString    := edtCidade.Text;
//         FieldByName('forn_CEP').AsString       := edtCEP.Text;
//
//         FieldByName('forn_fone').AsString      := edtFone.Text;
//         FieldByName('forn_CNPJ').AsString      := edtCNPJ.Text;
//         FieldByName('forn_InscEst').AsString   := edtInscEst.Text;
//         FieldByName('forn_validade').AsDateTime:= edtValidade.Date;
//         FieldByName('forn_area').AsString      := edtArea.Text;
//         FieldByName('forn_contato').AsString   := edtContato.Text;
//         FieldByName('forn_mail').AsString      := edtMail.Text;
//
//         FieldByName('forn_estado').AsString    := cbEstado.Text;
//         FieldByName('forn_avaliacao').AsFloat  := edtNota.Value;
//         FieldByName('forn_obs').AsString       := mmoObs.Text;
//
//         Post;
      Auditoria('FORNECEDORES',edtCodigo.Text + '-' + edtNome.Text,cOperacao, '');
      AtualizarDados();
      LimparCampos;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      Botoes(True);
   end;
   dm.cdsAuxiliar.Active:= False;
end;

procedure TFormCadForn.sbImprimirClick(Sender: TObject);
begin
   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT forn_codigo, forn_nome, forn_avaliacao, forn_validade' +
                    ' FROM fornecedores' +
                    ' ORDER BY forn_nome';
      Active:= True;
   end;

//   with dm.frxReport1 do begin
//      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Fornecedores.fr3');
//      ShowReport;
//   end;

   Auditoria('FORNECEDORES','','R', '');
end;

procedure TFormCadForn.sbNovoClick(Sender: TObject);
begin
   LimparCampos;
   sbGravar.Caption:= 'Gravar';
   Botoes(False);
   edtCodigo.Text:= NovoCodigo();
   edtNome.SetFocus();
end;

procedure TFormCadForn.sbVisualizarClick(Sender: TObject);
begin
   try
      ShellExecute(Application.Handle, nil, PChar(edtArquivo.text), nil, nil, SW_SHOWMAXIMIZED);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

function TFormCadForn.NovoCodigo: string;
var
   nAux: Integer;
begin
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= 'SELECT MAX(forn_codigo) NovoCodigo FROM Fornecedores';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= '00000001';
      end
      else begin
         try
            nAux:= StrToInt(FieldByName('NovoCodigo').AsString) + 1;
            Result:= StrZero(nAux,8);
         except
            Result:= EmptyStr;
         end;

      end;

   end;
end;

function TFormCadForn.ValidarCampos: Boolean;
begin
   Result:= True;

   if edtNome.Text = EmptyStr then begin
      Result:= False;
      Application.MessageBox('Campo "Nome do Fornecedor" obrigatório !','Aviso',MB_OK+MB_ICONERROR);
      edtNome.SetFocus;
      Exit;
   end;
end;

end.
