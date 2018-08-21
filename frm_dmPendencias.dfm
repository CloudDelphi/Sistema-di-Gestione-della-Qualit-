object dmPendencias: TdmPendencias
  OldCreateOrder = False
  Height = 444
  Width = 720
  object zqryCalibracao: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 40
    Top = 40
  end
  object dspCalibracao: TDataSetProvider
    DataSet = zqryCalibracao
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 40
  end
  object cdsCalibracao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCalibracao'
    Left = 120
    Top = 40
  end
  object dsCalibracao: TDataSource
    DataSet = cdsCalibracao
    Left = 160
    Top = 40
  end
  object zqryForn: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 40
    Top = 96
  end
  object dspForn: TDataSetProvider
    DataSet = zqryForn
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 96
  end
  object cdsForn: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspForn'
    Left = 120
    Top = 96
  end
  object dsForn: TDataSource
    DataSet = cdsForn
    Left = 160
    Top = 96
  end
  object zqryPMC: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 40
    Top = 152
  end
  object dspPMC: TDataSetProvider
    DataSet = zqryPMC
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 152
  end
  object cdsPMC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPMC'
    Left = 120
    Top = 152
  end
  object dsPMC: TDataSource
    DataSet = cdsPMC
    Left = 160
    Top = 152
  end
  object zqryProcedimentos: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 40
    Top = 352
  end
  object dspProcedimentos: TDataSetProvider
    DataSet = zqryProcedimentos
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 352
  end
  object cdsProcedimentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcedimentos'
    Left = 120
    Top = 352
  end
  object dsProcedimentos: TDataSource
    DataSet = cdsProcedimentos
    Left = 160
    Top = 352
  end
  object zqryEficaciaTre: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 272
    Top = 24
  end
  object dspEficaciaTre: TDataSetProvider
    DataSet = zqryEficaciaTre
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 24
  end
  object cdsEficaciaTre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEficaciaTre'
    Left = 352
    Top = 24
  end
  object dsEficaciaTre: TDataSource
    DataSet = cdsEficaciaTre
    Left = 392
    Top = 24
  end
  object zqryManutencao: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT current_date - cast(M.quan_man as integer) * INTERVAL '#39'1 ' +
        'day'#39' as DataLimite, '
      
        'MAX(fec_data_realizado) as UltimaData, F.man_codigo, I.iden_inf ' +
        '|| '#39'-'#39' || I.desc_inf as iden_inf,  M.oque_man,'
      'M.quan_man, TC.valo_com as Periodicidade '
      'FROM manutencao_fecha F'
      'INNER JOIN manutencao M ON M.codi_man = F.man_codigo'
      'INNER JOIN infraestrutura I ON I.codi_inf = M.codi_inf '
      
        'INNER JOIN tabela_combos TC ON TC.tipo_com = 19 AND TC.codi_com ' +
        '= cast(M.quan_man as integer)'
      
        'GROUP BY F.man_codigo, M.quan_man, I.desc_inf, I.iden_inf, M.oqu' +
        'e_man, TC.valo_com')
    Params = <>
    Left = 272
    Top = 72
  end
  object dspManutencao: TDataSetProvider
    DataSet = zqryManutencao
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 72
  end
  object cdsManutencao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManutencao'
    Left = 352
    Top = 72
    object cdsManutencaodatalimite: TDateTimeField
      FieldName = 'datalimite'
      ReadOnly = True
    end
    object cdsManutencaoultimadata: TDateTimeField
      FieldName = 'ultimadata'
      ReadOnly = True
    end
    object cdsManutencaoman_codigo: TLargeintField
      FieldName = 'man_codigo'
    end
    object cdsManutencaoiden_inf: TWideMemoField
      FieldName = 'iden_inf'
      ReadOnly = True
      OnGetText = cdsManutencaoiden_infGetText
      BlobType = ftWideMemo
    end
    object cdsManutencaooque_man: TWideMemoField
      FieldName = 'oque_man'
      OnGetText = cdsManutencaooque_manGetText
      BlobType = ftWideMemo
    end
    object cdsManutencaoquan_man: TWideMemoField
      FieldName = 'quan_man'
      BlobType = ftWideMemo
    end
    object cdsManutencaoperiodicidade: TWideStringField
      FieldName = 'periodicidade'
      ReadOnly = True
      Size = 50
    end
  end
  object dsManutencao: TDataSource
    DataSet = cdsManutencao
    Left = 392
    Top = 72
  end
  object zqryPMCAcoes: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT P.codi_pmc, P.nume_pmc, PA.desc_aco, '
      'C.nome_col as ResponsavelAcao, PA.aco_prazo, PA.vimp_aco'
      'FROM pmc P'
      'INNER JOIN pmc_acoes PA ON PA.codi_pmc = P.codi_pmc'
      'INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco'
      'ORDER BY nume_pmc')
    Params = <>
    Left = 40
    Top = 208
  end
  object dspPMCAcoes: TDataSetProvider
    DataSet = zqryPMCAcoes
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 208
  end
  object cdsPMCAcoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPMCAcoes'
    Left = 120
    Top = 208
    object cdsPMCAcoesnume_pmc: TWideStringField
      FieldName = 'nume_pmc'
      Size = 15
    end
    object cdsPMCAcoesdesc_aco: TWideMemoField
      FieldName = 'desc_aco'
      OnGetText = cdsPMCAcoesdesc_acoGetText
      BlobType = ftWideMemo
    end
    object cdsPMCAcoesresponsavelacao: TWideStringField
      FieldName = 'responsavelacao'
      ReadOnly = True
      Size = 45
    end
    object cdsPMCAcoesaco_prazo: TDateTimeField
      FieldName = 'aco_prazo'
    end
    object cdsPMCAcoesvimp_aco: TWideMemoField
      FieldName = 'vimp_aco'
      BlobType = ftWideMemo
    end
    object cdsPMCAcoescodi_pmc: TLargeintField
      FieldName = 'codi_pmc'
      Required = True
    end
  end
  object dsPMCAcoes: TDataSource
    DataSet = cdsPMCAcoes
    Left = 160
    Top = 208
  end
  object zqryPDCA: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT *'
      'FROM pdca P'
      'LEFT JOIN pdca_lanc L ON L.pdca_codigo = P.pdca_codigo'
      
        'WHERE ((lan_quando < CURRENT_DATE AND lan_datarealizada is null)' +
        ' OR '
      
        '(lan_dtprevista is null OR (lan_dtprevista < CURRENT_DATE AND la' +
        'n_dtfinalizado is null)))')
    Params = <>
    Left = 272
    Top = 120
  end
  object dspPDCA: TDataSetProvider
    DataSet = zqryPDCA
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 120
  end
  object cdsPDCA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPDCA'
    Left = 352
    Top = 120
    object cdsPDCApdca_codigo: TIntegerField
      FieldName = 'pdca_codigo'
      Required = True
    end
    object cdsPDCApdca_identificacao: TWideStringField
      FieldName = 'pdca_identificacao'
      Size = 8
    end
    object cdsPDCApdca_data: TDateTimeField
      FieldName = 'pdca_data'
    end
    object cdsPDCApdca_descricao: TWideStringField
      FieldName = 'pdca_descricao'
      Size = 150
    end
    object cdsPDCApdca_origem: TIntegerField
      FieldName = 'pdca_origem'
    end
    object cdsPDCApdca_processo: TIntegerField
      FieldName = 'pdca_processo'
    end
    object cdsPDCApdca_emitido: TIntegerField
      FieldName = 'pdca_emitido'
    end
    object cdsPDCAlan_codigo: TIntegerField
      FieldName = 'lan_codigo'
      Required = True
    end
    object cdsPDCAlan_oque: TWideMemoField
      FieldName = 'lan_oque'
      OnGetText = cdsPDCAlan_oqueGetText
      BlobType = ftWideMemo
    end
    object cdsPDCAlan_onde: TWideMemoField
      FieldName = 'lan_onde'
      BlobType = ftWideMemo
    end
    object cdsPDCAlan_porque: TWideMemoField
      FieldName = 'lan_porque'
      BlobType = ftWideMemo
    end
    object cdsPDCAlan_quando: TDateTimeField
      FieldName = 'lan_quando'
    end
    object cdsPDCAlan_como: TWideMemoField
      FieldName = 'lan_como'
      BlobType = ftWideMemo
    end
    object cdsPDCAlan_quem: TIntegerField
      FieldName = 'lan_quem'
    end
    object cdsPDCAlan_recursos: TWideMemoField
      FieldName = 'lan_recursos'
      BlobType = ftWideMemo
    end
    object cdsPDCAlan_quanto: TFloatField
      FieldName = 'lan_quanto'
    end
    object cdsPDCAlan_datarealizada: TDateTimeField
      FieldName = 'lan_datarealizada'
    end
    object cdsPDCAlan_verimplantacao: TWideMemoField
      FieldName = 'lan_verimplantacao'
      BlobType = ftWideMemo
    end
    object cdsPDCAlan_status: TIntegerField
      FieldName = 'lan_status'
    end
    object cdsPDCAlan_dtprevista: TDateTimeField
      FieldName = 'lan_dtprevista'
    end
    object cdsPDCAlan_dtfinalizado: TDateTimeField
      FieldName = 'lan_dtfinalizado'
    end
    object cdsPDCAlan_chkobs: TWideMemoField
      FieldName = 'lan_chkobs'
      BlobType = ftWideMemo
    end
  end
  object dsPDCA: TDataSource
    DataSet = cdsPDCA
    Left = 392
    Top = 120
  end
  object zqryEducacao: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 272
    Top = 168
  end
  object dspEducacao: TDataSetProvider
    DataSet = zqryEducacao
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 168
  end
  object cdsEducacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEducacao'
    Left = 352
    Top = 168
  end
  object dsEducacao: TDataSource
    DataSet = cdsEducacao
    Left = 392
    Top = 168
  end
  object zqryExperiencia: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 272
    Top = 216
  end
  object dspExperiencia: TDataSetProvider
    DataSet = zqryExperiencia
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 216
  end
  object cdsExperiencia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExperiencia'
    Left = 352
    Top = 216
  end
  object dsExperiencia: TDataSource
    DataSet = cdsExperiencia
    Left = 392
    Top = 216
  end
  object zqryTreinamentos: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 488
    Top = 72
  end
  object dspTreinamentos: TDataSetProvider
    DataSet = zqryTreinamentos
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 528
    Top = 72
  end
  object cdsTreinamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTreinamentos'
    Left = 568
    Top = 72
  end
  object dsTreinamentos: TDataSource
    DataSet = cdsTreinamentos
    Left = 608
    Top = 72
  end
  object zqryAnaliseCritica: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      
        'SELECT codi_aac, codi_ana, pare_aac, praz_aac, resp_aac, said_aa' +
        'c, proc_aac, '
      '       dcad_aac, aac_resultados, nome_pro as processo,'
      '       CASE WHEN pare_aac = '#39'SP'#39' THEN '#39'SASTISFAZ PARCIALMENTE'#39
      '            WHEN pare_aac = '#39'NS'#39' THEN '#39'N'#195'O SASTISFAZ'#39' '
      '       END as parecer'
      'FROM analise_acoes A'
      'INNER JOIN processos P ON P.codi_pro = A.proc_aac'
      'WHERE praz_aac < CURRENT_DATE OR pare_aac <> '#39'S'#39)
    Params = <>
    Left = 488
    Top = 24
  end
  object dspAnaliseCritica: TDataSetProvider
    DataSet = zqryAnaliseCritica
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 528
    Top = 24
  end
  object cdsAnaliseCritica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAnaliseCritica'
    Left = 568
    Top = 24
    object cdsAnaliseCriticacodi_aac: TLargeintField
      FieldName = 'codi_aac'
      Required = True
    end
    object cdsAnaliseCriticacodi_ana: TLargeintField
      FieldName = 'codi_ana'
      Required = True
    end
    object cdsAnaliseCriticapare_aac: TWideStringField
      FieldName = 'pare_aac'
      Required = True
      Size = 150
    end
    object cdsAnaliseCriticapraz_aac: TDateTimeField
      FieldName = 'praz_aac'
      Required = True
    end
    object cdsAnaliseCriticaresp_aac: TLargeintField
      FieldName = 'resp_aac'
      Required = True
    end
    object cdsAnaliseCriticasaid_aac: TWideMemoField
      FieldName = 'said_aac'
      Required = True
      OnGetText = cdsAnaliseCriticasaid_aacGetText
      BlobType = ftWideMemo
    end
    object cdsAnaliseCriticaproc_aac: TLargeintField
      FieldName = 'proc_aac'
      Required = True
    end
    object cdsAnaliseCriticadcad_aac: TDateTimeField
      FieldName = 'dcad_aac'
    end
    object cdsAnaliseCriticaaac_resultados: TWideMemoField
      FieldName = 'aac_resultados'
      BlobType = ftWideMemo
    end
    object cdsAnaliseCriticaprocesso: TWideStringField
      FieldName = 'processo'
      Size = 45
    end
    object cdsAnaliseCriticaparecer: TWideMemoField
      FieldName = 'parecer'
      ReadOnly = True
      OnGetText = cdsAnaliseCriticaparecerGetText
      BlobType = ftWideMemo
    end
  end
  object dsAnaliseCritica: TDataSource
    DataSet = cdsAnaliseCritica
    Left = 608
    Top = 24
  end
  object zqryHabilidade: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 272
    Top = 264
  end
  object dspHabilidade: TDataSetProvider
    DataSet = zqryHabilidade
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 264
  end
  object cdsHabilidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHabilidade'
    Left = 352
    Top = 264
  end
  object dsHabilidade: TDataSource
    DataSet = cdsHabilidade
    Left = 392
    Top = 264
  end
  object zqryHabVencida: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT C.codi_col, C.nome_col, MAX(hab_ano) as UltimaAvaliacao '
      'FROM colab_habilidades H '
      
        'INNER JOIN Colaboradores C ON C.codi_col = H.codi_col AND C.col_' +
        'status = 1 '
      'GROUP BY C.codi_col')
    Params = <>
    Left = 272
    Top = 312
  end
  object dspHabVencida: TDataSetProvider
    DataSet = zqryHabVencida
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 312
  end
  object cdsHabVencida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHabVencida'
    Left = 352
    Top = 312
    object cdsHabVencidacodi_col: TLargeintField
      FieldName = 'codi_col'
      Required = True
    end
    object cdsHabVencidanome_col: TWideStringField
      FieldName = 'nome_col'
      ReadOnly = True
      Size = 45
    end
    object cdsHabVencidaultimaavaliacao: TWideMemoField
      FieldName = 'ultimaavaliacao'
      ReadOnly = True
      OnGetText = cdsHabVencidaultimaavaliacaoGetText
      BlobType = ftWideMemo
    end
  end
  object dsHabVencida: TDataSource
    DataSet = cdsHabVencida
    Left = 392
    Top = 312
  end
  object zqryPMCsemCausa: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 40
    Top = 256
  end
  object dspPMCsemCausa: TDataSetProvider
    DataSet = zqryPMCsemCausa
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 256
  end
  object cdsPMCsemCausa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPMC'
    Left = 120
    Top = 256
  end
  object dsPMCsemCausa: TDataSource
    DataSet = cdsPMCsemCausa
    Left = 160
    Top = 256
  end
  object zqryPMCsemAcaoImediata: TZQuery
    Connection = dm.Conexao
    Params = <>
    Left = 40
    Top = 304
  end
  object dspPMCsemAcaoImediata: TDataSetProvider
    DataSet = zqryPMCsemAcaoImediata
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 304
  end
  object cdsPMCsemAcaoImediata: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPMCsemAcaoImediata'
    Left = 120
    Top = 304
  end
  object dsPMCsemAcaoImediata: TDataSource
    DataSet = cdsPMCsemAcaoImediata
    Left = 160
    Top = 304
  end
  object zqryRNCSemResposta: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 272
    Top = 360
  end
  object dspRNCSemResposta: TDataSetProvider
    DataSet = zqryRNCSemResposta
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 312
    Top = 360
  end
  object cdsRNCSemResposta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRNCSemResposta'
    Left = 352
    Top = 360
  end
  object dsRNCSemResposta: TDataSource
    DataSet = cdsRNCSemResposta
    Left = 392
    Top = 360
  end
  object zqryRNCSemAceiteRecusa: TZQuery
    Connection = dm.Conexao
    SQL.Strings = (
      '')
    Params = <>
    Left = 496
    Top = 360
  end
  object dspRNCSemAceiteRecusa: TDataSetProvider
    DataSet = zqryRNCSemAceiteRecusa
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 536
    Top = 360
  end
  object cdsRNCSemAceiteRecusa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRNCSemAceiteRecusa'
    Left = 576
    Top = 360
  end
  object dsRNCSemAceiteRecusa: TDataSource
    DataSet = cdsRNCSemAceiteRecusa
    Left = 616
    Top = 360
  end
end
