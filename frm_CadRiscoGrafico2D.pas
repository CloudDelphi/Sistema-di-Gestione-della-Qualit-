unit frm_CadRiscoGrafico2D;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtrls, SHDocVw, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, AdvOpenGLControl,
  AdvChartView3D, AdvChartView, StdCtrls, ExtCtrls, ExtDlgs, ShellAPI,
  AdvChartGDIP, AdvChart, AdvChartViewGDIP, DBAdvChartViewGDIP, Grids, DBGrids,
  DBTables;

type
  TFormRiscoGrafico2D = class(TForm)
    zqryAnalise: TZQuery;
    dspAnalise: TDataSetProvider;
    cdsAnalise: TClientDataSet;
    dsAnalise: TDataSource;
    cdsAnaliseqtd: TLargeintField;
    cdsAnalisetipovar: TWideStringField;
    cdsAnalisetipo: TWideStringField;
    spdSalvar: TSavePictureDialog;
    pnl2: TPanel;
    btnSair: TBitBtn;
    zqryInterna: TZQuery;
    dspInterna: TDataSetProvider;
    cdsInterna: TClientDataSet;
    dsInterna: TDataSource;
    cdsInternaqtd: TLargeintField;
    cdsInternatipovar: TWideStringField;
    cdsInternatipo: TWideStringField;
    zqryValorIndicadores: TZQuery;
    dspValorIndicadores: TDataSetProvider;
    cdsValorIndicadores: TClientDataSet;
    cdsValorIndicadoresextMes: TStringField;
    cdsValorIndicadoresano: TStringField;
    cdsValorIndicadoresperiodo: TStringField;
    cdsValorIndicadoresValor: TFloatField;
    cdsValorIndicadoresValorGrafico: TFloatField;
    cdsValorIndicadoresanomes: TStringField;
    cdsValorIndicadoresdescInd: TStringField;
    dsValorIndicadores: TDataSource;
    DBAdvGDIPChartView1: TDBAdvGDIPChartView;
    cdsValorIndicadorescodi_ind: TLargeintField;
    cdsValorIndicadorescodi_vin: TLargeintField;
    cdsValorIndicadoresperi_vin: TLargeintField;
    cdsValorIndicadoresproc_vin: TLargeintField;
    cdsValorIndicadoresvalo_vin: TFloatField;
    cdsValorIndicadoresmeta_ind: TFloatField;
    procedure Inicializar();
    procedure FormShow(Sender: TObject);
    procedure btnCoresClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnPadraoClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AtualizarDados();
    procedure cdsValorIndicadoresCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    NumeroDeSeries: Integer;
    Titulo: string;
  end;

var
  FormRiscoGrafico2D: TFormRiscoGrafico2D;

implementation

uses frm_CadRiscoAnaliseRisco, Funcoes;

{$R *.dfm}

procedure TFormRiscoGrafico2D.AtualizarDados;
begin
   with cdsAnalise do begin
      Active:= False;
      Active:= True;
   end;

   with cdsInterna do begin
      Active:= False;
      Active:= True;
   end;

   with cdsValorIndicadores do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormRiscoGrafico2D.btn1Click(Sender: TObject);
begin
   ShowMessage('Left-Mouse-Drag Up/Down/Left/Right: Rotate X, Y'+#13#10+'Right-Mouse-Drag Left/Right: Rotate Z'
  +#13#10+'MouseWheel-Scrolling: Change Z-Position');
end;

procedure TFormRiscoGrafico2D.btnPadraoClick(Sender: TObject);
begin
   Inicializar();
end;

procedure TFormRiscoGrafico2D.btn4Click(Sender: TObject);
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

procedure TFormRiscoGrafico2D.btnCoresClick(Sender: TObject);
var
   I: Integer;
begin
//   AdvChartView1.BeginUpdate;
//   for I := 0 to AdvChartView1.Series[0].Items.Count - 1 do begin
//      AdvChartView1.Series[0].Items[I].Value := RandomRange(10, 200);
//      AdvChartView1.Series[0].Items[I].Color := RGB(Random(255), Random(255), Random(255));
//   end;
//   AdvChartView1.EndUpdate;
end;

procedure TFormRiscoGrafico2D.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormRiscoGrafico2D.cdsValorIndicadoresCalcFields(DataSet: TDataSet);
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

procedure TFormRiscoGrafico2D.FormShow(Sender: TObject);
begin
   AtualizarDados();
   Inicializar();
end;

procedure TFormRiscoGrafico2D.Inicializar;
var
   c1, c2, c3, c4, c5, c6, c7, c8: TColor;
   I: Integer;
   serie: TChartSerie;
begin
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

end.
