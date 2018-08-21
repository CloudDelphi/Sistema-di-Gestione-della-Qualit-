unit frm_CadPMCConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, TeEngine, Series, TeeProcs, Chart,
  DBChart, AdvOpenGLControl, AdvChartView3D, AdvChart, AdvChartViewGDIP,
  DBAdvChartViewGDIP, AdvChartView;

type
  TFormCadPMCConsulta = class(TForm)
    pnl1: TPanel;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnVisualizar: TBitBtn;
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
    frxReport1: TfrxReport;
    frxDBListaPMC: TfrxDBDataset;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    dspTipo: TDataSetProvider;
    zqryTipo: TZQuery;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
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
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    cdsPMCcodi_pmc: TLargeintField;
    cdsPMCdata_pmc: TDateTimeField;
    cdsPMCemit_pmc: TLargeintField;
    cdsPMCtipo_pmc: TLargeintField;
    cdsPMCncon_pmc: TMemoField;
    cdsPMCproc_pmc: TLargeintField;
    cdsPMCresp_pmc: TLargeintField;
    cdsPMCefic_pmc: TLargeintField;
    cdsPMCprcs_pmc: TLargeintField;
    cdsPMCrequ_pmc: TWideStringField;
    cdsPMCnume_pmc: TWideStringField;
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsResponsavel: TDataSource;
    cdsPMCDescTipo: TStringField;
    cdsImprimirnume_pmc: TWideStringField;
    cdsImprimirdata_pmc: TDateTimeField;
    cdsImprimirOrigem: TWideStringField;
    cdsImprimirTipo: TWideStringField;
    cdsImprimirEficaz: TWideStringField;
    cdsImprimirnome_pro: TWideStringField;
    zqryEficaz: TZQuery;
    dspEficaz: TDataSetProvider;
    cdsEficaz: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsEficaz: TDataSource;
    zqryGrafico: TZQuery;
    dspGrafico: TDataSetProvider;
    cdsGrafico: TClientDataSet;
    cdsGraficotipo_pmc: TLargeintField;
    cdsGraficovalo_com: TWideStringField;
    cdsGraficoQtd: TLargeintField;
    cdsPMCDescEficaz: TStringField;
    cdsGraficoDescTipo: TStringField;
    frxDBGrafico: TfrxDBDataset;
    zqryClientes: TZQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    cdsClientescli_codigo: TIntegerField;
    cdsClientescli_nome: TWideStringField;
    cdsPMCorig_pmc: TLargeintField;
    cdsImprimirncon_pmc: TWideMemoField;
    cdsFornforn_codigo: TIntegerField;
    cdsFornforn_nome: TWideStringField;
    lbllb6: TLabel;
    lbllb2: TLabel;
    lbllb1: TLabel;
    lbllb7: TLabel;
    lbllb9: TLabel;
    lbllb3: TLabel;
    lbllb4: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    AdvChartView3DPMC: TAdvChartView3D;
    dbgPMC: TDBGrid;
    dtDataIni: TDateEdit;
    dtDataFim: TDateEdit;
    dblEmitido: TDBLookupComboBox;
    chkEmitido: TCheckBox;
    chkTipo: TCheckBox;
    chkOrigem: TCheckBox;
    dblProcessos: TDBLookupComboBox;
    chkProcesso: TCheckBox;
    chkProcede: TCheckBox;
    dblResponsavel: TDBLookupComboBox;
    chkResp: TCheckBox;
    chkEficaz: TCheckBox;
    dblProcede: TDBLookupComboBox;
    chkData: TCheckBox;
    dblEficaz: TDBLookupComboBox;
    dblTipo: TDBLookupComboBox;
    dblOrigem: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    dblClientes: TDBLookupComboBox;
    chkCliente: TCheckBox;
    dblForn: TDBLookupComboBox;
    chkForn: TCheckBox;
    edtNumPMC: TEdit;
    lbl5: TLabel;
    btnImprimirCompleto: TBitBtn;
    dspImprimirComp: TDataSetProvider;
    zqryImprimirComp: TZQuery;
    frxDBPMCFecha: TfrxDBDataset;
    cdsImprimirComp: TClientDataSet;
    cdsImprimirpmc_dataFecha: TDateTimeField;
    cdsImprimirDescEficaz: TWideStringField;
    cdsImprimirNomeRespAcao: TStringField;
    cdsImprimirDescTipo: TStringField;
    cdsImprimirDescOrigem: TStringField;
    cdsImprimirNomeResp: TStringField;
    cdsImprimirNomeEmit: TStringField;
    cdsImprimirProcede: TStringField;
    cdsImprimircodi_pmc: TLargeintField;
    DateTimeField1: TDateTimeField;
    cdsImprimiremit_pmc: TLargeintField;
    cdsImprimirtipo_pmc: TLargeintField;
    cdsImprimirorig_pmc: TLargeintField;
    WideMemoField1: TWideMemoField;
    cdsImprimirproc_pmc: TLargeintField;
    cdsImprimirresp_pmc: TLargeintField;
    cdsImprimirefic_pmc: TLargeintField;
    cdsImprimirprcs_pmc: TLargeintField;
    cdsImprimirimed_pmc: TWideMemoField;
    cdsImprimircaus_pmc: TWideMemoField;
    cdsImprimirvefi_pmc: TWideMemoField;
    cdsImprimirrequ_pmc: TWideStringField;
    WideStringField5: TWideStringField;
    cdsImprimirpmc_cliente: TIntegerField;
    cdsImprimirpmc_fechado: TIntegerField;
    cdsImprimirpmc_arq_evidencia: TWideMemoField;
    cdsImprimirpmc_substituto: TWideStringField;
    cdsImprimircodi_aco: TLargeintField;
    cdsImprimirdesc_aco: TWideMemoField;
    cdsImprimirresp_aco: TLargeintField;
    cdsImprimirvimp_aco: TWideMemoField;
    cdsImprimirpmc_cea: TIntegerField;
    cdsImprimircli_nome: TWideStringField;
    cdsImprimirforn_nome: TWideStringField;
    cdsImprimirpmc_fornecedor: TIntegerField;
    WideStringField6: TWideStringField;
    cdsImprimiraco_prazo: TDateTimeField;
    cdsImprimirpmc_preveficacia: TDateTimeField;
    cdsImprimirComppmc_codrisco: TIntegerField;
    cdsImprimirComppmc_tiporisco: TIntegerField;
    cdsImprimirComppmc_fase: TIntegerField;
    cdsImprimirCompfase: TWideStringField;
    cdsPMCimed_pmc: TWideMemoField;
    cdsPMCcaus_pmc: TWideMemoField;
    cdsPMCvefi_pmc: TWideMemoField;
    cdsPMCpmc_datafecha: TDateTimeField;
    cdsPMCpmc_cliente: TIntegerField;
    cdsPMCpmc_fechado: TIntegerField;
    cdsPMCpmc_arq_evidencia: TWideMemoField;
    cdsPMCpmc_substituto: TWideStringField;
    cdsPMCpmc_cea: TIntegerField;
    cdsPMCpmc_fornecedor: TIntegerField;
    cdsPMCpmc_preveficacia: TDateTimeField;
    cdsPMCpmc_codrisco: TIntegerField;
    cdsPMCpmc_tiporisco: TIntegerField;
    cdsPMCpmc_fase: TIntegerField;
    cdsPMCdescresp: TWideStringField;
    cdsPMCcol_status: TIntegerField;
    pnl4: TPanel;
    lbl6: TLabel;
    btnExcel: TBitBtn;
    lblMsgFiltro: TLabel;
    dbgExcel: TDBGrid;
    zqryExcel: TZQuery;
    dspExcel: TDataSetProvider;
    cdsExcel: TClientDataSet;
    dsExcel: TDataSource;
    lbl7: TLabel;
    lbl8: TLabel;
    dblProdutos: TDBLookupComboBox;
    chkProduto: TCheckBox;
    dblMotivos: TDBLookupComboBox;
    chkMotivo: TCheckBox;
    zqry1: TZQuery;
    dsp1: TDataSetProvider;
    cds1: TClientDataSet;
    zqry2: TZQuery;
    dsp2: TDataSetProvider;
    cds2: TClientDataSet;
    cds3: TWideStringField;
    DateTimeField2: TDateTimeField;
    cds4: TWideStringField;
    cds5: TWideStringField;
    cds6: TWideStringField;
    cds7: TWideStringField;
    WideMemoField2: TWideMemoField;
    frxReport2: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    zqryMotivos: TZQuery;
    dspMotivos: TDataSetProvider;
    cdsMotivos: TClientDataSet;
    cdsMotivoscodi_com: TLargeintField;
    cdsMotivosvalo_com: TWideStringField;
    dsMotivos: TDataSource;
    zqryProdutos: TZQuery;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    cdsProdutospro_codigo: TIntegerField;
    cdsProdutospro_descricao: TWideStringField;
    dsProdutos: TDataSource;
    btnGraficos: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure chkDataClick(Sender: TObject);
    procedure chkEmitidoClick(Sender: TObject);
    procedure chkTipoClick(Sender: TObject);
    procedure chkOrigemClick(Sender: TObject);
    procedure chkProcessoClick(Sender: TObject);
    procedure chkProcedeClick(Sender: TObject);
    procedure chkRespClick(Sender: TObject);
    procedure chkEficazClick(Sender: TObject);
    procedure CarregaValores();
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure chkClienteClick(Sender: TObject);
    procedure chkFornClick(Sender: TObject);
    procedure InicializarGraf();
    procedure edtNumPMCChange(Sender: TObject);
    procedure dbgPMCDblClick(Sender: TObject);
    procedure btnImprimirCompletoClick(Sender: TObject);
    procedure dbgPMCDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
    procedure chkProdutoClick(Sender: TObject);
    procedure chkMotivoClick(Sender: TObject);
    procedure btnGraficosClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;

    sDataPmcIni : string;
    sDataPmcFim : string;
    iEmitido : Integer;
    iTipo    : Integer;
    iOrigem  : Integer;
    iProcesso: Integer;
    iProcede : Integer;
    iRespons : Integer;
    iEficaz  : Integer;
    iCliente : Integer;
    sForn    : string;
    iProduto : Integer;
    iMotivo  : Integer;
    varWhere: string;
    sTipoRel: string;
  public
    { Public declarations }
  end;

var
  FormCadPMCConsulta: TFormCadPMCConsulta;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_CadPMCFecha, frm_GraficoPMC;

{$R *.dfm}

procedure TFormCadPMCConsulta.AtualizarDados;
begin
   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 4' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsMotivos do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 37' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsProdutos do begin
      Active:= False;
      CommandText:= ' SELECT pro_codigo, pro_descricao' +
                    ' FROM produtos' +
                    ' ORDER BY pro_descricao';
      Active:= True;
   end;

   with cdsEmitido do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsResponsavel do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
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

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;
end;

procedure TFormCadPMCConsulta.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPMCConsulta.btnImprimirClick(Sender: TObject);
begin
   sTipoRel:= 'L';

   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadPMCConsulta.btnImprimirCompletoClick(Sender: TObject);
begin
   sTipoRel:= 'C'; // Completo

   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadPMCConsulta.btnPesquisarClick(Sender: TObject);
begin
   edtNumPMC.Clear;
   cdsPMC.Filter:= '';
   CarregaValores();
   InicializarGraf();
end;

procedure TFormCadPMCConsulta.btnPrimeiroClick(Sender: TObject);
begin
   cdsPMC.First;
end;

procedure TFormCadPMCConsulta.btnVisualizarClick(Sender: TObject);
begin
   FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
   FormCadPMCFecha.sCodigoPMC:= cdsPMC.FieldByName('codi_pmc').AsString;
   FormCadPMCFecha.iTela:= 2;
   FormCadPMCFecha.ShowModal;
   FormCadPMCFecha.Release;
   FormCadPMCFecha.Free;
   FormCadPMCFecha:= nil;
end;

procedure TFormCadPMCConsulta.btnAnteriorClick(Sender: TObject);
begin
   cdsPMC.Prior;
end;

procedure TFormCadPMCConsulta.btnExcelClick(Sender: TObject);
begin
   with cdsExcel do begin
      Active:= False;
      CommandText:= ' SELECT nume_pmc as "Número PMC", data_pmc as "Data", C.nome_col as "Emissor", ' +
                    ' TC.valo_com as "Tipo", PR.nome_pro as "Processo",' +
                    ' TC2.valo_com as "Origem", CL.cli_nome as "Cliente", ncon_pmc as "Não Conformidade", ' +
                    ' TC3.valo_com as "Procede", C1.nome_col as "Responsável",' +
                    ' imed_pmc as "Ação de Contenção Imediata", caus_pmc as "Identificação da Causa", ' +
                    ' vefi_pmc as "Verificação de Eficácia", TC4.valo_com as "Eficaz", ' +
                    ' pmc_datafecha as "Data de Verificação de Eficácia", ' +
                    ' pmc_usuario_eficacia as "Usuário que verificou eficácia" ' +
                    ' FROM PMC P' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = P.emit_pmc' +
                    ' LEFT JOIN colaboradores C1 ON C1.codi_col = P.resp_pmc' +
                    ' LEFT JOIN tabela_combos TC ON TC.codi_com = P.tipo_pmc AND TC.tipo_com = 4' +
                    ' LEFT JOIN tabela_combos TC2 ON TC2.codi_com = P.orig_pmc AND TC2.tipo_com = 5' +
                    ' LEFT JOIN tabela_combos TC3 ON TC3.codi_com = P.proc_pmc AND TC3.tipo_com = 14' +
                    ' LEFT JOIN tabela_combos TC4 ON TC4.codi_com = P.efic_pmc AND TC4.tipo_com = 21' +
                    ' LEFT JOIN processos PR ON PR.codi_pro = P.prcs_pmc' +
                    ' LEFT JOIN clientes CL ON CL.cli_codigo = P.pmc_cliente' +
                    ' WHERE 1 = 1' + varWhere +
                    ' ORDER BY nume_pmc';
      Active:= True;
   end;

   if cdsExcel.RecordCount <= 0 then begin
      Application.MessageBox('Não existem registros para exportar', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      ExpExcel(dbgExcel, cdsExcel, 'Lista de PMC', Self);
   end;
end;

procedure TFormCadPMCConsulta.btnGraficosClick(Sender: TObject);
begin
   FormGraficoPMC:= TFormGraficoPMC.Create(nil);
   FormGraficoPMC.ShowModal;
   FormGraficoPMC.Release;
end;

procedure TFormCadPMCConsulta.btnProximoClick(Sender: TObject);
begin
   cdsPMC.Next;
end;

procedure TFormCadPMCConsulta.btnUltimoClick(Sender: TObject);
begin
   cdsPMC.Last;
end;

procedure TFormCadPMCConsulta.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadPMCConsulta.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPMCConsulta.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPMCConsulta.CarregaValores;
var
   sDataFiltroPMC: string;
begin
   if dtDataIni.Text <> '  /  /    ' then begin
      try
         StrToDate(dtDataIni.Text);
      except
         Application.MessageBox('Data Inicial inválida', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataIni.SetFocus;
         Exit;
      end;
   end;

   if dtDataFim.Text <> '  /  /    ' then begin
      try
         StrToDate(dtDataFim.Text);
      except
         Application.MessageBox('Data Final inválida', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataFim.SetFocus;
         Exit;
      end;
   end;

   if dtDataIni.Text = '  /  /    ' then begin
      sDataPmcIni:= EmptyStr
   end
   else begin
      sDataPmcIni:= ArrumaDataSQL(dtDataIni.Date);
   end;

   if dtDataFim.Text = '  /  /    ' then begin
      sDataPmcFim:= EmptyStr
   end
   else begin
      sDataPmcFim:= ArrumaDataSQL(dtDataFim.Date);
   end;

   if chkEmitido.Checked then begin
      iEmitido:= 0
   end
   else begin
      iEmitido:= dblEmitido.KeyValue;
   end;

   if chkTipo.Checked then begin
      iTipo:= 0
   end
   else begin
      iTipo:= dblTipo.KeyValue;
   end;

   if chkOrigem.Checked then begin
      iOrigem:= 0
   end
   else begin
      iOrigem:= dblOrigem.KeyValue;
   end;

   if chkProcesso.Checked then begin
      iProcesso:= 0
   end
   else begin
      iProcesso:= dblProcessos.KeyValue;
   end;

   if chkProcede.Checked then begin
      iProcede:= -1
   end
   else begin
      iProcede:= dblProcede.KeyValue;
   end;

   if chkResp.Checked then begin
      iRespons:= 0
   end
   else begin
      iRespons:= dblResponsavel.KeyValue;
   end;

   if chkEficaz.Checked then begin
      iEficaz:= -1
   end
   else begin
      iEficaz:= dblEficaz.KeyValue;
   end;

   if chkCliente.Checked then begin
      iCliente:= -1
   end
   else begin
      iCliente:= dblClientes.KeyValue;
   end;

   if chkForn.Checked then begin
      sForn:= EmptyStr;
   end
   else begin
      sForn:= dblForn.KeyValue;
   end;

   if chkProduto.Checked then begin
      iProduto:= -1;
   end
   else begin
      iProduto:= dblProdutos.KeyValue;
   end;

   if chkMotivo.Checked then begin
      iMotivo:= -1;
   end
   else begin
      iMotivo:= dblMotivos.KeyValue;
   end;

   // Busca a data de filtro de PMC em parâmetros
   sDataFiltroPMC:= BuscarDataFiltroPMC('S');

   if (sDataFiltroPMC = '') or (sDataFiltroPMC = null) then begin
      varWhere:= '';
      lblMsgFiltro.Visible:= False;
   end
   else begin
      varWhere:= ' AND data_pmc >= ' + ArrumaDataSQL(BuscarDataFiltroPMC());
      lblMsgFiltro.Visible:= True;
      lblMsgFiltro.Caption:= 'Filtro por data cadastrado em Parâmetros: ' + sDataFiltroPMC;
   end;

   // Monta o select para os dados e gráfico
   if (sDataPmcIni <> EmptyStr) and (sDataPmcFim <> EmptyStr) and (chkData.Checked = False) then
      varWhere:= varWhere + ' AND data_pmc between ' + sDataPmcIni + ' and ' + sDataPmcFim;
   if iEmitido <> 0 then
      varWhere:= varWhere + ' AND emit_pmc = ' + IntToStr(iEmitido);
   if iTipo <> 0 then
      varWhere:= varWhere + ' AND tipo_pmc = ' + IntToStr(iTipo);
   if iOrigem <> 0 then
      varWhere:= varWhere + ' AND orig_pmc = ' + IntToStr(iOrigem);
   if iProcesso <> 0 then
      varWhere:= varWhere + ' AND prcs_pmc = ' + IntToStr(iProcesso);
   if iProcede <> -1 then
      varWhere:= varWhere + ' AND proc_pmc = ' + IntToStr(iProcede);
   if iRespons <> 0 then
      varWhere:= varWhere + ' AND resp_pmc = ' + IntToStr(iRespons);
   if iEficaz <> -1 then
      varWhere:= varWhere + ' AND efic_pmc = ' + IntToStr(iEficaz);
   if iCliente <> -1 then
      varWhere:= varWhere + ' AND pmc_cliente = ' + IntToStr(iCliente);
   if sForn <> EmptyStr then
      varWhere:= varWhere + ' AND pmc_fornecedor = ' + QuotedStr(sForn);
   if iProduto <> -1 then
      varWhere:= varWhere + ' AND pmc_produto = ' + IntToStr(iProduto);
   if iMotivo <> -1 then
      varWhere:= varWhere + ' AND pmc_motivo = ' + IntToStr(iMotivo);

   with cdsGrafico do begin
      Active:= False;
      CommandText:= ' SELECT tipo_pmc, valo_com, COUNT(*) as Qtd ' +
                    ' FROM pmc' +
                    ' INNER JOIN tabela_combos TC on TC.tipo_com = 4 and TC.codi_com = tipo_pmc' +
                    ' WHERE 1 = 1' + varWhere +
                    ' GROUP BY tipo_pmc, valo_com';
      Active:= True;
   end;

   with cdsPMC do begin
      Active:= False;
      CommandText:= ' SELECT codi_pmc, data_pmc, emit_pmc, tipo_pmc, orig_pmc, ncon_pmc, proc_pmc,' +
                    '        resp_pmc, efic_pmc, prcs_pmc, imed_pmc, caus_pmc, vefi_pmc, requ_pmc,' +
                    '        nume_pmc, pmc_datafecha, pmc_cliente, pmc_fechado, pmc_arq_evidencia,' +
                    '        pmc_substituto, pmc_cea, pmc_fornecedor, pmc_preveficacia, pmc_codrisco,' +
                    '        pmc_tiporisco, pmc_fase, C.nome_col as DescResp, C.col_status' +
                    ' FROM pmc P' +
                    ' INNER JOIN colaboradores C ON C.codi_col = P.resp_pmc' +
                    ' WHERE 1 = 1' + varWhere +
                    ' ORDER BY nume_pmc DESC';
      Active:= True;
   end;

   if cdsPMC.IsEmpty then begin
      Application.MessageBox('Não foram encontrados registros com as opções especificadas','Aviso', MB_OK + MB_ICONINFORMATION);
      btnVisualizar.Enabled      := False;
      btnImprimir.Enabled        := False;
      btnImprimirCompleto.Enabled:= False;
      btnExcel.Enabled           := False;
   end
   else begin
      AtualizarGrid(dbgPMC);

      btnVisualizar.Enabled      := True;
      btnImprimir.Enabled        := True;
      btnImprimirCompleto.Enabled:= True;
      btnExcel.Enabled           := True;
   end;
end;

procedure TFormCadPMCConsulta.chkClienteClick(Sender: TObject);
begin
   dblClientes.Enabled:= not chkCliente.Checked;
end;

procedure TFormCadPMCConsulta.chkDataClick(Sender: TObject);
begin
   dtDataIni.Enabled:= not chkData.Checked;
   dtDataFim.Enabled:= not chkData.Checked;
end;

procedure TFormCadPMCConsulta.chkEficazClick(Sender: TObject);
begin
   dblEficaz.Enabled:= not chkEficaz.Checked;
end;

procedure TFormCadPMCConsulta.chkEmitidoClick(Sender: TObject);
begin
   dblEmitido.Enabled:= not chkEmitido.Checked;
end;

procedure TFormCadPMCConsulta.chkFornClick(Sender: TObject);
begin
   dblForn.Enabled:= not chkForn.Checked;
end;

procedure TFormCadPMCConsulta.chkMotivoClick(Sender: TObject);
begin
   dblMotivos.Enabled:= not chkMotivo.Checked;
end;

procedure TFormCadPMCConsulta.chkOrigemClick(Sender: TObject);
begin
   dblOrigem.Enabled:= not chkOrigem.Checked;
end;

procedure TFormCadPMCConsulta.chkProcedeClick(Sender: TObject);
begin
   dblProcede.Enabled:= not chkProcede.Checked;
end;

procedure TFormCadPMCConsulta.chkProcessoClick(Sender: TObject);
begin
   dblProcessos.Enabled:= not chkProcesso.Checked;
end;

procedure TFormCadPMCConsulta.chkProdutoClick(Sender: TObject);
begin
   dblProdutos.Enabled:= not chkProduto.Checked;
end;

procedure TFormCadPMCConsulta.chkRespClick(Sender: TObject);
begin
   dblResponsavel.Enabled:= not chkResp.Checked;
end;

procedure TFormCadPMCConsulta.chkTipoClick(Sender: TObject);
begin
   dblTipo.Enabled:= not chkTipo.Checked;
end;

procedure TFormCadPMCConsulta.dbgPMCDblClick(Sender: TObject);
begin
   btnVisualizarClick(Self);
end;

procedure TFormCadPMCConsulta.dbgPMCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if cdsPMC.FieldByName('col_status').AsInteger = 2 then begin
      if Column.Field = cdsPMC.FieldByName('descresp') then begin
         dbgPMC.Canvas.Font.Color:= clRed;
         dbgPMC.Canvas.FillRect(Rect);
         dbgPMC.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
   end;
end;

procedure TFormCadPMCConsulta.edtNumPMCChange(Sender: TObject);
begin
   cdsPMC.Filter:= 'nume_pmc LIKE ' + QuotedStr('%' + edtNumPMC.Text + '%');
   cdsPMC.Filtered:= True;
end;

procedure TFormCadPMCConsulta.FormShow(Sender: TObject);
begin
   chkEmitido.Checked := True;
   chkData.Checked    := True;
   chkTipo.Checked    := True;
   chkOrigem.Checked  := True;
   chkProcesso.Checked:= True;
   chkResp.Checked    := True;
   chkProcede.Checked := True;
   chkEficaz.Checked  := True;
   chkCliente.Checked := True;
   chkForn.Checked    := True;
   chkProduto.Checked := True;
   chkMotivo.Checked  := True;

   AtualizarDados();
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   AdvChartView3DPMC.Series[0].Items.Clear;
   AdvChartView3DPMC.Series[0].Legend.Visible:= False;
   lblMsgFiltro.Visible:= False;
end;

procedure TFormCadPMCConsulta.HabilitarCampos(Flag, Codigo: Boolean);
begin
   dtDataIni.Enabled     := Flag;
   dtDataFim.Enabled     := Flag;
   dblEmitido.Enabled    := Flag;
   dblTipo.Enabled       := Flag;
   dblOrigem.Enabled     := Flag;
   dblProcessos.Enabled  := Flag;
   dblProcede.Enabled    := Flag;
   dblResponsavel.Enabled:= Flag;
   dblEficaz.Enabled     := Flag;
end;

procedure TFormCadPMCConsulta.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   AtualizarDados();

   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'nume_pmc';
   end
   else begin
      sCampoOrdem:= 'data_pmc';
   end;

   if sTipoRel = 'L' then begin // Lista
      with cdsImprimir do begin
         Active:= False;
         CommandText:= ' SELECT p.nume_pmc, p.data_pmc, p.ncon_pmc, tc2.valo_com as Origem, tc.valo_com as Tipo,' +
                       ' tc3.valo_com as Eficaz,' +
                       ' pr.nome_pro FROM pmc p' +
                       ' INNER JOIN processos pr ON p.prcs_pmc = pr.codi_pro' +
                       ' INNER JOIN tabela_combos tc ON tc.tipo_com = 4 and tc.codi_com = p.tipo_pmc' +
                       ' INNER JOIN tabela_combos tc2 ON tc2.tipo_com = 5 and tc2.codi_com = p.orig_pmc ' +
                       ' INNER JOIN tabela_combos tc3 ON tc3.tipo_com = 21 and tc3.codi_com = p.efic_pmc ' +
                       ' WHERE 1 = 1' + varWhere +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      Imprimir('rel_ListaPMC', frxReport1, tipoImp);

      Auditoria('CONSULTA PMC','','R', '');
   end;

   if sTipoRel = 'C' then begin // Completo
      with cdsImprimirComp do begin
         Active:= False;
         CommandText:= ' SELECT P.*, A.codi_aco, A.desc_aco, A.resp_aco, A.aco_prazo, A.vimp_aco, ' +
                       ' tc.valo_com as DescEficaz, C.cli_nome, F.forn_nome, PR.nome_pro, TC1.valo_com as Fase' +
                       ' FROM pmc P' +
                       ' LEFT JOIN pmc_acoes A ON P.codi_pmc = A.codi_pmc' +
                       ' INNER JOIN tabela_combos tc ON tc.tipo_com = 21 and tc.codi_com = p.efic_pmc ' +
                       ' LEFT JOIN clientes C ON C.cli_codigo = P.pmc_cliente' +
                       ' LEFT JOIN fornecedores F ON F.forn_codigo = P.pmc_fornecedor' +
                       ' LEFT JOIN processos PR ON PR.codi_pro = P.prcs_pmc' +
                       ' LEFT JOIN tabela_combos TC1 ON TC1.tipo_com = 28 and TC1.codi_com = P.pmc_fase ' +
                       ' WHERE 1 = 1' + varWhere +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimirComp.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      Imprimir('rel_PMC_Completo', frxReport1, tipoImp);

      with dm.cdsAux2 do begin
         Active:= False;
         CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                       ' WHERE tipo_com = 28';
         Active:= True;
      end;
//      frxReport1.Variables['fase']:= QuotedStr(dblFase.Text);
//      Auditoria('PMC LISTA COMPLETA','','R', '');
   end;
end;

procedure TFormCadPMCConsulta.InicializarGraf;
//var
//   i: Integer;
begin
   AdvChartView3DPMC.BeginUpdate;
   AdvChartView3DPMC.InitSample;
   AdvChartView3DPMC.Title.Font.Size:= 8;
   AdvChartView3DPMC.Title.Text := 'Gráfico Tipo de PMC';

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
//         i:= 0;
         while not Eof do begin
//            i:= i + 1;
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

end.
