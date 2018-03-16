object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 551
  Width = 888
  object dspEmpresa: TDataSetProvider
    DataSet = zqryEmpresa
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 496
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    AfterPost = cdsEmpresaAfterPost
    Left = 104
    Top = 496
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 144
    Top = 496
  end
  object dspEstados: TDataSetProvider
    DataSet = zqryEstados
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 112
  end
  object cdsEstados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstados'
    Left = 312
    Top = 112
  end
  object dspClassificacoes: TDataSetProvider
    DataSet = zqryClassificacoes
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 448
  end
  object cdsClassificacoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClassificacoes'
    AfterPost = cdsClassificacoesAfterPost
    Left = 104
    Top = 448
  end
  object dsClassificacoes: TDataSource
    DataSet = cdsClassificacoes
    Left = 144
    Top = 448
  end
  object dspAuxiliar: TDataSetProvider
    DataSet = zqryAuxiliar
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 196
    Top = 8
  end
  object cdsAuxiliar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAuxiliar'
    Left = 236
    Top = 8
  end
  object dspExperiencias: TDataSetProvider
    DataSet = zqryExperiencias
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 160
  end
  object cdsExperiencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExperiencias'
    AfterPost = cdsExperienciasAfterPost
    Left = 312
    Top = 160
  end
  object dsExperiencias: TDataSource
    DataSet = cdsExperiencias
    Left = 352
    Top = 160
  end
  object dspProcessos: TDataSetProvider
    DataSet = zqryProcessos
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 400
  end
  object cdsProcessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcessos'
    AfterPost = cdsProcessosAfterPost
    Left = 528
    Top = 400
  end
  object dsProcessos: TDataSource
    DataSet = cdsProcessos
    Left = 568
    Top = 400
  end
  object dspColaboradores: TDataSetProvider
    DataSet = zqryColaboradores
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 352
  end
  object cdsColaboradores: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'codi_col'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'conc_col'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'educ_col'
        DataType = ftLargeint
      end
      item
        Name = 'esco_col'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'expe_col'
        DataType = ftLargeint
      end
      item
        Name = 'func_col'
        DataType = ftLargeint
      end
      item
        Name = 'nome_col'
        DataType = ftWideString
        Size = 45
      end
      item
        Name = 'proc_col'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'obs_col'
        DataType = ftWideMemo
      end
      item
        Name = 'col_status'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspColaboradores'
    StoreDefs = True
    BeforeOpen = cdsColaboradoresBeforeOpen
    AfterPost = cdsColaboradoresAfterPost
    OnCalcFields = cdsColaboradoresCalcFields
    Left = 104
    Top = 352
    object cdsColaboradorescodi_col: TLargeintField
      FieldName = 'codi_col'
      Required = True
    end
    object CdsColaboradoresconc_col: TWideStringField
      FieldName = 'conc_col'
      Size = 10
    end
    object cdsColaboradoreseduc_col: TLargeintField
      FieldName = 'educ_col'
    end
    object CdsColaboradoresesco_col: TWideStringField
      FieldName = 'esco_col'
      Size = 50
    end
    object cdsColaboradoresexpe_col: TLargeintField
      FieldName = 'expe_col'
    end
    object cdsColaboradoresfunc_col: TLargeintField
      FieldName = 'func_col'
    end
    object CdsColaboradoresnome_col: TWideStringField
      FieldName = 'nome_col'
      Size = 45
    end
    object cdsColaboradoresproc_col: TLargeintField
      FieldName = 'proc_col'
      Required = True
    end
    object cdsColaboradoresobs_col: TMemoField
      FieldName = 'obs_col'
      BlobType = ftMemo
    end
    object cdsColaboradoresDescExpe: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescExpe'
      Size = 50
      Calculated = True
    end
    object cdsColaboradoresDescFunc: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescFunc'
      Size = 50
      Calculated = True
    end
    object cdsColaboradorescol_status: TIntegerField
      FieldName = 'col_status'
    end
  end
  object dsColaboradores: TDataSource
    DataSet = cdsColaboradores
    Left = 144
    Top = 352
  end
  object dspFuncoes: TDataSetProvider
    DataSet = zqryFuncoes
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 256
  end
  object cdsFuncoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncoes'
    BeforeOpen = cdsFuncoesBeforeOpen
    AfterPost = cdsFuncoesAfterPost
    OnCalcFields = cdsFuncoesCalcFields
    Left = 312
    Top = 256
    object cdsFuncoescodi_fun: TLargeintField
      FieldName = 'codi_fun'
      Required = True
    end
    object cdsFuncoesdesc_fun: TWideStringField
      FieldName = 'desc_fun'
      Size = 50
    end
    object cdsFuncoeseduc_fun: TLargeintField
      FieldName = 'educ_fun'
    end
    object cdsFuncoesexpe_fun: TLargeintField
      FieldName = 'expe_fun'
    end
    object cdsFuncoesresp_fun: TMemoField
      FieldName = 'resp_fun'
      BlobType = ftMemo
    end
  end
  object dsFuncoes: TDataSource
    DataSet = cdsFuncoes
    Left = 352
    Top = 256
  end
  object dspHabilidades: TDataSetProvider
    DataSet = zqryHabilidades
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 400
  end
  object cdsHabilidades: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHabilidades'
    AfterPost = cdsHabilidadesAfterPost
    Left = 312
    Top = 400
  end
  object dsHabilidades: TDataSource
    DataSet = cdsHabilidades
    Left = 352
    Top = 400
  end
  object dspTreinamentos: TDataSetProvider
    DataSet = zqryTreinamentos
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 208
  end
  object cdsTreinamentos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTreinamentos'
    AfterPost = cdsTreinamentosAfterPost
    Left = 736
    Top = 208
  end
  object dsTreinamentos: TDataSource
    DataSet = cdsTreinamentos
    Left = 776
    Top = 208
  end
  object dspListaMestra: TDataSetProvider
    DataSet = zqryListaMestra
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 160
  end
  object cdsListaMestra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaMestra'
    BeforeOpen = cdsListaMestraBeforeOpen
    AfterPost = cdsListaMestraAfterPost
    OnCalcFields = cdsListaMestraCalcFields
    Left = 528
    Top = 160
    object CdsListaMestraapro_lis: TWideStringField
      FieldName = 'apro_lis'
      Size = 1
    end
    object CdsListaMestraatua_lis: TWideStringField
      FieldName = 'atua_lis'
      Size = 25
    end
    object cdsListaMestracodi_lis: TLargeintField
      FieldName = 'codi_lis'
      Required = True
    end
    object cdsListaMestradata_lis: TDateTimeField
      FieldName = 'data_lis'
    end
    object CdsListaMestradesc_lis: TWideStringField
      FieldName = 'desc_lis'
      Size = 100
    end
    object cdsListaMestradtap_lis: TDateTimeField
      FieldName = 'dtap_lis'
    end
    object CdsListaMestraiden_lis: TWideStringField
      FieldName = 'iden_lis'
      Size = 25
    end
    object cdsListaMestraproc_lis: TLargeintField
      FieldName = 'proc_lis'
    end
    object cdsListaMestraquem_lis: TLargeintField
      FieldName = 'quem_lis'
    end
    object cdsListaMestraresp_lis: TLargeintField
      FieldName = 'resp_lis'
    end
    object CdsListaMestrarevi_lis: TWideStringField
      FieldName = 'revi_lis'
      Size = 45
    end
    object cdsListaMestratipo_lis: TLargeintField
      FieldName = 'tipo_lis'
    end
    object cdsListaMestraqtde_lis: TLargeintField
      FieldName = 'qtde_lis'
    end
    object CdsListaMestraarma_lis: TWideStringField
      FieldName = 'arma_lis'
      Size = 50
    end
    object cdsListaMestraarqu_lis: TMemoField
      FieldName = 'arqu_lis'
      BlobType = ftMemo
    end
  end
  object dsListaMestra: TDataSource
    DataSet = cdsListaMestra
    Left = 568
    Top = 160
  end
  object dspTartaruga: TDataSetProvider
    DataSet = zqryTartaruga
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 160
  end
  object cdsTartaruga: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTartaruga'
    AfterPost = cdsTartarugaAfterPost
    Left = 736
    Top = 160
  end
  object dspInfra: TDataSetProvider
    DataSet = zqryInfra
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 112
  end
  object cdsInfra: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInfra'
    AfterPost = cdsInfraAfterPost
    OnCalcFields = cdsInfraCalcFields
    Left = 528
    Top = 112
    object cdsInfraDescTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTipo'
      Size = 30
      Calculated = True
    end
    object cdsInfraDescProc: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescProc'
      Size = 50
      Calculated = True
    end
    object cdsInfracodi_inf: TLargeintField
      FieldName = 'codi_inf'
      Required = True
    end
    object CdsInfradesc_inf1: TWideStringField
      FieldName = 'desc_inf'
      Required = True
      Size = 50
    end
    object CdsInfraiden_inf1: TWideStringField
      FieldName = 'iden_inf'
      Required = True
      Size = 15
    end
    object cdsInfraproc_inf: TLargeintField
      FieldName = 'proc_inf'
      Required = True
    end
    object cdsInfraqtde_inf: TLargeintField
      FieldName = 'qtde_inf'
      Required = True
    end
    object cdsInfraseto_inf: TLargeintField
      FieldName = 'seto_inf'
      Required = True
    end
    object cdsInfratipo_inf: TLargeintField
      FieldName = 'tipo_inf'
      Required = True
    end
    object CdsInframanu_inf1: TWideStringField
      FieldName = 'manu_inf'
      Required = True
      Size = 3
    end
  end
  object dsInfra: TDataSource
    DataSet = cdsInfra
    Left = 568
    Top = 112
  end
  object dspHistProf: TDataSetProvider
    DataSet = zqryHistProf
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 448
  end
  object cdsHistProf: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistProf'
    AfterPost = cdsHistProfAfterPost
    Left = 312
    Top = 448
  end
  object dsHistProf: TDataSource
    DataSet = cdsHistProf
    Left = 352
    Top = 448
  end
  object dspAprovaDocs: TDataSetProvider
    DataSet = zqryAprovaDocs
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 208
  end
  object cdsAprovaDocs: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAprovaDocs'
    BeforeOpen = cdsAprovaDocsBeforeOpen
    AfterPost = cdsAprovaDocsAfterPost
    OnCalcFields = cdsAprovaDocsCalcFields
    Left = 104
    Top = 208
    object CdsAprovaDocsapro_lis1: TWideStringField
      FieldName = 'apro_lis'
      Size = 1
    end
    object CdsAprovaDocsatua_lis1: TWideStringField
      FieldName = 'atua_lis'
      Size = 25
    end
    object cdsAprovaDocscodi_lis: TLargeintField
      FieldName = 'codi_lis'
      Required = True
    end
    object cdsAprovaDocsdata_lis: TDateTimeField
      FieldName = 'data_lis'
    end
    object CdsAprovaDocsdesc_lis1: TWideStringField
      FieldName = 'desc_lis'
      Size = 100
    end
    object cdsAprovaDocsdtap_lis: TDateTimeField
      FieldName = 'dtap_lis'
    end
    object CdsAprovaDocsiden_lis1: TWideStringField
      FieldName = 'iden_lis'
      Size = 25
    end
    object cdsAprovaDocsproc_lis: TLargeintField
      FieldName = 'proc_lis'
    end
    object cdsAprovaDocsquem_lis: TLargeintField
      FieldName = 'quem_lis'
    end
    object cdsAprovaDocsresp_lis: TLargeintField
      FieldName = 'resp_lis'
    end
    object CdsAprovaDocsrevi_lis1: TWideStringField
      FieldName = 'revi_lis'
      Size = 45
    end
    object cdsAprovaDocstipo_lis: TLargeintField
      FieldName = 'tipo_lis'
    end
    object cdsAprovaDocsarqu_lis: TMemoField
      FieldName = 'arqu_lis'
      BlobType = ftMemo
    end
  end
  object dsAprovaDocs: TDataSource
    DataSet = cdsAprovaDocs
    Left = 144
    Top = 208
  end
  object dspProcedimentos: TDataSetProvider
    DataSet = zqryProcedimento
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereChanged
    Left = 488
    Top = 256
  end
  object cdsp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcedimentos'
    AfterPost = cdspAfterPost
    OnCalcFields = cdspCalcFields
    Left = 528
    Top = 256
    object cdspDescTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTipo'
      Size = 7
      Calculated = True
    end
    object Cds_lis: TWideStringField
      FieldName = 'apro_lis'
      Size = 1
    end
    object Cds_lis1: TWideStringField
      FieldName = 'arqu_lis'
      Size = 255
    end
    object Cds_lis2: TWideStringField
      FieldName = 'atua_lis'
      Size = 25
    end
    object cdspcodi_lis: TLargeintField
      FieldName = 'codi_lis'
      Required = True
    end
    object cdspdata_lis: TDateTimeField
      FieldName = 'data_lis'
    end
    object Cds_lis3: TWideStringField
      FieldName = 'desc_lis'
      Size = 100
    end
    object cdspdtap_lis: TDateTimeField
      FieldName = 'dtap_lis'
    end
    object Cds_lis4: TWideStringField
      FieldName = 'iden_lis'
      Size = 25
    end
    object cdspproc_lis: TLargeintField
      FieldName = 'proc_lis'
    end
    object cdspquem_lis: TLargeintField
      FieldName = 'quem_lis'
    end
    object cdspresp_lis: TLargeintField
      FieldName = 'resp_lis'
    end
    object Cds_lis5: TWideStringField
      FieldName = 'revi_lis'
      Size = 45
    end
    object cdsptipo_lis: TLargeintField
      FieldName = 'tipo_lis'
    end
  end
  object dsProcedimentos: TDataSource
    DataSet = cdsp
    Left = 568
    Top = 256
  end
  object dspPMC: TDataSetProvider
    DataSet = zqryPMC
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 304
  end
  object cdsPMC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPMC'
    AfterPost = cdsPMCAfterPost
    OnCalcFields = cdsPMCCalcFields
    Left = 528
    Top = 304
    object cdsPMCNomeResp: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeResp'
      LookupDataSet = cdsColaboradores
      LookupKeyFields = 'codi_col'
      LookupResultField = 'nome_col'
      KeyFields = 'resp_pmc'
      Size = 50
      Lookup = True
    end
    object cdsPMCDescTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTipo'
      Size = 50
      Calculated = True
    end
    object cdsPMCDescOrig: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescOrig'
      Size = 50
      Calculated = True
    end
    object cdsPMCNomeEmit: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeEmit'
      LookupDataSet = cdsColaboradores
      LookupKeyFields = 'codi_col'
      LookupResultField = 'nome_col'
      KeyFields = 'emit_pmc'
      Size = 50
      Lookup = True
    end
    object cdsPMCNomeProc: TStringField
      FieldKind = fkLookup
      FieldName = 'Processo'
      LookupDataSet = cdsProcessos
      LookupKeyFields = 'codi_pro'
      LookupResultField = 'nome_pro'
      KeyFields = 'proc_pmc'
      Size = 50
      Lookup = True
    end
    object cdsPMCcaus_pmc: TWideMemoField
      FieldName = 'caus_pmc'
      BlobType = ftWideMemo
    end
    object cdsPMCcodi_pmc: TLargeintField
      FieldName = 'codi_pmc'
      Required = True
    end
    object cdsPMCdata_pmc: TDateTimeField
      FieldName = 'data_pmc'
      Required = True
    end
    object cdsPMCefic_pmc: TLargeintField
      FieldName = 'efic_pmc'
      Required = True
    end
    object cdsPMCemit_pmc: TLargeintField
      FieldName = 'emit_pmc'
      Required = True
    end
    object cdsPMCimed_pmc: TWideMemoField
      FieldName = 'imed_pmc'
      BlobType = ftWideMemo
    end
    object cdsPMCncon_pmc: TWideMemoField
      FieldName = 'ncon_pmc'
      Required = True
      BlobType = ftWideMemo
    end
    object cdsPMCorig_pmc: TLargeintField
      FieldName = 'orig_pmc'
      Required = True
    end
    object cdsPMCprcs_pmc: TLargeintField
      FieldName = 'prcs_pmc'
      Required = True
    end
    object cdsPMCproc_pmc: TLargeintField
      FieldName = 'proc_pmc'
      Required = True
    end
    object cdsPMCrequ_pmc: TWideStringField
      FieldName = 'requ_pmc'
      Size = 50
    end
    object cdsPMCresp_pmc: TLargeintField
      FieldName = 'resp_pmc'
      Required = True
    end
    object cdsPMCtipo_pmc: TLargeintField
      FieldName = 'tipo_pmc'
      Required = True
    end
    object cdsPMCvefi_pmc: TWideMemoField
      FieldName = 'vefi_pmc'
      BlobType = ftWideMemo
    end
    object cdsPMCnume_pmc: TWideStringField
      FieldName = 'nume_pmc'
      Size = 15
    end
    object cdsPMCpmc_datafecha: TDateTimeField
      FieldName = 'pmc_datafecha'
    end
  end
  object dsPMC: TDataSource
    DataSet = cdsPMC
    Left = 568
    Top = 304
  end
  object dspFormularios: TDataSetProvider
    DataSet = zqryFormularios
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 208
  end
  object cdsFormularios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormularios'
    AfterPost = cdsFormulariosAfterPost
    OnCalcFields = cdsFormulariosCalcFields
    Left = 312
    Top = 208
    object cdsFormulariosarma_for: TLargeintField
      FieldName = 'arma_for'
    end
    object CdsFormulariosarqu_for1: TWideStringField
      FieldName = 'arqu_for'
      Size = 250
    end
    object cdsFormularioscodi_for: TLargeintField
      FieldName = 'codi_for'
      Required = True
    end
    object cdsFormulariosdesc_for: TLargeintField
      FieldName = 'desc_for'
    end
    object CdsFormulariosiden_for1: TWideStringField
      FieldName = 'iden_for'
      Size = 50
    end
    object CdsFormulariosnume_for1: TWideStringField
      FieldName = 'nume_for'
      Required = True
      Size = 12
    end
    object cdsFormulariosprot_for: TLargeintField
      FieldName = 'prot_for'
    end
    object cdsFormulariosqtde_for: TLargeintField
      FieldName = 'qtde_for'
    end
    object cdsFormulariosrecu_for: TLargeintField
      FieldName = 'recu_for'
    end
    object CdsFormulariosrete_for1: TWideStringField
      FieldName = 'rete_for'
      Size = 30
    end
    object CdsFormulariosrevi_for1: TWideStringField
      FieldName = 'revi_for'
    end
    object cdsFormulariosArmazenar: TStringField
      FieldKind = fkCalculated
      FieldName = 'Armazenar'
      Size = 50
      Calculated = True
    end
    object cdsFormulariosDescProtecao: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescProtecao'
      Size = 50
      Calculated = True
    end
  end
  object dsFormularios: TDataSource
    DataSet = cdsFormularios
    Left = 352
    Top = 208
  end
  object dspPmc_Acoes: TDataSetProvider
    DataSet = zqryPMC_Acoes
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 352
  end
  object cdsPmc_Acoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPmc_Acoes'
    AfterPost = cdsPmc_AcoesAfterPost
    OnCalcFields = cdsPmc_AcoesCalcFields
    Left = 528
    Top = 352
    object cdsPmc_AcoesRespNome: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeResp'
      LookupDataSet = cdsColaboradores
      LookupKeyFields = 'codi_col'
      LookupResultField = 'nome_col'
      KeyFields = 'resp_aco'
      Size = 50
      Lookup = True
    end
    object CdsPmc_Acoesarqu_aco1: TWideStringField
      FieldName = 'arqu_aco'
      Size = 200
    end
    object cdsPmc_Acoesdesc_aco: TMemoField
      FieldName = 'desc_aco'
      BlobType = ftMemo
    end
    object cdsPmc_Acoescodi_aco: TLargeintField
      FieldName = 'codi_aco'
      Required = True
    end
    object cdsPmc_Acoescodi_pmc: TLargeintField
      FieldName = 'codi_pmc'
    end
    object CdsPmc_Acoespraz_aco1: TWideStringField
      FieldName = 'praz_aco'
      Size = 45
    end
    object cdsPmc_Acoesresp_aco: TLargeintField
      FieldName = 'resp_aco'
    end
    object cdsPmc_Acoesvimp_aco: TMemoField
      FieldName = 'vimp_aco'
      BlobType = ftMemo
    end
    object cdsPmc_AcoesDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      Size = 50
      Calculated = True
    end
  end
  object dsPmc_Acoes: TDataSource
    DataSet = cdsPmc_Acoes
    Left = 568
    Top = 352
  end
  object dspTabela_Combos: TDataSetProvider
    DataSet = zqryTabela_Combos
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 112
  end
  object cdsTabela_Combos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTabela_Combos'
    AfterPost = cdsFormulariosAfterPost
    Left = 736
    Top = 112
  end
  object dspManutencao: TDataSetProvider
    DataSet = zqryManutencao
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 208
  end
  object cdsManutencao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspManutencao'
    BeforeOpen = cdsManutencaoBeforeOpen
    AfterPost = cdsManutencaoAfterPost
    OnCalcFields = cdsManutencaoCalcFields
    Left = 528
    Top = 208
    object cdsManutencaoDescItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescItem'
      Size = 50
      Calculated = True
    end
    object cdsManutencaoDescProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescProcesso'
      Size = 80
      Calculated = True
    end
    object cdsManutencaoQuando: TStringField
      FieldKind = fkCalculated
      FieldName = 'Quando'
      Size = 30
      Calculated = True
    end
    object CdsManutencaoanom_man: TWideStringField
      FieldName = 'anom_man'
      Size = 255
    end
    object cdsManutencaocodi_inf: TLargeintField
      FieldName = 'codi_inf'
    end
    object cdsManutencaocodi_man: TLargeintField
      FieldName = 'codi_man'
      Required = True
    end
    object CdsManutencaocomo_man: TWideStringField
      FieldName = 'como_man'
      Size = 100
    end
    object cdsManutencaodata_man: TDateTimeField
      FieldName = 'data_man'
    end
    object cdsManutencaoonde_man: TLargeintField
      FieldName = 'onde_man'
    end
    object CdsManutencaooque_man: TWideStringField
      FieldName = 'oque_man'
      Size = 100
    end
    object CdsManutencaoquan_man: TWideStringField
      FieldName = 'quan_man'
      Size = 100
    end
    object cdsManutencaoquem_man: TLargeintField
      FieldName = 'quem_man'
    end
    object cdsManutencaoproc_man: TLargeintField
      FieldName = 'proc_man'
    end
    object CdsManutencaoefic_man: TWideStringField
      FieldName = 'efic_man'
      Size = 3
    end
    object cdsManutencaoIdentItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'IdentItem'
      Size = 30
      Calculated = True
    end
  end
  object dsManutencao: TDataSource
    DataSet = cdsManutencao
    Left = 568
    Top = 208
  end
  object dspUsuario: TDataSetProvider
    DataSet = zqryUsuario
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 256
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    AfterPost = cdsUsuarioAfterPost
    Left = 736
    Top = 256
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 776
    Top = 256
  end
  object dspAuditoria: TDataSetProvider
    DataSet = zqryAuditoria
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 160
  end
  object cdsAuditoria: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAuditoria'
    Left = 104
    Top = 160
  end
  object dspAnalise: TDataSetProvider
    DataSet = zqryAnalise
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 256
  end
  object cdsAnalise: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAnalise'
    AfterPost = cdsAnaliseAfterPost
    AfterScroll = cdsAnaliseAfterScroll
    Left = 104
    Top = 256
    object cdsAnalisecodi_ana: TLargeintField
      FieldName = 'codi_ana'
      Required = True
    end
    object cdsAnaliseentr_ana: TMemoField
      FieldName = 'entr_ana'
      BlobType = ftMemo
    end
    object cdsAnaliseresu_ana: TMemoField
      FieldName = 'resu_ana'
      BlobType = ftMemo
    end
  end
  object dsAnalise: TDataSource
    DataSet = cdsAnalise
    Left = 144
    Top = 256
  end
  object dspAnalise_Acoes: TDataSetProvider
    DataSet = zqryAnalise_Acoes
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 304
  end
  object cdsAnalise_Acoes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAnalise_Acoes'
    AfterPost = cdsAnalise_AcoesAfterPost
    OnCalcFields = cdsAnalise_AcoesCalcFields
    Left = 104
    Top = 304
    object cdsAnalise_AcoesSaidas: TStringField
      FieldKind = fkCalculated
      FieldName = 'Saidas'
      Size = 50
      Calculated = True
    end
    object cdsAnalise_Acoescodi_aac: TLargeintField
      FieldName = 'codi_aac'
      Required = True
    end
    object cdsAnalise_Acoescodi_ana: TLargeintField
      FieldName = 'codi_ana'
      Required = True
    end
    object CdsAnalise_Acoespare_aac1: TWideStringField
      FieldName = 'pare_aac'
      Required = True
      Size = 150
    end
    object cdsAnalise_Acoespraz_aac: TDateTimeField
      FieldName = 'praz_aac'
      Required = True
    end
    object cdsAnalise_Acoesresp_aac: TLargeintField
      FieldName = 'resp_aac'
      Required = True
    end
    object cdsAnalise_Acoessaid_aac: TMemoField
      FieldName = 'said_aac'
      Required = True
      BlobType = ftMemo
    end
    object cdsAnalise_Acoesproc_aac: TLargeintField
      FieldName = 'proc_aac'
      Required = True
    end
    object cdsAnalise_Acoesdcad_aac: TDateTimeField
      FieldName = 'dcad_aac'
    end
    object cdsAnalise_Acoesaac_resultados: TMemoField
      FieldName = 'aac_resultados'
      BlobType = ftMemo
    end
  end
  object dsAnalise_Acoes: TDataSource
    DataSet = cdsAnalise_Acoes
    Left = 144
    Top = 304
  end
  object dspIndicadores: TDataSetProvider
    DataSet = zqryIndicadores
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 496
  end
  object cdsIndicadores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspIndicadores'
    AfterPost = cdsIndicadoresAfterPost
    BeforeDelete = cdsIndicadoresBeforeDelete
    OnCalcFields = cdsIndicadoresCalcFields
    Left = 312
    Top = 496
    object cdsIndicadoresDescProc: TStringField
      FieldKind = fkLookup
      FieldName = 'DescProc'
      LookupDataSet = cdsProcessos
      LookupKeyFields = 'codi_pro'
      LookupResultField = 'nome_pro'
      KeyFields = 'proc_ind'
      Size = 50
      Lookup = True
    end
    object cdsIndicadoresMetaConcatenada: TStringField
      FieldKind = fkCalculated
      FieldName = 'MetaConcatenada'
      Calculated = True
    end
    object cdsIndicadoresDescPeriodicidade: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescPeriodicidade'
      Size = 40
      Calculated = True
    end
    object cdsIndicadorescodi_ind: TLargeintField
      FieldName = 'codi_ind'
      Required = True
    end
    object CdsIndicadoresdesc_ind: TWideStringField
      FieldName = 'desc_ind'
      Size = 80
    end
    object cdsIndicadoresmeta_ind: TFloatField
      FieldName = 'meta_ind'
    end
    object cdsIndicadoresproc_ind: TLargeintField
      FieldName = 'proc_ind'
    end
    object CdsIndicadorestipo_ind: TWideStringField
      FieldName = 'tipo_ind'
    end
    object cdsIndicadoresperi_ind: TLargeintField
      FieldName = 'peri_ind'
    end
  end
  object dsIndicadores: TDataSource
    DataSet = cdsIndicadores
    Left = 352
    Top = 496
  end
  object dspFuncHab: TDataSetProvider
    DataSet = zqryFuncHab
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 304
  end
  object cdsFuncHab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncHab'
    Left = 312
    Top = 304
    object cdsFuncHabDescHab: TStringField
      FieldKind = fkLookup
      FieldName = 'DescHab'
      LookupDataSet = cdsHabilidades
      LookupKeyFields = 'codi_hab'
      LookupResultField = 'desc_hab'
      KeyFields = 'codi_hab'
      Size = 50
      Lookup = True
    end
    object cdsFuncHabcodi_fun: TLargeintField
      FieldName = 'codi_fun'
      Required = True
    end
    object cdsFuncHabcodi_hab: TLargeintField
      FieldName = 'codi_hab'
      Required = True
    end
  end
  object dsFuncHab: TDataSource
    DataSet = cdsFuncHab
    Left = 352
    Top = 304
  end
  object dspFuncTre: TDataSetProvider
    DataSet = zqryFuncTre
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 352
  end
  object cdsFuncTre: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncTre'
    Left = 312
    Top = 352
    object StringField1: TStringField
      FieldKind = fkLookup
      FieldName = 'DescTre'
      LookupDataSet = cdsTreinamentos
      LookupKeyFields = 'codi_tre'
      LookupResultField = 'desc_tre'
      KeyFields = 'codi_tre'
      Size = 50
      Lookup = True
    end
    object cdsFuncTrecodi_fun: TLargeintField
      FieldName = 'codi_fun'
      Required = True
    end
    object cdsFuncTrecodi_tre: TLargeintField
      FieldName = 'codi_tre'
      Required = True
    end
    object CdsFuncTretipo_tre1: TWideStringField
      FieldName = 'tipo_tre'
      Required = True
      Size = 1
    end
  end
  object dsFuncTre: TDataSource
    DataSet = cdsFuncTre
    Left = 352
    Top = 352
  end
  object dspColaboradores1: TDataSetProvider
    DataSet = zqryColaboradores1
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 400
  end
  object cdsColaboradores1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'codi_col'
        DataType = ftInteger
      end
      item
        Name = 'conc_col'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'educ_col'
        DataType = ftInteger
      end
      item
        Name = 'esco_col'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'expe_col'
        DataType = ftInteger
      end
      item
        Name = 'func_col'
        DataType = ftInteger
      end
      item
        Name = 'nome_col'
        DataType = ftString
        Size = 45
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspColaboradores1'
    StoreDefs = True
    Left = 104
    Top = 400
  end
  object dsColaboradores1: TDataSource
    DataSet = cdsColaboradores1
    Left = 144
    Top = 400
  end
  object dspPlanoAcao: TDataSetProvider
    DataSet = zqryPlanoAcao
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 448
  end
  object cdsPlanoAcao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoAcao'
    AfterPost = cdsPlanoAcaoAfterPost
    Left = 528
    Top = 448
    object cdsPlanoAcaoacao_pla: TMemoField
      FieldName = 'acao_pla'
      OnGetText = cdsPlanoAcaoacao_plaGetText
      BlobType = ftMemo
    end
    object cdsPlanoAcaocodi_pla: TLargeintField
      FieldName = 'codi_pla'
      Required = True
    end
    object cdsPlanoAcaocola_pla: TLargeintField
      FieldName = 'cola_pla'
    end
    object cdsPlanoAcaocome_pla: TMemoField
      FieldName = 'come_pla'
      BlobType = ftMemo
    end
    object CdsPlanoAcaoefic_pla: TWideStringField
      FieldName = 'efic_pla'
      Size = 1
    end
    object cdsPlanoAcaopraz_pla: TDateTimeField
      FieldName = 'praz_pla'
    end
    object cdsPlanoAcaoresp_pla: TLargeintField
      FieldName = 'resp_pla'
    end
    object cdsPlanoAcaoAcao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Acao'
      Size = 80
      Calculated = True
    end
  end
  object dsPlanoAcao: TDataSource
    DataSet = cdsPlanoAcao
    Left = 568
    Top = 448
  end
  object dspParametros: TDataSetProvider
    DataSet = zqryParametros
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 496
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametros'
    AfterPost = cdsPlanoAcaoAfterPost
    Left = 528
    Top = 496
    object cdsParametrosnota_padrao_habilidade: TFloatField
      FieldName = 'nota_padrao_habilidade'
      Required = True
    end
    object CdsParametrosaudit_interna_ja_fez1: TWideStringField
      FieldName = 'audit_interna_ja_fez'
      Required = True
      Size = 1
    end
    object CdsParametroscontr1: TWideStringField
      FieldName = 'contr'
      Size = 10
    end
  end
  object dsParametros: TDataSource
    DataSet = cdsParametros
    Left = 568
    Top = 496
  end
  object dspVisualizaAnalise: TDataSetProvider
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 304
  end
  object cdsVisualizaAnalise: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVisualizaAnalise'
    OnCalcFields = cdsVisualizaAnaliseCalcFields
    Left = 736
    Top = 304
    object IntegerField4: TIntegerField
      FieldName = 'codi_aac'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField5: TIntegerField
      FieldName = 'codi_ana'
    end
    object StringField3: TStringField
      FieldName = 'pare_aac'
      Size = 150
    end
    object IntegerField6: TIntegerField
      FieldName = 'resp_aac'
    end
    object StringField5: TStringField
      FieldName = 'said_aac'
      Size = 100
    end
    object StringField6: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeResp'
      LookupDataSet = cdsColaboradores
      LookupKeyFields = 'codi_col'
      LookupResultField = 'nome_col'
      KeyFields = 'resp_aac'
      Size = 50
      Lookup = True
    end
    object IntegerField7: TIntegerField
      FieldName = 'proc_aac'
    end
    object cdsVisualizaAnalisepraz_aac: TSQLTimeStampField
      FieldName = 'praz_aac'
    end
  end
  object dsVisualizaAnalise: TDataSource
    DataSet = cdsVisualizaAnalise
    Left = 776
    Top = 304
  end
  object dspAcesso: TDataSetProvider
    DataSet = zqryAcesso
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 64
    Top = 112
  end
  object cdsAcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcesso'
    Left = 104
    Top = 112
  end
  object dspAux: TDataSetProvider
    DataSet = zqryAux
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 348
    Top = 8
  end
  object cdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux'
    Left = 388
    Top = 8
  end
  object dspAux2: TDataSetProvider
    DataSet = zqryAux2
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 492
    Top = 8
  end
  object cdsAux2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux2'
    Left = 532
    Top = 8
  end
  object dspAux3: TDataSetProvider
    DataSet = zqryAux3
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 348
    Top = 56
  end
  object cdsAux3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux3'
    Left = 388
    Top = 56
  end
  object dspAux4: TDataSetProvider
    DataSet = zqryAux4
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 492
    Top = 56
  end
  object cdsAux4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux4'
    Left = 532
    Top = 56
  end
  object Conexao: TZConnection
    Properties.Strings = (
      'codepage=UTF8'
      'client_encoding=UTF8')
    HostName = 'localhost'
    Port = 5432
    Database = 'destra'
    User = 'postgres'
    Password = '12345'
    Protocol = 'postgresql-8'
    Left = 24
    Top = 64
  end
  object zqryAuxiliar: TZQuery
    Connection = Conexao
    Params = <>
    Left = 156
    Top = 8
  end
  object zqryAux2: TZQuery
    Connection = Conexao
    Params = <>
    Left = 452
    Top = 8
  end
  object zqryAux: TZQuery
    Connection = Conexao
    Params = <>
    Left = 308
    Top = 8
  end
  object zqryAux3: TZQuery
    Connection = Conexao
    Params = <>
    Left = 308
    Top = 56
  end
  object zqryAux4: TZQuery
    Connection = Conexao
    Params = <>
    Left = 452
    Top = 56
  end
  object zqryAcesso: TZQuery
    Connection = Conexao
    Params = <>
    Left = 24
    Top = 112
  end
  object zqryAuditoria: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_aud, data_aud, docu_aud, oper_aud, tabe_aud, user_au' +
        'd from auditoria')
    Params = <>
    Left = 24
    Top = 160
  end
  object zqryAprovaDocs: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select apro_lis, arqu_lis, atua_lis, codi_lis, data_lis, desc_li' +
        's, dtap_lis, iden_lis, proc_lis, quem_lis, resp_lis, revi_lis, t' +
        'ipo_lis from lista_mestra'
      'where apro_lis = '#39'N'#39)
    Params = <>
    Left = 24
    Top = 208
  end
  object zqryAnalise: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_ana, entr_ana, resu_ana from analise')
    Params = <>
    Left = 24
    Top = 256
  end
  object zqryAnalise_Acoes: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_aac, codi_ana, pare_aac, praz_aac, resp_aac, said_aa' +
        'c, proc_aac, dcad_aac, aac_resultados'
      'from analise_acoes')
    Params = <>
    Left = 24
    Top = 304
  end
  object zqryColaboradores: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_col, conc_col, educ_col, esco_col, expe_col, func_co' +
        'l, nome_col, proc_col, obs_col, col_status'
      'from colaboradores '
      'order by nome_col')
    Params = <>
    Left = 24
    Top = 352
  end
  object zqryColaboradores1: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_col, conc_col, educ_col, esco_col, expe_col, func_co' +
        'l, nome_col, proc_col, obs_col, col_status'
      'from colaboradores '
      'order by nome_col')
    Params = <>
    Left = 24
    Top = 400
  end
  object zqryClassificacoes: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_cla, desc_cla from classificacoes')
    Params = <>
    Left = 24
    Top = 448
  end
  object zqryEmpresa: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select bair_emp, cepe_emp, cida_emp, ende_emp, esta_emp, logo_em' +
        'p, mail_emp, nome_emp, site_emp from empresa')
    Params = <>
    Left = 24
    Top = 496
  end
  object zqryEstados: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_est, desc_est, sigl_est from estados')
    Params = <>
    Left = 232
    Top = 112
  end
  object zqryExperiencias: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_exp, desc_exp from experiencia')
    Params = <>
    Left = 232
    Top = 160
  end
  object zqryFormularios: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select arma_for, arqu_for, codi_for, desc_for, iden_for, nume_fo' +
        'r, prot_for, qtde_for, recu_for, rete_for, revi_for from formula' +
        'rios')
    Params = <>
    Left = 232
    Top = 208
  end
  object zqryFuncoes: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from funcoes')
    Params = <>
    Left = 232
    Top = 256
  end
  object zqryFuncHab: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_fun, codi_hab from funcoes_habilidades')
    Params = <>
    Left = 232
    Top = 304
  end
  object zqryFuncTre: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_fun, codi_tre, tipo_tre from funcoes_treinamentos')
    Params = <>
    Left = 232
    Top = 352
  end
  object zqryHabilidades: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_hab, desc_hab from habilidades'
      'order by desc_hab')
    Params = <>
    Left = 232
    Top = 400
  end
  object zqryHistProf: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select ate_his, codi_col, codi_his, de_his, func_his from histpr' +
        'of')
    Params = <>
    Left = 232
    Top = 448
  end
  object zqryIndicadores: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_ind, desc_ind, meta_ind, proc_ind, tipo_ind, peri_in' +
        'd from indicadores')
    Params = <>
    Left = 232
    Top = 496
  end
  object zqryInfra: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_inf, desc_inf, iden_inf, proc_inf, qtde_inf, seto_in' +
        'f, tipo_inf, manu_inf '
      'from infraestrutura')
    Params = <>
    Left = 448
    Top = 112
  end
  object zqryListaMestra: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select apro_lis, arqu_lis, atua_lis, codi_lis, data_lis, desc_li' +
        's, dtap_lis, iden_lis, proc_lis, quem_lis, resp_lis, revi_lis, t' +
        'ipo_lis, qtde_lis, arma_lis from lista_mestra')
    Params = <>
    Left = 448
    Top = 160
  end
  object zqryManutencao: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select anom_man, codi_inf, codi_man, como_man, data_man, onde_ma' +
        'n, oque_man, quan_man, quem_man, proc_man, efic_man from manuten' +
        'cao')
    Params = <>
    Left = 448
    Top = 208
  end
  object zqryProcedimento: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select apro_lis, arqu_lis, atua_lis, codi_lis, data_lis, desc_li' +
        's, dtap_lis, iden_lis, proc_lis, quem_lis, resp_lis, revi_lis, t' +
        'ipo_lis from lista_mestra'
      'where apro_lis = '#39'N'#39)
    Params = <>
    Left = 448
    Top = 256
  end
  object zqryPMC: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select caus_pmc, codi_pmc, data_pmc, efic_pmc, emit_pmc, '
      
        ' imed_pmc, ncon_pmc, orig_pmc, prcs_pmc, proc_pmc, requ_pmc, res' +
        'p_pmc, '
      'tipo_pmc, vefi_pmc, nume_pmc, pmc_dataFecha'
      'from pmc')
    Params = <>
    Left = 448
    Top = 304
  end
  object zqryPMC_Acoes: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT arqu_aco, desc_aco, codi_aco, codi_pmc, praz_aco, resp_ac' +
        'o, vimp_aco '
      'FROM pmc_acoes')
    Params = <>
    Left = 448
    Top = 352
  end
  object zqryProcessos: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select clas_pro, codi_pro, entr_pro, func_pro, gest_pro, infr_pr' +
        'o, nome_pro, requ_pro, said_pro from processos')
    Params = <>
    Left = 448
    Top = 400
  end
  object zqryPlanoAcao: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select acao_pla, codi_pla, cola_pla, come_pla, efic_pla, praz_pl' +
        'a, resp_pla from planoacao')
    Params = <>
    Left = 448
    Top = 448
  end
  object zqryParametros: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from parametros')
    Params = <>
    Left = 448
    Top = 496
  end
  object zqryTartaruga: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select clas_pro, codi_pro, entr_pro, func_pro, gest_pro, infr_pr' +
        'o, nome_pro, orde_pro, requ_pro, said_pro from processos')
    Params = <>
    Left = 656
    Top = 160
  end
  object zqryTabela_Combos: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_com, desc_com, tipo_com, valo_com from tabela_combos')
    Params = <>
    Left = 656
    Top = 112
  end
  object zqryTreinamentos: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select codi_tre, desc_tre from treinamentos'
      'order by desc_tre')
    Params = <>
    Left = 656
    Top = 208
  end
  object zqryUsuario: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT  nome_usu, senh_usu, proc_usu, AcaoCorretiva, Analise, In' +
        'dicadores, Infraestrutura, Manutencao, Matriz, Procedimentos, Re' +
        'gistros, AprovaDoc'
      'FROM usuarios')
    Params = <>
    Left = 656
    Top = 256
  end
  object zqryVizualizaAnalise: TZQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select codi_aac, codi_ana, pare_aac, praz_aac, resp_aac, said_aa' +
        'c, proc_aac from analise_acoes')
    Params = <>
    Left = 656
    Top = 304
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 656
    Top = 424
  end
  object Msg: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CharSet = 'ISO-8859-1'
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Priority = mpHighest
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 696
    Top = 424
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 736
    Top = 424
  end
  object SMTP: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 776
    Top = 424
  end
  object zqryGravar: TZQuery
    Connection = Conexao
    Params = <>
    Left = 668
    Top = 8
  end
  object dspGravar: TDataSetProvider
    DataSet = zqryGravar
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 620
    Top = 8
  end
  object cdsGravar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGravar'
    Left = 724
    Top = 8
  end
  object conMySQL: TZConnection
    Properties.Strings = (
      'codepage=UTF8'
      'client_encoding=UTF8')
    HostName = 'www.destraconsultoria.com.br'
    Port = 3306
    Database = 'destr347_interno'
    User = 'destr347_destra1'
    Password = 'xph5q48pfz'
    Protocol = 'mysql-5'
    Left = 24
    Top = 16
  end
  object dspAuxMySQL: TDataSetProvider
    DataSet = zqryAuxMySQL
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 196
    Top = 56
  end
  object cdsAuxMySQL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAuxMySQL'
    Left = 236
    Top = 56
  end
  object zqryAuxMySQL: TZQuery
    Connection = conMySQL
    Params = <>
    Left = 156
    Top = 56
  end
  object dsEstados: TDataSource
    DataSet = cdsEstados
    Left = 352
    Top = 112
  end
  object frxReport1: TfrxReport
    Version = '4.10.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40548.430550960600000000
    ReportOptions.LastChange = 43166.383057708350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Memo3OnBeforePrint(Sender: TfrxComponent);'
      'begin                                              '
      '//   Memo3.Color:= clWhite;'
      'if (Memo3.Text = '#39'BAIXO'#39') then begin'
      
        '      Memo3.Color:= ClGreen;                                    ' +
        '                                   '
      '   end;'
      '   if (Memo3.Text = '#39'M'#201'DIO'#39') then begin'
      
        '      Memo3.Color:= ClYellow;                                   ' +
        '                                    '
      '   end;'
      '   if (Memo3.Text = '#39'ALTO'#39') then begin'
      
        '      Memo3.Color:= clWhite;                                    ' +
        '                                   '
      '   end;'
      '   if (Memo3.Text = '#39'SEVERO'#39') then begin'
      
        '      Memo3.Color:= ClRed;                                      ' +
        '                                 '
      '   end;  '
      'end;'
      ''
      'begin'
      '  '
      'end.')
    Left = 88
    Top = 56
    Datasets = <
      item
        DataSet = FormAnaliseRisco.frxDBRiscos
        DataSetName = 'frxDBRiscos'
      end>
    Variables = <
      item
        Name = ' Variaveis'
        Value = Null
      end
      item
        Name = 'varMedia'
        Value = Null
      end
      item
        Name = 'varMediaGeral'
        Value = Null
      end
      item
        Name = 'varNotaMaxHab'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 79.645652200000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo4: TfrxMemoView
          Top = 22.267780000000000000
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          ShowHint = False
          AutoWidth = True
          DataSetName = 'cdsParametroRelatorio'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'AN'#193'LISE DE RISCOS')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Width = 1046.929810000000000000
          ShowHint = False
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 56.692950000000000000
        Top = 385.512060000000000000
        Width = 1046.929810000000000000
        object Picture1: TfrxPictureView
          Left = 1001.575450000000000000
          Top = 9.338590000000012000
          Width = 34.015770000000000000
          Height = 34.015770000000000000
          ShowHint = False
          Picture.Data = {
            0A544A504547496D616765B2340000FFD8FFE105034578696600004D4D002A00
            0000080007011200030000000100010000011A00050000000100000062011B00
            05000000010000006A0128000300000001000200000131000200000022000000
            720132000200000014000000948769000400000001000000A8000000D4000AFC
            8000002710000AFC800000271041646F62652050686F746F73686F7020434320
            32303134202857696E646F77732900323031343A30373A30312031343A32353A
            3031000003A00100030000000100010000A00200040000000100000020A00300
            0400000001000000200000000000000006010300030000000100060000011A00
            050000000100000122011B0005000000010000012A0128000300000001000200
            000201000400000001000001320202000400000001000003C900000000000000
            48000000010000004800000001FFD8FFED000C41646F62655F434D0001FFEE00
            0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
            11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
            0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080020002003012200
            021101031101FFDD00040002FFC4013F00000105010101010101000000000000
            00030001020405060708090A0B01000105010101010101000000000000000100
            02030405060708090A0B1000010401030204020507060805030C330100021103
            04211231054151611322718132061491A1B14223241552C16233347282D14307
            259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
            D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
            37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
            021103213112044151617122130532819114A1B14223C152D1F0332462E17282
            92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
            B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
            E6F62737475767778797A7B7C7FFDA000C03010002110311003F00EE3A5F4BC3
            EA586CCECE61BEFBCB9CE739CE0000E735AC635AE6FB7DAADFFCDCE8BFF7187F
            9CFF00FC9A6FABA40E8B8E4E80074FF9EF5CEF47EA7655D5C5F6B88A725EE638
            B8E8371DDFF41C58A8F161843071E38C8E5038A440FEADCE5FE33A2239F24F98
            F6F2CA2309970C22655BCB8611FF0011E8FF00E6E745FF00B8C3FCE7FF00E4D5
            6CAC0C6E977E1DF820D26CC86536B439C5AE63E41DCD7977D158A3A9DB7F5FAF
            2F73852EBC319CC6C0433FEA1DB9747D6F8C1FFC3B4FE57251961C90C928638C
            0E390E19002FC24A9C33E39E38E4CB298C91265191918EDEA83FFFD0EEFA5FA9
            FF00361BE934BAC355A18D1C9717581AB399D0F21FF57DCD35386532E36B5847
            B8886D6E6FF9ADDEB4B07233E92F37D569A6B6122B65704991F41A1AC47FDB63
            FEE0E6FF00DB27FF0024B3B11C39F140CF8E1C3038B8671E13FDFF00D27438F3
            427338C465C593DEB07FF1B71FA8745C9A7A660371EA7597D45CFB434490E7ED
            76BFD5D9B16BF5932CC03113994183F129FF006D8FFB839BFF006C9FFC920DD7
            5FD4EFC5AEBC5BA8AE8B9B7DB6DEDD8219C3183F3B7293871444C63249988478
            6BFCDFA51C79646072800633924677FE73D4FF00FFD9FFED0D0250686F746F73
            686F7020332E30003842494D0425000000000010000000000000000000000000
            000000003842494D043A0000000000E5000000100000000100000000000B7072
            696E744F7574707574000000050000000050737453626F6F6C0100000000496E
            7465656E756D00000000496E746500000000436C726D0000000F7072696E7453
            69787465656E426974626F6F6C000000000B7072696E7465724E616D65544558
            540000000100000000000F7072696E7450726F6F6653657475704F626A630000
            000C00500072006F006F006600200053006500740075007000000000000A7072
            6F6F6653657475700000000100000000426C746E656E756D0000000C6275696C
            74696E50726F6F660000000970726F6F66434D594B003842494D043B00000000
            022D00000010000000010000000000127072696E744F75747075744F7074696F
            6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C00
            000000005267734D626F6F6C000000000043726E43626F6F6C0000000000436E
            7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F6C
            0000000000456D6C44626F6F6C0000000000496E7472626F6F6C000000000042
            636B674F626A6300000001000000000000524742430000000300000000526420
            20646F7562406FE000000000000000000047726E20646F7562406FE000000000
            0000000000426C2020646F7562406FE000000000000000000042726454556E74
            4623526C74000000000000000000000000426C6420556E744623526C74000000
            00000000000000000052736C74556E74462350786C4052000000000000000000
            0A766563746F7244617461626F6F6C010000000050675073656E756D00000000
            506750730000000050675043000000004C656674556E744623526C7400000000
            0000000000000000546F7020556E744623526C74000000000000000000000000
            53636C20556E74462350726340590000000000000000001063726F705768656E
            5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D6C
            6F6E67000000000000000C63726F70526563744C6566746C6F6E670000000000
            00000D63726F705265637452696768746C6F6E67000000000000000B63726F70
            52656374546F706C6F6E6700000000003842494D03ED00000000001000480000
            0001000200480000000100023842494D042600000000000E0000000000000000
            00003F8000003842494D040D000000000004000000783842494D041900000000
            00040000001E3842494D03F3000000000009000000000000000001003842494D
            271000000000000A000100000000000000023842494D03F5000000000048002F
            66660001006C66660006000000000001002F6666000100A1999A000600000000
            0001003200000001005A00000006000000000001003500000001002D00000006
            0000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
            00003842494D040000000000000200003842494D040200000000000400000000
            3842494D043000000000000201013842494D042D000000000006000100000001
            3842494D0408000000000010000000010000024000000240000000003842494D
            041E000000000004000000003842494D041A0000000003490000000600000000
            0000000000000020000000200000000A0055006E007400690074006C00650064
            002D003200000001000000000000000000000000000000000000000100000000
            0000000000000020000000200000000000000000000000000000000001000000
            0000000000000000000000000000000010000000010000000000006E756C6C00
            00000200000006626F756E64734F626A63000000010000000000005263743100
            00000400000000546F70206C6F6E6700000000000000004C6566746C6F6E6700
            0000000000000042746F6D6C6F6E670000002000000000526768746C6F6E6700
            00002000000006736C69636573566C4C73000000014F626A6300000001000000
            000005736C6963650000001200000007736C69636549446C6F6E670000000000
            00000767726F757049446C6F6E6700000000000000066F726967696E656E756D
            0000000C45536C6963654F726967696E0000000D6175746F47656E6572617465
            640000000054797065656E756D0000000A45536C696365547970650000000049
            6D672000000006626F756E64734F626A63000000010000000000005263743100
            00000400000000546F70206C6F6E6700000000000000004C6566746C6F6E6700
            0000000000000042746F6D6C6F6E670000002000000000526768746C6F6E6700
            0000200000000375726C54455854000000010000000000006E756C6C54455854
            000000010000000000004D7367655445585400000001000000000006616C7454
            6167544558540000000100000000000E63656C6C54657874497348544D4C626F
            6F6C010000000863656C6C546578745445585400000001000000000009686F72
            7A416C69676E656E756D0000000F45536C696365486F727A416C69676E000000
            0764656661756C740000000976657274416C69676E656E756D0000000F45536C
            69636556657274416C69676E0000000764656661756C740000000B6267436F6C
            6F7254797065656E756D0000001145536C6963654247436F6C6F725479706500
            0000004E6F6E6500000009746F704F75747365746C6F6E67000000000000000A
            6C6566744F75747365746C6F6E67000000000000000C626F74746F6D4F757473
            65746C6F6E67000000000000000B72696768744F75747365746C6F6E67000000
            00003842494D042800000000000C000000023FF00000000000003842494D0414
            000000000004000000053842494D040C0000000003E500000001000000200000
            00200000006000000C00000003C900180001FFD8FFED000C41646F62655F434D
            0001FFEE000E41646F626500648000000001FFDB0084000C08080809080C0909
            0C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E
            0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108002000
            2003012200021101031101FFDD00040002FFC4013F0000010501010101010100
            000000000000030001020405060708090A0B0100010501010101010100000000
            000000010002030405060708090A0B1000010401030204020507060805030C33
            010002110304211231054151611322718132061491A1B14223241552C1623334
            7282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E2
            65F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6
            B6C6D6E6F637475767778797A7B7C7D7E7F71100020201020404030405060707
            0605350100021103213112044151617122130532819114A1B14223C152D1F033
            2462E1728292435315637334F1250616A2B283072635C2D2449354A317644555
            367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F556667686
            96A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00
            EE3A5F4BC3EA586CCECE61BEFBCB9CE739CE0000E735AC635AE6FB7DAADFFCDC
            E8BFF7187F9CFF00FC9A6FABA40E8B8E4E80074FF9EF5CEF47EA7655D5C5F6B8
            8A725EE638B8E8371DDFF41C58A8F161843071E38C8E5038A440FEADCE5FE33A
            2239F24F98F6F2CA2309970C22655BCB8611FF0011E8FF00E6E745FF00B8C3FC
            E7FF00E4D56CAC0C6E977E1DF820D26CC86536B439C5AE63E41DCD7977D158A3
            A9DB7F5FAF2F73852EBC319CC6C0433FEA1DB9747D6F8C1FFC3B4FE57251961C
            90C928638C0E390E19002FC24A9C33E39E38E4CB298C91265191918EDEA83FFF
            D0EEFA5FA9FF00361BE934BAC355A18D1C9717581AB399D0F21FF57DCD353865
            32E36B5847B8886D6E6FF9ADDEB4B07233E92F37D569A6B6122B65704991F41A
            1AC47FDB63FEE0E6FF00DB27FF0024B3B11C39F140CF8E1C3038B8671E13FDFF
            00D27438F3427338C465C593DEB07FF1B71FA8745C9A7A660371EA7597D45CFB
            434490E7ED76BFD5D9B16BF5932CC03113994183F129FF006D8FFB839BFF006C
            9FFC920DD75FD4EFC5AEBC5BA8AE8B9B7DB6DEDD8219C3183F3B7293871444C6
            32499884786BFCDFA51C79646072800633924677FE73D4FF00FFD9003842494D
            042100000000005D00000001010000000F00410064006F006200650020005000
            68006F0074006F00730068006F00700000001700410064006F00620065002000
            500068006F0074006F00730068006F0070002000430043002000320030003100
            3400000001003842494D04060000000000070008010100030100FFE10E046874
            74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061
            636B657420626567696E3D22EFBBBF222069643D2257354D304D704365686948
            7A7265537A4E54637A6B633964223F3E203C783A786D706D65746120786D6C6E
            733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B3D224164
            6F626520584D5020436F726520352E352D633032312037392E3135353737322C
            20323031342F30312F31332D31393A34343A30302020202020202020223E203C
            7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777772E7733
            2E6F72672F313939392F30322F32322D7264662D73796E7461782D6E7323223E
            203C7264663A4465736372697074696F6E207264663A61626F75743D22222078
            6D6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861
            702F312E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61
            646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576
            743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73
            547970652F5265736F757263654576656E74232220786D6C6E733A64633D2268
            7474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E312F22
            20786D6C6E733A70686F746F73686F703D22687474703A2F2F6E732E61646F62
            652E636F6D2F70686F746F73686F702F312E302F2220786D703A43726561746F
            72546F6F6C3D2241646F62652050686F746F73686F7020434320323031342028
            57696E646F7773292220786D703A437265617465446174653D22323031342D30
            372D30315431343A32353A30312D30333A30302220786D703A4D657461646174
            61446174653D22323031342D30372D30315431343A32353A30312D30333A3030
            2220786D703A4D6F64696679446174653D22323031342D30372D30315431343A
            32353A30312D30333A30302220786D704D4D3A496E7374616E636549443D2278
            6D702E6969643A66323539366330362D626561662D386234622D616435642D61
            64636163663236613131342220786D704D4D3A446F63756D656E7449443D2261
            646F62653A646F6369643A70686F746F73686F703A61323164353432612D3031
            34342D313165342D386439332D6465363133376533396533392220786D704D4D
            3A4F726967696E616C446F63756D656E7449443D22786D702E6469643A613064
            38313330362D336631322D356334662D616430652D3562633739336138643466
            32222064633A666F726D61743D22696D6167652F6A706567222070686F746F73
            686F703A436F6C6F724D6F64653D2233222070686F746F73686F703A49434350
            726F66696C653D22735247422049454336313936362D322E31223E203C786D70
            4D4D3A486973746F72793E203C7264663A5365713E203C7264663A6C69207374
            4576743A616374696F6E3D2263726561746564222073744576743A696E737461
            6E636549443D22786D702E6969643A61306438313330362D336631322D356334
            662D616430652D356263373933613864346632222073744576743A7768656E3D
            22323031342D30372D30315431343A32353A30312D30333A3030222073744576
            743A736F6674776172654167656E743D2241646F62652050686F746F73686F70
            2043432032303134202857696E646F777329222F3E203C7264663A6C69207374
            4576743A616374696F6E3D227361766564222073744576743A696E7374616E63
            6549443D22786D702E6969643A66323539366330362D626561662D386234622D
            616435642D616463616366323661313134222073744576743A7768656E3D2232
            3031342D30372D30315431343A32353A30312D30333A3030222073744576743A
            736F6674776172654167656E743D2241646F62652050686F746F73686F702043
            432032303134202857696E646F777329222073744576743A6368616E6765643D
            222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F7279
            3E203C2F7264663A4465736372697074696F6E3E203C2F7264663A5244463E20
            3C2F783A786D706D6574613E2020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020203C3F787061636B657420656E643D2277223F3E
            FFE20C584943435F50524F46494C4500010100000C484C696E6F021000006D6E
            74725247422058595A2007CE00020009000600310000616373704D5346540000
            000049454320735247420000000000000000000000010000F6D6000100000000
            D32D485020200000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000001163707274000001500000
            003364657363000001840000006C77747074000001F000000014626B70740000
            0204000000147258595A00000218000000146758595A0000022C000000146258
            595A0000024000000014646D6E640000025400000070646D6464000002C40000
            0088767565640000034C0000008676696577000003D4000000246C756D690000
            03F8000000146D6561730000040C0000002474656368000004300000000C7254
            52430000043C0000080C675452430000043C0000080C625452430000043C0000
            080C7465787400000000436F7079726967687420286329203139393820486577
            6C6574742D5061636B61726420436F6D70616E79000064657363000000000000
            0012735247422049454336313936362D322E3100000000000000000000001273
            5247422049454336313936362D322E3100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000058595A20000000000000F35100010000000116CC58595A20000000000000
            0000000000000000000058595A200000000000006FA2000038F5000003905859
            5A2000000000000062990000B785000018DA58595A2000000000000024A00000
            0F840000B6CF64657363000000000000001649454320687474703A2F2F777777
            2E6965632E636800000000000000000000001649454320687474703A2F2F7777
            772E6965632E6368000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000064657363000000000000
            002E4945432036313936362D322E312044656661756C742052474220636F6C6F
            7572207370616365202D207352474200000000000000000000002E4945432036
            313936362D322E312044656661756C742052474220636F6C6F75722073706163
            65202D2073524742000000000000000000000000000000000000000000006465
            7363000000000000002C5265666572656E63652056696577696E6720436F6E64
            6974696F6E20696E2049454336313936362D322E310000000000000000000000
            2C5265666572656E63652056696577696E6720436F6E646974696F6E20696E20
            49454336313936362D322E310000000000000000000000000000000000000000
            00000000000076696577000000000013A4FE00145F2E0010CF140003EDCC0004
            130B00035C9E0000000158595A2000000000004C09560050000000571FE76D65
            61730000000000000001000000000000000000000000000000000000028F0000
            000273696720000000004352542063757276000000000000040000000005000A
            000F00140019001E00230028002D00320037003B00400045004A004F00540059
            005E00630068006D00720077007C00810086008B00900095009A009F00A400A9
            00AE00B200B700BC00C100C600CB00D000D500DB00E000E500EB00F000F600FB
            01010107010D01130119011F0125012B01320138013E0145014C015201590160
            0167016E0175017C0183018B0192019A01A101A901B101B901C101C901D101D9
            01E101E901F201FA0203020C0214021D0226022F02380241024B0254025D0267
            0271027A0284028E029802A202AC02B602C102CB02D502E002EB02F50300030B
            03160321032D03380343034F035A03660372037E038A039603A203AE03BA03C7
            03D303E003EC03F9040604130420042D043B0448045504630471047E048C049A
            04A804B604C404D304E104F004FE050D051C052B053A05490558056705770586
            059605A605B505C505D505E505F6060606160627063706480659066A067B068C
            069D06AF06C006D106E306F507070719072B073D074F076107740786079907AC
            07BF07D207E507F8080B081F08320846085A086E0882089608AA08BE08D208E7
            08FB09100925093A094F09640979098F09A409BA09CF09E509FB0A110A270A3D
            0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B390B510B690B800B980BB0
            0BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC00CD90CF30D0D0D260D40
            0D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E640E7F0E9B0EB60ED20EEE
            0F090F250F410F5E0F7A0F960FB30FCF0FEC1009102610431061107E109B10B9
            10D710F511131131114F116D118C11AA11C911E81207122612451264128412A3
            12C312E31303132313431363138313A413C513E5140614271449146A148B14AD
            14CE14F01512153415561578159B15BD15E0160316261649166C168F16B216D6
            16FA171D17411765178917AE17D217F7181B18401865188A18AF18D518FA1920
            1945196B199119B719DD1A041A2A1A511A771A9E1AC51AEC1B141B3B1B631B8A
            1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D471D701D991DC31DEC1E16
            1E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA20152041206C209820C4
            20F0211C2148217521A121CE21FB22272255228222AF22DD230A233823662394
            23C223F0241F244D247C24AB24DA250925382568259725C725F7262726572687
            26B726E827182749277A27AB27DC280D283F287128A228D429062938296B299D
            29D02A022A352A682A9B2ACF2B022B362B692B9D2BD12C052C392C6E2CA22CD7
            2D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F242F5A2F912FC72FFE3035
            306C30A430DB3112314A318231BA31F2322A3263329B32D4330D3346337F33B8
            33F1342B3465349E34D83513354D358735C235FD3637367236AE36E937243760
            379C37D738143850388C38C839053942397F39BC39F93A363A743AB23AEF3B2D
            3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE03E203E603EA03EE03F21
            3F613FA23FE24023406440A640E74129416A41AC41EE4230427242B542F7433A
            437D43C044034447448A44CE45124555459A45DE4622466746AB46F04735477B
            47C04805484B489148D7491D496349A949F04A374A7D4AC44B0C4B534B9A4BE2
            4C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F004F494F934FDD50275071
            50BB51065150519B51E65231527C52C75313535F53AA53F65442548F54DB5528
            557555C2560F565C56A956F75744579257E0582F587D58CB591A596959B85A07
            5A565AA65AF55B455B955BE55C355C865CD65D275D785DC95E1A5E6C5EBD5F0F
            5F615FB36005605760AA60FC614F61A261F56249629C62F06343639763EB6440
            649464E9653D659265E7663D669266E8673D679367E9683F689668EC6943699A
            69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D606DB96E126E6B6EC46F1E
            6F786FD1702B708670E0713A719571F0724B72A67301735D73B87414747074CC
            7528758575E1763E769B76F8775677B37811786E78CC792A798979E77A467AA5
            7B047B637BC27C217C817CE17D417DA17E017E627EC27F237F847FE5804780A8
            810A816B81CD8230829282F4835783BA841D848084E3854785AB860E867286D7
            873B879F8804886988CE8933899989FE8A648ACA8B308B968BFC8C638CCA8D31
            8D988DFF8E668ECE8F368F9E9006906E90D6913F91A89211927A92E3934D93B6
            9420948A94F4955F95C99634969F970A977597E0984C98B89924999099FC9A68
            9AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D9F8B9FFAA069A0D8A147
            A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61AA68BA6FDA76EA7E0A852
            A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8B
            B000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49CB513B58AB601B679B6F0
            B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84
            BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4C451C4CEC54BC5C8C646
            C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36
            CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6D449D4CBD54ED5D1D655
            D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2
            DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473E4FCE584E60DE696E71F
            E7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCC
            F058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DEF66DF6FBF78AF819F8A8
            F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDCFF6DFFFFFFEE00264164
            6F6265006440000000010300150403060A0D0000000000000000000000000000
            0000FFDB00840001010101010101010101010101010101010101010101010101
            0101010101010101010101010101010101010202020202020202020202030303
            0303030303030301010101010101010101010202010202030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303030303030303FFC20011080020002003011100021101031101FFC400D600
            0002020300000000000000000000000006080007010309010003010003000000
            0000000000000000000507060203081000010403000007010000000000000000
            0501030406000216113112131507173211000202010203050509000000000000
            00020301040500061112132141513214D394D435366181B1C15262B376961200
            01020402040B0705000000000000000102030011040521123141512281A1C132
            92B2D2139314357191B1D1E14234447415257513010002020301000203010000
            000000000111210031415161107181F0C1F191FFDA000C030103021103110000
            01EA848ED76068B2F00312680C5D214C623E81C03A36FF003E09A8794AE1E85B
            F9F5B1549948F43DC935CD1401A56DFF00FFDA0008010100010502AC5603DA03
            FE754CCFCEA9984C08EA9CEFAF1535A5D42CCFC4B76B65933EFB75FE6B0B213E
            B16A9041EFAFCFD309C2AD5C76F5B41081D84BDAEB9DAEB93264EB5CEFFFDA00
            08010200010502162E19587CD04CE68264A1F1843F5B5F00618A38C98426EC8B
            01CF215EE72DA0293BD7480494C0C34BE3AD4C8DAF59BF3899F3898F3CF977FF
            00FFDA000801030001050230627869FD5D833ABB0643272CDC7B522AD84E8769
            F04A2198D59AF7998F6BB0DEC5174B40CB043905C027A7725146484E79739E5C
            6188C1237FFFDA0008010202063F026EE3716CBB54E951C54AC3788909118611
            F823A4BED47E08E92FB516DA8B724B6575286D426485257B412746A8A2274495
            D7540A87967CBBCB5033D1BC67C465C10CD6E63E5CBE00D99701F0333ED8B47E
            F9AE584F72925DEE9C901B66A9429269D42B92F1581AE58248F763C11684D2D3
            A9552824AA5B5523C52970459CCBF5ACF2C3DFCCD2D57904B0A213DC65DECC99
            4B7138E9C271E915DE17D63D22BBC2FAC5BDA6ADEFB4D34FA5C529C4E5E6EA1B
            671FFFDA0008010302063F0272D76B703348C848002538EE824924199338F503
            D147663D40F451D98BB52DD141D08A55BA839520A548968200D3AE2BC0D334F5
            130AA561B1E658425425A7744B8C6696D30FD0644F994D3151DB9A455D6121EC
            8BD7F9EF7C042BBF584B3DF35989D99513842D352936F53010553DD9E2A07DE6
            5C317B5D5D4A5148E252944CFDA9CC38E655C317C139FF005EFF002434296A59
            152B700CCA73548F38CCE1A23D6ADFE30F947AD5BFC61F28B93CF5CA9DD79DA7
            53494B4ACFCFD6764A3FFFDA0008010101063F0246E0DC086653259465B7318E
            B76C012016DE95D7AEB4BD40B4AC15D91F96BE4A1EF991F8BD7C943DF323F17A
            DB990DBEB6E38AE6E1C7622F202CD96D7B74F21D4038729ED6C73AB97884F74F
            DDAC3114F0815DD999F088C85C999D0642DB9B143316EDD57934CBA23EAD82D1
            9E253D31E83CD725FA42754F31D570D0767515ABC731C27D1831357872F939BD
            3360CE3C4B5B57FBAEDFFE47E97E914C75A2C5E602B295124C379DABE0A8188E
            D99E728D316741EBCD232EDC922A9AE62C9A882BD36A6067B781A97CF11DF231
            ADA6AC6D07DAC8D2759B5786BAE58C0B3746B3CA4F97B9055857C7F6EB689C8C
            8496F3DB85225E61E26E9E59FB634F2BF4328746AD36B029D5C4C019B7ACAE01
            59208441B279CA7978F8EBE95DEBFE7D9EDF5F4AEF5FF3ECF6FAC155AB82CD63
            6AE37354B3576EE6A97A0080A1CE415EB811993D8F23E1D9E5FC3FFFDA000801
            0103013F2105F57A4BF2AA1898340F864CA402A36347B1046CD883A0EB6950F0
            0C968B63FB5D3672343936D2CE5A990FA46EFE5EE499A1866C25719FF3BA385E
            8ABC2DE08225619BB90F43DE3084850AC0BA761F711FB0A2680A4024971F6F5E
            DE27E6469511E85225C7FFDA0008010203013F217E0010000180050FEA0FA000
            03CE14E81D9212B87D880494C413B524C201BA246F4BDC8CDDB6D0E9D4C41DFA
            CFE4FBC2332CAE2A387EF14F004BA223D10ED1919C7FCA1B4C7633F18CFA15A1
            E2E98153505F411962BE4B62B3FD9E3FD9E23A047B134355498AD7E253FFDA00
            08010303013F2175354AB5ED9567FB95F95EBA31BCC8F1A24A07256A6416959E
            C027A09C8B56C63A1D9932CA9465D8DC489D78F974A8C2C8802927F061F12348
            0677C92F02C6160110A8C4F589EB047000934D5B1EBD09A1B091D04C747DBB76
            712EFD301700249BDFE607FFDA000C030103021103110000107FE0BF9523FBFF
            DA0008010103013F10B0047FBBCE73C9203EEAF5E35F65DDF3914D263915785F
            C3A8F0B2BD1915EDF4E92D6BFDD32D36C3C8A5851BA45368570F101F3D752D12
            05A0E11F8508566AB8933B09B5CA4F126ADE3CD92F0C0A13FE18A092070B267D
            512A3EEB48A9FA78F279880C6B9DB051079BFFDA0008010203013F103ADB7847
            39CA18941007C6AD5E789588A018008D888580C824AE8055FD1935C2B2904ABB
            DA9930607A6FA0A56D47B40F2703809B288BC05ACC6B8C44617432AAE22DB00D
            E1544E5745CC12E9D98AC5750A564709A7DC53B8C84C61A610D17AC7C0E1E3AC
            0CEB694E1E951583FFDA0008010303013F1041EA84A0C22B0101457D04890337
            0442DB93153A088E1850D036A801F97222B54C128151170A070773E1DAAA9749
            D711B063C7B3E20B5D28262F94C143BC936054CE148BAC16D208C871293B7018
            03CD580181E4624F31B38A9BFDB4AE5437131F5E3C9D7EEDA9BD923B41061FFF
            D9}
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 34.015769999999920000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'P'#225'gina: [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 30.236239999999900000
          Width = 982.677800000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 1046.929810000000000000
        Condition = '<frxDBRiscos."processo">'
        object Memo6: TfrxMemoView
          Width = 1045.039736220000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clInactiveCaption
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Processo: [frxDBRiscos."processo"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 124.724477800000000000
        Top = 200.315090000000000000
        Width = 1046.929810000000000000
        DataSet = FormAnaliseRisco.frxDBRiscos
        DataSetName = 'frxDBRiscos'
        RowCount = 0
        Stretched = True
        object Memo13: TfrxMemoView
          Top = 19.000000000000000000
          Width = 88.818646220000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'probabilidade'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."probabilidade"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 88.834880000000000000
          Top = 19.000000000000000000
          Width = 89.196850390000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'consequencia'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."consequencia"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 229.551330000000000000
          Top = 19.000000000000000000
          Width = 58.582657640000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'tipovar'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."tipovar"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 288.000000000000000000
          Top = 19.000000000000000000
          Width = 182.173228350000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'fator'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."fator"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 469.795275590000000000
          Top = 19.000000000000000000
          Width = 363.590551180000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'variavel'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."variavel"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 178.417440000000000000
          Top = 19.000000000000000000
          Width = 51.023622050000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo3OnBeforePrint'
          ShowHint = False
          DataField = 'GrauRiscoDesc'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."GrauRiscoDesc"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 833.276130000000000000
          Top = 19.000000000000000000
          Width = 211.653543310000000000
          Height = 18.897637800000000000
          ShowHint = False
          DataField = 'tipo'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."tipo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 0.338590000000000000
          Top = 0.157468109999996400
          Width = 88.818646220000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Probabilidade')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo20: TfrxMemoView
          Left = 89.283471890000000000
          Top = 0.157468109999996400
          Width = 88.818887870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Consequ'#234'ncia')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo2: TfrxMemoView
          Left = 178.086501890000000000
          Width = 51.023587870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Grau')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo7: TfrxMemoView
          Left = 229.417322834646000000
          Width = 58.582647870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Int./Ext.')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Left = 288.503941890000000000
          Width = 183.307137870000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Fator')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo11: TfrxMemoView
          Left = 470.212661890000000000
          Width = 362.834709130000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Vari'#225'vel')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo15: TfrxMemoView
          Left = 833.394250000000000000
          Width = 211.653509130000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo1: TfrxMemoView
          Top = 37.795300000000000000
          Width = 833.385826771654000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo17: TfrxMemoView
          Left = 833.276130000000000000
          Top = 37.795300000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'PMC')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo18: TfrxMemoView
          Left = 938.882500000000000000
          Top = 37.795300000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = clMenuBar
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'PDCA')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo21: TfrxMemoView
          Top = 56.692950000000000000
          Width = 833.385826770000000000
          Height = 68.031527800000010000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'mac_texto'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBRiscos."mac_texto"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 833.276130000000000000
          Top = 56.692950000000000000
          Width = 105.826703310000000000
          Height = 68.031527800000010000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'pmc'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."pmc"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 939.102970000000000000
          Top = 56.692950000000000000
          Width = 105.826703310000000000
          Height = 68.031527800000010000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'mac_pdca'
          DataSet = FormAnaliseRisco.frxDBRiscos
          DataSetName = 'frxDBRiscos'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRiscos."mac_pdca"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object dspExcel: TDataSetProvider
    DataSet = zqryExcel
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 696
    Top = 472
  end
  object cdsExcel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExcel'
    Left = 736
    Top = 472
  end
  object zqryExcel: TZQuery
    Connection = Conexao
    Params = <>
    Left = 656
    Top = 472
  end
  object dspAux5: TDataSetProvider
    DataSet = zqryAux5
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 652
    Top = 56
  end
  object cdsAux5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux5'
    Left = 692
    Top = 56
  end
  object zqryAux5: TZQuery
    Connection = Conexao
    Params = <>
    Left = 612
    Top = 56
  end
  object dspAux6: TDataSetProvider
    DataSet = zqryAux6
    Options = [poAutoRefresh, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    Left = 804
    Top = 56
  end
  object cdsAux6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAux6'
    Left = 844
    Top = 56
  end
  object zqryAux6: TZQuery
    Connection = Conexao
    Params = <>
    Left = 764
    Top = 56
  end
end
