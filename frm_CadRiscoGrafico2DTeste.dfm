object FormRiscoGrafico2DTeste: TFormRiscoGrafico2DTeste
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gr'#225'ficos - An'#225'lise de Risco'
  ClientHeight = 675
  ClientWidth = 974
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 203
    Height = 675
    Align = alLeft
    TabOrder = 0
    object grp1: TGroupBox
      Left = 10
      Top = 37
      Width = 185
      Height = 124
      Caption = 'Rota'#231#227'o'
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 24
        Width = 10
        Height = 13
        Caption = 'X:'
      end
      object lbl2: TLabel
        Left = 16
        Top = 55
        Width = 10
        Height = 13
        Caption = 'Y:'
      end
      object lbl3: TLabel
        Left = 16
        Top = 86
        Width = 10
        Height = 13
        Caption = 'Z:'
      end
      object TrackBarX: TTrackBar
        Left = 35
        Top = 19
        Width = 145
        Height = 25
        Max = 360
        Min = -360
        TabOrder = 0
      end
      object TrackBarY: TTrackBar
        Left = 35
        Top = 50
        Width = 145
        Height = 25
        Max = 360
        Min = -360
        TabOrder = 1
      end
      object TrackBarZ: TTrackBar
        Left = 35
        Top = 81
        Width = 145
        Height = 25
        Max = 360
        Min = -360
        TabOrder = 2
      end
    end
    object grp2: TGroupBox
      Left = 8
      Top = 167
      Width = 187
      Height = 154
      Caption = 'Apar'#234'ncia'
      TabOrder = 1
      object lbl4: TLabel
        Left = 18
        Top = 93
        Width = 72
        Height = 13
        Caption = 'Transpar'#234'ncia:'
      end
      object chkPercentual: TCheckBox
        Left = 18
        Top = 24
        Width = 151
        Height = 17
        Caption = 'Mostrar Percentual'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkMostrarValores: TCheckBox
        Left = 18
        Top = 47
        Width = 151
        Height = 17
        Caption = 'Mostrar Valores'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkImagens: TCheckBox
        Left = 18
        Top = 70
        Width = 151
        Height = 17
        Caption = 'Mostrar Imagens'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object TrackBarTransp: TTrackBar
        Left = 26
        Top = 112
        Width = 145
        Height = 25
        Max = 255
        Position = 255
        TabOrder = 3
      end
    end
    object grp3: TGroupBox
      Left = 8
      Top = 326
      Width = 187
      Height = 211
      Caption = 'Layout'
      TabOrder = 2
      object lbl5: TLabel
        Left = 18
        Top = 53
        Width = 47
        Height = 13
        Caption = 'Extra'#231#227'o:'
      end
      object lbl6: TLabel
        Left = 18
        Top = 104
        Width = 47
        Height = 13
        Caption = 'Eleva'#231#227'o:'
      end
      object lbl7: TLabel
        Left = 18
        Top = 157
        Width = 68
        Height = 13
        Caption = 'Profundidade:'
      end
      object chkAutoSize: TCheckBox
        Left = 18
        Top = 23
        Width = 151
        Height = 17
        Caption = 'Tamanho Autom'#225'tico'
        TabOrder = 0
      end
      object TrackBarElevacao: TTrackBar
        Left = 26
        Top = 123
        Width = 145
        Height = 25
        Max = 200
        Min = -200
        TabOrder = 1
      end
      object TrackBarExtracao: TTrackBar
        Left = 26
        Top = 72
        Width = 145
        Height = 25
        Max = 200
        TabOrder = 2
      end
      object TrackBarProfund: TTrackBar
        Left = 26
        Top = 176
        Width = 145
        Height = 25
        Max = 200
        TabOrder = 3
      end
    end
    object grp4: TGroupBox
      Left = 10
      Top = 543
      Width = 187
      Height = 66
      Caption = 'Intera'#231#227'o'
      TabOrder = 3
      object chkInteracao: TCheckBox
        Left = 18
        Top = 25
        Width = 70
        Height = 17
        Caption = 'Habilitada'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object btn1: TButton
        Left = 87
        Top = 21
        Width = 92
        Height = 25
        Caption = 'Controles Mouse'
        TabOrder = 1
        OnClick = btn1Click
      end
    end
    object btnCores: TButton
      Left = 10
      Top = 6
      Width = 187
      Height = 25
      Caption = 'Cores Aleat'#243'rias'
      TabOrder = 4
      OnClick = btnCoresClick
    end
    object btnPadrao: TButton
      Left = 10
      Top = 615
      Width = 187
      Height = 25
      Caption = 'Voltar aos valores padr'#227'o'
      TabOrder = 5
      OnClick = btnPadraoClick
    end
    object btn4: TButton
      Left = 10
      Top = 643
      Width = 187
      Height = 25
      Caption = 'Salvar como imagem...'
      TabOrder = 6
      OnClick = btn4Click
    end
  end
  object pnl2: TPanel
    Left = 203
    Top = 603
    Width = 771
    Height = 72
    TabOrder = 1
    object btnSair: TBitBtn
      Left = 697
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
  end
  object AdvGDIPChartView1: TAdvGDIPChartView
    Left = 201
    Top = -138
    Width = 771
    Height = 675
    ShowDesignHelper = False
    Color = clWhite
    Panes = <
      item
        AxisMode = amYAxisFullHeight
        Bands.Distance = 2.000000000000000000
        Bands.GradientDirection = cgdVertical
        Background.Font.Charset = DEFAULT_CHARSET
        Background.Font.Color = clWindowText
        Background.Font.Height = -11
        Background.Font.Name = 'Tahoma'
        Background.Font.Style = []
        BorderColor = clBlack
        CrossHair.CrossHairYValues.Position = [chYAxis]
        CrossHair.Distance = 0
        Height = 100.000000000000000000
        HeightType = htAuto
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
        Range.StartDate = 42173.478571898150000000
        Range.RangeTo = 20
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
            Color = 22015
            CrossHairYValue.BorderWidth = 0
            CrossHairYValue.Font.Charset = DEFAULT_CHARSET
            CrossHairYValue.Font.Color = clWindowText
            CrossHairYValue.Font.Height = -11
            CrossHairYValue.Font.Name = 'Tahoma'
            CrossHairYValue.Font.Style = []
            CrossHairYValue.GradientSteps = 0
            LineColor = 22015
            LegendText = 'Serie 0'
            Marker.MarkerType = mCircle
            Marker.MarkerColor = 22015
            Maximum = 12.000000000000000000
            Name = 'Serie 0'
            ValueFont.Charset = DEFAULT_CHARSET
            ValueFont.Color = clWindowText
            ValueFont.Height = -11
            ValueFont.Name = 'Tahoma'
            ValueFont.Style = []
            ValueFormat = '%g'
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
            XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
            XAxis.TextBottom.Font.Color = clWindowText
            XAxis.TextBottom.Font.Height = -11
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
            YAxis.MinorUnitSpacing = 10
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
            BarValueTextFont.Charset = DEFAULT_CHARSET
            BarValueTextFont.Color = clWindowText
            BarValueTextFont.Height = -11
            BarValueTextFont.Name = 'Tahoma'
            BarValueTextFont.Style = []
            XAxisGroups = <>
            SerieType = stNormal
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
            Color = 13599488
            CrossHairYValue.BorderWidth = 0
            CrossHairYValue.Font.Charset = DEFAULT_CHARSET
            CrossHairYValue.Font.Color = clWindowText
            CrossHairYValue.Font.Height = -11
            CrossHairYValue.Font.Name = 'Tahoma'
            CrossHairYValue.Font.Style = []
            CrossHairYValue.GradientSteps = 0
            LineColor = 13599488
            LegendText = 'Serie 1'
            Marker.MarkerType = mCircle
            Marker.MarkerColor = 13599488
            Maximum = 12.000000000000000000
            Name = 'Serie 1'
            ValueFont.Charset = DEFAULT_CHARSET
            ValueFont.Color = clWindowText
            ValueFont.Height = -11
            ValueFont.Name = 'Tahoma'
            ValueFont.Style = []
            ValueFormat = '%g'
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
            XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
            XAxis.TextBottom.Font.Color = clWindowText
            XAxis.TextBottom.Font.Height = -11
            XAxis.TextBottom.Font.Name = 'Tahoma'
            XAxis.TextBottom.Font.Style = []
            XAxis.Visible = False
            YAxis.MajorFont.Charset = DEFAULT_CHARSET
            YAxis.MajorFont.Color = clWindowText
            YAxis.MajorFont.Height = -11
            YAxis.MajorFont.Name = 'Tahoma'
            YAxis.MajorFont.Style = []
            YAxis.MajorUnitSpacing = 0
            YAxis.MinorFont.Charset = DEFAULT_CHARSET
            YAxis.MinorFont.Color = clWindowText
            YAxis.MinorFont.Height = -11
            YAxis.MinorFont.Name = 'Tahoma'
            YAxis.MinorFont.Style = []
            YAxis.MinorUnitSpacing = 0
            YAxis.Position = yNone
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
            BarValueTextFont.Charset = DEFAULT_CHARSET
            BarValueTextFont.Color = clWindowText
            BarValueTextFont.Height = -11
            BarValueTextFont.Name = 'Tahoma'
            BarValueTextFont.Style = []
            XAxisGroups = <>
            SerieType = stNormal
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
            Color = 6732418
            CrossHairYValue.BorderWidth = 0
            CrossHairYValue.Font.Charset = DEFAULT_CHARSET
            CrossHairYValue.Font.Color = clWindowText
            CrossHairYValue.Font.Height = -11
            CrossHairYValue.Font.Name = 'Tahoma'
            CrossHairYValue.Font.Style = []
            CrossHairYValue.GradientSteps = 0
            LineColor = 6732418
            LegendText = 'Serie 2'
            Marker.MarkerType = mCircle
            Marker.MarkerColor = 6732418
            Maximum = 12.000000000000000000
            Name = 'Serie 2'
            ValueFont.Charset = DEFAULT_CHARSET
            ValueFont.Color = clWindowText
            ValueFont.Height = -11
            ValueFont.Name = 'Tahoma'
            ValueFont.Style = []
            ValueFormat = '%g'
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
            XAxis.TextBottom.Font.Charset = DEFAULT_CHARSET
            XAxis.TextBottom.Font.Color = clWindowText
            XAxis.TextBottom.Font.Height = -11
            XAxis.TextBottom.Font.Name = 'Tahoma'
            XAxis.TextBottom.Font.Style = []
            XAxis.TickMarkColor = clRed
            XAxis.TickMarkSize = 6
            XAxis.TickMarkWidth = 2
            YAxis.MajorFont.Charset = DEFAULT_CHARSET
            YAxis.MajorFont.Color = clWindowText
            YAxis.MajorFont.Height = -11
            YAxis.MajorFont.Name = 'Tahoma'
            YAxis.MajorFont.Style = []
            YAxis.MajorUnit = 2.000000000000000000
            YAxis.MajorUnitSpacing = 0
            YAxis.MinorFont.Charset = DEFAULT_CHARSET
            YAxis.MinorFont.Color = clWindowText
            YAxis.MinorFont.Height = -11
            YAxis.MinorFont.Name = 'Tahoma'
            YAxis.MinorFont.Style = []
            YAxis.MinorUnitSpacing = 10
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
            YAxis.TickMarkColor = clBlue
            BarValueTextFont.Charset = DEFAULT_CHARSET
            BarValueTextFont.Color = clWindowText
            BarValueTextFont.Height = -11
            BarValueTextFont.Name = 'Tahoma'
            BarValueTextFont.Style = []
            XAxisGroups = <>
            SerieType = stNormal
          end>
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Title.Position = tTop
        Title.Text = 'TAdvChartView'
        XAxis.Font.Charset = DEFAULT_CHARSET
        XAxis.Font.Color = clWindowText
        XAxis.Font.Height = -11
        XAxis.Font.Name = 'Tahoma'
        XAxis.Font.Style = []
        XAxis.Text = 'Eixo X'
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
        YAxis.Font.Charset = DEFAULT_CHARSET
        YAxis.Font.Color = clWindowText
        YAxis.Font.Height = -11
        YAxis.Font.Name = 'Tahoma'
        YAxis.Font.Style = []
        YAxis.Size = 40
        YAxis.Text = 'Eixo Y'
        YGrid.MinorDistance = 1.000000000000000000
        YGrid.MajorDistance = 2.000000000000000000
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
    object dbg1: TDBGrid
      Left = 0
      Top = 0
      Width = 771
      Height = 675
      Align = alClient
      DataSource = dsValorIndicadores
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object zqryAnalise: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT COUNT(*) as qtd, CAST('#39'EXTERNA'#39' as Character(8)) as tipov' +
        'ar,'
      
        'CASE WHEN R.mac_tipo = 0 THEN CAST('#39'AMEA'#199'AS'#39' as Character(12)) E' +
        'LSE CAST('#39'OPORTUNIDADES'#39' as Character(13)) END as tipo'
      'FROM risco_macro R'
      'INNER JOIN processos P ON P.codi_pro = R.mac_processo'
      
        'INNER JOIN tabela_combos TC ON TC.tipo_com = 22 AND TC.codi_com ' +
        '= R.mac_codfator'
      
        'INNER JOIN risco_variaveis_ext V ON V.var_codigo = R.mac_codvari' +
        'avel'
      'GROUP BY mac_tipo')
    Params = <>
    Left = 672
    Top = 47
  end
  object dspAnalise: TDataSetProvider
    DataSet = zqryAnalise
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 47
  end
  object cdsAnalise: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAnalise'
    Left = 752
    Top = 47
    object cdsAnaliseqtd: TLargeintField
      FieldName = 'qtd'
      ReadOnly = True
    end
    object cdsAnalisetipovar: TWideStringField
      FieldName = 'tipovar'
      ReadOnly = True
      Size = 8
    end
    object cdsAnalisetipo: TWideStringField
      FieldName = 'tipo'
      ReadOnly = True
      Size = 12
    end
  end
  object dsAnalise: TDataSource
    DataSet = cdsAnalise
    Left = 792
    Top = 47
  end
  object spdSalvar: TSavePictureDialog
    Left = 224
    Top = 496
  end
  object zqryInterna: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT COUNT(*) as qtd, CAST('#39'INTERNA'#39' as Character(8)) as tipov' +
        'ar,'
      
        'CASE WHEN A.int_tipo = 0 THEN CAST('#39'PONTOS FRACOS'#39' as Character(' +
        '13)) ELSE CAST('#39'PONTOS FORTES'#39' as Character(13)) END as tipo'
      'FROM risco_analiseint A'
      'INNER JOIN processos P ON P.codi_pro = A.int_processo'
      
        'INNER JOIN tabela_combos TC ON TC.tipo_com = 23 AND TC.codi_com ' +
        '= A.int_codfator'
      
        'INNER JOIN risco_variaveis_int V ON V.var_codigo = A.int_codvari' +
        'avel'
      'GROUP BY int_tipo')
    Params = <>
    Left = 672
    Top = 111
  end
  object dspInterna: TDataSetProvider
    DataSet = zqryInterna
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 712
    Top = 111
  end
  object cdsInterna: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInterna'
    Left = 752
    Top = 111
    object cdsInternaqtd: TLargeintField
      FieldName = 'qtd'
      ReadOnly = True
    end
    object cdsInternatipovar: TWideStringField
      FieldName = 'tipovar'
      ReadOnly = True
      Size = 8
    end
    object cdsInternatipo: TWideStringField
      FieldName = 'tipo'
      ReadOnly = True
      Size = 12
    end
  end
  object dsInterna: TDataSource
    DataSet = cdsInterna
    Left = 792
    Top = 111
  end
  object zqryValorIndicadores: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT codi_ind, codi_vin, obse_vin, peri_vin, proc_vin, valo_vi' +
        'n, sequ_vin, vin_arquivo'
      'FROM valor_indicador'
      'ORDER BY proc_vin, codi_ind, sequ_vin')
    Params = <>
    Left = 768
    Top = 256
  end
  object dspValorIndicadores: TDataSetProvider
    DataSet = zqryValorIndicadores
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 808
    Top = 256
  end
  object cdsValorIndicadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspValorIndicadores'
    OnCalcFields = cdsValorIndicadoresCalcFields
    Left = 848
    Top = 256
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
    object cdsValorIndicadoressequ_vin: TLargeintField
      FieldName = 'sequ_vin'
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
      FieldKind = fkCalculated
      FieldName = 'periodo'
      Size = 9
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
  end
  object dsValorIndicadores: TDataSource
    DataSet = cdsValorIndicadores
    Left = 888
    Top = 256
  end
end
