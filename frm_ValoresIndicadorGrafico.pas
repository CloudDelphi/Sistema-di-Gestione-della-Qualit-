unit frm_ValoresIndicadorGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtrls, SHDocVw, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, AdvOpenGLControl,
  AdvChartView3D, AdvChartView, StdCtrls, ExtCtrls, ExtDlgs, ShellAPI,
  AdvChartGDIP, AdvChart, AdvChartViewGDIP, DBAdvChartViewGDIP, Grids, DBGrids,
  DBTables, AdvChartTypeSelector, Printers;

type
  TFormValoresIndicadoresGrafico = class(TForm)
    spdSalvar: TSavePictureDialog;
    pnl2: TPanel;
    btnSair: TBitBtn;
    zqryValorIndicadores: TZQuery;
    dspValorIndicadores: TDataSetProvider;
    cdsValorIndicadores: TClientDataSet;
    cdsValorIndicadorescodi_ind: TLargeintField;
    cdsValorIndicadorescodi_vin: TLargeintField;
    cdsValorIndicadoresperi_vin: TLargeintField;
    cdsValorIndicadoresproc_vin: TLargeintField;
    cdsValorIndicadoresvalo_vin: TFloatField;
    cdsValorIndicadoresextMes: TStringField;
    cdsValorIndicadoresano: TStringField;
    cdsValorIndicadoresperiodo: TStringField;
    cdsValorIndicadoresValor: TFloatField;
    cdsValorIndicadoresValorGrafico: TFloatField;
    cdsValorIndicadoresanomes: TStringField;
    cdsValorIndicadoresdescInd: TStringField;
    cdsValorIndicadoresobse_vin: TWideMemoField;
    cdsValorIndicadoresvin_arquivo: TWideStringField;
    dsValorIndicadores: TDataSource;
    AdvChartTypeSelector1: TAdvChartTypeSelector;
    AdvChartTypeSelector2: TAdvChartTypeSelector;
    AdvChartTypeSelector3: TAdvChartTypeSelector;
    cdsValorIndicadoresind_metodologia: TWideMemoField;
    cdsValorIndicadoresmet_valor: TFloatField;
    cdsValorIndicadoresmet_anomes: TWideStringField;
    dlgPntSet1: TPrinterSetupDialog;
    btnImprimir: TBitBtn;
    cdsValorIndicadoresmet_unidade: TWideStringField;
    DBAdvGDIPChartView2: TDBAdvGDIPChartView;
    zqryMedias: TZQuery;
    dspMedias: TDataSetProvider;
    cdsMedias: TClientDataSet;
    dsMedias: TDataSource;
    cdsMediasano: TWideMemoField;
    cdsMediasmediaindicador: TFloatField;
    rgPosicaoLegenda: TRadioGroup;
    DBAdvGDIPChartView1: TDBAdvGDIPChartView;
    pnlTitulo1: TPanel;
    pnlTitulo2: TPanel;
    zqryMediasFinais: TZQuery;
    dspMediasFinais: TDataSetProvider;
    cdsMediasFinais: TClientDataSet;
    WideMemoField1: TWideMemoField;
    FloatField1: TFloatField;
    dsMediasFinais: TDataSource;
    procedure Inicializar();
    procedure FormShow(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AtualizarDados();
    procedure cdsValorIndicadoresCalcFields(DataSet: TDataSet);
    procedure AdvChartTypeSelector1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnImprimirClick(Sender: TObject);
    procedure cdsMediasanoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure rgPosicaoLegendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NumeroDeSeries: Integer;
    Titulo: string;
  end;

var
  FormValoresIndicadoresGrafico: TFormValoresIndicadoresGrafico;

implementation

uses frm_CadRiscoAnaliseRisco, Funcoes, frm_ValoresIndicador;

{$R *.dfm}

procedure TFormValoresIndicadoresGrafico.AdvChartTypeSelector1MouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   (Sender as TAdvChartTypeSelector).Selected:= True;
   DBAdvGDIPChartView1.Panes[0].Series[0].ChartType := (Sender as TAdvChartTypeSelector).ChartType;
//   DBAdvGDIPChartView2.Panes[0].Series[0].ChartType := (Sender as TAdvChartTypeSelector).ChartType;
end;

procedure TFormValoresIndicadoresGrafico.AtualizarDados;
begin
   with cdsValorIndicadores do begin
      Active:= False;
      CommandText:= FormValorIndicadores.cdsValorIndicadores.CommandText;
      Active:= True;
   end;

   with cdsMedias do begin
      Active:= False;
      CommandText:= ' SELECT SUBSTR(CAST(peri_vin as varchar), 1, 4) as Ano, AVG(valo_vin) as MediaIndicador' +
                    ' FROM valor_indicador' +
                    ' WHERE codi_ind = ' + FormValorIndicadores.cdsValorIndicadores.FieldByName('codi_ind').AsString +
                    ' AND SUBSTR(CAST(peri_vin as varchar), 1, 4) > CAST(EXTRACT(YEAR FROM current_date) -3 AS VARCHAR)' +
                    ' GROUP BY SUBSTR(CAST(peri_vin as varchar), 1, 4)' +
                    ' ORDER BY SUBSTR(CAST(peri_vin as varchar), 1, 4)';
      Active:= True;
   end;

//   if cdsMedias.RecordCount = 1 then begin      aqui
//      cdsMediasFinais.Open;
//      cdsMediasFinais.Append;
//      cdsMediasFinais.FieldByName('MediaIndicador').AsFloat:= cdsMedias.FieldByName('MediaIndicador').AsFloat;
//      cdsMediasFinais.FieldByName('Ano').AsString:= cdsMedias.FieldByName('Ano').AsString;
//   end;

end;

procedure TFormValoresIndicadoresGrafico.btn4Click(Sender: TObject);
var
   fn, ext: string;
   imgt: TImageType;
begin
//   if spdSalvar.Execute then begin
//      fn  := spdSalvar.FileName;
//      ext := LowerCase(ExtractFileExt(fn));
//      imgt:= itPNG;
//      if (ext = '.jpeg') or (ext = '.jpg') then begin
//        imgt := itJPEG;
//      end;
//      if (ext = '.png') then begin
//        imgt := itPNG;
//      end;
//      if (ext = '.tiff') then begin
//        imgt := itTIFF;
//      end;
//      if (ext = '.bmp') then begin
//        imgt := itBMP;
//      end;
//      if (ext = '.gif') then begin
//        imgt := itGIF;
//      end;
//
//      AdvChartView1.SavePaneToBitmap(fn, imgt);
//      ShellExecute(0, PChar('open'), PChar(fn), '', '', 0);
//   end;
end;

procedure TFormValoresIndicadoresGrafico.btnImprimirClick(Sender: TObject);
var
   bmp: TBitmap;
begin
   if dlgPntSet1.Execute then begin
      bmp       := TBitmap.Create;
      bmp.Width := DBAdvGDIPChartView1.Width;
      bmp.Height:= DBAdvGDIPChartView1.Height;

      DBAdvGDIPChartView2.PrintPane(0, bmp.Canvas, Bounds(0, 0, DBAdvGDIPChartView2.Width, DBAdvGDIPChartView2.Height));
      DBAdvGDIPChartView1.PrintPane(0, bmp.Canvas, Bounds(DBAdvGDIPChartView2.Width - 100, 0, DBAdvGDIPChartView1.Width - 170, DBAdvGDIPChartView1.Height));
//      DBAdvGDIPChartView1.PrintPane(0, bmp.Canvas, Bounds(0, 0, bmp.Width, bmp.Height));

      Printer.Orientation := poLandscape;

      Printer.BeginDoc;
      Printer.Canvas.StretchDraw(Bounds(0, 0, Printer.PageWidth, Printer.PageHeight), bmp);
      Printer.EndDoc;
      bmp.Free;
   end;
end;

procedure TFormValoresIndicadoresGrafico.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormValoresIndicadoresGrafico.cdsMediasanoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsMedias.FieldByName('ano').AsString, 1, 4);
end;

procedure TFormValoresIndicadoresGrafico.cdsValorIndicadoresCalcFields(
  DataSet: TDataSet);
begin
   cdsValorIndicadores.FieldByName('extMes').AsString:=
                     MesExtenso(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2), True);
   cdsValorIndicadores.FieldByName('ano').AsString:=
                     Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
   cdsValorIndicadores.FieldByName('periodo').AsString:=
                     MesExtenso(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2), True) +
                     '/' + Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
//   cdsValorIndicadoresValor.AsString:= FormatFloat('########0.000000',cdsValorIndicadoresvalo_vin.AsFloat);
   cdsValorIndicadoresValorGrafico.AsFloat:= cdsValorIndicadoresvalo_vin.AsFloat;
   cdsValorIndicadoresanomes.AsString:= cdsValorIndicadoresperi_vin.AsString;
end;

procedure TFormValoresIndicadoresGrafico.FormShow(Sender: TObject);
begin
//   rgPosicaoLegenda.ItemIndex:= 0;
   Self.Caption:= Self.Caption + FormValorIndicadores.dblIndicadores.Text;
   AtualizarDados();
   Inicializar();
   AtualizarDados();
   Inicializar();
end;

procedure TFormValoresIndicadoresGrafico.Inicializar;
var
   c1, c2, c3, c4, c5, c6, c7, c8: TColor;
   I: Integer;
   serie: TChartSerie;
begin
   // Gráfico de metas dos 3 anos anteriores, inclusive o atual
   with DBAdvGDIPChartView2.Panes[0] do begin
      XAxis.Size := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits:= True; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange:= arEnabled;                                           // 10%
      Series[0].Maximum:= cdsMedias.FieldByName('MediaIndicador').AsInteger + (cdsMedias.FieldByName('MediaIndicador').AsInteger * 10 / 100);
      Series[0].ValueFormat:= FormValorIndicadores.Formato; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= -2;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue:= True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType:= vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 0; // Angulo do texto do eixo X
      Series[0].YAxis.Visible:= True; // Mostra os valores no eixo Y
   end;

   // Gráfico de valores do indicadors
   with DBAdvGDIPChartView1.Panes[0] do begin
      case rgPosicaoLegenda.ItemIndex of
         0: begin // Esquerda
            Legend.Alignment:= laTopLeft;
         end;
         1: begin // Centro
            Legend.Alignment:= laTopCenter;
         end;
         2: begin // Direita
            Legend.Alignment:= laTopRight;
         end;
      end;

      pnlTitulo1.Caption    := FormValorIndicadores.dblIndicadores.Text;
      pnlTitulo2.Caption    := BuscarUltimaMetaIndicador(FormValorIndicadores.dblIndicadores.KeyValue);
      Title.Size            := 60;
//      Title.Text:= FormValorIndicadores.dblIndicadores.Text + ' - ' + BuscarUltimaMetaIndicador(FormValorIndicadores.dblIndicadores.KeyValue);
      XAxis.Size            := 50; // Altura da base do gráfico do Eixo X
      YAxis.AutoUnits       := True; // Ajusta a escala do eixo Y automaticamente
      Series[0].AutoRange   := arCommon; // Quando tem 2 séries coloca arCommom para as séries usarem a mesma escala
      Series[0].Maximum     := cdsValorIndicadores.FieldByName('ValorGrafico').AsInteger + (cdsValorIndicadores.FieldByName('ValorGrafico').AsInteger * 10 / 100);
      Series[0].ValueFormat := FormValorIndicadores.Formato; // Formato do valor do gráfico
      Series[0].ValueOffsetY:= -2;
      Series[0].ValueOffsetX:= 0;
      Series[0].ShowValue   := True; // Mostra valores na barra
      Series[0].ShowValueInTracker:= False;
      Series[0].ValueFormatType   := vftFloat;
      Series[0].XAxis.TextBottom.Angle:= 90; // Angulo do texto do eixo X

      // Meta
//      Series[1].AutoRange:= arEnabled;
      Series[1].ValueFormat:= FormValorIndicadores.Formato; // Formato do valor do gráfico
      Series[1].ShowValue  := False; // Mostra valores na barra
   end;

//   AdvGDIPChartView1.BeginUpdate;
//   AdvGDIPChartView1.InitSample;
//
//   AdvGDIPChartView1.Panes[0].Series.Add;
//   AdvGDIPChartView1.Panes[0].Legend.Left := 280;
//   AdvGDIPChartView1.Panes[0].Legend.Top := -80;
//   AdvGDIPChartView1.Panes[0].Title.Size := 80;
//   for I := 0 to 3 do begin
//      serie := AdvGDIPChartView1.Panes[0].Series[I];
//      serie.ChartType:= ctLine;
//      serie.AutoRange:= arEnabled;
////      serie.XAxis.Visible:= I = 0;
////      serie.YAxis.Visible:= I = 0;
//      serie.Marker.MarkerType:= mCircle;
//      serie.ValueWidth:= 200;
//      serie.ClearPoints;
////      for K := 0 to 5 do begin
////         serie.AddSinglePoint(Random(100) + 10);
////      end;
//   end;

//   with cdsValorIndicadores do begin
//      First;
//      i:= 0;
//      while not Eof do begin
//         i:= i + 1;
//         with AdvGDIPChartView1.Panes[0].Series[0] do begin
////            Caption := FieldByName('periodo').AsString;
//            AddSinglePoint(FieldByName('ValorGrafico').AsFloat);
////            Color   := RGB(Random(255), Random(255), Random(255));
//         end;
//         Next;
//      end;
//   end;

//   with AdvChartView1.Panes[0] do begin
//      Series.Clear; // Limpa todas as Séries
////      Series.Add; // Adiciona uma nova série
//      Title.Text := 'Indicadores';
////      Legend.Position:= ipTopRight;
//
//   end;

//   AdvChartView1.EndUpdate;

//   Randomize;
//   c1 := RGB(47,118,179);
//   c2 := RGB(11,79,146);
//   c3 := RGB(152,190,218);
//   c4 := RGB(63,128,181);
//   c5 := RGB(137,119,199);
//   c6 := RGB(84,73,122);
//   c7 := RGB(255,85,0);
//   c8 := RGB(179,59,0);


//   AdvGDIPChartView1.Panes[0].Series[0]
//   AdvGDIPChartView1.Panes[0].Series[0].YAxis.MinorUnit:= 0;
//   AdvGDIPChartView1.Panes[0].Series[0].YAxis.MajorUnit:= 100;
//   AdvGDIPChartView1.Panes[0].Series[0].ClearPoints;
//   AdvGDIPChartView1.Panes[0].Series[1].ClearPoints;
//   AdvGDIPChartView1.Panes[0].Series[2].ClearPoints;
//
//   AdvGDIPChartView1.Panes[0].Series[0].AutoRange:= arCommon;
//
//   with cdsValorIndicadores do begin
//      First;
//      i:= 0;
//      while not Eof do begin
//         i:= i + 1;
//         with AdvGDIPChartView1.Panes[0].Series[0] do begin
//            Caption := FieldByName('periodo').AsString;
//            AddSinglePoint(FieldByName('ValorGrafico').AsFloat);
//            Color   := RGB(Random(255), Random(255), Random(255));
//         end;
//         Next;
//      end;
//   end;

//   with cdsInterna do begin
//      First;
//      i:= 0;
//      while not Eof do begin
//         i:= i + 1;
//         with AdvGDIPChartView1.Panes[0].Series[1] do begin
////            Caption := FieldByName('tipo').AsString;
//            AddSinglePoint(FieldByName('qtd').AsInteger);
////            Color   := RGB(Random(255), Random(255), Random(255));
//         end;
//         Next;
//      end;
//   end;

//  for I := 0 to 4 do begin
//     AdvGDIPChartView1.Panes[0].Series[0].AddSinglePoint(1);
//     AdvGDIPChartView1.Panes[0].Series[1].AddSinglePoint(2);
//     AdvGDIPChartView1.Panes[0].Series[2].AddSinglePoint(8);
//  end;
//  AdvGDIPChartView1.Panes[0].BackGround.Color := c1;
//  AdvGDIPChartView1.Panes[0].BackGround.ColorTo := c2;
//  AdvGDIPChartView1.Panes[0].Title.Color := c1;
//  AdvGDIPChartView1.Panes[0].Title.ColorTo := c2;
//  AdvGDIPChartView1.Panes[0].Xaxis.Color := c1;
//  AdvGDIPChartView1.Panes[0].Xaxis.ColorTo := c2;
//  AdvGDIPChartView1.Panes[0].YAxis.Color := c2;
//  AdvGDIPChartView1.Panes[0].Series[1].Color := c7;
//  AdvGDIPChartView1.Panes[0].Series[1].ColorTo := c8;
end;

procedure TFormValoresIndicadoresGrafico.rgPosicaoLegendaClick(Sender: TObject);
begin
   Inicializar();
end;

end.
