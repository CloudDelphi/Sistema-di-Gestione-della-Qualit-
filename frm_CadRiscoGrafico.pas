unit frm_CadRiscoGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, OleCtrls, SHDocVw, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, AdvOpenGLControl,
  AdvChartView3D, AdvChartView, StdCtrls, ExtCtrls, ExtDlgs, ShellAPI, AdvChartGDIP;

type
  TFormRiscoGrafico = class(TForm)
    zqryAnalise: TZQuery;
    dspAnalise: TDataSetProvider;
    cdsAnalise: TClientDataSet;
    dsAnalise: TDataSource;
    cdsAnaliseqtd: TLargeintField;
    cdsAnalisetipovar: TWideStringField;
    cdsAnalisetipo: TWideStringField;
    AdvChartView3D1: TAdvChartView3D;
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    TrackBarX: TTrackBar;
    TrackBarY: TTrackBar;
    TrackBarZ: TTrackBar;
    grp2: TGroupBox;
    lbl4: TLabel;
    chkPercentual: TCheckBox;
    chkMostrarValores: TCheckBox;
    chkImagens: TCheckBox;
    TrackBarTransp: TTrackBar;
    grp3: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    chkAutoSize: TCheckBox;
    TrackBarElevacao: TTrackBar;
    TrackBarExtracao: TTrackBar;
    TrackBarProfund: TTrackBar;
    grp4: TGroupBox;
    chkInteracao: TCheckBox;
    btn1: TButton;
    btnCores: TButton;
    btnPadrao: TButton;
    btn4: TButton;
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
    procedure sb1Click(Sender: TObject);
    procedure Inicializar();
    procedure FormShow(Sender: TObject);
    procedure TrackBarXChange(Sender: TObject);
    procedure TrackBarYChange(Sender: TObject);
    procedure TrackBarZChange(Sender: TObject);
    procedure btnCoresClick(Sender: TObject);
    procedure chkMostrarValoresClick(Sender: TObject);
    procedure TrackBarTranspChange(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure chkAutoSizeClick(Sender: TObject);
    procedure TrackBarExtracaoChange(Sender: TObject);
    procedure TrackBarElevacaoChange(Sender: TObject);
    procedure TrackBarProfundChange(Sender: TObject);
    procedure btnPadraoClick(Sender: TObject);
    procedure chkInteracaoClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chkPercentualClick(Sender: TObject);
    procedure chkImagensClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure AtualizarDados();
  private
    { Private declarations }
  public
    { Public declarations }
    NumeroDeSeries: Integer;
    Titulo: string;
  end;

var
  FormRiscoGrafico: TFormRiscoGrafico;

implementation

uses frm_CadRiscoAnaliseRisco;

{$R *.dfm}

procedure TFormRiscoGrafico.AtualizarDados;
begin
   with cdsAnalise do begin
      Active:= False;
      Active:= True;
   end;

   with cdsInterna do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormRiscoGrafico.btn1Click(Sender: TObject);
begin
   ShowMessage('Left-Mouse-Drag Up/Down/Left/Right: Rotate X, Y'+#13#10+'Right-Mouse-Drag Left/Right: Rotate Z'
  +#13#10+'MouseWheel-Scrolling: Change Z-Position');
end;

procedure TFormRiscoGrafico.btnPadraoClick(Sender: TObject);
begin
   Inicializar();
end;

procedure TFormRiscoGrafico.btn4Click(Sender: TObject);
var
   fn, ext: string;
   imgt: TImageType;
begin
   if spdSalvar.Execute then begin
      fn  := spdSalvar.FileName;
      ext := LowerCase(ExtractFileExt(fn));
      imgt:= itPNG;
      if (ext = '.jpeg') or (ext = '.jpg') then begin
        imgt := itJPEG;
      end;
      if (ext = '.png') then begin
        imgt := itPNG;
      end;
      if (ext = '.tiff') then begin
        imgt := itTIFF;
      end;
      if (ext = '.bmp') then begin
        imgt := itBMP;
      end;
      if (ext = '.gif') then begin
        imgt := itGIF;
      end;

      AdvChartView3D1.SaveToImage(fn, imgt);
      ShellExecute(0, PChar('open'), PChar(fn), '', '', 0);
   end;
end;

procedure TFormRiscoGrafico.btnCoresClick(Sender: TObject);
var
   I: Integer;
begin
   AdvChartView3D1.BeginUpdate;
   for I := 0 to AdvChartView3D1.Series[0].Items.Count - 1 do begin
//      AdvChartView3D1.Series[0].Items[I].Value := RandomRange(10, 200);
      AdvChartView3D1.Series[0].Items[I].Color := RGB(Random(255), Random(255), Random(255));
   end;
   AdvChartView3D1.EndUpdate;
end;

procedure TFormRiscoGrafico.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormRiscoGrafico.chkImagensClick(Sender: TObject);
begin
   AdvChartView3D1.Series[0].Values.ImageVisible:= chkImagens.Checked;
end;

procedure TFormRiscoGrafico.chkInteracaoClick(Sender: TObject);
begin
   AdvChartView3D1.Series[0].Interaction:= chkInteracao.Checked;
end;

procedure TFormRiscoGrafico.chkPercentualClick(Sender: TObject);
begin
//   AdvChartView3D1.AntiAlias := chkAntiAlias.Checked;
//   AdvChartView3D1.Repaint;
   AdvChartView3D1.Series[0].Values.ShowPercentages:= chkPercentual.Checked;
end;

procedure TFormRiscoGrafico.chkAutoSizeClick(Sender: TObject);
begin
   AdvChartView3D1.BeginUpdate;
   if chkAutoSize.Checked then begin
      AdvChartView3D1.Series[0].SizeType := stPercentage;
      AdvChartView3D1.Series[0].Size := 80;
   end
   else begin
      AdvChartView3D1.Series[0].SizeType := stPixels;
      AdvChartView3D1.Series[0].Size := 300;
   end;
   AdvChartView3D1.EndUpdate;
end;

procedure TFormRiscoGrafico.chkMostrarValoresClick(Sender: TObject);
begin
   AdvChartView3D1.Series[0].Values.ShowValues:= chkMostrarValores.Checked;
end;

procedure TFormRiscoGrafico.FormShow(Sender: TObject);
begin
   AtualizarDados();
   Inicializar();
end;

procedure TFormRiscoGrafico.Inicializar;
var
   i: Integer;
begin
   AdvChartView3D1.BeginUpdate;
   AdvChartView3D1.InitSample;
   AdvChartView3D1.Title.Text := 'Tipo de Análise';

   AdvChartView3D1.Series.Add; // Adiciona uma nova série
   AdvChartView3D1.Series.Add; // Adiciona uma nova série

   AdvChartView3D1.Series[2].Visible:= False;

   AdvChartView3D1.Series[1].Legend.Position:= ipTopRight;
   AdvChartView3D1.Series[1].Size := 300;
   AdvChartView3D1.Series[1].Left := 0;
   AdvChartView3D1.Series[1].Top  := 0;
   AdvChartView3D1.Series[1].Depth:= 40;
   AdvChartView3D1.Series[1].Values.ShowCaptions    := True;
   AdvChartView3D1.Series[1].Values.ShowValues      := True;
   AdvChartView3D1.Series[1].Values.ShowPercentages := True;
   AdvChartView3D1.Series[1].Values.ImageAspectRatio:= True;
   AdvChartView3D1.Series[1].Values.ImagePosition := ipCenterCenter;
//   AdvChartView3D1.Series[0].Values.ImageHeight:= 20;
//   AdvChartView3D1.Series[0].Values.ImageWidth := 10;
   AdvChartView3D1.Series[1].Values.ValuesFont.Size := 10;
   AdvChartView3D1.Series[1].Values.Fill.Color      := clWhite;
   AdvChartView3D1.Series[1].Values.Fill.EndColor   := clWhite;
   AdvChartView3D1.Series[1].Items.Clear;

   with cdsInterna do begin
      First;
      i:= 0;
      while not Eof do begin
         i:= i + 1;
         with AdvChartView3D1.Series[1].Items.Add do begin
            Caption := FieldByName('tipo').AsString;
            Value   := FieldByName('qtd').AsInteger;
            Color   := RGB(Random(255), Random(255), Random(255));
//            Image.LoadFromFile(ExtractFilePath(Application.ExeName) +  '/imagens/logo1.jpg');
//            Image.Height:= 20;
//            Image.Width := 10;
         end;
         Next;
      end;
   end;

//--------------Série 1------------
   AdvChartView3D1.Series[0].Size := 300;
   AdvChartView3D1.Series[0].Left := 0;
   AdvChartView3D1.Series[0].Top  := 0;
   AdvChartView3D1.Series[0].Depth:= 40;
   AdvChartView3D1.Series[0].Values.ShowCaptions    := True;
   AdvChartView3D1.Series[0].Values.ShowValues      := True;
   AdvChartView3D1.Series[0].Values.ShowPercentages := True;
   AdvChartView3D1.Series[0].Values.ImageAspectRatio:= True;
   AdvChartView3D1.Series[0].Values.ImagePosition := ipCenterCenter;
//   AdvChartView3D1.Series[0].Values.ImageHeight:= 20;
//   AdvChartView3D1.Series[0].Values.ImageWidth := 10;
   AdvChartView3D1.Series[0].Values.ValuesFont.Size := 10;
   AdvChartView3D1.Series[0].Values.Fill.Color      := clWhite;
   AdvChartView3D1.Series[0].Values.Fill.EndColor   := clWhite;
   AdvChartView3D1.Series[0].Items.Clear;

   with cdsAnalise do begin
      First;
      i:= 0;
      while not Eof do begin
         i:= i + 1;
         with AdvChartView3D1.Series[0].Items.Add do begin
            Caption := FieldByName('tipo').AsString;
            Value   := FieldByName('qtd').AsInteger;
            Color   := RGB(Random(255), Random(255), Random(255));
            //Image.LoadFromFile(ExtractFilePath(Application.ExeName) +  '/imagens/logo1.jpg');
//            Image.Height:= 20;
//            Image.Width := 10;
         end;
         Next;
      end;
   end;

   AdvChartView3D1.Series[0].Items[0].Extraction := 30;
//
   TrackBarX.Position := Round(AdvChartView3D1.Series[0].XRotation);
   TrackBarY.Position := Round(AdvChartView3D1.Series[0].YRotation);
   TrackBarZ.Position := Round(AdvChartView3D1.Series[0].ZRotation);
   TrackBarElevacao.Position:= 0;
//  TrackBar6.Position := Round(AdvChartView3D1.Series[0].Depth);
   TrackBarTransp.Position  := 255;
   chkMostrarValores.Checked:= True;
   TrackBarExtracao.Position:= 30;
   TrackBarProfund.Position := 40;
   chkAutoSize.Checked     := False;
   chkImagens.Checked      := True;
//  CheckBox1.Checked := True;
//  CheckBox3.Checked := True;
//  CheckBox4.Checked := True;
   AdvChartView3D1.EndUpdate;
end;

procedure TFormRiscoGrafico.sb1Click(Sender: TObject);
Var
   Html : TStringList;
//Valores, Legenda, Grafico  : String;
Begin
   Html := TStringList.Create;
   Html.Add('<html>');
   Html.Add('     <head>');
   Html.Add('       <!--Load the AJAX API-->');
   Html.Add('       <script type="text/javascript" src="https://www.google.com/jsapi"></script>');
   Html.Add('       <script type="text/javascript">');
   Html.Add('// Load the Visualization API and the piechart package.');
   Html.Add('   google.load("visualization", "1.0", {"packages":["corechart"]});');
   Html.Add('');
   Html.Add('   // Set a callback to run when the Google Visualization API is loaded.');
   Html.Add('   google.setOnLoadCallback(drawChart);');
   Html.Add('');
   Html.Add('   // Callback that creates and populates a data table,');
   Html.Add('   // instantiates the pie chart, passes in the data and');
   Html.Add('   // draws it.');
   Html.Add('   function drawChart() {');
//   Html.Add( ' ' );
//   Valores:= '10,20,30';
////   Valores := Edit1.Text + ',' + Edit2.Text + ',' + Edit3.Text + ',' + Edit4.Text + Edit5.Text +
////   Edit6.Text + ',' + Edit7.Text + ',' + Edit8.Text + ',' + Edit9.Text + ',' + Edit10.Text;
//   Legenda := 'Valor 1|Valor 2|Valor 3';
//   Grafico := 'http://chart.apis.google.com/chart?chs=300x100&chd=t:' + Valores + '&cht=p3&chl=' + Legenda + '"';
////   ShowMessage(Grafico);
//   // http://chart.apis.google.com/chart?chs=500x300&chd=t:10,20,30&cht=p3&chl=asas
//   Html.Add( '<iframe frameborder="0" width="350" height="150" src="' );
//   Html.Add( Grafico );
//   Html.Add( '</iframe>' );
//   Html.Add( ' ' );
//
//   Html.Add( '</body>' );
//   Html.Add( '</html>' );
//   Html.SaveToFile( 'c:\teste2.html' );

//   WB1.Navigate( 'C:/teste2.html');
end;

procedure TFormRiscoGrafico.TrackBarProfundChange(Sender: TObject);
begin
   AdvChartView3D1.Series[0].Depth:= TrackBarProfund.Position;
end;

procedure TFormRiscoGrafico.TrackBarElevacaoChange(Sender: TObject);
begin
   AdvChartView3D1.Series[0].Items[1].Elevation:= TrackBarElevacao.Position;
end;

procedure TFormRiscoGrafico.TrackBarExtracaoChange(Sender: TObject);
begin
   AdvChartView3D1.Series[0].Items[0].Extraction:= TrackBarExtracao.Position;
end;

procedure TFormRiscoGrafico.TrackBarTranspChange(Sender: TObject);
var
  I: Integer;
begin
   AdvChartView3D1.BeginUpdate;
   for I := 0 to AdvChartView3D1.Series[0].Items.Count - 1 do begin
      AdvChartView3D1.Series[0].Items[I].Transparency := TrackBarTransp.Position;
   end;
   AdvChartView3D1.EndUpdate;
end;

procedure TFormRiscoGrafico.TrackBarXChange(Sender: TObject);
begin
   AdvChartView3D1.Series[0].XRotation := TrackBarX.Position;
end;

procedure TFormRiscoGrafico.TrackBarYChange(Sender: TObject);
begin
   AdvChartView3D1.Series[0].YRotation := TrackBarY.Position;
end;

procedure TFormRiscoGrafico.TrackBarZChange(Sender: TObject);
begin
   AdvChartView3D1.Series[0].ZRotation := TrackBarZ.Position;
end;

end.
