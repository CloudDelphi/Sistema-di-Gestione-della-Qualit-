object FormValoresIndicadoresGrafico: TFormValoresIndicadoresGrafico
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gr'#225'fico - Indicador: '
  ClientHeight = 540
  ClientWidth = 1019
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBAdvGDIPChartView1: TDBAdvGDIPChartView
    Left = 320
    Top = 0
    Width = 699
    Height = 468
    ShowDesignHelper = False
    Align = alRight
    Color = clWhite
    Panes = <
      item
        Bands.Distance = 2.000000000000000000
        Background.Font.Charset = DEFAULT_CHARSET
        Background.Font.Color = clWindowText
        Background.Font.Height = -11
        Background.Font.Name = 'Tahoma'
        Background.Font.Style = []
        BorderColor = clBlack
        CrossHair.CrossHairType = chtNone
        CrossHair.CrossHairYValues.Position = [chYAxis]
        CrossHair.Distance = 0
        CrossHair.Visible = True
        Height = 100.000000000000000000
        Legend.Alignment = laTopLeft
        Legend.BackGroundPosition = bpTopRight
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWindowText
        Legend.Font.Height = -11
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        Margin.LeftMargin = 10
        Margin.RightMargin = 10
        Margin.TopMargin = 10
        Name = 'ChartPane 0'
        Options = []
        Range.StartDate = 42174.444806111110000000
        Range.RangeTo = 23
        Series.SerieValueTotals = True
        Series = <
          item
            AutoRange = arCommon
            Pie.ValueFont.Charset = DEFAULT_CHARSET
            Pie.ValueFont.Color = clWindowText
            Pie.ValueFont.Height = -11
            Pie.ValueFont.Name = 'Tahoma'
            Pie.ValueFont.Style = []
            Pie.LegendFont.Charset = DEFAULT_CHARSET
            Pie.LegendFont.Color = clWindowText
            Pie.LegendFont.Height = -11
            Pie.LegendFont.Name = 'Tahoma'
            Pie.LegendFont.Style = []
            Annotations = <>
            Color = 6723891
            CrossHairYValue.BorderWidth = 0
            CrossHairYValue.Font.Charset = DEFAULT_CHARSET
            CrossHairYValue.Font.Color = clWindowText
            CrossHairYValue.Font.Height = -11
            CrossHairYValue.Font.Name = 'Tahoma'
            CrossHairYValue.Font.Style = []
            CrossHairYValue.GradientSteps = 0
            LineColor = clGreen
            LegendText = 'Valores Indicador'
            Marker.MarkerType = mCircle
            Marker.MarkerColor = clGreen
            Marker.MarkerSize = 8
            Marker.MarkerLineWidth = 2
            Maximum = 12.000000000000000000
            Name = 'Valores'
            ShowValue = True
            ValueFont.Charset = DEFAULT_CHARSET
            ValueFont.Color = clWindowText
            ValueFont.Height = -12
            ValueFont.Name = 'Tahoma'
            ValueFont.Style = [fsBold]
            ValueFormat = '%g'
            ValueFormatType = vftFloat
            ValueWidth = 80
            ValueOffsetX = 15
            ValueOffsetY = 10
            XAxis.DateTimeFont.Charset = DEFAULT_CHARSET
            XAxis.DateTimeFont.Color = clWindowText
            XAxis.DateTimeFont.Height = -11
            XAxis.DateTimeFont.Name = 'Tahoma'
            XAxis.DateTimeFont.Style = []
            XAxis.MajorFont.Charset = DEFAULT_CHARSET
            XAxis.MajorFont.Color = clWindowText
            XAxis.MajorFont.Height = -8
            XAxis.MajorFont.Name = 'Tahoma'
            XAxis.MajorFont.Style = [fsBold]
            XAxis.MajorUnit = 1.000000000000000000
            XAxis.MajorUnitSpacing = 0
            XAxis.MinorFont.Charset = DEFAULT_CHARSET
            XAxis.MinorFont.Color = clWindowText
            XAxis.MinorFont.Height = -11
            XAxis.MinorFont.Name = 'Tahoma'
            XAxis.MinorFont.Style = []
            XAxis.MinorUnit = 1.000000000000000000
            XAxis.MinorUnitSpacing = 0
            XAxis.TextTop.Font.Charset = DEFAULT_CHARSET
            XAxis.TextTop.Font.Color = clWindowText
            XAxis.TextTop.Font.Height = -11
            XAxis.TextTop.Font.Name = 'Tahoma'
            XAxis.TextTop.Font.Style = []
            XAxis.TextBottom.Angle = 90
            XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
            XAxis.TextBottom.Font.Color = clWindowText
            XAxis.TextBottom.Font.Height = -9
            XAxis.TextBottom.Font.Name = 'Tahoma'
            XAxis.TextBottom.Font.Style = []
            XAxis.TickMarkSize = 6
            YAxis.MajorFont.Charset = DEFAULT_CHARSET
            YAxis.MajorFont.Color = clWindowText
            YAxis.MajorFont.Height = -11
            YAxis.MajorFont.Name = 'Tahoma'
            YAxis.MajorFont.Style = []
            YAxis.MajorUnit = 1.000000000000000000
            YAxis.MajorUnitSpacing = 0
            YAxis.MinorFont.Charset = DEFAULT_CHARSET
            YAxis.MinorFont.Color = clWindowText
            YAxis.MinorFont.Height = -11
            YAxis.MinorFont.Name = 'Tahoma'
            YAxis.MinorFont.Style = []
            YAxis.MinorUnitSpacing = 0
            YAxis.TextLeft.Angle = -90
            YAxis.TextLeft.Font.Charset = DEFAULT_CHARSET
            YAxis.TextLeft.Font.Color = clWindowText
            YAxis.TextLeft.Font.Height = -11
            YAxis.TextLeft.Font.Name = 'Tahoma'
            YAxis.TextLeft.Font.Style = []
            YAxis.TextRight.Angle = 90
            YAxis.TextRight.Font.Charset = DEFAULT_CHARSET
            YAxis.TextRight.Font.Color = clWindowText
            YAxis.TextRight.Font.Height = -11
            YAxis.TextRight.Font.Name = 'Tahoma'
            YAxis.TextRight.Font.Style = []
            YAxis.TickMarkColor = clRed
            ZeroLine = True
            Darken3D = False
            Offset3D = 10
            BarValueTextFont.Charset = DEFAULT_CHARSET
            BarValueTextFont.Color = clWindowText
            BarValueTextFont.Height = -11
            BarValueTextFont.Name = 'Tahoma'
            BarValueTextFont.Style = []
            XAxisGroups = <>
            SerieType = stNormal
            FieldNameValue = 'ValorGrafico'
            FieldNameXAxis = 'periodo'
          end
          item
            AutoRange = arCommon
            Pie.ValueFont.Charset = DEFAULT_CHARSET
            Pie.ValueFont.Color = clWindowText
            Pie.ValueFont.Height = -11
            Pie.ValueFont.Name = 'Tahoma'
            Pie.ValueFont.Style = []
            Pie.LegendFont.Charset = DEFAULT_CHARSET
            Pie.LegendFont.Color = clWindowText
            Pie.LegendFont.Height = -11
            Pie.LegendFont.Name = 'Tahoma'
            Pie.LegendFont.Style = []
            Annotations = <>
            CrossHairYValue.BorderWidth = 0
            CrossHairYValue.Font.Charset = DEFAULT_CHARSET
            CrossHairYValue.Font.Color = clWindowText
            CrossHairYValue.Font.Height = -11
            CrossHairYValue.Font.Name = 'Tahoma'
            CrossHairYValue.Font.Style = []
            CrossHairYValue.GradientSteps = 0
            LineWidth = 2
            LegendText = 'Meta'
            Marker.MarkerColor = clNone
            Maximum = 12.000000000000000000
            Name = 'Meta'
            ShowValue = True
            ValueFont.Charset = DEFAULT_CHARSET
            ValueFont.Color = clWindowText
            ValueFont.Height = -11
            ValueFont.Name = 'Tahoma'
            ValueFont.Style = []
            ValueFormat = '%g'
            ValueFormatType = vftFloat
            ValueWidth = 80
            XAxis.DateTimeFont.Charset = DEFAULT_CHARSET
            XAxis.DateTimeFont.Color = clWindowText
            XAxis.DateTimeFont.Height = -11
            XAxis.DateTimeFont.Name = 'Tahoma'
            XAxis.DateTimeFont.Style = []
            XAxis.MajorFont.Charset = DEFAULT_CHARSET
            XAxis.MajorFont.Color = clWindowText
            XAxis.MajorFont.Height = -11
            XAxis.MajorFont.Name = 'Tahoma'
            XAxis.MajorFont.Style = []
            XAxis.MajorUnit = 1.000000000000000000
            XAxis.MajorUnitSpacing = 0
            XAxis.MinorFont.Charset = DEFAULT_CHARSET
            XAxis.MinorFont.Color = clWindowText
            XAxis.MinorFont.Height = -11
            XAxis.MinorFont.Name = 'Tahoma'
            XAxis.MinorFont.Style = []
            XAxis.MinorUnit = 1.000000000000000000
            XAxis.MinorUnitSpacing = 0
            XAxis.TextTop.Font.Charset = DEFAULT_CHARSET
            XAxis.TextTop.Font.Color = clWindowText
            XAxis.TextTop.Font.Height = -11
            XAxis.TextTop.Font.Name = 'Tahoma'
            XAxis.TextTop.Font.Style = []
            XAxis.TextBottom.Angle = 90
            XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
            XAxis.TextBottom.Font.Color = clWindowText
            XAxis.TextBottom.Font.Height = -11
            XAxis.TextBottom.Font.Name = 'Tahoma'
            XAxis.TextBottom.Font.Style = []
            XAxis.TickMarkSize = 6
            XAxis.Visible = False
            YAxis.MajorFont.Charset = DEFAULT_CHARSET
            YAxis.MajorFont.Color = clWindowText
            YAxis.MajorFont.Height = -11
            YAxis.MajorFont.Name = 'Tahoma'
            YAxis.MajorFont.Style = []
            YAxis.MajorUnit = 1.000000000000000000
            YAxis.MajorUnitSpacing = 0
            YAxis.MinorFont.Charset = DEFAULT_CHARSET
            YAxis.MinorFont.Color = clWindowText
            YAxis.MinorFont.Height = -11
            YAxis.MinorFont.Name = 'Tahoma'
            YAxis.MinorFont.Style = []
            YAxis.MinorUnitSpacing = 0
            YAxis.TextLeft.Font.Charset = DEFAULT_CHARSET
            YAxis.TextLeft.Font.Color = clWindowText
            YAxis.TextLeft.Font.Height = -11
            YAxis.TextLeft.Font.Name = 'Tahoma'
            YAxis.TextLeft.Font.Style = []
            YAxis.TextRight.Font.Charset = DEFAULT_CHARSET
            YAxis.TextRight.Font.Color = clWindowText
            YAxis.TextRight.Font.Height = -11
            YAxis.TextRight.Font.Name = 'Tahoma'
            YAxis.TextRight.Font.Style = []
            YAxis.Visible = False
            ZeroLine = True
            BarValueTextFont.Charset = DEFAULT_CHARSET
            BarValueTextFont.Color = clWindowText
            BarValueTextFont.Height = -11
            BarValueTextFont.Name = 'Tahoma'
            BarValueTextFont.Style = []
            XAxisGroups = <>
            SerieType = stNormal
            FieldNameValue = 'met_valor'
            FieldNameXAxis = 'periodo'
          end>
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Title.Position = tTop
        Title.Size = 50
        XAxis.AutoSize = True
        XAxis.Font.Charset = DEFAULT_CHARSET
        XAxis.Font.Color = clWindowText
        XAxis.Font.Height = -11
        XAxis.Font.Name = 'Tahoma'
        XAxis.Font.Style = []
        XAxis.Size = 50
        XAxis.Text = 'Per'#237'odo'
        XGrid.MajorFont.Charset = DEFAULT_CHARSET
        XGrid.MajorFont.Color = clWindowText
        XGrid.MajorFont.Height = -11
        XGrid.MajorFont.Name = 'Tahoma'
        XGrid.MajorFont.Style = []
        XGrid.MinorFont.Charset = DEFAULT_CHARSET
        XGrid.MinorFont.Color = clWindowText
        XGrid.MinorFont.Height = -11
        XGrid.MinorFont.Name = 'Tahoma'
        XGrid.MinorFont.Style = []
        YAxis.AutoSize = True
        YAxis.Font.Charset = DEFAULT_CHARSET
        YAxis.Font.Color = clWindowText
        YAxis.Font.Height = -11
        YAxis.Font.Name = 'Tahoma'
        YAxis.Font.Style = []
        YAxis.Size = 40
        YAxis.Text = 'Valores'
        YGrid.MinorDistance = 1.000000000000000000
        YGrid.MajorDistance = 2.000000000000000000
        DataSource = dsValorIndicadores
      end>
    TabOrder = 2
    Tracker.Font.Charset = DEFAULT_CHARSET
    Tracker.Font.Color = clWindowText
    Tracker.Font.Height = -11
    Tracker.Font.Name = 'Tahoma'
    Tracker.Font.Style = []
    Tracker.Title.Font.Charset = DEFAULT_CHARSET
    Tracker.Title.Font.Color = clWindowText
    Tracker.Title.Font.Height = -11
    Tracker.Title.Font.Name = 'Tahoma'
    Tracker.Title.Font.Style = []
    Tracker.Title.Text = 'TRACKER'
    Version = '3.2.6.0 MAY, 2015'
    XAxisZoomSensitivity = 1.000000000000000000
    YAxisZoomSensitivity = 1.000000000000000000
    DoubleBuffered = True
    object pnlTitulo1: TPanel
      Left = 0
      Top = 1
      Width = 699
      Height = 22
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlTitulo2: TPanel
      Left = 0
      Top = 19
      Width = 699
      Height = 22
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object DBAdvGDIPChartView2: TDBAdvGDIPChartView
    Left = 0
    Top = 0
    Width = 321
    Height = 468
    ShowDesignHelper = False
    Align = alLeft
    Color = clWhite
    Panes = <
      item
        Bands.Distance = 2.000000000000000000
        Background.Font.Charset = DEFAULT_CHARSET
        Background.Font.Color = clWindowText
        Background.Font.Height = -11
        Background.Font.Name = 'Tahoma'
        Background.Font.Style = []
        BorderColor = clBlack
        CrossHair.CrossHairType = chtNone
        CrossHair.CrossHairYValues.Position = [chYAxis]
        CrossHair.Distance = 0
        CrossHair.Visible = True
        Height = 100.000000000000000000
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWindowText
        Legend.Font.Height = -11
        Legend.Font.Name = 'Tahoma'
        Legend.Font.Style = []
        Legend.Visible = False
        Legend.Angle = 45
        Margin.LeftMargin = 10
        Margin.RightMargin = 10
        Margin.TopMargin = 10
        Name = 'ChartPane 0'
        Options = []
        Range.StartDate = 42174.444806111110000000
        Range.RangeTo = 23
        Series.SerieValueTotals = True
        Series = <
          item
            AutoRange = arCommon
            Pie.ValueFont.Charset = DEFAULT_CHARSET
            Pie.ValueFont.Color = clWindowText
            Pie.ValueFont.Height = -11
            Pie.ValueFont.Name = 'Tahoma'
            Pie.ValueFont.Style = []
            Pie.LegendFont.Charset = DEFAULT_CHARSET
            Pie.LegendFont.Color = clWindowText
            Pie.LegendFont.Height = -11
            Pie.LegendFont.Name = 'Tahoma'
            Pie.LegendFont.Style = []
            Pie.LegendTitleVisible = True
            Annotations = <>
            ChartType = ctBar
            Color = 16737843
            CrossHairYValue.BorderWidth = 0
            CrossHairYValue.Font.Charset = DEFAULT_CHARSET
            CrossHairYValue.Font.Color = clWindowText
            CrossHairYValue.Font.Height = -11
            CrossHairYValue.Font.Name = 'Tahoma'
            CrossHairYValue.Font.Style = []
            CrossHairYValue.GradientSteps = 0
            LineColor = clGreen
            LegendText = 'M'#233'dia Indicadores'
            Marker.MarkerColor = clGreen
            Marker.MarkerSize = 8
            Marker.MarkerLineWidth = 2
            Marker.GradientType = gtTexture
            Maximum = 12.000000000000000000
            Name = 'Indicadores'
            ShowValue = True
            ValueFont.Charset = DEFAULT_CHARSET
            ValueFont.Color = clWindowText
            ValueFont.Height = -12
            ValueFont.Name = 'Tahoma'
            ValueFont.Style = [fsBold]
            ValueFormat = '%g'
            ValueFormatType = vftFloat
            ValueWidth = 80
            ValueOffsetX = -40
            ValueOffsetY = 10
            XAxis.DateTimeFont.Charset = DEFAULT_CHARSET
            XAxis.DateTimeFont.Color = clWindowText
            XAxis.DateTimeFont.Height = -11
            XAxis.DateTimeFont.Name = 'Tahoma'
            XAxis.DateTimeFont.Style = []
            XAxis.MajorFont.Charset = DEFAULT_CHARSET
            XAxis.MajorFont.Color = clWindowText
            XAxis.MajorFont.Height = -13
            XAxis.MajorFont.Name = 'Tahoma'
            XAxis.MajorFont.Style = [fsBold]
            XAxis.MajorUnit = 1.000000000000000000
            XAxis.MajorUnitSpacing = 0
            XAxis.MinorFont.Charset = DEFAULT_CHARSET
            XAxis.MinorFont.Color = clWindowText
            XAxis.MinorFont.Height = -11
            XAxis.MinorFont.Name = 'Tahoma'
            XAxis.MinorFont.Style = []
            XAxis.MinorUnit = 1.000000000000000000
            XAxis.MinorUnitSpacing = 0
            XAxis.TextTop.Font.Charset = DEFAULT_CHARSET
            XAxis.TextTop.Font.Color = clWindowText
            XAxis.TextTop.Font.Height = -11
            XAxis.TextTop.Font.Name = 'Tahoma'
            XAxis.TextTop.Font.Style = []
            XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
            XAxis.TextBottom.Font.Color = clWindowText
            XAxis.TextBottom.Font.Height = -9
            XAxis.TextBottom.Font.Name = 'Tahoma'
            XAxis.TextBottom.Font.Style = []
            XAxis.TickMarkSize = 6
            YAxis.MajorFont.Charset = DEFAULT_CHARSET
            YAxis.MajorFont.Color = clWindowText
            YAxis.MajorFont.Height = -11
            YAxis.MajorFont.Name = 'Tahoma'
            YAxis.MajorFont.Style = []
            YAxis.MajorUnit = 1.000000000000000000
            YAxis.MajorUnitSpacing = 0
            YAxis.MinorFont.Charset = DEFAULT_CHARSET
            YAxis.MinorFont.Color = clWindowText
            YAxis.MinorFont.Height = -11
            YAxis.MinorFont.Name = 'Tahoma'
            YAxis.MinorFont.Style = []
            YAxis.MinorUnitSpacing = 0
            YAxis.TextLeft.Angle = -90
            YAxis.TextLeft.Font.Charset = DEFAULT_CHARSET
            YAxis.TextLeft.Font.Color = clWindowText
            YAxis.TextLeft.Font.Height = -11
            YAxis.TextLeft.Font.Name = 'Tahoma'
            YAxis.TextLeft.Font.Style = []
            YAxis.TextRight.Angle = 90
            YAxis.TextRight.Font.Charset = DEFAULT_CHARSET
            YAxis.TextRight.Font.Color = clWindowText
            YAxis.TextRight.Font.Height = -11
            YAxis.TextRight.Font.Name = 'Tahoma'
            YAxis.TextRight.Font.Style = []
            YAxis.TickMarkColor = clRed
            ZeroLine = True
            Darken3D = False
            Offset3D = 10
            BarValueTextFont.Charset = DEFAULT_CHARSET
            BarValueTextFont.Color = clWindowText
            BarValueTextFont.Height = -11
            BarValueTextFont.Name = 'Tahoma'
            BarValueTextFont.Style = []
            XAxisGroups = <>
            SerieType = stNormal
            FieldNameValue = 'MediaIndicador'
            FieldNameXAxis = 'Ano'
          end>
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Calibri'
        Title.Font.Style = [fsBold]
        Title.Position = tTop
        Title.Text = 'M'#201'DIA DOS ANOS ANTERIORES'
        XAxis.AutoSize = True
        XAxis.Font.Charset = DEFAULT_CHARSET
        XAxis.Font.Color = clBlack
        XAxis.Font.Height = -11
        XAxis.Font.Name = 'Tahoma'
        XAxis.Font.Style = []
        XAxis.Size = 50
        XAxis.Text = 'Anos'
        XGrid.MajorFont.Charset = DEFAULT_CHARSET
        XGrid.MajorFont.Color = clWindowText
        XGrid.MajorFont.Height = -11
        XGrid.MajorFont.Name = 'Tahoma'
        XGrid.MajorFont.Style = []
        XGrid.MinorFont.Charset = DEFAULT_CHARSET
        XGrid.MinorFont.Color = clWindowText
        XGrid.MinorFont.Height = -11
        XGrid.MinorFont.Name = 'Tahoma'
        XGrid.MinorFont.Style = []
        YAxis.AutoSize = True
        YAxis.Font.Charset = DEFAULT_CHARSET
        YAxis.Font.Color = clWindowText
        YAxis.Font.Height = -11
        YAxis.Font.Name = 'Tahoma'
        YAxis.Font.Style = []
        YAxis.Size = 40
        YAxis.Text = 'M'#233'dia'
        YAxis.Offset3D = 0
        YGrid.MinorDistance = 1.000000000000000000
        YGrid.MajorDistance = 2.000000000000000000
        DataSource = dsMedias
      end>
    TabOrder = 1
    Tracker.Font.Charset = DEFAULT_CHARSET
    Tracker.Font.Color = clWindowText
    Tracker.Font.Height = -11
    Tracker.Font.Name = 'Tahoma'
    Tracker.Font.Style = []
    Tracker.Title.Font.Charset = DEFAULT_CHARSET
    Tracker.Title.Font.Color = clWindowText
    Tracker.Title.Font.Height = -11
    Tracker.Title.Font.Name = 'Tahoma'
    Tracker.Title.Font.Style = []
    Tracker.Title.Text = 'TRACKER'
    Version = '3.2.6.0 MAY, 2015'
    XAxisZoomSensitivity = 1.000000000000000000
    YAxisZoomSensitivity = 1.000000000000000000
    DoubleBuffered = True
    ExplicitLeft = 16
    ExplicitTop = 10
  end
  object pnl2: TPanel
    Left = 0
    Top = 468
    Width = 1019
    Height = 72
    Align = alBottom
    TabOrder = 0
    object btnSair: TBitBtn
      Left = 945
      Top = 1
      Width = 73
      Height = 70
      Hint = 'Clique para sair'
      Align = alRight
      Caption = 'Sair'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9E5FC89AEF44F87EF2C6FEC2369
        EB2C6FEC4F87EF89AEF4D9E5FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E6B3B1B18D8B8A
        777473716E6D7774738D8B8AB3B1B1E6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6EEFD6A
        99F12369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB6A99F1
        E6EEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEFEFEE9F9D9C716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D9F9D9CEFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC6D8FA3273EC2369EB2369EB2369EB2A6EEC4F87EF6495
        F14F87EF2A6EEC2369EB2369EB2369EB3273ECC6D8FAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD9D97A7877716E6D716E6D716E6D757372
        8D8B8A9B99988D8B8A757372716E6D716E6D716E6D7A7877DAD9D9FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5D8FA276CEB2369EB23
        69EB3E7BEDADC7F8F5F8FEFFFFFFFFFFFFFFFFFFF5F8FEADC7F83E7BED2369EB
        2369EB276CEBC5D8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD9D97471
        70716E6D716E6D82807FCAC9C9F8F8F8FFFFFFFFFFFFFFFFFFF8F8F8CAC9C982
        807F716E6D716E6D747170DAD9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE8EFFD3374EC2369EB2369EB75A1F2F7FAFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF7FAFE76A1F32369EB2369EB3374ECE8EFFDFFFFFFFF
        FFFFFFFFFFFFFFFFF0F0F07B7877716E6D716E6DA6A4A3FAFAFAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAA6A5A4716E6D716E6D7B7877F0F0
        F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6C9BF22369EB2369EB709DF2FE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
        709DF22369EB2369EB6C9BF2FFFFFFFFFFFFFFFFFFFFFFFFA09E9E716E6D716E
        6DA3A1A0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEA3A1A0716E6D716E6DA09E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DDE8FC2369EB2369EB3F7CEEF6F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F9FE3F7CEE2369EB2369EBDDE8FCFF
        FFFFFFFFFFE9E9E9716E6D716E6D83807FF9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F983807F716E6D716E
        6DE9E9E9FFFFFFFFFFFFFFFFFFFFFFFF8BB0F42369EB2369EBABC6F7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFABC6F72369EB2369EB8BB0F4FFFFFFFFFFFFB4B2B2716E6D716E6DC9C8
        C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC9C8C7716E6D716E6DB4B2B2FFFFFFFFFFFFFFFFFFFFFFFF
        5188EF2369EB286DEBF5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE286DEB2369EB5188EFFF
        FFFFFFFFFF8F8C8B716E6D747170F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8747170716E
        6D8F8C8BFFFFFFFFFFFFFFFFFFFFFFFF2D70EC2369EB5289EFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF5289EF2369EB2D70ECFFFFFFFFFFFF787574716E6D908D8CFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF908D8C716E6D787574FFFFFFFFFFFFFFFFFFFFFFFF
        2369EB2369EB6797F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FA
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6797F12369EB2369EBFF
        FFFFFFFFFF716E6D716E6D9D9B9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9B9A716E
        6D716E6DFFFFFFFFFFFFFFFFFFFFFFFF266BEB2369EB6596F1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF709DF22369EB6294F1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF6596F12369EB266BEBFFFFFFFFFFFF73706F716E6D9B9999FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A1A0716E6D9A9897FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9B9999716E6D73706FFFFFFFFFFFFFFFFFFFFFFFFF
        3B79ED2369EB447FEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2369EB2369
        EB2369EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF447FEE2369EB3B79EDFF
        FFFFFFFFFF817E7D716E6D868483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        716E6D716E6D716E6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868483716E
        6D817E7DFFFFFFFFFFFFFFFFFFFFFFFF6B9AF22369EB2369EBE0EAFCFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF2369EB2369EB2369EBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE0EAFC2369EB2369EB6B9AF2FFFFFFFFFFFF9F9D9D716E6D716E6DEBEB
        EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF716E6D716E6D716E6DFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEBEBEA716E6D716E6D9F9D9DFFFFFFFFFFFFFFFFFFFFFFFF
        AFC8F82369EB2369EB82AAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2369EB2369
        EB2369EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF82AAF42369EB2369EBAFC8F8FF
        FFFFFFFFFFCBCACA716E6D716E6DAEADACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        716E6D716E6D716E6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEADAC716E6D716E
        6DCBCACAFFFFFFFFFFFFFFFFFFFFFFFFF6F9FE3676ED2369EB266BEBD2E0FBFF
        FFFFFFFFFFFFFFFFFFFFFF2369EB2369EB2369EBFFFFFFFFFFFFFFFFFFFFFFFF
        D2E0FB266BEB2369EB3676EDF6F9FEFFFFFFFFFFFFF9F9F97D7B7A716E6D7370
        6FE2E1E1FFFFFFFFFFFFFFFFFFFFFFFF716E6D716E6D716E6DFFFFFFFFFFFFFF
        FFFFFFFFFFE2E1E173706F716E6D7D7B7AF9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA6C2F72369EB2369EB3A79EDE0EAFCFFFFFFFFFFFFFFFFFF2369EB2369
        EB2369EBFFFFFFFFFFFFFFFFFFE0EAFC3A79ED2369EB2369EBA6C2F7FFFFFFFF
        FFFFFFFFFFFFFFFFC6C4C4716E6D716E6D807D7CEBEBEAFFFFFFFFFFFFFFFFFF
        716E6D716E6D716E6DFFFFFFFFFFFFFFFFFFEBEBEA807D7C716E6D716E6DC6C4
        C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF6596F12369EB2369EB33
        74ECC3D6FAFFFFFFFFFFFF2369EB2369EB2369EBFFFFFFFFFFFFC3D6FA3374EC
        2369EB2369EB6596F1FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE9C9A99716E
        6D716E6D7C7978D8D7D7FFFFFFFFFFFF716E6D716E6D716E6DFFFFFFFFFFFFD8
        D7D77C7978716E6D716E6D9C9A99FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF6F9FE5B8FF02369EB2369EB276CEBDBE6FCFFFFFF2369EB2369
        EB2369EBFFFFFFDBE6FC276CEB2369EB2369EB5B8FF0F6F9FEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF9F9F9959392716E6D716E6D747170E8E7E7FFFFFF
        716E6D716E6D716E6DFFFFFFE8E7E7747170716E6D716E6D959392F9F9F9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FAFE7CA6F323
        69EB2369EB89AEF4FFFFFF2369EB2369EB2369EBFFFFFF89AEF42369EB2369EB
        7CA6F3F7FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
        FAAAA9A8716E6D716E6DB3B1B1FFFFFF716E6D716E6D716E6DFFFFFFB3B1B171
        6E6D716E6DAAA9A8FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBDCFA6898F1B3CBF8FFFFFF2369EB2369
        EB2369EBFFFFFFB3CBF86898F1CBDCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDDDD9E9B9BCECDCDFFFFFF
        716E6D716E6D716E6DFFFFFFCECDCD9E9B9BDEDDDDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF2369EB2369EB2369EBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF716E6D716E6D716E6DFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2369EB2369
        EB2369EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        716E6D716E6D716E6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF77A2F3266BEB6999F1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A5A573706F9E9C9BFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSairClick
    end
    object AdvChartTypeSelector1: TAdvChartTypeSelector
      Left = 122
      Top = 16
      Width = 100
      Height = 41
      Hint = 'Gr'#225'fico de Barras'
      ChartType = ctBar
      ColorDown = clNone
      ColorHot = clNone
      Color = clNone
      ColorToDown = clNone
      ColorToHot = clNone
      ColorTo = clNone
      GradientDirection = cgdVertical
      GradientSteps = 32
      OnMouseDown = AdvChartTypeSelector1MouseDown
      ShowHint = True
    end
    object AdvChartTypeSelector2: TAdvChartTypeSelector
      Left = 16
      Top = 16
      Width = 100
      Height = 41
      Hint = 'Gr'#225'fico de Linha'
      ChartType = ctLine
      ColorDown = clNone
      ColorHot = clNone
      Color = clNone
      ColorToDown = clNone
      ColorToHot = clNone
      ColorTo = clNone
      GradientDirection = cgdVertical
      GradientSteps = 32
      OnMouseDown = AdvChartTypeSelector1MouseDown
      ShowHint = True
    end
    object AdvChartTypeSelector3: TAdvChartTypeSelector
      Left = 228
      Top = 16
      Width = 100
      Height = 41
      Hint = 'Gr'#225'fico de Linha e Barra'
      ChartType = ctLineBar
      ColorDown = clNone
      ColorHot = clNone
      Color = clNone
      ColorToDown = clNone
      ColorToHot = clNone
      ColorTo = clNone
      GradientDirection = cgdVertical
      GradientSteps = 32
      OnMouseDown = AdvChartTypeSelector1MouseDown
      ShowHint = True
    end
    object btnImprimir: TBitBtn
      Left = 872
      Top = 1
      Width = 73
      Height = 70
      Hint = 'Clique para imprimir'
      Align = alRight
      Caption = '&Imprimir'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF83AAF42369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB83AAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFADAD716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6DAFADADFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83AAF433
        74ECACC7F7ACC7F7ACC7F7ACC7F7ACC7F7ACC7F7ACC7F7ACC7F73374EC83AAF4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFAFADAD7C7978CAC8C8CAC8C8CAC8C8CAC8C8CAC8C8CAC8C8CAC8C8CA
        C8C87C7978AFADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF83AAF43374ECACC7F7ACC7F7ACC7F7ACC7F7ACC7
        F7ACC7F7ACC7F7ACC7F73374EC83AAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFADAD7C7978CAC8C8CAC8C8
        CAC8C8CAC8C8CAC8C8CAC8C8CAC8C8CAC8C87C7978AFADADFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFFF1F6FEFDFEFF83AAF423
        69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB83AAF4
        FCFDFFF1F6FEFBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6
        F6FEFEFEAFADAD716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6DAFADADFDFDFDF6F6F6FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFF2F6FE
        6B9AF2256AEB2369EBE3ECFC83AAF43E7BEDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF3E7BED83AAF4D6E3FB2369EB256AEB6B9AF2F2F6FEFF
        FFFFFFFFFFF7F6F6A09E9D726F6E716E6DEDEDEDAFADAD82807FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF82807FAFADADE4E4E4716E6D726F
        6EA09E9DF7F6F6FFFFFFFFFFFF6797F12369EB2369EB2369EBE3ECFC83AAF42B
        6EEC6797F16797F16797F16797F16797F16797F16797F16797F12B6EEC83AAF4
        D6E3FB2369EB2369EB2369EB6797F1FFFFFFFFFFFF9D9B9A716E6D716E6D716E
        6DEDEDEDAFADAD7673729D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D
        9B9A767372AFADADE4E4E4716E6D716E6D716E6D9D9B9AFFFFFFFFFFFF246AEB
        2369EB2369EB2369EBE3ECFCAAC5F76797F16797F16797F16797F16797F16797
        F16797F16797F16797F16797F1AAC5F7D6E3FB2369EB2369EB2369EB246AEBFF
        FFFFFFFFFF726F6E716E6D716E6D716E6DEDEDEDC8C7C69D9B9A9D9B9A9D9B9A
        9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9AC8C7C6E4E4E4716E6D716E
        6D716E6D726F6EFFFFFFFFFFFF2369EB2369EB2369EB2369EBE3ECFCFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D6E3FB2369EB2369EB2369EB2369EBFFFFFFFFFFFF716E6D716E6D716E6D716E
        6DEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE4E4E4716E6D716E6D716E6D716E6DFFFFFFFFFFFF2369EB
        2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EBFF
        FFFFFFFFFF716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E
        6D716E6D716E6DFFFFFFFFFFFF2369EB2369EB2369EB2369EB2369EB2369EB23
        69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB
        2369EB2369EB2369EB2369EB2369EBFFFFFFFFFFFF716E6D716E6D716E6D716E
        6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6DFFFFFFFFFFFF2369EB
        2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EBFF
        FFFFFFFFFF716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E
        6D716E6D716E6DFFFFFFFFFFFF2369EB2369EB2369EB2369EB2369EB2369EB23
        69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB
        2369EB2369EB2369EB2369EB2369EBFFFFFFFFFFFF716E6D716E6D716E6D716E
        6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6DFFFFFFFFFFFF2369EB
        2369EB2369EB2369EBE3ECFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6E3FB2369EB2369EB2369EB2369EBFF
        FFFFFFFFFF716E6D716E6D716E6D716E6DEDEDEDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4716E6D716E
        6D716E6D716E6DFFFFFFFFFFFF246AEB2369EB2369EB2369EBE3ECFCAAC5F767
        97F16797F16797F16797F16797F16797F16797F16797F16797F16797F1AAC5F7
        D6E3FB2369EB2369EB2369EB246AEBFFFFFFFFFFFF726F6E716E6D716E6D716E
        6DEDEDEDC8C7C69D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D9B9A9D
        9B9A9D9B9AC8C7C6E4E4E4716E6D716E6D716E6D726F6EFFFFFFFFFFFF6797F1
        2369EB2369EB2369EBE3ECFC83AAF42369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB83AAF4D6E3FB2369EB2369EB2369EB6797F1FF
        FFFFFFFFFF9D9B9A716E6D716E6D716E6DEDEDEDAFADAD716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6DAFADADE4E4E4716E6D716E
        6D716E6D9D9B9AFFFFFFFFFFFFF2F6FE6B9AF2256AEB2369EBE3ECFC83AAF423
        69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB83AAF4
        D6E3FB2369EB256AEB6B9AF2F2F6FEFFFFFFFFFFFFF7F6F6A09E9D726F6E716E
        6DEDEDEDAFADAD716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6DAFADADE4E4E4716E6D726F6EA09E9DF7F6F6FFFFFFFFFFFFFFFFFF
        FFFFFFFBFCFFF1F6FEFDFEFF83AAF42369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB83AAF4FCFDFFF1F6FEFBFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFCFCFCF6F6F6FEFEFEAFADAD716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6DAFADADFDFDFDF6F6F6FCFC
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83AAF423
        69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB83AAF4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFAFADAD716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6DAFADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF83AAF42369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB83AAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFADAD716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6DAFADADFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83AAF423
        69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB83AAF4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFAFADAD716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6DAFADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnImprimirClick
    end
    object rgPosicaoLegenda: TRadioGroup
      Left = 440
      Top = 0
      Width = 265
      Height = 68
      Caption = 'Posi'#231#227'o da Legenda'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Esquerda'
        'Centro'
        'Direita')
      TabOrder = 5
      OnClick = rgPosicaoLegendaClick
    end
  end
  object spdSalvar: TSavePictureDialog
    Filter = 
      'All (*.cur;*.pcx;*.ani;*.png;*.gif;*.gif;*.png;*.jpg;*.jpeg;*.bm' +
      'p;*.tif;*.tiff;*.ico;*.emf;*.wmf)|*.cur;*.pcx;*.ani;*.png;*.gif;' +
      '*.gif;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wmf|Cu' +
      'rsor files (*.cur)|*.cur|PCX Image (*.pcx)|*.pcx|ANI Image (*.an' +
      'i)|*.ani|PNG graphics from DevExpress (*.png)|*.png|CompuServe G' +
      'IF Image (*.gif)|*.gif|GIF Image (*.gif)|*.gif|Portable Network ' +
      'Graphics (*.png)|*.png|JPEG Image File (*.jpg)|*.jpg|JPEG Image ' +
      'File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp|TIFF Images (*.tif)|*' +
      '.tif|TIFF Images (*.tiff)|*.tiff|Icons (*.ico)|*.ico|Enhanced Me' +
      'tafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf'
    Left = 352
    Top = 296
  end
  object zqryValorIndicadores: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT V.codi_ind, V.codi_vin, V.obse_vin, V.peri_vin, V.proc_vi' +
        'n, V.valo_vin, V.sequ_vin, V.vin_arquivo, I.ind_metodologia, '
      'M.met_valor, M.met_anomes, M.met_unidade'
      'FROM valor_indicador V'
      'INNER JOIN indicadores I ON I.codi_ind = V.codi_ind'
      
        'INNER JOIN indicadores_metas M ON M.met_codindicador = V.codi_in' +
        'd')
    Params = <>
    Left = 704
    Top = 224
  end
  object dspValorIndicadores: TDataSetProvider
    DataSet = zqryValorIndicadores
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 744
    Top = 224
  end
  object cdsValorIndicadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValorIndicadores'
    OnCalcFields = cdsValorIndicadoresCalcFields
    Left = 784
    Top = 224
    object cdsValorIndicadorescodi_ind: TLargeintField
      FieldName = 'codi_ind'
    end
    object cdsValorIndicadorescodi_vin: TLargeintField
      FieldName = 'codi_vin'
      Required = True
    end
    object cdsValorIndicadoresperi_vin: TLargeintField
      FieldName = 'peri_vin'
    end
    object cdsValorIndicadoresproc_vin: TLargeintField
      FieldName = 'proc_vin'
    end
    object cdsValorIndicadoresvalo_vin: TFloatField
      FieldName = 'valo_vin'
      DisplayFormat = '###,###,##0.000000'
    end
    object cdsValorIndicadoresextMes: TStringField
      FieldKind = fkCalculated
      FieldName = 'extMes'
      Size = 10
      Calculated = True
    end
    object cdsValorIndicadoresano: TStringField
      FieldKind = fkCalculated
      FieldName = 'ano'
      Size = 4
      Calculated = True
    end
    object cdsValorIndicadoresperiodo: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'periodo'
      Size = 15
      Calculated = True
    end
    object cdsValorIndicadoresValor: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Valor'
      Calculated = True
    end
    object cdsValorIndicadoresValorGrafico: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ValorGrafico'
      Calculated = True
    end
    object cdsValorIndicadoresanomes: TStringField
      FieldKind = fkCalculated
      FieldName = 'anomes'
      Size = 6
      Calculated = True
    end
    object cdsValorIndicadoresdescInd: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_ind'
      Size = 80
      Calculated = True
    end
    object cdsValorIndicadoresobse_vin: TWideMemoField
      FieldName = 'obse_vin'
      BlobType = ftWideMemo
    end
    object cdsValorIndicadoresvin_arquivo: TWideStringField
      FieldName = 'vin_arquivo'
      Size = 250
    end
    object cdsValorIndicadoresind_metodologia: TWideMemoField
      FieldName = 'ind_metodologia'
      BlobType = ftWideMemo
    end
    object cdsValorIndicadoresmet_valor: TFloatField
      FieldName = 'met_valor'
    end
    object cdsValorIndicadoresmet_anomes: TWideStringField
      FieldName = 'met_anomes'
      Required = True
      Size = 6
    end
    object cdsValorIndicadoresmet_unidade: TWideStringField
      FieldName = 'met_unidade'
      Size = 50
    end
  end
  object dsValorIndicadores: TDataSource
    DataSet = cdsValorIndicadores
    Left = 824
    Top = 224
  end
  object dlgPntSet1: TPrinterSetupDialog
    Left = 288
    Top = 296
  end
  object zqryMedias: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT SUBSTR(CAST(peri_vin as varchar), 1, 4) as Ano, AVG(valo_' +
        'vin) as MediaIndicador'
      'FROM valor_indicador'
      
        'WHERE codi_ind = 1 AND SUBSTR(CAST(peri_vin as varchar), 1, 4) >' +
        ' CAST(EXTRACT(YEAR FROM current_date) -3 AS VARCHAR)'
      'GROUP BY SUBSTR(CAST(peri_vin as varchar), 1, 4)'
      'ORDER BY SUBSTR(CAST(peri_vin as varchar), 1, 4)')
    Params = <>
    Left = 96
    Top = 232
  end
  object dspMedias: TDataSetProvider
    DataSet = zqryMedias
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 232
  end
  object cdsMedias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMedias'
    OnCalcFields = cdsValorIndicadoresCalcFields
    Left = 176
    Top = 232
    object cdsMediasano: TWideMemoField
      FieldName = 'ano'
      ReadOnly = True
      OnGetText = cdsMediasanoGetText
      BlobType = ftWideMemo
    end
    object cdsMediasmediaindicador: TFloatField
      FieldName = 'mediaindicador'
      ReadOnly = True
    end
  end
  object dsMedias: TDataSource
    DataSet = cdsMedias
    Left = 216
    Top = 232
  end
  object zqryMediasFinais: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 96
    Top = 288
  end
  object dspMediasFinais: TDataSetProvider
    DataSet = zqryMediasFinais
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 136
    Top = 288
  end
  object cdsMediasFinais: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMediasFinais'
    OnCalcFields = cdsValorIndicadoresCalcFields
    Left = 176
    Top = 288
    object WideMemoField1: TWideMemoField
      FieldName = 'ano'
      ReadOnly = True
      OnGetText = cdsMediasanoGetText
      BlobType = ftWideMemo
    end
    object FloatField1: TFloatField
      FieldName = 'mediaindicador'
      ReadOnly = True
    end
  end
  object dsMediasFinais: TDataSource
    DataSet = cdsMediasFinais
    Left = 216
    Top = 288
  end
end
