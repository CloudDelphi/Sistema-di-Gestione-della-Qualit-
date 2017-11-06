unit frm_GraficoPMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtrls, SHDocVw, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, AdvOpenGLControl,
  AdvChartView3D, AdvChartView, StdCtrls, ExtCtrls, ExtDlgs, ShellAPI,
  AdvChartGDIP, AdvChart, AdvChartViewGDIP, DBAdvChartViewGDIP, Grids, DBGrids,
  DBTables, AdvChartTypeSelector, Printers, JvgPage, DBCtrls, frxClass, frxDBSet,
  Mask, rxToolEdit;

type
  TFormGraficoPMC = class(TForm)
    spdSalvar: TSavePictureDialog;
    pnl2: TPanel;
    btnSair: TBitBtn;
    zqryImpRNCAberto: TZQuery;
    dspImpRNCAberto: TDataSetProvider;
    dlgPntSet1: TPrinterSetupDialog;
    btnImprimir: TBitBtn;
    zqryPMCsemCausa: TZQuery;
    dspPMCsemCausa: TDataSetProvider;
    cdsPMCsemCausa: TClientDataSet;
    dsPMCsemCausa: TDataSource;
    pctGraficos: TJvgPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    DBAdvGDIPChartView1: TDBAdvGDIPChartView;
    cdsPMCsemCausaprocesso: TWideStringField;
    cdsPMCsemCausaqtde: TLargeintField;
    pnlRelatorio: TPanel;
    lblTreinamento: TLabel;
    chkTodosTreinamentoTre: TCheckBox;
    dblTreinamento: TDBLookupComboBox;
    pnl5: TPanel;
    sbSairTre: TSpeedButton;
    btnVideoTre: TBitBtn;
    btnImpressoraTre: TBitBtn;
    pnlTituloRel: TPanel;
    frxReport1: TfrxReport;
    frxDBDSRelatorio: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnlFiltro: TPanel;
    lbllb6: TLabel;
    lbl2: TLabel;
    dtDataIni: TDateEdit;
    dtDataFim: TDateEdit;
    chkTodosData: TCheckBox;
    btnAtualizar: TBitBtn;
    cdsImprimirnume_pmc: TWideStringField;
    cdsImprimirdata_pmc: TDateTimeField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirresponsavel: TWideStringField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirtipo: TWideStringField;
    tsAcoesVencidasPMC: TTabSheet;
    DBAdvGDIPChartView2: TDBAdvGDIPChartView;
    zqryPMCsemAcao: TZQuery;
    dspPMCsemAcao: TDataSetProvider;
    cdsPMCsemAcao: TClientDataSet;
    dsPMCsemAcao: TDataSource;
    cdsPMCsemAcaoprocesso: TWideStringField;
    cdsPMCsemAcaoqtde: TLargeintField;
    frxDBDSImpAcoes: TfrxDBDataset;
    zqryImprimirAcoes: TZQuery;
    dspImprimirAcoes: TDataSetProvider;
    cdsImprimirAcoes: TClientDataSet;
    cdsImprimirAcoesprocesso: TWideStringField;
    cdsImprimirAcoesdata_pmc: TDateTimeField;
    cdsImprimirAcoesnume_pmc: TWideStringField;
    cdsImprimirAcoesorigem: TWideStringField;
    cdsImprimirAcoestipo: TWideStringField;
    DBAdvGDIPChartView3: TDBAdvGDIPChartView;
    zqryAcoesPMCVenc: TZQuery;
    dspAcoesPMCVenc: TDataSetProvider;
    cdsAcoesPMCVenc: TClientDataSet;
    cds2: TWideStringField;
    cds3: TLargeintField;
    dsAcoesPMCVenc: TDataSource;
    cdsImprimirAcoesresponsavel: TWideStringField;
    cdsImprimirAcoesdesc_aco: TWideMemoField;
    cdsImprimirAcoesresponsavelacao: TWideStringField;
    cdsImprimirAcoesaco_prazo: TDateTimeField;
    rgTipoGrafico: TRadioGroup;
    rgOpcoes: TRadioGroup;
    ts3: TTabSheet;
    DBAdvGDIPChartView4: TDBAdvGDIPChartView;
    zqryAcoesResp: TZQuery;
    dspAcoesResp: TDataSetProvider;
    cdsAcoesResp: TClientDataSet;
    dsAcoesResp: TDataSource;
    cdsAcoesRespresponsavel: TWideMemoField;
    cdsAcoesRespqtde: TLargeintField;
    zqryAcoesGeral: TZQuery;
    dspAcoesGeral: TDataSetProvider;
    cdsAcoesGeral: TClientDataSet;
    dsAcoesGeral: TDataSource;
    cdsAcoesGeralcodi_pro: TLargeintField;
    cdsAcoesGeralprocesso: TWideStringField;
    cdsAcoesGeralaberto: TLargeintField;
    cdsAcoesGeralvencido: TLargeintField;
    cdsAcoesGeralfechado: TLargeintField;
    ts4: TTabSheet;
    DBAdvGDIPChartView5: TDBAdvGDIPChartView;
    zqryRNCAberto: TZQuery;
    dspRNCAberto: TDataSetProvider;
    cdsRNCAberto: TClientDataSet;
    dsRNCAberto: TDataSource;
    cdsRNCAbertoprocesso: TWideStringField;
    cdsRNCAbertoqtde: TLargeintField;
    cdsImpRNCAberto: TClientDataSet;
    cdsImpRNCAbertoprocesso: TWideStringField;
    cdsImpRNCAbertornc_identificacao: TWideStringField;
    cdsImpRNCAbertornc_data: TDateTimeField;
    cdsImpRNCAbertornc_status: TIntegerField;
    frxDBDSRNCAberto: TfrxDBDataset;
    cdsImpRNCAbertornc_setor: TWideStringField;
    ts5: TTabSheet;
    DBAdvGDIPChartView6: TDBAdvGDIPChartView;
    zqryRNCFinalizar: TZQuery;
    dspRNCFinalizar: TDataSetProvider;
    cdsRNCFinalizar: TClientDataSet;
    cds4: TWideStringField;
    cds5: TLargeintField;
    dsRNCFinalizar: TDataSource;
    ts6: TTabSheet;
    DBAdvGDIPChartView7: TDBAdvGDIPChartView;
    zqryRNCMotivo: TZQuery;
    dspRNCMotivo: TDataSetProvider;
    cdsRNCMotivo: TClientDataSet;
    dsRNCMotivo: TDataSource;
    cdsRNCMotivomotivo: TWideStringField;
    cdsRNCMotivoqtde: TLargeintField;
    ts7: TTabSheet;
    zqryRNCProcesso: TZQuery;
    dspRNCProcesso: TDataSetProvider;
    cdsRNCProcesso: TClientDataSet;
    dsRNCProcesso: TDataSource;
    DBAdvGDIPChartView8: TDBAdvGDIPChartView;
    cdsRNCProcessoprocesso: TWideStringField;
    cdsRNCProcessoqtde: TLargeintField;
    cdsImpRNCAbertoemissor: TWideStringField;
    procedure Inicializar();
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AtualizarDados();
    procedure AdvChartTypeSelector1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoTreClick(Sender: TObject);
    procedure btnImpressoraTreClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure btnAtualizarClick(Sender: TObject);
    procedure sbSairTreClick(Sender: TObject);
    procedure chkTodosDataClick(Sender: TObject);
    procedure pctGraficosChange(Sender: TObject);
    procedure rgTipoGraficoClick(Sender: TObject);
  private
    { Private declarations }
    sWhere: string;
  public
    { Public declarations }
    NumeroDeSeries: Integer;
    Titulo: string;
  end;

var
  FormGraficoPMC: TFormGraficoPMC;

implementation

uses frm_CadRiscoAnaliseRisco, Funcoes, frm_ValoresIndicador;

{$R *.dfm}

procedure TFormGraficoPMC.AdvChartTypeSelector1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   (Sender as TAdvChartTypeSelector).Selected:= true;
   DBAdvGDIPChartView1.Panes[0].Series[0].ChartType := (Sender as TAdvChartTypeSelector).ChartType;
end;

procedure TFormGraficoPMC.AtualizarDados;
var
   sDataPmcIni, sDataPmcFim: string;
   sWhereAcoes: string;
begin
   sDataPmcIni:= ArrumaDataSQL(dtDataIni.Date);
   sDataPmcFim:= ArrumaDataSQL(dtDataFim.Date);

   sWhere:= '';
   if chkTodosData.Checked = False then begin
      case pctGraficos.TabIndex of
         0..1: sWhere:= sWhere + ' AND data_pmc between ' + sDataPmcIni + ' and ' + sDataPmcFim;
         2   : sWhere:= sWhere + ' AND aco_prazo between ' + sDataPmcIni + ' and ' + sDataPmcFim;
         3..6: sWhere:= sWhere + ' AND rnc_data between ' + sDataPmcIni + ' and ' + sDataPmcFim;
      end;
   end;

   case pctGraficos.TabIndex of
      0: begin // PMC sem análise de causa
         with cdsPMCsemCausa do begin
            Active:= False;
            CommandText:= ' SELECT CASE WHEN P.pro_nome_abreviado = ' + QuotedStr('') +
                          '                  OR P.pro_nome_abreviado isnull' +
                          '      THEN P.nome_pro' +
                          '      ELSE P.pro_nome_abreviado' +
                          ' END as Processo, ' +
                          ' COUNT(*) as Qtde' +
                          ' FROM pmc' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' WHERE (caus_pmc isnull OR caus_pmc = ' + QuotedStr('') + ')' +
                          sWhere +
                          ' GROUP BY P.nome_pro, P.pro_nome_abreviado' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      1: begin // PMC sem ação
         with cdsPMCsemAcao do begin
            Active:= False;
            CommandText:= ' SELECT CASE WHEN P.pro_nome_abreviado = ' + QuotedStr('') +
                          '                  OR P.pro_nome_abreviado isnull' +
                          '      THEN P.nome_pro' +
                          '      ELSE P.pro_nome_abreviado' +
                          ' END as Processo, ' +
                          ' COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 28 AND codi_com = pmc_fase' +
                          ' WHERE (SELECT COUNT(*) FROM pmc_acoes WHERE codi_pmc = PM.codi_pmc) = 0' +
                          sWhere +
                          ' GROUP BY P.nome_pro, P.pro_nome_abreviado' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      2: begin // Ações de PMC vencidas/a vencer
         with cdsAcoesPMCVenc do begin
            case rgOpcoes.ItemIndex of
               0: sWhereAcoes:= ' PA.aco_prazo <= ' + ArrumaDataSQL(Date()) + ' AND '; // Vencidas
               1: sWhereAcoes:= ' PA.aco_prazo > ' + ArrumaDataSQL(Date()) + ' AND '; // A vencer
               2: sWhereAcoes:= '';
            end;
            Active:= False;
            CommandText:= ' SELECT CASE WHEN P.pro_nome_abreviado = ' + QuotedStr('') +
                          '                  OR P.pro_nome_abreviado isnull' +
                          '      THEN P.nome_pro' +
                          '      ELSE P.pro_nome_abreviado' +
                          ' END as Processo, ' +
                          ' COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' WHERE ' + sWhereAcoes + ' PA.vimp_aco = ' + QuotedStr('') +
                          sWhere +
                          ' GROUP BY P.nome_pro, P.pro_nome_abreviado' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      3: begin // RNC aguardando resposta/disposição Status ABERTO
         with cdsRNCAberto do begin
            Active:= False;
            CommandText:= ' SELECT CASE WHEN P.pro_nome_abreviado = ' + QuotedStr('') +
                          '                  OR P.pro_nome_abreviado isnull' +
                          '      THEN P.nome_pro' +
                          '      ELSE P.pro_nome_abreviado' +
                          ' END as Processo, ' +
                          ' COUNT(*) as Qtde' +
                          ' FROM rnc R' +
                          ' LEFT JOIN processos P ON P.codi_pro = R.rnc_processo' +
                          ' WHERE rnc_status = 1' + // Status ABERTO
                          sWhere +
                          ' GROUP BY P.nome_pro, P.pro_nome_abreviado' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      4: begin // RNC Status RESPONDIDO
         with cdsRNCFinalizar do begin
            Active:= False;
            CommandText:= ' SELECT CASE WHEN P.pro_nome_abreviado = ' + QuotedStr('') +
                          '                  OR P.pro_nome_abreviado isnull' +
                          '      THEN P.nome_pro' +
                          '      ELSE P.pro_nome_abreviado' +
                          ' END as Processo, ' +
                          ' COUNT(*) as Qtde' +
                          ' FROM rnc R' +
                          ' LEFT JOIN processos P ON P.codi_pro = R.rnc_processo' +
                          ' WHERE rnc_status = 2' + // Status RESPONDIDO
                          sWhere +
                          ' GROUP BY P.nome_pro, P.pro_nome_abreviado' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      5: begin
         with cdsRNCMotivo do begin
            Active:= False;
            CommandText:= ' SELECT TC.valo_com as Motivo,' +
                          ' COUNT(*) AS Qtde' +
                          ' FROM rnc R' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = rnc_motivo' +
                          ' WHERE 1 = 1' +
                          sWhere +
                          ' GROUP BY TC.valo_com' +
                          ' ORDER BY COUNT(*) DESC' +
                          ' LIMIT 10';
            Active:= True;
         end;
      end;
      6: begin
         with cdsRNCProcesso do begin
            Active:= False;
            CommandText:= ' SELECT CASE WHEN P.pro_nome_abreviado = ' + QuotedStr('') +
                          '                  OR P.pro_nome_abreviado isnull' +
                          '      THEN P.nome_pro' +
                          '      ELSE P.pro_nome_abreviado' +
                          ' END as Processo, ' +
                          ' COUNT(*) AS Qtde' +
                          ' FROM rnc R' +
                          ' LEFT JOIN processos P ON P.codi_pro = R.rnc_processo' +
                          ' WHERE 1 = 1' +
                          sWhere +
                          ' GROUP BY P.nome_pro, P.pro_nome_abreviado' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      7: begin
         with cdsAcoesGeral do begin
            Active:= False;
            CommandText:= ' SELECT codi_pro,' +
                          ' CASE WHEN pro_nome_abreviado = ' + QuotedStr('') +
                          '        OR pro_nome_abreviado isnull' +
                          '        THEN nome_pro' +
                          '        ELSE pro_nome_abreviado' +
                          ' END as Processo,' +
                          ' (SELECT COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' WHERE PA.vimp_aco = ' + QuotedStr('') + ' AND PA.aco_prazo > ' + ArrumaDataSQL(Date()) +
                          ' AND prcs_pmc = codi_pro) AS Aberto,' +
                          ' (SELECT COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' WHERE PA.vimp_aco = ' + QuotedStr('') + ' AND PA.aco_prazo <= ' + ArrumaDataSQL(Date()) +
                          ' AND prcs_pmc = codi_pro) AS Vencido,' +
                          ' (SELECT COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' WHERE PA.vimp_aco <> ' + QuotedStr('') +
                          ' AND prcs_pmc = codi_pro) AS Fechado' +
                          ' FROM processos' +
                          ' WHERE codi_pro < 96 AND ' +
                          ' (SELECT COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' WHERE PA.vimp_aco = ' + QuotedStr('') + ' AND PA.aco_prazo <= ' + ArrumaDataSQL(Date()) +
                          ' AND prcs_pmc = codi_pro) + ' +
                          ' (SELECT COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' WHERE PA.vimp_aco = ' + QuotedStr('') + ' AND PA.aco_prazo <= ' + ArrumaDataSQL(Date()) +
                          ' AND prcs_pmc = codi_pro) +' +
                          ' (SELECT COUNT(*) as Qtde' +
                          ' FROM pmc PM' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                          ' WHERE PA.vimp_aco <> ' + QuotedStr('') +
                          ' AND prcs_pmc = codi_pro) > 0' +
                          ' ORDER BY fechado DESC';
            Active:= True;
         end;
      end;
   end;
end;

procedure TFormGraficoPMC.btnImpressoraTreClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormGraficoPMC.btnImprimirClick(Sender: TObject);
var
   bmp: TBitmap;
begin
   pnlTituloRel.Caption:= 'Imprimir - ' + pctGraficos.Pages[pctGraficos.TabIndex].Caption;
   AbrePanel(pnlRelatorio, Self);

//   if dlgPntSet1.Execute then begin
//      bmp       := TBitmap.Create;
//      bmp.Width := DBAdvGDIPChartView1.Width;
//      bmp.Height:= DBAdvGDIPChartView1.Height;
//
//      DBAdvGDIPChartView2.PrintPane(0, bmp.Canvas, Bounds(0, 0, DBAdvGDIPChartView2.Width - 150, DBAdvGDIPChartView2.Height));
//      DBAdvGDIPChartView1.PrintPane(0, bmp.Canvas, Bounds(DBAdvGDIPChartView2.Width - 150, 0, DBAdvGDIPChartView1.Width - 160, DBAdvGDIPChartView1.Height));
////      DBAdvGDIPChartView1.PrintPane(0, bmp.Canvas, Bounds(0, 0, bmp.Width, bmp.Height));
//
//      Printer.Orientation := poLandscape;
//
//      Printer.BeginDoc;
//      Printer.Canvas.StretchDraw(Bounds(0, 0, Printer.PageWidth, Printer.PageHeight), bmp);
//      Printer.EndDoc;
//      bmp.Free;
//   end;
end;

procedure TFormGraficoPMC.btnAtualizarClick(Sender: TObject);
begin
   if chkTodosData.Checked = False then begin
      if dtDataIni.Text <> '  /  /    ' then begin
         try
            StrToDate(dtDataIni.Text);
         except
            Application.MessageBox('Data Inicial inválida', 'Aviso', MB_OK + MB_ICONWARNING);
            dtDataIni.SetFocus;
            Exit;
         end;
      end
      else begin
         Application.MessageBox('Digite a Data Inicial', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataIni.SetFocus;
         Exit;
      end;

      if dtDataFim.Text <> '  /  /    ' then begin
         try
            StrToDate(dtDataFim.Text);
         except
            Application.MessageBox('Data Final inválida', 'Aviso', MB_OK + MB_ICONWARNING);
            dtDataFim.SetFocus;
            Exit;
         end;
      end
      else begin
         Application.MessageBox('Digite a Data Final', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataFim.SetFocus;
         Exit;
      end;
   end;

   AtualizarDados();
   Inicializar();

   AtualizarDados();
   Inicializar();
end;

procedure TFormGraficoPMC.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormGraficoPMC.btnVideoTreClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormGraficoPMC.chkTodosDataClick(Sender: TObject);
begin
   dtDataIni.Enabled:= not chkTodosData.Checked;
   dtDataFim.Enabled:= not chkTodosData.Checked;
end;

procedure TFormGraficoPMC.FormShow(Sender: TObject);
begin
   chkTodosData.Checked   := True;
   rgTipoGrafico.ItemIndex:= 0;
   rgOpcoes.ItemIndex     := 0;
   pctGraficos.TabIndex   := 0;
   AtualizarDados();
   Inicializar();
//   pctGraficos.Pages[7].TabVisible:= False;
end;

procedure TFormGraficoPMC.Inicializar;
var
   c1, c2, c3, c4, c5, c6, c7, c8: TColor;
   I, K: Integer;
   serie: TChartSerie;
begin
   // Gráfico de PMC aguardando Análise de Causa
   with DBAdvGDIPChartView1.Panes[0] do begin
      YAxis.AutoUnits:= False; // Ajusta a escala do eixo Y automaticamente
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsPMCsemCausa.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de PMC sem Plano de Ação
   with DBAdvGDIPChartView2.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= False; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsPMCsemAcao.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de Ações de PMC vencidas
   with DBAdvGDIPChartView3.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= False; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsAcoesPMCVenc.FieldByName('Qtde').AsInteger + 1;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de Ações em Andamento, Atrasadas e Concluídas
   with DBAdvGDIPChartView4.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      for i:= 0 to 2 do begin
         // Ajusta a grid de valores do eixo Y
         Series[i].ChartType:= ctStackedBar;
         Series[i].AutoRange:= arDisabled;
         Series[i].Maximum:= cdsAcoesGeral.FieldByName('Fechado').AsInteger + 3;
         Series[i].ValueFormat:= '###0'; // Formato do valor do gráfico
         Series[i].ValueOffsetY:= 0;
         Series[i].ValueOffsetX:= 0;
//         Series[i].ShowValue:= True; // Mostra valores na barra
         Series[i].ShowValueInTracker:= False;
         Series[i].ValueFormatType:= vftFloat;
         Series[i].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
      end;
   end;

   // Gráfico de RNC Aguardando Resposta/Disposição
   with DBAdvGDIPChartView5.Panes[0] do begin
      XAxis.Size     := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsRNCAberto.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de RNC a Finalizar (Aceite/Recusa)
   with DBAdvGDIPChartView6.Panes[0] do begin
      XAxis.Size     := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsRNCFinalizar.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de RNC por Motivo
   with DBAdvGDIPChartView7.Panes[0] do begin
      XAxis.Size     := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsRNCMotivo.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de RNC por Processo
   with DBAdvGDIPChartView8.Panes[0] do begin
      XAxis.Size     := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsRNCProcesso.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

//   DBAdvGDIPChartView4.SerieByName['Aberto'].AddMultiPoints(Random(50), Random(50), Random(50), Random(50));

   case rgTipoGrafico.ItemIndex of
      0: begin
         DBAdvGDIPChartView2.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView3.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView1.Panes[0].Series[0].ChartType:= ctBar;
//         DBAdvGDIPChartView4.SerieByName['Aberto'].ChartType:= ctBar;
         DBAdvGDIPChartView5.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView6.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView7.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView8.Panes[0].Series[0].ChartType:= ctBar;

         // Cor azul para as barras
         DBAdvGDIPChartView2.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView3.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView1.Panes[0].Series[0].Color      := $00FF6633;
//         DBAdvGDIPChartView4.SerieByName['Aberto'].Color:= $00FF6633;
         DBAdvGDIPChartView5.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView6.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView7.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView8.Panes[0].Series[0].Color      := $00FF6633;

//         DBAdvGDIPChartView2.SerieByName['Causa'].ColorTo    := clNone;
//         DBAdvGDIPChartView1.SerieByName['Acoes'].ColorTo    := clNone;
//         DBAdvGDIPChartView3.SerieByName['AcoesVenc'].ColorTo:= clNone;
////         DBAdvGDIPChartView4.SerieByName['Aberto'].ColorTo:= clNone;
//         DBAdvGDIPChartView5.Panes[0].Series[0].ColorTo      := clNone;
//         DBAdvGDIPChartView6.Panes[0].Series[0].ColorTo      := clNone;
//         DBAdvGDIPChartView7.Panes[0].Series[0].ColorTo      := clNone;
//         DBAdvGDIPChartView8.Panes[0].Series[0].ColorTo      := clNone;
      end;
      1: begin
         DBAdvGDIPChartView2.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView1.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView3.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView5.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView6.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView7.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView8.Panes[0].Series[0].ChartType:= ctPie;

         DBAdvGDIPChartView2.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView1.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView3.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));
//         DBAdvGDIPChartView4.SerieByName['Aberto'].Color:= RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView5.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView6.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView7.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView8.Panes[0].Series[0].Color      := RGB(Random(255), Random(255), Random(255));

//         DBAdvGDIPChartView2.SerieByName['Causa'].ColorTo    := RGB(Random(255), Random(255), Random(255));
//         DBAdvGDIPChartView1.SerieByName['Acoes'].ColorTo    := RGB(Random(255), Random(255), Random(255));
//         DBAdvGDIPChartView3.SerieByName['AcoesVenc'].ColorTo:= RGB(Random(255), Random(255), Random(255));
////         DBAdvGDIPChartView4.SerieByName['Aberto'].ColorTo:= RGB(Random(255), Random(255), Random(255));
//         DBAdvGDIPChartView5.Panes[0].Series[0].ColorTo      := RGB(Random(255), Random(255), Random(255));
//         DBAdvGDIPChartView6.Panes[0].Series[0].ColorTo      := RGB(Random(255), Random(255), Random(255));
      end;
   end;

   // teste de gráfico
//   AdvGDIPChartView1.BeginUpdate;
//   AdvGDIPChartView1.InitSample;
//   AdvGDIPChartView1.Title.Font.Size:= 8;
//   AdvGDIPChartView1.Title.Text := 'Gráfico Tipo de PMC';

//   AdvChartView3DPMC.Series.Add; // Adiciona uma nova série

//--------------Série 0------------
//   AdvGDIPChartView1.Panes[0].Series[0].AddMultiPoints(10, 20, 30, 50);
//   AdvGDIPChartView1.BeginUpdate;
//   AdvGDIPChartView1.InitSample;
//   AdvGDIPChartView1.Panes[0].Series.Add;
//   AdvGDIPChartView1.Panes[0].Legend.Left:= 0;
//   AdvGDIPChartView1.Panes[0].Legend.Top := -80;
//   AdvGDIPChartView1.Panes[0].Title.Size := 80;
//   AdvGDIPChartView1.Panes[0].Title.Text := 'Ações em Andamento, Atrasadas e Concluídas';
////   AdvGDIPChartView1.Panes[0].Title.Font
//
//   for i:= 0 to 2 do begin // Vertical
//      serie:= AdvGDIPChartView1.Panes[0].Series[i];
//      serie.ChartType        := ctStackedBar;
//      serie.AutoRange        := arCommonZeroBased;
//      serie.XAxis.Visible    := i = 0;
//      serie.YAxis.Visible    := i = 0;
//      serie.Marker.MarkerType:= mNone;
////      serie.ValueWidth       := 100;
//      serie.ClearPoints;
//      for K:= 0 to 8 do begin // Horizontal  cdsAcoesGeral.RecordCount
//         case i of
//            0: serie.AddSinglePoint(cdsAcoesGeral.FieldByName('aberto').AsInteger);
//            1: serie.AddSinglePoint(cdsAcoesGeral.FieldByName('fechado').AsInteger);
//            2: serie.AddSinglePoint(cdsAcoesGeral.FieldByName('vencido').AsInteger);
//         end;
//      end;
//   end;
//
//   AdvGDIPChartView1.EndUpdate;
end;

procedure TFormGraficoPMC.pctGraficosChange(Sender: TObject);
begin
   // Opções Ações
   case pctGraficos.TabIndex of
      0..1: begin
         rgOpcoes.Visible:= False;
      end;
      2: begin
         rgOpcoes.Visible:= True;
      end;
      3..7: begin
         rgOpcoes.Visible:= False;
      end;
   end;

   // Tipo do gráfico
   case pctGraficos.TabIndex of
      0..6: begin
         rgTipoGrafico.Visible:= True;
      end;
      7: begin
         rgTipoGrafico.Visible:= False;
      end;
   end;

   btnAtualizarClick(Self);
end;

procedure TFormGraficoPMC.rgTipoGraficoClick(Sender: TObject);
begin
   btnAtualizarClick(Self);

   case rgOpcoes.ItemIndex of
      0: DBAdvGDIPChartView3.Panes[0].Title.Text:= 'Ações de PMC vencidas';
      1: DBAdvGDIPChartView3.Panes[0].Title.Text:= 'Ações de PMC a vencer';
      2: DBAdvGDIPChartView3.Panes[0].Title.Text:= 'Todas as Ações de PMC';
   end;

end;

procedure TFormGraficoPMC.sbSairTreClick(Sender: TObject);
begin
   pnlRelatorio.Visible:= False;
end;

procedure TFormGraficoPMC.Impressao(tipoImp: string);
var
   sCampoOrdem     : string;
   sNomeRelatorio  : string;
   sValorPeriodo   : string;
   sTituloRelatorio: string;
   sWhereAcoes     : string;
   sNomeGrupo      : string;
   sTituloColResp  : string;
begin
   sNomeGrupo:= 'Processo: ';
   sCampoOrdem:= 'P.pro_nome_abreviado, nume_pmc';
   case pctGraficos.TabIndex of
      0..1: sNomeRelatorio:= 'rel_GraficoPMC';
      2   : sNomeRelatorio:= 'rel_GraficoPMCAcoesLista';
      3..6: sNomeRelatorio:= 'rel_RNC_Grafico';
   end;

   with cdsImprimir do begin
      Active:= False;
      case pctGraficos.TabIndex of
         0: begin
            sTituloRelatorio:= 'RELATÓRIO DE PMC SEM PREENCHIMENTO DE CAUSA';
            CommandText:= ' SELECT nume_pmc, data_pmc, P.pro_nome_abreviado as Processo, C.nome_col as Responsavel,' +
                          ' TC.valo_com as Origem, TC1.valo_com as Tipo' +
                          ' FROM pmc' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' INNER JOIN colaboradores C ON C.codi_col = resp_pmc' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 5 AND TC.codi_com = orig_pmc' +
                          ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 4 AND TC1.codi_com = tipo_pmc' +
                          ' WHERE (caus_pmc isnull OR caus_pmc = ' + QuotedStr('') + ')' +
                          sWhere +
                          ' ORDER BY ' + sCampoOrdem;
         end;
         1: begin
            sTituloRelatorio:= 'RELATÓRIO DE PMC SEM PLANO DE AÇÃO';
            CommandText:= ' SELECT nume_pmc, data_pmc, P.pro_nome_abreviado as Processo, C.nome_col as Responsavel,' +
                          ' TC.valo_com as Origem, TC1.valo_com as Tipo' +
                          ' FROM pmc PM' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' INNER JOIN colaboradores C ON C.codi_col = resp_pmc' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 5 AND TC.codi_com = orig_pmc' +
                          ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 4 AND TC1.codi_com = tipo_pmc' +
                          ' WHERE (SELECT COUNT(*) FROM pmc_acoes WHERE codi_pmc = PM.codi_pmc) = 0' +
                          sWhere +
                          ' ORDER BY ' + sCampoOrdem;
         end;
      end;
      Active:= True;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   with cdsImprimirAcoes do begin
      Active:= False;
      case pctGraficos.TabIndex of
         2: begin // Ações de PMC vencidas/ a vencer
            case rgOpcoes.ItemIndex of
               0: begin
                  sTituloRelatorio:= 'RELATÓRIO DE AÇÕES DE PMC VENCIDAS';
                  sWhereAcoes:= ' PA.aco_prazo <= ' + ArrumaDataSQL(Date()) + ' AND '; // Vencidas
               end;
               1: begin
                  sTituloRelatorio:= 'RELATÓRIO DE AÇÕES DE PMC A VENCER';
                  sWhereAcoes:= ' PA.aco_prazo > ' + ArrumaDataSQL(Date()) + ' AND '; // A vencer
               end;
               2: begin
                  sTituloRelatorio:= 'RELATÓRIO DE AÇÕES DE PMC (TODAS)';
                  sWhereAcoes:= '';
               end;
            end;

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
                          sWhere +
                          ' ORDER BY PC.nome_pro, nume_pmc';
         end;
      end;
      Active:= True;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   with cdsImpRNCAberto do begin
      sTituloColResp:= 'Responsável';
      Active:= False;
      case pctGraficos.TabIndex of
         3: begin // RNC Staus ABERTO
            sTituloRelatorio:= 'RELATÓRIO DE RNC AGUARDANDO RESPOSTA/DISPOSIÇÃO';
            CommandText:= ' SELECT P.nome_pro as Processo,' +                                   // **Responsavel
                          ' rnc_identificacao, rnc_data, rnc_status, C.nome_col as Emissor, ' + // Mantido Emissor
                          ' rnc_setor' +                                                        // para aproveitar
                          ' FROM rnc R' +                                                       // o relatório
                          ' INNER JOIN processos P ON P.codi_pro = R.rnc_processo' +
                          ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_responsavel' + //**
                          ' WHERE rnc_status = 1' + // Status ABERTO
                          sWhere +
                          ' ORDER BY P.nome_pro, rnc_data';
         end;
         4: begin // RNC Status RESPONDIDO
            sTituloRelatorio:= 'RELATÓRIO DE RNC A FINALIZAR (ACEITE/RECUSA)';
            sTituloColResp:= 'Emissor';
            CommandText:= ' SELECT P.nome_pro as Processo,' +
                          ' rnc_identificacao, rnc_data, rnc_status, C.nome_col as Emissor, ' +
                          ' rnc_setor' +
                          ' FROM rnc R' +
                          ' INNER JOIN processos P ON P.codi_pro = R.rnc_processo' +
                          ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_emitido' +
                          ' WHERE rnc_status = 2' + // Status RESPONDIDO
                          sWhere +
                          ' ORDER BY P.nome_pro, rnc_data';
         end;
         5: begin // RNC por Motivo
            sNomeGrupo:= 'Motivo: ';
            sTituloRelatorio:= 'RELATÓRIO DE RNC POR MOTIVO';
            CommandText:= ' SELECT TC.valo_com as Processo,' + // Mantido nome Processo para aproveitar o relatório
                          ' rnc_identificacao, rnc_data, rnc_status, C.nome_col as Emissor, ' + // **Responsavel
                          ' rnc_setor' +                                                        // Mantido Emissor
                          ' FROM rnc R' +                                                       // para aproveitar o relatório
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = rnc_motivo' +
                          ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_responsavel' + //**
                          ' WHERE 1 = 1' +
                          sWhere +
                          ' ORDER BY TC.valo_com, rnc_data';
         end;
         6: begin // RNC por Processo
            sTituloRelatorio:= 'RELATÓRIO DE RNC POR PROCESSO';
            CommandText:= ' SELECT P.nome_pro as Processo,' +                                   // **Responsavel
                          ' rnc_identificacao, rnc_data, rnc_status, C.nome_col as Emissor, ' + // Mantido Emissor
                          ' rnc_setor' +                                                        // para aproveitar
                          ' FROM rnc R' +                                                       // o relatório
                          ' INNER JOIN processos P ON P.codi_pro = R.rnc_processo' +
                          ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_responsavel' + //**
                          ' WHERE 1 = 1' +
                          sWhere +
                          ' ORDER BY P.nome_pro, rnc_data';
         end;
      end;
      Active:= True;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   if chkTodosData.Checked = True then begin
      sValorPeriodo:= 'TODOS';
   end
   else begin
      sValorPeriodo:= dtDataIni.Text + ' a ' + dtDataFim.Text;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\' + sNomeRelatorio + '.fr3');
      Variables['nomeGrupo']:= QuotedStr(sNomeGrupo);
      Variables['periodo']  := QuotedStr(sValorPeriodo);
      Variables['titulo']   := QuotedStr(sTituloRelatorio);
      Variables['tituloCol']:= QuotedStr(sTituloColResp);

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

//   Imprimir(sNomeRelatorio, frxReport1, tipoImp, 'Periodo', QuotedStr(sValorPeriodo));
end;

end.
