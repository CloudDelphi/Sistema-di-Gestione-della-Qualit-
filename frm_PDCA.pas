unit frm_PDCA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls, RXSpin, Mask, rxToolEdit, dxGDIPlusClasses,
  rxCurrEdit;

type
  TFormPDCA = class(TForm)
    pctPDCA: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtIdentificacao: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgLancamentosDef: TDBGrid;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnl1: TPanel;
    btnSair: TBitBtn;
    zqryAuxiliar: TZQuery;
    dspAuxiliar: TDataSetProvider;
    cdsAuxiliar: TClientDataSet;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    frxReport1: TfrxReport;
    frxDBDSPDCA: TfrxDBDataset;
    dblEmitido: TDBLookupComboBox;
    zqryOrigem: TZQuery;
    dspOrigem: TDataSetProvider;
    cdsOrigem: TClientDataSet;
    dsOrigem: TDataSource;
    lbl2: TLabel;
    dtData: TDateEdit;
    lbl3: TLabel;
    dblOrigem: TDBLookupComboBox;
    lbl5: TLabel;
    dblProcesso: TDBLookupComboBox;
    tsLancamentos: TTabSheet;
    lbl13: TLabel;
    edtDescricao: TEdit;
    lbl11: TLabel;
    edtIdentLanc: TEdit;
    dtDataLanc: TDateEdit;
    lbl12: TLabel;
    lbl14: TLabel;
    edtDescLanc: TEdit;
    img2: TImage;
    lbl6: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    mmoOque: TMemo;
    mmoPorque: TMemo;
    edtOnde: TEdit;
    dblQuem: TDBLookupComboBox;
    dtQuando: TDateEdit;
    mmoComo: TMemo;
    lbl19: TLabel;
    lbl15: TLabel;
    img1: TImage;
    img3: TImage;
    grp3: TGroupBox;
    lbl7: TLabel;
    dtDataRealizada: TDateEdit;
    lbl8: TLabel;
    mmoVerificacaoImpl: TMemo;
    lbl20: TLabel;
    mmoRecursos: TMemo;
    edtQuanto: TCurrencyEdit;
    lbl22: TLabel;
    edtCodigo: TEdit;
    cdsOrigemcodi_com: TLargeintField;
    cdsOrigemvalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    zqryEmitido: TZQuery;
    dspEmitido: TDataSetProvider;
    cdsEmitido: TClientDataSet;
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    dsEmitido: TDataSource;
    zqryPDCA: TZQuery;
    dspPDCA: TDataSetProvider;
    cdsPDCA: TClientDataSet;
    dsPDCA: TDataSource;
    cdsPDCApdca_codigo: TIntegerField;
    cdsPDCApdca_identificacao: TWideStringField;
    cdsPDCApdca_data: TDateTimeField;
    cdsPDCApdca_descricao: TWideStringField;
    cdsPDCApdca_origem: TIntegerField;
    cdsPDCApdca_processo: TIntegerField;
    cdsPDCApdca_emitido: TIntegerField;
    cdsPDCAorigem: TWideStringField;
    cdsPDCAprocesso: TWideStringField;
    tsPesqLanc: TTabSheet;
    lbl21: TLabel;
    edtValorLanc: TEdit;
    cbbPesqLanc: TComboBox;
    lbl23: TLabel;
    dbgLancamentos: TDBGrid;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtIdentPesq: TEdit;
    dtDataPesq: TDateEdit;
    edtDescPesq: TEdit;
    dsQuem: TDataSource;
    cdsQuem: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dspQuem: TDataSetProvider;
    zqryQuem: TZQuery;
    zqryLanc: TZQuery;
    dspLanc: TDataSetProvider;
    cdsLanc: TClientDataSet;
    dsLanc: TDataSource;
    cdsLanclan_codigo: TIntegerField;
    cdsLancpdca_codigo: TIntegerField;
    cdsLanclan_onde: TWideMemoField;
    cdsLanclan_porque: TWideMemoField;
    cdsLanclan_como: TWideMemoField;
    cdsLanclan_recursos: TWideMemoField;
    cdsLanclan_quanto: TFloatField;
    cdsLanclan_datarealizada: TDateTimeField;
    cdsLanclan_verimplantacao: TWideMemoField;
    cdsLanclan_status: TIntegerField;
    cdsLanclan_quando: TDateTimeField;
    cdsLanclan_quem: TIntegerField;
    cdsLancquem: TWideStringField;
    mmoObsCheck: TMemo;
    dtPrevista: TDateEdit;
    dtFinalizar: TDateEdit;
    lbl27: TLabel;
    cdsLanclan_dtfinalizado: TDateTimeField;
    cdsLanclan_chkobs: TWideMemoField;
    cdsImprimirpdca_identificacao: TWideStringField;
    cdsImprimirpdca_data: TDateTimeField;
    cdsImprimirpdca_descricao: TWideStringField;
    cdsImprimirpdca_origem: TIntegerField;
    cdsImprimirpdca_processo: TIntegerField;
    cdsImprimirpdca_emitido: TIntegerField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirlan_codigo: TIntegerField;
    cdsImprimirpdca_codigo: TIntegerField;
    cdsImprimirlan_oque: TWideMemoField;
    cdsImprimirlan_onde: TWideMemoField;
    cdsImprimirlan_porque: TWideMemoField;
    cdsImprimirlan_quando: TDateTimeField;
    cdsImprimirlan_como: TWideMemoField;
    cdsImprimirlan_quem: TIntegerField;
    cdsImprimirlan_recursos: TWideMemoField;
    cdsImprimirlan_quanto: TFloatField;
    cdsImprimirlan_datarealizada: TDateTimeField;
    cdsImprimirlan_verimplantacao: TWideMemoField;
    cdsImprimirlan_status: TIntegerField;
    cdsImprimirquem: TWideStringField;
    cdsImprimirlan_dtfinalizado: TDateTimeField;
    cdsImprimirlan_chkobs: TWideMemoField;
    lbl28: TLabel;
    lbl29: TLabel;
    s: TDateTimeField;
    tsDocumentos: TTabSheet;
    lbl30: TLabel;
    sbArquivoDoc: TSpeedButton;
    sbVisualizar: TSpeedButton;
    lbl31: TLabel;
    edtDocumento: TEdit;
    edtCaminho: TEdit;
    dbgDocumentos: TDBGrid;
    lbl32: TLabel;
    edtIdentDoc: TEdit;
    lbl33: TLabel;
    dtDataDoc: TDateEdit;
    lbl34: TLabel;
    edtDescDoc: TEdit;
    zqryDocs: TZQuery;
    dspDocs: TDataSetProvider;
    cdsDocs: TClientDataSet;
    dsDocs: TDataSource;
    cdsDocspdca_codigo: TIntegerField;
    cdsDocspdca_coddoc: TIntegerField;
    cdsDocspdca_descricao: TWideStringField;
    cdsDocspdca_caminho: TWideMemoField;
    opd1: TOpenDialog;
    cdsImprimirlan_dtprevista: TDateTimeField;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    cdsLanclan_oque: TWideMemoField;
    sbVisualizarOque: TSpeedButton;
    sbVisualizarPorque: TSpeedButton;
    sbVisualizarComo: TSpeedButton;
    sbVisualizarRecursos: TSpeedButton;
    mmoTexto: TMemo;
    btnFecharTexto: TBitBtn;
    btnEmail: TBitBtn;
    pnlEmailAcoes: TPanel;
    lblMsg: TLabel;
    lblMsg2: TLabel;
    pnl17: TPanel;
    btnSairEmailAcoes: TBitBtn;
    btnEnviarEmail: TBitBtn;
    pnl18: TPanel;
    rgTipoAcao: TRadioGroup;
    rgEnvioAcao: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AtualizarDados;
    procedure AtualizarDadosAcessorios;
    procedure PreencherCampos;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure FormShow(Sender: TObject);
    procedure dbgLancamentosDefCellClick(Column: TColumn);
    procedure dbgLancamentosDefDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctPDCAChange(Sender: TObject);
    procedure tsLancamentosShow(Sender: TObject);
    procedure dblDefeitoCloseUp(Sender: TObject);
    procedure edtCodLancExit(Sender: TObject);
    procedure mmoOqueKeyPress(Sender: TObject; var Key: Char);
    procedure cdsLanclan_oqueGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    function ValidarCampos: Boolean;
    procedure PreencherDadosContexto();
    procedure sbArquivoDocClick(Sender: TObject);
    procedure dbgDocumentosCellClick(Column: TColumn);
    procedure sbVisualizarClick(Sender: TObject);
    procedure edtValorLancChange(Sender: TObject);
    procedure PreencherDadosIndicador();
    procedure PreencherDadosPMC();
    procedure PreencherDadosRisco();
    procedure ExcluirPDCA(sDesvincularPDCA: string = 'N');
    procedure sbVisualizarOqueClick(Sender: TObject);
    procedure sbVisualizarPorqueClick(Sender: TObject);
    procedure sbVisualizarComoClick(Sender: TObject);
    procedure btnFecharTextoClick(Sender: TObject);
    procedure sbVisualizarRecursosClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);

  private
    { Private declarations }
    sDescAuditoria: string;
  public
    { Public declarations }
    cOperacao: Char;
    iTela: Integer;
    sCodigoPDCA: string;
  end;

var
  FormPDCA: TFormPDCA;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_CadContextoAnalise, frm_PrevEficacia,
  frm_CadIndicadores, frm_CadPMCFecha, frm_CadRiscoAnaliseRisco, frm_CadRiscoVisualizacao;

{$R *.dfm}

procedure TFormPDCA.AtualizarDados;
begin
   with cdsOrigem do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 27' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsEmitido do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   cdsQuem.Active:= False;
   cdsQuem.Active:= True;

   cdsPDCA.Active:= False;
   cdsPDCA.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsPDCA.Locate('pdca_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormPDCA.AtualizarDadosAcessorios;
var
   sCodigo: string;
begin
   sCodigo:= edtCodigo.Text;
   if sCodigo = '' then begin
      sCodigo:= '0';
   end;

   with cdsLanc do begin
      Active:= False;
      CommandText:= ' SELECT lan_codigo, pdca_codigo, lan_oque, lan_onde, lan_porque, lan_quando,' +
                    ' lan_como, lan_quem, lan_recursos, lan_quanto, lan_datarealizada,' +
                    ' lan_verimplantacao, lan_status, nome_col as quem,' +
                    ' lan_dtprevista, lan_dtfinalizado, lan_chkobs' +
                    ' FROM pdca_lanc' +
                    ' INNER JOIN colaboradores C ON C.codi_col = lan_quem ' +
                    ' WHERE pdca_codigo = ' + sCodigo +
                    ' ORDER BY lan_quando';
      Active:= True;
   end;

   with cdsDocs do begin
      Active:= False;
      CommandText:= ' SELECT pdca_codigo, pdca_coddoc, pdca_descricao, pdca_caminho' +
                    ' FROM pdca_docs' +
                    ' WHERE pdca_codigo = ' + sCodigo +
                    ' ORDER BY pdca_descricao';
      Active:= True;
   end;
end;

procedure TFormPDCA.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsPDCA.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormPDCA.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 44, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 4);
   Botoes(False);

   if pctPDCA.TabIndex = 0 then begin
      TryFocus(dtData);
   end;
   if pctPDCA.TabIndex = 1 then begin
//      TryFocus(edtCodLanc);
   end;
end;

procedure TFormPDCA.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 4);
   pctPDCA.Pages[1].TabVisible:= True;
   pctPDCA.Pages[2].TabVisible:= True;
   pctPDCA.Pages[3].TabVisible:= True;
   pctPDCA.Pages[4].TabVisible:= True;
end;

procedure TFormPDCA.ExcluirPDCA(sDesvincularPDCA: string = 'N');
begin
   sDescAuditoria:= edtIdentificacao.Text;

   // Exclui Ações
   with cdsGravar do begin
      Active:= False;
      CommandText:= ' DELETE FROM pdca_lanc' +
                    ' WHERE pdca_codigo = ' + QuotedStr(cdsPDCA.FieldByName('pdca_codigo').AsString);
      Execute;
   end;

   // Exclui PDCA
   with cdsGravar do begin
      Active:= False;
      CommandText:= ' DELETE FROM pdca' +
                    ' WHERE pdca_codigo = ' + QuotedStr(cdsPDCA.FieldByName('pdca_codigo').AsString);
      Execute;
   end;

   if sDesvincularPDCA = 'S' then begin
      try
         with dm.cdsAuxiliar do begin
            // Riscos Internos
            Active:= False;
            CommandText:= ' UPDATE risco_analiseint SET' +
                          ' int_pdca = ' + QuotedStr('') +
                          ' WHERE int_pdca = ' + QuotedStr(edtIdentificacao.Text);
            Execute;

            // Riscos Macroambiente
            Active:= False;
            CommandText:= ' UPDATE risco_macro SET' +
                          ' mac_pdca = ' + QuotedStr('') +
                          ' WHERE mac_pdca = ' + QuotedStr(edtIdentificacao.Text);
            Execute;
         end;
      except
         on E:Exception do begin
            MostrarErro('Erro ao desvincular PMC', E.Message, Self.Name);
         end;
      end;
   end;

   Auditoria('PDCA', sDescAuditoria,'E','');
   LimparCampos(Self);
   AtualizarDados();
   PreencherCampos();
end;

procedure TFormPDCA.btnEmailClick(Sender: TObject);
begin
   AbrePanel(pnlEmailAcoes, Self);
end;

procedure TFormPDCA.btnExcluirClick(Sender: TObject);
var
   iContPDCA: Integer;
begin
   if (Acesso(cUsuario, 44, 'exclusao') = 1) then begin
      if pctPDCA.TabIndex = 0 then begin
         // Verifica se existe um risco vinculado ao PDCA
         // Se tiver pergunta se quer excluir e desvincular o PDCA do risco
         iContPDCA:= 0;
         with dm.cdsAux do begin // Riscos Macroambiente
            Active:= False;
            CommandText:= ' SELECT COUNT(*) as Qtd' +
                          ' FROM risco_macro' +
                          ' WHERE mac_pdca = ' + QuotedStr(edtIdentificacao.Text);
            Active:= True;

            iContPDCA:= iContPDCA + FieldByName('Qtd').AsInteger;
         end;
         with dm.cdsAux do begin // Riscos Internos
            Active:= False;
            CommandText:= ' SELECT COUNT(*) as Qtd' +
                          ' FROM risco_analiseint' +
                          ' WHERE int_pdca = ' + QuotedStr(edtIdentificacao.Text);
            Active:= True;

            iContPDCA:= iContPDCA + FieldByName('Qtd').AsInteger;
         end;

         if iContPDCA > 0 then begin
            if Application.MessageBox('O PDCA está viculado à Análise de Riscos. Deseja excluir o PDCA e desvincular o PDCA das Análises de Risco ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
               ExcluirPDCA('S');
            end;
         end
         else begin
            if Application.MessageBox('Confirma a exclusão do PDCA e suas ações ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
               ExcluirPDCA();
            end;
         end;
      end;

      if pctPDCA.TabIndex = 1 then begin // Lançamentos
         if Application.MessageBox('Confirma a exclusão da ação ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sDescAuditoria:= edtIdentificacao.Text + ' - ' + cdsLanc.FieldByName('lan_codigo').AsString;

            // Exclui Ações
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM pdca_lanc' +
                             ' WHERE lan_codigo = ' + QuotedStr(cdsLanc.FieldByName('lan_codigo').AsString);
               Execute;
            end;

            Auditoria('AÇÃO DO PDCA', sDescAuditoria,'E','');
            LimparCampos(Self);
            AtualizarDados();
            AtualizarDadosAcessorios();
            PreencherCampos();
         end;
      end;

      if pctPDCA.TabIndex = 2 then begin // Lançamentos
         if Application.MessageBox('Confirma a exclusão do documento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sDescAuditoria:= edtIdentificacao.Text + ' - ' + edtDocumento.Text;

            // Exclui Ações
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM pdca_docs' +
                             ' WHERE pdca_coddoc = ' + QuotedStr(cdsDocs.FieldByName('pdca_coddoc').AsString);
               Execute;
            end;

            Auditoria('DOCUMETNO DO PDCA', sDescAuditoria,'E','');
            LimparCampos(Self);
            AtualizarDados();
            AtualizarDadosAcessorios();
            PreencherCampos();
         end;
      end;

      Botoes(True);
   end;
end;

procedure TFormPDCA.btnFecharTextoClick(Sender: TObject);
begin
   mmoTexto.Visible      := False;
   btnFecharTexto.Visible:= False;
end;

procedure TFormPDCA.btnGravarClick(Sender: TObject);
var
   sCodigoLanc: string;
begin
   try
      if ValidarCampos() then begin
         sDescAuditoria:= edtCodigo.Text + ' - ' + edtDescDoc.Text;

         with cdsGravar do begin
            Active:= False;
            if pctPDCA.TabIndex = 0 then begin // Cadastro
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO pdca (' +
                                ' pdca_codigo, pdca_identificacao, pdca_data, pdca_descricao, ' +
                                ' pdca_origem, pdca_processo, pdca_emitido)' +
                                ' VALUES(' +
                                QuotedStr(edtCodigo.Text) + ',' +
                                QuotedStr(edtIdentificacao.Text) + ',' +
                                ArrumaDataSQL(dtData.Date) + ',' +
                                QuotedStr(edtDescricao.Text) + ',' +
                                IntToStr(dblOrigem.KeyValue) + ',' +
                                IntToStr(dblProcesso.KeyValue) + ',' +
                                IntToStr(dblEmitido.KeyValue) +
                                ');';
               end
               else begin
                  CommandText:= ' UPDATE pdca SET' +
                                ' pdca_identificacao = ' + QuotedStr(edtIdentificacao.Text) + ',' +
                                ' pdca_data = ' + ArrumaDataSQL(dtData.Date) + ',' +
                                ' pdca_descricao = ' + QuotedStr(edtDescricao.Text) + ',' +
                                ' pdca_origem = ' + IntToStr(dblOrigem.KeyValue) + ',' +
                                ' pdca_processo = ' + IntToStr(dblProcesso.KeyValue) + ',' +
                                ' pdca_emitido = ' + IntToStr(dblEmitido.KeyValue) +
                                ' WHERE pdca_codigo = ' + QuotedStr(edtCodigo.Text);
               end;
               Execute;

               AtualizarDados();

               HabilitarCampos(False, False, Self, 4);
               pctPDCA.Pages[1].TabVisible:= True;
               pctPDCA.Pages[2].TabVisible:= True;
               pctPDCA.Pages[3].TabVisible:= True;
               pctPDCA.Pages[4].TabVisible:= True;

               Auditoria('PDCA', edtIdentificacao.Text ,cOperacao,'');

               if Self.Tag = 3 then begin // Cadastro de Indicadores
                  if not (FormCadIndicadores = nil) then begin
                     FormCadIndicadores.edtPDCA.Text             := edtIdentificacao.Text;
                     FormCadIndicadores.sbDesvincularPDCA.Enabled:= True;

                     with dm.cdsGravar do begin
                        Active:= False;
                        CommandText:= ' UPDATE indicadores SET' +
                                      ' ind_pdca = ' + QuotedStr(edtIdentificacao.Text) +
                                      ' WHERE codi_ind = ' + QuotedStr(FormCadIndicadores.edtCodigo.Text);
                        Execute;
                     end;
                  end;
               end;

               if iTela = 5 then begin // Análise de Riscos
                  if not (FormCadRiscoVisualizacao = nil) then begin
                     FormCadRiscoVisualizacao.edtPDCA.Text          := edtIdentificacao.Text;
                     FormCadRiscoVisualizacao.btnDesvincular.Enabled:= True;

                     if FormCadRiscoVisualizacao.sTipoIntExt = 'INTERNA' then begin
                        with dm.cdsGravar do begin
                           Active:= False;
                           CommandText:= ' UPDATE risco_analiseint SET' +
                                         ' int_pdca = ' + QuotedStr(edtIdentificacao.Text) +
                                         ' WHERE int_codigo = ' + IntToStr(FormCadRiscoVisualizacao.iCodigo);
                           Execute;
                        end;
                     end
                     else begin
                        with dm.cdsGravar do begin
                           Active:= False;
                           CommandText:= ' UPDATE risco_macro SET' +
                                         ' mac_pdca = ' + QuotedStr(edtIdentificacao.Text) +
                                         ' WHERE mac_codigo = ' + IntToStr(FormCadRiscoVisualizacao.iCodigo);
                           Execute;
                        end;
                     end;

                     FormAnaliseRisco.AtualizarDados();
                  end;
               end;
            end;

            if pctPDCA.TabIndex = 1 then begin // Lançamentos
               if cOperacao = 'I' then begin
                  sCodigoLanc:= BuscarNovoCodigo('pdca_lanc', 'lan_codigo');
                  CommandText:= ' INSERT INTO pdca_lanc( ' +
                                ' lan_codigo, pdca_codigo, lan_oque, lan_onde, lan_porque, lan_quando,  ' +
                                ' lan_como, lan_quem, lan_recursos, lan_quanto, lan_datarealizada,  ' +
                                ' lan_verimplantacao, lan_status, lan_dtprevista, ' +
                                ' lan_dtfinalizado, lan_chkobs' +
                                ' ) ' +
                                ' VALUES(' +
                                BuscarNovoCodigo('pdca_lanc', 'lan_codigo') + ',' +
                                edtCodigo.Text + ',' +
                                QuotedStr(mmoOque.Text) + ',' +
                                QuotedStr(edtOnde.Text) + ',' +
                                QuotedStr(mmoPorque.Text) + ',' +
                                ArrumaDataSQL(dtQuando.Date) + ',' +
                                QuotedStr(mmoComo.Text) + ',' +
                                QuotedStr(dblQuem.KeyValue) + ',' +
                                QuotedStr(mmoRecursos.Text) + ',' +
                                VirgulaParaPonto(edtQuanto.Value, 2) + ',' +
                                ArrumaDataSQL(dtDataRealizada.Date) + ',' +
                                QuotedStr(mmoVerificacaoImpl.Text) + ',' +
                                '0' + ',' + // 0 - Pendente / 1 - Lançamento Finalizado / 2 - Oriundo de nova ação
                                ArrumaDataSQL(dtPrevista.Date) + ',' +
                                ArrumaDataSQL(dtFinalizar.Date) + ',' +
                                QuotedStr(mmoObsCheck.Text) +
                                ');';
               end
               else begin
                  sCodigoLanc:= cdsLanc.FieldByName('lan_codigo').AsString;
                  CommandText:= ' UPDATE pdca_lanc SET' +
                                ' lan_oque = ' + QuotedStr(mmoOque.Text) + ',' +
                                ' lan_onde = ' + QuotedStr(edtOnde.Text) + ',' +
                                ' lan_porque = ' + QuotedStr(mmoPorque.Text) + ',' +
                                ' lan_como = ' + QuotedStr(mmoComo.Text) + ',' +
                                ' lan_quem = ' + QuotedStr(dblQuem.KeyValue) + ',' +
                                ' lan_recursos = ' + QuotedStr(mmoRecursos.Text) + ',' +
                                ' lan_quanto = ' + VirgulaParaPonto(edtQuanto.Value, 2) + ',' +
                                ' lan_datarealizada = ' + ArrumaDataSQL(dtDataRealizada.Date) + ',' +
                                ' lan_verimplantacao = ' + QuotedStr(mmoVerificacaoImpl.Text) + ',' +
                                ' lan_quando = ' + ArrumaDataSQL(dtQuando.Date) + ',' +
                                ' lan_dtprevista = ' + ArrumaDataSQL(dtPrevista.Date) + ',' +
                                ' lan_dtfinalizado = ' + ArrumaDataSQL(dtFinalizar.Date) + ',' +
                                ' lan_chkobs = ' + QuotedStr(mmoObsCheck.Text) +
                                ' WHERE lan_codigo = ' + QuotedStr(cdsLanc.FieldByName('lan_codigo').AsString);
               end;
               Execute;

               AtualizarDados();
               AtualizarDadosAcessorios();
               Auditoria('PDCA LANÇAMENTOS', Copy(mmoOque.Text, 1, 200) ,cOperacao,'');

               HabilitarCampos(False, False, Self, 4);
               if (dtDataRealizada.Text <> '  /  /    ') and (dtPrevista.Text = '  /  /    ') then begin
                  AbrirForm(TFormPrevEficacia, FormPrevEficacia, 1, sCodigoLanc);
               end;
               AtualizarDadosAcessorios();
               PreencherCampos();
            end;

            if pctPDCA.TabIndex = 2 then begin // Documentos
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO pdca_docs (' +
                                ' pdca_codigo, pdca_coddoc, pdca_descricao, pdca_caminho)' +
                                ' VALUES(' +
                                edtCodigo.Text + ',' +
                                BuscarNovoCodigo('pdca_docs', 'pdca_coddoc') + ',' +
                                QuotedStr(edtDocumento.Text) + ',' +
                                QuotedStr(edtCaminho.Text) +
                                ');';
               end
               else begin
                  CommandText:= ' UPDATE pdca_docs SET' +
                                ' pdca_descricao = ' + QuotedStr(edtDocumento.Text) + ',' +
                                ' pdca_caminho = ' + QuotedStr(edtCaminho.Text) +
                                ' WHERE pdca_codigo = ' + QuotedStr(edtCodigo.Text) +
                                ' AND pdca_coddoc = ' + cdsDocs.FieldByName('pdca_coddoc').AsString;
               end;
               Execute;

               AtualizarDadosAcessorios();
               Auditoria('PDCA DOCS', sDescAuditoria ,cOperacao,'');

               HabilitarCampos(False, False, Self, 4);
               pctPDCA.Pages[1].TabVisible:= True;
               pctPDCA.Pages[3].TabVisible:= True;
               pctPDCA.Pages[4].TabVisible:= True;
            end;
         end;

         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         Botoes(True);
         TryFocus(btnNovo);
      end;
      except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;


end;

procedure TFormPDCA.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormPDCA.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormPDCA.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 44, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   HabilitarCampos(True, True, Self, 4);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;

   case pctPDCA.TabIndex of
      0: begin
         LimparCampos(Self);
         edtCodigo.Text:= BuscarNovoCodigo('pdca', 'pdca_codigo');
         edtIdentificacao.Text:= BuscarNovoCodigoPDCA();
         TryFocus(dtData);
         dblOrigem.KeyValue:= 1;
         dtData.Date:= Date();
         pctPDCA.Pages[1].TabVisible:= False;
         pctPDCA.Pages[2].TabVisible:= False;
         pctPDCA.Pages[3].TabVisible:= False;
      end;
      1: begin
         LimparCampos(Self);
         TryFocus(mmoOque);
//         rgCheck.ItemIndex:= 0;
      end;
      2: begin // Documentos
         LimparCampos(Self);
         TryFocus(edtDocumento);
//         pctPDCA.Pages[1].TabVisible:= False;
         pctPDCA.Pages[3].TabVisible:= False;
         pctPDCA.Pages[4].TabVisible:= False;
         sbVisualizar.Enabled:= False;
      end;
   end;
end;

procedure TFormPDCA.btnPrimeiroClick(Sender: TObject);
begin
   case pctPDCA.TabIndex of
      0: cdsPDCA.First;
      1: cdsLanc.First;
      2: cdsDocs.First;
      3: cdsLanc.First;
      4: cdsPDCA.First;
   end;
   PreencherCampos;
end;

procedure TFormPDCA.btnAnteriorClick(Sender: TObject);
begin
   case pctPDCA.TabIndex of
      0: cdsPDCA.Prior;
      1: cdsLanc.Prior;
      2: cdsDocs.Prior;
      3: cdsLanc.Prior;
      4: cdsPDCA.Prior;
   end;
   PreencherCampos;
end;

procedure TFormPDCA.btnProximoClick(Sender: TObject);
begin
   case pctPDCA.TabIndex of
      0: cdsPDCA.Next;
      1: cdsLanc.Next;
      2: cdsDocs.Next;
      3: cdsLanc.Next;
      4: cdsPDCA.Next;
   end;
   PreencherCampos;
end;

procedure TFormPDCA.btnUltimoClick(Sender: TObject);
begin
   case pctPDCA.TabIndex of
      0: cdsPDCA.Last;
      1: cdsLanc.Last;
      2: cdsDocs.Last;
      3: cdsLanc.Last;
      4: cdsPDCA.Last;
   end;
   PreencherCampos;
end;

procedure TFormPDCA.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPDCA.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormPDCA.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormPDCA.cdsLanclan_oqueGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text:= Copy(cdsLanc.FieldByName('lan_oque').AsString, 1, 50);
end;

procedure TFormPDCA.ControlarAbas;
begin
   if pctPDCA.TabIndex < 3 then begin
      Botoes(True);
      PreencherCampos();

      edtIdentLanc.Text:= edtIdentificacao.Text;
      dtDataLanc.Date  := dtData.Date;
      edtDescLanc.Text := edtDescricao.Text;

      edtIdentPesq.Text:= edtIdentificacao.Text;
      dtDataPesq.Date  := dtData.Date;
      edtDescPesq.Text := edtDescricao.Text;

      edtIdentDoc.Text := edtIdentificacao.Text;
      dtDataDoc.Date   := dtData.Date;
      edtDescDoc.Text  := edtDescricao.Text;

      if pctPDCA.TabIndex = 0 then begin // Cadastro
         if cdsPDCA.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;

      if pctPDCA.TabIndex = 1 then begin // Lançamentos
         if cdsLanc.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;

      if pctPDCA.TabIndex = 2 then begin // Documentos
         if cdsDocs.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;
   end
   else begin // Pesquisa Lançamentos e Pesquisa
      btnNovo.Enabled:= False;
      btnGravar.Enabled:= False;
      btnExcluir.Enabled:= False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled:= False;

      edtValor.Clear;
      edtValorLanc.Clear;

      if pctPDCA.TabIndex = 3 then begin
         TryFocus(edtValorLanc);
      end
      else begin
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormPDCA.dbgDocumentosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormPDCA.dbgLancamentosDefCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormPDCA.dbgLancamentosDefDblClick(Sender: TObject);
begin
   PreencherCampos;
   if pctPDCA.TabIndex = 3 then begin // Pesquisa Lançamentos
      pctPDCA.TabIndex:= 1;
   end;
   if pctPDCA.TabIndex = 4 then begin // Pesquisa PDCA
      pctPDCA.TabIndex:= 0;
   end;
   ControlarAbas;
end;

procedure TFormPDCA.dblDefeitoCloseUp(Sender: TObject);
begin
//   edtCodLanc.Text:= dblDefeito.KeyValue;
end;

procedure TFormPDCA.edtCodLancExit(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT def_codigo, def_descricao, def_classe' +
                    ' FROM defeitos';
//                    ' WHERE def_codigo = ' + edtCodLanc.Text;
      Active:= True;

      if RecordCount <= 0 then begin
         Application.MessageBox('Não existe o código do defeito digitado', 'Aviso', MB_OK + MB_ICONWARNING);
//         TryFocus(edtCodLanc);
      end
      else begin
//         dblDefeito.KeyValue:= edtCodLanc.Text;
      end;
   end;
end;

procedure TFormPDCA.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> '' then begin
      case cbbCampo.ItemIndex of
         0: cdsPDCA.Locate('pdca_identificacao', edtValor.Text, [loPartialKey]);
         1: cdsPDCA.Locate('pdca_descricao', edtValor.Text, [loPartialKey]);
      end;
   end;
end;

procedure TFormPDCA.edtValorLancChange(Sender: TObject);
begin
   if AllTrim(edtValorLanc.Text) <> '' then begin
      case cbbCampo.ItemIndex of
         0: cdsLanc.Locate('lan_oque', edtValor.Text, [loPartialKey]);
      end;
   end;
end;

procedure TFormPDCA.FormShow(Sender: TObject);
begin
   pctPDCA.TabIndex:= 0;
   mmoTexto.Visible:= False;
   AtualizarDados();

   if (iTela = 1) or (Self.Tag = 1) then begin // Tartaruga
      if Alltrim(sCodigoPDCA) <> EmptyStr then begin
         cdsPDCA.Locate('pdca_codigo', sCodigoPDCA, []);
      end;
   end;

   AtualizarDadosAcessorios();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 4);
   ControlarAbas();
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);

   rgOrdemImpressao.ItemIndex:= 1;

   if (iTela = 2) or (Self.Tag = 2) then begin // Análise de Contextos
      btnNovoClick(Self);
      PreencherDadosContexto();
   end;

   if (iTela = 3) or (Self.Tag = 3) then begin // Cadastro de Indicadores
      btnNovoClick(Self);
      PreencherDadosIndicador();
   end;

   if (iTela = 4) or (Self.Tag = 4) then begin // Fechamento de PMC
      btnNovoClick(Self);
      PreencherDadosPMC();
   end;

   if (iTela = 5) or (Self.Tag = 5) then begin // Análise de Riscos
      btnNovoClick(Self);
      PreencherDadosRisco();
   end;

   if (iTela = 6) or (Self.Tag = 6) then begin // Análise de Riscos
      cdsPDCA.Locate('pdca_identificacao', FormCadRiscoVisualizacao.edtPDCA.Text,[]);
      PreencherCampos();
   end;

   if (iTela = 7) or (Self.Tag = 7) then begin // Análise de Riscos
      cdsPDCA.Locate('pdca_identificacao', FormCadRiscoVisualizacao.cdsPDCA.FieldByName('pdca_identificacao').AsString,[]);
      PreencherCampos();
   end;

   if (iTela = 8) or (Self.Tag = 8) then begin // Indicadores (PDCA vinculado)
      if Alltrim(sCodigoPDCA) <> EmptyStr then begin
         cdsPDCA.Locate('pdca_identificacao', sCodigoPDCA, []);
         PreencherCampos();
      end;
   end;
end;

procedure TFormPDCA.PreencherDadosContexto;
begin
   edtIdentificacao.Text:= BuscarNovoCodigoPDCA();
   dtData.Date          := Date();
   edtDescricao.Text    := FormContextoAnalise.mmoMonitoramento.Text;
   dblOrigem.KeyValue   := 5;

   dtData.SelectAll;
end;

procedure TFormPDCA.PreencherDadosIndicador;
begin
   edtIdentificacao.Text:= BuscarNovoCodigoPDCA();
   dtData.Date          := Date();
   edtDescricao.Text    := FormCadIndicadores.edtDescricao.Text;
   dblOrigem.KeyValue   := 1;
   dblProcesso.KeyValue := FormCadIndicadores.dblProcesso.KeyValue;

   dtData.SelectAll;
end;

procedure TFormPDCA.PreencherDadosPMC;
begin
   edtIdentificacao.Text:= BuscarNovoCodigoPDCA();
   dtData.Date          := Date();
   edtDescricao.Text    := FormCadPMCFecha.edtIdentificacao.Text;
   dblOrigem.KeyValue   := 6;

   dtData.SelectAll;
end;

procedure TFormPDCA.PreencherDadosRisco;
begin
   edtIdentificacao.Text:= BuscarNovoCodigoPDCA();
   dtData.Date          := Date();
   edtDescricao.Text    := FormAnaliseRisco.cdsAnalise.FieldByName('fator').AsString + ' - ' +
                           FormAnaliseRisco.cdsAnalise.FieldByName('variavel').AsString;
   dblOrigem.KeyValue   := 7;

   dtData.SelectAll;
end;

procedure TFormPDCA.sbArquivoDocClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormPDCA.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

procedure TFormPDCA.sbVisualizarComoClick(Sender: TObject);
begin
   mmoTexto.Left:= 469;
   mmoTexto.Top := 204;
   mmoTexto.Height:= 295;
   mmoTexto.Text:= mmoComo.Text;
   mmoTexto.Visible := True;
   btnFecharTexto.Left:= 398;
   btnFecharTexto.Top := 204;
   btnFecharTexto.Visible:= True;
end;

procedure TFormPDCA.sbVisualizarOqueClick(Sender: TObject);
begin
   mmoTexto.Left:= 10;
   mmoTexto.Top := 115;
   mmoTexto.Height:= 343;
   mmoTexto.Text:= mmoOque.Text;
   mmoTexto.Visible := True;
   btnFecharTexto.Left:= 432;
   btnFecharTexto.Top := 388;
   btnFecharTexto.Visible:= True;
end;

procedure TFormPDCA.sbVisualizarPorqueClick(Sender: TObject);
begin
   mmoTexto.Left:= 469;
   mmoTexto.Top := 115;
   mmoTexto.Height:= 343;
   mmoTexto.Text:= mmoPorque.Text;
   mmoTexto.Visible := True;
   btnFecharTexto.Left:= 398;
   btnFecharTexto.Top := 388;
   btnFecharTexto.Visible:= True;
end;

procedure TFormPDCA.sbVisualizarRecursosClick(Sender: TObject);
begin
   mmoTexto.Left:= 10;
   mmoTexto.Top := 295;
   mmoTexto.Height:= 203;
   mmoTexto.Text:= mmoRecursos.Text;
   mmoTexto.Visible := True;
   btnFecharTexto.Left:= 433;
   btnFecharTexto.Top := 295;
   btnFecharTexto.Visible:= True;
end;

procedure TFormPDCA.pctPDCAChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormPDCA.PreencherCampos;
begin
   if pctPDCA.TabIndex = 0 then begin // Cadastro
      with cdsPDCA do begin
         edtCodigo.Text       := FieldByName('pdca_codigo').AsString;
         edtIdentificacao.Text:= FieldByName('pdca_identificacao').AsString;
         dtData.Date          := FieldByName('pdca_data').AsDateTime;
         edtDescricao.Text    := FieldByName('pdca_descricao').AsString;

         if FieldByName('pdca_origem').AsString <> EmptyStr then begin
            dblOrigem.KeyValue:= FieldByName('pdca_origem').AsString;
         end;

         if FieldByName('pdca_processo').AsString <> EmptyStr then begin
            dblProcesso.KeyValue:= FieldByName('pdca_processo').AsString;
         end;

         if FieldByName('pdca_emitido').AsString <> EmptyStr then begin
            dblEmitido.KeyValue:= FieldByName('pdca_emitido').AsString;
         end;

         AtualizarDadosAcessorios();
      end;
   end;

   if pctPDCA.TabIndex = 1 then begin // Lançamentos
      with cdsLanc do begin
         mmoOque.Text    := FieldByName('lan_oque').AsString;
         mmoPorque.Text  := FieldByName('lan_porque').AsString;
         edtOnde.Text    := FieldByName('lan_onde').AsString;
         dtQuando.Date   := FieldByName('lan_quando').AsDateTime;
         mmoComo.Text    := FieldByName('lan_como').AsString;
         mmoRecursos.Text:= FieldByName('lan_recursos').AsString;
         edtQuanto.Value := FieldByName('lan_quanto').AsFloat;

         dtDataRealizada.Date   := FieldByName('lan_datarealizada').AsDateTime;
         mmoVerificacaoImpl.Text:= FieldByName('lan_verimplantacao').AsString;
         dtPrevista.Date        := FieldByName('lan_dtprevista').AsDateTime;
         dtFinalizar.Date       := FieldByName('lan_dtfinalizado').AsDateTime;
         mmoObsCheck.Text       := FieldByName('lan_chkobs').AsString;

         if FieldByName('lan_quem').AsString <> EmptyStr then begin
            dblQuem.KeyValue:= FieldByName('lan_quem').AsString;
         end;
      end;
   end;

   if pctPDCA.TabIndex = 2 then begin // Documentos
      with cdsDocs do begin
         edtDocumento.Text := FieldByName('pdca_descricao').AsString;
         edtCaminho.Text:= FieldByName('pdca_caminho').AsString;
      end;

      ControlarBotaoVisualiza(Self);

//      if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
//         sbVisualizarDoc.Enabled:= True;
//      end
//      else begin
//         sbVisualizarDoc.Enabled:= False;
//      end;
   end;
end;

procedure TFormPDCA.tsLancamentosShow(Sender: TObject);
begin
   PreencherCampos();

//   edtCodLanc1.Text:= edtCodigo.Text;
//   dtDataLanc.Date := dtData.Date;
end;

procedure TFormPDCA.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'def_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'def_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT P.pdca_identificacao, P.pdca_data, P.pdca_descricao, P.pdca_origem, P.pdca_processo,' +
                    ' P.pdca_emitido, TC.valo_com as Origem, PR.nome_pro as Processo,' +
                    ' L.lan_codigo, L.pdca_codigo, L.lan_oque, L.lan_onde, L.lan_porque, L.lan_quando,' +
                    ' L.lan_como, L.lan_quem, L.lan_recursos, L.lan_quanto, L.lan_datarealizada,' +
                    ' L.lan_verimplantacao, L.lan_status, C.nome_col as Quem,' +
                    ' L.lan_dtfinalizado, L.lan_chkobs, L.lan_dtprevista' +
                    ' FROM pdca_lanc L' +
                    ' INNER JOIN colaboradores C ON C.codi_col = lan_quem' +
                    ' INNER JOIN pdca P ON P.pdca_codigo = L.pdca_codigo' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 27 AND TC.codi_com = P.pdca_origem' +
                    ' LEFT JOIN processos PR ON PR.codi_pro = P.pdca_processo' +
                    ' WHERE P.pdca_codigo = ' + cdsPDCA.FieldByName('pdca_codigo').AsString +
                    ' ORDER BY P.pdca_identificacao, L.lan_quando, L.lan_datarealizada';
//                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_PDCA.fr3');

      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
         PrintOptions.ShowDialog:= True;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

procedure TFormPDCA.mmoOqueKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

function TFormPDCA.ValidarCampos: Boolean;
begin
   if pctPDCA.TabIndex = 0 then begin // PDCA
      if dtData.Text = '  /  /    ' then begin
         Application.MessageBox('Campo Data é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dtData);
         Result:= False;
         Exit;
      end;

      if edtDescricao.Text = EmptyStr then begin
         Application.MessageBox('Campo Descrição do PDCA é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtDescricao);
         Result:= False;
         Exit;
      end;

      if dblOrigem.KeyValue = -1 then begin
         Application.MessageBox('Campo Origem é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblOrigem);
         Result:= False;
         Exit;
      end;

      if dblProcesso.KeyValue = -1 then begin
         Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblProcesso);
         Result:= False;
         Exit;
      end;

      if dblEmitido.KeyValue = -1 then begin
         Application.MessageBox('Campo Emitido por é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblEmitido);
         Result:= False;
         Exit;
      end;
   end;

   if pctPDCA.TabIndex = 1 then begin // Lançamentos
      if mmoOque.Text = EmptyStr then begin
         Application.MessageBox('Campo Descrição da Ação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(mmoOque);
         Result:= False;
         Exit;
      end;

      if mmoPorque.Text = EmptyStr then begin
         Application.MessageBox('Campo Porque? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(mmoPorque);
         Result:= False;
         Exit;
      end;

      if edtOnde.Text = EmptyStr then begin
         Application.MessageBox('Campo Onde? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtOnde);
         Result:= False;
         Exit;
      end;

      if dtQuando.Text = '  /  /    ' then begin
         Application.MessageBox('Campo Quando? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dtQuando);
         Result:= False;
         Exit;
      end;

      if dblQuem.KeyValue = -1 then begin
         Application.MessageBox('Campo Quem é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblQuem);
         Result:= False;
         Exit;
      end;

      if mmoComo.Text = EmptyStr then begin
         Application.MessageBox('Campo Como? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(mmoComo);
         Result:= False;
         Exit;
      end;

      if mmoRecursos.Text = EmptyStr then begin
         Application.MessageBox('Campo Recursos é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(mmoRecursos);
         Result:= False;
         Exit;
      end;
   end;

   if pctPDCA.TabIndex = 2 then begin // Documentos
      if edtDocumento.Text = EmptyStr then begin
         Application.MessageBox('Campo Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtDocumento);
         Result:= False;
         Exit;
      end;

      if edtCaminho.Text = EmptyStr then begin
         Application.MessageBox('Campo Caminho do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtCaminho);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;
end.
