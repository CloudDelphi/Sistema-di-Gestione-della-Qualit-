unit frm_CadPMCFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, jpeg, JvExComCtrls, JvComCtrls;

type
  TFormCadPMCFecha = class(TForm)
    pctFechaPMC: TJvgPageControl;
    tsAcoes: TTabSheet;
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryPMC: TZQuery;
    dspPMC: TDataSetProvider;
    cdsPMC: TClientDataSet;
    dsPMC: TDataSource;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    dblTipo: TDBLookupComboBox;
    lbl5: TLabel;
    edtIdentificacao: TEdit;
    lbl1: TLabel;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    dspTipo: TDataSetProvider;
    zqryTipo: TZQuery;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    opd1: TOpenDialog;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    lbl16: TLabel;
    dblProcesso: TDBLookupComboBox;
    dblResponsavel: TDBLookupComboBox;
    lbl3: TLabel;
    dblProcede: TDBLookupComboBox;
    lbl8: TLabel;
    zqryEmitido: TZQuery;
    dspEmitido: TDataSetProvider;
    cdsEmitido: TClientDataSet;
    dsEmitido: TDataSource;
    zqryProcede: TZQuery;
    dspProcede: TDataSetProvider;
    cdsProcede: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsProcede: TDataSource;
    zqryOrigem: TZQuery;
    dspOrigem: TDataSetProvider;
    cdsOrigem: TClientDataSet;
    LargeintField3: TLargeintField;
    WideStringField3: TWideStringField;
    dsOrigem: TDataSource;
    dtData: TDateEdit;
    dblEmitido: TDBLookupComboBox;
    lbl7: TLabel;
    edtReqNorma: TEdit;
    lbl11: TLabel;
    dblOrigem: TDBLookupComboBox;
    mmoNaoConformidade: TMemo;
    lbl4: TLabel;
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsResponsavel: TDataSource;
    cdsPMCDescTipo: TStringField;
    cdsPMCDescResp: TStringField;
    lbl12: TLabel;
    mmoAcaoContencao: TMemo;
    mmoCausa: TMemo;
    lbl13: TLabel;
    lbl14: TLabel;
    mmoEficacia: TMemo;
    lbl15: TLabel;
    dtDataEficacia: TDateEdit;
    lbl17: TLabel;
    dblEficaz: TDBLookupComboBox;
    lbl9: TLabel;
    edtIdentificacaoAcao: TEdit;
    dtDataAcao: TDateEdit;
    lbl10: TLabel;
    cdsPMCpmc_dataFecha: TDateTimeField;
    cdsImprimirpmc_dataFecha: TDateTimeField;
    cdsImprimirDescEficaz: TWideStringField;
    cdsImprimirNomeRespAcao: TStringField;
    cdsImprimirDescTipo: TStringField;
    cdsImprimirDescOrigem: TStringField;
    cdsImprimirNomeResp: TStringField;
    cdsImprimirNomeEmit: TStringField;
    cdsImprimirProcede: TStringField;
    zqryPMC_Acoes: TZQuery;
    dspPMC_Acoes: TDataSetProvider;
    cdsPMC_Acoes: TClientDataSet;
    cdsPMC_AcoesRespNome: TStringField;
    cdsPMC_AcoesDescricao: TStringField;
    dsPMC_Acoes: TDataSource;
    zqryResponsavelAcao: TZQuery;
    dspResponsavelAcao: TDataSetProvider;
    cdsResponsavelAcao: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsResponsavelAcao: TDataSource;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    zqryEficaz: TZQuery;
    dspEficaz: TDataSetProvider;
    cdsEficaz: TClientDataSet;
    cds2: TLargeintField;
    cds3: TWideStringField;
    dsEficaz: TDataSource;
    frxReport1: TfrxReport;
    frxDBPMCFecha: TfrxDBDataset;
    lbl23: TLabel;
    dblClientes: TDBLookupComboBox;
    lbl24: TLabel;
    dblForn: TDBLookupComboBox;
    cdsPMCpmc_cliente: TIntegerField;
    zqryClientes: TZQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientescli_codigo: TIntegerField;
    cdsClientescli_nome: TWideStringField;
    dsClientes: TDataSource;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    tsAnalise: TTabSheet;
    mmoMeioAmbiente: TMemo;
    mmoMaquina: TMemo;
    mmoMetodo: TMemo;
    mmoMedicao: TMemo;
    mmoMaoObra: TMemo;
    mmoMateriaPrima: TMemo;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    mmoProblema: TMemo;
    img1: TImage;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    lbl25: TLabel;
    edtIdentIshikawa: TEdit;
    lbl26: TLabel;
    dtIshikawa: TDateEdit;
    pnl10: TPanel;
    zqryIshikawa: TZQuery;
    dspIshikawa: TDataSetProvider;
    cdsIshikawa: TClientDataSet;
    dsIshikawa: TDataSource;
    lbl27: TLabel;
    edtCaminho: TEdit;
    sbVisualizar: TSpeedButton;
    cdsResponsavelcol_email: TWideStringField;
    cdsEmitidocol_email: TWideStringField;
    lbl28: TLabel;
    edtPMCSubs: TEdit;
    cdsPMCpmc_substituto: TWideStringField;
    sbVisualizarNC: TSpeedButton;
    pnlNaoConformidade: TPanel;
    pnl12: TPanel;
    btnFechar: TBitBtn;
    mmoNaoConformidadeBig: TMemo;
    cdsPMCorig_pmc: TLargeintField;
    cdsPMCcodi_pmc: TLargeintField;
    cdsPMCdata_pmc: TDateTimeField;
    cdsPMCemit_pmc: TLargeintField;
    cdsPMCtipo_pmc: TLargeintField;
    cdsPMCncon_pmc: TWideMemoField;
    cdsPMCproc_pmc: TLargeintField;
    cdsPMCresp_pmc: TLargeintField;
    cdsPMCprcs_pmc: TLargeintField;
    cdsPMCrequ_pmc: TWideStringField;
    cdsPMCnume_pmc: TWideStringField;
    cdsPMCefic_pmc: TLargeintField;
    cdsPMCimed_pmc: TWideMemoField;
    cdsPMCcaus_pmc: TWideMemoField;
    cdsPMCvefi_pmc: TWideMemoField;
    cdsImprimircodi_pmc: TLargeintField;
    cdsImprimirdata_pmc: TDateTimeField;
    cdsImprimiremit_pmc: TLargeintField;
    cdsImprimirtipo_pmc: TLargeintField;
    cdsImprimirorig_pmc: TLargeintField;
    cdsImprimirncon_pmc: TWideMemoField;
    cdsImprimirproc_pmc: TLargeintField;
    cdsImprimirresp_pmc: TLargeintField;
    cdsImprimirefic_pmc: TLargeintField;
    cdsImprimirprcs_pmc: TLargeintField;
    cdsImprimirimed_pmc: TWideMemoField;
    cdsImprimircaus_pmc: TWideMemoField;
    cdsImprimirvefi_pmc: TWideMemoField;
    cdsImprimirrequ_pmc: TWideStringField;
    cdsImprimirnume_pmc: TWideStringField;
    cdsImprimirpmc_cliente: TIntegerField;
    cdsImprimirpmc_fechado: TIntegerField;
    cdsImprimirpmc_arq_evidencia: TWideMemoField;
    cdsImprimirpmc_substituto: TWideStringField;
    cdsImprimircodi_aco: TLargeintField;
    cdsImprimirdesc_aco: TWideMemoField;
    cdsImprimirresp_aco: TLargeintField;
    cdsImprimirvimp_aco: TWideMemoField;
    cdsPMC_Acoesarqu_aco: TWideStringField;
    cdsPMC_Acoesdesc_aco: TWideMemoField;
    cdsPMC_Acoescodi_aco: TLargeintField;
    cdsPMC_Acoescodi_pmc: TLargeintField;
    cdsPMC_Acoesresp_aco: TLargeintField;
    cdsPMC_Acoesvimp_aco: TWideMemoField;
    pnlEmail: TPanel;
    lbl29: TLabel;
    lbl30: TLabel;
    lblNomeCol: TLabel;
    pnl11: TPanel;
    btnSairEmail: TBitBtn;
    btnGravarEmail: TBitBtn;
    pnl13: TPanel;
    edtEmail: TEdit;
    cdsIshikawaish_codigo: TIntegerField;
    cdsIshikawaish_codigopmc: TIntegerField;
    cdsIshikawaish_meioambiente: TWideMemoField;
    cdsIshikawaish_maquina: TWideMemoField;
    cdsIshikawaish_metodo: TWideMemoField;
    cdsIshikawaish_medicao: TWideMemoField;
    cdsIshikawaish_maodeobra: TWideMemoField;
    cdsIshikawaish_materiaprima: TWideMemoField;
    cdsIshikawaish_problema: TWideMemoField;
    cdsPMCpmc_arq_evidencia: TWideMemoField;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    zqryIshikawaImp: TZQuery;
    dspIshikawaImp: TDataSetProvider;
    cdsIshikawaImp: TClientDataSet;
    frxDBIshikawa: TfrxDBDataset;
    cdsIshikawaImpish_codigo: TIntegerField;
    cdsIshikawaImpish_codigopmc: TIntegerField;
    cdsIshikawaImpish_meioambiente: TWideMemoField;
    cdsIshikawaImpish_maquina: TWideMemoField;
    cdsIshikawaImpish_metodo: TWideMemoField;
    cdsIshikawaImpish_medicao: TWideMemoField;
    cdsIshikawaImpish_maodeobra: TWideMemoField;
    cdsIshikawaImpish_materiaprima: TWideMemoField;
    cdsIshikawaImpish_problema: TWideMemoField;
    cdsIshikawaImpnume_pmc: TWideStringField;
    cdsIshikawaImpdata_pmc: TDateTimeField;
    cdsFornforn_codigo: TIntegerField;
    cdsFornforn_nome: TWideStringField;
    cdsImprimirpmc_cea: TIntegerField;
    cdsImprimircli_nome: TWideStringField;
    cdsImprimirforn_nome: TWideStringField;
    cdsImprimirpmc_fornecedor: TIntegerField;
    cdsPMCpmc_fornecedor: TIntegerField;
    cdsImprimirnome_pro: TWideStringField;
    cdsPMC_Acoesaco_prazo: TDateTimeField;
    cdsImprimiraco_prazo: TDateTimeField;
    dtPrevEficacia: TDateEdit;
    lbl31: TLabel;
    cdsPMCpmc_preveficacia: TDateTimeField;
    cdsImprimirpmc_preveficacia: TDateTimeField;
    lbl32: TLabel;
    dblFase: TDBLookupComboBox;
    zqryFasePMC: TZQuery;
    dspFasePMC: TDataSetProvider;
    cdsFasePMC: TClientDataSet;
    LargeintField5: TLargeintField;
    WideStringField5: TWideStringField;
    dsFasePMC: TDataSource;
    pnlDataPrevEficacia: TPanel;
    lbl33: TLabel;
    pnl15: TPanel;
    btnSairVerEfic: TBitBtn;
    btnGravarVerEfic: TBitBtn;
    pnl16: TPanel;
    dtVerEfic: TDateEdit;
    sbTextoMeioAmbiente: TSpeedButton;
    sbTextoMaquina: TSpeedButton;
    sbTextoMetodo: TSpeedButton;
    sbTextoMateriaPrima: TSpeedButton;
    sbTextoMaodeObra: TSpeedButton;
    sbTextoMedicao: TSpeedButton;
    btnEmail: TBitBtn;
    pnlEmailAcoes: TPanel;
    pnl17: TPanel;
    btnSairEmailAcoes: TBitBtn;
    pnl18: TPanel;
    rgTipoAcao: TRadioGroup;
    btnEnviarEmail: TBitBtn;
    rgEnvioAcao: TRadioGroup;
    lblMsg: TLabel;
    lblMsg2: TLabel;
    btnPDCA: TBitBtn;
    sbVisualizarAcao: TSpeedButton;
    sbVisualizaCausa: TSpeedButton;
    mmoTexto: TMemo;
    btnFecharTexto: TBitBtn;
    dbgAcoesPMC: TDBGrid;
    pctAcoes: TJvgPageControl;
    tsAcaoDados: TTabSheet;
    tsEvidencia: TTabSheet;
    lbl22: TLabel;
    dbgEvidencias: TDBGrid;
    sbArquivo: TSpeedButton;
    sbVisualizar1: TSpeedButton;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    mmoDescricaoAcao: TMemo;
    dtPrazoAcao: TDateEdit;
    dblResponsavelAcao: TDBLookupComboBox;
    mmoVerificacaoAcao: TMemo;
    sbAcao: TSpeedButton;
    sbVerifImpl: TSpeedButton;
    zqryAcoes_Evidencias: TZQuery;
    dspAcoes_Evidencias: TDataSetProvider;
    cdsAcoes_Evidencias: TClientDataSet;
    dsAcoes_Evidencias: TDataSource;
    btnExcliurEvidencia: TBitBtn;
    btnInserirEvidencia: TBitBtn;
    mmoArquivo: TMemo;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(Flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgAcoesPMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgAcoesPMCCellClick(Column: TColumn);
    procedure ControlarAbas;
    procedure pctFechaPMCChange(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoNaoConformidadeKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizarAcoes();
    procedure tsAcoesEnter(Sender: TObject);
    procedure tsAcoesShow(Sender: TObject);
    procedure cdsPMC_AcoesCalcFields(DataSet: TDataSet);
    procedure BuscarNovoCodigoAcao();
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos();
    procedure sbArquivoClick(Sender: TObject);
    procedure mmoDescricaoAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure mmoVerificacaoAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure sbVisualizar1Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BuscarNovoCodigoIshikawa();
    procedure AtualizarIshikawa();
    procedure sbVisualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure sbVisualizarNCClick(Sender: TObject);
    procedure mmoNaoConformidadeBigKeyPress(Sender: TObject; var Key: Char);
    procedure PrepararEmail();
    procedure PrepararEmailAcoes(TodosSN: string);
    procedure btnGravarEmailClick(Sender: TObject);
    procedure btnSairEmailClick(Sender: TObject);
    procedure VerificarFasePMC();
    procedure mmoEficaciaEnter(Sender: TObject);
    procedure btnGravarVerEficClick(Sender: TObject);
    procedure sbTextoMeioAmbienteClick(Sender: TObject);
    procedure sbTextoMaquinaClick(Sender: TObject);
    procedure sbTextoMetodoClick(Sender: TObject);
    procedure InserirTexto(Titulo: string; Texto: string);
    procedure sbTextoMedicaoClick(Sender: TObject);
    procedure sbTextoMaodeObraClick(Sender: TObject);
    procedure sbTextoMateriaPrimaClick(Sender: TObject);
    procedure sbAcaoClick(Sender: TObject);
    procedure sbVerifImplClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnSairEmailAcoesClick(Sender: TObject);
    procedure EnviarEmailAcoes();
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnPDCAClick(Sender: TObject);
    procedure sbVisualizarAcaoClick(Sender: TObject);
    procedure sbVisualizaCausaClick(Sender: TObject);
    procedure btnFecharTextoClick(Sender: TObject);
    procedure AtualizarEvidencias();
    procedure pctAcoesChange(Sender: TObject);
    procedure btnInserirEvidenciaClick(Sender: TObject);
    procedure btnExcliurEvidenciaClick(Sender: TObject);
    procedure dbgEvidenciasCellClick(Column: TColumn);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sNovoCodigoAcao: string;
    sNovoCodigoIshikawa: string;
    sEmailAcao: string;
  public
    { Public declarations }
    sCodigoPMC: string;
    iTela: Integer;
  end;

var
  FormCadPMCFecha: TFormCadPMCFecha;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_Tartaruga,
  frm_CadPMCConsulta, frm_CadPMCAbre, frm_VisualizaPMC, WebBrowser, frm_PDCA;

{$R *.dfm}

procedure TFormCadPMCFecha.AtualizarAcoes;
var
   sCodiAcao: string;
begin
   edtIdentificacaoAcao.Text:= edtIdentificacao.Text;
   dtDataAcao.Date          := dtData.Date;

   if cOperacao = 'I' then begin
      sCodiAcao:= sNovoCodigoAcao;
   end
   else begin
      sCodiAcao:= cdsPMC_Acoescodi_aco.AsString;
   end;

   with cdsPMC_Acoes do begin
      Active:= False;
      CommandText:= ' SELECT arqu_aco, desc_aco, codi_aco, codi_pmc, aco_prazo, resp_aco, vimp_aco' +
                    ' FROM pmc_acoes' +
                    ' WHERE codi_pmc = ' + QuotedStr(cdsPMCcodi_pmc.AsString);
      Active:= True;

      if pctFechaPMC.TabIndex = 2 then begin // Ações
         if RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end
         else begin
            AtualizarEvidencias();
         end;
      end;
   end;

   if Alltrim(sCodiAcao) <> EmptyStr then begin
      cdsPMC_Acoes.Locate('codi_aco', sCodiAcao, []);
   end;
end;

procedure TFormCadPMCFecha.AtualizarDados;
var
   sCampo: string;
begin
   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 4' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEmitido do begin
      Active:= False;
      Active:= True;
   end;

   with cdsResponsavel do begin
      Active:= False;
      Active:= True;
   end;

   with cdsResponsavelAcao do begin
      Active:= False;
      Active:= True;
   end;

   with cdsOrigem do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 5' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsProcede do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEficaz do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 21' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsClientes do begin
      Active:= False;
      Active:= True;
   end;

   with cdsForn do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFasePMC do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 28' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsPMC do begin
      Active:= False;
//      if iTela = 3 then begin // Gestão de Riscos
//         sCampo:= 'codi_pmc';
//      end
//      else begin
//         sCampo:= 'codi_pmc';
//      end;
      CommandText:= ' SELECT codi_pmc, data_pmc, emit_pmc, tipo_pmc, orig_pmc, ' +
                    ' ncon_pmc, proc_pmc, resp_pmc,  prcs_pmc, requ_pmc, nume_pmc,' +
                    ' imed_pmc, caus_pmc, vefi_pmc, efic_pmc, pmc_dataFecha, pmc_cliente, ' +
                    ' pmc_fornecedor, pmc_arq_evidencia, pmc_substituto, pmc_preveficacia' +
                    ' FROM pmc' +
                    ' WHERE codi_pmc = ' + sCodigoPMC;
      Active:= True;
//      sCodigoPMC:= FieldByName('codi_pmc').AsString;
   end;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

//   if AllTrim(edtIdentificacao.Text) <> EmptyStr then begin
//      cdsPMC.Locate('nume_pmc', edtIdentificacao.Text,[])
//   end;
end;

procedure TFormCadPMCFecha.AtualizarEvidencias;
begin
   with cdsAcoes_Evidencias do begin
      Active:= False;
      CommandText:= ' SELECT evi_codigo, evi_codacao, evi_arquivo' +
                    ' FROM pmc_acoes_evidencias' +
                    ' WHERE evi_codacao = ' + cdsPMC_Acoes.FieldByName('codi_aco').AsString;
      Active:= True;
   end;
end;

procedure TFormCadPMCFecha.AtualizarIshikawa;
begin
   edtIdentIshikawa.Text:= edtIdentificacao.Text;
   dtIshikawa.Date      := dtData.Date;

   with cdsIshikawa do begin
      Active:= False;
      CommandText:= ' SELECT ish_codigo, ish_codigopmc, ish_meioambiente, ish_maquina, ish_metodo, ' +
                    ' ish_medicao, ish_maodeobra, ish_materiaprima, ish_problema' +
                    ' FROM ishikawa' +
                    ' WHERE ish_codigopmc = ' + QuotedStr(cdsPMCcodi_pmc.AsString);
      Active:= True;

      if RecordCount = 0 then begin
         btnAlterar.Enabled:= False;
      end
      else begin
         btnNovo.Enabled:= False;
      end;
   end;
end;

procedure TFormCadPMCFecha.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;

   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;
   btnEmail.Enabled   := Flag;
   btnPDCA.Enabled    := Flag;

   if pctFechaPMC.TabIndex = 2 then begin
      btnExcluir.Enabled := Flag;
   end
   else begin
      btnExcluir.Enabled := False;
   end;

   if iTela = 4 then begin // Análise de Riscos (Vìnculo de PMC)
      btnNovo.Enabled    := False;
      btnAlterar.Enabled := False;
      btnGravar.Enabled  := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
   end;
end;

procedure TFormCadPMCFecha.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';

   case pctFechaPMC.TabIndex of
      0: begin
         if (Acesso(cUsuario, 10, 'alteracao') = 1) then begin
            HabilitarCampos(True, False);
            TryFocus(mmoAcaoContencao);
            Botoes(False);
         end;
      end;
      2: begin
         if (Acesso(cUsuario, 27, 'alteracao') = 1) then begin // Ações do PMC
            HabilitarCampos(True, False);
            TryFocus(mmoDescricaoAcao);
            Botoes(False);
         end;
      end;
      1: begin
         HabilitarCampos(True, True);
         TryFocus(mmoMeioAmbiente);
         Botoes(False);
      end;
   end;
end;

procedure TFormCadPMCFecha.btnCancelarClick(Sender: TObject);
begin
   case pctFechaPMC.TabIndex of
      0: begin
         AtualizarDados();
         PreencherCampos();
         Botoes(True);
         HabilitarCampos(False, False);
      end;
      2: begin
         AtualizarDados();
         PreencherCampos();
         Botoes(True);
         HabilitarCampos(False, False);
      end;
      1: begin
         PreencherCampos();
         Botoes(True);
         HabilitarCampos(False, False);
         AtualizarIshikawa();
      end;
   end;
end;

procedure TFormCadPMCFecha.btnEmailClick(Sender: TObject);
begin
   lblMsg.Caption := '';
   lblMsg2.Caption:= '';
   AbrePanel(pnlEmailAcoes, Self);
end;

procedure TFormCadPMCFecha.btnEnviarEmailClick(Sender: TObject);
begin
   AtualizarAcoes();

   if cdsPMC_Acoes.RecordCount > 0 then begin
      if rgEnvioAcao.ItemIndex = 0 then begin // Ação Selecionada
         PrepararEmailAcoes('N');
      end
      else begin // Todas as Ações
         PrepararEmailAcoes('S');
      end;
   end;
end;

procedure TFormCadPMCFecha.btnExcliurEvidenciaClick(Sender: TObject);
begin
   Executar(' DELETE FROM pmc_acoes_evidencias' +
            ' WHERE evi_codigo = ' + cdsAcoes_Evidencias.FieldByName('evi_codigo').AsString);
   AtualizarEvidencias();
   mmoArquivo.Clear;
end;

procedure TFormCadPMCFecha.btnExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 27, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM pmc_acoes' +
                          ' WHERE codi_aco = ' + cdsPmc_Acoescodi_aco.AsString +
                          ' and codi_pmc = ' + QuotedStr(sCodigoPMC);
            Execute;
         end;

         AtualizarAcoes();
      end;
   end;
end;

procedure TFormCadPMCFecha.btnFecharClick(Sender: TObject);
begin
   pnlNaoConformidade.Visible:= False;
end;

procedure TFormCadPMCFecha.btnFecharTextoClick(Sender: TObject);
begin
   mmoTexto.Visible      := False;
   btnFecharTexto.Visible:= False;
end;

procedure TFormCadPMCFecha.btnGravarClick(Sender: TObject);
begin
   case pctFechaPMC.TabIndex of
      0: begin // Cadastro
         if dblEficaz.KeyValue = 1 then begin // Opção NÃO
            if edtPMCSubs.Text = EmptyStr then begin
               if Application.MessageBox('O PMC não foi Eficaz. Deseja abrir o PMC substituto ?', 'Novo PMC', MB_YESNO + MB_ICONQUESTION) = IDYES then  begin
                  FormCadPMCAbre:= TFormCadPMCAbre.Create(nil);
                  FormCadPMCAbre.ShowModal;
                  FormCadPMCAbre.Release;
               end;
            end;
         end;

         if ValidarDados() then begin
            try
               VerificarFasePMC();

               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE pmc SET' +
                                ' imed_pmc = ' + QuotedStr(mmoAcaoContencao.Text) + ',' +
                                ' caus_pmc = ' + QuotedStr(mmoCausa.Text) + ',' +
                                ' vefi_pmc = ' + QuotedStr(mmoEficacia.Text) + ',' +
                                ' pmc_dataFecha = ' + ArrumaDataSQL(dtDataEficacia.Date) + ',' +
                                ' efic_pmc = ' + IntToStr(dblEficaz.KeyValue) + ',' +
                                ' proc_pmc = ' + IntToStr(dblProcede.KeyValue) + ',' +
                                ' pmc_substituto = ' + QuotedStr(edtPMCSubs.Text) + ',' +
                                ' pmc_preveficacia = ' + ArrumaDataSQL(dtPrevEficacia.Date) + ',' +
                                ' pmc_fase = ' + IntToStr(dblFase.KeyValue) +
                                ' WHERE codi_pmc = ' + sCodigoPMC;
                  Execute;
               end;

               Auditoria('PMC FECHAMENTO', edtIdentificacao.Text, cOperacao,'');
               AtualizarDados();
               HabilitarCampos(False, False);
               Botoes(True);

               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

               if Application.MessageBox('Deseja enviar um e-mail ao emitente avisando as alterações do PMC ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
                  PrepararEmail();
               end;

//               AtualizarAcoes();
//               if cdsPMC_Acoes.RecordCount > 0 then begin
//                  if Application.MessageBox('Deseja enviar um e-mail aos responsáveis das ações ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
//                     PrepararEmailAcoes();
//                  end;
//               end;
            except
               on E:Exception do begin
                  MostrarErro('Erro ao gravar dados. Verifique', E.Message, Self.Name);
               end;
            end;
         end;
      end;
      1: begin // Ishikawa
         try
            if cOperacao = 'I' then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO ishikawa' +
                                ' (ish_codigo, ish_codigopmc, ish_meioambiente, ish_maquina, ' +
                                ' ish_metodo, ish_medicao, ish_maodeobra, ish_materiaprima, ish_problema)' +
                                ' VALUES( ' +
                                sNovoCodigoIshikawa + ',' +
                                QuotedStr(sCodigoPMC) + ',' +
                                QuotedStr(mmoMeioAmbiente.Text) + ',' +
                                QuotedStr(mmoMaquina.Text) + ',' +
                                QuotedStr(mmoMetodo.Text) + ',' +
                                QuotedStr(mmoMedicao.Text) + ',' +
                                QuotedStr(mmoMaoObra.Text) + ',' +
                                QuotedStr(mmoMateriaPrima.Text) + ',' +
                                QuotedStr(mmoProblema.Text) +
                                ')';

                  Execute;
               end;
            end
            else begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE ishikawa SET' +
                                ' ish_meioambiente = ' + QuotedStr(mmoMeioAmbiente.Text) + ',' +
                                ' ish_maquina = ' + QuotedStr(mmoMaquina.Text) + ',' +
                                ' ish_metodo = ' + QuotedStr(mmoMetodo.Text) + ',' +
                                ' ish_medicao = ' + QuotedStr(mmoMedicao.Text) + ',' +
                                ' ish_maodeobra = ' +  QuotedStr(mmoMaoObra.Text) + ',' +
                                ' ish_materiaprima = ' +  QuotedStr(mmoMateriaPrima.Text) + ',' +
                                ' ish_problema = ' +  QuotedStr(mmoProblema.Text) +
                                ' WHERE ish_codigo = ' + cdsIshikawaish_codigo.AsString;
                  Execute;
               end;
            end;

            Auditoria('ISHIKAWA', edtIdentIshikawa.Text, cOperacao,'');
            AtualizarIshikawa();

            HabilitarCampos(False, False);
            Botoes(True);
            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E:Exception do begin
               MostrarErro('Erro ao gravar dados. Verifique', E.Message, Self.Name);
//               Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
            end;
         end;
      end;
      2: begin // Ações PMC
         if ValidarDados() then begin
            try
               if cOperacao = 'I' then begin
                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' INSERT INTO pmc_acoes' +
                                   ' (codi_aco, codi_pmc, resp_aco, aco_prazo, vimp_aco, desc_aco)' +
                                   ' VALUES( ' +
                                   sNovoCodigoAcao + ',' +
                                   QuotedStr(sCodigoPMC) + ',' +
                                   IntToStr(dblResponsavelAcao.KeyValue) + ',' +
                                   QuotedStr(dtPrazoAcao.Text) + ',' +
                                   QuotedStr(mmoVerificacaoAcao.Text) + ',' +
                                   QuotedStr(mmoDescricaoAcao.Text) + //',' +
//                                   QuotedStr(edtArquivo.Text) +
                                ')';

                     Execute;
                  end;
               end
               else begin
                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' UPDATE pmc_acoes SET' +
                                   ' resp_aco = ' + IntToStr(dblResponsavelAcao.KeyValue) + ',' +
                                   ' aco_prazo = ' + QuotedStr(dtPrazoAcao.Text) + ',' +
                                   ' vimp_aco = ' + QuotedStr(mmoVerificacaoAcao.Text) + ',' +
                                   ' desc_aco = ' + QuotedStr(mmoDescricaoAcao.Text) + // ',' +
//                                   ' arqu_aco = ' +  QuotedStr(edtArquivo.Text) +
                                   ' WHERE codi_aco = ' + cdsPmc_Acoes.FieldByName('codi_aco').AsString +
                                   ' and codi_pmc = ' + QuotedStr(sCodigoPMC);
                     Execute;
                  end;
               end;

               Auditoria('AÇÕES PMC', Copy(mmoDescricaoAcao.Text,1,130) + '-PRAZO:' +
                                      dtPrazoAcao.Text, cOperacao,'');
               AtualizarAcoes();

               HabilitarCampos(False, False);
               Botoes(True);
               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

               // Solicita a gravação da data de previsão de Verificação de Eficácia
               VerificarFasePMC();
               if (dblFase.KeyValue = 5) and (dtPrevEficacia.Text = '  /  /    ') then begin // Verificação de Eficácia
                  AbrePanel(pnlDataPrevEficacia, Self);
                  TryFocus(dtVerEfic);
               end;
            except
               on E:Exception do begin
                  MostrarErro('Erro ao gravar dados. Verifique', E.Message, Self.Name);
//                  Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
               end;
            end;
         end;
      end;
   end;
end;

procedure TFormCadPMCFecha.btnGravarEmailClick(Sender: TObject);
begin
   if pnlEmail.Tag = 1 then begin // E-mail Emitente
      Executar(' UPDATE colaboradores' +
              ' SET col_email = ' + QuotedStr(edtEmail.Text) +
              ' WHERE codi_col = ' + dblEmitido.KeyValue
              );

      pnlEmail.Visible:= False;

      cdsEmitido.Edit;
      cdsEmitidocol_email.AsString:= edtEmail.Text;
      PrepararEmail();
   end;

   if pnlEmail.Tag = 2 then begin // E-mail Ações
      sEmailAcao:= edtEmail.Text;

      Executar(' UPDATE colaboradores' +
              ' SET col_email = ' + QuotedStr(edtEmail.Text) +
              ' WHERE codi_col = ' + cdsPMC_Acoes.FieldByName('resp_aco').AsString
              );

      pnlEmail.Visible:= False;

      try
         EnviarEmail(sTextoEmail, 'Ações do PMC', sEmailAcao, 'sistema');
      except
         on E:Exception do begin
            MostrarErro('Erro ao enviar e-mail de ações. Verifique', E.Message, Self.Name);
         end;
      end;
   end;
end;

procedure TFormCadPMCFecha.btnGravarVerEficClick(Sender: TObject);
begin
   if dtVerEfic.Text = '  /  /    ' then begin
      Application.MessageBox('Digite ou selecione uma data para a previsão da verificação de eficácia do PMC', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dtVerEfic);
      Exit;
   end;

   with cdsGravar do begin
      Active:= False;
      CommandText:= ' UPDATE pmc SET' +
                    ' pmc_preveficacia = ' + ArrumaDataSQL(dtVerEfic.Date) +
                    ' WHERE codi_pmc = ' + sCodigoPMC;
      Execute;
   end;
   pnlDataPrevEficacia.Visible:= False;

   pctFechaPMC.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
end;

procedure TFormCadPMCFecha.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPMCFecha.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadPMCFecha.btnInserirEvidenciaClick(Sender: TObject);
begin
   Executar(' INSERT INTO pmc_acoes_evidencias VALUES(' +
            BuscarNovoCodigo('pmc_acoes_evidencias', 'evi_codigo') + ',' +
            cdsPMC_Acoes.FieldByName('codi_aco').AsString + ',' +
            QuotedStr(mmoArquivo.Text) +
            ')');
   AtualizarEvidencias();
end;

procedure TFormCadPMCFecha.btnNovoClick(Sender: TObject);
begin
   if (pctFechaPMC.TabIndex = 0) or (pctFechaPMC.TabIndex = 2) then begin // Ações do PMC
      if (Acesso(cUsuario, 27, 'cadastro') = 1) then begin // Ações do PMC
         cOperacao:= 'I';
         LimparCampos();
         HabilitarCampos(True, True);
         Botoes(False);
         btnExcluir.Enabled := False;
         btnAlterar.Enabled := False;
         BuscarNovoCodigoAcao();
         dtData.Date:= Date();
         if pctFechaPMC.TabIndex = 0 then begin
            TryFocus(edtIdentificacao);
         end
         else begin
            TryFocus(mmoDescricaoAcao);
         end;
      end;
   end;

   if pctFechaPMC.TabIndex = 1 then begin // Ishikawa
      cOperacao:= 'I';
      LimparCampos();
      HabilitarCampos(True, True);
      Botoes(False);
      BuscarNovoCodigoIshikawa();
      mmoProblema.Text:= mmoNaoConformidade.Text;

      TryFocus(mmoMeioAmbiente);
   end;
end;

procedure TFormCadPMCFecha.btnPDCAClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      AbrirForm(TFormPDCA, FormPDCA, 4);
   end;
end;

procedure TFormCadPMCFecha.btnPrimeiroClick(Sender: TObject);
begin
   cdsPMC.First;
   PreencherCampos();
end;

procedure TFormCadPMCFecha.btnAnteriorClick(Sender: TObject);
begin
   cdsPMC.Prior;
   PreencherCampos();
end;

procedure TFormCadPMCFecha.btnProximoClick(Sender: TObject);
begin
   cdsPMC.Next;
   PreencherCampos();
end;

procedure TFormCadPMCFecha.btnUltimoClick(Sender: TObject);
begin
   cdsPMC.Last;
   PreencherCampos();
end;

procedure TFormCadPMCFecha.btnSairClick(Sender: TObject);
begin
   if iTela = 1 then begin // Tela de Visualizar PMC do Tartaruga
      dm.cdsPMC.Active:= False;
      dm.cdsPMC.Active:= True;
      FormTartaruga.VerificaPendencias;
      if not (FormVisualizaPMC = nil) then begin
         FormVisualizaPMC.AtualizarDados();
      end;
   end;
   if iTela = 2 then begin // Tela de Consulta de PMC
      with FormCadPMCConsulta do begin
         CarregaValores();
         cdsPMC.Locate('nume_pmc', edtIdentificacao.Text, [loCaseInsensitive]);
      end;
   end;

//   if not (FormVisualizaPMC = nil) then begin
//      FormVisualizaPMC.AtualizarDados();
//   end;

   Self.Close;
end;

procedure TFormCadPMCFecha.btnSairEmailAcoesClick(Sender: TObject);
begin
   pnlEmailAcoes.Visible:= False;
end;

procedure TFormCadPMCFecha.btnSairEmailClick(Sender: TObject);
begin
   pnlEmail.Visible:= False;
end;

procedure TFormCadPMCFecha.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPMCFecha.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPMCFecha.BuscarNovoCodigoAcao;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_aco) as codigo FROM pmc_acoes';
      Active:= True;
      if RecordCount = 0 then begin
         sNovoCodigoAcao:= '1'
      end
      else begin
         sNovoCodigoAcao:= IntToStr(FieldByName('codigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadPMCFecha.BuscarNovoCodigoIshikawa;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(ish_codigo) as codigo FROM ishikawa';
      Active:= True;

      if RecordCount = 0 then begin
         sNovoCodigoIshikawa:= '1';
      end
      else begin
         sNovoCodigoIshikawa:= IntToStr(FieldByName('codigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadPMCFecha.cdsPMC_AcoesCalcFields(DataSet: TDataSet);
begin
   cdsPMC_Acoes.FieldByName('Descricao').AsString:= Copy(cdsPMC_Acoes.FieldByName('desc_aco').AsString,1,70);
end;

procedure TFormCadPMCFecha.ControlarAbas;
begin
   mmoTexto.Visible:=False;

   case pctFechaPMC.TabIndex of
      0: begin// Cadastro
         Botoes(True);
         btnNovo.Visible    := False;
         btnExcluir.Visible := False;
         btnImprimir.Visible:= True;
         btnEmail.Visible   := False;
         PreencherCampos();
         AtualizarAcoes();
      end;
      1: begin // Ishikawa
         btnNovo.Visible    := True;
         btnExcluir.Visible := False;
//         btnImprimir.Visible:= False;
         btnEmail.Visible   := False;
         Botoes(True);
         HabilitarCampos(False, False);

         AtualizarIshikawa();
         PreencherCampos();
      end;
      2: begin // Ações
         if (Acesso(cUsuario, 27, 'acesso') = 1) then begin
            btnNovo.Visible    := True;
            btnExcluir.Visible := True;
            btnImprimir.Visible:= False;
            btnEmail.Visible   := True;
            Botoes(True);

            AtualizarAcoes();
            PreencherCampos();
         end
         else begin
            pctFechaPMC.TabIndex:= 0
         end;
      end;
   end;
end;

procedure TFormCadPMCFecha.dbgAcoesPMCCellClick(Column: TColumn);
begin
   AtualizarEvidencias();
   PreencherCampos();
end;

procedure TFormCadPMCFecha.dbgAcoesPMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos();
end;

procedure TFormCadPMCFecha.dbgEvidenciasCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadPMCFecha.FormShow(Sender: TObject);
begin
   pctFechaPMC.TabIndex:= 0;
   pctAcoes.TabIndex   := 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible        := False;
   pnlNaoConformidade.Visible := False;
   pnlEmail.Visible           := False;
   pnlDataPrevEficacia.Visible:= False;
   rgTipoAcao.ItemIndex := 0;
   rgEnvioAcao.ItemIndex:= 0;
   lblMsg.Caption := '';
   lblMsg2.Caption:= '';
   btnEmail.Visible:= False;
   VerificarFasePMC();
end;

procedure TFormCadPMCFecha.HabilitarCampos(Flag, Codigo: Boolean);
begin
   case pctFechaPMC.TabIndex of
      0: begin
         mmoAcaoContencao.Enabled:= Flag;
         dtPrevEficacia.Enabled  := Flag;
         dtDataEficacia.Enabled  := Flag;
         dblEficaz.Enabled       := Flag;
         mmoCausa.Enabled        := Flag;
         mmoEficacia.Enabled     := Flag;
         dblProcede.Enabled      := Flag;
         edtPMCSubs.Enabled      := Flag;

         pctFechaPMC.Pages[1].TabVisible:= not Flag;
         pctFechaPMC.Pages[2].TabVisible:= not Flag;
      end;
      2: begin
         mmoDescricaoAcao.Enabled  := Flag;
         dtPrazoAcao.Enabled       := Flag;
         dblResponsavelAcao.Enabled:= Flag;
         mmoVerificacaoAcao.Enabled:= Flag;
         mmoArquivo.Enabled        := Flag;
//         sbArquivo.Enabled         := Flag;
      end;
      1: begin
         mmoMeioAmbiente.Enabled:= Flag;
         mmoMaquina.Enabled     := Flag;
         mmoMetodo.Enabled      := Flag;
         mmoMedicao.Enabled     := Flag;
         mmoMaoObra.Enabled     := Flag;
         mmoMateriaPrima.Enabled:= Flag;
         mmoProblema.Enabled    := Flag;
      end;
   end;
end;

procedure TFormCadPMCFecha.mmoDescricaoAcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadPMCFecha.mmoEficaciaEnter(Sender: TObject);
begin
   if dblFase.KeyValue <= 4 then begin
      Application.MessageBox('Para cadastrar a Verificação de Eficácia deve-se finalizar todas as ações', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoAcaoContencao);
   end;
end;

procedure TFormCadPMCFecha.mmoNaoConformidadeBigKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= #0;
end;

procedure TFormCadPMCFecha.mmoNaoConformidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadPMCFecha.mmoVerificacaoAcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadPMCFecha.pctAcoesChange(Sender: TObject);
begin
   if pctAcoes.TabIndex = 0 then begin
      Botoes(True);
   end
   else begin
      btnNovo.Enabled    := False;
      btnAlterar.Enabled := False;
      btnExcluir.Enabled := False;
      btnGravar.Enabled  := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnEmail.Enabled   := False;
      btnPDCA.Enabled    := False;
      PreencherCampos();
   end;
end;

procedure TFormCadPMCFecha.pctFechaPMCChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadPMCFecha.PreencherCampos;
begin
   case pctFechaPMC.TabIndex of
      0: begin
         with cdsPMC do begin
            edtIdentificacao.Text     := FieldByName('nume_pmc').AsString;
            dtData.Date               := FieldByName('data_pmc').AsDateTime;
            edtReqNorma.Text          := FieldByName('requ_pmc').AsString;
            mmoNaoConformidade.Text   := FieldByName('ncon_pmc').AsString;
            mmoNaoConformidadeBig.Text:= FieldByName('ncon_pmc').AsString;
            edtCaminho.Text           := FieldByName('pmc_arq_evidencia').AsString;

            mmoAcaoContencao.Text     := FieldByName('imed_pmc').AsString;
            mmoCausa.Text             := FieldByName('caus_pmc').AsString;
            mmoEficacia.Text          := FieldByName('vefi_pmc').AsString;
            dtPrevEficacia.Date       := FieldByName('pmc_preveficacia').AsDateTime;
            dtDataEficacia.Date       := FieldByName('pmc_dataFecha').AsDateTime;
            edtPMCSubs.Text           := FieldByName('pmc_substituto').AsString;

            if FieldByName('emit_pmc').AsString <> EmptyStr then begin
               dblEmitido.KeyValue:= FieldByName('emit_pmc').AsString;
            end;

            if FieldByName('tipo_pmc').AsString <> EmptyStr then begin
               dblTipo.KeyValue:= FieldByName('tipo_pmc').AsString;
            end;

            if FieldByName('prcs_pmc').AsString <> EmptyStr then begin
               dblProcesso.KeyValue:= FieldByName('prcs_pmc').AsString;
            end;

            if FieldByName('orig_pmc').AsString <> EmptyStr then begin
               dblOrigem.KeyValue:= FieldByName('orig_pmc').AsString;
            end;

            if FieldByName('prcs_pmc').AsString <> EmptyStr then begin
               dblProcesso.KeyValue:= FieldByName('prcs_pmc').AsString;
            end;

            if FieldByName('resp_pmc').AsString <> EmptyStr then begin
               dblResponsavel.KeyValue:= FieldByName('resp_pmc').AsString;
            end;

            if FieldByName('proc_pmc').AsString <> EmptyStr then begin
               dblProcede.KeyValue:= FieldByName('proc_pmc').AsString;
            end;

            if FieldByName('efic_pmc').AsString <> EmptyStr then begin
               dblEficaz.KeyValue:= FieldByName('efic_pmc').AsString;
            end;

            if FieldByName('pmc_cliente').AsString <> EmptyStr then begin
               dblClientes.KeyValue:= FieldByName('pmc_cliente').AsString;
            end;

            if FieldByName('pmc_fornecedor').AsString <> EmptyStr then begin
               dblForn.KeyValue:= FieldByName('pmc_fornecedor').AsString;
            end;
         end;

         ControlarBotaoVisualiza(Self);
         VerificarFasePMC();
      end;
      2: begin
         with cdsPMC_Acoes do begin
            mmoDescricaoAcao.Text      := FieldByName('desc_aco').AsString;
            dtPrazoAcao.Text           := FieldByName('aco_prazo').AsString;
            dblResponsavelAcao.KeyValue:= FieldByName('resp_aco').AsString;
            mmoVerificacaoAcao.Text    := FieldByName('vimp_aco').AsString;
//            mmoArquivo.Text            := FieldByName('arqu_aco').AsString;
         end;

         if cdsPMC_Acoes.RecordCount > 0 then begin
            with cdsAcoes_Evidencias do begin
               mmoArquivo.Text:= FieldByName('evi_arquivo').AsString;
            end;
         end;

         if AllTrim(mmoArquivo.Text) <> EmptyStr then begin
            sbVisualizar1.Enabled:= True;
         end
         else begin
            sbVisualizar1.Enabled:= False;
         end;
      end;
      1: begin
         with cdsIshikawa do begin
            mmoMeioAmbiente.Text:= FieldByName('ish_meioambiente').AsString;
            mmoMaquina.Text     := FieldByName('ish_maquina').AsString;
            mmoMetodo.Text      := FieldByName('ish_metodo').AsString;
            mmoMaquina.Text     := FieldByName('ish_maquina').AsString;
            mmoMedicao.Text     := FieldByName('ish_medicao').AsString;
            mmoMaoObra.Text     := FieldByName('ish_maodeobra').AsString;
            mmoMateriaPrima.Text:= FieldByName('ish_materiaprima').AsString;
            mmoProblema.Text    := FieldByName('ish_problema').AsString;
         end;
      end;
   end;
end;

procedure TFormCadPMCFecha.PrepararEmail;
begin
   if VerificarConexaoInternet(True) then begin
      pnlEmail.Tag:= 1;

      sTextoEmail:= 'O PMC identificado abaixo foi alterado. <br><br>' +
               '<b>PMC:</b> ' + edtIdentificacao.Text + '<br>' +
               '<b>Data PMC:</b> ' + dtData.Text + '<br>' +
               '<b>Não Conformidade:</b> ' + mmoNaoConformidade.Text +
               '<br><br>'+
               'Acesse o sistema Destra Manager para maiores detalhes.';

      if AllTrim(cdsEmitidocol_email.AsString) = EmptyStr then begin
         if Application.MessageBox(PChar('O colaborador ' + dblEmitido.Text + ' não tem e-mail cadastrado no Cadastro de Colaboradores.' + #13#10 + 'Deseja cadastrar o e-mail antes de enviar ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
            edtEmail.Enabled:= True;
            AbrePanel(pnlEmail, Self);
            lblNomeCol.Caption:= dblEmitido.Text;
            TryFocus(edtEmail);
         end;
      end
      else begin
         EnviarEmail(sTextoEmail, 'PMC Alterado', cdsEmitidocol_email.AsString, 'sistema');
      end;
   end;
end;

procedure TFormCadPMCFecha.PrepararEmailAcoes(TodosSN: string);
begin
   if VerificarConexaoInternet(True) then begin
      pnlEmail.Tag:= 2;
      lblMsg.Caption := '';
      lblMsg2.Caption:= '';

      if TodosSN = 'S' then begin
         with cdsPMC_Acoes do begin
            First;
            while not Eof do begin
               EnviarEmailAcoes();
               Next;
            end;
         end;
         PreencherCampos();
      end
      else begin
         EnviarEmailAcoes();
      end;
   end;
end;

procedure TFormCadPMCFecha.EnviarEmailAcoes;
begin
   if ((cdsPMC_Acoes.FieldByName('vimp_aco').AsString = EmptyStr) and (rgTipoAcao.ItemIndex = 0)
      or (rgTipoAcao.ItemIndex = 1)) then begin
      sTextoEmail:= 'Você é responsável por uma ação do PMC identificado abaixo. <br><br>' +
                    '<b>PMC:</b> ' + edtIdentificacao.Text + '<br>' +
                    '<b>Data PMC:</b> ' + dtData.Text + '<br>' +
                    '<b>Não Conformidade:</b> ' + mmoNaoConformidade.Text + '<br><br>' +
                    '<b>Ação:</b> ' + cdsPMC_Acoes.FieldByName('desc_aco').AsString + '<br>' +
                    '<b>Prazo:</b> ' + cdsPMC_Acoes.FieldByName('aco_prazo').AsString +
                    '<br><br>'+
                    'Acesse o sistema Destra Manager para maiores detalhes.';
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT nome_col, col_email ' +
                       ' FROM colaboradores' +
                       ' WHERE codi_col = ' + cdsPMC_Acoes.FieldByName('resp_aco').AsString;
         Active:= True;

         if FieldByName('col_email').AsString = EmptyStr then begin
            if Application.MessageBox(PChar('O colaborador ' + FieldByName('nome_col').AsString + ' não tem e-mail cadastrado no Cadastro de Colaboradores.' + #13#10 + 'Deseja cadastrar o e-mail antes de enviar ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
                  edtEmail.Enabled:= True;
                  AbrePanel(pnlEmail, Self);
                  lblNomeCol.Caption:= FieldByName('nome_col').AsString;
                  TryFocus(edtEmail);
            end;
         end
         else begin
            try
               EnviarEmail(sTextoEmail, 'Ações do PMC', FieldByName('col_email').AsString, 'sistema', 'N');
            except
               on E:Exception do begin
                  MostrarErro('Erro ao enviar e-mail de ações. Verifique', E.Message, Self.Name);
               end;
            end;
         end;
      end;
      lblMsg2.Caption:= 'E-mails enviados';
   end
   else begin
      lblMsg.Caption:= 'Algumas ações não atendem as opções selecionadas';
   end;
end;

procedure TFormCadPMCFecha.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   if OPD1.FileName <> '' then begin
      mmoArquivo.Text:= OPD1.FileName;
      sbVisualizar.Enabled:= True;
   end
   else begin
      sbVisualizar.Enabled:= False;
   end;
end;

procedure TFormCadPMCFecha.sbVisualizarAcaoClick(Sender: TObject);
begin
   mmoTexto.Left := 11;
   mmoTexto.Top  := 106;
   mmoTexto.Width:= mmoAcaoContencao.Width;
   btnFecharTexto.Left:= 347;
   btnFecharTexto.Top := 379;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('AÇÃO DE CONTENÇÃO IMEDIATA', mmoAcaoContencao.Text);
end;

procedure TFormCadPMCFecha.sbVisualizaCausaClick(Sender: TObject);
begin
   mmoTexto.Left := 377;
   mmoTexto.Top  := 104;
   mmoTexto.Width:= mmoCausa.Width;
   btnFecharTexto.Left:= 306;
   btnFecharTexto.Top := 378;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('IDENTIFICAÇÃO DA CAUSA', mmoCausa.Text);
end;

procedure TFormCadPMCFecha.sbTextoMeioAmbienteClick(Sender: TObject);
begin
   mmoTexto.Left := 15;
   mmoTexto.Top  := 30;
   mmoTexto.Width:= 315;
   btnFecharTexto.Left:= 330;
   btnFecharTexto.Top := 303;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('MEIO AMBIENTE', mmoMeioAmbiente.Text);
end;

procedure TFormCadPMCFecha.sbTextoMaquinaClick(Sender: TObject);
begin
   mmoTexto.Left := 203;
   mmoTexto.Top  := 30;
   mmoTexto.Width:= 315;
   btnFecharTexto.Left:= 517;
   btnFecharTexto.Top := 303;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('MÁQUINA', mmoMaquina.Text);
end;

procedure TFormCadPMCFecha.sbTextoMetodoClick(Sender: TObject);
begin
   mmoTexto.Left := 391;
   mmoTexto.Top  := 30;
   mmoTexto.Width:= 315;
   btnFecharTexto.Left:= 319;
   btnFecharTexto.Top := 303;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('MÉTODO', mmoMetodo.Text);
end;

procedure TFormCadPMCFecha.sbTextoMedicaoClick(Sender: TObject);
begin
   mmoTexto.Left := 15;
   mmoTexto.Top  := 255;
   mmoTexto.Width:= 315;
   btnFecharTexto.Left:= 327;
   btnFecharTexto.Top := 528;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('MEDIÇÃO', mmoMedicao.Text);
end;

procedure TFormCadPMCFecha.sbTextoMaodeObraClick(Sender: TObject);
begin
   mmoTexto.Left := 203;
   mmoTexto.Top  := 255;
   mmoTexto.Width:= 315;
   btnFecharTexto.Left:= 515;
   btnFecharTexto.Top := 528;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('MÃO DE OBRA', mmoMaoObra.Text);
end;

procedure TFormCadPMCFecha.sbTextoMateriaPrimaClick(Sender: TObject);
begin
//   AbrePanel(pnlTexto, Self);
   mmoTexto.Left := 392;
   mmoTexto.Top  := 255;
   mmoTexto.Width:= 315;
   btnFecharTexto.Left:= 320;
   btnFecharTexto.Top := 528;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('MATÉRIA PRIMA', mmoMateriaPrima.Text);
end;

procedure TFormCadPMCFecha.sbAcaoClick(Sender: TObject);
begin
   mmoTexto.Left := 11;
   mmoTexto.Top  := 104;
   mmoTexto.Width:= mmoDescricaoAcao.Width;
   btnFecharTexto.Left:= 327;
   btnFecharTexto.Top := 377;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('DESCRIÇÃO DA AÇÃO', mmoDescricaoAcao.Text);
end;

procedure TFormCadPMCFecha.sbVerifImplClick(Sender: TObject);
begin
//   AbrePanel(pnlTexto, Self);
   mmoTexto.Left := 355;
   mmoTexto.Top  := 150;
   mmoTexto.Width:= mmoVerificacaoAcao.Width;
   btnFecharTexto.Left:= 283;
   btnFecharTexto.Top := 423;
   btnFecharTexto.Visible:= True;
   mmoTexto.Visible:= True;
   InserirTexto('VERIFICAÇÃO DA IMPLANTAÇÃO', mmoVerificacaoAcao.Text);
end;

procedure TFormCadPMCFecha.sbVisualizar1Click(Sender: TObject);
begin
   AbrirArquivo(mmoArquivo.Text, Self.Name);
end;

procedure TFormCadPMCFecha.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

procedure TFormCadPMCFecha.sbVisualizarNCClick(Sender: TObject);
begin
   pnlNaoConformidade.Left:= 7;
   pnlNaoConformidade.Top := 170;
   pnlNaoConformidade.Visible := True;
end;

procedure TFormCadPMCFecha.tsAcoesEnter(Sender: TObject);
begin
//   AtualizarAcoes();
end;

procedure TFormCadPMCFecha.tsAcoesShow(Sender: TObject);
begin
   HabilitarCampos(False, False);
end;

function TFormCadPMCFecha.ValidarDados(): Boolean;
begin
   case pctFechaPMC.TabIndex of
      0: begin
         if (mmoAcaoContencao.Text = EmptyStr) and (mmoCausa.Text <> EmptyStr) then begin
            Application.MessageBox('Para cadastrar a Identificação da Causa deve-se definir a Ação de Contenção Imediata', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(mmoAcaoContencao);
            Result:= False;
            Exit;
         end;

         Result:= True;
      end;
      2: begin
         if AllTrim(mmoDescricaoAcao.Text) = EmptyStr then begin
            Application.MessageBox('Campo Descrição da Ação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(mmoDescricaoAcao);
            Result:= False;
            Exit;
         end;

         if dtPrazoAcao.Text = '  /  /    ' then begin
            Application.MessageBox('Campo Prazo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dtPrazoAcao);
            Result:= False;
            Exit;
         end;

         try
            StrToDate(dtPrazoAcao.Text)
         except
            on E:Exception do begin
               Application.MessageBox('Prazo inválido. Verifique.', 'Aviso', MB_OK + MB_ICONWARNING);
            end;
         end;


         if dblResponsavelAcao.KeyValue = -1 then begin
            Application.MessageBox('Campo Responsável pela Ação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblResponsavelAcao);
            Result:= False;
            Exit;
         end;

         Result:= True;
      end;
   end;
end;

procedure TFormCadPMCFecha.VerificarFasePMC;
begin
   pctFechaPMC.Pages[2].TabVisible:= True;
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd' +
                    ' FROM pmc_acoes' +
                    ' WHERE codi_pmc = ' + QuotedStr(cdsPMCcodi_pmc.AsString);
      Active:= True;

      if FieldByName('Qtd').AsInteger = 0 then begin
         dblFase.KeyValue:= 3;
      end
      else begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT COUNT(*) as Qtd' +
                          ' FROM pmc_acoes' +
                          ' WHERE codi_pmc = ' + QuotedStr(cdsPMCcodi_pmc.AsString) +
                          ' AND vimp_aco = ' + QuotedStr('');
            Active:= True;

            if FieldByName('Qtd').AsInteger > 0 then begin
               dblFase.KeyValue:= 4;
            end
            else begin
               dblFase.KeyValue:= 5;
               if (mmoEficacia.Text <> EmptyStr) AND (dtDataEficacia.Text <> '  /  /    ') then begin
                  dblFase.KeyValue:= 6;
               end;
            end;
         end;
      end;
   end;

   if mmoCausa.Text = EmptyStr then begin
      dblFase.KeyValue:= 2;
      pctFechaPMC.Pages[2].TabVisible:= False;
   end;

   if mmoAcaoContencao.Text = EmptyStr then begin
      dblFase.KeyValue:= 1;
      pctFechaPMC.Pages[2].TabVisible:= False;
   end;
end;

procedure TFormCadPMCFecha.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   case pctFechaPMC.TabIndex of
      0: begin// Cadastro
         with cdsImprimir do begin
            Active:= False;
            CommandText:= ' SELECT P.*, A.codi_aco, A.desc_aco, A.resp_aco, A.aco_prazo, A.vimp_aco, ' +
                          ' tc.valo_com as DescEficaz, C.cli_nome, F.forn_nome, PR.nome_pro' +
                          ' FROM pmc P' +
                          ' LEFT JOIN pmc_acoes A ON P.codi_pmc = A.codi_pmc' +
                          ' INNER JOIN tabela_combos tc ON tc.tipo_com = 21 and tc.codi_com = p.efic_pmc ' +
                          ' LEFT JOIN clientes C ON C.cli_codigo = P.pmc_cliente' +
                          ' LEFT JOIN fornecedores F ON F.forn_codigo = P.pmc_fornecedor' +
                          ' LEFT JOIN processos PR ON PR.codi_pro = P.prcs_pmc' +
                          ' WHERE P.codi_pmc = ' + sCodigoPMC;
            Active:= True;
         end;

         if cdsImprimir.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;

         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_PMC.fr3');
         frxReport1.Variables['fase']:= QuotedStr(dblFase.Text);
         Auditoria('PMC',dm.cdsPMCnume_pmc.AsString,'R', '');
      end;
      1: begin// Ishikawa
         with cdsIshikawaImp do begin
            Active:= False;
            CommandText:= ' SELECT ish_codigo, ish_codigopmc, ish_meioambiente, ish_maquina, ish_metodo,' +
                          ' ish_medicao, ish_maodeobra, ish_materiaprima, ish_problema, ' +
                          ' P.nume_pmc, P.data_pmc ' +
                          ' FROM ishikawa I' +
                          ' INNER JOIN pmc P ON P.codi_pmc = I.ish_codigopmc' +
                          ' WHERE ish_codigopmc = ' + sCodigoPMC;
            Active:= True;
         end;

         if cdsIshikawaImp.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;

         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Ishikawa.fr3');
         Auditoria('Ishikawa',sCodigoPMC,'R', '');
      end;
   end;

   with frxReport1 do begin
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

procedure TFormCadPMCFecha.InserirTexto(Titulo: string; Texto: string);
begin
   mmoTexto.Clear;
   mmoTexto.Lines.Add(Titulo);
   mmoTexto.Lines.Add('');
   mmoTexto.Lines.Add(Texto);
end;

procedure TFormCadPMCFecha.LimparCampos;
begin
   case pctFechaPMC.TabIndex of
      2: begin
         mmoDescricaoAcao.Clear;
         dtPrazoAcao.Clear;
         dblResponsavelAcao.KeyValue:= -1;
         mmoVerificacaoAcao.Clear;
//         edtArquivo.Clear;
      end;
      1: begin
         mmoMeioAmbiente.Clear;
         mmoMaquina.Clear;
         mmoMetodo.Clear;
         mmoMedicao.Clear;
         mmoMaoObra.Clear;
         mmoMateriaPrima.Clear;
         mmoProblema.Clear;
      end;
   end;
end;

end.
