unit frm_GraficoAudAuto;

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
  TFormGraficoAudAuto = class(TForm)
    spdSalvar: TSavePictureDialog;
    pnl2: TPanel;
    btnSair: TBitBtn;
    zqryImpRNCAberto: TZQuery;
    dspImpRNCAberto: TDataSetProvider;
    dlgPntSet1: TPrinterSetupDialog;
    btnImprimir: TBitBtn;
    zqryQtdNCReq: TZQuery;
    dspQtdNCReq: TDataSetProvider;
    cdsQtdNCReq: TClientDataSet;
    dsQtdNCReq: TDataSource;
    pctGraficos: TJvgPageControl;
    ts2: TTabSheet;
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
    cdsImprimirnume_pmc: TWideStringField;
    cdsImprimirdata_pmc: TDateTimeField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirresponsavel: TWideStringField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirtipo: TWideStringField;
    zqryQtdNCProc: TZQuery;
    dspQtdNCProc: TDataSetProvider;
    cdsQtdNCProc: TClientDataSet;
    dsQtdNCProc: TDataSource;
    frxDBDSImpAcoes: TfrxDBDataset;
    zqryImprimirAcoes: TZQuery;
    dspImprimirAcoes: TDataSetProvider;
    cdsImprimirAcoes: TClientDataSet;
    cdsImprimirAcoesprocesso: TWideStringField;
    cdsImprimirAcoesdata_pmc: TDateTimeField;
    cdsImprimirAcoesnume_pmc: TWideStringField;
    cdsImprimirAcoesorigem: TWideStringField;
    cdsImprimirAcoestipo: TWideStringField;
    cdsImprimirAcoesresponsavel: TWideStringField;
    cdsImprimirAcoesdesc_aco: TWideMemoField;
    cdsImprimirAcoesresponsavelacao: TWideStringField;
    cdsImprimirAcoesaco_prazo: TDateTimeField;
    rgTipoGrafico: TRadioGroup;
    cdsImpRNCAberto: TClientDataSet;
    cdsImpRNCAbertoprocesso: TWideStringField;
    cdsImpRNCAbertornc_identificacao: TWideStringField;
    cdsImpRNCAbertornc_data: TDateTimeField;
    cdsImpRNCAbertornc_status: TIntegerField;
    frxDBDSRNCAberto: TfrxDBDataset;
    cdsImpRNCAbertornc_setor: TWideStringField;
    cdsImpRNCAbertoemissor: TWideStringField;
    btnExcel: TBitBtn;
    zqryExcel: TZQuery;
    dspExcel: TDataSetProvider;
    cdsExcel: TClientDataSet;
    dsExcel: TDataSource;
    dbgExcel: TDBGrid;
    cdsQtdNCReqaud_requisito: TWideStringField;
    cdsQtdNCReqqtde: TLargeintField;
    cdsQtdNCProcqtdnc: TLargeintField;
    cdsQtdNCProcprocesso: TWideStringField;
    ts1: TTabSheet;
    DBAdvGDIPChartView1: TDBAdvGDIPChartView;
    DBAdvGDIPChartView2: TDBAdvGDIPChartView;
    ts3: TTabSheet;
    DBAdvGDIPChartView3: TDBAdvGDIPChartView;
    zqryQtdObsProc: TZQuery;
    dspQtdObsProc: TDataSetProvider;
    cdsQtdObsProc: TClientDataSet;
    cds2: TWideStringField;
    cds4: TLargeintField;
    dsQtdObsProc: TDataSource;
    zqryQtdOMProc: TZQuery;
    dspQtdOMProc: TDataSetProvider;
    cdsQtdOMProc: TClientDataSet;
    cds3: TWideStringField;
    dsQtdOMProc: TDataSource;
    cdsQtdOMProcqtdom: TLargeintField;
    ts4: TTabSheet;
    DBAdvGDIPChartView4: TDBAdvGDIPChartView;
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
    procedure sbSairTreClick(Sender: TObject);
    procedure pctGraficosChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure rgTipoGraficoClick(Sender: TObject);
  private
    { Private declarations }
    sWhere: string;
  public
    { Public declarations }
    NumeroDeSeries: Integer;
    Titulo: string;
    dDataAuditoria: TDate;
  end;

var
  FormGraficoAudAuto: TFormGraficoAudAuto;

implementation

uses frm_CadRiscoAnaliseRisco, Funcoes, frm_ValoresIndicador;

{$R *.dfm}

procedure TFormGraficoAudAuto.AdvChartTypeSelector1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   (Sender as TAdvChartTypeSelector).Selected:= true;
   DBAdvGDIPChartView1.Panes[0].Series[0].ChartType := (Sender as TAdvChartTypeSelector).ChartType;
end;

procedure TFormGraficoAudAuto.AtualizarDados;
var
   sDataPmcIni, sDataPmcFim: string;
   sWhereAcoes: string;
begin
//   sWhere:= '';

   case pctGraficos.TabIndex of
      0: begin // Qtd. de Não Conformidades por Requisito
         with cdsQtdNCReq do begin
            Active:= False;
            CommandText:= ' SELECT aud_requisito, COUNT(*) AS Qtde' +
                          ' FROM auditoria_auto' +
                          ' WHERE SUBSTRING(aud_naoconformidade, 1, 2) = ' + QuotedStr('NC') +
                          ' AND aud_data = ' + ArrumaDataSQL(dDataAuditoria) +
                          ' GROUP BY aud_requisito' +
                          ' ORDER BY COUNT(*) DESC';
            Active:= True;
         end;
      end;
      1: begin // Qtd. de NC por processo
         with cdsQtdNCProc do begin
            Active:= False;
            CommandText:= ' SELECT P.pro_nome_abreviado as Processo,' +
                          ' SUM(aud_contnc) AS QtdNC' +
                          ' FROM auditoria_auto' +
                          ' INNER JOIN processos P ON P.codi_pro = aud_processo' +
                          ' WHERE aud_data = ' + ArrumaDataSQL(dDataAuditoria) +
                          ' GROUP BY P.pro_nome_abreviado' +
                          ' HAVING SUM(aud_contnc) > 0' +
                          ' ORDER BY SUM(aud_contnc) DESC';
            Active:= True;
         end;
      end;
      2: begin // Qtd. de OBS por processo
         with cdsQtdObsProc do begin
            Active:= False;
            CommandText:= ' SELECT P.pro_nome_abreviado as Processo,' +
                          ' SUM(aud_contobs) AS QtdOBS' +
                          ' FROM auditoria_auto' +
                          ' INNER JOIN processos P ON P.codi_pro = aud_processo' +
                          ' WHERE aud_data = ' + ArrumaDataSQL(dDataAuditoria) +
                          ' GROUP BY P.pro_nome_abreviado' +
                          ' HAVING SUM(aud_contobs) > 0' +
                          ' ORDER BY SUM(aud_contobs) DESC';
            Active:= True;
         end;
      end;
      3: begin // Qtd. de OM por processo
         with cdsQtdOMProc do begin
            Active:= False;
            CommandText:= ' SELECT P.pro_nome_abreviado as Processo,' +
                          ' SUM(aud_contom) AS QtdOM' +
                          ' FROM auditoria_auto' +
                          ' INNER JOIN processos P ON P.codi_pro = aud_processo' +
                          ' WHERE aud_data = ' + ArrumaDataSQL(dDataAuditoria) +
                          ' GROUP BY P.pro_nome_abreviado' +
                          ' HAVING SUM(aud_contom) > 0' +
                          ' ORDER BY SUM(aud_contom) DESC';
            Active:= True;
         end;
      end;
   end;
end;

procedure TFormGraficoAudAuto.btnImpressoraTreClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormGraficoAudAuto.btnImprimirClick(Sender: TObject);
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

procedure TFormGraficoAudAuto.btnExcelClick(Sender: TObject);
var
   sTituloExcel: string;
   sWhereAcoes:  string;
begin
   case pctGraficos.TabIndex of
      0: begin
         sTituloExcel:= 'PMC sem análise de causa';
         with cdsExcel do begin
            Active:= False;
            CommandText:= ' SELECT nume_pmc as "PMC", data_pmc as "Data", ' +
                          ' P.pro_nome_abreviado as "Processo", C.nome_col as "Responsável",' +
                          ' TC.valo_com as "Origem", TC1.valo_com as "Tipo"' +
                          ' FROM pmc' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' INNER JOIN colaboradores C ON C.codi_col = resp_pmc' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 5 AND TC.codi_com = orig_pmc' +
                          ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 4 AND TC1.codi_com = tipo_pmc' +
                          ' WHERE (caus_pmc isnull OR caus_pmc = ' + QuotedStr('') + ')' +
                          sWhere +
                          ' ORDER BY nume_pmc';
            Active:= True;
         end;
      end;
      1: begin
         sTituloExcel:= 'PMC sem Plano de Ação';
         with cdsExcel do begin
            Active:= False;
            CommandText:= ' SELECT nume_pmc as "PMC", data_pmc as "Date", ' +
                          ' P.pro_nome_abreviado as "Processo", C.nome_col as "Responsável",' +
                          ' TC.valo_com as "Origem", TC1.valo_com as "Tipo"' +
                          ' FROM pmc PM' +
                          ' LEFT JOIN processos P ON P.codi_pro = prcs_pmc' +
                          ' INNER JOIN colaboradores C ON C.codi_col = resp_pmc' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 5 AND TC.codi_com = orig_pmc' +
                          ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 4 AND TC1.codi_com = tipo_pmc' +
                          ' WHERE (SELECT COUNT(*) FROM pmc_acoes WHERE codi_pmc = PM.codi_pmc) = 0' +
                          sWhere +
                          ' ORDER BY nume_pmc';
            Active:= True;
         end;
      end;
   end;

   if cdsExcel.RecordCount <= 0 then begin
      Application.MessageBox('Não existem registros para exportar', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      ExpExcel(dbgExcel, cdsExcel, sTituloExcel);
   end;
end;

procedure TFormGraficoAudAuto.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormGraficoAudAuto.btnVideoTreClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormGraficoAudAuto.FormShow(Sender: TObject);
begin
   rgTipoGrafico.ItemIndex:= 0;
   pctGraficos.TabIndex   := 0;

   AtualizarDados();
   Inicializar();

   AtualizarDados();
   Inicializar();
end;

procedure TFormGraficoAudAuto.Inicializar;
var
   c1, c2, c3, c4, c5, c6, c7, c8: TColor;
   I, K: Integer;
   serie: TChartSerie;
begin
   // Gráfico de Qtd de Não Conformidades por Requisito
   with DBAdvGDIPChartView1.Panes[0] do begin
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X

      Series[0].AutoRange:= arDisabled;
      Series[0].Maximum:= cdsQtdNCReq.FieldByName('Qtde').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de Qtd de NC por processo
   with DBAdvGDIPChartView2.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente

      Series[0].AutoRange:= arEnabled;
      Series[0].Maximum:= cdsQtdNCProc.FieldByName('QtdNC').AsInteger + 3;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de Qtd de OBS por processo
   with DBAdvGDIPChartView3.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente

      Series[0].AutoRange:= arEnabled;
      Series[0].Maximum:= cdsQtdObsProc.FieldByName('QtdObs').AsInteger + 10;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   // Gráfico de Qtd de OM por processo
   with DBAdvGDIPChartView4.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente

      Series[0].AutoRange:= arEnabled;
      Series[0].Maximum:= cdsQtdOMProc.FieldByName('QtdOM').AsInteger + 10;
      Series[0].ValueFormat:= '###0'; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= 0;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
   end;

   case rgTipoGrafico.ItemIndex of
      0: begin
         DBAdvGDIPChartView1.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView2.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView3.Panes[0].Series[0].ChartType:= ctBar;
         DBAdvGDIPChartView4.Panes[0].Series[0].ChartType:= ctBar;

         // Cor azul para as barras
         DBAdvGDIPChartView1.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView2.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView3.Panes[0].Series[0].Color      := $00FF6633;
         DBAdvGDIPChartView4.Panes[0].Series[0].Color      := $00FF6633;
      end;
      1: begin
         DBAdvGDIPChartView1.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView2.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView3.Panes[0].Series[0].ChartType:= ctPie;
         DBAdvGDIPChartView4.Panes[0].Series[0].ChartType:= ctPie;

         DBAdvGDIPChartView1.Panes[0].Series[0].Color:= RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView2.Panes[0].Series[0].Color:= RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView3.Panes[0].Series[0].Color:= RGB(Random(255), Random(255), Random(255));
         DBAdvGDIPChartView4.Panes[0].Series[0].Color:= RGB(Random(255), Random(255), Random(255));
      end;
   end;
end;

procedure TFormGraficoAudAuto.pctGraficosChange(Sender: TObject);
begin
   AtualizarDados();
   Inicializar();
end;

procedure TFormGraficoAudAuto.rgTipoGraficoClick(Sender: TObject);
begin
   AtualizarDados();
   Inicializar();
end;

procedure TFormGraficoAudAuto.sbSairTreClick(Sender: TObject);
begin
   pnlRelatorio.Visible:= False;
end;

procedure TFormGraficoAudAuto.Impressao(tipoImp: string);
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
