unit frm_CadRNCConsulta;

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
  TFormCadRNCConsulta = class(TForm)
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
    zqryRNC: TZQuery;
    dspRNC: TDataSetProvider;
    cdsRNC: TClientDataSet;
    dsRNC: TDataSource;
    frxReport1: TfrxReport;
    frxDBRNC: TfrxDBDataset;
    cdsMotivo: TClientDataSet;
    dsMotivo: TDataSource;
    dspMotivo: TDataSetProvider;
    zqryMotivo: TZQuery;
    lrgntfldMotivocodi_com: TLargeintField;
    cdsMotivovalo_com: TWideStringField;
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
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsResponsavel: TDataSource;
    zqryStatus: TZQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsStatus: TDataSource;
    zqryGrafico: TZQuery;
    dspGrafico: TDataSetProvider;
    cdsGrafico: TClientDataSet;
    cdsGraficovalo_com: TWideStringField;
    cdsGraficoQtd: TLargeintField;
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
    AdvChartView3DMotivos: TAdvChartView3D;
    dbgRNC: TDBGrid;
    dtDataIni: TDateEdit;
    dtDataFim: TDateEdit;
    dblEmitido: TDBLookupComboBox;
    chkEmitido: TCheckBox;
    chkMotivo: TCheckBox;
    chkOrigem: TCheckBox;
    dblProcessos: TDBLookupComboBox;
    chkProcesso: TCheckBox;
    chkProcede: TCheckBox;
    dblResponsavel: TDBLookupComboBox;
    chkResp: TCheckBox;
    chkStatus: TCheckBox;
    dblProcede: TDBLookupComboBox;
    chkData: TCheckBox;
    dblStatus: TDBLookupComboBox;
    dblMotivo: TDBLookupComboBox;
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
    edtNumRNC: TEdit;
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
    cdsGraficornc_motivo: TIntegerField;
    cdsRNCrnc_codigo: TIntegerField;
    cdsRNCrnc_identificacao: TWideStringField;
    cdsRNCrnc_data: TDateTimeField;
    cdsRNCrnc_emitido: TIntegerField;
    cdsRNCrnc_motivo: TIntegerField;
    cdsRNCrnc_processo: TIntegerField;
    cdsRNCrnc_setor: TWideStringField;
    cdsRNCrnc_origem: TIntegerField;
    cdsRNCrnc_cliente: TIntegerField;
    cdsRNCrnc_fornecedor: TIntegerField;
    cdsRNCrnc_consumidor: TWideStringField;
    cdsRNCrnc_nconformidade: TWideMemoField;
    cdsRNCrnc_procede: TIntegerField;
    cdsRNCrnc_responsavel: TIntegerField;
    cdsRNCrnc_departamento: TWideStringField;
    cdsRNCrnc_relacionamento: TIntegerField;
    cdsRNCrnc_representante: TWideStringField;
    cdsRNCrnc_status: TIntegerField;
    cdsRNCDescMotivo: TStringField;
    cdsRNCDescResp: TStringField;
    cdsImprimirrnc_codigo: TIntegerField;
    cdsImprimirrnc_identificacao: TWideStringField;
    cdsImprimirrnc_data: TDateTimeField;
    cdsImprimirrnc_emitido: TIntegerField;
    cdsImprimirrnc_processo: TIntegerField;
    cdsImprimirrnc_setor: TWideStringField;
    cdsImprimirrnc_origem: TIntegerField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirrnc_cliente: TIntegerField;
    cdsImprimircli_nome2: TWideStringField;
    cdsImprimirrnc_fornecedor: TIntegerField;
    cdsImprimirforn_nome2: TWideStringField;
    cdsImprimirrnc_consumidor: TWideStringField;
    cdsImprimirrnc_nconformidade: TWideMemoField;
    cdsImprimirrnc_procede: TIntegerField;
    cdsImprimirrnc_responsavel: TIntegerField;
    cdsImprimirresponsavel: TWideStringField;
    cdsImprimirrnc_departamento: TWideStringField;
    cdsImprimirrnc_relacionamento: TIntegerField;
    cdsImprimirrnc_representante: TWideStringField;
    cdsImprimiremitido: TWideStringField;
    cdsImprimirmotivo: TWideStringField;
    cdsRNCDescStatus: TStringField;
    AdvChartView3DStatus: TAdvChartView3D;
    cdsGraficoStatus: TClientDataSet;
    WideStringField7: TWideStringField;
    lrgntfld1: TLargeintField;
    StringField1: TStringField;
    dspGraficoStatus: TDataSetProvider;
    zqryGraficoStatus: TZQuery;
    cdsGraficoStatusrnc_status: TIntegerField;
    lbl6: TLabel;
    edtOrdemProd: TEdit;
    cdsRNCrnc_ordemprod: TWideStringField;
    rgFiltro: TRadioGroup;
    cdsImprimirrnc_custo: TFloatField;
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
    procedure chkMotivoClick(Sender: TObject);
    procedure chkOrigemClick(Sender: TObject);
    procedure chkProcessoClick(Sender: TObject);
    procedure chkProcedeClick(Sender: TObject);
    procedure chkRespClick(Sender: TObject);
    procedure chkStatusClick(Sender: TObject);
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
    procedure edtNumRNCChange(Sender: TObject);
    procedure dbgRNCDblClick(Sender: TObject);
    procedure btnImprimirCompletoClick(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;

    sDataRncIni : string;
    sDataRncFim : string;
    iEmitido : Integer;
    iMotivo  : Integer;
    iOrigem  : Integer;
    iProcesso: Integer;
    iProcede : Integer;
    iRespons : Integer;
    iStatus  : Integer;
    iCliente : Integer;
    sForn    : string;
    varWhere: string;
    sTipoRel: string;
  public
    { Public declarations }
  end;

var
  FormCadRNCConsulta: TFormCadRNCConsulta;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_CadPMCFecha, frm_CadRNCFecha;

{$R *.dfm}

procedure TFormCadRNCConsulta.AtualizarDados;
begin
   with cdsMotivo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 32' +
                    ' ORDER BY orde_com';
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
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsOrigem do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 33' +
                    ' ORDER BY valo_com';
      Active:= True;
   end;

   with cdsProcede do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsStatus do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 35' +
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

procedure TFormCadRNCConsulta.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRNCConsulta.btnImprimirClick(Sender: TObject);
begin
   sTipoRel:= 'L';
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormCadRNCConsulta.btnImprimirCompletoClick(Sender: TObject);
begin
   sTipoRel:= 'C'; // Completo
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormCadRNCConsulta.btnPesquisarClick(Sender: TObject);
begin
   edtNumRNC.Clear;
   cdsRNC.Filter:= '';
   CarregaValores();
   InicializarGraf();
end;

procedure TFormCadRNCConsulta.btnPrimeiroClick(Sender: TObject);
begin
   cdsRNC.First;
end;

procedure TFormCadRNCConsulta.btnVisualizarClick(Sender: TObject);
begin
   FormCadRNCFecha:= TFormCadRNCFecha.Create(nil);
   FormCadRNCFecha.sCodigoRNC:= cdsRNC.FieldByName('rnc_codigo').AsString;
   FormCadRNCFecha.iTela:= 2;
   FormCadRNCFecha.ShowModal;
   FormCadRNCFecha.Release;
   FreeAndNil(FormCadRNCFecha);
//   FormCadRNCFecha.Free;
//   FormCadRNCFecha:= nil;
end;

procedure TFormCadRNCConsulta.btnAnteriorClick(Sender: TObject);
begin
   cdsRNC.Prior;
end;

procedure TFormCadRNCConsulta.btnProximoClick(Sender: TObject);
begin
   cdsRNC.Next;
end;

procedure TFormCadRNCConsulta.btnUltimoClick(Sender: TObject);
begin
   cdsRNC.Last;
end;

procedure TFormCadRNCConsulta.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRNCConsulta.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRNCConsulta.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRNCConsulta.CarregaValores;
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
      sDataRncIni:= EmptyStr
   end
   else begin
      sDataRncIni:= ArrumaDataSQL(dtDataIni.Date);
   end;

   if dtDataFim.Text = '  /  /    ' then begin
      sDataRncFim:= EmptyStr
   end
   else begin
      sDataRncFim:= ArrumaDataSQL(dtDataFim.Date);
   end;

   if chkEmitido.Checked then begin
      iEmitido:= 0
   end
   else begin
      iEmitido:= dblEmitido.KeyValue;
   end;

   if chkMotivo.Checked then begin
      iMotivo:= 0
   end
   else begin
      iMotivo:= dblMotivo.KeyValue;
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

   if chkStatus.Checked then begin
      iStatus:= -1
   end
   else begin
      iStatus:= dblStatus.KeyValue;
   end;

   if chkCliente.Checked then begin
      iCliente:= -1
   end
   else begin
      iCliente:= dblClientes.KeyValue;
   end;

   if chkForn.Checked then begin
      sForn:= EmptyStr
   end
   else begin
      sForn:= dblForn.KeyValue;
   end;

   varWhere:= '';

   // Monta o select para os dados e gráfico
   if (sDataRncIni <> EmptyStr) and (sDataRncFim <> EmptyStr) then begin
      varWhere:= varWhere + ' AND rnc_data between ' + sDataRncIni + ' and ' + sDataRncFim;
   end;
   if iEmitido <> 0 then begin
      varWhere:= varWhere + ' AND rnc_emitido = ' + IntToStr(iEmitido);
   end;
   if iMotivo <> 0 then begin
      varWhere:= varWhere + ' AND rnc_motivo = ' + IntToStr(iMotivo);
   end;
   if iOrigem <> 0 then begin
      varWhere:= varWhere + ' AND rnc_origem = ' + IntToStr(iOrigem);
   end;
   if iProcesso <> 0 then begin
      varWhere:= varWhere + ' AND rnc_processo = ' + IntToStr(iProcesso);
   end;
   if iProcede <> -1 then begin
      varWhere:= varWhere + ' AND rnc_procede = ' + IntToStr(iProcede);
   end;
   if iRespons <> 0 then begin
      varWhere:= varWhere + ' AND rnc_responsavel = ' + IntToStr(iRespons);
   end;
   if iStatus <> -1 then begin
      varWhere:= varWhere + ' AND rnc_status = ' + IntToStr(iStatus);
   end;
   if iCliente <> -1 then begin
      varWhere:= varWhere + ' AND rnc_cliente = ' + IntToStr(iCliente);
   end;
   if sForn <> EmptyStr then begin
      varWhere:= varWhere + ' AND rnc_fornecedor = ' + QuotedStr(sForn);
   end;

   // Chamado TT651 - Criar filtro de pendente de resposta e pendente de aceite/recusa
   case rgFiltro.ItemIndex of
      1: begin // Pendente de Resposta
         varWhere:= varWhere + 'AND rnc_status = 1';
      end;
      2: begin // Pendente de Aceite/Recusa
         varWhere:= varWhere + 'AND rnc_status = 2';
      end;
   end;


   with cdsGrafico do begin
      Active:= False;
      CommandText:= ' SELECT rnc_motivo, valo_com, COUNT(*) as Qtd ' +
                    ' FROM rnc' +
                    ' INNER JOIN tabela_combos TC on TC.tipo_com = 32 and TC.codi_com = rnc_motivo' +
                    ' WHERE 1 = 1' + varWhere +
                    ' GROUP BY rnc_motivo, valo_com';
      Active:= True;
   end;

   with cdsGraficoStatus do begin
      Active:= False;
      CommandText:= ' SELECT rnc_status, valo_com, COUNT(*) as Qtd ' +
                    ' FROM rnc' +
                    ' INNER JOIN tabela_combos TC on TC.tipo_com = 35 and TC.codi_com = rnc_status' +
                    ' WHERE 1 = 1' + varWhere +
                    ' GROUP BY rnc_status, valo_com';
      Active:= True;
   end;

   with cdsRNC do begin
      Active:= False;
      CommandText:= ' SELECT * FROM rnc' +
                    ' WHERE 1 = 1' + varWhere +
                    ' ORDER BY rnc_identificacao DESC';
      Active:= True;
   end;

   if cdsRNC.IsEmpty then begin
      Application.MessageBox('Não foram encontrados registros com as opções especificadas','Aviso', MB_OK + MB_ICONINFORMATION);
      btnVisualizar.Enabled      := False;
      btnImprimir.Enabled        := False;
      btnImprimirCompleto.Enabled:= False;
   end
   else begin
      btnVisualizar.Enabled      := True;
      btnImprimir.Enabled        := True;
      btnImprimirCompleto.Enabled:= True;
   end;

   AtualizarGrid(dbgRNC);
end;

procedure TFormCadRNCConsulta.chkClienteClick(Sender: TObject);
begin
   dblClientes.Enabled:= not chkCliente.Checked;
end;

procedure TFormCadRNCConsulta.chkDataClick(Sender: TObject);
begin
   dtDataIni.Enabled:= not chkData.Checked;
   dtDataFim.Enabled:= not chkData.Checked;
end;

procedure TFormCadRNCConsulta.chkStatusClick(Sender: TObject);
begin
   dblStatus.Enabled:= not chkStatus.Checked;
end;

procedure TFormCadRNCConsulta.chkEmitidoClick(Sender: TObject);
begin
   dblEmitido.Enabled:= not chkEmitido.Checked;
end;

procedure TFormCadRNCConsulta.chkFornClick(Sender: TObject);
begin
   dblForn.Enabled:= not chkForn.Checked;
end;

procedure TFormCadRNCConsulta.chkOrigemClick(Sender: TObject);
begin
   dblOrigem.Enabled:= not chkOrigem.Checked;
end;

procedure TFormCadRNCConsulta.chkProcedeClick(Sender: TObject);
begin
   dblProcede.Enabled:= not chkProcede.Checked;
end;

procedure TFormCadRNCConsulta.chkProcessoClick(Sender: TObject);
begin
   dblProcessos.Enabled:= not chkProcesso.Checked;
end;

procedure TFormCadRNCConsulta.chkRespClick(Sender: TObject);
begin
   dblResponsavel.Enabled:= not chkResp.Checked;
end;

procedure TFormCadRNCConsulta.chkMotivoClick(Sender: TObject);
begin
   dblMotivo.Enabled:= not chkMotivo.Checked;
end;

procedure TFormCadRNCConsulta.dbgRNCDblClick(Sender: TObject);
begin
   btnVisualizarClick(Self);
end;

procedure TFormCadRNCConsulta.edtNumRNCChange(Sender: TObject);
begin
   if edtOrdemProd.Text = EmptyStr then begin
      cdsRNC.Filter:= 'rnc_identificacao LIKE ' + QuotedStr('%' + edtNumRNC.Text + '%');
   end
   else begin
      cdsRNC.Filter:= 'rnc_identificacao LIKE ' + QuotedStr('%' + edtNumRNC.Text + '%') + ' and ' +
                      'rnc_ordemprod LIKE ' + QuotedStr('%' + edtOrdemProd.Text + '%');
   end;
   cdsRNC.Filtered:= True;
end;

procedure TFormCadRNCConsulta.FormShow(Sender: TObject);
begin
   chkEmitido.Checked := True;
   chkData.Checked    := True;
   chkMotivo.Checked  := True;
   chkOrigem.Checked  := True;
   chkProcesso.Checked:= True;
   chkResp.Checked    := True;
   chkProcede.Checked := True;
   chkStatus.Checked  := True;
   chkCliente.Checked := True;
   chkForn.Checked    := True;

   AtualizarDados();
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;

   AdvChartView3DMotivos.Series[0].Items.Clear;
   AdvChartView3DMotivos.Series[0].Legend.Visible:= False;
   AdvChartView3DStatus.Series[0].Items.Clear;
   AdvChartView3DStatus.Series[0].Legend.Visible:= False;
end;

procedure TFormCadRNCConsulta.HabilitarCampos(Flag, Codigo: Boolean);
begin
   dtDataIni.Enabled     := Flag;
   dtDataFim.Enabled     := Flag;
   dblEmitido.Enabled    := Flag;
   dblMotivo.Enabled     := Flag;
   dblOrigem.Enabled     := Flag;
   dblProcessos.Enabled  := Flag;
   dblProcede.Enabled    := Flag;
   dblResponsavel.Enabled:= Flag;
   dblStatus.Enabled     := Flag;
end;

procedure TFormCadRNCConsulta.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   AtualizarDados();

   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'rnc_identificacao';
   end
   else begin
      sCampoOrdem:= 'rnc_data';
   end;

   if sTipoRel = 'L' then begin // Lista
      with cdsImprimir do begin
         Active:= False;
         CommandText:= ' SELECT rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, rnc_motivo,' +
                       ' rnc_processo, rnc_setor, rnc_origem, TC1.valo_com as Origem, rnc_cliente, ' +
                       ' CL.cli_nome, rnc_fornecedor, F.forn_nome, rnc_consumidor, rnc_nconformidade, ' +
                       ' rnc_procede, rnc_responsavel, C1.nome_col as Responsavel, ' +
                       ' rnc_departamento, rnc_relacionamento, rnc_representante,' +
                       ' C.nome_col as Emitido, TC.valo_com as Motivo, rnc_custo' +
                       ' FROM rnc R' +
                       ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_emitido' +
                       ' INNER JOIN colaboradores C1 ON C1.codi_col = R.rnc_responsavel' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = R.rnc_motivo' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 33 AND TC1.codi_com = R.rnc_origem' +
                       ' LEFT JOIN clientes CL on CL.cli_codigo = R.rnc_cliente' +
                       ' LEFT JOIN fornecedores F on F.forn_codigo = R.rnc_fornecedor' +
                       ' WHERE 1 = 1' + varWhere +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaRNCAbertura.fr3');

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

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_PMC_Completo.fr3');

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

      with dm.cdsAux2 do begin
         Active:= False;
         CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                       ' WHERE tipo_com = 28';
         Active:= True;
      end;
//      frxReport1.Variables['fase']:= QuotedStr(dblFase.Text);
      Auditoria('PMC LISTA COMPLETA','','R', '');
   end;
end;

procedure TFormCadRNCConsulta.InicializarGraf;
var
   i: Integer;
begin
   // Monta gráfico de Motivos de RNC
   with AdvChartView3DMotivos do begin
      BeginUpdate;
      InitSample;
      Title.Font.Size:= 8;
      Title.Text := 'Gráfico de Motivos de RNC';

   //   AdvChartView3DPMC.Series.Add; // Adiciona uma nova série

   //--------------Série 0------------
      Series[0].Caption:= 'Motivos de RNC'; // Título da Legenda
      Series[0].Size := 200;
      Series[0].Left := -40;
      Series[0].Top  := 0;
      Series[0].Depth:= 30; // Espessura da pizza
      Series[0].Values.ShowCaptions    := True;
      Series[0].Values.ShowValues      := True;
      Series[0].Values.ShowPercentages := True;
      Series[0].Values.ImageAspectRatio:= True;
      Series[0].Values.ImagePosition := ipCenterCenter;
   //   AdvChartView3DPMC.Series[0].Values.ImageHeight:= 20;
   //   AdvChartView3DPMC.Series[0].Values.ImageWidth := 10;
      Series[0].Values.ValuesFont.Size := 8;
      Series[0].Values.Fill.Color      := clWhite;
      Series[0].Values.Fill.EndColor   := clWhite;
      Series[0].Items.Clear;
      Series[0].Top:= -35; // Posição do gráfico
      Series[0].Legend.Position:= ipCenterLeft; // Posição da Legenda

      if cdsGrafico.RecordCount > 0 then begin
         with cdsGrafico do begin
            First;
            i:= 0;
            while not Eof do begin
               i:= i + 1;
               with Series[0].Items.Add do begin
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
         Series[0].Legend.Visible:= False;
         Series[0].Items[0].Extraction := 30;
      end;

      EndUpdate;
   end;

   // Monta gráfico de Status de RNC
   with AdvChartView3DStatus do begin
      BeginUpdate;
      InitSample;
      Title.Font.Size:= 8;
      Title.Text := 'Gráfico de Status de RNC';

   //   AdvChartView3DPMC.Series.Add; // Adiciona uma nova série

   //--------------Série 0------------
      Series[0].Caption:= 'Status de RNC'; // Título da Legenda
      Series[0].Size := 200;
      Series[0].Left := 0;
      Series[0].Top  := 0;
      Series[0].Depth:= 30; // Espessura da pizza
      Series[0].Values.ShowCaptions    := True;
      Series[0].Values.ShowValues      := True;
      Series[0].Values.ShowPercentages := True;
      Series[0].Values.ImageAspectRatio:= True;
      Series[0].Values.ImagePosition := ipCenterCenter;
   //   AdvChartView3DPMC.Series[0].Values.ImageHeight:= 20;
   //   AdvChartView3DPMC.Series[0].Values.ImageWidth := 10;
      Series[0].Values.ValuesFont.Size := 8;
      Series[0].Values.Fill.Color      := clWhite;
      Series[0].Values.Fill.EndColor   := clWhite;
      Series[0].Items.Clear;
      Series[0].Top:= -35; // Posição do gráfico
      Series[0].Legend.Position:= ipCenterLeft; // Posição da Legenda

      if cdsGrafico.RecordCount > 0 then begin
         with cdsGraficoStatus do begin
            First;
            i:= 0;
            while not Eof do begin
               i:= i + 1;
               with Series[0].Items.Add do begin
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
         Series[0].Legend.Visible:= False;
         Series[0].Items[0].Extraction := 30;
      end;

      EndUpdate;
   end;
end;

procedure TFormCadRNCConsulta.rgFiltroClick(Sender: TObject);
begin
   btnPesquisarClick(Self);
end;

end.
