unit frm_CadIQF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadIQF = class(TForm)
    pctIQF: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgIQF: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    pnl1: TPanel;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryIQF: TZQuery;
    dspIQF: TDataSetProvider;
    cdsIQF: TClientDataSet;
    dsIQF: TDataSource;
    frxReport1: TfrxReport;
    frxDBIQF: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    dblPontual: TDBLookupComboBox;
    lbl1: TLabel;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    dspForn: TDataSetProvider;
    zqryForn: TZQuery;
    opd1: TOpenDialog;
    dblResponsavel: TDBLookupComboBox;
    lbl3: TLabel;
    zqryPontual: TZQuery;
    dspPontual: TDataSetProvider;
    cdsPontual: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsPontual: TDataSource;
    dtData: TDateEdit;
    dblFornecedor: TDBLookupComboBox;
    lbl7: TLabel;
    edtLote: TEdit;
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsResponsavel: TDataSource;
    edtAvaliacao: TCurrencyEdit;
    lbl250: TLabel;
    dblConforme: TDBLookupComboBox;
    lbl5: TLabel;
    lbl4: TLabel;
    mmoObs: TMemo;
    cdsImprimirforn_nome: TWideStringField;
    cdsImprimirforn_avaliacao: TFloatField;
    cdsImprimirforn_validade: TDateTimeField;
    cdsImprimirforn_area: TMemoField;
    cdsImprimirQtd: TLargeintField;
    cdsImprimirIQF: TFloatField;
    zqryConforme: TZQuery;
    dspConforme: TDataSetProvider;
    cdsConforme: TClientDataSet;
    LargeintField3: TLargeintField;
    WideStringField3: TWideStringField;
    dsConforme: TDataSource;
    cdsFornforn_nome: TWideStringField;
    cdsFornforn_avaliacao: TFloatField;
    zqryFornImp: TZQuery;
    dspFornImp: TDataSetProvider;
    cdsFornImp: TClientDataSet;
    WideStringField5: TWideStringField;
    FloatField1: TFloatField;
    dsFornImp: TDataSource;
    zqryImpRelacao: TZQuery;
    dspImpRelacao: TDataSetProvider;
    cdsImpRelacao: TClientDataSet;
    frxDBImpRelacao: TfrxDBDataset;
    cdsImpRelacaoforn_nome: TWideStringField;
    cdsImpRelacaoiqf_data: TDateTimeField;
    cdsImpRelacaoiqf_pontual: TLargeintField;
    cdsImpRelacaoiqf_conforme: TLargeintField;
    cdsImpRelacaoiqf_responsavel: TLargeintField;
    cdsImpRelacaoPontual: TWideStringField;
    cdsImpRelacaoConforme: TWideStringField;
    cdsImpRelacaoResponsavel: TWideStringField;
    cdsImpRelacaoforn_avaliacao: TFloatField;
    cdsImpRelacaoIQF: TFloatField;
    cdsImprimirforn_tipoProd: TIntegerField;
    cdsImprimirtipo_nomeTipo: TWideStringField;
    cdsImpRelacaotipo_nomeTipo: TWideStringField;
    zqryFiltroForn: TZQuery;
    dspFiltroForn: TDataSetProvider;
    cdsFiltroForn: TClientDataSet;
    WideStringField7: TWideStringField;
    FloatField2: TFloatField;
    dsFiltroForn: TDataSource;
    cdsFornforn_codigo: TIntegerField;
    cdsFornImpforn_codigo: TIntegerField;
    cdsFiltroFornforn_codigo: TIntegerField;
    cdsImprimiriqf_codfornecedor: TIntegerField;
    cdsImpRelacaoiqf_codfornecedor: TIntegerField;
    cdsImpRelacaoiqf_nf: TWideStringField;
    cdsImpRelacaoforn_tipoprod: TIntegerField;
    lbl14: TLabel;
    edtCodigo: TEdit;
    cdsImpRelacaoiqf_obs: TWideMemoField;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    rgTipoRel: TRadioGroup;
    pnl4: TPanel;
    lbl11: TLabel;
    lbl8: TLabel;
    dtDataFinal: TDateEdit;
    dtDataInicial: TDateEdit;
    pnl5: TPanel;
    chkTipoProd: TCheckBox;
    pnl6: TPanel;
    chkObs: TCheckBox;
    cdsFiltroFornforn_fantasia: TWideStringField;
    cdsFornforn_fantasia: TWideStringField;
    pnlFiltroForn: TPanel;
    lbl15: TLabel;
    lbl13: TLabel;
    chkFiltroForn: TCheckBox;
    dblFiltroFantasia: TDBLookupComboBox;
    dblFiltroForn: TDBLookupComboBox;
    rbRazao: TRadioButton;
    rbFantasia: TRadioButton;
    dblFantasia: TDBLookupComboBox;
    lbl16: TLabel;
    zqryFantasia: TZQuery;
    dspFantasia: TDataSetProvider;
    cdsFantasia: TClientDataSet;
    WideStringField4: TWideStringField;
    FloatField3: TFloatField;
    IntegerField1: TIntegerField;
    WideStringField6: TWideStringField;
    dsFantasia: TDataSource;
    zqryFiltroFantasia: TZQuery;
    dspFiltroFantasia: TDataSetProvider;
    cdsFiltroFantasia: TClientDataSet;
    WideStringField8: TWideStringField;
    FloatField4: TFloatField;
    IntegerField2: TIntegerField;
    WideStringField9: TWideStringField;
    dsFiltroFantasia: TDataSource;
    pnl7: TPanel;
    chkTodosForn: TCheckBox;
    dblFornImp: TDBLookupComboBox;
    lbl12: TLabel;
    lbl17: TLabel;
    dblFantasiaImp: TDBLookupComboBox;
    zqryFantasiaImp: TZQuery;
    dspFantasiaImp: TDataSetProvider;
    cdsFantasiaImp: TClientDataSet;
    WideStringField10: TWideStringField;
    FloatField5: TFloatField;
    IntegerField3: TIntegerField;
    WideStringField11: TWideStringField;
    dsFantasiaImp: TDataSource;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    rgOrdem: TRadioGroup;
    tsDocs: TTabSheet;
    lbl40: TLabel;
    sbAbrirDoc: TSpeedButton;
    sbVisualizarDoc: TSpeedButton;
    lbl41: TLabel;
    dbgDoc: TDBGrid;
    edtDescricaoDoc: TEdit;
    edtCaminhoDoc: TEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    dtDataDoc: TDateEdit;
    dblRazaoDoc: TDBLookupComboBox;
    edtCodigoDoc: TEdit;
    dblFantasiaDoc: TDBLookupComboBox;
    zqryDoc: TZQuery;
    dspDoc: TDataSetProvider;
    cdsDoc: TClientDataSet;
    dsDoc: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados(CodFornecedor: string = '');
    procedure AtualizarDadosAcessorios();
    procedure PreencherCampos;
    procedure Botoes(Flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgIQFKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgIQFCellClick(Column: TColumn);
    procedure dbgIQFDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctIQFChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure dblFornecedorCloseUp(Sender: TObject);
    procedure chkTodosFornClick(Sender: TObject);
    procedure chkFiltroFornClick(Sender: TObject);
    procedure dblFiltroFornCloseUp(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
    procedure rbRazaoClick(Sender: TObject);
    procedure rbFantasiaClick(Sender: TObject);
    procedure dblFantasiaCloseUp(Sender: TObject);
    procedure dblFornImpCloseUp(Sender: TObject);
    procedure dblFantasiaImpCloseUp(Sender: TObject);
    procedure rgOrdemClick(Sender: TObject);
    procedure sbAbrirDocClick(Sender: TObject);
    procedure sbVisualizarDocClick(Sender: TObject);
    procedure dbgDocCellClick(Column: TColumn);
  private
    { Private declarations }
    cOperacao: Char;
    sCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadIQF: TFormCadIQF;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_Laaia;

{$R *.dfm}

procedure TFormCadIQF.AtualizarDados(CodFornecedor: string = '');
var
   sOrdem: string;
begin
   with cdsForn do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFantasia do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFornImp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFantasiaImp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFiltroForn do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFiltroFantasia do begin
      Active:= False;
      Active:= True;
   end;

   with cdsResponsavel do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsPontual do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 20' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsConforme do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 20' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   case rgOrdem.ItemIndex of
      0: begin
         sOrdem:= 'iqf_data desc';
      end;
      1: begin
         sOrdem:= 'F.forn_nome, iqf_data desc';
      end;
      2: begin
         sOrdem:= 'F.forn_fantasia, iqf_data desc';
      end;
   end;

   with cdsIQF do begin
      Active:= False;
      if CodFornecedor <> '' then begin
         CommandText:= ' SELECT iqf_CodFornecedor, iqf_codigo, iqf_conforme, ' +
                       ' iqf_data, iqf_NF, iqf_pontual, iqf_responsavel, iqf_obs,' +
                       ' C.nome_col as Responsavel, F.forn_nome as Razao, F.forn_fantasia as Fantasia' +
                       ' FROM iqf_remessa' +
                       ' INNER JOIN colaboradores C ON C.codi_col = iqf_responsavel' +
                       ' INNER JOIN fornecedores F ON F.forn_codigo = iqf_CodFornecedor' +
                       ' WHERE iqf_CodFornecedor = ' + QuotedStr(CodFornecedor) +
                       ' ORDER BY ' + sOrdem;
      end
      else begin
         CommandText:= ' SELECT iqf_CodFornecedor, iqf_codigo, iqf_conforme, ' +
                       ' iqf_data, iqf_NF, iqf_pontual, iqf_responsavel, iqf_obs,' +
                       ' C.nome_col as Responsavel, F.forn_nome as Razao, F.forn_fantasia as Fantasia' +
                       ' FROM iqf_remessa' +
                       ' INNER JOIN colaboradores C ON C.codi_col = iqf_responsavel' +
                       ' INNER JOIN fornecedores F ON F.forn_codigo = iqf_CodFornecedor' +
                       ' ORDER BY ' + sOrdem;
      end;
      Active:= True;
   end;

//   sCodigo:= cdsIQF.FieldByName('iqf_codigo').AsString;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsIQF.Locate('iqf_codigo', edtCodigo.Text,[])
   end;

   // Atualiza o grid
   AtualizarGrid(dbgIQF);
end;

procedure TFormCadIQF.AtualizarDadosAcessorios;
begin
   edtCodigoDoc.Text      := edtCodigo.Text;
   dtDataDoc.Text         := dtData.Text;
   dblRazaoDoc.KeyValue   := dblFornecedor.KeyValue;
   dblFantasiaDoc.KeyValue:= dblFantasia.KeyValue;

   if edtCodigo.Text <> '' then begin
      with cdsDoc do begin
         Active:= False;
         CommandText:= ' SELECT doc_codigo, doc_cod_iqf, doc_descricao, doc_caminho' +
                       ' FROM iqf_doc' +
                       ' WHERE doc_cod_iqf = ' + AllTrim(edtCodigo.Text) +
                       ' ORDER BY doc_descricao';
         Active:= True;
      end;
   end;

   if cdsDoc.RecordCount = 0 then begin
      sbVisualizarDoc.Enabled:= False;
   end
   else begin
      sbVisualizarDoc.Enabled:= True;
   end;
end;

procedure TFormCadIQF.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsIQF.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadIQF.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 22, 'alteracao') = 1) then begin
      cOperacao:= 'A';

      if pctIQF.TabIndex = 0 then begin // Cadastro
         HabilitarCampos(True, False, Self, 1, 2);
         TryFocus(dtData);
      end;

      if pctIQF.TabIndex = 1 then begin // Documentos
         HabilitarCampos(True, False, Self, -1);
         TryFocus(edtDescricaoDoc);
      end;

      Botoes(False);
   end;
end;

procedure TFormCadIQF.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;

procedure TFormCadIQF.btnExcluirClick(Sender: TObject);
var
   sCodIQF: string;
   sData  : string;
   sForn  : string;
   sDoc   : string;
begin
   if (Acesso(cUsuario, 22, 'exclusao') = 1) then begin
      if pctIQF.TabIndex = 0 then begin // Cadastro
         if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sCodIQF:= cdsIQF.FieldByName('iqf_codigo').AsString;
            sData  := dtData.Text;
            sForn  := dblFornecedor.Text;

            // Apaga documentos do registro de IQF
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM iqf_doc' +
                             ' WHERE iqf_codigo = ' + sCodIQF;
               Execute;
            end;

            // Apaga IQF
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM iqf_remessa' +
                             ' WHERE iqf_codigo = ' + sCodIQF;
               Execute;
            end;

            Auditoria('IQF', sData + '-' + sForn, 'E', '');
            LimparCampos();
            AtualizarDados();
            PreencherCampos();
         end;
      end;
      if pctIQF.TabIndex = 1 then begin // Documentos
         if Application.MessageBox('Confirma a exclusão do documento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sDoc:= 'Cod. IQF: ' + cdsIQF.FieldByName('iqf_codigo').AsString + '-' + cdsDoc.FieldByName('doc_descricao').AsString;

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM iqf_doc' +
                             ' WHERE doc_codigo = ' + cdsDoc.FieldByName('doc_codigo').AsString;
               Execute;
            end;

            Auditoria('IQF - DOCUMENTOS', sDoc, 'E', '');
            LimparCampos();
            AtualizarDadosAcessorios();
            PreencherCampos();

         end;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadIQF.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         if pctIQF.TabIndex = 0 then begin // Cadastro
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO iqf_remessa (' +
                                ' iqf_codigo, iqf_data, iqf_CodFornecedor, iqf_pontual, iqf_conforme, ' +
                                ' iqf_NF, iqf_responsavel, iqf_obs)' +
                                ' VALUES(' +
                                BuscarNovoCodigo('iqf_remessa', 'iqf_codigo') + ',' +
                                ArrumaDataSQL(dtData.Date) + ',' +
                                QuotedStr(dblFornecedor.KeyValue) + ',' +
                                IntToStr(dblPontual.KeyValue) + ',' +
                                IntToStr(dblConforme.KeyValue) + ',' +
                                QuotedStr(edtLote.Text) + ',' +
                                IntToStr(dblResponsavel.KeyValue) + ',' +
                                QuotedStr(mmoObs.Text) +
                                   ')';
                  Execute;
               end
               else begin
                  CommandText:= ' UPDATE iqf_remessa SET' +
                                ' iqf_data = ' + ArrumaDataSQL(dtData.Date) + ',' +
                                ' iqf_CodFornecedor = ' + QuotedStr(dblFornecedor.KeyValue) + ',' +
                                ' iqf_pontual = ' + IntToStr(dblPontual.KeyValue) + ',' +
                                ' iqf_conforme = ' + IntToStr(dblConforme.KeyValue) + ',' +
                                ' iqf_NF = ' + QuotedStr(edtLote.Text) + ',' +
                                ' iqf_responsavel = ' + IntToStr(dblResponsavel.KeyValue) + ',' +
                                ' iqf_obs = ' + QuotedStr(mmoObs.Text) +
                                ' WHERE iqf_codigo = ' + edtCodigo.Text;
                  Execute;
               end;
            end;

            Auditoria('IQF', dtData.Text + '-' + dblFornecedor.Text, cOperacao,'');
            AtualizarDados();

            HabilitarCampos(False, False, Self, 1, 2);
            Botoes(True);
            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;

         if pctIQF.TabIndex = 1 then begin // Documentos
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO iqf_doc(' +
                                ' doc_codigo, doc_cod_iqf, doc_descricao, doc_caminho)' +
                                ' VALUES(' +
                                BuscarNovoCodigo('iqf_doc', 'doc_codigo') + ',' +
                                QuotedStr(edtCodigo.Text) + ',' +
                                QuotedStr(edtDescricaoDoc.Text) + ',' +
                                QuotedStr(edtCaminhoDoc.Text) +
                                ')';
                  Execute;
               end
               else begin
                  CommandText:= ' UPDATE iqf_doc SET' +
                                ' doc_descricao = ' + QuotedStr(edtDescricaoDoc.Text) + ',' +
                                ' doc_caminho = ' + QuotedStr(edtCaminhoDoc.Text) +
                                ' WHERE doc_codigo = ' + cdsDoc.FieldByName('doc_codigo').AsString;
                  Execute;
               end;
            end;

            Auditoria('IQF - DOCUMENTOS', 'Cod. IQF: ' + edtCodigo.Text + edtDescricaoDoc.Text + '-' + edtCaminhoDoc.Text, cOperacao,'');
            AtualizarDadosAcessorios();

            HabilitarCampos(False, False, Self, -1);
            Botoes(True);
            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadIQF.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadIQF.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 40;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
   dtDataInicial.Date  := Date();
   dtDataFinal.Date    := Date();
   dblFornImp.Enabled  := False;
   chkTodosForn.Checked:= True;
   rgTipoRel.ItemIndex := 1;
   chkObs.Enabled      := False;
end;

procedure TFormCadIQF.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos();

   case pctIQF.TabIndex of
      0: begin // Cadastro
         if (Acesso(cUsuario, 22, 'cadastro') = 1) then begin

            HabilitarCampos(True, True, Self, 1, 2);

            edtCodigo.Text:= BuscarNovoCodigo('iqf_remessa', 'iqf_codigo');
            dtData.Date:= Date();
            TryFocus(dtData);
         end;
      end;
      1: begin // Documentos
         HabilitarCampos(True, False, Self, -1);
         TryFocus(edtDescricaoDoc);
      end;
   end;

   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
end;

procedure TFormCadIQF.btnPrimeiroClick(Sender: TObject);
begin
   cdsIQF.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIQF.btnAnteriorClick(Sender: TObject);
begin
   cdsIQF.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIQF.btnProximoClick(Sender: TObject);
begin
   cdsIQF.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIQF.btnUltimoClick(Sender: TObject);
begin
   cdsIQF.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIQF.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadIQF.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadIQF.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadIQF.chkFiltroFornClick(Sender: TObject);
begin
   rbRazao.Enabled          := not chkFiltroForn.Checked;
   rbFantasia.Enabled       := not chkFiltroForn.Checked;

   if chkFiltroForn.Checked then begin
      dblFiltroForn.Enabled    := False;
      dblFiltroFantasia.Enabled:= False;
   end;

   if chkFiltroForn.Checked = True then begin
      AtualizarDados();
   end
   else begin
      if rbRazao.Checked then begin
         dblFiltroForn.Enabled:= True;
         if (dblFiltroForn.KeyValue <> Null) AND (dblFiltroForn.KeyValue <> -1) then begin
            AtualizarDados(dblFiltroForn.KeyValue);
         end
         else begin
            AtualizarDados();
         end;
      end
      else begin
         dblFiltroFantasia.Enabled:= True;
         if (dblFiltroFantasia.KeyValue <> Null) AND (dblFiltroFantasia.KeyValue <> -1) then begin
            AtualizarDados(dblFiltroFantasia.KeyValue);
         end
         else begin
            AtualizarDados();
         end;
      end;
   end;
end;

procedure TFormCadIQF.chkTodosFornClick(Sender: TObject);
begin
   dblFornImp.Enabled    := not chkTodosForn.Checked;
   dblFantasiaImp.Enabled:= not chkTodosForn.Checked;
end;

procedure TFormCadIQF.ControlarAbas;
begin
   if pctIQF.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      cdsIQF.Filtered:= False;
      AjustaBarraGrid(dbgIQF);
      AtualizarDados();
      PreencherCampos();
      if sCodigo <> EmptyStr then begin
         cdsIQF.Locate('iqf_codigo', sCodigo, []);
      end;
   end;

   if pctIQF.TabIndex = 1 then begin // Documentos
      if edtCodigo.Text <> '' then begin
         AtualizarDadosAcessorios();
         PreencherCampos();
         if cdsDoc.RecordCount <= 0 then begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
         end;
      end;
   end;

   if pctIQF.TabIndex = 2 then begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;

      edtValor.Enabled:= True;
      edtValor.Clear;
      chkFiltroForn.Checked    := True;
      dblFiltroForn.Enabled    := False;
      dblFiltroFantasia.Enabled:= False;
      rbRazao.Enabled          := False;
      rbFantasia.Enabled       := False;
      rbFantasia.Checked       := True;
      TryFocus(edtValor);
   end;
end;

procedure TFormCadIQF.dbgDocCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadIQF.dbgIQFCellClick(Column: TColumn);
begin
   PreencherCampos();
   sCodigo:= cdsIQF.FieldByName('iqf_codigo').AsString;
end;

procedure TFormCadIQF.dbgIQFDblClick(Sender: TObject);
begin
   PreencherCampos();
   sCodigo:= cdsIQF.FieldByName('iqf_codigo').AsString;
   pctIQF.TabIndex:= 0;
   ControlarAbas();
end;

procedure TFormCadIQF.dbgIQFKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadIQF.dblFiltroFornCloseUp(Sender: TObject);
begin
   if rbRazao.Checked then begin
      if (dblFiltroForn.KeyValue <> Null) AND (dblFiltroForn.KeyValue <> -1) then begin
         AtualizarDados(dblFiltroForn.KeyValue);
      end
      else begin
         AtualizarDados();
      end;
   end
   else begin
      if (dblFiltroFantasia.KeyValue <> Null) AND (dblFiltroFantasia.KeyValue <> -1) then begin
         AtualizarDados(dblFiltroFantasia.KeyValue);
      end
      else begin
         AtualizarDados();
      end;
   end;
end;

procedure TFormCadIQF.dblFantasiaCloseUp(Sender: TObject);
begin
   dblFornecedor.KeyValue:= dblFantasia.KeyValue;
   edtAvaliacao.Value    := cdsForn.FieldByName('forn_avaliacao').AsFloat;
end;

procedure TFormCadIQF.dblFornecedorCloseUp(Sender: TObject);
begin
   dblFantasia.KeyValue:= dblFornecedor.KeyValue;
   edtAvaliacao.Value  := cdsForn.FieldByName('forn_avaliacao').AsFloat;
end;

procedure TFormCadIQF.dblFornImpCloseUp(Sender: TObject);
begin
   dblFantasiaImp.KeyValue:= dblFornImp.KeyValue;
end;

procedure TFormCadIQF.dblFantasiaImpCloseUp(Sender: TObject);
begin
   dblFornImp.KeyValue:= dblFantasiaImp.KeyValue;
end;

procedure TFormCadIQF.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsIQF.Filter:= 'iqf_NF LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   cdsIQF.Filtered:= True;
end;

procedure TFormCadIQF.FormShow(Sender: TObject);
begin
   pctIQF.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
   pnlImprimir.Visible:= False;
end;

procedure TFormCadIQF.LimparCampos;
begin
   if pctIQF.TabIndex = 0 then begin
      dtData.Clear;
      dblFornecedor.KeyValue:= -1;
      dblFantasia.KeyValue:= -1;
      dblPontual.KeyValue:= -1;
      dblConforme.KeyValue:= -1;
      edtLote.Clear;
      dblResponsavel.KeyValue:= -1;
      mmoObs.Clear;
   end;

   if pctIQF.TabIndex = 1 then begin
      edtDescricaoDoc.Clear;
      edtCaminhoDoc.Clear;
   end;
end;

procedure TFormCadIQF.mmoObsKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadIQF.pctIQFChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadIQF.PreencherCampos;
begin
   with cdsIQF do begin
      edtCodigo.Text:= FieldByName('iqf_codigo').AsString;
      dtData.Date   := FieldByName('iqf_data').AsDateTime;
      edtLote.Text  := FieldByName('iqf_NF').AsString;
      mmoObs.Text   := FieldByName('iqf_obs').AsString;

      if FieldByName('iqf_CodFornecedor').AsString <> EmptyStr then begin
         dblFornecedor.KeyValue:= FieldByName('iqf_CodFornecedor').AsString;
         dblFantasia.KeyValue  := dblFornecedor.KeyValue;
         dblFornecedorCloseUp(Self);
      end;

      if FieldByName('iqf_pontual').AsString <> EmptyStr then begin
         dblPontual.KeyValue:= FieldByName('iqf_pontual').AsString;
      end;

      if FieldByName('iqf_conforme').AsString <> EmptyStr then begin
         dblConforme.KeyValue:= FieldByName('iqf_conforme').AsString;
      end;

      if FieldByName('iqf_responsavel').AsString <> EmptyStr then begin
         dblResponsavel.KeyValue:= FieldByName('iqf_responsavel').AsString;
      end;
   end;

   if pctIQF.TabIndex = 1 then begin // Documentos
      with cdsDoc do begin
         edtDescricaoDoc.Text:= FieldByName('doc_descricao').AsString;
         edtCaminhoDoc.Text  := FieldByName('doc_caminho').AsString;
      end;
   end;
end;

procedure TFormCadIQF.rbFantasiaClick(Sender: TObject);
begin
   if not chkFiltroForn.Checked then begin
      dblFiltroForn.Enabled    := not rbFantasia.Checked;
      dblFiltroFantasia.Enabled:= rbFantasia.Checked;
   end;
end;

procedure TFormCadIQF.rbRazaoClick(Sender: TObject);
begin
   if not chkFiltroForn.Checked then begin
      dblFiltroForn.Enabled    := rbRazao.Checked;
      dblFiltroFantasia.Enabled:= not rbRazao.Checked;
   end;
end;

procedure TFormCadIQF.rgOrdemClick(Sender: TObject);
begin
   AtualizarDados();
end;

procedure TFormCadIQF.rgTipoRelClick(Sender: TObject);
begin
   chkObs.Enabled:= (rgTipoRel.ItemIndex = 0);
end;

procedure TFormCadIQF.sbAbrirDocClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminhoDoc.Text:= OPD1.FileName;
end;

procedure TFormCadIQF.sbVisualizarDocClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminhoDoc.Text, Self.Name);
end;

function TFormCadIQF.ValidarDados(): Boolean;
begin
   if pctIQF.TabIndex = 0 then begin // Cadastro
      if AllTrim(dtData.Text) = EmptyStr then begin
         Application.MessageBox('Campo Data é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dtData);
         Result:= False;
         Exit;
      end;

      if dblFornecedor.KeyValue = -1 then begin
         Application.MessageBox('Campo Nome do Fornecedor é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblFornecedor);
         Result:= False;
         Exit;
      end;

      if dblPontual.KeyValue = -1 then begin
         Application.MessageBox('Campo Pontual é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblPontual);
         Result:= False;
         Exit;
      end;

      if dblConforme.KeyValue = -1 then begin
         Application.MessageBox('Campo Conforme obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblConforme);
         Result:= False;
         Exit;
      end;

      if AllTrim(edtLote.Text) = EmptyStr then begin
         Application.MessageBox('Campo N.F/Lote é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtLote);
         Result:= False;
         Exit;
      end;

      if dblResponsavel.KeyValue = -1 then begin
         Application.MessageBox('Campo Responsável é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblResponsavel);
         Result:= False;
         Exit;
      end;
   end;

   if pctIQF.TabIndex = 1 then begin
      if AllTrim(edtDescricaoDoc.Text) = EmptyStr then begin
         Application.MessageBox('Campo Descrição do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtDescricaoDoc);
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

   Result:= True;
end;

procedure TFormCadIQF.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sPeriodo: string;
   nCont: Integer;
   nAcumula: Real;
   nContSimP, nContNaoP, nContSimC, nContNaoC: Integer;
   sPesoAval, sPesoConf, sPesoPont: String;
begin
   // Busca os percentuais na tabela de parâmetros
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT pesoiqfconformidade, pesoiqfpontualidade, pesoiqfavaliacao' +
                    ' FROM parametros';
      Active:= True;

      sPesoAval:= VirgulaParaPonto(FieldByName('pesoiqfavaliacao').AsFloat / 100, 2);
      sPesoConf:= FieldByName('pesoiqfconformidade').AsString;
      sPesoPont:= FieldByName('pesoiqfpontualidade').AsString;
   end;

   sPeriodo:= dtDataInicial.Text + ' à ' + dtDataFinal.Text;

   if rgTipoRel.ItemIndex = 0 then begin // Relação de Remessas
      nCont   := 0;
      nContSimP:= 0;
      nContNaoP:= 0;
      nContSimC:= 0;
      nContNaoC:= 0;

      if chkTipoProd.Checked = True then begin
         case rgOrdemImpressao.ItemIndex of
            0: begin
               sCampoOrdem:= 'P.tipo_nomeTipo, F.forn_nome, I.iqf_data';
            end;
            1: begin
               sCampoOrdem:= 'P.tipo_nomeTipo, F.forn_fantasia, I.iqf_data';
            end;
            2: begin
               sCampoOrdem:= 'P.tipo_nomeTipo, IQF, I.iqf_data';
            end;
         end;
      end
      else begin
         case rgOrdemImpressao.ItemIndex of
            0: begin
               sCampoOrdem:= 'F.forn_nome, I.iqf_data';
            end;
            1: begin
               sCampoOrdem:= 'F.forn_fantasia, I.iqf_data';
            end;
            2: begin
               sCampoOrdem:= 'IQF, I.iqf_data';
            end;
         end;
      end;

      with cdsImpRelacao do begin
         Active:= False;

         CommandText:= ' SELECT F.forn_nome, I.iqf_data, I.iqf_CodFornecedor, I.iqf_pontual, ' +
                       ' I.iqf_conforme, I.iqf_NF, iqf_responsavel, TC.valo_com as Pontual, ' +
                       ' TC1.valo_com as Conforme, C.nome_col as Responsavel, F.forn_avaliacao,' +
//                       ' (forn_avaliacao * 0.2) + ((iqf_pontual * (forn_avaliacao * 0.3)) + ' +
//                       ' (iqf_conforme * (forn_avaliacao * 0.5))) as IQF,' +
                       ' (F.forn_avaliacao * ' + sPesoAval + ') + (iqf_pontual * ' + sPesoPont + ') + (iqf_conforme * ' + sPesoConf + ') as IQF,' +
                       ' F.forn_tipoProd, I.iqf_obs, ' +
                       ' CASE ' +
                       '    WHEN F.forn_tipoProd IS NULL THEN ' + QuotedStr('SEM CLASSIFICAÇÃO') +
                       '    WHEN F.forn_tipoProd <= 0 THEN ' + QuotedStr('SEM CLASSIFICAÇÃO') +
                       '    ELSE P.tipo_nomeTipo' +
                       ' END as tipo_nomeTipo' +
                       ' FROM iqf_remessa I' +
                       ' INNER JOIN Fornecedores F ON F.forn_codigo = I.iqf_codFornecedor' +
                       ' INNER JOIN Tabela_Combos TC ON TC.tipo_com = 20 AND TC.codi_com = I.iqf_pontual' +
                       ' INNER JOIN Tabela_Combos TC1 ON TC1.tipo_com = 20 AND TC1.codi_com = I.iqf_conforme' +
                       ' INNER JOIN Colaboradores C ON C.codi_col = I.iqf_responsavel' +
                       ' LEFT JOIN forn_tipo_produto P ON P.tipo_codigo = F.forn_tipoProd' +
                       ' WHERE iqf_data BETWEEN ' + ArrumaDataSQL(dtDataInicial.Date) +
                       '                AND '+ ArrumaDataSQL(dtDataFinal.Date);
         if chkTodosForn.Checked = False then begin
            CommandText:= CommandText + ' AND F.forn_codigo = ' + QuotedStr(dblFornImp.KeyValue);
         end;
         CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImpRelacao.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end
      else begin
         with cdsImpRelacao do begin
            First;
            while not Eof do begin
               nCont:= nCont + 1;
               if FieldByName('iqf_pontual').AsInteger = 0 then begin// Não
                  nContNaoP:= nContNaoP + 1;
               end
               else begin
                  nContSimP:= nContSimP + 1;
               end;
               if FieldByName('iqf_conforme').AsInteger = 0 then begin// Não
                  nContNaoC:= nContNaoC + 1;
               end
               else begin
                  nContSimC:= nContSimC + 1;
               end;

               Next;
            end;
         end;
      end;

      with frxReport1 do begin
         if chkTipoProd.Checked = True then begin
            if chkObs.Checked = True then begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQFTipoRemessaObs.fr3');
            end
            else begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQFTipoRemessa.fr3');
            end;
         end
         else begin
            if chkObs.Checked = True then begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQFRemessaObs.fr3');
            end
            else begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQFRemessa.fr3');
            end;
         end;
         Variables['Periodo']:= QuotedStr(sPeriodo);
         Variables['Total']:= nCont;
         Variables['TotSimP']:= nContSimP;
         Variables['TotNaoP']:= nContNaoP;
         Variables['TotSimC']:= nContSimC;
         Variables['TotNaoC']:= nContNaoC;

         if tipoImp = 'I' then begin
         // Imprimir direto
            PrepareReport;
            PrintOptions.ShowDialog:= False;
            Print;
         end
         else begin
            ShowReport;
         end;
      end;
   end
   else begin // Média de IQF
      case rgOrdemImpressao.ItemIndex of
         0: begin
            if chkTipoProd.Checked = True then begin
               sCampoOrdem:= 'P.tipo_nomeTipo, F.forn_nome';
            end
            else begin
               sCampoOrdem:= 'F.forn_nome';
            end;
         end;
         1: begin
            if chkTipoProd.Checked = True then begin
               sCampoOrdem:= 'P.tipo_nomeTipo, F.forn_fantasia';
            end
            else begin
               sCampoOrdem:= 'F.forn_fantasia';
            end;
         end;
         2: begin
            if chkTipoProd.Checked = True then begin
               sCampoOrdem:= 'P.tipo_nomeTipo, IQF';
            end
            else begin
               sCampoOrdem:= 'IQF';
            end;
         end;
      end;
      if rgOrdemImpressao.ItemIndex = 0 then begin

      end
      else begin

      end;

      nCont   := 0;
      nAcumula:= 0;

      with cdsImprimir do begin
         Active:= False;

         CommandText:= ' SELECT F.forn_nome, F.forn_avaliacao, F.forn_validade, F.forn_area,  ' +
                       ' F.forn_tipoProd, ' +
                       ' CASE ' +
                       '    WHEN F.forn_tipoProd IS NULL THEN ' + QuotedStr('SEM CLASSIFICAÇÃO') +
                       '    WHEN F.forn_tipoProd <= 0 THEN ' + QuotedStr('SEM CLASSIFICAÇÃO') +
                       '    ELSE P.tipo_nomeTipo' +
                       ' END as tipo_nomeTipo,' +
                       ' iqf_codFornecedor, COUNT(*) as Qtd, ' +
   //                    ' SUM(iqf_pontual) as Pontual,' +
   //                    ' SUM(iqf_conforme) as Conforme,' +
//                       ' (forn_avaliacao * 0.2) + ((SUM(iqf_pontual) * (forn_avaliacao * 0.3)) + (SUM(iqf_conforme) * (forn_avaliacao * 0.5))) / COUNT(*) as IQF' +
                       ' (forn_avaliacao * ' + sPesoAval + ') + ((SUM(iqf_pontual) / COUNT(*)) * ' + sPesoPont + ') + ((SUM(iqf_conforme) / COUNT(*)) * ' + sPesoConf + ') as IQF' +
                       ' FROM iqf_remessa' +
                       ' INNER JOIN Fornecedores F ON F.forn_codigo = iqf_codFornecedor' +
                       ' LEFT JOIN forn_tipo_produto P ON P.tipo_codigo = F.forn_tipoProd' +
                       ' WHERE iqf_data BETWEEN ' + ArrumaDataSQL(dtDataInicial.Date) +
                       '                AND '+ ArrumaDataSQL(dtDataFinal.Date);
         if chkTodosForn.Checked = False then begin
            CommandText:= CommandText + ' AND F.forn_codigo = ' + QuotedStr(dblFornImp.KeyValue);
         end;
         CommandText:= CommandText + ' GROUP BY iqf_codFornecedor, F.forn_nome, F.forn_avaliacao, ' +
                                     ' F.forn_validade, F.forn_area, F.forn_tipoProd, P.tipo_nomeTipo, F.forn_fantasia' +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
         First;

         // Acumula os valores de IQF e quantidade de registros para cálculo da média
         while not Eof do begin
            nAcumula:= nAcumula + FieldByName('IQF').AsFloat;
            nCont:= nCont + 1;
            Next;
         end;

         First;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      with frxReport1 do begin
         if chkTipoProd.Checked = True then begin
            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQFTipo.fr3');
         end
         else begin
            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQF.fr3');
         end;
         Variables['Periodo']:= QuotedStr(sPeriodo);
         Variables['Media']  := QuotedStr(FormatFloat('##,##0.00',nAcumula / nCont));

         if tipoImp = 'I' then begin
         // Imprimir direto
            PrepareReport;
            PrintOptions.ShowDialog:= False;
            Print;
         end
         else begin
            ShowReport;
         end;
      end;
   end;
end;

end.
