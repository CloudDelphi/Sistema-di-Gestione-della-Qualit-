unit frm_CadPMCAcoesConsulta;

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
  TFormCadPMCAcoesConsulta = class(TForm)
    pnl1: TPanel;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnVisualizar: TBitBtn;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryAcoesPMC: TZQuery;
    dspAcoesPMC: TDataSetProvider;
    cdsAcoesPMC: TClientDataSet;
    dsAcoesPMC: TDataSource;
    frxDBDSImpAcoes: TfrxDBDataset;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    dspTipo: TDataSetProvider;
    zqryTipo: TZQuery;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    zqryEmitido: TZQuery;
    dspEmitido: TDataSetProvider;
    cdsEmitido: TClientDataSet;
    dsEmitido: TDataSource;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    zqryGrafico: TZQuery;
    dspGrafico: TDataSetProvider;
    cdsGrafico: TClientDataSet;
    frxDBGrafico: TfrxDBDataset;
    lbllb6: TLabel;
    lbllb2: TLabel;
    lbllb1: TLabel;
    lbl2: TLabel;
    AdvChartView3DPMC: TAdvChartView3D;
    dbg1: TDBGrid;
    dtDataIni: TDateEdit;
    dtDataFim: TDateEdit;
    dblResp: TDBLookupComboBox;
    chkResp: TCheckBox;
    chkTipo: TCheckBox;
    chkData: TCheckBox;
    dblTipo: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
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
    lblMsgFiltro: TLabel;
    edtNumPMC: TEdit;
    lbl5: TLabel;
    frxReport1: TfrxReport;
    rgOpcoes: TRadioGroup;
    cdsGraficoresponsavel: TWideMemoField;
    cdsGraficoqtde: TLargeintField;
    cdsAcoesPMCnume_pmc: TWideStringField;
    cdsAcoesPMCtipo: TWideStringField;
    cdsAcoesPMCaco_prazo: TDateTimeField;
    cdsAcoesPMCresponsavel: TWideStringField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirnume_pmc: TWideStringField;
    cdsImprimirdata_pmc: TDateTimeField;
    cdsImprimirtipo: TWideStringField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirresponsavel: TWideStringField;
    Imprimirdesc_aco: TWideMemoField;
    cdsImprimirresponsavelacao: TWideStringField;
    Imprimiraco_prazo: TDateTimeField;
    cdsAcoesPMCcodi_pmc: TLargeintField;
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
    procedure chkRespClick(Sender: TObject);
    procedure chkTipoClick(Sender: TObject);
    procedure CarregaValores();
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure InicializarGraf();
    procedure dbg1DblClick(Sender: TObject);
    procedure btnImprimirCompletoClick(Sender: TObject);
    procedure edtNumPMCChange(Sender: TObject);
    procedure cdsAcoesPMCresponsavelGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure rgOpcoesClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sWhereAcoes   : string;
    sWhereNumPMC  : string;

    sDataPmcIni: string;
    sDataPmcFim: string;
    iResp      : Integer;
    iTipo      : Integer;
    varWhere: string;
    sTipoRel: string;
  public
    { Public declarations }
  end;

var
  FormCadPMCAcoesConsulta: TFormCadPMCAcoesConsulta;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_CadPMCFecha;

{$R *.dfm}

procedure TFormCadPMCAcoesConsulta.AtualizarDados;
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
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;
end;

procedure TFormCadPMCAcoesConsulta.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPMCAcoesConsulta.btnImprimirClick(Sender: TObject);
begin
   sTipoRel:= 'L';
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormCadPMCAcoesConsulta.btnImprimirCompletoClick(Sender: TObject);
begin
   sTipoRel:= 'C'; // Completo
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormCadPMCAcoesConsulta.btnPesquisarClick(Sender: TObject);
begin
//   edtNumPMC.Clear;
//   cdsAcoesPMC.Filter:= '';
   CarregaValores();
   InicializarGraf();
end;

procedure TFormCadPMCAcoesConsulta.btnPrimeiroClick(Sender: TObject);
begin
   cdsAcoesPMC.First;
end;

procedure TFormCadPMCAcoesConsulta.btnVisualizarClick(Sender: TObject);
begin
   FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
   FormCadPMCFecha.sCodigoPMC:= cdsAcoesPMC.FieldByName('codi_pmc').AsString;
   FormCadPMCFecha.iTela:= 3;
   FormCadPMCFecha.ShowModal;
   FormCadPMCFecha.Release;
   FormCadPMCFecha.Free;
   FormCadPMCFecha:= nil;
end;

procedure TFormCadPMCAcoesConsulta.btnAnteriorClick(Sender: TObject);
begin
   cdsAcoesPMC.Prior;
end;

procedure TFormCadPMCAcoesConsulta.btnProximoClick(Sender: TObject);
begin
   cdsAcoesPMC.Next;
end;

procedure TFormCadPMCAcoesConsulta.btnUltimoClick(Sender: TObject);
begin
   cdsAcoesPMC.Last;
end;

procedure TFormCadPMCAcoesConsulta.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadPMCAcoesConsulta.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPMCAcoesConsulta.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPMCAcoesConsulta.CarregaValores;
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

   if chkResp.Checked then begin
      iResp:= 0;
   end
   else begin
      iResp:= dblResp.KeyValue;
   end;

   if chkTipo.Checked then begin
      iTipo:= 0;
   end
   else begin
      iTipo:= dblTipo.KeyValue;
   end;

   case rgOpcoes.ItemIndex of
      0: sWhereAcoes:= ' PA.aco_prazo <= ' + ArrumaDataSQL(Date()) + ' AND '; // Vencidas
      1: sWhereAcoes:= ' PA.aco_prazo > ' + ArrumaDataSQL(Date()) + ' AND '; // A vencer
      2: sWhereAcoes:= '';
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
   if (sDataPmcIni <> EmptyStr) and (sDataPmcFim <> EmptyStr) then begin
      if chkData.Checked = False then begin
         varWhere:= varWhere + ' AND PA.aco_prazo between ' + sDataPmcIni + ' and ' + sDataPmcFim;
      end;
   end;
   if iResp <> 0 then
      varWhere:= varWhere + ' AND resp_aco = ' + IntToStr(iResp);
   if iTipo <> 0 then
      varWhere:= varWhere + ' AND tipo_pmc = ' + IntToStr(iTipo);

   // Pesquisa o número do PMC para atualizar o gráfico
   if edtNumPMC.Text <> EmptyStr then begin
      sWhereNumPMC:= ' AND nume_pmc LIKE ' + QuotedStr('%' + edtNumPMC.Text + '%')
   end
   else begin
      sWhereNumPMC:= '';
   end;

   with cdsGrafico do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtde, ' +
                    ' SUBSTRING(C.nome_col, 1, POSITION(' + QuotedStr(' ') + ' in C.nome_col) - 1) as Responsavel' +
                    ' FROM pmc PM' +
                    ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                    ' INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco' +
                    ' WHERE ' + sWhereAcoes + ' PA.vimp_aco = ' + QuotedStr('') +
                    varWhere +
                    sWhereNumPMC +
                    ' GROUP BY C.nome_col' +
                    ' ORDER BY COUNT(*) DESC';
      Active:= True;
   end;

   with cdsAcoesPMC do begin
      Active:= False;
      CommandText:= ' SELECT PM.codi_pmc, nume_pmc, TC.valo_com as Tipo, aco_prazo,' +
                    ' C.nome_col as Responsavel' +
                    ' FROM pmc PM' +
                    ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                    ' INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 AND TC.codi_com = tipo_pmc' +
                    ' WHERE ' + sWhereAcoes + 'PA.vimp_aco = ' + QuotedStr('') +
                    varWhere +
                    ' ORDER BY nume_pmc DESC';
      Active:= True;
   end;

   if cdsAcoesPMC.IsEmpty then begin
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
end;

procedure TFormCadPMCAcoesConsulta.cdsAcoesPMCresponsavelGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAcoesPMC.FieldByName('Responsavel').AsString, 1, 50);
end;

procedure TFormCadPMCAcoesConsulta.chkDataClick(Sender: TObject);
begin
   dtDataIni.Enabled:= not chkData.Checked;
   dtDataFim.Enabled:= not chkData.Checked;
end;

procedure TFormCadPMCAcoesConsulta.chkRespClick(Sender: TObject);
begin
   dblResp.Enabled:= not chkResp.Checked;
end;

procedure TFormCadPMCAcoesConsulta.chkTipoClick(Sender: TObject);
begin
   dblTipo.Enabled:= not chkTipo.Checked;
end;

procedure TFormCadPMCAcoesConsulta.dbg1DblClick(Sender: TObject);
begin
   btnVisualizarClick(Self);
end;

procedure TFormCadPMCAcoesConsulta.edtNumPMCChange(Sender: TObject);
begin
   cdsAcoesPMC.Filter:= 'nume_pmc LIKE ' + QuotedStr('%' + edtNumPMC.Text + '%');
   cdsAcoesPMC.Filtered:= True;

   CarregaValores();
   InicializarGraf();
end;

procedure TFormCadPMCAcoesConsulta.FormShow(Sender: TObject);
begin
   chkResp.Checked:= True;
   chkData.Checked:= True;
   chkTipo.Checked:= True;
//   rgOpcoes.ItemIndex:= 0;

   AtualizarDados();
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   AdvChartView3DPMC.Series[0].Items.Clear;
   AdvChartView3DPMC.Series[0].Legend.Visible:= False;
   lblMsgFiltro.Visible:= False;
end;

procedure TFormCadPMCAcoesConsulta.HabilitarCampos(Flag, Codigo: Boolean);
begin
   dtDataIni.Enabled:= Flag;
   dtDataFim.Enabled:= Flag;
   dblResp.Enabled  := Flag;
   dblTipo.Enabled  := Flag;
end;

procedure TFormCadPMCAcoesConsulta.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sValorPeriodo   : string;
   sTituloRelatorio: string;
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
         CommandText:= ' SELECT PC.nome_pro as Processo, P.nume_pmc, ' +
                       ' P.data_pmc, TC.valo_com as Tipo, TC1.valo_com as Origem, C1.nome_col as Responsavel,' +
                       ' PA.desc_aco, C.nome_col as ResponsavelAcao, PA.aco_prazo' +
                       ' FROM pmc P' +
                       ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = P.codi_pmc' +
                       ' INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco' +
                       ' LEFT JOIN processos PC ON PC.codi_pro = P.prcs_pmc' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 and TC.codi_com = P.tipo_pmc' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 5 AND TC1.codi_com = orig_pmc' +
                       ' INNER JOIN colaboradores C1 ON C1.codi_col = resp_pmc' +
                       ' WHERE ' + sWhereAcoes + ' PA.vimp_aco = ' + QuotedStr('') +
                       varWhere +
                       ' ORDER BY PC.nome_pro, nume_pmc';

//         CommandText:= ' SELECT nume_pmc, TC.valo_com as Tipo, aco_prazo,' +
//                       ' C.nome_col as Responsavel' +
//                       ' FROM pmc PM' +
//                       ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
//                       ' INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco' +
//                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 AND TC.codi_com = tipo_pmc' +
//                       ' WHERE ' + sWhereAcoes + ' PA.vimp_aco = ' + QuotedStr('') +
//                       varWhere +
//                       ' ORDER BY nume_pmc DESC';
         Active:= True;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      case rgOpcoes.ItemIndex of
         0: begin
            sTituloRelatorio:= 'RELATÓRIO DE AÇÕES DE PMC VENCIDAS';
         end;
         1: begin
            sTituloRelatorio:= 'RELATÓRIO DE AÇÕES DE PMC A VENCER';
         end;
         2: begin
            sTituloRelatorio:= 'RELATÓRIO DE AÇÕES DE PMC (TODAS)';
         end;
      end;

      if chkData.Checked = True then begin
         sValorPeriodo:= 'TODOS';
      end
      else begin
         sValorPeriodo:= dtDataIni.Text + ' a ' + dtDataFim.Text;
      end;

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_GraficoPMCAcoesLista.fr3');
         Variables['periodo']:= QuotedStr(sValorPeriodo);
         Variables['titulo'] := QuotedStr(sTituloRelatorio);

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

      Auditoria('CONSULTA AÇÕES DE PMC','','R', '');
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

procedure TFormCadPMCAcoesConsulta.InicializarGraf;
var
   i: Integer;
begin
   AdvChartView3DPMC.BeginUpdate;
   AdvChartView3DPMC.InitSample;
   AdvChartView3DPMC.Title.Font.Size:= 8;
   AdvChartView3DPMC.Title.Text := 'Gráfico Ações por Responsável';

//   AdvChartView3DPMC.Series.Add; // Adiciona uma nova série

//--------------Série 0------------
   AdvChartView3DPMC.Series[0].Caption:= 'Responsável Ação'; // Título da Legenda
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
               Caption:= FieldByName('Responsavel').AsString;
               Value  := FieldByName('Qtde').AsInteger;
               Color  := RGB(Random(255), Random(255), Random(255));
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

procedure TFormCadPMCAcoesConsulta.rgOpcoesClick(Sender: TObject);
begin
   CarregaValores();
   InicializarGraf();
end;

end.
