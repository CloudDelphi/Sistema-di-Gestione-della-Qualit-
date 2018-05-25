unit frm_Inicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Menus, Buttons, ShellAPI, RxMenus, ImgList,
  JvMenus, ToolWin, ActnMan, ActnCtrls, Ribbon, RibbonLunaStyleActnCtrls,
  ActnList, ActnMenus, RibbonActnMenus, StdCtrls, DBCtrls, frxClass, frxDBSet,
  DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZSqlMonitor, Mask, RXSpin, AdvOpenGLControl, AdvChartView3D, Grids, DBGrids,
  ComObj;//, MidasLib;

type
  TFormInicial = class(TForm)
    statPrincipal: TStatusBar;
    pnl1: TPanel;
    sbBbtnSair: TSpeedButton;
    sbQuality: TSpeedButton;
    RxMainMenu1: TRxMainMenu;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    Processos1: TMenuItem;
    RecursosHumanos1: TMenuItem;
    reinamentos1: TMenuItem;
    Habilidades1: TMenuItem;
    Funes1: TMenuItem;
    Colaboradores1: TMenuItem;
    imlMenu: TImageList;
    mm1: TMainMenu;
    RequisitosSistmicos1: TMenuItem;
    ProcedimentosDocumentados1: TMenuItem;
    ListaMestra1: TMenuItem;
    AprovaodeDocumentos1: TMenuItem;
    RegistrosdaQualidade1: TMenuItem;
    AoPreventivaMelhoriaCorretiva1: TMenuItem;
    AberturaPMC1: TMenuItem;
    ConsultadePMC1: TMenuItem;
    RequisitosAmbientais1: TMenuItem;
    RequisitosLegais1: TMenuItem;
    AspectosAmbientais1: TMenuItem;
    ImpactosAmbientais1: TMenuItem;
    LAAIA1: TMenuItem;
    N1: TMenuItem;
    MonitoramentodoSistema1: TMenuItem;
    AnliseCrtica1: TMenuItem;
    AuditoriaInterna1: TMenuItem;
    ProgramadeAuditoriaInterna1: TMenuItem;
    RelatriodeAuditoriaInterna1: TMenuItem;
    Indicadores1: TMenuItem;
    EstruturaeAmbientedeTrabalho1: TMenuItem;
    Infraestrutura1: TMenuItem;
    ManutenoPreventiva1: TMenuItem;
    Compras1: TMenuItem;
    Fornecedores1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    Processos2: TMenuItem;
    GerenciadordeProcessos1: TMenuItem;
    N2: TMenuItem;
    IQF1: TMenuItem;
    Metrologia1: TMenuItem;
    Relatrios1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    PendnciasdaMatrizdeCompetncias1: TMenuItem;
    AvaliaodeHabilidades1: TMenuItem;
    ResumodosIndicadores1: TMenuItem;
    N3: TMenuItem;
    RegistrodoSistema1: TMenuItem;
    zqryAvalHab: TZQuery;
    dspAvalHab: TDataSetProvider;
    cdsAvalHab: TClientDataSet;
    cdsAvalHabnome_col: TWideStringField;
    cdsAvalHabdesc_fun: TWideStringField;
    cdsAvalHabTotPontos: TFloatField;
    cdsAvalHabcodi_col: TLargeintField;
    cdsAvalHabcodi_hab: TLargeintField;
    cdsAvalHabnota_hab: TFloatField;
    cdsAvalHabhab_ano: TWideStringField;
    cdsAvalHabdesc_hab: TWideStringField;
    cdsAvalHabTotalHab: TLargeintField;
    cdsAvalHabcol_avaliador: TWideStringField;
    dsAvalHab: TDataSource;
    zqryHab: TZQuery;
    dspHab: TDataSetProvider;
    cdsHab: TClientDataSet;
    cdsHabcodi_col: TLargeintField;
    cdsHabcodi_hab: TLargeintField;
    cdsHabnota_hab: TFloatField;
    cdsHabhab_ano: TWideStringField;
    cdsHabdesc_hab: TWideStringField;
    dsHab: TDataSource;
    pnlAvalHab: TPanel;
    lbl1: TLabel;
    lbl5: TLabel;
    pnl2: TPanel;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    dblColaborador: TDBLookupComboBox;
    chkTodosColab: TCheckBox;
    zqryImpressao: TZQuery;
    dspImpressao: TDataSetProvider;
    cdsImpressao: TClientDataSet;
    dsImpressao: TDataSource;
    zqryColab: TZQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    cdsColabcodi_col: TLargeintField;
    cdsColabnome_col: TWideStringField;
    dsColab: TDataSource;
    N4: TMenuItem;
    Sair1: TMenuItem;
    N5: TMenuItem;
    LogdeDocumentosVisualizados1: TMenuItem;
    iposdeProduto1: TMenuItem;
    pnlGeral: TPanel;
    zqryEmpresa: TZQuery;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    sbLogoff: TSpeedButton;
    Configuraodoemail1: TMenuItem;
    N6: TMenuItem;
    Label1: TLabel;
    dblProcessos: TDBLookupComboBox;
    chkTodosProcessos: TCheckBox;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    Label2: TLabel;
    dblFuncoes: TDBLookupComboBox;
    chkTodosFuncao: TCheckBox;
    zqryFuncoes: TZQuery;
    dspFuncoes: TDataSetProvider;
    cdsFuncoes: TClientDataSet;
    cdsFuncoescodi_fun: TLargeintField;
    cdsFuncoesdesc_fun: TWideStringField;
    dsFuncoes: TDataSource;
    sbSairAval: TSpeedButton;
    frxReport1: TfrxReport;
    frxDBAvalHab: TfrxDBDataset;
    frxDBHab: TfrxDBDataset;
    frxDBRel: TfrxDBDataset;
    pnlInternet: TPanel;
    img1: TImage;
    tmrInternet: TTimer;
    CadastrodeClientes1: TMenuItem;
    ZSQLMonitor1: TZSQLMonitor;
    CategoryPanelGroup1: TCategoryPanelGroup;
    cpnlPMC: TCategoryPanel;
    N7: TMenuItem;
    ColaboradoresProcedimentos1: TMenuItem;
    VisualizarProcedimentos1: TMenuItem;
    CartadeAtualizao1: TMenuItem;
    Exportao1: TMenuItem;
    ExportaoCA1: TMenuItem;
    AnlisedeRiscos1: TMenuItem;
    VariveisExternas1: TMenuItem;
    VariveisInternas1: TMenuItem;
    AmlisedoMacroAmbienteExterno1: TMenuItem;
    AnliseInterna1: TMenuItem;
    AnlisedeRisco1: TMenuItem;
    AnliseSWOT1: TMenuItem;
    N8: TMenuItem;
    ListadeTreinamentosnoRealizados1: TMenuItem;
    PendnciasGerais1: TMenuItem;
    zqryImpTreinamentos: TZQuery;
    dspImpTreinamentos: TDataSetProvider;
    cdsImpTreinamentos: TClientDataSet;
    ds1: TDataSource;
    frxDBImpTreinamentos: TfrxDBDataset;
    ListadeHabilidadescomPendncia1: TMenuItem;
    pnlPendenciasHab: TPanel;
    lbl2: TLabel;
    pnl4: TPanel;
    btnVideoPen: TBitBtn;
    btnImpPen: TBitBtn;
    pnl9: TPanel;
    rgAgrupaHab: TRadioGroup;
    edtAno: TEdit;
    zqryImpressaoHab: TZQuery;
    dspImpressaoHab: TDataSetProvider;
    cdsImpressaoHab: TClientDataSet;
    cdsImpressaocodi_col: TLargeintField;
    cdsImpressaonome_col: TWideStringField;
    cdsImpressaocodi_hab: TLargeintField;
    cdsImpressaohabilidade: TWideStringField;
    cdsImpressaonota: TFloatField;
    cdsImpressaocodi_pla: TLargeintField;
    cdsImpressaohab_ano: TWideStringField;
    cdsImpressaoacao: TWideMemoField;
    dsImpressaoHab: TDataSource;
    frxDBPendHab: TfrxDBDataset;
    rgFiltroHab: TRadioGroup;
    sbSairHab: TSpeedButton;
    rgAgrupaAvHab: TRadioGroup;
    zqryHabTotal: TZQuery;
    dspHabTotal: TDataSetProvider;
    cdsHabTotal: TClientDataSet;
    dsHabTotal: TDataSource;
    frxDBHabTotal: TfrxDBDataset;
    spnAno: TRxSpinEdit;
    pnlTreinamentos: TPanel;
    lblColaboradorTre: TLabel;
    pnl5: TPanel;
    sbSairTre: TSpeedButton;
    btnVideoTre: TBitBtn;
    btnImpressoraTre: TBitBtn;
    pnl6: TPanel;
    dblColaboradorTre: TDBLookupComboBox;
    chkTodosColabTre: TCheckBox;
    rgAgrupa: TRadioGroup;
    cdsAvalHabavaliador: TWideStringField;
    N9: TMenuItem;
    CadastrodeMododeRecuperaodeDocumentos1: TMenuItem;
    ApontamentodeDefeitos1: TMenuItem;
    ClassedoDefeito1: TMenuItem;
    CadastrodeDefeitos1: TMenuItem;
    CadastrodeOrigemdoDefeito1: TMenuItem;
    GerenciamentodeDefeitos1: TMenuItem;
    Produtos1: TMenuItem;
    CadastrodeContexto1: TMenuItem;
    CadastrodePartesInteressadas1: TMenuItem;
    AnlisedeContexto1: TMenuItem;
    PDCA2: TMenuItem;
    AnlisedeContextoePartesInteressadas1: TMenuItem;
    N11: TMenuItem;
    Parmetros1: TMenuItem;
    ParmetrosdoSistema1: TMenuItem;
    rgFiltroTre: TRadioGroup;
    lblTreinamento: TLabel;
    dblTreinamento: TDBLookupComboBox;
    chkTodosTreinamentoTre: TCheckBox;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    cdsTreinamentostre_conteudo: TWideMemoField;
    cpnlCalibracao: TCategoryPanel;
    pnlPMC: TPanel;
    pnl7: TPanel;
    AdvChartView3DPMC: TAdvChartView3D;
    cdsGrafico: TClientDataSet;
    cdsGraficotipo_pmc: TLargeintField;
    cdsGraficovalo_com: TWideStringField;
    cdsGraficoQtd: TLargeintField;
    cdsGraficoDescTipo: TStringField;
    zqryGrafico: TZQuery;
    dspGrafico: TDataSetProvider;
    zqryTipo: TZQuery;
    dspTipo: TDataSetProvider;
    cdsTipo: TClientDataSet;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    dsTipo: TDataSource;
    dbgPMC: TDBGrid;
    zqryRisco: TZQuery;
    dspRisco: TDataSetProvider;
    cdsRisco: TClientDataSet;
    dsRisco: TDataSource;
    cdsRiscoCodigo: TIntegerField;
    cdsRiscoFator: TIntegerField;
    cdsRiscoVariavel: TIntegerField;
    cdsRiscoTipo: TIntegerField;
    cdsRiscoTexto: TStringField;
    cdsRiscoProcesso: TIntegerField;
    cdsRiscoTipoRisco: TStringField;
    pnlPendenciasMatriz: TPanel;
    lbl6: TLabel;
    lbl7: TLabel;
    pnl11: TPanel;
    sbSairMatriz: TSpeedButton;
    btnMatrizVideo: TBitBtn;
    btnMatrizImpressora: TBitBtn;
    pnl12: TPanel;
    dblColabMatriz: TDBLookupComboBox;
    chkTodosColabMatriz: TCheckBox;
    dblProcMatriz: TDBLookupComboBox;
    chkTodosProcMatriz: TCheckBox;
    chkSomentePendencias: TCheckBox;
    N10: TMenuItem;
    RelatriodeCalibrao1: TMenuItem;
    frxDBCalibracao: TfrxDBDataset;
    zqryCalibracao: TZQuery;
    dspCalibracao: TDataSetProvider;
    cdsCalibracao: TClientDataSet;
    dsCalibracao: TDataSource;
    pnlImprimirCalib: TPanel;
    pnl8: TPanel;
    btnSairImp: TBitBtn;
    btnVideoCalibracao: TBitBtn;
    btnImpCalibracao: TBitBtn;
    pnl10: TPanel;
    rgOrdemImpressao: TRadioGroup;
    zqryEquip: TZQuery;
    dspEquip: TDataSetProvider;
    cdsEquip: TClientDataSet;
    cdsEquipcodi_inf: TLargeintField;
    cdsEquipiden_inf: TWideStringField;
    cdsEquipdesc_inf: TWideStringField;
    dsEquip: TDataSource;
    N12: TMenuItem;
    VincularRiscoaoPMC1: TMenuItem;
    ISO900120081: TMenuItem;
    ISO900120151: TMenuItem;
    ProgramadeAuditoriaInterna2: TMenuItem;
    RelatriodeAuditoriaInterna2: TMenuItem;
    dbgCalibracao: TDBGrid;
    sbDashboard: TSpeedButton;
    cpnlForn: TCategoryPanel;
    dbgFornecedores: TDBGrid;
    cpnlProcedimentos: TCategoryPanel;
    dbgProcedimentos: TDBGrid;
    cpnlEficacia: TCategoryPanel;
    dbgEficacia: TDBGrid;
    cpnlManutencao: TCategoryPanel;
    dbgManutencao: TDBGrid;
    cpnlPMCAcoes: TCategoryPanel;
    dbgPMCAcoes: TDBGrid;
    cpnlPDCA: TCategoryPanel;
    dbgPDCA: TDBGrid;
    lbl3: TLabel;
    dblProcessoTre: TDBLookupComboBox;
    chkTodosProcessoTre: TCheckBox;
    RequisitosdeSadeeSeguranaOcupacional1: TMenuItem;
    RiscoseDanos1: TMenuItem;
    ListadePerigoseAvaliaodosRiscos1: TMenuItem;
    N13: TMenuItem;
    cpnlEducacao: TCategoryPanel;
    dbgEducacao: TDBGrid;
    cpnlExperiencia: TCategoryPanel;
    dbgExperiencia: TDBGrid;
    cpnlTreinamentos: TCategoryPanel;
    dbgTreinamentos: TDBGrid;
    cpnlAnaliseCritica: TCategoryPanel;
    dbgAnaliseCritica: TDBGrid;
    cpnlHabilidades: TCategoryPanel;
    dbgHabilidades: TDBGrid;
    cpnlHabilidadeVencida: TCategoryPanel;
    dbg1: TDBGrid;
    cpnlIndicadores: TCategoryPanel;
    stgIndicadores: TStringGrid;
    cdsAvalHabmediapontos: TFloatField;
    grp1: TGroupBox;
    chkNotaZerada: TCheckBox;
    sbAlteraSenha: TSpeedButton;
    RegistrodeNoConformidadesRNC1: TMenuItem;
    AberturadeRNC1: TMenuItem;
    ConsultaRNC1: TMenuItem;
    N14: TMenuItem;
    CadastrodeMotivosdeRNC1: TMenuItem;
    CadastrodeOrigemdeRNC1: TMenuItem;
    RegistrodePlanejamentodeMudanas1: TMenuItem;
    cpnlPMCsemCausa: TCategoryPanel;
    dbgPMCSemCausa: TDBGrid;
    cpnlPMCsemAcaoImediata: TCategoryPanel;
    dbgPMCsemAcaoImediata: TDBGrid;
    RelatriodeTreinamentos1: TMenuItem;
    N15: TMenuItem;
    Grficos1: TMenuItem;
    ConsultaAesdePMC1: TMenuItem;
    ManutenoPreventiva2: TMenuItem;
    CadastrodeModelodeManuteno1: TMenuItem;
    N16: TMenuItem;
    ExecuodeManuteno1: TMenuItem;
    Cronograma1: TMenuItem;
    RelatriodeManutenoPreventiva1: TMenuItem;
    N17: TMenuItem;
    sbAuditoria: TSpeedButton;
    btn1: TButton;
    zqryAvaliadores: TZQuery;
    dspAvaliadores: TDataSetProvider;
    cdsAvaliadores: TClientDataSet;
    dsAvaliadores: TDataSource;
    lbl4: TLabel;
    dblAvaliador: TDBLookupComboBox;
    chkTodosAvaliadores: TCheckBox;
    cpnlRNCNaoRespondida: TCategoryPanel;
    dbgRNCNaoRespondida: TDBGrid;
    cdsCalibracaocali_datacalibracao: TDateTimeField;
    cdsCalibracaocali_numero: TWideStringField;
    cdsCalibracaodesc_inf: TWideStringField;
    cdsCalibracaocali_localizacao: TWideStringField;
    cdsCalibracaocali_proxcalibracao: TDateTimeField;
    cdsCalibracaodescprocesso: TWideStringField;
    Spiltag1: TMenuItem;
    ImportaodeDadosTOTVS1: TMenuItem;
    cpnlRNCAceiteRecusa: TCategoryPanel;
    dbg2: TDBGrid;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure statPrincipalDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure FormShow(Sender: TObject);
    procedure actCadEmpresaExecute(Sender: TObject);
    procedure actTreinamentosExecute(Sender: TObject);
    procedure actHabilidadesExecute(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Processos1Click(Sender: TObject);
    procedure reinamentos1Click(Sender: TObject);
    procedure Habilidades1Click(Sender: TObject);
    procedure Funes1Click(Sender: TObject);
    procedure Colaboradores1Click(Sender: TObject);
    procedure ListaMestra1Click(Sender: TObject);
    procedure AprovaodeDocumentos1Click(Sender: TObject);
    procedure RegistrosdaQualidade1Click(Sender: TObject);
    procedure AberturaPMC1Click(Sender: TObject);
    procedure ConsultadePMC1Click(Sender: TObject);
    procedure RequisitosLegais1Click(Sender: TObject);
    procedure AspectosAmbientais1Click(Sender: TObject);
    procedure ImpactosAmbientais1Click(Sender: TObject);
    procedure LAAIA1Click(Sender: TObject);
    procedure GerenciadordeProcessos1Click(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure ImprimeAvalHab(tipo: string);
    procedure chkTodosColabClick(Sender: TObject);
    procedure ResumodosIndicadores1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure AnliseCrtica1Click(Sender: TObject);
    procedure ProgramadeAuditoriaInterna1Click(Sender: TObject);
    procedure RelatriodeAuditoriaInterna1Click(Sender: TObject);
    procedure Indicadores1Click(Sender: TObject);
    procedure Infraestrutura1Click(Sender: TObject);
    procedure ManutenoPreventiva1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure CadastrodeUsurios1Click(Sender: TObject);
    procedure RegistrodoSistema1Click(Sender: TObject);
    procedure iposdeProduto1Click(Sender: TObject);
    procedure IQF1Click(Sender: TObject);
    procedure Metrologia1Click(Sender: TObject);
    procedure sbLogoffClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure LogdeDocumentosVisualizados1Click(Sender: TObject);
    procedure Configuraodoemail1Click(Sender: TObject);
    procedure chkTodosProcessosClick(Sender: TObject);
    procedure chkTodosFuncaoClick(Sender: TObject);
    procedure sbSairAvalClick(Sender: TObject);
    procedure CadastrodeClientes1Click(Sender: TObject);
    procedure ColaboradoresProcedimentos1Click(Sender: TObject);
    procedure VisualizarProcedimentos1Click(Sender: TObject);
    procedure CartadeAtualizao1Click(Sender: TObject);
    procedure ExportaoCA1Click(Sender: TObject);
    procedure VariveisExternas1Click(Sender: TObject);
    procedure VariveisInternas1Click(Sender: TObject);
    procedure AmlisedoMacroAmbienteExterno1Click(Sender: TObject);
    procedure AnliseInterna1Click(Sender: TObject);
    procedure AnlisedeRisco1Click(Sender: TObject);
    procedure ListadeTreinamentosnoRealizados1Click(Sender: TObject);
    procedure PendnciasGerais1Click(Sender: TObject);
    procedure sbSairTreClick(Sender: TObject);
    procedure chkTodosColabTreClick(Sender: TObject);
    procedure ImprimirTreinamentos(tipo: string);
    procedure btnVideoTreClick(Sender: TObject);
    procedure btnImpressoraTreClick(Sender: TObject);
    procedure ListadeHabilidadescomPendncia1Click(Sender: TObject);
    procedure btnVideoPenClick(Sender: TObject);
    procedure ImprimirPendenciasHab(TipoImp: string);
    procedure btnImpPenClick(Sender: TObject);
    procedure sbSairHabClick(Sender: TObject);
    procedure AvaliaodeHabilidades1Click(Sender: TObject);
    procedure CadastrodeMododeRecuperaodeDocumentos1Click(Sender: TObject);
    procedure ClassedoDefeito1Click(Sender: TObject);
    procedure CadastrodeDefeitos1Click(Sender: TObject);
    procedure CadastrodeOrigemdoDefeito1Click(Sender: TObject);
    procedure GerenciamentodeDefeitos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure CadastrodeContexto1Click(Sender: TObject);
    procedure CadastrodePartesInteressadas1Click(Sender: TObject);
    procedure AnlisedeContexto1Click(Sender: TObject);
    procedure PDCA2Click(Sender: TObject);
    procedure ParmetrosdoSistema1Click(Sender: TObject);
    procedure chkTodosTreinamentoTreClick(Sender: TObject);
    procedure rgAgrupaClick(Sender: TObject);
    procedure InicializarGraf;
    procedure VerificarPendencias();
    procedure btnMatrizVideoClick(Sender: TObject);
    procedure btnMatrizImpressoraClick(Sender: TObject);
    procedure ImprimirPendenciasMatriz(TipoImp: string);
    procedure chkTodosProcMatrizClick(Sender: TObject);
    procedure chkTodosColabMatrizClick(Sender: TObject);
    procedure sbSairMatrizClick(Sender: TObject);
    procedure RelatriodeCalibrao1Click(Sender: TObject);
    procedure ImprimirCalibracao(TipoImp: string);
    procedure btnVideoCalibracaoClick(Sender: TObject);
    procedure btnImpCalibracaoClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure VincularRiscoaoPMC1Click(Sender: TObject);
    procedure ProgramadeAuditoriaInterna2Click(Sender: TObject);
    procedure RelatriodeAuditoriaInterna2Click(Sender: TObject);
    procedure sbDashboardClick(Sender: TObject);
    procedure chkTodosProcessoTreClick(Sender: TObject);
    procedure RiscoseDanos1Click(Sender: TObject);
    procedure ListadePerigoseAvaliaodosRiscos1Click(Sender: TObject);
    procedure sbAlteraSenhaClick(Sender: TObject);
    procedure AberturadeRNC1Click(Sender: TObject);
    procedure CadastrodeMotivosdeRNC1Click(Sender: TObject);
    procedure CadastrodeOrigemdeRNC1Click(Sender: TObject);
    procedure ConsultaRNC1Click(Sender: TObject);
    procedure RegistrodePlanejamentodeMudanas1Click(Sender: TObject);
    procedure dbgPMCDblClick(Sender: TObject);
    procedure dbgPMCSemCausaDblClick(Sender: TObject);
    procedure dbgPMCsemAcaoImediataDblClick(Sender: TObject);
    procedure stgIndicadoresDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RelatriodeTreinamentos1Click(Sender: TObject);
    procedure Grficos1Click(Sender: TObject);
    procedure ConsultaAesdePMC1Click(Sender: TObject);
    procedure CadastrodeModelodeManuteno1Click(Sender: TObject);
    procedure ExecuodeManuteno1Click(Sender: TObject);
    procedure RelatriodeManutenoPreventiva1Click(Sender: TObject);
    procedure Cronograma1Click(Sender: TObject);
    procedure sbAuditoriaClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chkTodosAvaliadoresClick(Sender: TObject);
    procedure dbgRNCNaoRespondidaDblClick(Sender: TObject);
    procedure dbgPMCAcoesDblClick(Sender: TObject);
    procedure ImportaodeDadosTOTVS1Click(Sender: TObject);
    procedure dbg2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    versao: string;
  end;

var
   FormInicial: TFormInicial;
   LoginOk : Boolean;
   cUsuario: string;
   nomeSistema: string;
   sTextoEmail: string;

const
   pathReg   = '\Software\DM';
   nomeReg   = 'Chave';

implementation

uses Funcoes, frm_Login, Validacao, frm_dm, frm_cartaAtualizacao,
  frm_CadEmpresa, frm_CadProcessos, frm_CadTreinamentos,
  frm_CadHabilidades, frm_CadFuncoes, frm_CadColaborador, frm_CadListaMestra,
  frm_Aprovacao, frm_CadRegistros, frm_CadPMCAbre, frm_CadPMCConsulta, frm_Lira,
  frm_CadAspectosAmb, frm_CadImpactosAmb, frm_Laaia, frm_ResumoIndicadores,
  frm_CadAnaliseCritica, frm_AuditoriaInterna, uAuditoriaRelatorio,
  frm_CadIndicadores, frm_CadInfra, frm_CadInfraestrutura,
  frm_CadManutPreventiva, frm_CadFornecedores, frm_CadUsuarios, uAtivaSistema,
  frm_CadTipoProduto, frm_Processos, frm_CadIQF, frm_CadCalibracao, frm_Sobre,
  frm_Log, frm_configEmail, frm_CadClientes, frm_ColabProcedimentos,
  frm_VisualizaDocumentosColab, frm_VisualizaDocumentos, frm_MsgErro,
  AtualizaBanco, frm_CadRiscoVarExternas, frm_CadRiscoVarInternas,
  frm_CadRiscoMacroAmbiente, frm_CadRiscoAnaliseInterna, frmSplash,
  frm_CadRiscoAnaliseRisco, frm_CadModoRecuperacao, frm_DefCadClasse,
  frm_DefCadDefeitos, frm_DefCadOrigem, frm_DefLancamentos, frm_CadProdutos,
  frm_PDCA, frm_CadContexto, frm_CadPartesInteressadas, frm_CadContextoAnalise,
  frm_CadParametros, frm_CadPMCVinculo, frm_AuditoriaInterna2015, frm_AuditoriaRelatorio2015, frm_dmPendencias, frm_CadDanos, frm_Perigos, frm_AlteraSenha, frm_CadRNCAbre, frm_CadMotivoRNC, frm_CadOrigemRNC, frm_CadRNCConsulta, frm_CadPlanMudanca, frm_EmailAuto, frm_CadPMCFecha, frm_PesqTreinamentos, frm_GraficoPMC, frm_CadPMCAcoesConsulta, frm_CadManutModelo, frm_CadManutencao, frmRelatorioGeral, frm_CadCronograma, frm_AuditoriaAuto, frm_CadRNCFecha;

{$R *.dfm}

procedure TFormInicial.InicializarGraf;
var
   i: Integer;
begin
   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 4' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   cdsGrafico.Active:= False;
   cdsGrafico.Active:= True;

   AdvChartView3DPMC.BeginUpdate;
   AdvChartView3DPMC.InitSample;
   AdvChartView3DPMC.Title.Font.Size:= 8;
   AdvChartView3DPMC.Title.Text := 'Prazo das Ações de PMC';

//   AdvChartView3DPMC.Series.Add; // Adiciona uma nova série

//--------------Série 0------------
   AdvChartView3DPMC.Series[0].Caption:= 'Tipos de PMC'; // Título da Legenda
   AdvChartView3DPMC.Series[0].Size := 200;
   AdvChartView3DPMC.Series[0].Left := 0;
   AdvChartView3DPMC.Series[0].Top  := 0;
   AdvChartView3DPMC.Series[0].Depth:= 30; // Espessura da pizza
   AdvChartView3DPMC.Series[0].Values.ShowCaptions    := True;
   AdvChartView3DPMC.Series[0].Values.ShowValues      := True;
   AdvChartView3DPMC.Series[0].Values.ShowPercentages := True;
   AdvChartView3DPMC.Series[0].Values.ImageAspectRatio:= True;
   AdvChartView3DPMC.Series[0].Values.ImagePosition := ipCenterCenter;
//   AdvChartView3DPMC.Series[0].Values.ImageHeight:= 20;
//   AdvChartView3DPMC.Series[0].Values.ImageWidth := 10;
   AdvChartView3DPMC.Series[0].Values.ValuesFont.Size := 8;
   AdvChartView3DPMC.Series[0].Values.Fill.Color      := clWhite;
   AdvChartView3DPMC.Series[0].Values.Fill.EndColor   := clWhite;
   AdvChartView3DPMC.Series[0].Items.Clear;
   AdvChartView3DPMC.Series[0].Top:= -35; // Posição do gráfico
   AdvChartView3DPMC.Series[0].Legend.Position:= ipCenterLeft; // Posição da Legenda
   AdvChartView3DPMC.Series[0].Legend.Visible:= False;

   if cdsGrafico.RecordCount > 0 then begin
      with cdsGrafico do begin
         First;
         i:= 0;
         while not Eof do begin
            i:= i + 1;
            with AdvChartView3DPMC.Series[0].Items.Add do begin
               Caption := FieldByName('DescTipo').AsString;
               Value   := FieldByName('qtd').AsInteger;
               Color   := RGB(Random(255), Random(255), Random(255));
               //Image.LoadFromFile(ExtractFilePath(Application.ExeName) +  '/imagens/logo1.jpg');
   //            Image.Height:= 20;
   //            Image.Width := 10;
            end;
            Next;
         end;
      end;
      AdvChartView3DPMC.Series[0].Legend.Visible:= True;
      AdvChartView3DPMC.Series[0].Items[0].Extraction := 30;
   end;


   AdvChartView3DPMC.EndUpdate;
end;

procedure TFormInicial.actHabilidadesExecute(Sender: TObject);
begin
   if Acesso(cUsuario, 1, 'acesso') = 1 then begin
      FormCadEmpresa:= TFormCadEmpresa.Create(nil);
      FormCadEmpresa.ShowModal;
      FormCadEmpresa.Release;
   end;
end;

procedure TFormInicial.AberturadeRNC1Click(Sender: TObject);
begin
    if Acesso(cUsuario, 53, 'acesso') = 1 then begin
      AbrirForm(TFormCadRNCAbre, FormCadRNCAbre);
   end;
end;

procedure TFormInicial.AberturaPMC1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      FormCadPMCAbre:= TFormCadPMCAbre.Create(nil);
      FormCadPMCAbre.ShowModal;
      FormCadPMCAbre.Release;
   end;
end;

procedure TFormInicial.actCadEmpresaExecute(Sender: TObject);
begin
   if Acesso(cUsuario, 1, 'acesso') = 1 then begin
      FormCadEmpresa:= TFormCadEmpresa.Create(nil);
      FormCadEmpresa.ShowModal;
      FormCadEmpresa.Release;
   end;
end;

procedure TFormInicial.actTreinamentosExecute(Sender: TObject);
begin
   if Acesso(cUsuario, 1, 'acesso') = 1 then begin
      FormCadEmpresa:= TFormCadEmpresa.Create(nil);
      FormCadEmpresa.ShowModal;
      FormCadEmpresa.Release;
   end;
end;

procedure TFormInicial.AmlisedoMacroAmbienteExterno1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 37, 'acesso') = 1 then begin
      FormCadRiscoMacroAmbiente:= TFormCadRiscoMacroAmbiente.Create(nil);
      FormCadRiscoMacroAmbiente.ShowModal;
      FormCadRiscoMacroAmbiente.Release;
   end;
end;

procedure TFormInicial.AnliseCrtica1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 12, 'acesso') = 1 then begin
      FormCadAnaliseCritica:= TFormCadAnaliseCritica.Create(nil);
      FormCadAnaliseCritica.ShowModal;
      FormCadAnaliseCritica.Release;
   end;
end;

procedure TFormInicial.AnlisedeContexto1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 42, 'acesso') = 1 then begin
      FormContextoAnalise:= TFormContextoAnalise.Create(nil);
      FormContextoAnalise.ShowModal;
      FormContextoAnalise.Release;
   end;
end;

procedure TFormInicial.AnlisedeRisco1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 39, 'acesso') = 1 then begin
      FormAnaliseRisco:= TFormAnaliseRisco.Create(nil);
      FormAnaliseRisco.ShowModal;
      FormAnaliseRisco.Release;
   end;
end;

procedure TFormInicial.AnliseInterna1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 38, 'acesso') = 1 then begin
      FormCadRiscoAnaliseInterna:= TFormCadRiscoAnaliseInterna.Create(nil);
      FormCadRiscoAnaliseInterna.ShowModal;
      FormCadRiscoAnaliseInterna.Release;
   end;
end;

procedure TFormInicial.AprovaodeDocumentos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 8, 'acesso') = 1 then begin
      FormAprovacao:= TFormAprovacao.Create(nil);
      FormAprovacao.ShowModal;
      FormAprovacao.Release;
   end;
end;

procedure TFormInicial.AspectosAmbientais1Click(Sender: TObject);
begin
   //      if Acesso(cUsuario, 20, 'acesso') = 1 then begin
      FormCadAspectos:= TFormCadAspectos.Create(nil);
      FormCadAspectos.ShowModal;
      FormCadAspectos.Release;
//      end;
end;

procedure TFormInicial.AvaliaodeHabilidades1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 30, 'acesso') = 1 then begin
      pnlAvalHab.Top     := Self.Height div 2 - pnlAvalHab.Height div 2 - 20;
      pnlAvalHab.Left    := Self.Width div 2 - pnlAvalHab.Width div 2;
      pnlAvalHab.Visible := True;

      spnAno.Value:= StrToInt(FormatDateTime('YYYY',Date()));
      rgAgrupaAvHab.ItemIndex:= 1;

      cdsColab.Active:= False;
      cdsColab.Active:= True;

      with cdsAvaliadores do begin
         Active:= False;
         CommandText:= ' SELECT ava_codavaliador, C.nome_col ' +
                       ' FROM colab_avaliador' +
                       ' INNER JOIN colaboradores C ON C.codi_col = ava_codavaliador' +
                       ' WHERE col_status = 1' + // Ativos
                       ' ORDER BY C.nome_col';
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

      cdsFuncoes.Active:= False;
      cdsFuncoes.Active:= True;
   end;
end;

procedure TFormInicial.btnImpressoraClick(Sender: TObject);
begin
   ImprimeAvalHab('I');
end;

procedure TFormInicial.btnVideoCalibracaoClick(Sender: TObject);
begin
   ImprimirCalibracao('V');
end;

procedure TFormInicial.btn1Click(Sender: TObject);
var
   planilha, sheet: OleVariant;
   linha, coluna: Integer;
begin
//   GravaUsuarios(QuotedStr('47'));

//     //Crio o objeto que gerencia o arquivo excel
//     planilha:= CreateOleObject('Excel.Application');
//

//     //Abro o arquivo
//     planilha.WorkBooks.open('C:\Users\Daniel\Desktop\FUNCIONARIOS DESTRA.xlsx');
//
//     //Pega a primeira planilha do arquivo
//     sheet:= planilha.WorkSheets[1];
//
//     //Aqui pego o texto de uma das células
//     linha:= 2;
//     coluna:= 2;
//     ShowMessage(sheet.cells[linha, coluna]);
//
//     //Fecho a planilha
//     planilha.WorkBooks.Close;


// Copia as habilidades cadastradas na função
//   if Application.MessageBox('Deseja copiar as habilidades que estão cadastradas no cadastro da função para o colaborador ?', 'Confirmação', MB_YESNO + MB_ICONWARNING) = IDYES then begin
//      with dm.cdsGravar do begin
//         Active:= False;
//         CommandText:= ' SELECT codi_col, func_col FROM colaboradores';
//         Active:= True;
//
//         First;
//
//      // Grava as habilidades e treinamentos da função no colaborador
//         while not Eof do begin
//            GravaAtributos(FieldByName('codi_col').AsInteger , FieldByName('func_col').AsInteger, 'H');
//
//            Next;
//         end;
//      end;
//   endd;

//   Executar(' CREATE TABLE IF NOT EXISTS pdca_docs(' +
//                         ' pdca_codigo integer NOT NULL,' +
//                         ' pdca_coddoc integer NOT NULL,' +
//                         ' pdca_descricao character varying(250),' +
//                         ' pdca_caminho text,' +
//                         ' CONSTRAINT pdca_doc PRIMARY KEY (pdca_codigo, pdca_coddoc)' +
//                         ' )');
//
//   Executar(' CREATE TABLE IF NOT EXISTS pdca_lanc(' +
//                         ' lan_codigo integer NOT NULL,' +
//                         ' pdca_codigo integer NOT NULL,' +
//                         ' lan_oque text  ,' +
//                         ' lan_onde text,' +
//                         ' lan_porque text,' +
//                         ' lan_quando timestamp without time zone,' +
//                         ' lan_como text,' +
//                         ' lan_quem integer,' +
//                         ' lan_recursos text,' +
//                         ' lan_quanto double precision,' +
//                         ' lan_datarealizada timestamp without time zone,' +
//                         ' lan_verimplantacao text,' +
//                         ' lan_status integer,' +
//                         ' lan_dtprevista timestamp without time zone,' +
//                         ' lan_dtfinalizado timestamp without time zone,' +
//                         ' lan_chkobs text,' +
//                         ' CONSTRAINT PK_pdca_lanc PRIMARY KEY (lan_codigo)' +
//                         ' )');
//
//   Executar(' CREATE TABLE IF NOT EXISTS pdca(' +
//                         ' pdca_codigo integer NOT NULL,' +
//                         ' pdca_identificacao character varying(8),' +
//                         ' pdca_data timestamp without time zone,' +
//                         ' pdca_descricao character varying(50),' +
//                         ' pdca_origem integer,' +
//                         ' pdca_processo integer,' +
//                         ' pdca_emitido integer,' +
//                         ' CONSTRAINT PK_pdca PRIMARY KEY (pdca_codigo)' +
//                         ' )');
//
//   Executar(' ALTER TABLE pdca' +
//                         ' ALTER COLUMN pdca_descricao TYPE character varying(150);');
//
//   Executar(' CREATE TABLE IF NOT EXISTS partes(' +
//                         ' par_codigo integer NOT NULL,' +
//                         ' par_nome character varying(200),' +
//                         ' par_descricao text,' +
//                         ' CONSTRAINT PK_partes PRIMARY KEY (par_codigo)' +
//                         ' )');
//
//   Executar(' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (5, ' + QuotedStr('SOCIEDADE') + ',' + QuotedStr('') + ');');
//         Executar(' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (4, ' + QuotedStr('FORNECEDOR') + ',' + QuotedStr('') + ');');
//         Executar(' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (3, ' + QuotedStr('FUNCIONÁRIO') + ',' + QuotedStr('') + ');');
//         Executar(' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (2, ' + QuotedStr('ACIONISTA') + ',' + QuotedStr('') + ');');
//         Executar(' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                        ' VALUES (1, ' + QuotedStr('CLIENTE') + ',' + QuotedStr('') + ');');
//
//   Executar(' CREATE TABLE IF NOT EXISTS contexto_analise(' +
//                         ' ana_codigo integer NOT NULL,' +
//                         ' ana_contexto integer,' +
//                         ' ana_parte integer,' +
//                         ' ana_requisito text,' +
//                         ' ana_monitoramento text,' +
//                         ' CONSTRAINT PK_contexto_analise PRIMARY KEY (ana_codigo)' +
//                         ' )');
////
//   Executar(' CREATE TABLE IF NOT EXISTS contextos(' +
//                         ' con_codigo integer NOT NULL,' +
//                         ' con_nome character varying(200),' +
//                         ' con_descricao text,' +
//                         ' CONSTRAINT PK_contextos PRIMARY KEY (con_codigo)' +
//                         ' )');
////
//         Executar(' CREATE TABLE IF NOT EXISTS produtos(' +
//                         ' pro_codigo integer NOT NULL,' +
//                         ' pro_descricao character varying(200),' +
//                         ' CONSTRAINT PK_produtos PRIMARY KEY (pro_codigo)' +
//                         ' )');
//         Executar(' CREATE TABLE IF NOT EXISTS defeitos_lanc_itens(' +
//                         ' ite_codigo integer NOT NULL,' +
//                         ' lan_codigo integer NOT NULL,' +
//                         ' lan_defeito integer NOT NULL, ' +
//                         ' lan_qtd numeric(18,6) NOT NULL,' +
//                         ' CONSTRAINT PK_defeitos_lanc_itens PRIMARY KEY (ite_codigo)' +
//                         ' )');
//         Executar(' CREATE TABLE IF NOT EXISTS defeitos_lanc(' +
//                         ' lan_codigo integer NOT NULL,' +
//                         ' lan_data timestamp without time zone, ' +
//                         ' lan_origem integer NOT NULL, ' +
//                         ' lan_produto integer NOT NULL, ' +
//                         ' lan_rastreabilidade character varying(200),' +
//                         ' lan_qtd numeric(18,6) NOT NULL,' +
//                         ' lan_status integer NOT NULL, ' +
//                         ' CONSTRAINT PK_defeitos_lanc PRIMARY KEY (lan_codigo)' +
//                         ' )');
//         Executar(' CREATE TABLE IF NOT EXISTS defeitos_origem(' +
//                         ' ori_codigo integer NOT NULL,' +
//                         ' ori_descricao character varying(200),' +
//                         ' CONSTRAINT PK_defeitos_origem PRIMARY KEY (ori_codigo)' +
//                         ' )');
//         Executar(' CREATE TABLE IF NOT EXISTS defeitos(' +
//                         ' def_codigo integer NOT NULL,' +
//                         ' def_descricao character varying(200),' +
//                         ' def_classe integer NOT NULL,' +
//                         ' CONSTRAINT PK_defeitos PRIMARY KEY (def_codigo)' +
//                         ' )');
//         Executar(' CREATE TABLE IF NOT EXISTS defeitos_classe(' +
//                         ' cla_codigo integer NOT NULL,' +
//                         ' cla_descricao character varying(200),' +
//                         ' CONSTRAINT PK_defeitos_classe PRIMARY KEY (cla_codigo)' +
//                         ' )');

//   CriarCampo('casasindicador', 'parametros', 'integer', '2', 'I');

//   CriarCampo('risco_severo', 'parametros', 'integer', '1', 'I');
//         CriarCampo('risco_alto', 'parametros', 'integer', '1', 'I');
//         CriarCampo('risco_medio', 'parametros', 'integer', '1', 'I');
//         CriarCampo('risco_baixo', 'parametros', 'integer', '1', 'I');
//
//   Executar(' ALTER TABLE parametros' +
//                         ' RENAME risco_severo TO risco_severo_pfo;');
//         Executar(' ALTER TABLE parametros' +
//                         ' RENAME risco_alto TO risco_alto_pfo;');
//         Executar(' ALTER TABLE parametros' +
//                         ' RENAME risco_medio TO risco_medio_pfo;');
//         Executar(' ALTER TABLE parametros' +
//                         ' RENAME risco_baixo TO risco_baixo_pfo;');

//   CriarCampo('email_risco', 'parametros', 'integer');

//      Executar(' CREATE TABLE IF NOT EXISTS processos_subsequentes(' +
//                         ' sub_codigo integer NOT NULL,' +
//                         ' pro_codigo integer NOT NULL,' +
//                         ' CONSTRAINT PK_processos_subsequentes PRIMARY KEY (sub_codigo, pro_codigo)' +
//                         ' )');
//         Executar(' CREATE TABLE IF NOT EXISTS processos_antecedentes(' +
//                         ' ant_codigo integer NOT NULL,' +
//                         ' pro_codigo integer NOT NULL,' +
//                         ' CONSTRAINT PK_processos_antecedentes PRIMARY KEY (ant_codigo, pro_codigo)' +
//                         ' )');

//   CriarCampo('hab_especificacao', 'habilidades', 'text');
//   CriarCampo('emp_Valores', 'empresa', 'text');
//   CriarCampo('emp_Visao', 'empresa', 'text');
//   CriarCampo('emp_Missao', 'empresa', 'text');

//   GravarNovaFuncao(40, 'CADASTRO DE CONTEXTOS', 40);
//   GravarNovaFuncao(41, 'CADASTRO DE PARTES INTERESSADAS', 41);
//   GravarNovaFuncao(42, 'ANÁLISE DE CONTEXTO', 42);
//   GravarNovaFuncao(44, 'PDCA', 44);
//   GravarNovaFuncao(47, 'RELATÓRIO DE CALIBRAÇÃO', 47);

end;


procedure TFormInicial.btnImpCalibracaoClick(Sender: TObject);
begin
   ImprimirCalibracao('I');
end;

procedure TFormInicial.btnVideoClick(Sender: TObject);
begin
   ImprimeAvalHab('V');
end;

procedure TFormInicial.btnImpPenClick(Sender: TObject);
begin
   ImprimirPendenciasHab('I');
end;

procedure TFormInicial.btnVideoPenClick(Sender: TObject);
begin
   ImprimirPendenciasHab('V');
end;

procedure TFormInicial.btnImpressoraTreClick(Sender: TObject);
begin
   ImprimirTreinamentos('I');
end;

procedure TFormInicial.btnMatrizImpressoraClick(Sender: TObject);
begin
   ImprimirPendenciasMatriz('I');
end;

procedure TFormInicial.btnMatrizVideoClick(Sender: TObject);
begin
   ImprimirPendenciasMatriz('V');
end;

procedure TFormInicial.btnSairImpClick(Sender: TObject);
begin
   pnlImprimirCalib.Visible:= False;
end;

procedure TFormInicial.btnVideoTreClick(Sender: TObject);
begin
   ImprimirTreinamentos('V');
end;

procedure TFormInicial.CadastrodeClientes1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 32, 'acesso') = 1 then begin
      FormCadClientes:= TFormCadClientes.Create(nil);
      FormCadClientes.ShowModal;
      FormCadClientes.Release;
   end;
end;

procedure TFormInicial.CadastrodeContexto1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 40, 'acesso') = 1 then begin
      FormCadContexto:= TFormCadContexto.Create(nil);
      FormCadContexto.ShowModal;
      FormCadContexto.Release;
   end;
end;

procedure TFormInicial.CadastrodeModelodeManuteno1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 15, 'acesso') = 1 then begin
      FormCadManutModelo:= TFormCadManutModelo.Create(nil);
      FormCadManutModelo.ShowModal;
      FormCadManutModelo.Release;
   end;
end;

procedure TFormInicial.ExecuodeManuteno1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 15, 'acesso') = 1 then begin
      FormCadManutencao:= TFormCadManutencao.Create(nil);
      FormCadManutencao.ShowModal;
      FormCadManutencao.Release;
   end;
end;


procedure TFormInicial.CadastrodeMododeRecuperaodeDocumentos1Click(
  Sender: TObject);
begin
   if Acesso(cUsuario, 9, 'acesso') = 1 then begin
      FormCadModoRecuperacao:= TFormCadModoRecuperacao.Create(nil);
      FormCadModoRecuperacao.ShowModal;
      FormCadModoRecuperacao.Release;
   end;
end;


procedure TFormInicial.CadastrodeMotivosdeRNC1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 54, 'acesso') = 1 then begin
      AbrirForm(TFormCadMotivoRNC, FormCadMotivoRNC);
   end;
end;

procedure TFormInicial.CadastrodeUsurios1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 16, 'acesso') = 1 then begin
      FormCadUsuarios:= TFormCadUsuarios.Create(nil);
      FormCadUsuarios.ShowModal;
      FormCadUsuarios.Release;
   end;
end;

procedure TFormInicial.CartadeAtualizao1Click(Sender: TObject);
begin
   FormCarta:= TFormCarta.Create(nil);
   FormCarta.iTela:= 1;
   FormCarta.ShowModal;
   FormCarta.Release;
end;

procedure TFormInicial.chkTodosProcessosClick(Sender: TObject);
begin
   dblProcessos.Enabled:= not chkTodosProcessos.Checked;
end;

procedure TFormInicial.chkTodosProcessoTreClick(Sender: TObject);
begin
   dblProcessoTre.Enabled:= not chkTodosProcessoTre.Checked;
end;

procedure TFormInicial.chkTodosProcMatrizClick(Sender: TObject);
begin
   dblProcMatriz.Enabled:= not chkTodosProcMatriz.Checked;
end;

procedure TFormInicial.chkTodosTreinamentoTreClick(Sender: TObject);
begin
   dblTreinamento.Enabled:= not chkTodosTreinamentoTre.Checked;
end;

procedure TFormInicial.chkTodosAvaliadoresClick(Sender: TObject);
begin
   dblAvaliador.Enabled:= not chkTodosAvaliadores.Checked;
end;

procedure TFormInicial.chkTodosColabClick(Sender: TObject);
begin
   dblColaborador.Enabled:= not chkTodosColab.Checked;
end;

procedure TFormInicial.chkTodosColabMatrizClick(Sender: TObject);
begin
   dblColabMatriz.Enabled:= not chkTodosColabMatriz.Checked;
end;

procedure TFormInicial.chkTodosColabTreClick(Sender: TObject);
begin
   dblColaboradorTre.Enabled:= not chkTodosColabTre.Checked;
end;

procedure TFormInicial.chkTodosFuncaoClick(Sender: TObject);
begin
   dblFuncoes.Enabled:= not chkTodosFuncao.Checked;
end;

procedure TFormInicial.ClassedoDefeito1Click(Sender: TObject);
begin
//   if Acesso(cUsuario, 6, 'acesso') = 1 then begin
      FormCadDefClasse:= TFormCadDefClasse.Create(nil);
      FormCadDefClasse.ShowModal;
      FormCadDefClasse.Release;
//   end;
end;

procedure TFormInicial.CadastrodeDefeitos1Click(Sender: TObject);
begin
   FormCadDefDefeitos:= TFormCadDefDefeitos.Create(nil);
   FormCadDefDefeitos.ShowModal;
   FormCadDefDefeitos.Release;
end;

procedure TFormInicial.CadastrodeOrigemdeRNC1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 55, 'acesso') = 1 then begin
      AbrirForm(TFormCadOrigemRNC, FormCadOrigemRNC);
   end;
end;

procedure TFormInicial.CadastrodeOrigemdoDefeito1Click(Sender: TObject);
begin
   FormCadDefOrigem:= TFormCadDefOrigem.Create(nil);
   FormCadDefOrigem.ShowModal;
   FormCadDefOrigem.Release;
end;

procedure TFormInicial.CadastrodePartesInteressadas1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 41, 'acesso') = 1 then begin
      FormCadPartesInteressadas:= TFormCadPartesInteressadas.Create(nil);
      FormCadPartesInteressadas.ShowModal;
      FormCadPartesInteressadas.Release;
   end;
end;

procedure TFormInicial.GerenciamentodeDefeitos1Click(Sender: TObject);
begin
   FormDefLancamentos:= TFormDefLancamentos.Create(nil);
   FormDefLancamentos.ShowModal;
   FormDefLancamentos.Release;
end;

procedure TFormInicial.Grficos1Click(Sender: TObject);
begin
//   if Acesso(cUsuario, 6, 'acesso') = 1 then begin
      FormGraficoPMC:= TFormGraficoPMC.Create(nil);
      FormGraficoPMC.ShowModal;
      FormGraficoPMC.Release;
//   end;
end;

procedure TFormInicial.Colaboradores1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 6, 'acesso') = 1 then begin
      FormCadColaboradores:= TFormCadColaboradores.Create(nil);
      FormCadColaboradores.ShowModal;
      FormCadColaboradores.Release;
   end;
end;

procedure TFormInicial.ColaboradoresProcedimentos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 33, 'acesso') = 1 then begin
      FormColabProcedimentos:= TFormColabProcedimentos.Create(nil);
      FormColabProcedimentos.ShowModal;
      FormColabProcedimentos.Release;
   end;
end;

procedure TFormInicial.Configuraodoemail1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 29, 'acesso') = 1 then begin
      FormConfigEmail:= TFormConfigEmail.Create(nil);
      FormConfigEmail.ShowModal;
      FormConfigEmail.Release;
   end;
end;

procedure TFormInicial.ConsultaAesdePMC1Click(Sender: TObject);
begin
//   if Acesso(cUsuario, 11, 'acesso') = 1 then begin
      FormCadPMCAcoesConsulta:= TFormCadPMCAcoesConsulta.Create(nil);
      FormCadPMCAcoesConsulta.ShowModal;
      FormCadPMCAcoesConsulta.Release;
//   end;
end;

procedure TFormInicial.ConsultadePMC1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 11, 'acesso') = 1 then begin
      FormCadPMCConsulta:= TFormCadPMCConsulta.Create(nil);
      FormCadPMCConsulta.ShowModal;
      FormCadPMCConsulta.Release;
   end;
end;

procedure TFormInicial.ConsultaRNC1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 56, 'acesso') = 1 then begin
      FormCadRNCConsulta:= TFormCadRNCConsulta.Create(nil);
      FormCadRNCConsulta.ShowModal;
      FormCadRNCConsulta.Release;
   end;
end;

procedure TFormInicial.Cronograma1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 60, 'acesso') = 1 then begin
      FormCadCronograma:= TFormCadCronograma.Create(nil);
      FormCadCronograma.ShowModal;
      FormCadCronograma.Release;
      FormCadCronograma.Free;
      FormCadCronograma:= nil;
   end;
end;

procedure TFormInicial.dbgPMCsemAcaoImediataDblClick(Sender: TObject);
begin
    if dmPendencias.cdsPMCsemAcaoImediata.RecordCount > 0 then begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= dmPendencias.cdsPMCsemAcaoImediata.FieldByName('codi_pmc').AsString;
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end
   else begin
      Application.MessageBox('Não existem pendências para esse item', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormInicial.dbgPMCDblClick(Sender: TObject);
begin
   if dmPendencias.cdsPMC.RecordCount > 0 then begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= dmPendencias.cdsPMC.FieldByName('codi_pmc').AsString;
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end
   else begin
      Application.MessageBox('Não existem pendências para esse item', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormInicial.dbgPMCSemCausaDblClick(Sender: TObject);
begin
   if dmPendencias.cdsPMCsemCausa.RecordCount > 0 then begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= dmPendencias.cdsPMCsemCausa.FieldByName('codi_pmc').AsString;
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end
   else begin
      Application.MessageBox('Não existem pendências para esse item', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormInicial.dbg2DblClick(Sender: TObject);
begin
   if dmPendencias.cdsRNCSemAceiteRecusa.RecordCount > 0 then begin
      if AcessoTartaruga('RNC') then begin
         FormCadRNCFecha:= TFormCadRNCFecha.Create(nil);
         FormCadRNCFecha.sCodigoRNC:= dmPendencias.cdsRNCSemAceiteRecusa.FieldByName('rnc_codigo').AsString;
         FormCadRNCFecha.iTela:= 1;
         FormCadRNCFecha.ShowModal;
         FormCadRNCFecha.Release;
         FreeAndNil(FormCadRNCFecha);
      end;
   end
   else begin
      Application.MessageBox('Não existem pendências para esse item', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormInicial.dbgPMCAcoesDblClick(Sender: TObject);
begin
   if dmPendencias.cdsPMCAcoes.RecordCount > 0 then begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= dmPendencias.cdsPMCAcoes.FieldByName('codi_pmc').AsString;
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end
   else begin
      Application.MessageBox('Não existem pendências para esse item', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormInicial.dbgRNCNaoRespondidaDblClick(Sender: TObject);
begin
   if dmPendencias.cdsRNCSemResposta.RecordCount = 0 then begin
      Application.MessageBox('Não existem pendências para esse item', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      if AcessoTartaruga('RNC') then begin
         FormCadRNCFecha:= TFormCadRNCFecha.Create(nil);
         FormCadRNCFecha.sCodigoRNC:= dmPendencias.cdsRNCSemResposta.FieldByName('rnc_codigo').AsString;
         FormCadRNCFecha.iTela:= 1;
         FormCadRNCFecha.ShowModal;
         FormCadRNCFecha.Release;
         FreeAndNil(FormCadRNCFecha);
      end;
   end;
end;

procedure TFormInicial.Empresa1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 1, 'acesso') = 1 then begin
      FormCadEmpresa:= TFormCadEmpresa.Create(nil);
      FormCadEmpresa.ShowModal;
      FormCadEmpresa.Release;
   end;
end;

procedure TFormInicial.ExportaoCA1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 1, 'acesso') = 1 then begin  // Cadastro de Empresas
      AbrirArquivo(ExtractFilePath(Application.ExeName) + 'Exp/DestraExp.exe', '');
   end;
end;

procedure TFormInicial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm.Conexao.Connected:= False;
end;

procedure TFormInicial.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if LoginOk then begin
      if Application.MessageBox('Confirma saída do sistema ?','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         dm.Conexao.Connected:= False;
         CanClose:= True;
      end
      else begin
         CanClose:= False;
      end;
   end;
end;

procedure TFormInicial.FormCreate(Sender: TObject);
var
   sStatusRegistro: string;
begin
   try
      with dm.Conexao do begin
         Connected:= False;
         HostName := Decript(LeIni('IP'));
         User     := Decript(LeIni('User'));
         Password := Decript(LeIni('Senha'));
         Database := Decript(LeIni('Database'));
         Port     := StrToInt(Decript(LeIni('Porta')));
         Connected:= True;
      end;
   except
      on E: Exception do begin
         FormMsgErro:= TFormMsgErro.Create(nil);
         FormMsgErro.sErro       := 'Erro ao conectar o banco de dados. Entre em contato com a Destra Consultoria.';
         FormMsgErro.sErroDelphi := E.Message;
         FormMsgErro.ShowModal;
         FormMsgErro.Release;
         Application.Terminate;
      end;
   end;

   // Acertos no banco de dados antes de atualizar as tabelas
   // Só para a versão 2.08 - Para as próximas versões tirar esse acerto
//   with dm.cdsAux do begin
//      Active:= False;
//      CommandText:= ' SELECT COUNT(*) Qtd FROM atualiza_banco' +
//                    ' WHERE atu_codi = 253';
//      Active:= True;
//   end;
//
//   if dm.cdsAux.FieldByName('Qtd').AsInteger = 0 then begin
//      with dm.cdsAuxiliar do begin
//         Active:= False;
//         CommandText:= ' SELECT a.relname AS Tabela, b.attname AS Campo' +
//                       ' FROM pg_class a' +
//                       ' JOIN pg_attribute b ON (b.attrelid = a.relfilenode)' +
//                       ' WHERE b.attstattarget = -1 AND' +
//                       '       a.relname = ' + QuotedStr('parametros') +
//                       '       AND  b.attname = ' + QuotedStr('pesoiqfavaliacao');
//         Active:= True;
//         if Recordcount > 0 then begin
//            Active:= False;
//            CommandText:= ' ALTER TABLE parametros DROP COLUMN pesoiqfavaliacao';
//            Execute;
//         end;
//
//         Active:= False;
//         CommandText:= ' SELECT a.relname AS Tabela, b.attname AS Campo' +
//                       ' FROM pg_class a' +
//                       ' JOIN pg_attribute b ON (b.attrelid = a.relfilenode)' +
//                       ' WHERE b.attstattarget = -1 AND' +
//                       '       a.relname = ' + QuotedStr('parametros') +
//                       '       AND  b.attname = ' + QuotedStr('pesoiqfpontualidade');
//         Active:= True;
//         if Recordcount > 0 then begin
//            Active:= False;
//            CommandText:= ' ALTER TABLE parametros DROP COLUMN pesoiqfpontualidade';
//            Execute;
//         end;
//
//         Active:= False;
//         CommandText:= ' SELECT a.relname AS Tabela, b.attname AS Campo' +
//                       ' FROM pg_class a' +
//                       ' JOIN pg_attribute b ON (b.attrelid = a.relfilenode)' +
//                       ' WHERE b.attstattarget = -1 AND' +
//                       '       a.relname = ' + QuotedStr('parametros') +
//                       '       AND  b.attname = ' + QuotedStr('pesoiqfconformidade');
//         Active:= True;
//         if Recordcount > 0 then begin
//            Active:= False;
//            CommandText:= ' ALTER TABLE parametros DROP COLUMN pesoiqfconformidade';
//            Execute;
//         end;
//
//         Active:= False;
//         CommandText:= ' SELECT a.relname AS Tabela, b.attname AS Campo' +
//                       ' FROM pg_class a' +
//                       ' JOIN pg_attribute b ON (b.attrelid = a.relfilenode)' +
//                       ' WHERE b.attstattarget = -1 AND' +
//                       '       a.relname = ' + QuotedStr('parametros') +
//                       '       AND  b.attname = ' + QuotedStr('notamaxhab');
//         Active:= True;
//         if Recordcount > 0 then begin
//            Active:= False;
//            CommandText:= ' ALTER TABLE parametros DROP COLUMN notamaxhab';
//            Execute;
//         end;
//
//         Active:= False;
//         CommandText:= ' DELETE FROM atualiza_banco WHERE atu_codi >= 157';
//         Execute;
//
//         Active:= False;
//         CommandText:= ' DELETE FROM tabela_combos WHERE tipo_com = 99 AND codi_com >= 43';
//         Execute;
//      end;
//   end;
   AtualizarBanco();

//   if not VerificaAutenticidadeSistema() then begin
//      Application.Terminate;
//   end;

   if VerificarConexaoInternet(False) = True then begin // Com internet
      try
         sStatusRegistro:= VerificarRegistro();
         if sStatusRegistro = 'N' then begin // Não liberado
            MostrarErro('O sistema não está liberado para uso. Entre em contato com a Destra Consultoria.','', 'Sistema não liberado');
            Application.Terminate;
         end;
         if sStatusRegistro = 'E' then begin // Data expirada
            MostrarErro('Período de licença expirado. Entre em contato com a Destra Consultoria.','', 'Sistema não liberado');
            Application.Terminate;
         end;
      except
         on E:Exception do begin
            MostrarErro('Erro ao validar liberação do sistema. Entre em contato com a Destra Consultoria.',E.Message, Self.Name);
         end;
      end;
   end
   else begin
      try
         sStatusRegistro:= VerificarRegistroOffLine();
         if sStatusRegistro = 'N' then begin // Não liberado
            MostrarErro('O sistema não está liberado para uso. Entre em contato com a Destra Consultoria.','', 'Sistema não liberado');
            Application.Terminate;
         end;
         if sStatusRegistro = 'E' then begin // Data expirada
            MostrarErro('Período de licença expirado. Entre em contato com a Destra Consultoria.','', 'Sistema não liberado');
            Application.Terminate;
         end;
      except
         on E:Exception do begin
            MostrarErro('Erro ao validar liberação do sistema. Entre em contato com a Destra Consultoria.',E.Message, Self.Name);
         end;
      end;;
   end;

   versao     := '2.10';
   nomeSistema:= 'Destra Manager';
end;

procedure TFormInicial.ImportaodeDadosTOTVS1Click(Sender: TObject);
begin
//   if Acesso(cUsuario, 1, 'acesso') = 1 then begin  // Cadastro de Empresas
      AbrirArquivo(ExtractFilePath(Application.ExeName) + 'Spiltag/ImportarTOTVS.exe', '', 'N');
//   end;
end;

procedure TFormInicial.FormShow(Sender: TObject);
var
   aDadosEmpresa: TStringList;
//   Reg, cExpira: String;
//   DataVenc: TDateTime;
begin
   if not VerificarProjetoCEA() then begin
      Exportao1.Visible:= False;
   end;

   if not VerificarProjetoSpiltag() then begin
      Spiltag1.Visible:= False;
   end;

   Self.Caption:= nomeSistema + ' - Versão ' + versao;

   EnviarEmailAutomatico();

   Application.CreateForm(TFormLogin, FormLogin);
   FormLogin.ShowModal;

//   Application.CreateForm(TFormEmailAuto, FormEmailAuto);
//   FormEmailAuto.ShowModal;

   if not LoginOk then begin
      Self.Close;
   end;

   aDadosEmpresa:= TStringList.Create;
   aDadosEmpresa:= BuscarNomeEmpresa();

   StatPrincipal.Panels[0].Text:= 'DATA: ' + DateToStr(DATE());
   StatPrincipal.Panels[1].Text:= 'USUÁRIO: ' + cUsuario;
   StatPrincipal.Panels[2].Text:= 'SERVIDOR: ' + dm.Conexao.HostName;
   StatPrincipal.Panels[3].Text:= 'EMPRESA: ' + aDadosEmpresa[0];

//   with cdsEmpresa do begin
//      Active:= False;
//      CommandText:= ' SELECT emp_escopo, emp_politica' +
//                    ' FROM empresa';
//      Active:= True;
//
//      mmoEscopo.Text  := FieldByName('emp_escopo').AsString;
//      mmoPolitica.Text:= FieldByName('emp_politica').AsString;
//   end;

   // Verifica se tem conexão de internet para mostrar a mensagem na tela inicial
   if VerificarConexaoInternet(False) = False then begin // Sem conexão a internet
      pnlInternet.Visible:= True;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT mostra_carta FROM parametros';
      Active:= True;

      if FieldByName('mostra_carta').AsString = 'S' then begin
         FormCarta:= TFormCarta.Create(nil);
         FormCarta.iTela:= 2;
         FormCarta.ShowModal;
         FormCarta.Release;
      end;
   end;

   // Grava os meses do intervalo do último mês gravado até o atual
   GravarMesesMetaIndicadores(FormatDateTime('yyyymm', Date()));

   // Verifica as pendências para o Dashboard
   VerificarPendencias();

   // Gera o gráfico de PMC
   InicializarGraf();
end;

procedure TFormInicial.Fornecedores1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 25, 'acesso') = 1 then begin
      FormCadFornecedores:= TFormCadFornecedores.Create(nil);
      FormCadFornecedores.ShowModal;
      FormCadFornecedores.Release;
   end;
end;

procedure TFormInicial.Funes1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 5, 'acesso') = 1 then begin
      FormCadFuncoes:= TFormCadFuncoes.Create(nil);
      FormCadFuncoes.ShowModal;
      FormCadFuncoes.Release;
   end;
end;

procedure TFormInicial.GerenciadordeProcessos1Click(Sender: TObject);
begin
   FormProcessos:= TFormProcessos.Create(nil);
   FormProcessos.ShowModal;
   FormProcessos.Release;
   FreeAndNil(FormProcessos);

//   t_Principal:= Tt_Principal.Create(nil);
//   t_Principal.ShowModal;
//   t_Principal.Release;
end;

procedure TFormInicial.Habilidades1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 4, 'acesso') = 1 then begin
      FormCadHabilidades:= TFormCadHabilidades.Create(nil);
      FormCadHabilidades.ShowModal;
      FormCadHabilidades.Release;
   end;
end;

procedure TFormInicial.ImpactosAmbientais1Click(Sender: TObject);
begin
   FormCadImpactos:= TFormCadImpactos.Create(nil);
   FormCadImpactos.ShowModal;
   FormCadImpactos.Release;
end;

procedure TFormInicial.ImprimeAvalHab(tipo: string);
var
   rMediaGeral, rMediaNotas: Real;
   sWhere, sGroup: string;
   iQtd: Integer;
   sNotaMaxHab: string;
   sCodCol: string;
begin
   if (chkTodosProcessos.Checked = False) AND ((dblProcessos.KeyValue = Null) OR (dblProcessos.KeyValue = -1)) then begin
      Application.MessageBox('Selecione um Processo ou marque TODOS !', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcessos);
      Exit;
   end;
   if (chkTodosFuncao.Checked = False) AND ((dblFuncoes.KeyValue = Null) OR (dblFuncoes.KeyValue = -1)) then begin
      Application.MessageBox('Selecione uma Função ou marque TODOS !', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblFuncoes);
      Exit;
   end;
   if (chkTodosColab.Checked = False) AND ((dblColaborador.KeyValue = Null) OR (dblColaborador.KeyValue = -1)) then begin
      Application.MessageBox('Selecione um Colaborador ou marque TODOS !', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblColaborador);
      Exit;
   end;
   if (chkTodosAvaliadores.Checked = False) AND ((dblAvaliador.KeyValue = Null) OR (dblAvaliador.KeyValue = -1)) then begin
      Application.MessageBox('Selecione um Avaliador ou marque TODOS !', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblAvaliador);
      Exit;
   end;

   // Busca a nota máxima nos parametros
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT notamaxhab FROM parametros';
      Active:= True;

      sNotaMaxHab:= FieldByName('notamaxhab').AsString;
   end;

   case rgAgrupaAvHab.ItemIndex of
      0: begin // Habilidade
         // Where para os subSelects
         sWhere:= ' ';
         sGroup:= ' GROUP BY CH.codi_hab, H.desc_hab';
         if chkTodosColab.Checked = False then begin
            sWhere:= sWhere + ' AND codi_col = ' + FloatToStr(dblColaborador.KeyValue);
            sGroup:= sGroup + ', CH.codi_col ';
         end;
         if chkTodosProcessos.Checked = False then begin
            sWhere:= sWhere + ' AND proc_col = ' + FloatToStr(dblProcessos.KeyValue);
            sGroup:= sGroup + ', C.proc_col ';
         end;
         if chkTodosFuncao.Checked = False then begin
            sWhere:= sWhere + ' AND func_col = ' + FloatToStr(dblFuncoes.KeyValue);
            sGroup:= sGroup + ', C.func_col ';
         end;

         with cdsHabTotal do begin
            Active:= False;
            CommandText:= ' SELECT CH.codi_hab, H.desc_hab, SUM(nota_hab) as totnota,' +
                          ' (SELECT COUNT(*) FROM colab_habilidades CH1' +
                          ' INNER JOIN colaboradores C ON C.codi_col = CH1.codi_col AND C.col_status = 1 ' +
                          ' WHERE codi_hab = CH.codi_hab AND hab_ano = ' + QuotedStr(spnAno.Text) + sWhere + ') * ' + sNotaMaxHab + ' as totpossivel,' +
                          ' SUM(nota_hab) / ((SELECT COUNT(*) FROM colab_habilidades CH2' +
                          ' INNER JOIN colaboradores C ON C.codi_col = CH2.codi_col AND C.col_status = 1 ' +
                          ' WHERE codi_hab = CH.codi_hab AND hab_ano = ' + QuotedStr(spnAno.Text) + sWhere + ') * ' + sNotaMaxHab + ') * 100 as percentual' +
                          ' FROM colab_habilidades CH' +
                          ' INNER JOIN habilidades H ON H.codi_hab = CH.codi_hab' +
                          ' INNER JOIN colaboradores C ON C.codi_col = CH.codi_col AND C.col_status = 1' +
                          ' WHERE CH.hab_ano = ' + QuotedStr(spnAno.Text);

            if chkTodosColab.Checked = False then begin
               CommandText:= CommandText + ' AND CH.codi_col = ' + FloatToStr(dblColaborador.KeyValue);
            end;
            if chkTodosProcessos.Checked = False then begin
               CommandText:= CommandText + ' AND C.proc_col = ' + FloatToStr(dblProcessos.KeyValue);
            end;
            if chkTodosFuncao.Checked = False then begin
               CommandText:= CommandText + ' AND C.func_col = ' + FloatToStr(dblFuncoes.KeyValue);
            end;

            CommandText:= CommandText + sGroup + ' ORDER BY desc_hab';
            Active:= True;

            if cdsHabTotal.RecordCount = 0 then begin
               Application.MessageBox('Não há dados para os critérios selecionados', 'Aviso', MB_OK + MB_ICONWARNING);
               Exit;
            end;

            First;

            rMediaGeral:= 0;
            iQtd:= 0;
            while not Eof do begin
               rMediaGeral:= rMediaGeral + FieldByName('percentual').AsFloat;
               iQtd:= iQtd + 1;
               Next;
            end;

            rMediaGeral:= rMediaGeral / iQtd;
         end;

         with frxReport1 do begin
            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AvalHabTotal.fr3');

            Variables['varMedia']:= rMediaGeral;
            Variables['varPeriodo']:= spnAno.Text;

            if tipo = 'I' then begin
      //       Imprimir direto
               PrepareReport;
      //            PrintOptions.Printer:= 'CutePDF Writer';
               PrintOptions.ShowDialog:= True;
               Print;
            end
            else begin
               ShowReport;
            end;
         end;
      end;
      1: begin // Colaboradores
         with cdsAvalHab do begin
            Active:= False;
            CommandText:= ' SELECT C.codi_col, C.nome_col, C.col_avaliador, F.desc_fun, CH.codi_col, CH.hab_ano, ' +
                          ' (SELECT SUM(CH2.nota_hab) FROM colab_habilidades CH2 ' +
                          '     WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) + ') AS TotPontos,' +
                          ' (SELECT AVG(CH2.nota_hab) FROM colab_habilidades CH2 ' +
                          '     WHERE ';
                          if chkNotaZerada.Checked = True then begin
                              CommandText:= CommandText + ' CH2.nota_hab > 0 AND';
                          end;
                          CommandText:= CommandText +
                          '     CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) + ') AS MediaPontos, ' +
                          ' (SELECT COUNT(*) FROM colab_habilidades CH2' +
                          ' INNER JOIN habilidades H ON H.codi_hab = CH2.codi_hab ' +
                          '      WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) + ') AS TotalHab, ' +
                          ' CH.codi_col, CH.codi_hab, CH.nota_hab, CH.hab_ano, H.desc_hab, ' +
                          ' (SELECT nome_col FROM colaboradores WHERE codi_col = CA.ava_codavaliador) as Avaliador,' +
                          ' CA.ava_codavaliador' +
                          ' FROM colab_habilidades CH' +
                          ' INNER JOIN colaboradores C ON C.codi_col = CH.codi_col' +
                          ' INNER JOIN funcoes F ON F.codi_fun = C.func_col' +
                          ' INNER JOIN habilidades H on H.codi_hab = CH.codi_hab' +
                          ' LEFT JOIN colab_avaliador CA ON CA.ava_codcolaborador = CH.codi_col AND ava_ano = ' + QuotedStr(spnAno.Text) +
                          ' WHERE CH.hab_ano = ' + QuotedStr(spnAno.Text) +
                          ' AND C.col_status = 1';

            if chkTodosColab.Checked = False then begin
               CommandText:= CommandText + ' AND CH.codi_col = ' + FloatToStr(dblColaborador.KeyValue);
            end;
            if chkTodosProcessos.Checked = False then begin
               CommandText:= CommandText + ' AND C.proc_col = ' + FloatToStr(dblProcessos.KeyValue);
            end;
            if chkTodosFuncao.Checked = False then begin
               CommandText:= CommandText + ' AND C.func_col = ' + FloatToStr(dblFuncoes.KeyValue);
            end;
            if chkTodosAvaliadores.Checked = False then begin
               CommandText:= CommandText + ' AND CA.ava_codavaliador = ' + FloatToStr(dblAvaliador.KeyValue);
            end;
            if chkNotaZerada.Checked = True then begin
               CommandText:= CommandText + ' AND CH.nota_hab > 0';
            end;
            CommandText:= CommandText + ' ORDER BY C.nome_col, desc_hab';
            Active:= True;

            if cdsAvalHab.RecordCount = 0 then begin
               Application.MessageBox('Não há dados para os critérios selecionados', 'Aviso', MB_OK + MB_ICONWARNING);
               Exit;
            end;

            First;

            rMediaNotas:= FieldByName('MediaPontos').AsFloat;
            iQtd:= 1;
            sCodCol:= FieldByName('codi_col').AsString;
            while not Eof do begin
//               rMediaNotas:= rMediaNotas + FieldByName('nota_hab').AsFloat;
               if sCodCol <> FieldByName('codi_col').AsString then begin
                  rMediaNotas:= rMediaNotas + FieldByName('MediaPontos').AsFloat;
                  iQtd:= iQtd + 1;
               end;
               Next;
            end;
            rMediaNotas:= rMediaNotas / iQtd;
         end;

         sWhere:= ' WHERE col_status = 1';
         if chkTodosColab.Checked = False then begin
            sWhere:= sWhere + ' AND codi_col = ' + FloatToStr(dblColaborador.KeyValue);
         end;
         if chkTodosProcessos.Checked = False then begin
            sWhere:= sWhere + ' AND proc_col = ' + FloatToStr(dblProcessos.KeyValue);
         end;
         if chkTodosFuncao.Checked = False then begin
            sWhere:= sWhere + ' AND func_col = ' + FloatToStr(dblFuncoes.KeyValue);
         end;

         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT Count(*) as QtdCol, CH.codi_col,' +
                          ' (SELECT SUM(CH2.nota_hab) FROM colab_habilidades CH2 ' +
                          '    WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) + ') / ' +
                          ' ((SELECT COUNT(*) FROM colab_habilidades CH2 ' +
                          ' WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) + ' ) * ' + sNotaMaxHab +') * 100 as media ' +
//                          ' ((SELECT SUM(CH2.nota_hab) FROM colab_habilidades CH2' +
//                          '     WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) + ') /' +
//                          '     ((SELECT COUNT(*) FROM colab_habilidades CH2' +
//                          '      WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + QuotedStr(spnAno.Text) +
//                          ' ) * 4) * 100) / (SELECT COUNT(*) FROM colaboradores ' + sWhere + ') as Total' +
                          ' FROM colab_habilidades CH' +
                          ' INNER JOIN colaboradores C ON C.codi_col = CH.codi_col AND C.col_status = 1' +
                          ' WHERE CH.hab_ano = ' + QuotedStr(spnAno.Text);
            if chkTodosColab.Checked = False then begin
               CommandText:= CommandText + ' AND CH.codi_col = ' + FloatToStr(dblColaborador.KeyValue);
            end;
            if chkTodosProcessos.Checked = False then begin
               CommandText:= CommandText + ' AND C.proc_col = ' + FloatToStr(dblProcessos.KeyValue);
            end;
            if chkTodosFuncao.Checked = False then begin
               CommandText:= CommandText + ' AND C.func_col = ' + FloatToStr(dblFuncoes.KeyValue);
            end;

            CommandText:= CommandText + ' GROUP BY CH.hab_ano, CH.codi_col';
            Active:= True;

            First;

            rMediaGeral:= 0;
            iQtd:= 0;
            while not Eof do begin
               rMediaGeral:= rMediaGeral + FieldByName('media').AsFloat;
               iQtd:= iQtd + 1;
               Next;
            end;
            rMediaGeral:= rMediaGeral / iQtd;
         end;

         with frxReport1 do begin
            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AvalHabilidades.fr3');

            Variables['varMediaGeral']:= rMediaGeral;
            Variables['varNotaMaxHab']:= sNotaMaxHab;
            Variables['varMediaNotas']:= rMediaNotas;

            if tipo = 'I' then begin
      //       Imprimir direto
               PrepareReport;
      //            PrintOptions.Printer:= 'CutePDF Writer';
               PrintOptions.ShowDialog:= True;
               Print;
            end
            else begin
               ShowReport;
            end;
         end;
      end;
   end;
end;

procedure TFormInicial.ImprimirTreinamentos(tipo: string);
var
   sOrdem: string;
begin
   if rgAgrupa.ItemIndex = 0 then begin
      sOrdem:= 'C.nome_col, T.desc_tre';
   end
   else begin
      sOrdem:= 'T.desc_tre, C.nome_col';
   end;

   if Acesso(cUsuario, 31, 'acesso') = 1 then begin
      with cdsImpTreinamentos do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, T.desc_tre, CT.dtpr_tre, CT.dtre_tre, CT.tipo_tre' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE CT.codi_col = C.codi_col';
         if rgFiltroTre.ItemIndex = 1 then begin // Realizados
            CommandText:= CommandText +
                       ' AND CT.dtre_tre IS NOT NULL';
         end;
          if rgFiltroTre.ItemIndex = 2 then begin // Não Realizados
            CommandText:= CommandText +
                       ' AND (CT.dtpr_tre < now() OR CT.dtpr_tre IS NULL) AND (CT.dtre_tre = ' + QuotedStr('30/12/1899') + ' OR CT.dtre_tre IS NULL)';
         end;
         CommandText:= CommandText + ' AND C.col_status = 1'; // Ativos
         if chkTodosColabTre.Checked = False then begin
            CommandText:= CommandText + ' AND CT.codi_col = ' + IntToStr(dblColaboradorTre.KeyValue);
         end;
         if chkTodosTreinamentoTre.Checked = False then begin
            CommandText:= CommandText + ' AND CT.codi_tre = ' + IntToStr(dblTreinamento.KeyValue);
         end;
         if chkTodosProcessoTre.Checked = False then begin
            CommandText:= CommandText + ' AND C.proc_col = ' + IntToStr(dblProcessoTre.KeyValue);
         end;
         CommandText:= CommandText + ' ORDER BY ' + sOrdem;

         Active:= True;
      end;

      if cdsImpTreinamentos.RecordCount = 0 then begin
         Application.MessageBox('Não há dados para os critérios selecionados', 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      with frxReport1 do begin
         if rgAgrupa.ItemIndex = 0 then begin
            if rgFiltroTre.ItemIndex <= 1 then begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_TreinamentosRealizadosCol.fr3');
            end
            else begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_TreinamentosAbertosCol.fr3');
            end;
         end
         else begin
            if rgFiltroTre.ItemIndex <= 1 then begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_TreinamentosRealizadosTre.fr3');
            end
            else begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_TreinamentosAbertosTre.fr3');
            end;
         end;

         if tipo = 'I' then begin
   //       Imprimir direto
            PrepareReport;
            PrintOptions.ShowDialog:= True;
            Print;
         end
         else begin
            ShowReport;
         end;
      end;
   end;
end;

procedure TFormInicial.ImprimirCalibracao(TipoImp: string);
var
   sCampoOrdem: string;
begin
   case rgOrdemImpressao.ItemIndex of
      0: sCampoOrdem:= 'cali_numero';
      1: sCampoOrdem:= 'desc_inf';
      2: sCampoOrdem:= 'cali_proxCalibracao';
   end;

   with cdsCalibracao do begin
      Active:= False;
      CommandText:= ' SELECT cali_dataCalibracao, cali_numero, I.desc_inf, cali_localizacao,' +
                    ' cali_proxCalibracao, nome_pro as DescProcesso' +
                    ' FROM calibracao C' +
                    ' INNER JOIN infraestrutura I on I.codi_inf = C.cali_equip' +
                    ' INNER JOIN processos P ON P.codi_pro = cali_processo' +
                    ' WHERE cali_proxCalibracao = (SELECT MAX(cali_proxCalibracao) FROM calibracao WHERE cali_numero = C.cali_numero)' +
                    ' ORDER BY DescProcesso, ' + sCampoOrdem;
//      CommandText:= ' SELECT cali_capacidade, cali_codigo, cali_criterio,' +
//                    ' cali_dataCalibracao, cali_equip, cali_erro, cali_faixa,' +
//                    ' cali_frequencia, cali_localizacao, cali_numero, cali_padroes,' +
//                    ' cali_parecer, cali_proxCalibracao, cali_resolucao, cali_certificado,' +
//                    ' cali_processo, cali_arquivo, cali_incerteza, cali_erroTotal, cali_aprovado, ' +
//                    ' I.codi_inf, I.desc_inf, nome_pro as DescProcesso' +
//                    ' FROM calibracao C' +
//                    ' INNER JOIN infraestrutura I on I.codi_inf = C.cali_equip ' +
//                    ' INNER JOIN processos P ON P.codi_pro = cali_processo' +
//                    ' ORDER BY DescProcesso, ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsCalibracao.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Imprimir('rel_Calibracao', frxReport1, TipoImp);
end;

procedure TFormInicial.ImprimirPendenciasHab(TipoImp: string);
var
   sCampoOrdem, sWhere: string;
begin
   if rgAgrupaHab.ItemIndex = 0 then begin // Habilidade
      sCampoOrdem:= 'habilidade'
   end
   else begin // Nome Colaborador
      sCampoOrdem:= 'nome_col'
   end;

   if rgFiltroHab.ItemIndex = 0 then begin
      sWhere:= ''
   end
   else begin
      sWhere:= ' AND ch.nota_hab <= ' + BuscarNotaMinimaHab();
   end;

   with cdsImpressaoHab do begin
      Active:= False;
      CommandText:= ' SELECT ch.codi_col, c.nome_col, ch.codi_hab, h.desc_hab habilidade, ' +
                    ' ch.nota_hab nota, ch.codi_pla, ch.hab_ano, ' +
                    ' CASE  ' +
                    '    when ch.nota_hab < ' + BuscarNotaMinimaHab() + ' THEN ' +
                    QuotedStr('Verificar se houve um plano de ação') +
                    ' ELSE ' + QuotedStr('Habilidade dentro da meta') +
                    ' END as Acao' +
                    ' FROM colab_habilidades ch' +
                    ' INNER JOIN habilidades h on h.codi_hab = ch.codi_hab' +
                    ' INNER JOIN Colaboradores C ON C.codi_col = ch.codi_col' +
                    ' WHERE hab_ano = ' + QuotedStr(edtAno.Text) +
                    ' AND C.col_status = 1' +
                    sWhere +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImpressaoHab.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      if rgAgrupaHab.ItemIndex = 0 then begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_HabilidadesPendHab.fr3');
      end
      else begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_HabilidadesPendCol.fr3');
      end;

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

procedure TFormInicial.Indicadores1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 13, 'acesso') = 1 then begin
//      AbrirForm(TFormCadIndicadores, FormCadIndicadores);
      FormCadIndicadores:= TFormCadIndicadores.Create(nil);
      FormCadIndicadores.ShowModal;
      FormCadIndicadores.Release;
   end;
end;

procedure TFormInicial.Infraestrutura1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 14, 'acesso') = 1 then begin
      AbrirForm(TFormCadInfraestrutura, FormCadInfraestrutura);
   end;
end;

procedure TFormInicial.iposdeProduto1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 28, 'acesso') = 1 then begin
      AbrirForm(TFormCadTipoProduto, FormCadTipoProduto);
   end;
end;

procedure TFormInicial.IQF1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 22, 'acesso') = 1 then begin
      AbrirForm(TFormCadIQF, FormCadIQF);
   end;
end;

procedure TFormInicial.LAAIA1Click(Sender: TObject);
begin
   //      if Acesso(cUsuario, 20, 'acesso') = 1 then begin
      AbrirForm(TFormLaaia, FormLaaia);
//      end;
end;

procedure TFormInicial.ListadeHabilidadescomPendncia1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 45, 'acesso') = 1 then begin
      AbrePanel(pnlPendenciasHab, Self);

      rgAgrupaHab.ItemIndex:= 1;
      rgFiltroHab.Items[1]:= 'Notas <= ' + BuscarNotaMinimaHab();
      rgFiltroHab.ItemIndex:= 1;
      edtAno.Text:= FormatDateTime('yyyy',Date());
      edtAno.SelectAll;
   end;
end;

procedure TFormInicial.ListadeTreinamentosnoRealizados1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 46, 'acesso') = 1 then begin
      AbrePanel(pnlTreinamentos, Self);

      cdsColab.Active:= False;
      cdsColab.Active:= True;

      cdsTreinamentos.Active:= False;
      cdsTreinamentos.Active:= True;

      with cdsProcessos do begin
         Active:= False;
         CommandText:= ' SELECT codi_pro, nome_pro ' +
                       ' FROM processos' +
                       ' WHERE pro_exibelista = ' + QuotedStr('S') +
                       ' ORDER BY nome_pro';
         Active:= True;
      end;

      rgAgrupa.ItemIndex:= 0;
      rgFiltroTre.ItemIndex:= 0;
   end;
end;

procedure TFormInicial.ListaMestra1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 7, 'acesso') = 1 then begin
      AbrirForm(TFormCadListaMestra, FormCadListaMestra);
//      FormCadListaMestra:= TFormCadListaMestra.Create(nil);
//      FormCadListaMestra.ShowModal;
//      FormCadListaMestra.Release;
   end;
end;

procedure TFormInicial.LogdeDocumentosVisualizados1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 26, 'acesso') = 1 then begin
      FormLog:= TFormLog.Create(nil);
      FormLog.ShowModal;
      FormLog.Release;
   end;
end;

procedure TFormInicial.ManutenoPreventiva1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 15, 'acesso') = 1 then begin
      FormCadManutPreventiva:= TFormCadManutPreventiva.Create(nil);
      FormCadManutPreventiva.ShowModal;
      FormCadManutPreventiva.Release;
   end;
end;

procedure TFormInicial.Metrologia1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 23, 'acesso') = 1 then begin
      FormCadCalibracao:= TFormCadCalibracao.Create(nil);
      FormCadCalibracao.ShowModal;
      FormCadCalibracao.Release;
   end;
end;

procedure TFormInicial.ParmetrosdoSistema1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 43, 'acesso') = 1 then begin
      FormCadParametros:= TFormCadParametros.Create(nil);
      FormCadParametros.ShowModal;
      FormCadParametros.Release;
   end;
end;

procedure TFormInicial.PDCA2Click(Sender: TObject);
begin
   if Acesso(cUsuario, 44, 'acesso') = 1 then begin
      AbrirForm(TFormPDCA, FormPDCA);
   end;
end;

procedure TFormInicial.ImprimirPendenciasMatriz(TipoImp: string);
var
   sWhere: string;
begin
   sWhere:= '';
   if (dblProcMatriz.KeyValue <> -1) and (dblProcMatriz.KeyValue <> null) and (not chkTodosProcMatriz.Checked) then begin
      sWhere:= sWhere + ' AND codi_pro = ' + QuotedStr(dblProcMatriz.KeyValue);
   end;
   if (dblColabMatriz.KeyValue <> -1) and (dblColabMatriz.KeyValue <> null) and (not chkTodosColabMatriz.Checked) then begin
      sWhere:= sWhere + ' AND codi_col = ' + QuotedStr(dblColabMatriz.KeyValue);
   end;

   if Acesso(cUsuario, 31, 'acesso') = 1 then begin
      with cdsImpressao do begin
         Active:= False;
         CommandText:= ' WITH consulta AS (' +
                       ' SELECT C.codi_col, C.nome_col, F.desc_fun, ' +
                       ' (select orde_com from tabela_combos' +
                       ' where tipo_com = 7 and codi_com = expe_fun) >' +
                       ' (select orde_com from tabela_combos' +
                       ' where tipo_com = 7 and codi_com = expe_col) as Experiencia, ' +
                       ' TC.orde_com <= TF.orde_com as Educacao,' +
                       ' expe_fun, educ_fun, expe_col, educ_col,' +
                       ' (SELECT Count(*) FROM colab_treinamentos CT INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       '     WHERE CT.codi_col = C.codi_col' +
                       '     and' +
                       '     ((CT.dtpr_tre < now() or CT.dtpr_tre is null) and (CT.dtre_tre = ' + QuotedStr('30/12/1899') + ' or CT.dtre_tre is null))) as PendTreinam,' +
                       ' (SELECT Count(*) ' +
                       '    FROM colab_treinamentos CT' +
                       '    INNER JOIN planoacao P ON P.codi_pla = CT.codi_pla' +
                       ' WHERE CT.codi_col = C.codi_col and P.efic_pla = ' + QuotedStr('0') + ') as PendTreinamEficaz,' + // Eficazes
                       ' (SELECT Count(*) ' +
                       '    FROM colab_treinamentos CT' +
                       '    INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre ' + // novo
                       '    WHERE CT.codi_col = C.codi_col) as QtdTreinamentos,' +
                       ' P.codi_pro, P.nome_pro,' +
                       ' (SELECT Count(*) FROM colab_habilidades CH' +
                       '  INNER JOIN Habilidades HB ON HB.codi_hab = CH.codi_hab' +
                       ' WHERE CH.codi_col = C.codi_col' +
                       ' and CH.nota_hab <= 2 and CH.hab_ano = ' + QuotedStr(FormatDateTime('yyyy', Date())) + ') as PendHab' +
                       ' FROM funcoes F' +
                       ' INNER JOIN colaboradores C on codi_fun = func_col' +
                       ' INNER JOIN tabela_combos TC ON TC.codi_com = C.educ_col and TC.tipo_com = 6' +
                       ' INNER JOIN tabela_combos TF ON TF.codi_com = F.educ_fun and TF.tipo_com = 6' +
                       ' INNER JOIN processos P ON P.codi_pro = C.proc_col ' +
                       ' WHERE col_status = 1' + // Ativos
                       sWhere +
                       ' ORDER BY C.nome_col' +
                       ')' +
                       ' SELECT * FROM consulta';
                       if chkSomentePendencias.Checked then begin
                          CommandText:= CommandText + ' WHERE  PendTreinam > 0 OR pendtreinameficaz < qtdtreinamentos OR pendhab > 0 OR educacao = false OR experiencia = true';
                       end;
         Active:= True;

         if RecordCount = 0 then begin
            Application.MessageBox('Não há registros para os filtros selecionados', 'Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_PendenciasMatriz.fr3');

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

procedure TFormInicial.PendnciasGerais1Click(Sender: TObject);
begin
   pnlPendenciasMatriz.Top    := Self.Height div 2 - pnlPendenciasMatriz.Height div 2;
   pnlPendenciasMatriz.Left   := Self.Width div 2 - pnlPendenciasMatriz.Width div 2;
   pnlPendenciasMatriz.Visible:= True;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   cdsColab.Active:= False;
   cdsColab.Active:= True;
end;

procedure TFormInicial.Processos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 2, 'acesso') = 1 then begin
      FormCadProcessos:= TFormCadProcessos.Create(nil);
      FormCadProcessos.ShowModal;
      FormCadProcessos.Release;
   end;
end;

procedure TFormInicial.Produtos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 29, 'acesso') = 1 then begin
      FormCadProdutos:= TFormCadProdutos.Create(nil);
      FormCadProdutos.ShowModal;
      FormCadProdutos.Release;
   end;
end;

procedure TFormInicial.ProgramadeAuditoriaInterna1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 19, 'acesso') = 1 then begin
      FormAuditoriaInterna:= TFormAuditoriaInterna.Create(nil);
      FormAuditoriaInterna.ShowModal;
      FormAuditoriaInterna.Release;
   end;
end;

procedure TFormInicial.ProgramadeAuditoriaInterna2Click(Sender: TObject);
begin
   if Acesso(cUsuario, 49, 'acesso') = 1 then begin
      FormAuditoriaInterna2015:= TFormAuditoriaInterna2015.Create(nil);
      FormAuditoriaInterna2015.ShowModal;
      FormAuditoriaInterna2015.Release;
   end;
end;

procedure TFormInicial.RegistrodePlanejamentodeMudanas1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 9, 'acesso') = 1 then begin
      FormCadPlanMudanca:= TFormCadPlanMudanca.Create(nil);
      FormCadPlanMudanca.ShowModal;
      FormCadPlanMudanca.Release;
   end;
end;

procedure TFormInicial.RegistrodoSistema1Click(Sender: TObject);
begin
   FormAtivaSistema:= TFormAtivaSistema.Create(nil);
   FormAtivaSistema.ShowModal;
   FormAtivaSistema.Release;
end;

procedure TFormInicial.RegistrosdaQualidade1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 9, 'acesso') = 1 then begin
      FormCadRegistros:= TFormCadRegistros.Create(nil);
      FormCadRegistros.ShowModal;
      FormCadRegistros.Release;
   end;
end;

procedure TFormInicial.reinamentos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 3, 'acesso') = 1 then begin
      FormCadTreinamentos:= TFormCadTreinamentos.Create(nil);
      FormCadTreinamentos.ShowModal;
      FormCadTreinamentos.Release;
   end;
end;

procedure TFormInicial.RelatriodeAuditoriaInterna1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 20, 'acesso') = 1 then begin
      FormRelatorioAuditoria:= TFormRelatorioAuditoria.Create(nil);
      FormRelatorioAuditoria.ShowModal;
      FormRelatorioAuditoria.Release;
   end;
end;

procedure TFormInicial.RelatriodeAuditoriaInterna2Click(Sender: TObject);
begin
   if Acesso(cUsuario, 50, 'acesso') = 1 then begin
      FormRelatorioAuditoria2015:= TFormRelatorioAuditoria2015.Create(nil);
      FormRelatorioAuditoria2015.ShowModal;
      FormRelatorioAuditoria2015.Release;
   end;
end;

procedure TFormInicial.RelatriodeCalibrao1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 47, 'acesso') = 1 then begin
      with cdsEquip do begin
         Active:= False;
         Active:= True;
      end;

      rgOrdemImpressao.ItemIndex:= 2;

      AbrePanel(pnlImprimirCalib, Self);
   end;
end;

procedure TFormInicial.RelatriodeManutenoPreventiva1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 59, 'acesso') = 1 then begin
      Application.CreateForm(TFormRelatorioGeral, FormRelatorioGeral);
      try
         FormRelatorioGeral.sTitulo:= 'Relatório de Manutenção Preventiva';
         FormRelatorioGeral.iCodRel:= 1;
         FormRelatorioGeral.ShowModal;
         FormRelatorioGeral.Release;
      finally
         FreeAndNil(FormRelatorioGeral);
      end;
   end;
end;

procedure TFormInicial.RelatriodeTreinamentos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 58, 'acesso') = 1 then begin
      AbrirForm(TFormPesqTreinamentos, FormPesqTreinamentos);
   end;
end;

procedure TFormInicial.RequisitosLegais1Click(Sender: TObject);
begin
//      if Acesso(cUsuario, 20, 'acesso') = 1 then begin
   FormLira:= TFormLira.Create(nil);
   FormLira.ShowModal;
   FormLira.Release;
//      end;
end;

procedure TFormInicial.ResumodosIndicadores1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 24, 'acesso') = 1 then begin
      FormResumoInd:= TFormResumoInd.Create(nil);
      FormResumoInd.ShowModal;
      FormResumoInd.Release;
   end;
end;

procedure TFormInicial.rgAgrupaClick(Sender: TObject);
begin
   if rgAgrupa.ItemIndex = 1 then begin
      dblColaboradorTre.Top:= 223;
      lblColaboradorTre.Top:= 208;
      chkTodosColabTre.Top := 229;
      dblColaboradorTre.KeyValue:= Null;
      chkTodosColabTre.Checked  := True;


      dblTreinamento.Top        := 60;
      lblTreinamento.Top        := 44;
      chkTodosTreinamentoTre.Top:= 65
   end;

   if rgAgrupa.ItemIndex = 0 then begin
      dblColaboradorTre.Top:= 60;
      lblColaboradorTre.Top:= 44;
      chkTodosColabTre.Top := 65;

      dblTreinamento.Top        := 223;
      lblTreinamento.Top        := 208;
      chkTodosTreinamentoTre.Top:= 229;
      dblTreinamento.KeyValue       := Null;
      chkTodosTreinamentoTre.Checked:= True;
   end;
end;

procedure TFormInicial.RiscoseDanos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 51, 'acesso') = 1 then begin
      AbrirForm(TFormCadDanos,FormCadDanos);
   end;
end;

procedure TFormInicial.ListadePerigoseAvaliaodosRiscos1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 52, 'acesso') = 1 then begin
      // Não pode usar AbrirForm nesse formulário, pois é feito um teste
      // na pesquisa de leis que só funciona abrindo o Form dessa forma
      FormPerigos:= TFormPerigos.Create(nil);
      FormPerigos.ShowModal;
      FormPerigos.Release;
   end;
end;

procedure TFormInicial.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure TFormInicial.sbAlteraSenhaClick(Sender: TObject);
begin
   AbrirForm(TFormAlteraSenha, FormAlteraSenha);
end;

procedure TFormInicial.sbAuditoriaClick(Sender: TObject);
begin
   if Acesso(cUsuario, 63, 'acesso') = 1 then begin
//      AbrirForm(TFormAuditoriaAuto, FormAuditoriaAuto);
      FormAuditoriaAuto:= TFormAuditoriaAuto.Create(nil);
      FormAuditoriaAuto.ShowModal;
      FormAuditoriaAuto.Release;
   end;
end;

procedure TFormInicial.sbDashboardClick(Sender: TObject);
begin
   // Verifica as pendências para o Dashboard
   VerificarPendencias();
end;

procedure TFormInicial.sbLogoffClick(Sender: TObject);
begin
   FormLogin:= TFormLogin.Create(nil);
   FormLogin.ShowModal;
   FormLogin.Release;
end;

procedure TFormInicial.sbSairAvalClick(Sender: TObject);
begin
   pnlAvalHab.Visible:= False;
end;

procedure TFormInicial.sbSairHabClick(Sender: TObject);
begin
   pnlPendenciasHab.Visible:= False;
end;

procedure TFormInicial.sbSairMatrizClick(Sender: TObject);
begin
   pnlPendenciasMatriz.Visible:= False;
end;

procedure TFormInicial.sbSairTreClick(Sender: TObject);
begin
   pnlTreinamentos.Visible:= False;
end;

procedure TFormInicial.Sobre1Click(Sender: TObject);
begin
   FormSobre:= TFormSobre.Create(nil);
   FormSobre.ShowModal;
   FormSobre.Release;
end;

procedure TFormInicial.statPrincipalDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
   with StatusBar.Canvas do begin
      // fundo Preto
      Brush.Color := clBtnFace;
      FillRect(Rect);
      //fonte amarela e negrito
      Font.Style := [FsBold];
      Font.Color := clBlack;
      TextOut(Rect.Left + Font.Size, Rect.Top + 1, Panel.Text);
   end;
end;

procedure TFormInicial.stgIndicadoresDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
//var
//   Texto: string;
begin
//   Texto:= stgIndicadores.Cells[aCol,ARow];
//
//   stgIndicadores.Brush.Style := (bsSolid);
//
//   if ARow = 0 then begin
//      stgIndicadores.Canvas.Font.Style:=[fsbold]; // negrito
//      SetTExtAlign(stgIndicadores.canvas.handle,TA_CENTER);
//      stgIndicadores.Canvas.TextOut(Rect.Left + 30, Rect.Top, Texto);
//   end
//   else begin
//      stgIndicadores.Canvas.Font.Style:=[];
//   end;
//
//   stgIndicadores.Canvas.Rectangle(Rect.Left,Rect.Top,Rect.Right,Rect.Bottom);
//
////   SetTextAlign(stgIndicadores.canvas.handle, TA_CENTER);
////   stgIndicadores.Canvas.TextOut(trunc((Rect.Left + Rect.Right)/2),Rect.Top+3, Texto);


end;

procedure TFormInicial.VariveisExternas1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 35, 'acesso') = 1 then begin
      FormCadRiscoVarExternas:= TFormCadRiscoVarExternas.Create(nil);
      FormCadRiscoVarExternas.ShowModal;
      FormCadRiscoVarExternas.Release;
   end;
end;

procedure TFormInicial.VariveisInternas1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 36, 'acesso') = 1 then begin
      FormCadRiscoVarInternas:= TFormCadRiscoVarInternas.Create(nil);
      FormCadRiscoVarInternas.ShowModal;
      FormCadRiscoVarInternas.Release;
   end;
end;

procedure TFormInicial.VerificarPendencias;
var
   sRiscoBaixo, sRiscoMedio, sRiscoAlto, sRiscoSevero: Integer;
   sProcessosUsu: string;
   wDia, wMes, wAno: Word;
   iMesAnterior: Integer;
   i: Integer;
   dDataVerificacaoInd: string; // Pega o dia que considera pra mostrar que o indicador está desatualizado - TT162
begin
   // Busca quais pendências serão mostradas na tela inicial para o usuário
   // conforme configuração no cadastro de usuários (aba pendências)
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT usu_pend_habilidades, usu_pend_analisecritica,' +
                    ' usu_pend_pdcaacoes, usu_pend_manutpreventiva, usu_pend_colexperiencia,' +
                    ' usu_pend_coleducacao, usu_pend_treinprevisao, usu_pend_treineficacia,' +
                    ' usu_pend_avaliacao, usu_pend_procedimentos, usu_pend_forn, usu_pend_pmcacoes,' +
                    ' usu_pend_pmc, usu_pend_calibracao, usu_pend_indicadores, usu_pend_pmc_causa,' +
                    ' usu_pend_pmc_acaoimediata, usu_pend_rnc_naopreenchido, usu_pend_rnc_aceite' +
                    ' FROM usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;
   end;

   // Verifica se tem indicadores fora do prazo para os processos do usuário
   // cadastrados no cadastro de usuários
   if dm.cdsAuxiliar.FieldByName('usu_pend_indicadores').AsInteger = 1 then begin
      stgIndicadores.RowCount:= 2;
      stgIndicadores.Cells[0,0]:= 'Indicador';
      stgIndicadores.Cells[1,0]:= 'Processo';

      // Busca os processos do usuário
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT usu_nome, usu_proc, P.nome_pro' +
                       ' FROM usuarios_processos U' +
                       ' INNER JOIN processos P ON P.codi_pro = U.usu_proc' +
                       ' WHERE U.usu_nome = ' + QuotedStr(cUsuario);
         Active:= True;
         First;

         sProcessosUsu:= '';
         while not Eof do begin
            sProcessosUsu:= sProcessosUsu + FieldByName('usu_proc').AsString + ',';
            Next;
         end;
         sProcessosUsu:= Copy(sProcessosUsu, 1, Length(sProcessosUsu) - 1);
      end;

      // Busca os indicadores do processo.
      if sProcessosUsu <> EmptyStr then begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT codi_ind, desc_ind, peri_ind, P.nome_pro ' +
                          ' FROM Indicadores' +
                          ' INNER JOIN processos P ON P.codi_pro = proc_ind' +
                          ' WHERE proc_ind IN (' + sProcessosUsu + ')' +
                          ' AND ind_monitoramento = 0' +
                          ' AND ind_status = 1';
       // Acertar aqui se não tiver processos para o usuário
            Active:= True;
            First;

            // Verifica se a última atualização do indicador está cadastrado conforme a periodicidade
            while not Eof do begin
               DecodeDate(date,wAno, wMes, wDia);
               // Determina o mês de atualização do indicador conforme a periodicidade
               case FieldByName('peri_ind').AsInteger of
                  0: iMesAnterior:= (wAno * 100) + wMes - 1;
                  1: iMesAnterior:= (wAno * 100) + wMes - 2;
                  2: iMesAnterior:= (wAno * 100) + wMes - 3;
                  3: iMesAnterior:= (wAno * 100) + wMes - 6;
                  4: iMesAnterior:= (wAno * 100) + wMes - 12;
                  5: iMesAnterior:= (wAno * 100) + wMes - 24;
                  6: iMesAnterior:= (wAno * 100) + wMes - 36;
                  7: iMesAnterior:= (wAno * 100) + wMes - 48;
               end;

               if (Copy(IntToStr(iMesAnterior),5,2) = '00') or (StrToInt(Copy(IntToStr(iMesAnterior),5,2)) >= 13) then begin
                  case FieldByName('peri_ind').AsInteger of
                     0: iMesAnterior:= iMesAnterior - 88;
                     1: iMesAnterior:= iMesAnterior - 88;
                     2: iMesAnterior:= iMesAnterior - 88;
                     3: iMesAnterior:= iMesAnterior - 88;
                     4: iMesAnterior:= iMesAnterior - 88;
                     5: iMesAnterior:= iMesAnterior - 176;
                     6: iMesAnterior:= iMesAnterior - 264;
                     7: iMesAnterior:= iMesAnterior - 352;
                  end;
               end;

               with dm.cdsAux2 do begin
                  Active:= False;
                  CommandText:= ' SELECT V.codi_ind, V.proc_vin, I.desc_ind, I.peri_ind, V.peri_vin ' +
                                ' FROM valor_indicador V' +
                                ' INNER JOIN indicadores I ON I.codi_ind = V.codi_ind' +
                                ' WHERE V.codi_ind = ' + dm.cdsAux.FieldByName('codi_ind').AsString +
                                ' AND peri_vin >= ' + IntToStr(iMesAnterior);
                  Active:= True;

                  if dm.cdsAux2.RecordCount = 0 then begin
                     // Verifica a data gravada em parâmetros para definir se aparece a pendência do indicador
                     // Projeto TT162
                     if VerificaPendIndicador(iMesAnterior) = True then begin
                        stgIndicadores.Cells[0,stgIndicadores.RowCount-1]:= dm.cdsAux.FieldByName('desc_ind').AsString;
                        stgIndicadores.Cells[1,stgIndicadores.RowCount-1]:= dm.cdsAux.FieldByName('nome_pro').AsString;
                        stgIndicadores.RowCount:= stgIndicadores.RowCount + 1;
                     end;
                  end;
               end;

               Next;
            end;
            stgIndicadores.RowCount:= stgIndicadores.RowCount - 1;

            if stgIndicadores.RowCount > 1 then begin
               cpnlIndicadores.Caption:= 'Indicadores desatualizados - ' + IntToStr(stgIndicadores.RowCount - 1) + ' pendência(s)';
            end
            else begin
               cpnlIndicadores.Caption:= 'Indicadores desatualizados ';
            end;
         end;
      end;
      cpnlIndicadores.Visible:= True;
   end
   else begin
      cpnlIndicadores.Visible:= False;
   end;

   // Verifica se tem PMC com previsão de eficácia vencida
   if dm.cdsAuxiliar.FieldByName('usu_pend_pmc').AsInteger = 1 then begin
      with dmPendencias.cdsPMC do begin
         Active:= False;
         CommandText:= ' SELECT codi_pmc, nume_pmc, data_pmc, TC.valo_com as Tipo,  ' +
                       ' C.nome_col as Responsavel,  TC1.valo_com as Eficaz, pmc_preveficacia' +
                       ' FROM pmc P' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 and TC.codi_com = P.tipo_pmc' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 21 and TC1.codi_com = P.efic_pmc' +
                       ' INNER JOIN colaboradores C ON C.codi_col = P.resp_pmc' +
                       ' WHERE pmc_preveficacia <= ' + ArrumaDataSQL(Date()) +
                       ' AND efic_pmc = 2' + // Em Espera
                       ' ORDER BY nume_pmc';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlPMC.Caption:= 'PMC com previsão de eficácia vencida - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlPMC.Caption:= 'PMC com previsão de eficácia vencida';
         end;
      end;
      cpnlPMC.Visible:= True;
   end
   else begin
      cpnlPMC.Visible:= False;
   end;

   // Verifica se tem ações do PMC com prazo vencido
   if dm.cdsAuxiliar.FieldByName('usu_pend_pmcacoes').AsInteger = 1 then begin
      with dmPendencias.cdsPMCAcoes do begin
         Active:= False;
         CommandText:= ' SELECT P.codi_pmc, P.nume_pmc, PA.desc_aco,' +
                       ' C.nome_col as ResponsavelAcao, PA.aco_prazo, PA.vimp_aco' +
                       ' FROM pmc P' +
                       ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = P.codi_pmc' +
                       ' INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco' +
                       ' WHERE PA.aco_prazo <= ' + ArrumaDataSQL(Date()) + ' AND PA.vimp_aco = ' + QuotedStr('') +
                       ' ORDER BY nume_pmc';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlPMCAcoes.Caption:= 'PMC com ações com prazo vencido - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlPMCAcoes.Caption:= 'PMC com ações com prazo vencido';
         end;
      end;
      cpnlPMCAcoes.Visible:= True;
   end
   else begin
      cpnlPMCAcoes.Visible:= False;
   end;

   // Verifica se tem PMC sem preenchimento de Ação Imediata
   if dm.cdsAuxiliar.FieldByName('usu_pend_pmc_acaoimediata').AsInteger = 1 then begin
      with dmPendencias.cdsPMCsemAcaoImediata do begin
         Active:= False;
         CommandText:= ' SELECT codi_pmc, nume_pmc, data_pmc, TC.valo_com as Tipo,  ' +
                       ' C.nome_col as Responsavel,  TC1.valo_com as Eficaz, pmc_preveficacia' +
                       ' FROM pmc P' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 and TC.codi_com = P.tipo_pmc' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 21 and TC1.codi_com = P.efic_pmc' +
                       ' INNER JOIN colaboradores C ON C.codi_col = P.resp_pmc' +
                       ' WHERE imed_pmc = ' + QuotedStr('') +
                       ' OR imed_pmc isnull' +
                       ' ORDER BY nume_pmc';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlPMCsemAcaoImediata.Caption:= 'PMC sem preenchimento de Ação Imediata - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlPMCsemAcaoImediata.Caption:= 'PMC sem preenchimento de Ação Imediata';
         end;
      end;
      cpnlPMCsemAcaoImediata.Visible:= True;
   end
   else begin
      cpnlPMCsemAcaoImediata.Visible:= False;
   end;

   // Verifica se tem PMC sem preenchimento de Identificação da Causa
   if dm.cdsAuxiliar.FieldByName('usu_pend_pmc_causa').AsInteger = 1 then begin
      with dmPendencias.cdsPMCsemCausa do begin
         Active:= False;
         CommandText:= ' SELECT codi_pmc, nume_pmc, data_pmc, TC.valo_com as Tipo,  ' +
                       ' C.nome_col as Responsavel,  TC1.valo_com as Eficaz, pmc_preveficacia' +
                       ' FROM pmc P' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 and TC.codi_com = P.tipo_pmc' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 21 and TC1.codi_com = P.efic_pmc' +
                       ' INNER JOIN colaboradores C ON C.codi_col = P.resp_pmc' +
                       ' WHERE caus_pmc = ' + QuotedStr('') +
                       ' OR caus_pmc isnull' +
                       ' ORDER BY nume_pmc';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlPMCsemCausa.Caption:= 'PMC sem preenchimento de Identificação de Causa - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlPMCsemCausa.Caption:= 'PMC sem preenchimento de Identificação de Causa';
         end;
      end;
      cpnlPMCsemCausa.Visible:= True;
   end
   else begin
      cpnlPMCsemCausa.Visible:= False;
   end;

   // Verifica se tem calibração vencida
   if dm.cdsAuxiliar.FieldByName('usu_pend_calibracao').AsInteger = 1 then begin
      with dmPendencias.cdsCalibracao do begin
         Active:= False;
//         CommandText:= ' SELECT cali_dataCalibracao, cali_numero, I.desc_inf, cali_localizacao,' +
//                    ' cali_proxCalibracao, nome_pro as DescProcesso' +
//                    ' FROM calibracao C' +
//                    ' INNER JOIN infraestrutura I on I.codi_inf = C.cali_equip' +
//                    ' INNER JOIN processos P ON P.codi_pro = cali_processo' +
//                    ' WHERE cali_proxCalibracao = (SELECT MAX(cali_proxCalibracao) FROM calibracao WHERE cali_numero = C.cali_numero)' +
         CommandText:= ' SELECT cali_codigo, cali_numero, I.desc_inf as Equipamento, cali_resolucao, cali_localizacao, ' +
                       ' cali_frequencia, cali_faixa, cali_capacidade, cali_criterio,' +
                       ' cali_certificado, cali_datacalibracao, cali_proxcalibracao, cali_padroes,' +
                       ' cali_erro, cali_parecer, cali_processo, cali_arquivo, cali_incerteza,' +
                       ' cali_errototal, cali_aprovado, cali_equip, cali_obs, P.nome_pro' +
                       ' FROM calibracao C' +
                       // Usado Inner Join para que os equipamentos excluídos não
                       // apareçam nas pendência(s) de calibração
                       ' INNER JOIN infraestrutura I ON I.codi_inf = cali_equip AND I.inf_status = 1' + // Ativos
                       ' INNER JOIN processos P ON P.codi_pro = cali_processo' +
                       ' WHERE cali_proxcalibracao <= ' + ArrumaDataSQL(Date()) +
                       ' AND cali_proxCalibracao = (SELECT MAX(cali_proxCalibracao) FROM calibracao WHERE cali_numero = C.cali_numero)';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlCalibracao.Caption:= 'Tabela de Calibração - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlCalibracao.Caption:= 'Tabela de Calibração';
         end;
      end;
      cpnlCalibracao.Visible:= True;
   end
   else begin
      cpnlCalibracao.Visible:= False;
   end;

   // Verifica se tem fornecedores com a avaliação vencida
   if dm.cdsAuxiliar.FieldByName('usu_pend_forn').AsInteger = 1 then begin
      with dmPendencias.cdsForn do begin
         Active:= False;
         CommandText:= ' SELECT forn_nome, forn_endereco, forn_numero, forn_bairro, forn_cidade,' +
                       '        forn_estado, forn_cep, forn_avaliacao, forn_obs, forn_fantasia,' +
                       '        forn_fone, forn_cnpj, forn_inscest, forn_validade, forn_area,' +
                       '        forn_contato, forn_mail, forn_certificado, forn_tipoprod, forn_status,' +
                       '        forn_codigo' +
                       ' FROM fornecedores' +
                       ' WHERE forn_status = 1 ' + // Ativos
                       ' AND forn_validade <= ' + ArrumaDataSQL(Date());
         Active:= True;

         if RecordCount > 0 then begin
            cpnlForn.Caption:= 'Fornecedores com homologação vencida - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlForn.Caption:= 'Fornecedores com homologação vencida';
         end;

         // Aparece somente para usuários com acesso ao cadastro de fornecedores
         if Acesso(cUsuario, 25, 'acesso', 'N') = 1 then begin
            cpnlForn.Visible:= True;
         end
         else begin
            cpnlForn.Visible:= False;
         end;
      end;
   end
   else begin
      cpnlForn.Visible:= False;
   end;

   // Verifica se tem procedimentos não aprovados
   if dm.cdsAuxiliar.FieldByName('usu_pend_procedimentos').AsInteger = 1 then begin
      with dmPendencias.cdsProcedimentos do begin
         Active:= False;
         CommandText:= ' SELECT codi_lis, iden_lis, desc_lis, revi_lis, tipo_lis, atua_lis, arqu_lis,' +
                       '        proc_lis, resp_lis, data_lis, apro_lis, dtap_lis, quem_lis, qtde_lis,' +
                       '        arma_lis, lis_treinamento' +
                       ' FROM lista_mestra' +
                       ' WHERE apro_lis = ' + QuotedStr('N');
         Active:= True;

         if RecordCount > 0 then begin
            cpnlProcedimentos.Caption:= 'Procedimentos não aprovados - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlProcedimentos.Caption:= 'Procedimentos não aprovados';
         end;
      end;
      cpnlProcedimentos.Visible:= True;
   end
   else begin
      cpnlProcedimentos.Visible:= False;
   end;

   // Verifica se tem treinamentos sem verificação de eficácia
   if dm.cdsAuxiliar.FieldByName('usu_pend_treineficacia').AsInteger = 1 then begin
      with dmPendencias.cdsEficaciaTre do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, CT.codi_col, T.desc_tre, CT.codi_tre, ' +
                       ' CT.dtpr_tre, CT.dtre_tre, CT.codi_pla, CT.tipo_tre, CT.tre_certificado' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col AND C.col_status = 1' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE (codi_pla = 0 OR codi_pla isnull) and (dtre_tre notnull)' +
//                       ' WHERE (codi_pla = 0 OR codi_pla isnull) and (dtpr_tre < ' + ArrumaDataSQL(Date()) + ')' +
                       ' ORDER BY C.nome_col, T.desc_tre';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlEficacia.Caption:= 'Treinamentos sem verificação de eficácia - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlEficacia.Caption:= 'Treinamentos sem verificação de eficácia';
         end;
      end;
      cpnlEficacia.Visible:= True;
   end
   else begin
      cpnlEficacia.Visible:= False;
   end;

   // Verifica se tem treinamentos com data de realização vencida
   if dm.cdsAuxiliar.FieldByName('usu_pend_treinprevisao').AsInteger = 1 then begin
      with dmPendencias.cdsTreinamentos do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, CT.codi_col, T.desc_tre, CT.codi_tre, ' +
                       ' CT.dtpr_tre, CT.dtre_tre, CT.codi_pla, CT.tipo_tre, CT.tre_certificado' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col AND C.col_status = 1' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE dtpr_tre is null OR (dtpr_tre < CURRENT_DATE AND dtre_tre is null)' +
                       ' ORDER BY C.nome_col, T.desc_tre';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlTreinamentos.Caption:= 'Treinamentos com previsão vencida ou sem data de previsão - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlTreinamentos.Caption:= 'Treinamentos com previsão vencida ou sem data de previsão';
         end;
      end;
      cpnlTreinamentos.Visible:= True;
   end
   else begin
      cpnlTreinamentos.Visible:= False;
   end;

   // Verifica se tem colaboradores com educação abaixo do exigido
   if dm.cdsAuxiliar.FieldByName('usu_pend_coleducacao').AsInteger = 1 then begin
      with dmPendencias.cdsEducacao do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, F.expe_fun, F.educ_fun, C.expe_col, ' +
                       ' C.educ_col, TC.orde_com as OrdemEduc,' +
                       ' TC.valo_com as EscCol, TC1.orde_com as OrdemEducF, TC1.valo_com as EscFun' +
                       ' FROM funcoes F' +
                       ' INNER JOIN colaboradores C ON F.codi_fun = C.func_col AND C.col_status = 1' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 6 AND cast(TC.codi_com as Integer) = C.educ_col' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 6 AND cast(TC1.codi_com as Integer) = F.educ_fun' +
                       ' WHERE col_status = 1 AND TC.orde_com > TC1.orde_com' +
                       ' AND col_validacao_educ_exp = 0' + // Flag de validação de Educação e Experiência
                       ' ORDER BY C.nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlEducacao.Caption:= 'Colaboradores com nível de educação abaixo do exigido - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlEducacao.Caption:= 'Colaboradores com nível de educação abaixo do exigido';
         end;
      end;
      cpnlEducacao.Visible:= True;
   end
   else begin
      cpnlEducacao.Visible:= False;
   end;

   // Verifica se tem colaboradores com Experiencia abaixo do exigido
   if dm.cdsAuxiliar.FieldByName('usu_pend_colexperiencia').AsInteger = 1 then begin
      with dmPendencias.cdsExperiencia do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, F.expe_fun, F.educ_fun, C.expe_col, C.educ_col, TC.orde_com as OrdemExp,' +
                       ' TC.valo_com as ExpCol, TC1.orde_com as OrdemExpF, TC1.valo_com as ExpFun' +
                       ' FROM funcoes F' +
                       ' INNER JOIN colaboradores C ON F.codi_fun = C.func_col AND C.col_status = 1' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 7 AND cast(TC.codi_com as Integer) = C.expe_col' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 7 AND cast(TC1.codi_com as Integer) = F.expe_fun' +
                       ' WHERE col_status = 1 AND TC.orde_com < TC1.orde_com' +
                       ' AND col_validacao_educ_exp = 0' + // Flag de validação de Educação e Experiência
                       ' ORDER BY C.nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlExperiencia.Caption:= 'Colaboradores com experiência abaixo do exigido - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlExperiencia.Caption:= 'Colaboradores com experiência abaixo do exigido';
         end;
      end;
      cpnlExperiencia.Visible:= True;
   end
   else begin
      cpnlExperiencia.Visible:= False;
   end;

   // Verifica se tem manutenção preventiva atrasada
   if dm.cdsAuxiliar.FieldByName('usu_pend_manutpreventiva').AsInteger = 1 then begin
      with dmPendencias.cdsManutencao do begin
         Active:= False;
         CommandText:= ' SELECT current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' as DataLimite, ' +
                       ' MAX(fec_data_realizado) as UltimaData, F.man_codigo, I.iden_inf || ' + QuotedStr('-') + ' || I.desc_inf as iden_inf,  M.oque_man, ' +
                       ' M.quan_man, TC.valo_com as Periodicidade ' +
                       ' FROM manutencao_fecha F' +
                       ' INNER JOIN manutencao M ON M.codi_man = F.man_codigo' +
                       ' INNER JOIN infraestrutura I ON I.codi_inf = M.codi_inf AND I.inf_status = 1' + // Ativos
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 19 AND TC.codi_com = cast(M.quan_man as integer)' +
   //                    ' WHERE M.proc_man = ' + QuotedStr(lblCodigo.Caption) +
                       ' GROUP BY F.man_codigo, M.quan_man, I.desc_inf, I.iden_inf, M.oque_man, TC.valo_com' +
                       ' HAVING current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' > MAX(fec_data_realizado)';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlManutencao.Caption:= 'Manutenções Preventivas pendentes - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlManutencao.Caption:= 'Manutenções Preventivas pendentes';
         end;
      end;
      cpnlManutencao.Visible:= True;
   end
   else begin
      cpnlManutencao.Visible:= False;
   end;

   // Verifica se tem ações de PDCA vencidas
   if dm.cdsAuxiliar.FieldByName('usu_pend_pdcaacoes').AsInteger = 1 then begin
      with dmPendencias.cdsPDCA do begin
         Active:= False;
         CommandText:= ' SELECT *' +
                       ' FROM pdca P' +
                       ' LEFT JOIN pdca_lanc L ON L.pdca_codigo = P.pdca_codigo' +
                       ' WHERE ((lan_quando < CURRENT_DATE AND lan_dtprevista isnull AND lan_datarealizada is null) OR' +
                       ' (lan_dtprevista < CURRENT_DATE AND lan_dtfinalizado is null))';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlPDCA.Caption:= 'Ações de PDCA vencidas ou PDCA sem ações determinadas - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlPDCA.Caption:= 'Ações de PDCA vencidas ou PDCA sem ações determinadas';
         end;
      end;
      cpnlPDCA.Visible:= True;
   end
   else begin
      cpnlPDCA.Visible:= False;
   end;

   // Verifica se tem ações de Análise Crítica vencidas e status Não Satisfaz ou Satisfaz Parcialmente
   if dm.cdsAuxiliar.FieldByName('usu_pend_analisecritica').AsInteger = 1 then begin
      with dmPendencias.cdsAnaliseCritica do begin
         Active:= False;
         CommandText:= ' SELECT codi_aac, codi_ana, pare_aac, praz_aac, resp_aac, said_aac, proc_aac,' +
                       '        dcad_aac, aac_resultados, P.nome_pro as processo,' +
                       ' CASE WHEN pare_aac = ' + QuotedStr('SP') + ' THEN ' + QuotedStr('SASTISFAZ PARCIALMENTE') +
                       '      WHEN pare_aac = ' + QuotedStr('NS') + ' THEN ' + QuotedStr('NÃO SASTISFAZ') +
                       ' END as parecer ' +
                       ' FROM analise_acoes A' +
                       ' INNER JOIN processos P ON P.codi_pro = A.proc_aac' +
                       ' WHERE praz_aac < CURRENT_DATE OR pare_aac <> ' + QuotedStr('S');
         Active:= True;

         if RecordCount > 0 then begin
            cpnlAnaliseCritica.Caption:= 'Ações de Análise Crítica vencidas ou que não tem parecer satisfatório - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlAnaliseCritica.Caption:= 'Ações de Análise Crítica vencidas ou que não tem parecer satisfatório';
         end;
      end;
      cpnlAnaliseCritica.Visible:= True;
   end
   else begin
      cpnlAnaliseCritica.Visible:= False;
   end;

   // Verifica se tem habilidades com nota menor que o mínimo cadastrado em parâmetros
   if dm.cdsAuxiliar.FieldByName('usu_pend_habilidades').AsInteger = 1 then begin
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT notapendencia, periodohab' +
                       ' FROM parametros';
         Active:= True;
      end;

      with dmPendencias.cdsHabilidade do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, HB.desc_hab, H.nota_hab, H.hab_ano' +
                       ' FROM colab_habilidades H' +
                       ' INNER JOIN Colaboradores C ON C.codi_col = H.codi_col AND C.col_status = 1' +
                       ' INNER JOIN Habilidades HB ON HB.codi_hab = H.codi_hab ' +
                       ' WHERE nota_hab <= ' + dm.cdsAux.FieldByName('notapendencia').AsString +
                       ' AND col_admissao + interval ' + QuotedStr(IntToStr(BuscarDiasPendHab()) + ' days') +
                       ' < ' + ArrumaDataSQL(Date());
   //                    ' AND H.hab_ano = ' + QuotedStr(sAnoHabilidade);
         Active:= True;

         if RecordCount > 0 then begin
            cpnlHabilidades.Caption:= 'Habilidades com nota menor igual a ' + dm.cdsAux.FieldByName('notapendencia').AsString + ' - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlHabilidades.Caption:= 'Habilidades com nota menor igual a ' + dm.cdsAux.FieldByName('notapendencia').AsString;
         end;
      end;
      cpnlHabilidades.Visible:= True;
   end
   else begin
      cpnlHabilidades.Visible:= False;
   end;

   // Verifica se tem habilidades vencidas conforme o parâmetro (1 ano, 2 anos ou 3 anos)
   if dm.cdsAuxiliar.FieldByName('usu_pend_avaliacao').AsInteger = 1 then begin
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT notapendencia, periodohab' +
                       ' FROM parametros';
         Active:= True;
      end;

      with dmPendencias.cdsHabVencida do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.nome_col, MAX(hab_ano) as UltimaAvaliacao' +
                       ' FROM colab_habilidades H' +
                       ' INNER JOIN Colaboradores C ON C.codi_col = H.codi_col AND C.col_status = 1' +
                       ' GROUP BY C.codi_col' +
                       ' HAVING CAST(MAX(hab_ano) as integer) < (SELECT EXTRACT(YEAR FROM CURRENT_DATE) - ' +
                       dm.cdsAux.FieldByName('periodohab').AsString + ')' +
                       ' ORDER BY C.nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlHabilidadeVencida.Caption:= 'Colaboradores com Avaliação de Habilidades vencida - ' + IntToStr(RecordCount) + ' pendência(s)';
         end
         else begin
            cpnlHabilidadeVencida.Caption:= 'Colaboradores com Avaliação de Habilidades vencida ';
         end;
      end;
      cpnlHabilidadeVencida.Visible:= True;
   end
   else begin
      cpnlHabilidadeVencida.Visible:= False;
   end;

   // Verifica se tem RNC não respondidas
   if dm.cdsAuxiliar.FieldByName('usu_pend_rnc_naopreenchido').AsInteger = 1 then begin
      with dmPendencias.cdsRNCSemResposta do begin
         Active:= False;
         CommandText:= ' SELECT rnc_codigo, rnc_identificacao, TC.valo_com as "Motivo", C.nome_col as Responsavel  ' +
                       ' FROM rnc' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = rnc_motivo' +
                       ' INNER JOIN colaboradores C ON C.codi_col = rnc_responsavel' +
                       ' WHERE rnc_status = 1' + // Sem resposta
                       ' ORDER BY rnc_identificacao';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlRNCNaoRespondida.Caption:= 'RNC sem resposta - ' + IntToStr(RecordCount) + ' pendência(s)';
            cpnlRNCNaoRespondida.Visible:= True;
         end
         else begin
            cpnlRNCNaoRespondida.Caption:= 'RNC sem resposta ';
            cpnlRNCNaoRespondida.Visible:= False;
         end;
      end;
   end
   else begin
      cpnlRNCNaoRespondida.Visible:= False;
   end;

   // Verifica se tem RNC sem aceite ou recusa
   if dm.cdsAuxiliar.FieldByName('usu_pend_rnc_aceite').AsInteger = 1 then begin
      with dmPendencias.cdsRNCSemAceiteRecusa do begin
         Active:= False;
         CommandText:= ' SELECT rnc_codigo, rnc_identificacao, TC.valo_com as "Motivo", C.nome_col as Responsavel  ' +
                       ' FROM rnc' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = rnc_motivo' +
                       ' INNER JOIN colaboradores C ON C.codi_col = rnc_emitido' +
                       ' WHERE rnc_status = 2' + // Sem Aceite/Recusa
                       ' ORDER BY rnc_identificacao';
         Active:= True;

         if RecordCount > 0 then begin
            cpnlRNCAceiteRecusa.Caption:= 'RNC sem Aceite/Recusa - ' + IntToStr(RecordCount) + ' pendência(s)';
            cpnlRNCAceiteRecusa.Visible:= True;
         end
         else begin
            cpnlRNCAceiteRecusa.Caption:= 'RNC sem Aceite/Recusa ';
            cpnlRNCAceiteRecusa.Visible:= False;
         end;
      end;
   end
   else begin
      cpnlRNCAceiteRecusa.Visible:= False;
   end;

   // Verifica se tem todos os PMC abertos para as análises de risco do processo
   // conforme configuração do tipo em parâmetros.
   // A eficácia do PMC não importa, basta estar aberto.

   // Busca a configuração em Parâmetros
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT risco_baixo_pf, risco_medio_pf, risco_alto_pf, risco_severo_pf' +
//                    ' FROM parametros';
//      Active:= True;
//
//      sRiscoBaixo := FieldByName('risco_baixo_pf').AsInteger;
//      sRiscoMedio := FieldByName('risco_medio_pf').AsInteger;
//      sRiscoAlto  := FieldByName('risco_alto_pf').AsInteger;
//      sRiscoSevero:= FieldByName('risco_severo_pf').AsInteger;
//   end;

   // Externa e Interna
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT *, ' +
                    ' CASE WHEN mac_consequencia = 1 THEN ' + QuotedStr('BAIXO') +
                    '      WHEN mac_consequencia = 2 THEN' +
                    '    CASE WHEN mac_probabilidade = 5 THEN ' + QuotedStr('BAIXO') +
                    '         WHEN mac_probabilidade = 1 THEN ' + QuotedStr('ALTO') +
                    '              WHEN mac_probabilidade <= 4 AND mac_probabilidade > 1 THEN ' + QuotedStr('MÉDIO') +
                    '         END' +
                    '      WHEN mac_consequencia = 3 THEN' +
                    '         CASE WHEN mac_probabilidade <= 2 THEN ' + QuotedStr('ALTO') +
                    '         WHEN mac_probabilidade >= 3 THEN ' + QuotedStr('MÉDIO') +
                    '         END' +
                    '      WHEN mac_consequencia = 4 THEN' +
                    '         CASE WHEN mac_probabilidade = 1 THEN ' + QuotedStr('SEVERO') +
                    '         WHEN mac_probabilidade = 5 THEN ' + QuotedStr('MÉDIO') +
                    '              WHEN mac_probabilidade >= 2 AND mac_probabilidade <= 4 THEN ' + QuotedStr('ALTO') +
                    '         END' +
                    '      WHEN mac_consequencia = 5 THEN' +
                    '         CASE WHEN mac_probabilidade >= 4 THEN ' + QuotedStr('MÉDIO') +
                    '              WHEN mac_probabilidade >= 1 AND mac_probabilidade <= 3 THEN ' + QuotedStr('SEVERO') +
                    '         END' +
                    '      ELSE ' + QuotedStr('SEM CLASSIFICAÇÃO') +
                    ' END as tipoRisco' +
                    ' FROM risco_macro' +
                    ' WHERE (mac_pmc isnull or mac_pmc = ' + QuotedStr('') + ')' +
                    ' UNION ' +
                    ' SELECT *,' +
                    ' CASE WHEN int_consequencia = 1 THEN ' + QuotedStr('BAIXO') +
                    '      WHEN int_consequencia = 2 THEN ' +
                    '         CASE WHEN int_probabilidade = 5 THEN ' + QuotedStr('BAIXO') +
                    '            WHEN int_probabilidade = 1 THEN ' + QuotedStr('ALTO') +
                    '            WHEN int_probabilidade <= 4 AND int_probabilidade > 1 THEN ' + QuotedStr('MÉDIO') +
                    '         END' +
                    '      WHEN int_consequencia = 3 THEN' +
                    '         CASE WHEN int_probabilidade <= 2 THEN ' + QuotedStr('ALTO') +
                    '            WHEN int_probabilidade >= 3 THEN ' + QuotedStr('MÉDIO') +
                    '         END' +
                    '      WHEN int_consequencia = 4 THEN' +
                    '         CASE WHEN int_probabilidade = 1 THEN ' + QuotedStr('SEVERO') +
                    '           WHEN int_probabilidade = 5 THEN ' + QuotedStr('MÉDIO') +
                    '           WHEN int_probabilidade >= 2 AND int_probabilidade <= 4 THEN ' + QuotedStr('ALTO') +
                    '         END' +
                    '      WHEN int_consequencia = 5 THEN' +
                    '         CASE WHEN int_probabilidade >= 4 THEN ' + QuotedStr('MÉDIO') +
                    '            WHEN int_probabilidade >= 1 AND int_probabilidade <= 3 THEN ' + QuotedStr('SEVERO') +
                    '         END' +
                    '      ELSE ' + QuotedStr('SEM CLASSIFICAÇÃO') +
                    ' END as tipoRisco' +
                    ' FROM risco_analiseint' +
                    ' WHERE (int_pmc isnull or int_pmc = ' + QuotedStr('') + ') ';
      Active:= True;
      First;

//      cdsRisco.Open;
//      cdsRisco.Active:= True;
//      while not Eof do begin
//         if (sRiscoBaixo = 1) and (FieldByName('tiporisco').AsString = 'BAIXO') then begin
////            cdsRisco.Edit;
//            cdsRisco.Append;
//            cdsRiscoCodigo.AsInteger:= FieldByName('mac_codigo').AsInteger;
//            cdsRisco.Post;
////            cdsRisco.ApplyUpdates(0);
//         end;
//         if (sRiscoMedio = 1) and (FieldByName('tiporisco').AsString = 'MÉDIO') then begin
////            cdsRisco.Edit;
//            cdsRisco.Append;
//            cdsRiscoCodigo.AsInteger:= FieldByName('mac_codigo').AsInteger;
//            cdsRisco.Post;
////            cdsRisco.ApplyUpdates(0);
//         end;
//         if (sRiscoAlto = 1) and (FieldByName('tiporisco').AsString = 'ALTO') then begin
////            cdsRisco.Edit;
//            cdsRisco.Append;
//            cdsRiscoCodigo.AsInteger:= FieldByName('mac_codigo').AsInteger;
//            cdsRisco.Post;
////            cdsRisco.ApplyUpdates(0);
//         end;
//         if (sRiscoSevero = 1) and (FieldByName('tiporisco').AsString = 'SEVERO') then begin
////            cdsRisco.Edit;
//            cdsRisco.Append;
//            cdsRiscoCodigo.AsInteger:= FieldByName('mac_codigo').AsInteger;
//            cdsRisco.Post;
////            cdsRisco.ApplyUpdates(0);
//         end;
//
//         Next;
//      end;
   end;

//
//
//      while not Eof do begin
//         sTipoRisco:= CalcularRisco(FieldByName('mac_consequencia').AsInteger, FieldByName('mac_probabilidade').AsInteger);
//
//         if (sRiscoBaixo = 1) and (sTipoRisco = 'BAIXO') then begin
//            iQtd:= iQtd + 1;
//         end;
//         if (sRiscoMedio = 1) and (sTipoRisco = 'MÉDIO') then begin
//            iQtd:= iQtd + 1;
//         end;
//         if (sRiscoAlto = 1) and (sTipoRisco = 'ALTO') then begin
//            iQtd:= iQtd + 1;
//         end;
//         if (sRiscoSevero = 1) and (sTipoRisco = 'SEVERO') then begin
//            iQtd:= iQtd + 1;
//         end;
//
//         Next;
//      end;
//   end;

   // Interna
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT *' +
//                    ' FROM risco_analiseint' +
//                    ' WHERE (int_pmc isnull or int_pmc = ' + QuotedStr('') + ')' +
//                    ' AND int_processo = ' + lblCodigo.Caption;
//      Active:= True;
//
//      while not Eof do begin
//         sTipoRisco:= CalcularRisco(FieldByName('int_consequencia').AsInteger, FieldByName('int_probabilidade').AsInteger);
//
//         if (sRiscoBaixo = 1) and (sTipoRisco = 'BAIXO') then begin
//            iQtd:= iQtd + 1;
//         end;
//         if (sRiscoMedio = 1) and (sTipoRisco = 'MÉDIO') then begin
//            iQtd:= iQtd + 1;
//         end;
//         if (sRiscoAlto = 1) and (sTipoRisco = 'ALTO') then begin
//            iQtd:= iQtd + 1;
//         end;
//         if (sRiscoSevero = 1) and (sTipoRisco = 'SEVERO') then begin
//            iQtd:= iQtd + 1;
//         end;
//
//         Next;
//      end;
//   end;

//   if iQtd <= 0 then begin
//      imgRisco.Picture:= imgOk.Picture;
//   end
//   else begin
//      imgRisco.Picture:= imgX.Picture;
//   end;

   cpnlPMC.Collapsed          := True;
   cpnlCalibracao.Collapsed   := True;
   cpnlForn.Collapsed         := True;
   cpnlProcedimentos.Collapsed:= True;
   cpnlCalibracao.Collapsed   := True;
   cpnlManutencao.Collapsed   := True;
   cpnlPMCAcoes.Collapsed     := True;
end;

procedure TFormInicial.VincularRiscoaoPMC1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 48, 'acesso') = 1 then begin
      FormCadPMCVinculo:= TFormCadPMCVinculo.Create(nil);
      FormCadPMCVinculo.ShowModal;
      FormCadPMCVinculo.Release;
   end;
end;

procedure TFormInicial.VisualizarProcedimentos1Click(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' select codi_col from colaboradores' +
                    ' where col_usuario = ' + QuotedStr(cUsuario);
      Active:= True;

      if RecordCount = 0 then begin
         Application.MessageBox(PChar('Não há colaborador relacionado com o usuário ' + cUsuario + '. Entre em contato com o administrador do sistema.'), 'Aviso', MB_OK + MB_ICONWARNING);
      end
      else begin
         if Acesso(cUsuario, 34, 'acesso') = 1 then begin
            FormVisualizaDocumentos:= TFormVisualizaDocumentos.Create(nil);
            FormVisualizaDocumentos.iTela:= 2;
            FormVisualizaDocumentos.sCodColaborador:= FieldByName('codi_col').AsString;
            FormVisualizaDocumentos.ShowModal;
            FormVisualizaDocumentos.Release;
         end;
      end;
   end;
end;

end.
