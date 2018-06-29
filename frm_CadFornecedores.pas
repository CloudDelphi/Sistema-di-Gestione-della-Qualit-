unit frm_CadFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadFornecedores = class(TForm)
    pctForn: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgForn: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    frxReport1: TfrxReport;
    frxDBForn: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    edtNumero: TEdit;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl5: TLabel;
    edtCodigo: TEdit;
    lbl1: TLabel;
    edtRazao: TEdit;
    lbl3: TLabel;
    edtEndereco: TEdit;
    lbl4: TLabel;
    edtCaminho: TEdit;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    opd1: TOpenDialog;
    edtNomeFantasia: TEdit;
    lbl8: TLabel;
    lbl7: TLabel;
    edtBairro: TEdit;
    lbl16: TLabel;
    edtCidade: TEdit;
    medtCEP: TMaskEdit;
    lblCEP: TLabel;
    lbl17: TLabel;
    edtFone: TEdit;
    edtCNPJ: TEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    edtInscEst: TEdit;
    lbl20: TLabel;
    edtContato: TEdit;
    lbl21: TLabel;
    edtEmail: TEdit;
    lbl22: TLabel;
    edtNota: TCurrencyEdit;
    dtValidade: TDateEdit;
    lbl23: TLabel;
    lbl24: TLabel;
    mmoArea: TMemo;
    lbl25: TLabel;
    mmoObs: TMemo;
    edtEstado: TEdit;
    lbl11: TLabel;
    dblTipoProd: TDBLookupComboBox;
    zqryTipoProd: TZQuery;
    dspTipoProd: TDataSetProvider;
    cdsTipoProd: TClientDataSet;
    cdsTipoProdtipo_codigo: TIntegerField;
    cdsTipoProdtipo_nomeTipo: TWideStringField;
    dsTipoProd: TDataSource;
    dblTipoProdImp: TDBLookupComboBox;
    lbl13: TLabel;
    chkTodos: TCheckBox;
    cdsImprimirDescTipoProd: TStringField;
    cdsFornforn_area: TWideMemoField;
    cdsFornforn_avaliacao: TFloatField;
    cdsFornforn_bairro: TWideStringField;
    cdsFornforn_cep: TWideStringField;
    cdsFornforn_cidade: TWideStringField;
    cdsFornforn_cnpj: TWideStringField;
    cdsFornforn_contato: TWideStringField;
    cdsFornforn_endereco: TWideStringField;
    cdsFornforn_estado: TWideStringField;
    cdsFornforn_fantasia: TWideStringField;
    cdsFornforn_fone: TWideStringField;
    cdsFornforn_inscest: TWideStringField;
    cdsFornforn_mail: TWideStringField;
    cdsFornforn_nome: TWideStringField;
    cdsFornforn_numero: TWideStringField;
    cdsFornforn_obs: TWideMemoField;
    cdsFornforn_validade: TDateTimeField;
    cdsFornforn_certificado: TWideStringField;
    cdsFornforn_tipoprod: TIntegerField;
    cdsImprimirforn_nome: TWideStringField;
    cdsImprimirforn_avaliacao: TFloatField;
    cdsImprimirforn_validade: TDateTimeField;
    cdsImprimirforn_tipoprod: TIntegerField;
    lbl14: TLabel;
    dblSituacao: TDBLookupComboBox;
    zqrySituacao: TZQuery;
    dspSituacao: TDataSetProvider;
    cdsSituacao: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField2: TWideStringField;
    dsSituacao: TDataSource;
    cdsFornforn_status: TIntegerField;
    rgSituacao: TRadioGroup;
    cdsFornforn_codigo: TIntegerField;
    cdsImprimirforn_codigo: TIntegerField;
    chkSeparaProduto: TCheckBox;
    tsDocumentos: TTabSheet;
    lbl27: TLabel;
    edtDocumento: TEdit;
    edtCaminhoDoc: TEdit;
    sbArquivoDoc: TSpeedButton;
    sbVisualizarDoc: TSpeedButton;
    dbgDocumentos: TDBGrid;
    lbl12: TLabel;
    edtCodigoDoc: TEdit;
    edtRazaoDoc: TEdit;
    lbl15: TLabel;
    lbl31: TLabel;
    edtFantasiaDoc: TEdit;
    lbl26: TLabel;
    zqryDocs: TZQuery;
    dspDocs: TDataSetProvider;
    cdsDocs: TClientDataSet;
    dsDocs: TDataSource;
    cdsDocsfor_codigo: TIntegerField;
    cdsDocsdoc_codigo: TIntegerField;
    cdsDocsdoc_descricao: TWideMemoField;
    zqryTipoProdImp: TZQuery;
    dspTipoProdImp: TDataSetProvider;
    cdsTipoProdImp: TClientDataSet;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    dsTipoProdImp: TDataSource;
    cdsDocsdoc_caminho: TWideMemoField;
    tsAvaliacao: TTabSheet;
    dbgHistorico: TDBGrid;
    lbl28: TLabel;
    edt1: TCurrencyEdit;
    lbl29: TLabel;
    dt1: TDateEdit;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
//    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure BuscarNovoCodigo;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgFornKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFornCellClick(Column: TColumn);
    procedure dbgFornDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctFornChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure mmoAreaKeyPress(Sender: TObject; var Key: Char);
    procedure chkTodosClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure cdsDocsdoc_descricaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sbArquivoDocClick(Sender: TObject);
    function BuscarNovoCodigoDoc(): string;
    procedure dbgDocumentosCellClick(Column: TColumn);
    procedure sbVisualizarDocClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sTipoProd: string;
  public
    { Public declarations }
  end;

var
  FormCadFornecedores: TFormCadFornecedores;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadFornecedores.AtualizarDados;
begin
   with cdsTipoProd do begin
      Active:= False;
      Active:= True;
   end;

   with cdsTipoProdImp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsSituacao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 15' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsForn do begin
      Active:= False;
      CommandText:= ' SELECT forn_area, forn_avaliacao, forn_bairro, forn_cep, forn_cidade, forn_CNPJ, forn_codigo, forn_contato,' +
                    ' forn_endereco, forn_estado, forn_fantasia, forn_fone, forn_inscEst, forn_mail, forn_nome, forn_numero,' +
                    ' forn_obs, forn_validade, forn_certificado, forn_tipoProd, forn_status' +
                    ' FROM fornecedores' +
                    ' WHERE forn_codigo <> 999999' +
                    ' ORDER BY forn_nome';
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsForn.Locate('forn_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadFornecedores.AtualizarDadosAcessorios;
begin
   edtCodigoDoc.Text  := edtCodigo.Text;
   edtRazaoDoc.Text   := edtRazao.Text;
   edtFantasiaDoc.Text:= edtNomeFantasia.Text;

   if edtCodigo.Text <> '' then begin
      with cdsDocs do begin
         Active:= False;
         CommandText:= ' SELECT for_codigo, doc_codigo, doc_descricao, doc_caminho' +
                       ' FROM forn_documentos' +
                       ' WHERE for_codigo = ' + QuotedStr(edtCodigo.Text) +
                       ' ORDER BY doc_descricao';
         Active:= True;
      end;
   end;
end;

procedure TFormCadFornecedores.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   case pctForn.TabIndex of
      0: begin // Cadastro
         if cdsForn.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;
      1: begin // Documentos
         if cdsDocs.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;
   end;
end;

procedure TFormCadFornecedores.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 25, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      case pctForn.TabIndex of
         0: begin
            HabilitarCampos(True, False, Self, 1);
            TryFocus(edtRazao);
         end;
         1: begin
            HabilitarCampos(True, False, Self, -1);
            TryFocus(edtDocumento);
         end;
      end;
      Botoes(False);
   end;
end;

procedure TFormCadFornecedores.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
//   HabilitarCampos(False, False);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadFornecedores.btnExcluirClick(Sender: TObject);
var
   sCodForn: string;
   sNomeForn: string;
   sNomeDoc: string;
begin
   if pctForn.TabIndex = 0 then begin // Cadastro
      if (Acesso(cUsuario, 25, 'exclusao') = 1) then begin
         if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sCodForn := cdsFornforn_codigo.AsString;
            sNomeForn:= cdsFornforn_nome.AsString;

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM Fornecedores' +
                             ' WHERE forn_codigo = ' + QuotedStr(sCodForn);
               Execute;
            end;

            Auditoria('CADASTRO DE FORNECEDORES', sNomeForn, 'E', '');
            LimparCampos;
            AtualizarDados;
            PreencherCampos;
         end;
         Botoes(True);
      end;
   end;

   if pctForn.TabIndex = 1 then begin // Documentos
      if Application.MessageBox('Confirma a exclusão do documento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodForn:= cdsForn.FieldByName('forn_codigo').AsString;
         sNomeDoc:= cdsDocs.FieldByName('doc_descricao').AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM forn_documentos' +
                          ' WHERE for_codigo = ' + QuotedStr(sCodForn) +
                          ' AND doc_codigo = ' + cdsDocs.FieldByName('doc_codigo').AsString;
            Execute;
         end;

         Auditoria('CADASTRO DE FORNECEDORES - DOCUMENTOS', sNomeDoc, 'E', '');
         LimparCampos;
         AtualizarDadosAcessorios();
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadFornecedores.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         case pctForn.TabIndex of
            0: begin
               with cdsGravar do begin
                  Active:= False;
                  if cOperacao = 'I' then begin
                     CommandText:= ' INSERT INTO Fornecedores' +
                                   ' (forn_codigo, forn_nome, forn_endereco, forn_numero, forn_bairro, ' +
                                   ' forn_cidade, forn_estado, forn_cep, forn_avaliacao, forn_obs, forn_fantasia, ' +
                                   ' forn_fone, forn_CNPJ, forn_inscEst, forn_validade, forn_area, forn_contato, ' +
                                   ' forn_certificado, forn_mail, forn_tipoProd, forn_status)' +
                                   ' VALUES(' +
                                   QuotedStr(edtCodigo.Text) + ',' +
                                   QuotedStr(edtRazao.Text) + ',' +
                                   QuotedStr(edtEndereco.Text) + ',' +
                                   QuotedStr(edtNumero.Text) + ',' +
                                   QuotedStr(edtBairro.Text) + ',' +
                                   QuotedStr(edtCidade.Text) + ',' +
                                   QuotedStr(edtEstado.Text) + ',' +
                                   QuotedStr(medtCEP.Text) + ',' +
                                   VirgulaParaPonto(edtNota.Value,2) + ',' +
                                   QuotedStr(mmoObs.Text) + ',' +
                                   QuotedStr(edtNomeFantasia.Text) + ',' +
                                   QuotedStr(edtFone.Text) + ',' +
                                   QuotedStr(edtCNPJ.Text) + ',' +
                                   QuotedStr(edtInscEst.Text) + ',' +
                                   ArrumaDataSQL(dtValidade.Date) + ',' +
                                   QuotedStr(mmoArea.Text) + ',' +
                                   QuotedStr(edtContato.Text) + ',' +
                                   QuotedStr(edtCaminho.Text) + ',' +
                                   QuotedStr(edtEmail.Text) + ',' +
                                   sTipoProd + ',' +
                                   QuotedStr(dblSituacao.KeyValue) +
                                   ' )';
                     Execute;
                  end
                  else begin
                     CommandText:= ' UPDATE Fornecedores SET' +
                                   ' forn_nome = ' + QuotedStr(edtRazao.Text) + ',' +
                                   ' forn_endereco = ' + QuotedStr(edtEndereco.Text) + ',' +
                                   ' forn_numero = ' + QuotedStr(edtNumero.Text) + ',' +
                                   ' forn_bairro = ' + QuotedStr(edtBairro.Text) + ',' +
                                   ' forn_cidade = ' + QuotedStr(edtCidade.Text) + ',' +
                                   ' forn_estado = ' + QuotedStr(edtEstado.Text) + ',' +
                                   ' forn_cep = ' + QuotedStr(medtCEP.Text) + ',' +
                                   ' forn_avaliacao = ' + VirgulaParaPonto(edtNota.Value,2) + ',' +
                                   ' forn_obs = ' + QuotedStr(mmoObs.Text) + ',' +
                                   ' forn_fantasia = ' + QuotedStr(edtNomeFantasia.Text) + ',' +
                                   ' forn_fone = ' + QuotedStr(edtFone.Text) + ',' +
                                   ' forn_CNPJ = ' + QuotedStr(edtCNPJ.Text) + ',' +
                                   ' forn_inscEst = ' + QuotedStr(edtInscEst.Text) + ',' +
                                   ' forn_validade = ' + ArrumaDataSQL(dtValidade.Date) + ',' +
                                   ' forn_area = ' + QuotedStr(mmoArea.Text) + ',' +
                                   ' forn_contato = ' + QuotedStr(edtContato.Text) + ',' +
                                   ' forn_certificado = ' + QuotedStr(edtCaminho.Text) + ',' +
                                   ' forn_mail = ' + QuotedStr(edtEmail.Text) + ',' +
                                   ' forn_tipoProd = ' + sTipoProd + ',' +
                                   ' forn_status = ' + QuotedStr(dblSituacao.KeyValue) +
                                   ' WHERE forn_codigo = ' + QuotedStr(edtCodigo.Text);
                     Execute;
                  end;
               end;
            end;
            1: begin
               with cdsGravar do begin
                  Active:= False;
                  if cOperacao = 'I' then begin
                     CommandText:= ' INSERT INTO forn_documentos' +
                                   ' (for_codigo, doc_codigo, doc_descricao, doc_caminho)' +
                                   ' VALUES (' +
                                   edtCodigo.Text + ',' +
                                   BuscarNovoCodigoDoc() + ',' +
                                   QuotedStr(edtDocumento.Text) + ',' +
                                   QuotedStr(edtCaminhoDoc.Text) +
                                   ')';
                     Execute;
                  end
                  else begin
                     CommandText:= ' UPDATE forn_documentos SET' +
                                   ' doc_descricao = ' + QuotedStr(edtDocumento.Text) + ',' +
                                   ' doc_caminho = ' + QuotedStr(edtCaminhoDoc.Text) +
                                   ' WHERE for_codigo = ' + edtCodigo.Text +
                                   ' AND doc_codigo = ' + cdsDocs.FieldByName('doc_codigo').AsString;
                     Execute;
                  end;
               end;

               if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
                  sbVisualizarDoc.Enabled:= True;
               end
               else begin
                  sbVisualizarDoc.Enabled:= False;
               end;
            end;
         end;

         Auditoria('CADASTRO DE FORNECEDORES', edtCodigo.Text, cOperacao,'');
         AtualizarDados();
         AtualizarDadosAcessorios();

//         HabilitarCampos(False, False);
         HabilitarCampos(False, False, Self, 1);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadFornecedores.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadFornecedores.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadFornecedores.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 25, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos();
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
   end;

   case pctForn.TabIndex of
      0: begin // Cadastro
         BuscarNovoCodigo();
         HabilitarCampos(True, False, Self, 1);
         edtCodigo.Text:= sNovoCodigo;
         dblSituacao.KeyValue:= 1;
         TryFocus(edtRazao);
      end;
      1: begin // Documentos
         HabilitarCampos(True, False, Self, -1);
         TryFocus(edtDocumento);
      end;
   end;
end;

procedure TFormCadFornecedores.btnPrimeiroClick(Sender: TObject);
begin
   cdsForn.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadFornecedores.btnAnteriorClick(Sender: TObject);
begin
   cdsForn.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadFornecedores.btnProximoClick(Sender: TObject);
begin
   cdsForn.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadFornecedores.btnUltimoClick(Sender: TObject);
begin
   cdsForn.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadFornecedores.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadFornecedores.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadFornecedores.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadFornecedores.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(forn_codigo) AS NovoCodigo FROM fornecedores' +
                    ' WHERE forn_codigo < 999999';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(StrToInt(FieldByName('NovoCodigo').AsString) + 1);
//         sNovoCodigo:= ZerosEsquerda(IntToStr(StrToInt(sNovoCodigo) + 1),8);
      end;
   end;
end;

function TFormCadFornecedores.BuscarNovoCodigoDoc: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(doc_codigo) AS NovoCodigo FROM forn_documentos';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= '1';
      end
      else begin
         Result:= IntToStr(StrToInt(FieldByName('NovoCodigo').AsString) + 1);
      end;
   end;
end;

procedure TFormCadFornecedores.cdsDocsdoc_descricaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsDocs.FieldByName('doc_descricao').AsString,1,300);
end;

procedure TFormCadFornecedores.chkTodosClick(Sender: TObject);
begin
   dblTipoProdImp.Enabled:= not chkTodos.Checked;
end;

procedure TFormCadFornecedores.ControlarAbas;
begin
   if pctForn.TabIndex <= 1 then begin  // Cadastro
      if edtCodigo.Text <> '' then begin
         AtualizarDadosAcessorios();
         Botoes(True);
         PreencherCampos();
      end;
      if pctForn.TabIndex = 1 then begin
         btnImprimir.Enabled:= False;
      end;
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;

      if pctForn.TabIndex = 2 then begin
         edtValor.Clear;
         edtValor.Enabled:= True;
         TryFocus(edtValor);
      end;

      AtualizarDadosAcessorios();
   end;
end;

procedure TFormCadFornecedores.dbgDocumentosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadFornecedores.dbgFornCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadFornecedores.dbgFornDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctForn.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadFornecedores.dbgFornKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadFornecedores.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsForn.Locate('forn_codigo', edtValor.Text, [loPartialKey]);
      1: cdsForn.Locate('forn_nome', edtValor.Text, [loPartialKey]);
      2: cdsForn.Locate('forn_fantasia', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadFornecedores.FormShow(Sender: TObject);
begin
   pctForn.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
//   HabilitarCampos(False, False);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;

   rgSituacao.ItemIndex:= 0;
   rgOrdemImpressao.ItemIndex:= 1;
   chkTodos.Checked:= True;
   chkTodos.Enabled:= True;
   chkSeparaProduto.Checked:= False;
   chkSeparaProduto.Enabled:= True;
   dblTipoProdImp.Enabled:= False;

   pctForn.Pages[3].TabVisible:= False;
end;

//procedure TFormCadFornecedores.HabilitarCampos(Flag, Codigo: Boolean);
//begin
//   edtCodigo.Enabled      := Flag;
//   edtRazao.Enabled       := Flag;
//   edtNomeFantasia.Enabled:= Flag;
//   edtEndereco.Enabled    := Flag;
//   edtNumero.Enabled      := Flag;
//   edtBairro.Enabled      := Flag;
//   edtCidade.Enabled      := Flag;
//   edtEstado.Enabled      := Flag;
//   medtCEP.Enabled        := Flag;
//   edtFone.Enabled        := Flag;
//   edtCNPJ.Enabled        := Flag;
//   edtInscEst.Enabled     := Flag;
//   edtContato.Enabled     := Flag;
//   edtEmail.Enabled       := Flag;
//   edtNota.Enabled        := Flag;
//   dtValidade.Enabled     := Flag;
//   edtCaminho.Enabled     := False;
//   mmoArea.Enabled        := Flag;
//   mmoObs.Enabled         := Flag;
//   dblTipoProd.Enabled    := Flag;
//
//   sbArquivo.Enabled   := Flag;
//
//   if AllTrim(edtCaminho.Text) <> EmptyStr then begin
//      sbVisualizar.Enabled:= True;
//   end
//   else begin
//      sbVisualizar.Enabled:= False;
//   end;
//
//   pctForn.Pages[1].TabVisible:= not Flag;
//end;

procedure TFormCadFornecedores.LimparCampos;
begin
   case pctForn.TabIndex of
      0: begin // Cadastro
         edtCodigo.Clear;
         edtRazao.Clear;
         edtNomeFantasia.Clear;
         edtEndereco.Clear;
         edtNumero.Clear;
         edtBairro.Clear;
         edtCidade.Clear;
         edtEstado.Clear;
         medtCEP.Clear;
         edtFone.Clear;
         edtCNPJ.Clear;
         edtInscEst.Clear;
         edtContato.Clear;
         edtEmail.Clear;
         edtNota.Clear;
         dtValidade.Clear;
         edtCaminho.Clear;
         mmoArea.Clear;
         mmoObs.Clear;
         dblTipoProd.KeyValue:= -1;
      end;
      1: begin // Documentos
         edtDocumento.Clear;
         edtCaminhoDoc.Clear
      end;
   end;
end;

procedure TFormCadFornecedores.mmoAreaKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadFornecedores.pctFornChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadFornecedores.PreencherCampos;
begin
//   case pctForn.TabIndex of
//      0: begin
         with cdsForn do begin
            edtCodigo.Text      := FieldByName('forn_codigo').AsString;
            edtRazao.Text       := FieldByName('forn_nome').AsString;
            edtNomeFantasia.Text:= FieldByName('forn_fantasia').AsString;
            edtEndereco.Text    := FieldByName('forn_endereco').AsString;
            edtNumero.Text      := FieldByName('forn_numero').AsString;
            edtBairro.Text      := FieldByName('forn_bairro').AsString;
            edtCidade.Text      := FieldByName('forn_cidade').AsString;
            edtEstado.Text      := FieldByName('forn_estado').AsString;
            medtCEP.Text        := FieldByName('forn_cep').AsString;
            edtFone.Text        := FieldByName('forn_fone').AsString;
            edtCNPJ.Text        := FieldByName('forn_CNPJ').AsString;
            edtInscEst.Text     := FieldByName('forn_inscEst').AsString;
            edtContato.Text     := FieldByName('forn_contato').AsString;
            edtEmail.Text       := FieldByName('forn_mail').AsString;
            edtNota.Text        := FieldByName('forn_avaliacao').AsString;
            dtValidade.Date     := FieldByName('forn_validade').AsDateTime;
            edtCaminho.Text     := FieldByName('forn_certificado').AsString;
            mmoArea.Text        := FieldByName('forn_area').AsString;
            mmoObs.Text         := FieldByName('forn_obs').AsString;
            if FieldByName('forn_tipoProd').AsString <> EmptyStr then begin
               dblTipoProd.KeyValue:= FieldByName('forn_tipoProd').AsString;
            end
            else begin
               dblTipoProd.KeyValue:= -1;
            end;

            if FieldByName('forn_status').AsString <> EmptyStr then begin
               dblSituacao.KeyValue:= FieldByName('forn_status').AsString;
            end;
         end;
//      end;
//      1: begin
         edtDocumento.Text := cdsDocs.FieldByName('doc_descricao').AsString;
         edtCaminhoDoc.Text:= cdsDocs.FieldByName('doc_caminho').AsString;
//      end;
//   end;

      if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
         sbVisualizarDoc.Enabled:= True;
      end
      else begin
         sbVisualizarDoc.Enabled:= False;
      end;
end;

procedure TFormCadFornecedores.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadFornecedores.sbArquivoDocClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminhoDoc.Text:= OPD1.FileName;
end;

procedure TFormCadFornecedores.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

procedure TFormCadFornecedores.sbVisualizarDocClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminhoDoc.Text, Self.Name);
end;

function TFormCadFornecedores.ValidarDados(): Boolean;
begin
   case pctForn.TabIndex of
      0: begin
         if AllTrim(edtCodigo.Text) = EmptyStr then begin
            Application.MessageBox('Campo Código é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtNumero);
            Result:= False;
            Exit;
         end;

         if AllTrim(edtRazao.Text) = EmptyStr then begin
            Application.MessageBox('Campo Razão Social é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtRazao);
            Result:= False;
            Exit;
         end;

         if AllTrim(edtNota.Text) = EmptyStr then begin
            Application.MessageBox('Campo Nota é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtNota);
            Result:= False;
            Exit;
         end;

         if dtValidade.Text = '  /  /    ' then begin
            Application.MessageBox('Campo Data de Validade é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dtValidade);
            Result:= False;
            Exit;
         end;

         if dblTipoProd.KeyValue <= 0 then begin
            sTipoProd:= '0';
         end
         else begin
            sTipoProd:= dblTipoProd.KeyValue;
         end;
      end;
      1: begin
         if AllTrim(edtDocumento.Text) = EmptyStr then begin
            Application.MessageBox('Campo Descrição do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtDocumento);
            Result:= False;
            Exit;
         end;

         if AllTrim(edtCaminhoDoc.Text) = EmptyStr then begin
            Application.MessageBox('Campo Caminho do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtCaminhoDoc);
            Result:= False;
            Exit;
         end;
      end;
   end;

   Result:= True;
end;

procedure TFormCadFornecedores.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sStatus, sFiltro: string;
begin
   if ((dblTipoProdImp.KeyValue = -1) or (dblTipoProdImp.KeyValue = Null)) and (chkTodos.Checked = False) then begin
      Application.MessageBox('Selecione um Tipo de Produto ou marque TODOS !', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTipoProdImp);
      Exit;
   end;

   case rgSituacao.ItemIndex of
      0: begin
         sStatus:= ' AND forn_status = 1';
         sFiltro:= 'FORNECEDORES ATIVOS ';
      end;
      1: begin
         sStatus:= ' AND forn_status = 2';
         sFiltro:= 'FORNECEDORES INATIVOS ';
      end;
      2: begin
         sStatus:= ' ';
         sFiltro:= 'TODOS OS FORNECEDORES';
      end;
   end;

   if chkTodos.Checked = False then begin
      sFiltro:= sFiltro + ' - TIPO DE PRODUTO: ' + dblTipoProdImp.Text;
   end;


   case rgOrdemImpressao.ItemIndex of
      0: begin
         if chkSeparaProduto.Checked = True then begin
            sCampoOrdem:= 'forn_tipoProd, forn_codigo';
         end
         else begin
            sCampoOrdem:= 'forn_codigo';
         end;
      end;
      1: begin
         if chkSeparaProduto.Checked = True then begin
            sCampoOrdem:= 'forn_tipoProd, forn_nome';
         end
         else begin
            sCampoOrdem:= 'forn_nome';
         end;
      end;
      2: begin
         if chkSeparaProduto.Checked = True then begin
            sCampoOrdem:= 'forn_tipoProd, forn_validade';
         end
         else begin
            sCampoOrdem:= 'forn_validade';
         end;
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT forn_codigo, forn_nome, forn_avaliacao, forn_validade, forn_tipoProd' +
                    ' FROM fornecedores' +
                    ' WHERE 1 = 1';
      if chkTodos.Checked = False then begin
         CommandText:= CommandText + ' AND forn_tipoProd = ' + IntToStr(dblTipoProdImp.KeyValue);
      end;
      CommandText:= CommandText + sStatus;
      CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      if chkSeparaProduto.Checked = True then begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Fornecedores_Separa.fr3');
      end
      else begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Fornecedores.fr3');
      end;

      Variables['Filtro']:= QuotedStr(sFiltro);
      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
//            PrintOptions.Printer:= 'CutePDF Writer';
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

end.
