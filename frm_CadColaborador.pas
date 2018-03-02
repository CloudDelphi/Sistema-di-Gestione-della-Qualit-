unit frm_CadColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI;

type
  TFormCadColaboradores = class(TForm)
    pctColaboradores: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgColaboradores: TDBGrid;
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
    zqryEducacao: TZQuery;
    dspEducacao: TDataSetProvider;
    cdsEducacao: TClientDataSet;
    dsEducacao: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    frxReport1: TfrxReport;
    frxDBDSColaboradores: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl2: TLabel;
    lbl8: TLabel;
    lbl6: TLabel;
    dblEducacao: TDBLookupComboBox;
    edtNomeColaborador: TEdit;
    mmoObs: TMemo;
    dblExperiencia: TDBLookupComboBox;
    lbl5: TLabel;
    edtCodigo: TEdit;
    zqryExperiencia: TZQuery;
    dspExperiencia: TDataSetProvider;
    cdsExperiencia: TClientDataSet;
    dsExperiencia: TDataSource;
    tsTreinamentos: TTabSheet;
    lbl7: TLabel;
    lbl11: TLabel;
    edtCodigoTre: TEdit;
    edtNomeTre: TEdit;
    lbl13: TLabel;
    dblTreinamentos: TDBLookupComboBox;
    dbgTreinamentos: TDBGrid;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    zqryHabilidades: TZQuery;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    dsHabilidades: TDataSource;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    cdsHabilidadescodi_hab: TIntegerField;
    cdsHabilidadesdesc_hab: TWideStringField;
    zqryCurriculo: TZQuery;
    dspCurriculo: TDataSetProvider;
    cdsCurriculo: TClientDataSet;
    dsCurriculo: TDataSource;
    zqryHabilidadesCol: TZQuery;
    dspHabilidadesCol: TDataSetProvider;
    cdsHabilidadesCol: TClientDataSet;
    dsHabilidadesCol: TDataSource;
    cdsEducacaocodi_com: TLargeintField;
    cdsEducacaovalo_com: TWideStringField;
    cdsExperienciacodi_com: TLargeintField;
    cdsExperienciavalo_com: TWideStringField;
    lbl17: TLabel;
    dblFuncao: TDBLookupComboBox;
    lbl18: TLabel;
    dblProcesso: TDBLookupComboBox;
    lbl19: TLabel;
    dblSituacao: TDBLookupComboBox;
    tsEducacao: TTabSheet;
    lbl20: TLabel;
    edtCodigoEdu: TEdit;
    edtNomeEdu: TEdit;
    lbl21: TLabel;
    tsHabilidades: TTabSheet;
    lbl22: TLabel;
    edtNomeHab: TEdit;
    edtCodigoHab: TEdit;
    lbl23: TLabel;
    zqryFuncoes: TZQuery;
    dspFuncoes: TDataSetProvider;
    cdsFuncoes: TClientDataSet;
    dsFuncoes: TDataSource;
    cdsFuncoescodi_fun: TLargeintField;
    cdsFuncoesdesc_fun: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cdsCurriculocodi_his: TLargeintField;
    cdsCurriculocodi_col: TLargeintField;
    cdsCurriculode_his: TWideStringField;
    cdsCurriculoate_his: TWideStringField;
    cdsCurriculofunc_his: TWideStringField;
    cdsCurriculoempr_his: TWideStringField;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    cdsColaboradoresfunc_col: TLargeintField;
    cdsColaboradoreseduc_col: TLargeintField;
    cdsColaboradoresexpe_col: TLargeintField;
    cdsColaboradoresesco_col: TWideStringField;
    cdsColaboradoresconc_col: TWideStringField;
    cdsColaboradorescol_avaliador: TWideStringField;
    lbl26: TLabel;
    dblHabilidades: TDBLookupComboBox;
    zqryTreinamentosCol: TZQuery;
    dspTreinamentosCol: TDataSetProvider;
    cdsTreinamentosCol: TClientDataSet;
    dsTreinamentosCol: TDataSource;
    cdsTreinamentosColcodi_col: TLargeintField;
    cdsTreinamentosColcodi_tre: TLargeintField;
    cdsTreinamentosColcodi_pla: TLargeintField;
    cdsTreinamentosColtipo_tre: TWideStringField;
    cdsTreinamentosColdesc_tre: TWideStringField;
    dbg1: TDBGrid;
    edtEscola: TEdit;
    medtDe1: TMaskEdit;
    medtAte1: TMaskEdit;
    edtCaminho: TEdit;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    dblNivelEducacao: TDBLookupComboBox;
    dbgEducacao: TDBGrid;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    zqryEducacaoCol: TZQuery;
    dspEducacaoCol: TDataSetProvider;
    cdsEducacaoCol: TClientDataSet;
    dsEducacaoCol: TDataSource;
    cdsEducacaoColedu_codigo: TLargeintField;
    cdsEducacaoColedu_colaborador: TLargeintField;
    cdsEducacaoColedu_de: TWideStringField;
    cdsEducacaoColedu_ate: TWideStringField;
    cdsEducacaoColedu_grau: TIntegerField;
    cdsEducacaoColedu_escola: TWideStringField;
    cdsEducacaoColedu_anexo: TWideStringField;
    cdsColaboradoresDescFuncao: TStringField;
    cdsColaboradoresproc_col: TLargeintField;
    zqrySituacao: TZQuery;
    dspSituacao: TDataSetProvider;
    cdsSituacao: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsSituacao: TDataSource;
    opd1: TOpenDialog;
    cdsEducacaoColDescEducacao: TStringField;
    cdsHabilidadesColcodi_col: TLargeintField;
    cdsHabilidadesColcodi_hab: TLargeintField;
    cdsHabilidadesColdesc_hab: TWideStringField;
    cdsColaboradoresDescExperiencia: TStringField;
    cdsImprimircodi_col: TLargeintField;
    cdsImprimirnome_col: TWideStringField;
    cdsImprimirfunc_col: TLargeintField;
    cdsImprimirdesc_fun: TWideStringField;
    cdsImprimireduc_col: TLargeintField;
    cdsImprimirEducacao: TWideStringField;
    cdsImprimirexpe_col: TLargeintField;
    cdsImprimirExperiencia: TWideStringField;
    cdsImprimiresco_col: TWideStringField;
    cdsImprimirconc_col: TWideStringField;
    cdsImprimirobs_col: TMemoField;
    cdsImprimirproc_col: TLargeintField;
    cdsImprimirnome_pro: TWideStringField;
    cdsImprimirStatus: TWideStringField;
    dtDataPrevista: TDateEdit;
    lbl15: TLabel;
    lbl16: TLabel;
    dtDataRealizacao: TDateEdit;
    cbTipo: TComboBox;
    lbl32: TLabel;
    edtNota: TCurrencyEdit;
    lbl250: TLabel;
    edtAno: TEdit;
    lbl33: TLabel;
    cdsHabilidadesColnota_hab: TFloatField;
    cdsHabilidadesColhab_ano: TWideStringField;
    zqryUsuarios: TZQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    dsUsuarios: TDataSource;
    cdsUsuariosnome_usu: TWideStringField;
    Label1: TLabel;
    dblUsuario: TDBLookupComboBox;
    wdstrngfldColaboradorescol_usuario: TWideStringField;
    cdsColaboradorescol_email: TWideStringField;
    Label2: TLabel;
    edtEmail: TEdit;
    cdsImprimircol_email: TWideStringField;
    frxDBDSColabHab: TfrxDBDataset;
    frxDBDSColabTre: TfrxDBDataset;
    zqryImprimirHab: TZQuery;
    dspImprimirHab: TDataSetProvider;
    cdsImprimirHab: TClientDataSet;
    cdsImprimirTre: TClientDataSet;
    dspImprimirTre: TDataSetProvider;
    zqryImprimirTre: TZQuery;
    cdsImprimirHabcodi_col: TLargeintField;
    cdsImprimirHabnome_col: TWideStringField;
    cdsImprimirHabfunc_col: TLargeintField;
    cdsImprimirHabdesc_fun: TWideStringField;
    cdsImprimirHabeduc_col: TLargeintField;
    cdsImprimirHabEducacao: TWideStringField;
    cdsImprimirHabexpe_col: TLargeintField;
    cdsImprimirHabExperiencia: TWideStringField;
    cdsImprimirHabobs_col: TMemoField;
    cdsImprimirHabproc_col: TLargeintField;
    cdsImprimirHabnome_pro: TWideStringField;
    cdsImprimirHabStatus: TWideStringField;
    cdsImprimirHabcol_email: TWideStringField;
    cdsImprimirHabcodi_hab: TLargeintField;
    cdsImprimirHabdesc_hab: TWideStringField;
    cdsImprimirHabnota_hab: TFloatField;
    zqryColabRel: TZQuery;
    dspColabRel: TDataSetProvider;
    cdsColabRel: TClientDataSet;
    dsColabRel: TDataSource;
    cdsColabRelcodi_col: TLargeintField;
    cdsColabRelnome_col: TWideStringField;
    lbl35: TLabel;
    edtArquivo1: TEdit;
    sbArquivo1: TSpeedButton;
    sbVisualizar1: TSpeedButton;
    tsCurriculo: TTabSheet;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl12: TLabel;
    lbl14: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    edtCodigoCur: TEdit;
    edtNomeCur: TEdit;
    dbgCurriculo: TDBGrid;
    medtDe: TMaskEdit;
    medtAte: TMaskEdit;
    edtEmpresa: TEdit;
    edtFuncaoCur: TEdit;
    cdsColaboradoresobs_col: TWideMemoField;
    cdsImprimirHabhab_ano: TWideStringField;
    cdsColaboradorescol_status: TIntegerField;
    cdsTreinamentosColdtpr_tre: TDateTimeField;
    cdsTreinamentosColdtre_tre: TDateTimeField;
    cdsImprimirTrecodi_col: TLargeintField;
    cdsImprimirTrenome_col: TWideStringField;
    cdsImprimirTrefunc_col: TLargeintField;
    cdsImprimirTredesc_fun: TWideStringField;
    cdsImprimirTreeduc_col: TLargeintField;
    cdsImprimirTreeducacao: TWideStringField;
    cdsImprimirTreexpe_col: TLargeintField;
    cdsImprimirTreexperiencia: TWideStringField;
    cdsImprimirTreobs_col: TWideMemoField;
    cdsImprimirTreproc_col: TLargeintField;
    cdsImprimirTrenome_pro: TWideStringField;
    cdsImprimirTrestatus: TWideStringField;
    cdsImprimirTrecol_email: TWideStringField;
    cdsImprimirTrecodi_tre: TLargeintField;
    cdsImprimirTredesc_tre: TWideStringField;
    cdsImprimirTredtpr_tre: TDateTimeField;
    cdsImprimirTredtre_tre: TDateTimeField;
    cdsImprimirTretipo_tre: TWideStringField;
    cdsColaboradorescol_curriculo: TWideMemoField;
    btnInserirTodos: TBitBtn;
    pnlCopiarHab: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl10: TPanel;
    lbl37: TLabel;
    edtAnoCopia: TEdit;
    btnCopiarHab: TBitBtn;
    btnCancelarHab: TBitBtn;
    btnAvaliador: TBitBtn;
    lbl36: TLabel;
    edtTreCertificado: TEdit;
    sbAbreTreCertificado: TSpeedButton;
    sbVisualizaTreCertificado: TSpeedButton;
    cdsTreinamentosColtre_certificado: TWideStringField;
    tsDoc: TTabSheet;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    edtCodigoDoc: TEdit;
    edtNomeDoc: TEdit;
    dbgDoc: TDBGrid;
    edtDescricaoDoc: TEdit;
    edtCaminhoDoc: TEdit;
    sbAbrirDoc: TSpeedButton;
    sbVisualizarDoc: TSpeedButton;
    lbl41: TLabel;
    zqryDoc: TZQuery;
    dspDoc: TDataSetProvider;
    cdsDoc: TClientDataSet;
    dsDoc: TDataSource;
    cdsDocdoc_codigo: TIntegerField;
    cdsDocdoc_cod_colab: TIntegerField;
    cdsDocdoc_caminho: TWideMemoField;
    cdsDocdoc_descricao: TWideStringField;
    lbl42: TLabel;
    edtCurso: TEdit;
    cdsEducacaoColedu_curso: TWideStringField;
    cdsColaboradorescol_cpf: TWideStringField;
    cdsColaboradorescol_rg: TWideStringField;
    tsDadosPessoais: TTabSheet;
    lbl44: TLabel;
    lbl45: TLabel;
    edtCodigoPessoal: TEdit;
    edtNomePessoal: TEdit;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    lbl50: TLabel;
    lblCEP: TLabel;
    lbl51: TLabel;
    edtNumero: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    medtCEP: TMaskEdit;
    edtFone: TEdit;
    lbllb8: TLabel;
    lbl43: TLabel;
    medtCPF: TMaskEdit;
    edtRG: TEdit;
    dblEstados: TDBLookupComboBox;
    lbl52: TLabel;
    edtCelular: TEdit;
    cdsColaboradorescol_endereco: TWideStringField;
    cdsColaboradorescol_numero: TWideStringField;
    cdsColaboradorescol_bairro: TWideStringField;
    cdsColaboradorescol_cidade: TWideStringField;
    cdsColaboradorescol_estado: TWideStringField;
    cdsColaboradorescol_cep: TWideStringField;
    cdsColaboradorescol_telefone: TWideStringField;
    cdsColaboradorescol_celular: TWideStringField;
    zqryFiltroProc: TZQuery;
    dspFiltroProc: TDataSetProvider;
    cdsFiltroProc: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsFiltroProc: TDataSource;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    pnl4: TPanel;
    grp1: TGroupBox;
    dblColaborador: TDBLookupComboBox;
    chkTodosCol: TCheckBox;
    grp2: TGroupBox;
    dblFiltroProcesso: TDBLookupComboBox;
    chkTodosProc: TCheckBox;
    pnl5: TPanel;
    rgSituacao: TRadioGroup;
    rgTipoRel: TRadioGroup;
    rgOrdemImpressao: TRadioGroup;
    grp4: TGroupBox;
    dblFiltroFuncao: TDBLookupComboBox;
    chkTodosFuncao: TCheckBox;
    grp3: TGroupBox;
    chkQuebra: TCheckBox;
    zqryFiltroFuncao: TZQuery;
    dspFiltroFuncao: TDataSetProvider;
    cdsFiltroFuncao: TClientDataSet;
    dsFiltroFuncao: TDataSource;
    cdsFiltroFuncaocodi_fun: TLargeintField;
    cdsFiltroFuncaodesc_fun: TWideStringField;
    dtAdmissao: TDateEdit;
    lbl34: TLabel;
    cdsColaboradorescol_admissao: TDateTimeField;
    lbl53: TLabel;
    edtCTPS: TEdit;
    lbl54: TLabel;
    edtPIS: TEdit;
    cdsColaboradorescol_pis: TWideStringField;
    cdsColaboradorescol_ctps: TWideStringField;
    cdsColaboradoresdesc_fun: TWideStringField;
    btnCopiaHabFuncao: TBitBtn;
    pnlCopiarHabFuncao: TPanel;
    pnl9: TPanel;
    btnCopiarHabFunc: TBitBtn;
    btnCancelarHabFunc: TBitBtn;
    pnl11: TPanel;
    pnl12: TPanel;
    chkExcluiHab: TCheckBox;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    chkManterNotasAnterior: TCheckBox;
    chkValidacao: TCheckBox;
    cdsColaboradorescol_validacao_educ_exp: TIntegerField;
    tsFuncao: TTabSheet;
    lbl59: TLabel;
    edtCodigoResp: TEdit;
    lbl60: TLabel;
    edtNomeResp: TEdit;
    lbl61: TLabel;
    dblFuncaoResp: TDBLookupComboBox;
    mmoResp: TMemo;
    lbl62: TLabel;
    dsResp: TDataSource;
    cdsResp: TClientDataSet;
    dspResp: TDataSetProvider;
    zqryResp: TZQuery;
    lbllb3: TLabel;
    medtTempoTrein: TMaskEdit;
    edtCustoTrein: TCurrencyEdit;
    lbl63: TLabel;
    cdsTreinamentosColtre_custo: TFloatField;
    cdsTreinamentosColtre_tempo: TWideStringField;
    cdsImprimirTretre_custo: TFloatField;
    cdsImprimirTretre_tempo: TWideStringField;
    chkCopiaTodos: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
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
    procedure dbgColaboradoresKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgColaboradoresCellClick(Column: TColumn);
    procedure dbgColaboradoresDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctColaboradoresChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    function BuscarNovoCodigoAcessorio(): string;
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoObsExit(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure dbgCurriculoCellClick(Column: TColumn);
    procedure dbgTreinamentosCellClick(Column: TColumn);
    procedure tsCurriculoShow(Sender: TObject);
    procedure dbgEducacaoCellClick(Column: TColumn);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure chkTodosColClick(Sender: TObject);
    procedure cdsTreinamentosColdtre_treGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsTreinamentosColdtpr_treGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure sbArquivo1Click(Sender: TObject);
    procedure sbVisualizar1Click(Sender: TObject);
    procedure sbLimparClick(Sender: TObject);
    procedure sbLimpar1Click(Sender: TObject);
    procedure btnInserirTodosClick(Sender: TObject);
    procedure btnCopiarHabClick(Sender: TObject);
    procedure btnCancelarHabClick(Sender: TObject);
    procedure btnAvaliadorClick(Sender: TObject);
    procedure sbAbreTreCertificadoClick(Sender: TObject);
    procedure sbLimpaTreCertificadoClick(Sender: TObject);
    procedure sbVisualizaTreCertificadoClick(Sender: TObject);
    procedure sbAbrirDocClick(Sender: TObject);
    procedure tsDocShow(Sender: TObject);
    procedure sbVisualizarDocClick(Sender: TObject);
    procedure medtCPFExit(Sender: TObject);
    procedure chkTodosProcClick(Sender: TObject);
    procedure chkTodosFuncaoClick(Sender: TObject);
    procedure dbgTreinamentosDblClick(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
    procedure cdsColaboradoresAfterScroll(DataSet: TDataSet);
    procedure dbgTreinamentosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCopiaHabFuncaoClick(Sender: TObject);
    procedure btnCancelarHabFuncClick(Sender: TObject);
    procedure btnCopiarHabFuncClick(Sender: TObject);
    procedure BuscarRespAutFuncao();

  private
    { Private declarations }
    cOperacao: string;
//    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadColaboradores: TFormCadColaboradores;

implementation

uses frm_dm, frm_Inicial, Funcoes,  frm_CadColaboradorAval, frm_PlanoAcaoMatriz;

{$R *.dfm}

procedure TFormCadColaboradores.AtualizarDados;
begin
   with cdsEducacao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 6' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsExperiencia do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 7' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsSituacao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 15' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsFuncoes do begin
      Active:= False;
      CommandText:= ' SELECT codi_fun, desc_fun ' +
                    ' FROM funcoes' +
                    ' ORDER BY desc_fun';
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

   with cdsFiltroProc do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsFiltroFuncao do begin
      Active:= False;
      CommandText:= ' SELECT codi_fun, desc_fun ' +
                    ' FROM funcoes' +
                    ' ORDER BY desc_fun';
      Active:= True;
   end;

   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT codi_tre, desc_tre ' +
                    ' FROM treinamentos' +
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   with cdsHabilidades do begin
      Active:= False;
      CommandText:= ' SELECT codi_hab, desc_hab ' +
                    ' FROM habilidades' +
                    ' ORDER BY desc_hab';
      Active:= True;
   end;

   with cdsUsuarios do begin
      Active:= False;
      CommandText:= ' SELECT nome_usu ' +
                    ' FROM usuarios' +
                    ' ORDER BY nome_usu';
      Active:= True;
   end;

   with dm.cdsEstados do begin
      Active:= False;
      Active:= True;
   end;

   with cdsColaboradores do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
//      cdsColaboradores.Locate('nome_col', edtNomeColaborador.Text,[]);
      cdsColaboradores.Locate('codi_col', edtCodigo.Text,[]);
   end;
end;

procedure TFormCadColaboradores.AtualizarDadosAcessorios;
begin
   edtCodigoPessoal.Text:= edtCodigo.Text;
   edtNomePessoal.Text  := edtNomeColaborador.Text;
   edtCodigoCur.Text    := edtCodigo.Text;
   edtNomeCur.Text      := edtNomeColaborador.Text;
   edtCodigoTre.Text    := edtCodigo.Text;
   edtNomeTre.Text      := edtNomeColaborador.Text;
   edtCodigoHab.Text    := edtCodigo.Text;
   edtNomeHab.Text      := edtNomeColaborador.Text;
   edtCodigoEdu.Text    := edtCodigo.Text;
   edtNomeEdu.Text      := edtNomeColaborador.Text;
   edtCodigoDoc.Text    := edtCodigo.Text;
   edtNomeDoc.Text      := edtNomeColaborador.Text;
   edtCodigoResp.Text   := edtCodigo.Text;
   edtNomeResp.Text     := edtNomeColaborador.Text;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      with cdsCurriculo do begin
         Active:= False;
         CommandText:= ' SELECT codi_his, codi_col, de_his, ate_his, func_his, empr_his ' +
                       ' FROM histprof' +
                       ' WHERE codi_col = ' + AllTrim(edtCodigo.Text) +
                       ' ORDER BY de_his DESC';
         Active:= True;
      end;

      with cdsEducacaoCol do begin
         Active:= False;
         CommandText:= ' SELECT edu_codigo, edu_colaborador, edu_de, edu_ate, edu_grau, edu_escola,' +
                       ' edu_anexo, edu_curso' +
                       ' FROM colab_educacao' +
                       ' WHERE edu_colaborador = ' + AllTrim(edtCodigo.Text) +
                       ' ORDER BY edu_codigo';
         Active:= True;
      end;

      with cdsTreinamentosCol do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.codi_tre, C.dtpr_tre, C.dtre_tre, C.codi_pla, C.tipo_tre,' +
                       ' T.desc_tre, C.tre_certificado, C.tre_custo, C.tre_tempo' +
                       ' FROM colab_treinamentos C' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = C.codi_tre' +
                       ' WHERE codi_col = ' + AllTrim(edtCodigo.Text) +
                       ' ORDER BY desc_tre';
         Active:= True;
      end;

      with cdsHabilidadesCol do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.codi_hab, C.nota_hab, C.hab_ano, H.desc_hab' +
                       ' FROM colab_habilidades C' +
                       ' INNER JOIN habilidades H ON H.codi_hab = C.codi_hab' +
                       ' WHERE codi_col = ' + AllTrim(edtCodigo.Text) +
                       ' ORDER BY desc_hab';
         Active:= True;
      end;

      with cdsDoc do begin
         Active:= False;
         CommandText:= ' SELECT doc_codigo, doc_cod_colab, doc_descricao, doc_caminho' +
                       ' FROM colab_doc' +
                       ' WHERE doc_cod_colab = ' + AllTrim(edtCodigo.Text) +
                       ' ORDER BY doc_descricao';
         Active:= True;
      end;
   end;
end;

procedure TFormCadColaboradores.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if pctColaboradores.TabIndex > 0 then begin
      btnImprimir.Enabled:= False;
   end;

   if cdsColaboradores.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadColaboradores.btnCancelarHabFuncClick(Sender: TObject);
begin
   pnlCopiarHabFuncao.Visible:= False;
end;

procedure TFormCadColaboradores.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 6, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      Botoes(False);
      case pctColaboradores.TabIndex of
         0: begin
            TryFocus(edtNomeColaborador);
         end;
         1: begin
            TryFocus(edtEndereco);
         end;
         2: begin
            TryFocus(edtEmpresa);
         end;
         3: begin
            TryFocus(edtEscola);
         end;
         4: begin
            TryFocus(edtDescricaoDoc);
         end;
      end;
   end;
end;

procedure TFormCadColaboradores.btnCancelarClick(Sender: TObject);
begin
//   LimparCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   case pctColaboradores.TabIndex of
      0: begin
         PreencherCampos;
      end;
   end;
   ControlarAbas();
end;

procedure TFormCadColaboradores.btnCancelarHabClick(Sender: TObject);
begin
   pnlCopiarHab.Visible:= False;
end;

procedure TFormCadColaboradores.btnCopiaHabFuncaoClick(Sender: TObject);
begin
   AbrePanel(pnlCopiarHabFuncao, Self);
   chkExcluiHab.Caption:= 'Excluir as habilidades cadastradas de ' + FormatDateTime('yyyy',Date());
   chkExcluiHab.Checked:= False;
end;

procedure TFormCadColaboradores.btnCopiarHabClick(Sender: TObject);
var
   iResp: Integer;
   iNota: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      if chkCopiaTodos.Checked = True then begin
         CommandText:= ' SELECT codi_col, codi_hab, nota_hab, codi_pla, hab_ano' +
                       ' FROM colab_habilidades' +
                       ' WHERE hab_ano = ' + QuotedStr(edtAnoCopia.Text);
      end
      else begin
         CommandText:= ' SELECT codi_col, codi_hab, nota_hab, codi_pla, hab_ano' +
                       ' FROM colab_habilidades' +
                       ' WHERE hab_ano = ' + QuotedStr(edtAnoCopia.Text) +
                       ' AND codi_col = ' + QuotedStr(edtCodigoHab.Text);
      end;
      Active:= True;

      if RecordCount <= 0 then begin
         Application.MessageBox(PChar('Não existem habilidades cadastradas para o ano de ' + edtAnoCopia.Text), 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtAnoCopia);
         Exit;
      end;

      // Verifica se alguma habilidade do ano selecionado já está cadastrado e pede confirmação
      with dm.cdsAux do begin
         Active:= False;
         if chkCopiaTodos.Checked = True then begin
            CommandText:= ' SELECT codi_col, codi_hab, nota_hab, codi_pla, hab_ano' +
                          ' FROM colab_habilidades' +
                          ' WHERE hab_ano = ' + QuotedStr(FormatDateTime('yyyy',Date()));
         end
         else begin
            CommandText:= ' SELECT codi_col, codi_hab, nota_hab, codi_pla, hab_ano' +
                          ' FROM colab_habilidades' +
                          ' WHERE hab_ano = ' + QuotedStr(FormatDateTime('yyyy',Date())) +
                          ' AND codi_col = ' + QuotedStr(edtCodigoHab.Text);
         end;
         Active:= True;
      end;

      if dm.cdsAux.RecordCount > 0 then begin
         iResp:= Application.MessageBox(PChar('Já existem habilidades cadastradas para o ano de ' + FormatDateTime('yyyy',Date()) + '.' +
                                       #13 + 'Serão copiadas somente as habilidades que ainda não estão cadastradas.' +
                                       #13 + 'Confirma ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION);
      end
      else begin
         iResp:= 6; // Sim  7 -> Não
      end;

      if iResp = 6 then begin
         First;

         while not Eof do begin
            if chkManterNotasAnterior.Checked = True then begin
               iNota:= dm.cdsAuxiliar.FieldByName('nota_hab').AsString;
            end
            else begin
               iNota:= '0';
            end;

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO colab_habilidades (codi_col, codi_hab, nota_hab, hab_ano)' +
                             ' VALUES(' +
                             dm.cdsAuxiliar.FieldByName('codi_col').AsString + ',' +
                             dm.cdsAuxiliar.FieldByName('codi_hab').AsString + ',' +
                             iNota + ',' +
//                             '0,' + // Nota zerada
                             QuotedStr(FormatDateTime('yyyy',Date())) +
                             ')';
               try
                  Execute;
               except

               end;
            end;

            Next;
         end;
      end;
   end;

   AtualizarDadosAcessorios();
   pnlCopiarHab.Visible:= False;
end;

procedure TFormCadColaboradores.btnCopiarHabFuncClick(Sender: TObject);
begin
   // Copia as habilidades cadastradas na função
   if Application.MessageBox('Deseja copiar as habilidades que estão cadastradas no cadastro da função para o colaborador ?', 'Confirmação', MB_YESNO + MB_ICONWARNING) = IDYES then begin
      if chkExcluiHab.Checked = True then begin // Exclui as habilidades do ano corrente
         // Exclui as habilidades do colaborador
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM colab_habilidades' +
                          ' WHERE codi_col = ' + edtCodigo.Text +
                          ' AND hab_ano = ' + QuotedStr(FormatDateTime('yyyy',Date()));
            Execute;
         end;
      end;

      // Grava as habilidades e treinamentos da função no colaborador
      GravaAtributos(StrToInt(edtCodigoHab.Text), dblFuncao.KeyValue, 'H');
      AtualizarDadosAcessorios();
      pnlCopiarHabFuncao.Visible:= False;
   end;
end;

procedure TFormCadColaboradores.btnExcluirClick(Sender: TObject);
var
   sCodColaborador: string;
   sNomeColaborador: string;
   sDescTreinamento: string;
   sDescHabilidade: string;
begin
   if (Acesso(cUsuario, 6, 'exclusao') = 1) then begin
      case pctColaboradores.TabIndex of
         0: begin // Cadastro
            if Application.MessageBox(PChar('A exclusão do colaborador pode causar perda de informações' +
               ' se ele estiver vinculado em outros cadastros do sistema. Altere o campo Status para Inativar' +
               ' para que isso não ocorra.' + #13 + #13 +
               'Confirma a exclusão do colaborador ?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
               sCodColaborador:= cdsColaboradorescodi_col.AsString;
               sNomeColaborador:= cdsColaboradoresnome_col.AsString;

               // Exclui os registros de educação do colaborador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM colab_educacao' +
                                ' WHERE edu_colaborador = ' + edtCodigo.Text;
                  Execute;
               end;

               // Exclui os treinamentos do colaborador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM colab_treinamentos' +
                                ' WHERE codi_col = ' + edtCodigo.Text;
                  Execute;
               end;

               // Exclui as habilidades do colaborador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM colab_habilidades' +
                                ' WHERE codi_col = ' + edtCodigo.Text;
                  Execute;
               end;

               // Exclui o histórico profissional do colaborador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM histprof' +
                                ' WHERE codi_col = ' + edtCodigo.Text;
                  Execute;
               end;

               // Exclui o colaborador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM colaboradores' +
                                ' WHERE codi_col = ' + sCodColaborador;
                  Execute;
               end;

               Auditoria('CADASTRO DE COLABORADORES','Cod: ' + sCodColaborador + '-' + sNomeColaborador,'E','');
               Application.MessageBox('Colaborador excluído corretamente', 'Aviso', MB_OK + MB_ICONINFORMATION);

               AtualizarDados;
               PreencherCampos;
            end;
            Botoes(True);
         end;
         2: begin // Currículo
            if Application.MessageBox('Confirma a exclusão dos dados de currículo ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM histprof' +
                                ' WHERE codi_his = ' + cdsCurriculocodi_his.AsString;
                  Execute;
               end;

               Auditoria('CADASTRO DE COLABORADORES - CURRÍCULO', edtNomeColaborador.Text + ' - ' + edtEmpresa.Text,'E','');
               AtualizarDadosAcessorios();
            end;
         end;
         3: begin // Educação
            if Application.MessageBox('Confirma a exclusão dos dados de educação ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM colab_educacao' +
                                ' WHERE edu_codigo = ' + cdsEducacaoColedu_codigo.AsString;
                  Execute;
               end;

               Auditoria('CADASTRO DE COLABORADORES - EDUCAÇÃO', edtNomeColaborador.Text + ' - ' + edtEmpresa.Text,'E','');
               AtualizarDadosAcessorios();
            end;
         end;
         4: begin // Documentos
            if Application.MessageBox('Confirma a exclusão do documento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM colab_doc' +
                                ' WHERE doc_codigo = ' + cdsDocdoc_codigo.AsString;
                  Execute;
               end;

               Auditoria('CADASTRO DE COLABORADORES - DOCUMENTOS', edtNomeColaborador.Text + ' - ' + edtDescricaoDoc.Text,'E','');
               AtualizarDadosAcessorios();
            end;
         end;
         5: begin // Treinamentos
            if (Acesso(cUsuario, 6, 'exclusao') = 1) then begin
               if Application.MessageBox('Confirma a exclusão do treinamento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
                  sDescTreinamento:= cdsTreinamentosdesc_tre.AsString;

                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' DELETE FROM colab_treinamentos' +
                                   ' WHERE codi_col = ' + edtCodigo.Text +
                                   ' AND codi_tre = ' + cdsTreinamentoscodi_tre.AsString;
                     Execute;
                  end;

                  Auditoria('CADASTRO DE COLABORADORES - TREINAMENTO', edtNomeColaborador.Text + ' - ' + sDescTreinamento,'E','');
                  AtualizarDadosAcessorios();
               end;
            end;
         end;
         6: begin // Habilidades
            if (Acesso(cUsuario, 6, 'exclusao') = 1) then begin
               if Application.MessageBox('Confirma a exclusão da habilidade ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
                  sDescHabilidade:= cdsHabilidadesdesc_hab.AsString;

                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' DELETE FROM colab_habilidades' +
                                   ' WHERE codi_col = ' + edtCodigo.Text +
                                   ' AND codi_hab = ' + cdsHabilidadesColcodi_hab.AsString +
                                   ' AND hab_ano = ' + QuotedStr(cdsHabilidadesColhab_ano.AsString) ;
                     Execute;
                  end;

                  Auditoria('CADASTRO DE COLABORADORES - HABILIDADE', edtNomeColaborador.Text + ' - ' + sDescHabilidade,'E','');
                  AtualizarDadosAcessorios();
               end;
            end;
         end;
      end;
   end;

   Botoes(True);
   ControlarAbas();
end;

procedure TFormCadColaboradores.btnGravarClick(Sender: TObject);
var
   sCodigoHistProf: string;
   sCodigoEducacao: string;
   sCodigoDoc     : string;
   sTipo: string;
begin
   case pctColaboradores.TabIndex of
      0: begin
         if ValidarDados() then begin
            try
               with cdsGravar do begin
                  Active:= False;
                  if cOperacao = 'I' then begin
                     CommandText:= ' INSERT INTO colaboradores (' +
                                   ' codi_col, nome_col, func_col, educ_col, expe_col, ' +
                                   ' proc_col, obs_col, col_status, col_usuario, col_email,' +
                                   ' col_curriculo, col_cpf, col_rg, col_endereco, col_numero, ' +
                                   ' col_bairro,  col_cidade, col_estado, col_cep, col_telefone, ' +
                                   ' col_celular, col_admissao, col_validacao_educ_exp' +
                                   ' )' +
                                   ' VALUES(' +
                                   edtCodigo.Text + ',' +
                                   QuotedStr(edtNomeColaborador.Text) + ',' +
                                   QuotedStr(dblFuncao.KeyValue) + ',' +
                                   QuotedStr(dblEducacao.KeyValue) + ',' +
                                   QuotedStr(dblExperiencia.KeyValue) + ',' +
                                   QuotedStr(dblProcesso.KeyValue) + ',' +
                                   QuotedStr(mmoObs.Text) + ',' +
                                   QuotedStr(dblSituacao.KeyValue) + ',' +
                                   QuotedStr(dblUsuario.KeyValue) + ',' +
                                   QuotedStr(edtEmail.Text) + ',' +
                                   QuotedStr(edtArquivo1.Text) + ',' +
                                   QuotedStr(medtCPF.Text) + ',' +
                                   QuotedStr(edtRG.Text) + ',' +
                                   QuotedStr(edtEndereco.Text) + ',' +
                                   QuotedStr(edtNumero.Text) + ',' +
                                   QuotedStr(edtBairro.Text) + ',' +
                                   QuotedStr(edtCidade.Text) + ',' +
                                   QuotedStr(Nulo(dblEstados.KeyValue,'I')) + ',' +
                                   QuotedStr(medtCEP.Text) + ',' +
                                   QuotedStr(edtFone.Text) + ',' +
                                   QuotedStr(edtCelular.Text) + ',' +
                                   ArrumaDataSQL(dtAdmissao.Date) + ',' +
                                   LogicoParaString(chkValidacao.Checked) +
                                   ')';
                     Execute;

                  // Retirado o cadastro automático de Habilidades para não influenciar no controle
                  // de pendências de Habilidades da tela inicial - Solicitado por Flavio - 27/07/2017
                     // Grava as habilidades e treinamentos da função no colaborador
                     GravaAtributos(StrToInt(edtCodigo.Text), dblFuncao.KeyValue, 'T');
                  end
                  else begin
                     CommandText:= ' UPDATE colaboradores SET' +
                                   ' nome_col = ' + QuotedStr(edtNomeColaborador.Text) + ',' +
                                   ' func_col = ' + QuotedStr(dblFuncao.KeyValue) + ',' +
                                   ' educ_col = ' + QuotedStr(dblEducacao.KeyValue) + ',' +
                                   ' expe_col = ' + QuotedStr(dblExperiencia.KeyValue) + ',' +
                                   ' proc_col = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                                   ' obs_col = ' + QuotedStr(mmoObs.Text) + ',' +
                                   ' col_status = ' + QuotedStr(dblSituacao.KeyValue) + ',' +
                                   ' col_usuario = ' + QuotedStr(dblUsuario.KeyValue) + ',' +
                                   ' col_email = ' + QuotedStr(edtEmail.Text) + ',' +
                                   ' col_curriculo = ' + QuotedStr(edtArquivo1.Text) + ',' +
                                   ' col_admissao = ' + ArrumaDataSQL(dtAdmissao.Date) + ',' +
                                   ' col_validacao_educ_exp = ' + LogicoParaString(chkValidacao.Checked) +
                                   ' WHERE codi_col = ' + cdsColaboradorescodi_col.Asstring;
                     Execute;
                  end;
               end;

               Auditoria('CADASTRO DE COLABORADORES', edtNomeColaborador.Text, cOperacao,'');
               AtualizarDados();
               PreencherCampos();

               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
            except
               on E:Exception do begin
                  MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
//                  Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
               end;
            end;

            cOperacao:= '';
            AtualizarDadosAcessorios();
            ControlarAbas();
         end;
      end;
      1: begin // Dados Pessoais
         try
            with cdsGravar do begin
               Active:= False;

               CommandText:= ' UPDATE colaboradores SET' +
                             ' col_rg = ' + QuotedStr(edtRG.Text) + ',' +
                             ' col_cpf = ' + QuotedStr(medtCPF.Text) + ',' +
                             ' col_endereco = ' + QuotedStr(edtEndereco.Text) + ',' +
                             ' col_numero = ' + QuotedStr(edtNumero.Text) + ',' +
                             ' col_bairro = ' + QuotedStr(edtBairro.Text) + ',' +
                             ' col_cidade = ' + QuotedStr(edtCidade.Text) + ',' +
                             ' col_estado = ' + QuotedStr(Nulo(dblEstados.KeyValue,'I')) + ',' +
                             ' col_cep = ' + QuotedStr(medtCEP.Text) + ',' +
                             ' col_telefone = ' + QuotedStr(edtFone.Text) + ',' +
                             ' col_celular = ' + QuotedStr(edtCelular.Text) + ',' +
                             ' col_ctps = ' + QuotedStr(edtCTPS.Text) + ',' +
                             ' col_pis = ' + QuotedStr(edtPIS.Text) +
                             ' WHERE codi_col = ' + QuotedStr(edtCodigoTre.Text);  //cdsColaboradorescodi_col.Asstring;
               Execute;
            end;

            Auditoria('CADASTRO DE COLABORADORES - DADOS PESSOAIS', edtNomeColaborador.Text, cOperacao,'');
            AtualizarDados();
            PreencherCampos();

            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E:Exception do begin
               Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
            end;
         end;

         cOperacao:= '';
         AtualizarDadosAcessorios();
         ControlarAbas();
      end;
      2: begin // Currículo
         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO histprof' +
                                ' (codi_his, codi_col, de_his, ate_his, func_his, empr_his)' +
                                ' VALUES (' +
                                BuscarNovoCodigo('histprof', 'codi_his') + ',' +
                                edtCodigo.Text + ',' +
                                QuotedStr(medtDe.Text) + ',' +
                                QuotedStr(medtAte.Text) + ',' +
                                QuotedStr(edtFuncaoCur.Text) + ',' +
                                QuotedStr(edtEmpresa.Text) +
                                ')';
               end
               else begin
                  CommandText:= ' UPDATE histprof SET' +
                                ' de_his = ' + QuotedStr(medtDe.Text) + ',' +
                                ' ate_his = ' + QuotedStr(medtAte.Text) + ',' +
                                ' func_his = ' + QuotedStr(edtFuncaoCur.Text) + ',' +
                                ' empr_his = ' + QuotedStr(edtEmpresa.Text) +
                                ' WHERE codi_his = ' + cdsCurriculocodi_his.AsString +
                                ' AND codi_col = ' + edtCodigo.Text;
               end;
               Execute;

               Auditoria('CADASTRO DE COLABORADORES - CURRÍCULO', edtNomeColaborador.Text + ' - ' + edtEmpresa.Text, cOperacao, '');
               edtEmpresa.Clear;
               medtDe.Clear;
               medtAte.Clear;
               edtFuncaoCur.Clear;
            end;

            cOperacao:= '';
            AtualizarDadosAcessorios();
            HabilitarCampos(False, False);
            Botoes(True);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao gravar currículo!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
            end;
         end;
      end;
      3: begin // Educação
         if dblNivelEducacao.KeyValue = -1 then begin
            Application.MessageBox('Campo Nível de Educação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblNivelEducacao);
            Exit;
         end;

         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO colab_educacao' +
                                ' (edu_codigo, edu_colaborador, edu_de, edu_ate, edu_grau, edu_escola, ' +
                                ' edu_anexo, edu_curso)' +
                                ' VALUES (' +
                                BuscarNovoCodigo('colab_educacao', 'edu_codigo') + ',' +
                                edtCodigo.Text + ',' +
                                QuotedStr(medtDe1.Text) + ',' +
                                QuotedStr(medtAte1.Text) + ',' +
                                QuotedStr(dblNivelEducacao.KeyValue) + ',' +
                                QuotedStr(edtEscola.Text) + ',' +
                                QuotedStr(edtCaminho.Text) + ',' +
                                QuotedStr(edtCurso.Text) +
                                ')';
               end
               else begin
                  CommandText:= ' UPDATE colab_educacao SET' +
                                ' edu_de = ' + QuotedStr(medtDe1.Text) + ',' +
                                ' edu_ate = ' + QuotedStr(medtAte1.Text) + ',' +
                                ' edu_grau = ' + QuotedStr(dblNivelEducacao.KeyValue) + ',' +
                                ' edu_escola = ' + QuotedStr(edtEscola.Text) + ',' +
                                ' edu_anexo = ' + QuotedStr(edtCaminho.Text) + ',' +
                                ' edu_curso = ' + QuotedStr(edtCurso.Text) +
                                ' WHERE edu_codigo = ' + cdsEducacaoColedu_codigo.AsString +
                                ' AND edu_colaborador = ' + edtCodigo.Text;
               end;
               Execute;

               Auditoria('CADASTRO DE COLABORADORES - EDUCAÇÃO', edtNomeColaborador.Text + ' - ' + edtEscola.Text, cOperacao, '');
               edtEmpresa.Clear;
               medtDe.Clear;
               medtAte.Clear;
               edtFuncaoCur.Clear;

               ControlarBotaoVisualiza(Self);
            end;

            cOperacao:= '';
            AtualizarDadosAcessorios();
            HabilitarCampos(False, False);
            Botoes(True);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao gravar educação!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
            end;
         end;
      end;
      4: begin // Documentos
         if edtDescricaoDoc.Text = EmptyStr then begin
            Application.MessageBox('Campo Descrição do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtDescricaoDoc);
            Exit;
         end;

         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO colab_doc' +
                                ' (doc_codigo, doc_cod_colab, doc_descricao, doc_caminho)' +
                                ' VALUES (' +
                                BuscarNovoCodigo('colab_doc', 'doc_codigo') + ',' +
                                edtCodigo.Text + ',' +
                                QuotedStr(edtDescricaoDoc.Text) + ',' +
                                QuotedStr(edtCaminhoDoc.Text) +
                                ')';
               end
               else begin
                  CommandText:= ' UPDATE colab_doc SET' +
                                ' doc_descricao = ' + QuotedStr(edtDescricaoDoc.Text) + ',' +
                                ' doc_caminho = ' + QuotedStr(edtCaminhoDoc.Text) +
                                ' WHERE doc_codigo = ' + cdsDocdoc_codigo.AsString +
                                ' AND doc_cod_colab = ' + edtCodigo.Text;
               end;
               Execute;

               Auditoria('CADASTRO DE COLABORADORES - DOCUMENTOS', edtNomeColaborador.Text + ' - ' + edtDescricaoDoc.Text, cOperacao, '');
               edtDescricaoDoc.Clear;
               edtCaminhoDoc.Clear;

               ControlarBotaoVisualiza(Self);
            end;

            cOperacao:= '';
            AtualizarDadosAcessorios();
            HabilitarCampos(False, False);
            Botoes(True);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao gravar documento!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
            end;
         end;
      end;
      5: begin // Treinamentos
         try
            with cdsGravar do begin
               case cbTipo.ItemIndex of
                  0: sTipo:= 'M';
                  1: sTipo:= 'D';
               end;

               Active:= False;
               if cOperacao = 'I' then begin
                  // Verifica se o treinamento já foi cadastrado
                  with dm.cdsAuxiliar do begin
                     Active:= False;
                     CommandText:= ' SELECT COUNT(*) AS QTD' +
                                   ' FROM colab_treinamentos' +
                                   ' WHERE codi_col = ' + AllTrim(edtCodigo.Text) +
                                   ' AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue);
                     Active:= True;

                     if FieldByName('QTD').AsInteger > 0 then begin
                        Application.MessageBox('Treinamento já cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
                        Exit;
                     end;
                  end;

                  CommandText:= ' INSERT INTO colab_treinamentos' +
                                ' (codi_col, codi_tre, dtpr_tre, dtre_tre, tipo_tre, ' +
                                ' tre_certificado, tre_tempo, tre_custo)' +
                                ' VALUES (' +
                                edtCodigo.Text + ',' +
                                QuotedStr(dblTreinamentos.KeyValue) + ',' +
                                ArrumaDataSQL(dtDataPrevista.Date) + ',' +
                                ArrumaDataSQL(dtDataRealizacao.Date) + ',' +
                                QuotedStr(sTipo) + ',' +
                                QuotedStr(edtTreCertificado.Text) + ',' +
                                QuotedStr(medtTempoTrein.Text) + ',' +
                                VirgulaParaPonto(edtCustoTrein.Value, 2) +
                                ')';
               end
               else begin
                  CommandText:= ' UPDATE colab_treinamentos SET' +
                                ' dtpr_tre = ' + ArrumaDataSQL(dtDataPrevista.Date) + ',' +
                                ' dtre_tre = ' + ArrumaDataSQL(dtDataRealizacao.Date) + ',' +
                                ' tipo_tre = ' + QuotedStr(sTipo) + ',' +
                                ' tre_certificado = ' + QuotedStr(edtTreCertificado.Text) + ',' +
                                ' tre_tempo = ' + QuotedStr(medtTempoTrein.Text) + ',' +
                                ' tre_custo = ' + VirgulaParaPonto(edtCustoTrein.Value, 2) +
                                ' WHERE codi_tre = ' + cdsTreinamentosColcodi_tre.AsString +
                                ' AND codi_col = ' + edtCodigo.Text;
               end;
               Execute;

               Auditoria('CADASTRO DE COLABORADORES - TREINAMENTO', edtNomeColaborador.Text + ' - ' + edtEscola.Text, cOperacao, '');
            end;

            cOperacao:= '';
            AtualizarDadosAcessorios();
            HabilitarCampos(False, False);
            Botoes(True);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao gravar treinamento!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
            end;
         end;
      end;
      6: begin // Habilidades
         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  // Verifica se a habilidade já foi cadastrada
                  with dm.cdsAuxiliar do begin
                     Active:= False;
                     CommandText:= ' SELECT COUNT(*) AS QTD' +
                                   ' FROM colab_habilidades' +
                                   ' WHERE codi_col = ' + AllTrim(edtCodigo.Text) +
                                   ' AND codi_hab = ' + IntToStr(dblHabilidades.KeyValue) +
                                   ' AND hab_ano = ' + QuotedStr(edtAno.Text);
                     Active:= True;

                     if FieldByName('QTD').AsInteger > 0 then begin
                        Application.MessageBox(PChar('Habilidade já cadastrada para o ano de ' + edtAno.Text), 'Aviso', MB_OK + MB_ICONWARNING);
                        Exit;
                     end;
                  end;

                  CommandText:= ' INSERT INTO colab_habilidades (codi_col, codi_hab, nota_hab, hab_ano)' +
                             ' VALUES(' +
                             AllTrim(edtCodigo.Text) + ',' +
                             IntToStr(dblHabilidades.KeyValue) + ',' +
                             VirgulaParaPonto(edtNota.Value, 2) + ',' +
                             QuotedStr(edtAno.Text) +
                             ')';
               end
               else begin
                  CommandText:= ' UPDATE colab_habilidades SET' +
                                ' nota_hab = ' + VirgulaParaPonto(edtNota.Value, 2) +
                                ' WHERE codi_hab = ' + cdsHabilidadesColcodi_hab.AsString +
                                ' AND codi_col = ' + edtCodigo.Text +
                                ' AND hab_ano = ' + QuotedStr(edtAno.Text);
               end;
               Execute;

               Auditoria('CADASTRO DE COLABORADORES - HABILIDADE', edtNomeColaborador.Text + ' - ' + edtEscola.Text, cOperacao, '');
            end;

            cOperacao:= '';
            AtualizarDadosAcessorios();
            HabilitarCampos(False, False);
            Botoes(True);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao gravar habilidade!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
            end;
         end;
      end;
   end;
end;

procedure TFormCadColaboradores.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadColaboradores.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);

   with cdsColabRel do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormCadColaboradores.btnInserirTodosClick(Sender: TObject);
begin
   pnlCopiarHab.Top     := Self.Height div 2 - pnlCopiarHab.Height div 2 - 40;
   pnlCopiarHab.Left    := Self.Width div 2 - pnlCopiarHab.Width div 2;
   pnlCopiarHab.Visible := True;

   TryFocus(edtAnoCopia);
end;

procedure TFormCadColaboradores.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 6, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos();
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      HabilitarCampos(True, False);
      case pctColaboradores.TabIndex of
         0: begin // Cadastro
            edtCodigo.Text:= BuscarNovoCodigo('colaboradores','codi_col');
            dblSituacao.KeyValue:= 1;
            TryFocus(edtNomeColaborador);
         end;
         2: begin // Currículo
            TryFocus(edtEmpresa);
         end;
         3: begin // Educação
            TryFocus(edtEscola);
         end;
         4: begin // Documentos
            TryFocus(edtDescricaoDoc);
         end;
         5: begin // Treinamentos
            TryFocus(medtTempoTrein);
         end;
         6: begin // Habilidades
            edtAno.Text:= Copy(ArrumaDataSQL(Date()), 2, 4);
            TryFocus(dblHabilidades);
         end;
      end;
   end;
end;

procedure TFormCadColaboradores.btnPrimeiroClick(Sender: TObject);
begin
   cdsColaboradores.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
   ControlarAbas();
   AtualizarDados();
   PreencherCampos();
end;

procedure TFormCadColaboradores.btnAnteriorClick(Sender: TObject);
begin
   cdsColaboradores.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
   ControlarAbas();
   AtualizarDados();
   PreencherCampos();
end;

procedure TFormCadColaboradores.btnProximoClick(Sender: TObject);
begin
   cdsColaboradores.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
   ControlarAbas();
   AtualizarDados();
   PreencherCampos();
end;

procedure TFormCadColaboradores.btnUltimoClick(Sender: TObject);
begin
   cdsColaboradores.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
   ControlarAbas();
   AtualizarDados();
   PreencherCampos();
end;

procedure TFormCadColaboradores.btnAvaliadorClick(Sender: TObject);
begin
   AbrirForm(TFormCadAvaliador, FormCadAvaliador, 1);
//   FormCadAvaliador:= TFormCadAvaliador.Create(nil);
//   FormCadAvaliador.ShowModal;
//   FormCadAvaliador.Release;
end;

procedure TFormCadColaboradores.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadColaboradores.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadColaboradores.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

function TFormCadColaboradores.BuscarNovoCodigoAcessorio: string;
begin
   case pctColaboradores.TabIndex of
      1: begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT MAX(codi_his) as Codigo' +
                          ' FROM histprof';
            Active:= True;

            Result:= IntToStr(FieldByName('Codigo').AsInteger + 1);
         end;
      end;
      2: begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT MAX(edu_codigo) as Codigo' +
                          ' FROM colab_educacao';
            Active:= True;

            Result:= IntToStr(FieldByName('Codigo').AsInteger + 1);
         end;
      end;
      3: begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT MAX(doc_codigo) as Codigo' +
                          ' FROM colab_doc';
            Active:= True;

            Result:= IntToStr(FieldByName('Codigo').AsInteger + 1);
         end;
      end;
   end;
end;

procedure TFormCadColaboradores.BuscarRespAutFuncao;
begin
   with cdsResp do begin
      Active:= False;
      CommandText:= ' SELECT resp_fun ' +
                    ' FROM funcoes' +
                    ' WHERE codi_fun = ' + dblFuncao.KeyValue;
      Active:= True;

      dblFuncaoResp.KeyValue:= dblFuncao.KeyValue;
      mmoResp.Text:= FieldByName('resp_fun').AsString;
   end;
end;

procedure TFormCadColaboradores.cdsColaboradoresAfterScroll(DataSet: TDataSet);
begin
   // Esses comandos atualizam a grid, mostrando a barra de rolagem
   dbgColaboradores.Width := dbgColaboradores.Width + 1;
   dbgColaboradores.Width := dbgColaboradores.Width - 1;
end;

procedure TFormCadColaboradores.cdsTreinamentosColdtpr_treGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if (cdsTreinamentosColdtpr_tre.AsString = '30/12/1899') or (cdsTreinamentosColdtpr_tre.AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsTreinamentosColdtpr_tre.AsDateTime);
   end;
end;

procedure TFormCadColaboradores.cdsTreinamentosColdtre_treGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   if (cdsTreinamentosColdtre_tre.AsString = '30/12/1899') or (cdsTreinamentosColdtre_tre.AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsTreinamentosColdtre_tre.AsDateTime);
   end;
end;

procedure TFormCadColaboradores.chkTodosColClick(Sender: TObject);
begin
   dblColaborador.Enabled:= not chkTodosCol.Checked;
end;

procedure TFormCadColaboradores.chkTodosFuncaoClick(Sender: TObject);
begin
   dblFiltroFuncao.Enabled:= not chkTodosFuncao.Checked;
end;

procedure TFormCadColaboradores.chkTodosProcClick(Sender: TObject);
begin
   dblFiltroProcesso.Enabled:= not chkTodosProc.Checked;
end;

procedure TFormCadColaboradores.ControlarAbas;
var
   i: Integer;
begin
   if pctColaboradores.TabIndex <= 7 then begin  // Cadastro
      Botoes(True);

      if AllTrim(edtCodigo.Text) <> EmptyStr then begin
         cdsColaboradores.Locate('codi_col', edtCodigo.Text,[]);
      end;

      AtualizarDadosAcessorios();
      PreencherCampos();
      HabilitarCampos(False, False);
      pnlNavegacao.Visible:= True;

      if pctColaboradores.TabIndex > 1 then begin
         btnAvaliador.Visible:= False;
         btnImprimir.Enabled := False;
      end;

      if pctColaboradores.TabIndex = 1 then begin // Dados Pessoais
         btnNovo.Enabled   := False;
         btnExcluir.Enabled:= False;
         HabilitarCampos(False, False);
      end;

      if pctColaboradores.TabIndex = 2 then begin // Currículo
         btnAvaliador.Visible:= False;
         if cdsCurriculo.RecordCount <= 0 then begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
         end;
      end;

      if pctColaboradores.TabIndex = 3 then begin // Educação
         btnAvaliador.Visible:= False;
         if cdsEducacaoCol.RecordCount <= 0 then begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
         end;
      end;

      if pctColaboradores.TabIndex = 4 then begin // Doc. Diversos
         btnAvaliador.Visible:= False;
         if cdsDoc.RecordCount <= 0 then begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
         end;
      end;

      if pctColaboradores.TabIndex = 5 then begin // Treinamentos
         btnAvaliador.Visible:= False;
         if cdsTreinamentosCol.RecordCount <= 0 then begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
         end;
      end;

      if pctColaboradores.TabIndex = 6 then begin // Habilidades
         btnAvaliador.Visible:= True;
         if cdsHabilidadesCol.RecordCount <= 0 then begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
         end;
      end;

      if pctColaboradores.TabIndex = 7 then begin // Resp. e Aut. Função
         btnAvaliador.Visible:= False;
         btnNovo.Enabled     := False;
         btnExcluir.Enabled  := False;
         btnAlterar.Enabled  := False;
         pnlNavegacao.Visible:= False;
         BuscarRespAutFuncao();
      end;

      for i:= 8 downto 1 do begin
         pctColaboradores.Pages[i].Visible:= True;
      end;
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;

      btnAvaliador.Visible:= False;

      cdsColaboradores.Filtered:= False;

      if AllTrim(edtCodigo.Text) <> EmptyStr then begin
         cdsColaboradores.Locate('codi_col', edtCodigo.Text,[]);
      end;

      AtualizarDadosAcessorios();

      if pctColaboradores.TabIndex = 7 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadColaboradores.dbgColaboradoresCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadColaboradores.dbgColaboradoresDblClick(Sender: TObject);
var
   sCodigo: string;
begin
   sCodigo:= cdsColaboradores.FieldByName('codi_col').AsString;
   cdsColaboradores.Filtered:= False;
   if sCodigo <> EmptyStr then begin
      cdsColaboradores.Locate('codi_col', sCodigo, []);
   end;

   PreencherCampos;
   pctColaboradores.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadColaboradores.dbgColaboradoresKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos();
end;

procedure TFormCadColaboradores.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadColaboradores.dbgTreinamentosDblClick(Sender: TObject);
begin
   if cdsTreinamentosCol.RecordCount > 0 then begin
      t_PlanoAcaoMatriz:= Tt_PlanoAcaoMatriz.Create(nil);
      t_PlanoAcaoMatriz.cTipo:= 'T';
      t_PlanoAcaoMatriz.iTela:= 2; // Cadastro de Colaboradores
      t_PlanoAcaoMatriz.iCodPlano:= cdsTreinamentosCol.FieldByName('codi_pla').AsInteger;
      t_PlanoAcaoMatriz.iCodHabTre:= cdsTreinamentosCol.FieldByName('codi_tre').AsInteger;
      t_PlanoAcaoMatriz.lblCodigo.Caption:= edtCodigo.Text;
      t_PlanoAcaoMatriz.mmoAcao.Text:= cdsTreinamentosCol.FieldByName('desc_tre').AsString;
      t_PlanoAcaoMatriz.ShowModal;
      t_PlanoAcaoMatriz.Release;
   end;
end;

procedure TFormCadColaboradores.dbgTreinamentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (cdsTreinamentosCol.FieldByName('dtpr_tre').AsString = null) or
      (cdsTreinamentosCol.FieldByName('dtpr_tre').AsString = '  /  /    ') or
      (cdsTreinamentosCol.FieldByName('dtpr_tre').AsString = '30/12/1899') or
      (cdsTreinamentosCol.FieldByName('dtpr_tre').AsString = '') then begin
//      dbgTreinamentos.Canvas.Brush.Color:= clRed;
      dbgTreinamentos.Canvas.Font.Color:= clRed;
      dbgTreinamentos.Canvas.Font.Style:= [fsBold];

   end
   else begin
      if (cdsTreinamentosCol.FieldByName('dtpr_tre').AsDateTime <= Date()) and
         ((cdsTreinamentosCol.FieldByName('dtre_tre').AsString = null) or
         (cdsTreinamentosCol.FieldByName('dtre_tre').AsString = '  /  /    ') or
         (cdsTreinamentosCol.FieldByName('dtre_tre').AsString = '30/12/1899') or
         (cdsTreinamentosCol.FieldByName('dtre_tre').AsString = '')) then begin
         dbgTreinamentos.Canvas.Font.Color:= clRed;
         dbgTreinamentos.Canvas.Font.Style:= [fsBold];
      end
      else begin
//         dbgTreinamentos.Canvas.Font.Color:= clGreen;
      end;
   end;

   dbgTreinamentos.DefaultDrawDataCell(Rect, dbgTreinamentos.columns[datacol].field, State);
end;

procedure TFormCadColaboradores.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
//      0: cdsColaboradores.Locate('nome_col', edtValor.Text, [loPartialKey]);
      0: cdsColaboradores.Filter:= 'nome_col LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      1: cdsColaboradores.Filter:= 'desc_fun LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   cdsColaboradores.Filtered:= True;
end;

procedure TFormCadColaboradores.FormShow(Sender: TObject);
begin
   pctColaboradores.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible := False;
   btnAvaliador.Visible:= False;

   rgOrdemImpressao.ItemIndex:= 1;
   rgSituacao.ItemIndex      := 0;
   rgTipoRel.ItemIndex       := 0;
   dblColaborador.Enabled    := False;
   chkTodosCol.Checked       := True;
   dblFiltroProcesso.Enabled := False;
   chkTodosProc.Checked      := True;
   dblFiltroFuncao.Enabled   := False;
   chkTodosFuncao.Checked    := True;
   chkQuebra.Checked         := False;
   chkQuebra.Enabled         := False;
end;

procedure TFormCadColaboradores.HabilitarCampos(Flag, Codigo: Boolean);
var
   i: Integer;
begin
   case pctColaboradores.TabIndex of
      0: begin
         edtCodigo.Enabled         := Codigo;
         edtNomeColaborador.Enabled:= Flag;
         dblEducacao.Enabled       := Flag;
         dblExperiencia.Enabled    := Flag;
         dblFuncao.Enabled         := Flag;
         dblProcesso.Enabled       := Flag;
         dblSituacao.Enabled       := Flag;
         dblUsuario.Enabled        := Flag;
         mmoObs.Enabled            := Flag;
         edtEmail.Enabled          := Flag;
         edtArquivo1.Enabled       := Flag;
         dtAdmissao.Enabled        := Flag;
         chkValidacao.Enabled      := Flag;

         sbArquivo1.Enabled:= Flag;

         for i := 1 to 6 do begin
            pctColaboradores.Pages[i].TabVisible:= not Flag;
         end;
      end;
      1: begin // Dados Pessoais
         edtEndereco.Enabled:= Flag;
         edtNumero.Enabled  := Flag;
         edtBairro.Enabled  := Flag;
         edtCidade.Enabled  := Flag;
         dblEstados.Enabled := Flag;
         medtCEP.Enabled    := Flag;
         edtFone.Enabled    := Flag;
         edtCelular.Enabled := Flag;
         medtCPF.Enabled    := Flag;
         edtRG.Enabled      := Flag;
         edtCTPS.Enabled    := Flag;
         edtPIS.Enabled     := Flag;
      end;
      2: begin // Currículo
         edtEmpresa.Enabled  := Flag;
         medtDe.Enabled      := Flag;
         medtAte.Enabled     := Flag;
         edtFuncaoCur.Enabled:= Flag;
      end;
      3: begin // Educação
         edtEscola.Enabled       := Flag;
         medtDe1.Enabled         := Flag;
         medtAte1.Enabled        := Flag;
         dblNivelEducacao.Enabled:= Flag;
         edtCaminho.Enabled      := Flag;
         edtCurso.Enabled      := Flag;

         sbArquivo.Enabled:= Flag;
      end;
      4: begin // Documentos
         edtDescricaoDoc.Enabled:= Flag;
         edtCaminhoDoc.Enabled  := Flag;

         sbAbrirDoc.Enabled     := Flag;
      end;
      5: begin // Treinamentos
         dblTreinamentos.Enabled  := Flag;
         cbTipo.Enabled           := Flag;
         dtDataPrevista.Enabled   := Flag;
         dtDataRealizacao.Enabled := Flag;
         edtTreCertificado.Enabled:= Flag;
         medtTempoTrein.Enabled   := Flag;
         edtCustoTrein.Enabled    := Flag;

         sbAbreTreCertificado.Enabled := Flag;
      end;
      6: begin // Habilidades
         if cOperacao <> 'A' then begin
            dblHabilidades.Enabled:= Flag;
            edtAno.Enabled        := Flag;
         end;
         edtNota.Enabled        := Flag;
      end;
   end;
end;

procedure TFormCadColaboradores.LimparCampos;
begin
   case pctColaboradores.TabIndex of
      0: begin // Cadastro
         edtCodigo.Clear;
         edtNomeColaborador.Clear;
         dblEducacao.KeyValue:= -1;
      //   edtEntidade.Clear;
      //   edtConclusao.Clear;
         dblExperiencia.KeyValue:= -1;
         dblFuncao.KeyValue:= -1;
         dblProcesso.KeyValue:= -1;
         dblSituacao.KeyValue:= -1;
         dblUsuario.KeyValue:= -1;
         mmoObs.Clear;
         edtEmail.Clear;
         edtArquivo1.Clear;
         edtEndereco.Clear;
         edtNumero.Clear;
         edtBairro.Clear;
         edtCidade.Clear;
         dblEstados.KeyValue:= -1;
         medtCEP.Clear;
         edtFone.Clear;
         edtCelular.Clear;
         medtCPF.Clear;
         edtRG.Clear;
         dtAdmissao.Clear;
         chkValidacao.Checked:= False;
      end;
      2: begin // Currículo
         edtEmpresa.Clear;
         medtDe.Clear;
         medtAte.Clear;
         edtFuncaoCur.Clear;
      end;
      3: begin // Educação
         edtEscola.Clear;
         medtDe1.Clear;
         medtAte1.Clear;
         dblNivelEducacao.KeyValue:= -1;
         edtCaminho.Clear;
         edtCurso.Clear;
      end;
      4: begin // Documentos
         edtDescricaoDoc.Clear;
         edtCaminhoDoc.Clear;
      end;
      5: begin // Treinamentos
         dblTreinamentos.KeyValue:= -1;
         cbTipo.ItemIndex:= -1;
         dtDataPrevista.Clear;
         dtDataRealizacao.Clear;
         edtTreCertificado.Clear;
         medtTempoTrein.Clear;
         edtCustoTrein.Clear;
      end;
      6: begin // Habilidades
         dblHabilidades.KeyValue:= -1;
         edtNota.Clear;
         edtAno.Clear;
      end;
   end;
end;

procedure TFormCadColaboradores.medtCPFExit(Sender: TObject);
begin
   if Length(medtCPF.Text) > 0 then begin
      if (CalculaCnpjCpf(medtCPF.Text) = False)
         or ((Length(medtCPF.Text) > 0) and (Length(medtCPF.Text) < 11)) then begin
         Application.MessageBox('CPF inválido. Verifique.', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(medtCPF);
      end;
   end;
end;

procedure TFormCadColaboradores.mmoObsExit(Sender: TObject);
begin
   mmoObs.Text:= AcertaUpper(mmoObs.Text);
end;

procedure TFormCadColaboradores.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadColaboradores.pctColaboradoresChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadColaboradores.dbgCurriculoCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadColaboradores.dbgEducacaoCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadColaboradores.PreencherCampos;
begin
   with cdsColaboradores do begin
      edtCodigo.Text         := FieldByName('codi_col').AsString;
      edtNomeColaborador.Text:= FieldByName('nome_col').AsString;
   end;
   case pctColaboradores.TabIndex of
      0: begin
         with cdsColaboradores do begin
//            edtCodigo.Text         := FieldByName('codi_col').AsString;
//            edtNomeColaborador.Text:= FieldByName('nome_col').AsString;
      //      edtEntidade.Text       := FieldByName('esco_col').AsString;
      //      edtConclusao.Text      := FieldByName('conc_col').AsString;
            mmoObs.Text         := FieldByName('obs_col').AsString;
            edtEmail.Text       := FieldByName('col_email').AsString;
            edtArquivo1.Text    := FieldByName('col_curriculo').AsString;
            dtAdmissao.Date     := FieldByName('col_admissao').AsDateTime;
            chkValidacao.Checked:= StringParaLogico(FieldByName('col_validacao_educ_exp').AsString);

            if FieldByName('educ_col').AsString <> EmptyStr then begin
               dblEducacao.KeyValue:= FieldByName('educ_col').AsString;
            end;
            if FieldByName('expe_col').AsString <> EmptyStr then begin
               dblExperiencia.KeyValue:= FieldByName('expe_col').AsString;
            end;
            if FieldByName('func_col').AsString <> EmptyStr then begin
               dblFuncao.KeyValue:= FieldByName('func_col').AsString;
            end;
            if FieldByName('proc_col').AsString <> EmptyStr then begin
               dblProcesso.KeyValue:= FieldByName('proc_col').AsString;
            end;
            if FieldByName('col_status').AsString <> EmptyStr then begin
               dblSituacao.KeyValue:= FieldByName('col_status').AsString;
            end;
//            if FieldByName('col_usuario').AsString <> EmptyStr then begin
               dblUsuario.KeyValue:= FieldByName('col_usuario').AsString;
//            end;

            if AllTrim(edtArquivo1.Text) <> EmptyStr then begin
               sbVisualizar1.Enabled:= True;
            end
            else begin
               sbVisualizar1.Enabled:= False;
            end;
         end;
      end;
      1: begin
         with cdsColaboradores do begin
            edtEndereco.Text   := FieldByName('col_endereco').AsString;
            edtNumero.Text     := FieldByName('col_numero').AsString;
            edtBairro.Text     := FieldByName('col_bairro').AsString;
            edtCidade.Text     := FieldByName('col_cidade').AsString;
            dblEstados.KeyValue:= FieldByName('col_estado').AsString;
            medtCEP.Text       := FieldByName('col_cep').AsString;
            edtFone.Text       := FieldByName('col_telefone').AsString;
            edtCelular.Text    := FieldByName('col_celular').AsString;
            medtCPF.Text       := FieldByName('col_cpf').AsString;
            edtRG.Text         := FieldByName('col_rg').AsString;
            edtCTPS.Text       := FieldByName('col_ctps').AsString;
            edtPIS.Text        := FieldByName('col_pis').AsString;
         end;
      end;
      2: begin
         with cdsCurriculo do begin
            edtEmpresa.Text  := FieldByName('empr_his').AsString;
            medtDe.Text      := FieldByName('de_his').AsString;
            medtAte.Text     := FieldByName('ate_his').AsString;
            edtFuncaoCur.Text:= FieldByName('func_his').AsString;
         end;
      end;
      3: begin
         with cdsEducacaoCol do begin
            edtEscola.Text := FieldByName('edu_escola').AsString;
            medtDe1.Text   := FieldByName('edu_de').AsString;
            medtAte1.Text  := FieldByName('edu_ate').AsString;
            edtCaminho.Text:= FieldByName('edu_anexo').AsString;
            edtCurso.Text  := FieldByName('edu_curso').AsString;

            if FieldByName('edu_grau').AsString <> EmptyStr then begin
               dblNivelEducacao.KeyValue:= FieldByName('edu_grau').AsString;
            end;

            ControlarBotaoVisualiza(Self);
         end;
      end;
      4: begin
         with cdsDoc do begin
            edtDescricaoDoc.Text := FieldByName('doc_descricao').AsString;
            edtCaminhoDoc.Text   := FieldByName('doc_caminho').AsString;

            if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
               sbVisualizarDoc.Enabled:= True;
            end
            else begin
               sbVisualizarDoc.Enabled:= False;
            end;
         end;
      end;
      5: begin // Treinamentos do Colaborador
         LimparCampos();
         with cdsTreinamentosCol do begin
            dblTreinamentos.KeyValue:= FieldByName('codi_tre').AsString;
            edtTreCertificado.Text  := FieldByName('tre_certificado').AsString;
            medtTempoTrein.Text     := FieldByName('tre_tempo').AsString;
            edtCustoTrein.Value     := FieldByName('tre_custo').AsFloat;

            if FieldByName('tipo_tre').AsString = 'M' then begin
               cbTipo.ItemIndex:= 0;
            end
            else begin
               cbTipo.ItemIndex:= 1;
            end;
            if FieldByName('dtpr_tre').AsString <> EmptyStr then begin
               dtDataPrevista.Date  := FieldByName('dtpr_tre').AsDateTime;
            end;
            if FieldByName('dtre_tre').AsString <> EmptyStr then begin
               dtDataRealizacao.Date:= FieldByName('dtre_tre').AsDateTime;
            end;
         end;

         if AllTrim(edtTreCertificado.Text) <> EmptyStr then begin
            sbVisualizaTreCertificado.Enabled:= True;
         end
         else begin
            sbVisualizaTreCertificado.Enabled:= False;
         end;
      end;
      6: begin // Habilidades do Colaborador
         with cdsHabilidadesCol do begin
            dblHabilidades.KeyValue:= FieldByName('codi_hab').AsString;
            edtNota.Value          := FieldByName('nota_hab').AsFloat;
            edtAno.Text            := FieldByName('hab_ano').AsString;
         end;
      end;
   end;
end;

procedure TFormCadColaboradores.rgTipoRelClick(Sender: TObject);
begin
   case rgTipoRel.ItemIndex of
      0: begin //Listagem
         chkQuebra.Checked:= False;
         chkQuebra.Enabled:= False;
      end;
      1..2: begin //Com Treinamentos / Com Habilidades
         chkQuebra.Checked:= False;
         chkQuebra.Enabled:= True;
      end;
   end;
end;

procedure TFormCadColaboradores.sbAbreTreCertificadoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtTreCertificado.Text:= OPD1.FileName;
end;

procedure TFormCadColaboradores.sbAbrirDocClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminhoDoc.Text:= OPD1.FileName;
end;

procedure TFormCadColaboradores.sbArquivo1Click(Sender: TObject);
begin
   OPD1.Execute;
   edtArquivo1.Text:= OPD1.FileName;
end;

procedure TFormCadColaboradores.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadColaboradores.sbLimpar1Click(Sender: TObject);
begin
   edtArquivo1.Clear;
   sbVisualizar1.Enabled:= False;
end;

procedure TFormCadColaboradores.sbLimparClick(Sender: TObject);
begin
   edtCaminho.Clear;
   sbVisualizar.Enabled:= False;
end;

procedure TFormCadColaboradores.sbLimpaTreCertificadoClick(Sender: TObject);
begin
   edtTreCertificado.Clear;
   sbVisualizaTreCertificado.Enabled:= False;
end;

procedure TFormCadColaboradores.sbVisualizar1Click(Sender: TObject);
begin
   AbrirArquivo(edtArquivo1.Text, Self.Name);
end;

procedure TFormCadColaboradores.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

procedure TFormCadColaboradores.sbVisualizarDocClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminhoDoc.Text, Self.Name);
end;

procedure TFormCadColaboradores.sbVisualizaTreCertificadoClick(Sender: TObject);
begin
   AbrirArquivo(edtTreCertificado.Text, Self.Name);
end;

procedure TFormCadColaboradores.tsCurriculoShow(Sender: TObject);
begin
   HabilitarCampos(False, False);
end;

procedure TFormCadColaboradores.tsDocShow(Sender: TObject);
begin
   HabilitarCampos(False, False);
end;

function TFormCadColaboradores.ValidarDados(): Boolean;
begin
   if AllTrim(edtNomeColaborador.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome do Colaborador é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtNomeColaborador);
      Result:= False;
      Exit;
   end;

   if dblEducacao.KeyValue = -1 then begin
      Application.MessageBox('Campo Nível de Educação Comprovado é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblEducacao);
      Result:= False;
      Exit;
   end;

   if dblExperiencia.KeyValue = -1 then begin
      Application.MessageBox('Campo Experiência Comprovada é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblExperiencia);
      Result:= False;
      Exit;
   end;

   if dblFuncao.KeyValue = -1 then begin
      Application.MessageBox('Campo Função é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblFuncao);
      Result:= False;
      Exit;
   end;

   if (dblProcesso.KeyValue = -1) or (dblProcesso.KeyValue = Null) then begin
      Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if dblSituacao.KeyValue = -1 then begin
      Application.MessageBox('Campo Situação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblSituacao);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadColaboradores.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sStatus: string;
begin
   if (chkTodosCol.Checked = False) and ((dblColaborador.KeyValue <= 0) or (dblColaborador.KeyValue = null)) then begin
      Application.MessageBox('Selecione o Colaborador ou marque TODOS', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblColaborador);
      Exit;
   end;

   if (chkTodosProc.Checked = False) and ((dblFiltroProcesso.KeyValue <= 0) or (dblFiltroProcesso.KeyValue = null)) then begin
      Application.MessageBox('Selecione o Processo ou marque TODOS', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblFiltroProcesso);
      Exit;
   end;

   if (chkTodosFuncao.Checked = False) and ((dblFiltroFuncao.KeyValue <= 0) or (dblFiltroFuncao.KeyValue = null)) then begin
      Application.MessageBox('Selecione o Processo ou marque TODOS', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(chkTodosFuncao);
      Exit;
   end;

   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'codi_col';
   end
   else begin
      sCampoOrdem:= 'nome_col';
   end;

   case rgSituacao.ItemIndex of
      0: begin
         sStatus:= ' AND col_status = 1 ';
      end;
      1: begin
         sStatus:= ' AND col_status = 2 ';
      end;
      2: begin
         sStatus:= ' ';
      end;
   end;

   with frxReport1 do begin
      case rgTipoRel.ItemIndex of
         0: begin
            with cdsImprimir do begin
               Active:= False;
               CommandText:= ' SELECT codi_col, nome_col, func_col, desc_fun, educ_col, TC.valo_com as Educacao,' +
                             ' expe_col, TC1.valo_com as Experiencia,' +
                             ' esco_col, conc_col, obs_col, proc_col, P.nome_pro, TC2.valo_com as Status, ' +
                             ' col_email ' +
                             ' FROM colaboradores' +
                             ' INNER JOIN tabela_combos TC ON TC.codi_com = educ_col and TC.tipo_com = 6' +
                             ' INNER JOIN tabela_combos TC1 ON TC1.codi_com = expe_col and TC1.tipo_com = 7' +
                             ' INNER JOIN tabela_combos TC2 ON TC2.codi_com = col_status and TC2.tipo_com = 15 ' +
                             ' INNER JOIN funcoes F ON F.codi_fun = func_col' +
                             ' INNER JOIN processos P ON P.codi_pro = proc_col' +
                             ' WHERE 1 = 1' +
                             sStatus;
               if chkTodosCol.Checked = False then begin
                  CommandText:= CommandText + ' AND codi_col = ' + IntToStr(dblColaborador.KeyValue);
               end;
               if chkTodosProc.Checked = False then begin
                  CommandText:= CommandText + ' AND proc_col = ' + IntToStr(dblFiltroProcesso.KeyValue);
               end;
               if chkTodosFuncao.Checked = False then begin
                  CommandText:= CommandText + ' AND func_col = ' + IntToStr(dblFiltroFuncao.KeyValue);
               end;
               CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
               Active:= True;
            end;

            if cdsImprimir.RecordCount = 0 then begin
               Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
               Exit;
            end;

            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Colaboradores.fr3');
         end;
         1: begin
            with cdsImprimirTre do begin
               Active:= False;
               CommandText:= ' SELECT C.codi_col, C.nome_col, C.func_col, F.desc_fun, C.educ_col, TC.valo_com as Educacao, ' +
                             ' C.expe_col, TC1.valo_com as Experiencia,' +
                             ' C.obs_col, C.proc_col, P.nome_pro, TC2.valo_com as Status,' +
                             ' C.col_email, CT.codi_tre, T.desc_tre, CT.dtpr_tre, CT.dtre_tre, CT.tipo_tre,' +
                             ' CT.tre_custo, CT.tre_tempo' +
                             ' FROM colaboradores C' +
                             ' INNER JOIN tabela_combos TC ON TC.codi_com = educ_col and TC.tipo_com = 6' +
                             ' INNER JOIN tabela_combos TC1 ON TC1.codi_com = expe_col and TC1.tipo_com = 7' +
                             ' INNER JOIN tabela_combos TC2 ON TC2.codi_com = col_status and TC2.tipo_com = 15 ' +
                             ' INNER JOIN funcoes F ON F.codi_fun = func_col' +
                             ' INNER JOIN processos P ON P.codi_pro = proc_col' +
                             ' INNER JOIN colab_treinamentos CT ON CT.codi_col = C.codi_col' +
                             ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                             ' WHERE 1 = 1' +
                             sStatus;
               if chkTodosCol.Checked = False then begin
                  CommandText:= CommandText + ' AND C.codi_col = ' + IntToStr(dblColaborador.KeyValue);
               end;
               if chkTodosProc.Checked = False then begin
                  CommandText:= CommandText + ' AND proc_col = ' + IntToStr(dblFiltroProcesso.KeyValue);
               end;
               if chkTodosFuncao.Checked = False then begin
                  CommandText:= CommandText + ' AND func_col = ' + IntToStr(dblFiltroFuncao.KeyValue);
               end;
               CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
               Active:= True;
            end;

            if cdsImprimirTre.RecordCount = 0 then begin
               Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
               Exit;
            end;

            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ColabTre.fr3');
         end;
         2: begin
            with cdsImprimirHab do begin
               Active:= False;
               CommandText:= ' SELECT C.codi_col, C.nome_col, C.func_col, F.desc_fun, C.educ_col, TC.valo_com as Educacao, ' +
                             ' C.expe_col, TC1.valo_com as Experiencia,' +
                             ' C.obs_col, C.proc_col, P.nome_pro, TC2.valo_com as Status,' +
                             ' C.col_email, CH.codi_hab, H.desc_hab, CH.nota_hab, CH.hab_ano' +
                             ' FROM colaboradores C' +
                             ' INNER JOIN tabela_combos TC ON TC.codi_com = educ_col and TC.tipo_com = 6' +
                             ' INNER JOIN tabela_combos TC1 ON TC1.codi_com = expe_col and TC1.tipo_com = 7' +
                             ' INNER JOIN tabela_combos TC2 ON TC2.codi_com = col_status and TC2.tipo_com = 15 ' +
                             ' INNER JOIN funcoes F ON F.codi_fun = func_col' +
                             ' INNER JOIN processos P ON P.codi_pro = proc_col' +
                             ' INNER JOIN colab_habilidades CH ON CH.codi_col = C.codi_col' +
                             ' INNER JOIN habilidades H ON H.codi_hab = CH.codi_hab' +
                             ' WHERE 1 = 1' +
                             sStatus;
               if chkTodosCol.Checked = False then begin
                  CommandText:= CommandText + ' AND C.codi_col = ' + IntToStr(dblColaborador.KeyValue);
               end;
               if chkTodosProc.Checked = False then begin
                  CommandText:= CommandText + ' AND proc_col = ' + IntToStr(dblFiltroProcesso.KeyValue);
               end;
               if chkTodosFuncao.Checked = False then begin
                  CommandText:= CommandText + ' AND func_col = ' + IntToStr(dblFiltroFuncao.KeyValue);
               end;
               CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem + ', CH.hab_ano desc, H.desc_hab ';
               Active:= True;
            end;

            if cdsImprimirHab.RecordCount = 0 then begin
               Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
               Exit;
            end;

            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ColabHab.fr3');
         end;
      end;

      Variables['sNovaPagina']:= IIf(chkQuebra.Checked, QuotedStr('S'), QuotedStr('N'));

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
