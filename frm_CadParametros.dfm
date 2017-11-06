object FormCadParametros: TFormCadParametros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Par'#226'metros do Sistema'
  ClientHeight = 451
  ClientWidth = 499
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
  object pctParametros: TJvgPageControl
    Left = 0
    Top = 0
    Width = 499
    Height = 379
    ActivePage = tsAvisoCalib
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabStyle.BevelInner = bvNone
    TabStyle.BevelOuter = bvNone
    TabStyle.Bold = False
    TabStyle.BackgrColor = clBtnShadow
    TabStyle.Font.Charset = DEFAULT_CHARSET
    TabStyle.Font.Color = clBtnHighlight
    TabStyle.Font.Height = -11
    TabStyle.Font.Name = 'Arial'
    TabStyle.Font.Style = []
    TabStyle.CaptionHAlign = fhaCenter
    TabStyle.Gradient.Active = False
    TabStyle.Gradient.Orientation = fgdHorizontal
    TabSelectedStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabSelectedStyle.BevelInner = bvNone
    TabSelectedStyle.BevelOuter = bvNone
    TabSelectedStyle.Bold = False
    TabSelectedStyle.BackgrColor = clBtnFace
    TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
    TabSelectedStyle.Font.Color = clBtnText
    TabSelectedStyle.Font.Height = -11
    TabSelectedStyle.Font.Name = 'Arial'
    TabSelectedStyle.Font.Style = []
    TabSelectedStyle.CaptionHAlign = fhaCenter
    TabSelectedStyle.Gradient.Active = False
    TabSelectedStyle.Gradient.Orientation = fgdHorizontal
    Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
    ExplicitLeft = -1
    ExplicitTop = -5
    object tsCadastro: TTabSheet
      Caption = 'Diversos'
      object grp11: TGroupBox
        Left = 4
        Top = 8
        Width = 478
        Height = 105
        Caption = 'IQF'
        TabOrder = 0
        object lbl1: TLabel
          Left = 15
          Top = 18
          Width = 152
          Height = 13
          Caption = 'Peso Avalia'#231#227'o de Fonecedores'
        end
        object lbl2: TLabel
          Left = 15
          Top = 48
          Width = 88
          Height = 13
          Caption = 'Peso Pontualidade'
        end
        object lbl3: TLabel
          Left = 15
          Top = 78
          Width = 93
          Height = 13
          Caption = 'Peso Conformidade'
        end
        object edtAvaliacao: TCurrencyEdit
          Left = 175
          Top = 11
          Width = 66
          Height = 26
          Hint = 'Nota de avalia'#231#227'o'
          Margins.Left = 5
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0%;-,0%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtPontualidade: TCurrencyEdit
          Left = 175
          Top = 41
          Width = 66
          Height = 26
          Hint = 'Nota de avalia'#231#227'o'
          Margins.Left = 5
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0%;-,0%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtConformidade: TCurrencyEdit
          Left = 175
          Top = 71
          Width = 66
          Height = 26
          Hint = 'Nota de avalia'#231#227'o'
          Margins.Left = 5
          Margins.Top = 1
          AutoSize = False
          DisplayFormat = ',0%;-,0%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object grp12: TGroupBox
        Left = 3
        Top = 112
        Width = 479
        Height = 86
        Caption = 'Indicadores'
        TabOrder = 1
        object lbl15: TLabel
          Left = 16
          Top = 22
          Width = 73
          Height = 13
          Caption = 'Casas Decimais'
        end
        object lbl4: TLabel
          Left = 181
          Top = 22
          Width = 40
          Height = 13
          Caption = 'Exemplo'
        end
        object lblExemplo: TLabel
          Left = 181
          Top = 42
          Width = 55
          Height = 18
          Caption = '123,45'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object spnCasas: TRxSpinEdit
          Left = 16
          Top = 39
          Width = 73
          Height = 26
          MaxValue = 6.000000000000000000
          MinValue = 2.000000000000000000
          Value = 2.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = spnCasasChange
        end
      end
      object grp13: TGroupBox
        Left = 3
        Top = 199
        Width = 479
        Height = 78
        Caption = 'PMC'
        TabOrder = 2
        object lbl21: TLabel
          Left = 16
          Top = 22
          Width = 149
          Height = 13
          Caption = 'Filtrar data de PMC a partir de:'
        end
        object lbl38: TLabel
          Left = 16
          Top = 46
          Width = 454
          Height = 26
          Caption = 
            'Este par'#226'metro n'#227'o sana as pend'#234'ncias em datas anteriores, apena' +
            's ir'#225' ocultar os PMC na pesquisa com data anterior '#224' data cadast' +
            'rada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object dtPMC: TDateEdit
          Left = 171
          Top = 15
          Width = 105
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 0
        end
        object btnLimpaDataPMC: TBitBtn
          Left = 285
          Top = 11
          Width = 188
          Height = 30
          Caption = 'N'#227'o filtrar PMC (Limpar data)'
          DoubleBuffered = True
          Glyph.Data = {
            B60D0000424DB60D000000000000360000002800000030000000180000000100
            180000000000800D0000120B0000120B00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
            FAFEB3CBF8719EF2417EEE266BEB2369EB266BEB417EEE719EF2B3CBF8F8FAFE
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFF1F1F1BDBCBB9694937B7877716E6D716E6D7B7877969493BD
            BCBBF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFCFDFFA2BFF73676ED2369EB2369EB2369EB2369EB2369
            EB2369EB2369EB2369EB2369EB3676EDA2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7AEADAC747170716E6D716E6D
            716E6D716E6D716E6D716E6D716E6D716E6D747170AEADACF7F7F7FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF2FD598EF02369EB23
            69EB3172EC76A1F3B6CDF8D3E1FBE3ECFCD3E1FBB6CDF876A1F33072EC2369EB
            2369EB598EF0ECF2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7
            E7848180716E6D716E6D888584B7B6B5DBDADAE9E9E9E9E9E9DBDADAB7B6B588
            8584716E6D716E6D848180E8E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFE9F0FD417EEE2369EB246AEB4C85EFF2F6FEFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFF5F8FE8CB1F5266BEB2369EB417EEEE9F0FDFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFE8E7E77C7978716E6D73706FADABAAFEFEFEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFECECDCD7C7978716E6D7C7978E8E7
            E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBFE5188EF2369EB266BEB2369EB23
            69EB719EF2FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            C9DAFA2F71EC2369EB5188EFF9FBFEFFFFFFFFFFFFFFFFFFF7F7F7848180716E
            6D747170716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFEEEEEE858282716E6D848180F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
            91B4F52369EB266BEB2369EB2369EB2369EB2369EB6596F1FAFBFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA276CEB2369EB91B4F5FF
            FFFFFFFFFFFFFFFFAEADAC716E6D757372716E6D716E6D716E6D726F6ECCCBCB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE7C7978716E
            6DAEADACFFFFFFFFFFFFFFFFFFEFF4FE2C6FEC2369EB91B4F588AEF42369EB23
            69EB2369EB2369EB5F92F0F6F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF91B4F52369EB2C6FECEFF4FEFFFFFFF1F1F1747170716E6DCCCB
            CA9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCECDCD716E6D747170F1F1F1FFFFFFFFFFFF9FBEF6
            2369EB3374ECF7FAFEFFFFFF90B3F52369EB2369EB2369EB2369EB5B8FF0F2F6
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE3374EC2369EB9F
            BEF6FFFFFFBDBCBB716E6D888584FEFEFEFCFCFC9C9A99716E6D716E6D716E6D
            726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8885
            84716E6DBDBCBBFFFFFFFFFFFF5F92F02369EB7FA8F3FFFFFFFFFFFFFFFFFF97
            B8F62369EB2369EB2369EB2369EB5289EFF2F6FEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF7EA7F32369EB5F92F0FFFFFF969493716E6DB8B6B6FFFF
            FFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5716E6D969493FFFFFFFFFFFF3475ED
            2369EBB5CCF8FFFFFFFFFFFFFFFFFFFFFFFFA4C1F72369EB2369EB2369EB2369
            EB4A83EFEDF3FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4CCF82369EB34
            75EDFFFFFF7B7877716E6DDCDBDBFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D
            716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDA
            DA716E6D7B7877FFFFFFFFFFFF2369EB2369EBD0DFFBFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFACC7F7256AEB2369EB2369EB2369EB4782EEE7EFFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCFDEFB2369EB2369EBFFFFFF716E6D716E6DEAE9E9FFFF
            FFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6ECCCBCBFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9716E6D716E6DFFFFFFFFFFFF2369EB
            2369EBD0DFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2CBF8276CEB2369
            EB2369EB2369EB417EEEE4EDFDFFFFFFFFFFFFFFFFFFFFFFFFCFDEFB2369EB23
            69EBFFFFFF716E6D716E6DEAE9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC
            9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFE9E9
            E9716E6D716E6DFFFFFFFFFFFF3475ED2369EBB5CCF8FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFBCD1F9276CEB2369EB2369EB2369EB3A79EDE0EAFC
            FFFFFFFFFFFFFFFFFFB4CCF82369EB3475EDFFFFFF7B7877716E6DDCDBDBFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D72
            6F6ECCCBCBFFFFFFFFFFFFFFFFFFDBDADA716E6D7B7877FFFFFFFFFFFF5F92F0
            2369EB7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5D8
            FA2B6EEC2369EB2369EB2369EB3777EDD8E5FBFFFFFFFFFFFF7EA7F32369EB5F
            92F0FFFFFF969493716E6DB8B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFB7B6
            B5716E6D969493FFFFFFFFFFFF9FBEF62369EB3374ECF7FAFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA2F71EC2369EB2369EB2369EB
            3475EDD2E0FBF5F8FE3374EC2369EB9FBEF6FFFFFFBDBCBB716E6D888584FEFE
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D71
            6E6D716E6D726F6ECCCBCBFEFEFE888584716E6DBDBCBBFFFFFFFFFFFFEFF4FE
            2C6FEC2369EB92B5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFD0DFFB3374EC2369EB2369EB2369EB2F71EC78A3F32369EB2C6FECEF
            F4FEFFFFFFF1F1F1747170716E6DCECDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6EADABAA716E
            6D747170F1F1F1FFFFFFFFFFFFFFFFFF91B4F52369EB276CEBCBDCFAFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8E5FB3475ED2369EB
            2369EB2369EB246AEB2369EB91B4F5FFFFFFFFFFFFFFFFFFAEADAC716E6D7C79
            78EFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C
            9A99716E6D716E6D716E6D73706F716E6DAEADACFFFFFFFFFFFFFFFFFFFFFFFF
            F9FBFE5188EF2369EB2F71ECCADBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDEE9FC3A79ED2369EB266BEB2369EB5188EFF9FBFEFF
            FFFFFFFFFFFFFFFFF7F7F7848180716E6D868483EFEFEEFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D747170716E6D8481
            80F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8EFFD417EEE2369EB266BEB8D
            B1F5F5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE7EA7F3
            246AEB2369EB417EEEE9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E77C79
            78716E6D7C7978CECDCDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFECCCBCA757372716E6D7C7978E8E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFECF2FD588DF02369EB2369EB3172EC77A2F3B7CEF8D4E2FBE3EC
            FCD4E2FBB7CEF876A1F33172EC2369EB2369EB598EF0ECF2FDFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E7848180716E6D716E6D888584B8B6B6
            DCDBDBEAE9E9EAE9E9DCDBDBB8B6B6888584716E6D716E6D848180E8E7E7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFA2BFF736
            76ED2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB3676ED
            A2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF7F7F7AEADAC747170716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
            6E6D747170AEADACF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FAFEB3CBF8719EF2417EEE266BEB2369
            EB266BEB417EEE719EF2B3CBF8F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1BDBCBB969493
            7B7877716E6D716E6D7B7877969493BDBCBBF1F1F1FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 1
          OnClick = btnLimpaDataPMCClick
        end
      end
    end
    object tsIndicadores: TTabSheet
      Caption = 'Indicadores'
      ImageIndex = 1
    end
    object tsRisco: TTabSheet
      Caption = 'An'#225'lise de Riscos'
      ImageIndex = 2
      object lbl5: TLabel
        Left = 8
        Top = 5
        Width = 282
        Height = 13
        Caption = 'Selecione os tipos de Riscos que devem ter PMC vinculado,'
      end
      object lbl6: TLabel
        Left = 8
        Top = 21
        Width = 96
        Height = 13
        Caption = 'gerando pend'#234'ncia.'
      end
      object grp3: TGroupBox
        Left = 0
        Top = 40
        Width = 489
        Height = 75
        Caption = 'Ponto Forte'
        TabOrder = 0
        object chkRiscoBaixoPFO: TCheckBox
          Left = 15
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Baixo'
          TabOrder = 0
        end
        object chkRiscoMedioPFO: TCheckBox
          Left = 15
          Top = 43
          Width = 97
          Height = 17
          Caption = 'Risco M'#233'dio'
          TabOrder = 1
        end
        object chkRiscoAltoPFO: TCheckBox
          Left = 308
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Alto'
          TabOrder = 2
        end
        object chkRiscoSeveroPFO: TCheckBox
          Left = 308
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Risco Severo'
          TabOrder = 3
        end
      end
      object grp4: TGroupBox
        Left = 0
        Top = 116
        Width = 489
        Height = 75
        Caption = 'Ponto Fraco'
        TabOrder = 1
        object chkRiscoBaixoPFR: TCheckBox
          Left = 15
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Baixo'
          TabOrder = 0
        end
        object chkRiscoMedioPFR: TCheckBox
          Left = 15
          Top = 43
          Width = 97
          Height = 17
          Caption = 'Risco M'#233'dio'
          TabOrder = 1
        end
        object chkRiscoAltoPFR: TCheckBox
          Left = 308
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Alto'
          TabOrder = 2
        end
        object chkRiscoSeveroPFR: TCheckBox
          Left = 308
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Risco Severo'
          TabOrder = 3
        end
      end
      object grp5: TGroupBox
        Left = 0
        Top = 193
        Width = 489
        Height = 75
        Caption = 'Oportunidades'
        TabOrder = 2
        object chkRiscoBaixoOPO: TCheckBox
          Left = 15
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Baixo'
          TabOrder = 0
        end
        object chkRiscoMedioOPO: TCheckBox
          Left = 15
          Top = 43
          Width = 97
          Height = 17
          Caption = 'Risco M'#233'dio'
          TabOrder = 1
        end
        object chkRiscoAltoOPO: TCheckBox
          Left = 308
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Alto'
          TabOrder = 2
        end
        object chkRiscoSeveroOPO: TCheckBox
          Left = 308
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Risco Severo'
          TabOrder = 3
        end
      end
      object grp6: TGroupBox
        Left = 0
        Top = 269
        Width = 489
        Height = 75
        Caption = 'Amea'#231'as'
        TabOrder = 3
        object chkRiscoBaixoAME: TCheckBox
          Left = 15
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Baixo'
          TabOrder = 0
        end
        object chkRiscoMedioAME: TCheckBox
          Left = 15
          Top = 43
          Width = 97
          Height = 17
          Caption = 'Risco M'#233'dio'
          TabOrder = 1
        end
        object chkRiscoAltoAME: TCheckBox
          Left = 308
          Top = 21
          Width = 97
          Height = 17
          Caption = 'Risco Alto'
          TabOrder = 2
        end
        object chkRiscoSeveroAME: TCheckBox
          Left = 308
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Risco Severo'
          TabOrder = 3
        end
      end
    end
    object tsRiscosCores: TTabSheet
      Caption = 'An'#225'lise de Riscos - Cores'
      ImageIndex = 5
      object grp7: TGroupBox
        Left = -1
        Top = 23
        Width = 489
        Height = 63
        Caption = 'Ponto Forte e Oportunidades'
        TabOrder = 0
        object lbl22: TLabel
          Left = 29
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Risco Baixo'
        end
        object lbl23: TLabel
          Left = 123
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Risco M'#233'dio'
        end
        object lbl24: TLabel
          Left = 215
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Risco Alto'
        end
        object lbl25: TLabel
          Left = 313
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Risco Severo'
        end
        object pnlBaixoOp1a: TPanel
          Left = 29
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 0
        end
        object pnlAltoOp1a: TPanel
          Left = 215
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 1
        end
        object pnlMedioOp1a: TPanel
          Left = 123
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 2
        end
        object pnlSeveroOp1a: TPanel
          Left = 313
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 3
        end
      end
      object grp8: TGroupBox
        Left = 0
        Top = 85
        Width = 489
        Height = 63
        Caption = 'Ponto Fraco e Amea'#231'as'
        TabOrder = 1
        object lbl26: TLabel
          Left = 29
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Risco Baixo'
        end
        object lbl27: TLabel
          Left = 123
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Risco M'#233'dio'
        end
        object lbl28: TLabel
          Left = 215
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Risco Alto'
        end
        object lbl29: TLabel
          Left = 313
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Risco Severo'
        end
        object pnlBaixoOp1b: TPanel
          Left = 29
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 0
        end
        object pnlAltoOp1b: TPanel
          Left = 215
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 1
        end
        object pnlMedioOp1b: TPanel
          Left = 123
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 2
        end
        object pnlSeveroOp1b: TPanel
          Left = 313
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 3
        end
      end
      object grp9: TGroupBox
        Left = 0
        Top = 283
        Width = 489
        Height = 63
        Caption = 'Ponto Fraco e Amea'#231'as'
        TabOrder = 2
        object lbl30: TLabel
          Left = 29
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Risco Baixo'
        end
        object lbl31: TLabel
          Left = 123
          Top = 15
          Width = 56
          Height = 13
          Caption = 'Risco M'#233'dio'
        end
        object lbl32: TLabel
          Left = 215
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Risco Alto'
        end
        object lbl33: TLabel
          Left = 313
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Risco Severo'
        end
        object pnlBaixoOp2b: TPanel
          Left = 29
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 0
        end
        object pnlAltoOp2b: TPanel
          Left = 215
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 1
        end
        object pnlMedioOp2b: TPanel
          Left = 123
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 2
        end
        object pnlSeveroOp2b: TPanel
          Left = 313
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 3
        end
      end
      object grp10: TGroupBox
        Left = 0
        Top = 221
        Width = 489
        Height = 63
        Caption = 'Ponto Forte e Oportunidades'
        TabOrder = 3
        object lbl34: TLabel
          Left = 29
          Top = 16
          Width = 54
          Height = 13
          Caption = 'Risco Baixo'
        end
        object lbl35: TLabel
          Left = 123
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Risco M'#233'dio'
        end
        object lbl36: TLabel
          Left = 215
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Risco Alto'
        end
        object lbl37: TLabel
          Left = 313
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Risco Severo'
        end
        object pnlBaixoOp2a: TPanel
          Left = 29
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 0
        end
        object pnlAltoOp2a: TPanel
          Left = 215
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 1
        end
        object pnlMedioOp2a: TPanel
          Left = 123
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 2
        end
        object pnlSeveroOp2a: TPanel
          Left = 313
          Top = 34
          Width = 62
          Height = 21
          TabOrder = 3
        end
      end
      object rbOpcao1: TRadioButton
        Left = 3
        Top = 3
        Width = 113
        Height = 17
        Caption = 'Op'#231#227'o 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object rbOpcao2: TRadioButton
        Left = 3
        Top = 204
        Width = 113
        Height = 17
        Caption = 'Op'#231#227'o 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
    end
    object tsEmail: TTabSheet
      Caption = 'Envio de E-mails'
      ImageIndex = 3
      object grp1: TGroupBox
        Left = 0
        Top = 3
        Width = 488
        Height = 100
        Caption = 'PMC'
        TabOrder = 0
        object lbl7: TLabel
          Left = 8
          Top = 25
          Width = 99
          Height = 13
          Caption = 'Enviar e-mail a cada '
        end
        object lbl8: TLabel
          Left = 175
          Top = 24
          Width = 172
          Height = 13
          Caption = 'dia(s) ap'#243's o vencimento das A'#231#245'es'
        end
        object lbl12: TLabel
          Left = 8
          Top = 56
          Width = 33
          Height = 13
          Caption = 'Avisar '
        end
        object lbl13: TLabel
          Left = 104
          Top = 56
          Width = 182
          Height = 13
          Caption = 'dia(s) antes do vencimento das A'#231#245'es'
        end
        object spnEmailPMC: TRxSpinEdit
          Left = 113
          Top = 17
          Width = 56
          Height = 26
          CheckMinValue = True
          Decimal = 0
          Value = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = spnCasasChange
        end
        object spnAvisoPMC: TRxSpinEdit
          Left = 42
          Top = 49
          Width = 56
          Height = 26
          CheckMinValue = True
          Decimal = 0
          Value = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = spnCasasChange
        end
        object chkEmailPMC: TCheckBox
          Left = 379
          Top = 81
          Width = 106
          Height = 17
          Caption = 'N'#227'o enviar e-mail'
          TabOrder = 2
        end
      end
      object grp2: TGroupBox
        Left = 0
        Top = 154
        Width = 488
        Height = 100
        Caption = 'An'#225'lise de Riscos'
        TabOrder = 1
        Visible = False
        object lbl9: TLabel
          Left = 8
          Top = 24
          Width = 99
          Height = 13
          Caption = 'Enviar E-mail a cada '
        end
        object lbl10: TLabel
          Left = 175
          Top = 24
          Width = 31
          Height = 13
          Caption = 'dia(s).'
        end
        object lbl14: TLabel
          Left = 8
          Top = 56
          Width = 33
          Height = 13
          Caption = 'Avisar '
        end
        object lbl16: TLabel
          Left = 104
          Top = 56
          Width = 134
          Height = 13
          Caption = 'dia(s) antes do vencimento.'
        end
        object spnEmailRisco: TRxSpinEdit
          Left = 113
          Top = 17
          Width = 56
          Height = 26
          CheckMinValue = True
          Decimal = 0
          Value = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = spnCasasChange
        end
        object spn1: TRxSpinEdit
          Left = 42
          Top = 49
          Width = 56
          Height = 26
          CheckMinValue = True
          Decimal = 0
          Value = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = spnCasasChange
        end
        object chk2: TCheckBox
          Left = 379
          Top = 80
          Width = 106
          Height = 17
          Caption = 'N'#227'o enviar e-mail'
          TabOrder = 2
        end
      end
    end
    object tsv: TTabSheet
      Caption = 'Habilidades'
      ImageIndex = 4
      object lbl11: TLabel
        Left = 15
        Top = 18
        Width = 183
        Height = 13
        Caption = 'Nota m'#225'xima Avalia'#231#227'o de Habilidades'
      end
      object lbl17: TLabel
        Left = 15
        Top = 52
        Width = 190
        Height = 13
        Caption = 'Nota para pend'#234'ncia (menor ou igual a)'
      end
      object lbl18: TLabel
        Left = 15
        Top = 85
        Width = 172
        Height = 13
        Caption = 'Per'#237'odo da Avalia'#231#227'o de Habilidades'
      end
      object lbl19: TLabel
        Left = 15
        Top = 116
        Width = 285
        Height = 13
        Caption = 'Cobrar pend'#234'ncias da primeira avalia'#231#227'o de habilidades em '
      end
      object lbl20: TLabel
        Left = 15
        Top = 131
        Width = 234
        Height = 13
        Caption = 'dias a partir da data de admiss'#227'o do colaborador'
      end
      object spnNota: TRxSpinEdit
        Left = 208
        Top = 11
        Width = 58
        Height = 26
        Decimal = 0
        MaxValue = 100.000000000000000000
        MinValue = 1.000000000000000000
        Value = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 0
      end
      object spnNotaPendencia: TRxSpinEdit
        Left = 208
        Top = 45
        Width = 58
        Height = 26
        Decimal = 0
        MaxValue = 100.000000000000000000
        MinValue = 1.000000000000000000
        Value = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 1
      end
      object dblPeriodoHab: TDBLookupComboBox
        Left = 208
        Top = 79
        Width = 88
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'codi_com'
        ListField = 'valo_com'
        ListSource = dsPeriodoHab
        ParentFont = False
        TabOrder = 2
      end
      object spnPrimeiraAvaliacao: TRxSpinEdit
        Left = 302
        Top = 111
        Width = 58
        Height = 26
        Decimal = 0
        MaxValue = 100.000000000000000000
        MinValue = 1.000000000000000000
        Value = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 3
      end
    end
    object tsAvisoCalib: TTabSheet
      Caption = 'Avisos de Calibra'#231#227'o e Manuten'#231#227'o'
      ImageIndex = 6
      object lbl39: TLabel
        Left = 3
        Top = 4
        Width = 312
        Height = 13
        Caption = 
          'Insira o colaborador para receber o e-mail de aviso de Calibra'#231#227 +
          'o'
      end
      object lbl40: TLabel
        Left = 3
        Top = 180
        Width = 321
        Height = 13
        Caption = 
          'Insira o colaborador para receber o e-mail de aviso de Manuten'#231#227 +
          'o'
      end
      object dblColCalibracao: TDBLookupComboBox
        Left = 3
        Top = 23
        Width = 312
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'codi_col'
        ListField = 'nome_col'
        ListSource = dsColabCalibracao
        ParentFont = False
        TabOrder = 0
      end
      object dblColManutencao: TDBLookupComboBox
        Left = 3
        Top = 197
        Width = 321
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'codi_col'
        ListField = 'nome_col'
        ListSource = dsColabManut
        ParentFont = False
        TabOrder = 1
      end
      object dbgCalibracao: TDBGrid
        Left = 3
        Top = 55
        Width = 485
        Height = 119
        Hint = 'Selecione o registro para excluir'
        DataSource = dsParEmailCalib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nome_col'
            Title.Caption = 'Colaboradores que recebem e-mail de Calibra'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 440
            Visible = True
          end>
      end
      object dbgManutencao: TDBGrid
        Left = 3
        Top = 227
        Width = 485
        Height = 119
        Hint = 'Selecione o registro para excluir'
        DataSource = dsParEmailManut
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nome_col'
            Title.Caption = 'Colaboradores que recebem e-mail de Manuten'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 440
            Visible = True
          end>
      end
      object btnInserirEmailCalib: TBitBtn
        Tag = 50
        Left = 323
        Top = 4
        Width = 82
        Height = 51
        Hint = 'Insere o processo para o usu'#225'rio'
        Caption = 'Inserir'
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAFEB3
          CBF8719EF2417EEE266BEB2369EB266BEB417EEE719EF2B3CBF8F8FAFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBFAFACECDCDA3A1A184828173706F716E6D73706F848281A3A1A1CE
          CDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFDFFA2BFF73676ED2369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EB3676EDA2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC3C2C17D7B7A716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF2FD598EF02369EB2369EB31
          72EC76A1F3B6CDF8D3E1FBE3ECFCD3E1FBB6CDF876A1F33072EC2369EB2369EB
          598EF0ECF2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2F29492
          91716E6D716E6D7A7776A6A5A4D0CFCEE3E2E2EDEDEDE3E2E2D0CFCEA6A5A479
          7776716E6D716E6D949291F3F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E9F0FD417EEE2369EB266BEB8CB1F5F5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF5F8FE8CB1F5266BEB2369EB417EEEE9F0FDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF1F0F0848281716E6D73706FB5B3B3F8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B5B3B373706F716E6D848281F1F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFF9FBFE5188EF2369EB2F71ECC9DAFAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA
          2F71EC2369EB5188EFF9FBFEFFFFFFFFFFFFFFFFFFFBFBFB8F8C8B716E6D7976
          75DCDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDCDBDB797675716E6D8F8C8BFBFBFBFFFFFFFFFFFFFFFFFF91B4F5
          2369EB276CEBCBDCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA276CEB2369EB91B4F5FFFFFFFF
          FFFFFFFFFFB8B7B6716E6D747170DEDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDC747170716E
          6DB8B7B6FFFFFFFFFFFFEFF4FE2C6FEC2369EB92B5F5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA6C2F75188EFA6C2F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF91B4F52369EB2C6FECEFF4FEFFFFFFF4F4F4777473716E6DB9B7B7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C4C48F8C8BC6C4C4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB8B6B6716E6D777473F4F4F4FFFFFF9FBEF62369EB
          3374ECF7FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C6FEC2369EB3374
          ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE3374EC2369EB9FBEF6FF
          FFFFC1C0BF716E6D7C7978FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          777473716E6D7C7978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F87B78
          77716E6DC1C0BFFFFFFF5F92F02369EB7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF2369EB2369EB3072ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7EA7F32369EB5F92F0FFFFFF979595716E6DADABAAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF716E6D716E6D797776FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFABAAA9716E6D979595FFFFFF3475ED2369EB
          B5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBDD2F9ACC7F7ACC7F72369EB2369EB2B6E
          ECACC7F7ACC7F7BDD2F9FDFEFFFFFFFFFFFFFFFFFFFFB4CCF82369EB3475EDFF
          FFFF7C7978716E6DCFCECEFFFFFFFFFFFFFFFFFFFEFEFED4D3D3CAC8C8CAC8C8
          716E6D716E6D767372CAC8C8CAC8C8D4D3D3FEFEFEFFFFFFFFFFFFFFFFFFCFCE
          CD716E6D7C7978FFFFFF2369EB2369EBD0DFFBFFFFFFFFFFFFFFFFFFA3C0F723
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EBA4C1F7FFFFFF
          FFFFFFFFFFFFCFDEFB2369EB2369EBFFFFFF716E6D716E6DE1E0E0FFFFFFFFFF
          FFFFFFFFC3C2C2716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DFDF716E6D716E6DFFFFFF2369EB2369EB
          D0DFFBFFFFFFFFFFFFFFFFFFA2BFF72369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFCFDEFB2369EB2369EBFF
          FFFF716E6D716E6DE1E0E0FFFFFFFFFFFFFFFFFFC3C2C1716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DF
          DF716E6D716E6DFFFFFF3475ED2369EBB5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBA
          D0F99EBDF69EBDF62369EB2369EB2A6EEC9EBDF69EBDF6BBD1F9FDFEFFFFFFFF
          FFFFFFFFFFFFB4CCF82369EB3475EDFFFFFF7C7978716E6DCFCECEFFFFFFFFFF
          FFFFFFFFFEFEFED2D2D1C1BFBFC1BFBF716E6D716E6D757372C1BFBFC1BFBFD3
          D2D2FEFEFEFFFFFFFFFFFFFFFFFFCFCECD716E6D7C7978FFFFFF5F92F02369EB
          7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2369EB2369EB3072
          ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EA7F32369EB5F92F0FF
          FFFF979595716E6DADABAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          716E6D716E6D797776FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAA
          A9716E6D979595FFFFFF9FBEF62369EB3374ECF7FAFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF2C6FEC2369EB3374ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F8FE3374EC2369EB9FBEF6FFFFFFC1C0BF716E6D7C7978FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777473716E6D7C7978FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8F8F87B7877716E6DC1C0BFFFFFFFEFF4FE2C6FEC
          2369EB92B5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5C2F74D86EFA5C2
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91B4F52369EB2C6FECEFF4FEFF
          FFFFF4F4F4777473716E6DB9B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C5C4C38C8A89C5C4C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B6B6716E
          6D777473F4F4F4FFFFFFFFFFFF91B4F52369EB276CEBCBDCFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CBDCFA276CEB2369EB91B4F5FFFFFFFFFFFFFFFFFFB8B7B6716E6D747170DEDD
          DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFDEDDDD747170716E6DB8B7B6FFFFFFFFFFFFFFFFFFF9FBFE
          5188EF2369EB2F71ECCADBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA2F71EC2369EB5188EFF9FBFEFFFFFFFF
          FFFFFFFFFFFBFBFB8F8C8B716E6D797675DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDBDB797675716E6D8F8C
          8BFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFE8EFFD417EEE2369EB266BEB8DB1F5F5
          F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE8DB1F5266BEB
          2369EB417EEEE9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0848281716E
          6D73706FB5B4B3F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F8F8B5B4B373706F716E6D848281F1F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFECF2FD588DF02369EB2369EB3172EC77A2F3B7CEF8D4E2FBE3ECFCD4E2
          FBB7CEF876A1F33172EC2369EB2369EB598EF0ECF2FDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF3F2F2949190716E6D716E6D7A7776A7A5A5D0CFCF
          E3E3E2EDEDEDE3E3E2D0CFCFA6A5A47A7776716E6D716E6D949291F3F2F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFA2BFF73676ED23
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB3676EDA2BFF7
          FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDC3C2C17D7B7A716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FAFEB3CBF8719EF2417EEE266BEB2369EB266B
          EB417EEE719EF2B3CBF8F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFACECDCDA3A1A1848281
          73706F716E6D73706F848281A3A1A1CECDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFF
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
        OnClick = btnInserirEmailCalibClick
      end
      object btnExcluirEmailCalib: TBitBtn
        Tag = 50
        Left = 408
        Top = 4
        Width = 82
        Height = 51
        Hint = 'Exclui o processo para o usu'#225'rio'
        Caption = 'Excluir'
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAFEB3
          CBF8719EF2417EEE266BEB2369EB266BEB417EEE719EF2B3CBF8F8FAFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBFAFACECDCDA3A1A184828173706F716E6D73706F848281A3A1A1CE
          CDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFDFFA2BFF73676ED2369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EB3676EDA2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC3C2C17D7B7A716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF2FD598EF02369EB2369EB31
          72EC76A1F3B6CDF8D3E1FBE3ECFCD3E1FBB6CDF876A1F33072EC2369EB2369EB
          598EF0ECF2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2F29492
          91716E6D716E6D7A7776A6A5A4D0CFCEE3E2E2EDEDEDE3E2E2D0CFCEA6A5A479
          7776716E6D716E6D949291F3F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E9F0FD417EEE2369EB266BEB8CB1F5F5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF5F8FE8CB1F5266BEB2369EB417EEEE9F0FDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF1F0F0848281716E6D73706FB5B3B3F8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B5B3B373706F716E6D848281F1F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFF9FBFE5188EF2369EB2F71ECC9DAFAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA
          2F71EC2369EB5188EFF9FBFEFFFFFFFFFFFFFFFFFFFBFBFB8F8C8B716E6D7976
          75DCDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDCDBDB797675716E6D8F8C8BFBFBFBFFFFFFFFFFFFFFFFFF91B4F5
          2369EB276CEBCBDCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA276CEB2369EB91B4F5FFFFFFFF
          FFFFFFFFFFB8B7B6716E6D747170DEDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDC747170716E
          6DB8B7B6FFFFFFFFFFFFEFF4FE2C6FEC2369EB92B5F5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF91B4F52369EB2C6FECEFF4FEFFFFFFF4F4F4777473716E6DB9B7B7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB8B6B6716E6D777473F4F4F4FFFFFF9FBEF62369EB
          3374ECF7FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE3374EC2369EB9FBEF6FF
          FFFFC1C0BF716E6D7C7978FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F87B78
          77716E6DC1C0BFFFFFFF5F92F02369EB7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7EA7F32369EB5F92F0FFFFFF979595716E6DADABAAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFABAAA9716E6D979595FFFFFF3475ED2369EB
          B5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBDD2F9ACC7F7ACC7F7ACC7F7ACC7F7ACC7
          F7ACC7F7ACC7F7BDD2F9FDFEFFFFFFFFFFFFFFFFFFFFB4CCF82369EB3475EDFF
          FFFF7C7978716E6DCFCECEFFFFFFFFFFFFFFFFFFFEFEFED4D3D3CAC8C8CAC8C8
          CAC8C8CAC8C8CAC8C8CAC8C8CAC8C8D4D3D3FEFEFEFFFFFFFFFFFFFFFFFFCFCE
          CD716E6D7C7978FFFFFF2369EB2369EBD0DFFBFFFFFFFFFFFFFFFFFFA3C0F723
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EBA4C1F7FFFFFF
          FFFFFFFFFFFFCFDEFB2369EB2369EBFFFFFF716E6D716E6DE1E0E0FFFFFFFFFF
          FFFFFFFFC3C2C2716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DFDF716E6D716E6DFFFFFF2369EB2369EB
          D0DFFBFFFFFFFFFFFFFFFFFFA2BFF72369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFCFDEFB2369EB2369EBFF
          FFFF716E6D716E6DE1E0E0FFFFFFFFFFFFFFFFFFC3C2C1716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DF
          DF716E6D716E6DFFFFFF3475ED2369EBB5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBA
          D0F99EBDF69EBDF69EBDF69EBDF69EBDF69EBDF69EBDF6BBD1F9FDFEFFFFFFFF
          FFFFFFFFFFFFB4CCF82369EB3475EDFFFFFF7C7978716E6DCFCECEFFFFFFFFFF
          FFFFFFFFFEFEFED2D2D1C1BFBFC1BFBFC1BFBFC1BFBFC1BFBFC1BFBFC1BFBFD3
          D2D2FEFEFEFFFFFFFFFFFFFFFFFFCFCECD716E6D7C7978FFFFFF5F92F02369EB
          7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EA7F32369EB5F92F0FF
          FFFF979595716E6DADABAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAA
          A9716E6D979595FFFFFF9FBEF62369EB3374ECF7FAFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F8FE3374EC2369EB9FBEF6FFFFFFC1C0BF716E6D7C7978FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8F8F87B7877716E6DC1C0BFFFFFFFEFF4FE2C6FEC
          2369EB92B5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91B4F52369EB2C6FECEFF4FEFF
          FFFFF4F4F4777473716E6DB9B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B6B6716E
          6D777473F4F4F4FFFFFFFFFFFF91B4F52369EB276CEBCBDCFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CBDCFA276CEB2369EB91B4F5FFFFFFFFFFFFFFFFFFB8B7B6716E6D747170DEDD
          DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFDEDDDD747170716E6DB8B7B6FFFFFFFFFFFFFFFFFFF9FBFE
          5188EF2369EB2F71ECCADBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA2F71EC2369EB5188EFF9FBFEFFFFFFFF
          FFFFFFFFFFFBFBFB8F8C8B716E6D797675DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDBDB797675716E6D8F8C
          8BFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFE8EFFD417EEE2369EB266BEB8DB1F5F5
          F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE8DB1F5266BEB
          2369EB417EEEE9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0848281716E
          6D73706FB5B4B3F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F8F8B5B4B373706F716E6D848281F1F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFECF2FD588DF02369EB2369EB3172EC77A2F3B7CEF8D4E2FBE3ECFCD4E2
          FBB7CEF876A1F33172EC2369EB2369EB598EF0ECF2FDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF3F2F2949190716E6D716E6D7A7776A7A5A5D0CFCF
          E3E3E2EDEDEDE3E3E2D0CFCFA6A5A47A7776716E6D716E6D949291F3F2F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFA2BFF73676ED23
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB3676EDA2BFF7
          FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDC3C2C17D7B7A716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FAFEB3CBF8719EF2417EEE266BEB2369EB266B
          EB417EEE719EF2B3CBF8F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFACECDCDA3A1A1848281
          73706F716E6D73706F848281A3A1A1CECDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFF
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
        TabOrder = 5
        OnClick = btnExcluirEmailCalibClick
      end
      object btnInserirEmailManut: TBitBtn
        Tag = 50
        Left = 323
        Top = 177
        Width = 82
        Height = 51
        Hint = 'Insere o processo para o usu'#225'rio'
        Caption = 'Inserir'
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAFEB3
          CBF8719EF2417EEE266BEB2369EB266BEB417EEE719EF2B3CBF8F8FAFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBFAFACECDCDA3A1A184828173706F716E6D73706F848281A3A1A1CE
          CDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFDFFA2BFF73676ED2369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EB3676EDA2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC3C2C17D7B7A716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF2FD598EF02369EB2369EB31
          72EC76A1F3B6CDF8D3E1FBE3ECFCD3E1FBB6CDF876A1F33072EC2369EB2369EB
          598EF0ECF2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2F29492
          91716E6D716E6D7A7776A6A5A4D0CFCEE3E2E2EDEDEDE3E2E2D0CFCEA6A5A479
          7776716E6D716E6D949291F3F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E9F0FD417EEE2369EB266BEB8CB1F5F5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF5F8FE8CB1F5266BEB2369EB417EEEE9F0FDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF1F0F0848281716E6D73706FB5B3B3F8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B5B3B373706F716E6D848281F1F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFF9FBFE5188EF2369EB2F71ECC9DAFAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA
          2F71EC2369EB5188EFF9FBFEFFFFFFFFFFFFFFFFFFFBFBFB8F8C8B716E6D7976
          75DCDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDCDBDB797675716E6D8F8C8BFBFBFBFFFFFFFFFFFFFFFFFF91B4F5
          2369EB276CEBCBDCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA276CEB2369EB91B4F5FFFFFFFF
          FFFFFFFFFFB8B7B6716E6D747170DEDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDC747170716E
          6DB8B7B6FFFFFFFFFFFFEFF4FE2C6FEC2369EB92B5F5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA6C2F75188EFA6C2F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF91B4F52369EB2C6FECEFF4FEFFFFFFF4F4F4777473716E6DB9B7B7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C4C48F8C8BC6C4C4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB8B6B6716E6D777473F4F4F4FFFFFF9FBEF62369EB
          3374ECF7FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C6FEC2369EB3374
          ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE3374EC2369EB9FBEF6FF
          FFFFC1C0BF716E6D7C7978FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          777473716E6D7C7978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F87B78
          77716E6DC1C0BFFFFFFF5F92F02369EB7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF2369EB2369EB3072ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7EA7F32369EB5F92F0FFFFFF979595716E6DADABAAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF716E6D716E6D797776FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFABAAA9716E6D979595FFFFFF3475ED2369EB
          B5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBDD2F9ACC7F7ACC7F72369EB2369EB2B6E
          ECACC7F7ACC7F7BDD2F9FDFEFFFFFFFFFFFFFFFFFFFFB4CCF82369EB3475EDFF
          FFFF7C7978716E6DCFCECEFFFFFFFFFFFFFFFFFFFEFEFED4D3D3CAC8C8CAC8C8
          716E6D716E6D767372CAC8C8CAC8C8D4D3D3FEFEFEFFFFFFFFFFFFFFFFFFCFCE
          CD716E6D7C7978FFFFFF2369EB2369EBD0DFFBFFFFFFFFFFFFFFFFFFA3C0F723
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EBA4C1F7FFFFFF
          FFFFFFFFFFFFCFDEFB2369EB2369EBFFFFFF716E6D716E6DE1E0E0FFFFFFFFFF
          FFFFFFFFC3C2C2716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DFDF716E6D716E6DFFFFFF2369EB2369EB
          D0DFFBFFFFFFFFFFFFFFFFFFA2BFF72369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFCFDEFB2369EB2369EBFF
          FFFF716E6D716E6DE1E0E0FFFFFFFFFFFFFFFFFFC3C2C1716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DF
          DF716E6D716E6DFFFFFF3475ED2369EBB5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBA
          D0F99EBDF69EBDF62369EB2369EB2A6EEC9EBDF69EBDF6BBD1F9FDFEFFFFFFFF
          FFFFFFFFFFFFB4CCF82369EB3475EDFFFFFF7C7978716E6DCFCECEFFFFFFFFFF
          FFFFFFFFFEFEFED2D2D1C1BFBFC1BFBF716E6D716E6D757372C1BFBFC1BFBFD3
          D2D2FEFEFEFFFFFFFFFFFFFFFFFFCFCECD716E6D7C7978FFFFFF5F92F02369EB
          7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2369EB2369EB3072
          ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EA7F32369EB5F92F0FF
          FFFF979595716E6DADABAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          716E6D716E6D797776FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAA
          A9716E6D979595FFFFFF9FBEF62369EB3374ECF7FAFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF2C6FEC2369EB3374ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F8FE3374EC2369EB9FBEF6FFFFFFC1C0BF716E6D7C7978FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777473716E6D7C7978FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8F8F87B7877716E6DC1C0BFFFFFFFEFF4FE2C6FEC
          2369EB92B5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5C2F74D86EFA5C2
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91B4F52369EB2C6FECEFF4FEFF
          FFFFF4F4F4777473716E6DB9B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C5C4C38C8A89C5C4C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B6B6716E
          6D777473F4F4F4FFFFFFFFFFFF91B4F52369EB276CEBCBDCFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CBDCFA276CEB2369EB91B4F5FFFFFFFFFFFFFFFFFFB8B7B6716E6D747170DEDD
          DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFDEDDDD747170716E6DB8B7B6FFFFFFFFFFFFFFFFFFF9FBFE
          5188EF2369EB2F71ECCADBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA2F71EC2369EB5188EFF9FBFEFFFFFFFF
          FFFFFFFFFFFBFBFB8F8C8B716E6D797675DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDBDB797675716E6D8F8C
          8BFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFE8EFFD417EEE2369EB266BEB8DB1F5F5
          F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE8DB1F5266BEB
          2369EB417EEEE9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0848281716E
          6D73706FB5B4B3F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F8F8B5B4B373706F716E6D848281F1F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFECF2FD588DF02369EB2369EB3172EC77A2F3B7CEF8D4E2FBE3ECFCD4E2
          FBB7CEF876A1F33172EC2369EB2369EB598EF0ECF2FDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF3F2F2949190716E6D716E6D7A7776A7A5A5D0CFCF
          E3E3E2EDEDEDE3E3E2D0CFCFA6A5A47A7776716E6D716E6D949291F3F2F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFA2BFF73676ED23
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB3676EDA2BFF7
          FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDC3C2C17D7B7A716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FAFEB3CBF8719EF2417EEE266BEB2369EB266B
          EB417EEE719EF2B3CBF8F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFACECDCDA3A1A1848281
          73706F716E6D73706F848281A3A1A1CECDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFF
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
        TabOrder = 6
        OnClick = btnInserirEmailManutClick
      end
      object btnExcluirEmailManut: TBitBtn
        Tag = 50
        Left = 409
        Top = 177
        Width = 82
        Height = 51
        Hint = 'Exclui o processo para o usu'#225'rio'
        Caption = 'Excluir'
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
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FAFEB3
          CBF8719EF2417EEE266BEB2369EB266BEB417EEE719EF2B3CBF8F8FAFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFBFAFACECDCDA3A1A184828173706F716E6D73706F848281A3A1A1CE
          CDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFDFFA2BFF73676ED2369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EB3676EDA2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC3C2C17D7B7A716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF2FD598EF02369EB2369EB31
          72EC76A1F3B6CDF8D3E1FBE3ECFCD3E1FBB6CDF876A1F33072EC2369EB2369EB
          598EF0ECF2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2F29492
          91716E6D716E6D7A7776A6A5A4D0CFCEE3E2E2EDEDEDE3E2E2D0CFCEA6A5A479
          7776716E6D716E6D949291F3F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E9F0FD417EEE2369EB266BEB8CB1F5F5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF5F8FE8CB1F5266BEB2369EB417EEEE9F0FDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF1F0F0848281716E6D73706FB5B3B3F8F8F8FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B5B3B373706F716E6D848281F1F0
          F0FFFFFFFFFFFFFFFFFFFFFFFFF9FBFE5188EF2369EB2F71ECC9DAFAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA
          2F71EC2369EB5188EFF9FBFEFFFFFFFFFFFFFFFFFFFBFBFB8F8C8B716E6D7976
          75DCDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFDCDBDB797675716E6D8F8C8BFBFBFBFFFFFFFFFFFFFFFFFF91B4F5
          2369EB276CEBCBDCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA276CEB2369EB91B4F5FFFFFFFF
          FFFFFFFFFFB8B7B6716E6D747170DEDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDCDC747170716E
          6DB8B7B6FFFFFFFFFFFFEFF4FE2C6FEC2369EB92B5F5FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF91B4F52369EB2C6FECEFF4FEFFFFFFF4F4F4777473716E6DB9B7B7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFB8B6B6716E6D777473F4F4F4FFFFFF9FBEF62369EB
          3374ECF7FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE3374EC2369EB9FBEF6FF
          FFFFC1C0BF716E6D7C7978FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F87B78
          77716E6DC1C0BFFFFFFF5F92F02369EB7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7EA7F32369EB5F92F0FFFFFF979595716E6DADABAAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFABAAA9716E6D979595FFFFFF3475ED2369EB
          B5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBDD2F9ACC7F7ACC7F7ACC7F7ACC7F7ACC7
          F7ACC7F7ACC7F7BDD2F9FDFEFFFFFFFFFFFFFFFFFFFFB4CCF82369EB3475EDFF
          FFFF7C7978716E6DCFCECEFFFFFFFFFFFFFFFFFFFEFEFED4D3D3CAC8C8CAC8C8
          CAC8C8CAC8C8CAC8C8CAC8C8CAC8C8D4D3D3FEFEFEFFFFFFFFFFFFFFFFFFCFCE
          CD716E6D7C7978FFFFFF2369EB2369EBD0DFFBFFFFFFFFFFFFFFFFFFA3C0F723
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EBA4C1F7FFFFFF
          FFFFFFFFFFFFCFDEFB2369EB2369EBFFFFFF716E6D716E6DE1E0E0FFFFFFFFFF
          FFFFFFFFC3C2C2716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DFDF716E6D716E6DFFFFFF2369EB2369EB
          D0DFFBFFFFFFFFFFFFFFFFFFA2BFF72369EB2369EB2369EB2369EB2369EB2369
          EB2369EB2369EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFCFDEFB2369EB2369EBFF
          FFFF716E6D716E6DE1E0E0FFFFFFFFFFFFFFFFFFC3C2C1716E6D716E6D716E6D
          716E6D716E6D716E6D716E6D716E6D716E6DC4C3C2FFFFFFFFFFFFFFFFFFE0DF
          DF716E6D716E6DFFFFFF3475ED2369EBB5CCF8FFFFFFFFFFFFFFFFFFFDFEFFBA
          D0F99EBDF69EBDF69EBDF69EBDF69EBDF69EBDF69EBDF6BBD1F9FDFEFFFFFFFF
          FFFFFFFFFFFFB4CCF82369EB3475EDFFFFFF7C7978716E6DCFCECEFFFFFFFFFF
          FFFFFFFFFEFEFED2D2D1C1BFBFC1BFBFC1BFBFC1BFBFC1BFBFC1BFBFC1BFBFD3
          D2D2FEFEFEFFFFFFFFFFFFFFFFFFCFCECD716E6D7C7978FFFFFF5F92F02369EB
          7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EA7F32369EB5F92F0FF
          FFFF979595716E6DADABAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAA
          A9716E6D979595FFFFFF9FBEF62369EB3374ECF7FAFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F8FE3374EC2369EB9FBEF6FFFFFFC1C0BF716E6D7C7978FAFAFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8F8F87B7877716E6DC1C0BFFFFFFFEFF4FE2C6FEC
          2369EB92B5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF91B4F52369EB2C6FECEFF4FEFF
          FFFFF4F4F4777473716E6DB9B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B6B6716E
          6D777473F4F4F4FFFFFFFFFFFF91B4F52369EB276CEBCBDCFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CBDCFA276CEB2369EB91B4F5FFFFFFFFFFFFFFFFFFB8B7B6716E6D747170DEDD
          DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFDEDDDD747170716E6DB8B7B6FFFFFFFFFFFFFFFFFFF9FBFE
          5188EF2369EB2F71ECCADBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC9DAFA2F71EC2369EB5188EFF9FBFEFFFFFFFF
          FFFFFFFFFFFBFBFB8F8C8B716E6D797675DCDCDCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDBDB797675716E6D8F8C
          8BFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFE8EFFD417EEE2369EB266BEB8DB1F5F5
          F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE8DB1F5266BEB
          2369EB417EEEE9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0848281716E
          6D73706FB5B4B3F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F8F8B5B4B373706F716E6D848281F1F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFECF2FD588DF02369EB2369EB3172EC77A2F3B7CEF8D4E2FBE3ECFCD4E2
          FBB7CEF876A1F33172EC2369EB2369EB598EF0ECF2FDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF3F2F2949190716E6D716E6D7A7776A7A5A5D0CFCF
          E3E3E2EDEDEDE3E3E2D0CFCFA6A5A47A7776716E6D716E6D949291F3F2F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFA2BFF73676ED23
          69EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB3676EDA2BFF7
          FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDC3C2C17D7B7A716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
          6E6D7D7B7AC3C2C1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FAFEB3CBF8719EF2417EEE266BEB2369EB266B
          EB417EEE719EF2B3CBF8F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFACECDCDA3A1A1848281
          73706F716E6D73706F848281A3A1A1CECDCDFBFAFAFFFFFFFFFFFFFFFFFFFFFF
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
        TabOrder = 7
        OnClick = btnExcluirEmailManutClick
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 379
    Width = 499
    Height = 72
    Align = alBottom
    TabOrder = 1
    object btnGravar: TBitBtn
      Left = 74
      Top = 1
      Width = 73
      Height = 70
      Hint = 'Clique para gravar o registro'
      Align = alLeft
      Caption = '&Gravar'
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9
        F0FD99BAF65C90F03374EC2369EB2369EB3374EC5C90F099BAF6E9F0FDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1F1F1BDBCBB9694937B7877716E6D716E6D7B7877969493BD
        BCBBF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF3F7FE82AAF4276CEB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB276CEB82AAF4F3F7FEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7AEADAC747170716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D747170AEADACF7F7F7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBE6FC407DEE2369EB23
        69EB4681EE90B3F5C7D9FADDE8FCDDE8FCC7D9FA90B3F54681EE2369EB2369EB
        407DEEDBE6FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7
        E7848180716E6D716E6D888584B7B6B5DBDADAE9E9E9E9E9E9DBDADAB7B6B588
        8584716E6D716E6D848180E8E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDBE6FC3475ED2369EB3374ECB3CBF8FEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFFB3CBF83374EC2369EB3475EDDBE6FCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE8E7E77C7978716E6D7C7978CECDCDFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFECECDCD7C7978716E6D7C7978E8E7
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F7FE407DEE2369EB447FEEE5EDFDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5EDFD
        427EEE2369EB407DEEF3F7FEFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7848180716E
        6D868483EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEEEEEE858282716E6D848180F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
        82AAF42369EB3374ECE5EDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5EDFD3374EC2369EB82AAF4FFFFFFFF
        FFFFFFFFFFFFFFFFAEADAC716E6D7C7978EEEEEEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE7C7978716E
        6DAEADACFFFFFFFFFFFFFFFFFFE9F0FD276CEB2369EBB3CBF8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC8D9FAD1E0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB3CBF82369EB276CEBE9F0FDFFFFFFFFFFFFF1F1F1747170716E6DCECD
        CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDAE1E1E1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCECDCD716E6D747170F1F1F1FFFFFFFFFFFF99BAF6
        2369EB4681EEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF97B8F62369EB2369EBA4C1
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF4681EE2369EB99BAF6FF
        FFFFFFFFFFBDBCBB716E6D888584FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFBCBBBA
        716E6D716E6DC5C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8885
        84716E6DBDBCBBFFFFFFFFFFFF5C90F02369EB91B4F5FFFFFFFFFFFFFFFFFFFF
        FFFF97B8F62369EB2369EB2369EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF90B3F52369EB5C90F0FFFFFFFFFFFF969493716E6DB8B6B6FFFF
        FFFFFFFFFFFFFFFFFFFFBCBBBA716E6D716E6D716E6D716E6DC5C3C3FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5716E6D969493FFFFFFFFFFFF3374EC
        2369EBC9DAFAFFFFFFFFFFFFFFFFFF97B8F62369EB2369EB266BEB2369EB2369
        EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7D9FA2369EB3374ECFF
        FFFFFFFFFF7B7877716E6DDCDBDBFFFFFFFFFFFFFFFFFFBCBBBA716E6D716E6D
        73706F716E6D716E6D716E6DC5C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDA
        DA716E6D7B7877FFFFFFFFFFFF2369EB2369EBDEE9FCFFFFFFFFFFFF97B8F623
        69EB2369EB276CEBBCD1F9A4C1F72369EB2369EB2369EBA4C1F7FFFFFFFFFFFF
        FFFFFFFFFFFFDDE8FC2369EB2369EBFFFFFFFFFFFF716E6D716E6DEAE9E9FFFF
        FFFFFFFFBCBBBA716E6D716E6D747170D4D3D2C5C3C3716E6D716E6D716E6DC5
        C3C3FFFFFFFFFFFFFFFFFFFFFFFFE9E9E9716E6D716E6DFFFFFFFFFFFF2369EB
        2369EBDEE9FCFFFFFFC7D9FA2369EB2369EB276CEBBCD1F9FFFFFFFFFFFFA4C1
        F72369EB2369EB2369EBA4C1F7FFFFFFFFFFFFFFFFFFDDE8FC2369EB2369EBFF
        FFFFFFFFFF716E6D716E6DEAE9E9FFFFFFDBDADA716E6D716E6D747170D4D3D2
        FFFFFFFFFFFFC5C3C3716E6D716E6D716E6DC5C3C3FFFFFFFFFFFFFFFFFFE9E9
        E9716E6D716E6DFFFFFFFFFFFF3374EC2369EBC9DAFAFFFFFFD6E3FB266BEB28
        6DEBBCD1F9FFFFFFFFFFFFFFFFFFFFFFFFA4C1F72369EB2369EB2369EBA4C1F7
        FFFFFFFFFFFFC7D9FA2369EB3374ECFFFFFFFFFFFF7B7877716E6DDCDBDBFFFF
        FFE5E4E473706F747170D4D3D2FFFFFFFFFFFFFFFFFFFFFFFFC5C3C3716E6D71
        6E6D716E6DC5C3C3FFFFFFFFFFFFDBDADA716E6D7B7877FFFFFFFFFFFF5C90F0
        2369EB91B4F5FFFFFFFFFFFFE2EBFCE3ECFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFA4C1F72369EB2369EB2369EBD1E0FBFFFFFF90B3F52369EB5C90F0FF
        FFFFFFFFFF969493716E6DB8B6B6FFFFFFFFFFFFECECECEDEDEDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC5C3C3716E6D716E6D716E6DE1E1E1FFFFFFB7B6
        B5716E6D969493FFFFFFFFFFFF99BAF62369EB4681EEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4C1F72369EB2369EB
        CEDDFBFEFEFF4681EE2369EB99BAF6FFFFFFFFFFFFBDBCBB716E6D888584FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
        C3C3716E6D716E6DDFDFDEFEFEFE888584716E6DBDBCBBFFFFFFFFFFFFE9F0FD
        276CEB2369EBB3CBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD1E0FBCEDDFBFFFFFFB3CBF82369EB276CEBE9F0FDFF
        FFFFFFFFFFF1F1F1747170716E6DCECDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1DFDFDEFFFFFFCECDCD716E
        6D747170F1F1F1FFFFFFFFFFFFFFFFFF82AAF42369EB3475EDE6EEFDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E5EDFD3374EC2369EB82AAF4FFFFFFFFFFFFFFFFFFFFFFFFAEADAC716E6D7C79
        78EFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEEEEEE7C7978716E6DAEADACFFFFFFFFFFFFFFFFFFFFFFFF
        F3F7FE407DEE2369EB447FEEE6EEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE5EDFD447FEE2369EB407DEEF3F7FEFFFFFFFF
        FFFFFFFFFFFFFFFFF7F7F7848180716E6D868483EFEFEEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE868483716E6D8481
        80F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBE6FC3475ED2369EB3475EDB3
        CBF8FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFB3CBF83374EC
        2369EB3475EDDBE6FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E77C79
        78716E6D7C7978CECDCDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFECECDCD7C7978716E6D7C7978E8E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFDBE6FC407DEE2369EB2369EB4681EE91B4F5C9DAFADEE9FCDEE9
        FCC9DAFA91B4F54681EE2369EB2369EB407DEEDBE6FCFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E7848180716E6D716E6D888584B8B6B6
        DCDBDBEAE9E9EAE9E9DCDBDBB8B6B6888584716E6D716E6D848180E8E7E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F7FE82AAF427
        6CEB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB276CEB82AAF4
        F3F7FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F7F7AEADAC747170716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D747170AEADACF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F0FD99BAF65C90F03374EC2369EB2369
        EB3374EC5C90F099BAF6E9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1BDBCBB969493
        7B7877716E6D716E6D7B7877969493BDBCBBF1F1F1FFFFFFFFFFFFFFFFFFFFFF
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
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnCancelar: TBitBtn
      Left = 147
      Top = 1
      Width = 73
      Height = 70
      Hint = 'Clique para cancelar a opera'#231#227'o'
      Align = alLeft
      Caption = '&Cancelar'
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
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
        FAFEB3CBF8719EF2417EEE266BEB2369EB266BEB417EEE719EF2B3CBF8F8FAFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1F1F1BDBCBB9694937B7877716E6D716E6D7B7877969493BD
        BCBBF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFDFFA2BFF73676ED2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB3676EDA2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7AEADAC747170716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D747170AEADACF7F7F7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF2FD598EF02369EB23
        69EB3172EC76A1F3B6CDF8D3E1FBE3ECFCD3E1FBB6CDF876A1F33072EC2369EB
        2369EB598EF0ECF2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7
        E7848180716E6D716E6D888584B7B6B5DBDADAE9E9E9E9E9E9DBDADAB7B6B588
        8584716E6D716E6D848180E8E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE9F0FD417EEE2369EB246AEB4C85EFF2F6FEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF5F8FE8CB1F5266BEB2369EB417EEEE9F0FDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE8E7E77C7978716E6D73706FADABAAFEFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFECECDCD7C7978716E6D7C7978E8E7
        E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBFE5188EF2369EB266BEB2369EB23
        69EB719EF2FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C9DAFA2F71EC2369EB5188EFF9FBFEFFFFFFFFFFFFFFFFFFF7F7F7848180716E
        6D747170716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEEEEEE858282716E6D848180F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
        91B4F52369EB266BEB2369EB2369EB2369EB2369EB6596F1FAFBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA276CEB2369EB91B4F5FF
        FFFFFFFFFFFFFFFFAEADAC716E6D757372716E6D716E6D716E6D726F6ECCCBCB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEE7C7978716E
        6DAEADACFFFFFFFFFFFFFFFFFFEFF4FE2C6FEC2369EB91B4F588AEF42369EB23
        69EB2369EB2369EB5F92F0F6F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF91B4F52369EB2C6FECEFF4FEFFFFFFF1F1F1747170716E6DCCCB
        CA9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCECDCD716E6D747170F1F1F1FFFFFFFFFFFF9FBEF6
        2369EB3374ECF7FAFEFFFFFF90B3F52369EB2369EB2369EB2369EB5B8FF0F2F6
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE3374EC2369EB9F
        BEF6FFFFFFBDBCBB716E6D888584FEFEFEFCFCFC9C9A99716E6D716E6D716E6D
        726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE8885
        84716E6DBDBCBBFFFFFFFFFFFF5F92F02369EB7FA8F3FFFFFFFFFFFFFFFFFF97
        B8F62369EB2369EB2369EB2369EB5289EFF2F6FEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7EA7F32369EB5F92F0FFFFFF969493716E6DB8B6B6FFFF
        FFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B6B5716E6D969493FFFFFFFFFFFF3475ED
        2369EBB5CCF8FFFFFFFFFFFFFFFFFFFFFFFFA4C1F72369EB2369EB2369EB2369
        EB4A83EFEDF3FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4CCF82369EB34
        75EDFFFFFF7B7877716E6DDCDBDBFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D
        716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDA
        DA716E6D7B7877FFFFFFFFFFFF2369EB2369EBD0DFFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFACC7F7256AEB2369EB2369EB2369EB4782EEE7EFFDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCFDEFB2369EB2369EBFFFFFF716E6D716E6DEAE9E9FFFF
        FFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6ECCCBCBFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9716E6D716E6DFFFFFFFFFFFF2369EB
        2369EBD0DFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2CBF8276CEB2369
        EB2369EB2369EB417EEEE4EDFDFFFFFFFFFFFFFFFFFFFFFFFFCFDEFB2369EB23
        69EBFFFFFF716E6D716E6DEAE9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC
        9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFE9E9
        E9716E6D716E6DFFFFFFFFFFFF3475ED2369EBB5CCF8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBCD1F9276CEB2369EB2369EB2369EB3A79EDE0EAFC
        FFFFFFFFFFFFFFFFFFB4CCF82369EB3475EDFFFFFF7B7877716E6DDCDBDBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D72
        6F6ECCCBCBFFFFFFFFFFFFFFFFFFDBDADA716E6D7B7877FFFFFFFFFFFF5F92F0
        2369EB7FA8F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5D8
        FA2B6EEC2369EB2369EB2369EB3777EDD8E5FBFFFFFFFFFFFF7EA7F32369EB5F
        92F0FFFFFF969493716E6DB8B6B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFB7B6
        B5716E6D969493FFFFFFFFFFFF9FBEF62369EB3374ECF7FAFEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA2F71EC2369EB2369EB2369EB
        3475EDD2E0FBF5F8FE3374EC2369EB9FBEF6FFFFFFBDBCBB716E6D888584FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D71
        6E6D716E6D726F6ECCCBCBFEFEFE888584716E6DBDBCBBFFFFFFFFFFFFEFF4FE
        2C6FEC2369EB92B5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD0DFFB3374EC2369EB2369EB2369EB2F71EC78A3F32369EB2C6FECEF
        F4FEFFFFFFF1F1F1747170716E6DCECDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D716E6D716E6D726F6EADABAA716E
        6D747170F1F1F1FFFFFFFFFFFFFFFFFF91B4F52369EB276CEBCBDCFAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8E5FB3475ED2369EB
        2369EB2369EB246AEB2369EB91B4F5FFFFFFFFFFFFFFFFFFAEADAC716E6D7C79
        78EFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C
        9A99716E6D716E6D716E6D73706F716E6DAEADACFFFFFFFFFFFFFFFFFFFFFFFF
        F9FBFE5188EF2369EB2F71ECCADBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDEE9FC3A79ED2369EB266BEB2369EB5188EFF9FBFEFF
        FFFFFFFFFFFFFFFFF7F7F7848180716E6D868483EFEFEEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC9C9A99716E6D747170716E6D8481
        80F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8EFFD417EEE2369EB266BEB8D
        B1F5F5F8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F8FE7EA7F3
        246AEB2369EB417EEEE9F0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E77C79
        78716E6D7C7978CECDCDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFECCCBCA757372716E6D7C7978E8E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFECF2FD588DF02369EB2369EB3172EC77A2F3B7CEF8D4E2FBE3EC
        FCD4E2FBB7CEF876A1F33172EC2369EB2369EB598EF0ECF2FDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E7E7848180716E6D716E6D888584B8B6B6
        DCDBDBEAE9E9EAE9E9DCDBDBB8B6B6888584716E6D716E6D848180E8E7E7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFFA2BFF736
        76ED2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB3676ED
        A2BFF7FCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F7F7AEADAC747170716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D747170AEADACF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FAFEB3CBF8719EF2417EEE266BEB2369
        EB266BEB417EEE719EF2B3CBF8F8FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1BDBCBB969493
        7B7877716E6D716E6D7B7877969493BDBCBBF1F1F1FFFFFFFFFFFFFFFFFFFFFF
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
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnSair: TBitBtn
      Left = 425
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
      TabOrder = 3
      OnClick = btnSairClick
    end
    object btnAlterar: TBitBtn
      Left = 1
      Top = 1
      Width = 73
      Height = 70
      Hint = 'Clique para alterar um registro'
      Align = alLeft
      Caption = '&Alterar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000FFFFFF2E71EC
        4882EE7FA8F3B4CCF8EAF1FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF78
        7574898686ADABAACFCECDF2F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF4681EE2369EB2369EB2369EB2369EB5D90F0F9
        FBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF878584716E6D716E6D716E6D716E6D9694
        93FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76A1F3
        2369EB2369EB2369EB3A79EDE0EAFCFFFFFFDBE6FCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6
        A5A4716E6D716E6D716E6D807D7CEBEBEAFFFFFFE8E7E7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA6C2F72369EB2369EB3A79EDE0EAFCFFFFFF98
        B9F6256AEBB0C9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C4C4716E6D716E6D807D7CEBEBEAFFFF
        FFBDBBBB726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7E4FB
        2369EB3A79EDE0EAFCFFFFFFA4C1F72369EB2369EB256AEBB0C9F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5
        E5E5716E6D807D7CEBEBEAFFFFFFC5C3C3716E6D716E6D726F6ECCCBCBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFF4681EEE0EAFCFFFFFFA4C1F72369EB23
        69EB2369EB2369EB256AEBB0C9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD878584EBEBEAFFFFFFC5C3C3716E
        6D716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F3F7FEFFFFFFA4C1F72369EB2369EB2369EB2369EB2369EB2369EB256AEBB0C9
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF7F7F7FFFFFFC5C3C3716E6D716E6D716E6D716E6D716E6D716E6D726F6E
        CCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCADBFA2369EB2369EB2369EB23
        69EB2369EB2369EB2369EB2369EB256AEBB0C9F8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDCDC716E6D716E6D716E
        6D716E6D716E6D716E6D716E6D716E6D726F6ECCCBCBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFF7DA6F32369EB2369EB2369EB2369EB2369EB2369EB2369EB2369
        EB256AEBBAD0F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFEFEABA9A9716E6D716E6D716E6D716E6D716E6D716E6D716E6D
        716E6D726F6ED2D2D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7DA6F32369EB23
        69EB2369EB2369EB2369EB2369EB2369EB2369EB276CEBBCD1F9FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEABA9A9716E
        6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D747170D4D3D2FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFF7DA6F32369EB2369EB2369EB2369EB2369EB2369
        EB2369EB2369EB276CEBBCD1F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEABA9A9716E6D716E6D716E6D716E6D716E6D
        716E6D716E6D716E6D747170D4D3D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7D
        A6F32369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB276CEBBCD1F9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEABA9A9716E6D716E6D716E6D716E6D716E6D716E6D716E6D716E6D747170D4
        D3D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7DA6F32369EB2369EB2369EB2369
        EB2369EB2369EB2369EB2369EB276CEBBCD1F9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEABA9A9716E6D716E6D716E6D
        716E6D716E6D716E6D716E6D716E6D747170D4D3D2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFF7DA6F32369EB2369EB2369EB2369EB2369EB2369EB2369EB2369EB
        276CEBBCD1F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEABA9A9716E6D716E6D716E6D716E6D716E6D716E6D716E6D71
        6E6D747170D4D3D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7DA6F32369EB2369
        EB2369EB2369EB2369EB2369EB2369EB2369EB276CEBBCD1F9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEABA9A9716E6D
        716E6D716E6D716E6D716E6D716E6D716E6D716E6D747170D4D3D2FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFF7DA6F32369EB2369EB2369EB2369EB2369EB2369EB
        2369EB2369EB9ABAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFEABA9A9716E6D716E6D716E6D716E6D716E6D71
        6E6D716E6D716E6DBEBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7DA6
        F32369EB2369EB2369EB2369EB2369EB2369EB97B8F6FFFFFFD8E5FBBDD2F9FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
        ABA9A9716E6D716E6D716E6D716E6D716E6D716E6DBCBBBAFFFFFFE6E5E5D5D4
        D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7DA6F32369EB2369EB2369EB2369EB
        97B8F6FFFFFFD8E5FB3475ED276CEBBCD1F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEABA9A9716E6D716E6D716E6D71
        6E6DBCBBBAFFFFFFE6E5E57C7978747170D4D3D2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFF74A0F22369EB2369EB97B8F6FFFFFFD8E5FB3475ED2369EB2369EB27
        6CEBBED3F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEA5A3A3716E6D716E6DBCBBBAFFFFFFE6E5E57C7978716E6D716E
        6D747170D5D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFF719EF297B8F6FFFFFF
        D8E5FB3475ED2369EB2369EB2369EB2369EB3575EDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDA3A1A1BCBBBAFF
        FFFFE6E5E57C7978716E6D716E6D716E6D716E6D7D7A79FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD8E5FB3475ED2369EB2369EB2369EB2369EB23
        69EB3575EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E5E57C7978716E6D716E6D716E6D716E
        6D716E6D7D7A79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80A9F3
        2369EB2369EB2369EB2369EB2369EB276CEBBED3F9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD
        ABAB716E6D716E6D716E6D716E6D716E6D747170D5D4D4FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFF719EF22369EB2369EB2369EB276CEBBC
        D1F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDA3A1A1716E6D716E6D716E6D7471
        70D4D3D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FCFDFF81A9F42A6EEC3C7AEDC0D4F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFDFDAEACAB757372817E7ED6D5D5FFFFFFFFFFFFFFFFFF}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnAlterarClick
    end
  end
  object zqryGravar: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 256
    Top = 343
  end
  object dspGravar: TDataSetProvider
    DataSet = zqryGravar
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 343
  end
  object cdsGravar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGravar'
    Left = 336
    Top = 343
  end
  object zqryParametros: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT pesoiqfconformidade, pesoiqfpontualidade, pesoiqfavaliaca' +
        'o, casasindicador, '
      
        'risco_baixo_pfo, risco_medio_pfo, risco_alto_pfo, risco_severo_p' +
        'fo,'
      
        'risco_baixo_pfr, risco_medio_pfr, risco_alto_pfr, risco_severo_p' +
        'fr, '
      
        'risco_baixo_opo, risco_medio_opo, risco_alto_opo, risco_severo_o' +
        'po, '
      
        'risco_baixo_ame, risco_medio_ame, risco_alto_ame, risco_severo_a' +
        'me, '
      
        'email_pmc, email_risco, notamaxhab, notapendencia, periodohab, p' +
        'rimeiraavaliacao,'
      'aviso_pmc, nao_enviar_email_pmc, riscos_cores, data_filtro_pmc'
      'FROM parametros'
      '')
    Params = <>
    Left = 48
    Top = 319
  end
  object dspParametros: TDataSetProvider
    DataSet = zqryParametros
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 88
    Top = 319
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametros'
    Left = 128
    Top = 319
    object cdsParametrospesoiqfconformidade: TFloatField
      FieldName = 'pesoiqfconformidade'
    end
    object cdsParametrospesoiqfpontualidade: TFloatField
      FieldName = 'pesoiqfpontualidade'
    end
    object cdsParametrospesoiqfavaliacao: TFloatField
      FieldName = 'pesoiqfavaliacao'
    end
    object cdsParametroscasasindicador: TIntegerField
      FieldName = 'casasindicador'
    end
    object cdsParametrosemail_pmc: TIntegerField
      FieldName = 'email_pmc'
    end
    object cdsParametrosemail_risco: TIntegerField
      FieldName = 'email_risco'
    end
    object cdsParametrosnotamaxhab: TFloatField
      FieldName = 'notamaxhab'
    end
    object cdsParametrosrisco_baixo_pfo: TIntegerField
      FieldName = 'risco_baixo_pfo'
    end
    object cdsParametrosrisco_medio_pfo: TIntegerField
      FieldName = 'risco_medio_pfo'
    end
    object cdsParametrosrisco_alto_pfo: TIntegerField
      FieldName = 'risco_alto_pfo'
    end
    object cdsParametrosrisco_severo_pfo: TIntegerField
      FieldName = 'risco_severo_pfo'
    end
    object cdsParametrosrisco_baixo_pfr: TIntegerField
      FieldName = 'risco_baixo_pfr'
    end
    object cdsParametrosrisco_medio_pfr: TIntegerField
      FieldName = 'risco_medio_pfr'
    end
    object cdsParametrosrisco_alto_pfr: TIntegerField
      FieldName = 'risco_alto_pfr'
    end
    object cdsParametrosrisco_severo_pfr: TIntegerField
      FieldName = 'risco_severo_pfr'
    end
    object cdsParametrosrisco_baixo_opo: TIntegerField
      FieldName = 'risco_baixo_opo'
    end
    object cdsParametrosrisco_medio_opo: TIntegerField
      FieldName = 'risco_medio_opo'
    end
    object cdsParametrosrisco_alto_opo: TIntegerField
      FieldName = 'risco_alto_opo'
    end
    object cdsParametrosrisco_severo_opo: TIntegerField
      FieldName = 'risco_severo_opo'
    end
    object cdsParametrosrisco_baixo_ame: TIntegerField
      FieldName = 'risco_baixo_ame'
    end
    object cdsParametrosrisco_medio_ame: TIntegerField
      FieldName = 'risco_medio_ame'
    end
    object cdsParametrosrisco_alto_ame: TIntegerField
      FieldName = 'risco_alto_ame'
    end
    object cdsParametrosrisco_severo_ame: TIntegerField
      FieldName = 'risco_severo_ame'
    end
    object cdsParametrosnotapendencia: TFloatField
      FieldName = 'notapendencia'
    end
    object cdsParametrosperiodohab: TIntegerField
      FieldName = 'periodohab'
      ReadOnly = True
    end
    object cdsParametrosprimeiraavaliacao: TIntegerField
      FieldName = 'primeiraavaliacao'
    end
    object cdsParametrosaviso_pmc: TIntegerField
      FieldName = 'aviso_pmc'
    end
    object cdsParametrosnao_enviar_email_pmc: TIntegerField
      FieldName = 'nao_enviar_email_pmc'
      ReadOnly = True
    end
    object cdsParametrosriscos_cores: TIntegerField
      FieldName = 'riscos_cores'
    end
    object cdsParametrosdata_filtro_pmc: TDateTimeField
      FieldName = 'data_filtro_pmc'
    end
  end
  object cdsPeriodoHab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPeriodoHab'
    Left = 336
    Top = 295
    object cdsPeriodoHabcodi_com: TLargeintField
      FieldName = 'codi_com'
      Required = True
    end
    object cdsPeriodoHabvalo_com: TWideStringField
      FieldName = 'valo_com'
      Size = 50
    end
  end
  object dspPeriodoHab: TDataSetProvider
    DataSet = zqryPeriodoHab
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 295
  end
  object zqryPeriodoHab: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT codi_com, valo_com FROM tabela_combos')
    Params = <>
    Left = 256
    Top = 295
  end
  object dsPeriodoHab: TDataSource
    DataSet = cdsPeriodoHab
    Left = 380
    Top = 295
  end
  object zqryParEmailCalib: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 256
    Top = 127
  end
  object dspParEmailCalib: TDataSetProvider
    DataSet = zqryParEmailCalib
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 127
  end
  object cdsParEmailCalib: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParEmailCalib'
    Left = 336
    Top = 127
  end
  object dsParEmailCalib: TDataSource
    DataSet = cdsParEmailCalib
    Left = 380
    Top = 127
  end
  object zqryParEmailManut: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 256
    Top = 175
  end
  object dspParEmailManut: TDataSetProvider
    DataSet = zqryParEmailManut
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 175
  end
  object cdsParEmailManut: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParEmailManut'
    Left = 336
    Top = 175
  end
  object dsParEmailManut: TDataSource
    DataSet = cdsParEmailManut
    Left = 380
    Top = 175
  end
  object zqryColabCalibracao: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 40
    Top = 127
  end
  object dspColabCalibracao: TDataSetProvider
    DataSet = zqryColabCalibracao
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 127
  end
  object cdsColabCalibracao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColabCalibracao'
    Left = 120
    Top = 127
  end
  object dsColabCalibracao: TDataSource
    DataSet = cdsColabCalibracao
    Left = 164
    Top = 127
  end
  object zqryColabManut: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 40
    Top = 175
  end
  object dspColabManut: TDataSetProvider
    DataSet = zqryColabManut
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 175
  end
  object cdsColabManut: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspColabManut'
    Left = 120
    Top = 175
  end
  object dsColabManut: TDataSource
    DataSet = cdsColabManut
    Left = 164
    Top = 175
  end
end
