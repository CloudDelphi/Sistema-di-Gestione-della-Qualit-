unit frm_dm;

interface

uses
  SysUtils, Classes, DB, SqlExpr, FMTBcd, DBClient, Provider,
  WideStrings, Forms, Dialogs, Windows,
  frxClass, frxChart, frxGradient, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZConnection, ZAbstractConnection, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze;

type
  Tdm = class(TDataModule)
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
    dspEstados: TDataSetProvider;
    cdsEstados: TClientDataSet;
    dspClassificacoes: TDataSetProvider;
    cdsClassificacoes: TClientDataSet;
    dsClassificacoes: TDataSource;
    dspAuxiliar: TDataSetProvider;
    cdsAuxiliar: TClientDataSet;
    dspExperiencias: TDataSetProvider;
    cdsExperiencias: TClientDataSet;
    dsExperiencias: TDataSource;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    dspFuncoes: TDataSetProvider;
    cdsFuncoes: TClientDataSet;
    dsFuncoes: TDataSource;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    dsHabilidades: TDataSource;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    dspListaMestra: TDataSetProvider;
    cdsListaMestra: TClientDataSet;
    dsListaMestra: TDataSource;
    dspTartaruga: TDataSetProvider;
    cdsTartaruga: TClientDataSet;
    dspInfra: TDataSetProvider;
    cdsInfra: TClientDataSet;
    dsInfra: TDataSource;
    dspHistProf: TDataSetProvider;
    cdsHistProf: TClientDataSet;
    dsHistProf: TDataSource;
    dspAprovaDocs: TDataSetProvider;
    cdsAprovaDocs: TClientDataSet;
    dsAprovaDocs: TDataSource;
    dspProcedimentos: TDataSetProvider;
    cdsp: TClientDataSet;
    dsProcedimentos: TDataSource;
    dspPMC: TDataSetProvider;
    cdsPMC: TClientDataSet;
    dsPMC: TDataSource;
    dspFormularios: TDataSetProvider;
    cdsFormularios: TClientDataSet;
    dsFormularios: TDataSource;
    dspPmc_Acoes: TDataSetProvider;
    cdsPmc_Acoes: TClientDataSet;
    dsPmc_Acoes: TDataSource;
    dspTabela_Combos: TDataSetProvider;
    cdsTabela_Combos: TClientDataSet;
    dspManutencao: TDataSetProvider;
    cdsManutencao: TClientDataSet;
    dsManutencao: TDataSource;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    dsUsuario: TDataSource;
    dspAuditoria: TDataSetProvider;
    cdsAuditoria: TClientDataSet;
    dspAnalise: TDataSetProvider;
    cdsAnalise: TClientDataSet;
    dsAnalise: TDataSource;
    dspAnalise_Acoes: TDataSetProvider;
    cdsAnalise_Acoes: TClientDataSet;
    dsAnalise_Acoes: TDataSource;
    dspIndicadores: TDataSetProvider;
    cdsIndicadores: TClientDataSet;
    dsIndicadores: TDataSource;
    dspFuncHab: TDataSetProvider;
    cdsFuncHab: TClientDataSet;
    dsFuncHab: TDataSource;
    cdsFuncHabDescHab: TStringField;
    dspFuncTre: TDataSetProvider;
    cdsFuncTre: TClientDataSet;
    StringField1: TStringField;
    dsFuncTre: TDataSource;
    cdsPMCDescTipo: TStringField;
    cdsPMCDescOrig: TStringField;
    cdsPMCNomeEmit: TStringField;
    dspColaboradores1: TDataSetProvider;
    cdsColaboradores1: TClientDataSet;
    dsColaboradores1: TDataSource;
    cdsPmc_AcoesRespNome: TStringField;
    cdsPMCNomeResp: TStringField;
    cdsPMCNomeProc: TStringField;
    cdsIndicadoresDescProc: TStringField;
    cdsColaboradoresDescFunc: TStringField;
    cdsColaboradoresDescExpe: TStringField;
    dspPlanoAcao: TDataSetProvider;
    cdsPlanoAcao: TClientDataSet;
    dsPlanoAcao: TDataSource;
    cdspDescTipo: TStringField;
    cdsFormulariosDescProtecao: TStringField;
    dspParametros: TDataSetProvider;
    cdsParametros: TClientDataSet;
    dsParametros: TDataSource;
    dspVisualizaAnalise: TDataSetProvider;
    cdsVisualizaAnalise: TClientDataSet;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField3: TStringField;
    IntegerField6: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField7: TIntegerField;
    dsVisualizaAnalise: TDataSource;
    cdsInfraDescTipo: TStringField;
    cdsInfraDescProc: TStringField;
    cdsVisualizaAnalisepraz_aac: TSQLTimeStampField;
    cdsManutencaoDescItem: TStringField;
    dspAcesso: TDataSetProvider;
    cdsAcesso: TClientDataSet;
//    rvRaveProject: TRvProject;
//    RvdsConexao: TRvDataSetConnection;
    cdsIndicadoresMetaConcatenada: TStringField;
//    RvSystem1: TRvSystem;
    cdsFormulariosArmazenar: TStringField;
    cdsManutencaoDescProcesso: TStringField;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    dspAux2: TDataSetProvider;
    cdsAux2: TClientDataSet;
    cdsAnalise_AcoesSaidas: TStringField;
    cdsManutencaoQuando: TStringField;
    dspAux3: TDataSetProvider;
    cdsAux3: TClientDataSet;
    dspAux4: TDataSetProvider;
    cdsAux4: TClientDataSet;
    cdsIndicadoresDescPeriodicidade: TStringField;
    Conexao: TZConnection;
    zqryAuxiliar: TZQuery;
    zqryAux2: TZQuery;
    zqryAux: TZQuery;
    zqryAux3: TZQuery;
    zqryAux4: TZQuery;
    zqryAcesso: TZQuery;
    zqryAuditoria: TZQuery;
    zqryAprovaDocs: TZQuery;
    CdsAprovaDocsapro_lis1: TWideStringField;
    CdsAprovaDocsatua_lis1: TWideStringField;
    cdsAprovaDocscodi_lis: TLargeintField;
    cdsAprovaDocsdata_lis: TDateTimeField;
    CdsAprovaDocsdesc_lis1: TWideStringField;
    cdsAprovaDocsdtap_lis: TDateTimeField;
    CdsAprovaDocsiden_lis1: TWideStringField;
    cdsAprovaDocsproc_lis: TLargeintField;
    cdsAprovaDocsquem_lis: TLargeintField;
    cdsAprovaDocsresp_lis: TLargeintField;
    CdsAprovaDocsrevi_lis1: TWideStringField;
    cdsAprovaDocstipo_lis: TLargeintField;
    zqryAnalise: TZQuery;
    cdsAnalisecodi_ana: TLargeintField;
    cdsAnaliseentr_ana: TMemoField;
    cdsAnaliseresu_ana: TMemoField;
    zqryAnalise_Acoes: TZQuery;
    cdsAnalise_Acoescodi_aac: TLargeintField;
    cdsAnalise_Acoescodi_ana: TLargeintField;
    CdsAnalise_Acoespare_aac1: TWideStringField;
    cdsAnalise_Acoespraz_aac: TDateTimeField;
    cdsAnalise_Acoesresp_aac: TLargeintField;
    cdsAnalise_Acoessaid_aac: TMemoField;
    cdsAnalise_Acoesproc_aac: TLargeintField;
    cdsAnalise_Acoesdcad_aac: TDateTimeField;
    zqryColaboradores: TZQuery;
    cdsColaboradorescodi_col: TLargeintField;
    CdsColaboradoresconc_col: TWideStringField;
    cdsColaboradoreseduc_col: TLargeintField;
    CdsColaboradoresesco_col: TWideStringField;
    cdsColaboradoresexpe_col: TLargeintField;
    cdsColaboradoresfunc_col: TLargeintField;
    CdsColaboradoresnome_col: TWideStringField;
    cdsColaboradoresproc_col: TLargeintField;
    cdsColaboradoresobs_col: TMemoField;
    zqryColaboradores1: TZQuery;
    zqryClassificacoes: TZQuery;
    zqryEmpresa: TZQuery;
    zqryEstados: TZQuery;
    zqryExperiencias: TZQuery;
    zqryFormularios: TZQuery;
    cdsFormulariosarma_for: TLargeintField;
    CdsFormulariosarqu_for1: TWideStringField;
    cdsFormularioscodi_for: TLargeintField;
    cdsFormulariosdesc_for: TLargeintField;
    CdsFormulariosiden_for1: TWideStringField;
    CdsFormulariosnume_for1: TWideStringField;
    cdsFormulariosprot_for: TLargeintField;
    cdsFormulariosqtde_for: TLargeintField;
    cdsFormulariosrecu_for: TLargeintField;
    CdsFormulariosrete_for1: TWideStringField;
    CdsFormulariosrevi_for1: TWideStringField;
    zqryFuncoes: TZQuery;
    zqryFuncHab: TZQuery;
    zqryFuncTre: TZQuery;
    zqryHabilidades: TZQuery;
    zqryHistProf: TZQuery;
    zqryIndicadores: TZQuery;
    zqryInfra: TZQuery;
    zqryListaMestra: TZQuery;
    zqryManutencao: TZQuery;
    zqryProcedimento: TZQuery;
    Cds_lis: TWideStringField;
    Cds_lis1: TWideStringField;
    Cds_lis2: TWideStringField;
    cdspcodi_lis: TLargeintField;
    cdspdata_lis: TDateTimeField;
    Cds_lis3: TWideStringField;
    cdspdtap_lis: TDateTimeField;
    Cds_lis4: TWideStringField;
    cdspproc_lis: TLargeintField;
    cdspquem_lis: TLargeintField;
    cdspresp_lis: TLargeintField;
    Cds_lis5: TWideStringField;
    cdsptipo_lis: TLargeintField;
    zqryPMC: TZQuery;
    zqryPMC_Acoes: TZQuery;
    CdsPmc_Acoesarqu_aco1: TWideStringField;
    cdsPmc_Acoesdesc_aco: TMemoField;
    cdsPmc_Acoescodi_aco: TLargeintField;
    cdsPmc_Acoescodi_pmc: TLargeintField;
    CdsPmc_Acoespraz_aco1: TWideStringField;
    cdsPmc_Acoesresp_aco: TLargeintField;
    cdsPmc_Acoesvimp_aco: TMemoField;
    zqryProcessos: TZQuery;
    zqryPlanoAcao: TZQuery;
    cdsPlanoAcaoacao_pla: TMemoField;
    cdsPlanoAcaocodi_pla: TLargeintField;
    cdsPlanoAcaocola_pla: TLargeintField;
    cdsPlanoAcaocome_pla: TMemoField;
    CdsPlanoAcaoefic_pla: TWideStringField;
    cdsPlanoAcaopraz_pla: TDateTimeField;
    cdsPlanoAcaoresp_pla: TLargeintField;
    zqryParametros: TZQuery;
    cdsParametrosnota_padrao_habilidade: TFloatField;
    CdsParametrosaudit_interna_ja_fez1: TWideStringField;
    CdsParametroscontr1: TWideStringField;
    CdsManutencaoanom_man: TWideStringField;
    cdsManutencaocodi_inf: TLargeintField;
    cdsManutencaocodi_man: TLargeintField;
    CdsManutencaocomo_man: TWideStringField;
    cdsManutencaodata_man: TDateTimeField;
    cdsManutencaoonde_man: TLargeintField;
    CdsManutencaooque_man: TWideStringField;
    CdsManutencaoquan_man: TWideStringField;
    cdsManutencaoquem_man: TLargeintField;
    cdsManutencaoproc_man: TLargeintField;
    CdsManutencaoefic_man: TWideStringField;
    zqryTartaruga: TZQuery;
    zqryTabela_Combos: TZQuery;
    zqryTreinamentos: TZQuery;
    zqryUsuario: TZQuery;
    zqryVizualizaAnalise: TZQuery;
    cdsFuncHabcodi_fun: TLargeintField;
    cdsFuncHabcodi_hab: TLargeintField;
    cdsFuncTrecodi_fun: TLargeintField;
    cdsFuncTrecodi_tre: TLargeintField;
    CdsFuncTretipo_tre1: TWideStringField;
    CdsListaMestraapro_lis: TWideStringField;
    CdsListaMestraatua_lis: TWideStringField;
    cdsListaMestracodi_lis: TLargeintField;
    cdsListaMestradata_lis: TDateTimeField;
    CdsListaMestradesc_lis: TWideStringField;
    cdsListaMestradtap_lis: TDateTimeField;
    CdsListaMestraiden_lis: TWideStringField;
    cdsListaMestraproc_lis: TLargeintField;
    cdsListaMestraquem_lis: TLargeintField;
    cdsListaMestraresp_lis: TLargeintField;
    CdsListaMestrarevi_lis: TWideStringField;
    cdsListaMestratipo_lis: TLargeintField;
    cdsListaMestraqtde_lis: TLargeintField;
    CdsListaMestraarma_lis: TWideStringField;
    cdsIndicadorescodi_ind: TLargeintField;
    CdsIndicadoresdesc_ind: TWideStringField;
    cdsIndicadoresmeta_ind: TFloatField;
    cdsIndicadoresproc_ind: TLargeintField;
    CdsIndicadorestipo_ind: TWideStringField;
    cdsIndicadoresperi_ind: TLargeintField;
    cdsInfracodi_inf: TLargeintField;
    CdsInfradesc_inf1: TWideStringField;
    CdsInfraiden_inf1: TWideStringField;
    cdsInfraproc_inf: TLargeintField;
    cdsInfraqtde_inf: TLargeintField;
    cdsInfraseto_inf: TLargeintField;
    cdsInfratipo_inf: TLargeintField;
    CdsInframanu_inf1: TWideStringField;
    cdsPmc_AcoesDescricao: TStringField;
    cdsAnalise_Acoesaac_resultados: TMemoField;
    cdsPlanoAcaoAcao: TStringField;
    cdsListaMestraarqu_lis: TMemoField;
    cdsAprovaDocsarqu_lis: TMemoField;
    cdsFuncoescodi_fun: TLargeintField;
    cdsFuncoesdesc_fun: TWideStringField;
    cdsFuncoeseduc_fun: TLargeintField;
    cdsFuncoesexpe_fun: TLargeintField;
    cdsFuncoesresp_fun: TMemoField;
    IdAntiFreeze1: TIdAntiFreeze;
    Msg: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    SMTP: TIdSMTP;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    cdsColaboradorescol_status: TIntegerField;
    cdsPMCcaus_pmc: TWideMemoField;
    cdsPMCcodi_pmc: TLargeintField;
    cdsPMCdata_pmc: TDateTimeField;
    cdsPMCefic_pmc: TLargeintField;
    cdsPMCemit_pmc: TLargeintField;
    cdsPMCimed_pmc: TWideMemoField;
    cdsPMCncon_pmc: TWideMemoField;
    cdsPMCorig_pmc: TLargeintField;
    cdsPMCprcs_pmc: TLargeintField;
    cdsPMCproc_pmc: TLargeintField;
    cdsPMCrequ_pmc: TWideStringField;
    cdsPMCresp_pmc: TLargeintField;
    cdsPMCtipo_pmc: TLargeintField;
    cdsPMCvefi_pmc: TWideMemoField;
    cdsPMCnume_pmc: TWideStringField;
    cdsPMCpmc_datafecha: TDateTimeField;
    conMySQL: TZConnection;
    dspAuxMySQL: TDataSetProvider;
    cdsAuxMySQL: TClientDataSet;
    zqryAuxMySQL: TZQuery;
    cdsManutencaoIdentItem: TStringField;
    dsEstados: TDataSource;
    frxReport1: TfrxReport;
    dspExcel: TDataSetProvider;
    cdsExcel: TClientDataSet;
    zqryExcel: TZQuery;
    dspAux5: TDataSetProvider;
    cdsAux5: TClientDataSet;
    zqryAux5: TZQuery;
    dspAux6: TDataSetProvider;
    cdsAux6: TClientDataSet;
    zqryAux6: TZQuery;
    dspAuxParametro: TDataSetProvider;
    cdsAuxParametro: TClientDataSet;
    zqryAuxParametro: TZQuery;
    procedure cdsAnalise_AcoesCalcFields(DataSet: TDataSet);
    procedure cdsAnaliseresu_anaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnaliseentr_anaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPmc_Acoesdesc_acoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsValorIndicadoresCalcFields(DataSet: TDataSet);
    procedure cdsAprovaDocsCalcFields(DataSet: TDataSet);
    procedure cdsAprovaDocsBeforeOpen(DataSet: TDataSet);
    procedure cdsAprovaDocsAfterPost(DataSet: TDataSet);
    procedure cdsListaMestraCalcFields(DataSet: TDataSet);
    procedure cdsListaMestraBeforeOpen(DataSet: TDataSet);
    procedure cdsHistProfAfterPost(DataSet: TDataSet);
    procedure cdsInfraAfterPost(DataSet: TDataSet);
    procedure cdsTartarugaAfterPost(DataSet: TDataSet);
    procedure cdsListaMestraAfterPost(DataSet: TDataSet);
    procedure cdsFuncoesAfterPost(DataSet: TDataSet);
    procedure cdsProcessosAfterPost(DataSet: TDataSet);
    procedure cdsExperienciasAfterPost(DataSet: TDataSet);
    procedure cdsClassificacoesAfterPost(DataSet: TDataSet);
    procedure cdsEmpresaAfterPost(DataSet: TDataSet);
    procedure cdsHabilidadesAfterPost(DataSet: TDataSet);
    procedure cdsTreinamentosAfterPost(DataSet: TDataSet);
    procedure cdsColaboradoresAfterPost(DataSet: TDataSet);
    procedure cdsPMCAfterPost(DataSet: TDataSet);
    procedure cdsPMCCalcFields(DataSet: TDataSet);
    procedure cdsFormulariosAfterPost(DataSet: TDataSet);
    procedure cdsPmc_AcoesAfterPost(DataSet: TDataSet);
    procedure cdsColaboradoresBeforeOpen(DataSet: TDataSet);
    procedure cdsInfraCalcFields(DataSet: TDataSet);
    procedure cdsManutencaoAfterPost(DataSet: TDataSet);
    procedure cdsManutencaoBeforeOpen(DataSet: TDataSet);
    procedure cdsUsuarioAfterPost(DataSet: TDataSet);
    procedure cdsManutencaoCalcFields(DataSet: TDataSet);
    procedure cdsFuncoesBeforeOpen(DataSet: TDataSet);
    procedure cdsFuncoesCalcFields(DataSet: TDataSet);
    procedure cdsColaboradoresCalcFields(DataSet: TDataSet);
    procedure cdsAnaliseAfterPost(DataSet: TDataSet);
    procedure cdsAnalise_AcoesAfterPost(DataSet: TDataSet);
    procedure cdsAnaliseAfterScroll(DataSet: TDataSet);
    procedure cdsIndicadoresAfterPost(DataSet: TDataSet);
    procedure cdsValorIndicadoresAfterPost(DataSet: TDataSet);
    procedure cdsPlanoAcaoAfterPost(DataSet: TDataSet);
    procedure cdsPlanoAcaoacao_plaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdspAfterPost(DataSet: TDataSet);
    procedure cdspCalcFields(DataSet: TDataSet);
    procedure cdsFormulariosCalcFields(DataSet: TDataSet);
    procedure cdsVisualizaAnaliseCalcFields(DataSet: TDataSet);
    procedure cdsIndicadoresBeforeDelete(DataSet: TDataSet);
    procedure cdsIndicadoresCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPmc_AcoesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses Funcoes, frm_ValoresIndicador, frm_Log;

{$R *.dfm}

procedure Tdm.cdsAnaliseAfterPost(DataSet: TDataSet);
begin
//  cdsAnalise.ApplyUpdates(0);
end;

procedure Tdm.cdsAnaliseAfterScroll(DataSet: TDataSet);
begin
//   if cdsAnalise.State <> dsInsert then
//   begin
//      with cdsAnalise_Acoes do
//      begin
//         Active:= False;
//         CommandText:= ' SELECT * FROM analise_acoes' +
//                       ' WHERE codi_ana = ' + QuotedStr(cdsAnalise.FieldByName('codi_ana').AsString);
//         Active:= True;
//      end;
//   end;
end;

procedure Tdm.cdsAnaliseentr_anaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Copy(cdsAnaliseentr_ana.AsString, 1, 100);
end;

procedure Tdm.cdsAnaliseresu_anaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Copy(cdsAnaliseresu_ana.AsString, 1, 50);
end;

procedure Tdm.cdsAnalise_AcoesAfterPost(DataSet: TDataSet);
begin
   cdsAnalise_Acoes.ApplyUpdates(0);
end;

procedure Tdm.cdsAnalise_AcoesCalcFields(DataSet: TDataSet);
begin
   cdsAnalise_AcoesSaidas.AsString:= Copy(cdsAnalise_Acoessaid_aac.AsString,1,50);
end;

procedure Tdm.cdsAprovaDocsAfterPost(DataSet: TDataSet);
begin
  cdsAprovaDocs.ApplyUpdates(0);
end;

procedure Tdm.cdsAprovaDocsBeforeOpen(DataSet: TDataSet);
begin
//  CreatecdsAprovaDocs;
end;

procedure Tdm.cdsAprovaDocsCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAprovaDocs do
   begin
      Edit;
      if FieldByName('tipo_lis').AsInteger = 0 then
         FieldByName('tipo').AsString:= 'EXTERNO'
      else
         FieldByName('tipo').AsString:= 'INTERNO';
   end;

end;

procedure Tdm.cdsClassificacoesAfterPost(DataSet: TDataSet);
begin
  cdsClassificacoes.ApplyUpdates(0);
end;

procedure Tdm.cdsColaboradoresAfterPost(DataSet: TDataSet);
begin
  cdsColaboradores.ApplyUpdates(0);
end;

procedure Tdm.cdsColaboradoresBeforeOpen(DataSet: TDataSet);
begin
//  CreatecdsColaboradores;
end;

procedure Tdm.cdsColaboradoresCalcFields(DataSet: TDataSet);
begin
  with cdsAuxiliar do
  begin
    Active:= False;
    CommandText:= ' Select valo_com from tabela_combos'+
                  ' Where tipo_com = 7'+
                  ' And codi_com = ' + '''' + cdsColaboradores.FieldByName('expe_col').AsString + '''';
    Active:= True;
    cdsColaboradores.FieldByName('DescExpe').AsString:= cdsAuxiliar.FieldByName('valo_com').AsString
  end;

  with cdsAuxiliar do
  begin
    Active:= False;
    CommandText:= ' Select desc_fun from funcoes'+
                  ' Where codi_fun = ' + '''' + cdsColaboradores.FieldByName('func_col').AsString + '''';
    Active:= True;
    cdsColaboradores.FieldByName('DescFunc').AsString:= cdsAuxiliar.FieldByName('desc_fun').AsString
  end;
end;

procedure Tdm.cdsEmpresaAfterPost(DataSet: TDataSet);
begin
  cdsEmpresa.ApplyUpdates(0);
end;

procedure Tdm.cdsExperienciasAfterPost(DataSet: TDataSet);
begin
  cdsExperiencias.ApplyUpdates(0);
end;

procedure Tdm.cdsFormulariosAfterPost(DataSet: TDataSet);
begin
  cdsFormularios.ApplyUpdates(0);
end;

procedure Tdm.cdsFormulariosCalcFields(DataSet: TDataSet);
begin
   with cdsFormularios do
   begin
      if FieldByName('prot_for').AsInteger = 2 then
         cdsFormulariosDescProtecao.AsString:= 'MEIO FÍSICO'
      else
         cdsFormulariosDescProtecao.AsString:= 'MEIO ELETRÔNICO';
   end;

   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT nome_pro FROM processos' +
                    ' WHERE codi_pro = ' + cdsFormulariosarma_for.AsString;
      Active:= True;

      cdsFormulariosArmazenar.AsString:= FieldByName('nome_pro').AsString;
   end;
end;

procedure Tdm.cdsFuncoesAfterPost(DataSet: TDataSet);
begin
  cdsFuncoes.ApplyUpdates(0);
end;

procedure Tdm.cdsFuncoesBeforeOpen(DataSet: TDataSet);
begin
//  CreatecdsFuncoes;
end;

procedure Tdm.cdsFuncoesCalcFields(DataSet: TDataSet);
begin
  with cdsAuxiliar do
  begin
    Active:= False;
    CommandText:= ' Select valo_com from tabela_combos'+
                  ' Where tipo_com = 6'+
                  ' And codi_com = ' + '''' + cdsFuncoes.FieldByName('educ_fun').AsString + '''';
    Active:= True;
    cdsFuncoes.FieldByName('DescEduc').AsString:= cdsAuxiliar.FieldByName('valo_com').AsString
  end;
  with cdsAuxiliar do
  begin
    Active:= False;
    CommandText:= ' Select valo_com from tabela_combos'+
                  ' Where tipo_com = 7'+
                  ' And codi_com = ' + '''' + cdsFuncoes.FieldByName('expe_fun').AsString + '''';
    Active:= True;
    cdsFuncoes.FieldByName('DescExpe').AsString:= cdsAuxiliar.FieldByName('valo_com').AsString
  end;
end;

procedure Tdm.cdsHabilidadesAfterPost(DataSet: TDataSet);
begin
   cdsHabilidades.ApplyUpdates(0);
end;

procedure Tdm.cdsHistProfAfterPost(DataSet: TDataSet);
begin
   cdsHistProf.ApplyUpdates(0);
end;

procedure Tdm.cdsIndicadoresAfterPost(DataSet: TDataSet);
begin
   cdsIndicadores.ApplyUpdates(0);
end;

procedure Tdm.cdsIndicadoresBeforeDelete(DataSet: TDataSet);
begin
   with cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT COUNT(*) as Total FROM valor_indicador' +
//                    ' WHERE codi_ind = ' + cdsIndicadorescodi_ind.AsString;
//      Active:= True;
//
//      if FieldByName('Total').AsInteger > 0 then begin
//         raise EInvalidCampo.Create('O indicador não pode ser excluído,' + #13 + 'pois existem lançamentos para ele no processo') ;
//      end;

      Active:= False;
      CommandText:= ' DELETE FROM valor_indicador' +
                    ' WHERE codi_ind = ' + cdsIndicadorescodi_ind.AsString;
      Execute;
   end;
end;

procedure Tdm.cdsIndicadoresCalcFields(DataSet: TDataSet);
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 17' +
                    ' and codi_com = ' + cdsIndicadorestipo_ind.AsString +
                    ' ORDER BY orde_com';
      Active:= True;
   end;
//   cdsIndicadoresMetaConcatenada.AsString:= cdsIndicadorestipo_ind.AsString + ' ' + cdsIndicadoresmeta_ind.AsString;
   cdsIndicadoresMetaConcatenada.AsString:= cdsAuxiliar.FieldByName('valo_com').AsString + ' ' + cdsIndicadoresmeta_ind.AsString;

   if cdsIndicadoresperi_ind.AsString = EmptyStr then begin
      cdsindicadoresDescPeriodicidade.AsString:= '';
   end
   else begin
      case cdsIndicadoresperi_ind.AsInteger of
         0: cdsindicadoresDescPeriodicidade.AsString:= 'MENSAL';
         1: cdsindicadoresDescPeriodicidade.AsString:= 'BIMESTRAL';
         2: cdsindicadoresDescPeriodicidade.AsString:= 'TRIMESTRAL';
         3: cdsindicadoresDescPeriodicidade.AsString:= 'SEMESTRAL';
         4: cdsindicadoresDescPeriodicidade.AsString:= 'ANUAL';
         5: cdsindicadoresDescPeriodicidade.AsString:= 'BIENAL';
         6: cdsindicadoresDescPeriodicidade.AsString:= 'TRIENAL';
         7: cdsindicadoresDescPeriodicidade.AsString:= 'QUADRIENAL';
      end;
   end;
end;

procedure Tdm.cdsInfraAfterPost(DataSet: TDataSet);
begin
  cdsInfra.ApplyUpdates(0);
end;

procedure Tdm.cdsInfraCalcFields(DataSet: TDataSet);
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select nome_pro from processos'+
                    ' Where codi_pro = ' + '''' + cdsInfra.FieldByName('proc_inf').AsString + '''';
      Active:= True;
      cdsInfra.FieldByName('DescProc').AsString:= cdsAuxiliar.FieldByName('nome_pro').AsString
   end;

   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select valo_com from tabela_combos'+
                    ' Where tipo_com = 8'+
                    ' And codi_com = ' + '''' + cdsInfra.FieldByName('tipo_inf').AsString + '''';
      Active:= True;
      cdsInfra.FieldByName('DescTipo').AsString:= cdsAuxiliar.FieldByName('valo_com').AsString
   end;
end;

procedure Tdm.cdsListaMestraAfterPost(DataSet: TDataSet);
begin
  cdsListaMestra.ApplyUpdates(0);
end;

procedure Tdm.cdsListaMestraBeforeOpen(DataSet: TDataSet);
begin
//  CreatecdsListaMestra;
end;

procedure Tdm.cdsListaMestraCalcFields(DataSet: TDataSet);
begin
   with dm.cdsListaMestra do begin
      if FieldByName('tipo_lis').AsInteger = 0 then begin
         FieldByName('tipo').AsString:= 'EXTERNO'
      end
      else begin
         FieldByName('tipo').AsString:= 'INTERNO';
      end;
   end;
end;

procedure Tdm.cdsManutencaoAfterPost(DataSet: TDataSet);
begin
  cdsManutencao.ApplyUpdates(0);
end;

procedure Tdm.cdsManutencaoBeforeOpen(DataSet: TDataSet);
begin
//  CreatecdsManutencao;
end;

procedure Tdm.cdsManutencaoCalcFields(DataSet: TDataSet);
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT desc_inf, iden_inf from infraestrutura'+
                    ' WHERE codi_inf = ' + QuotedStr(cdsManutencao.FieldByName('codi_inf').AsString);
      Active:= True;
      cdsManutencao.FieldByName('DescItem').AsString:= cdsAuxiliar.FieldByName('desc_inf').AsString;
      cdsManutencao.FieldByName('IdentItem').AsString:= cdsAuxiliar.FieldByName('iden_inf').AsString;
   end;

   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro from processos'+
                    ' WHERE codi_pro = ' + QuotedStr(cdsManutencao.FieldByName('proc_man').AsString);
      Active:= True;
      cdsManutencao.FieldByName('DescProcesso').AsString:= cdsAuxiliar.FieldByName('nome_pro').AsString;
   end;

   try
      case StrToInt(CdsManutencaoquan_man.AsString) of
           1: cdsManutencaoQuando.AsString:= 'DIÁRIO';
           7: cdsManutencaoQuando.AsString:= 'SEMANAL';
          15: cdsManutencaoQuando.AsString:= 'QUINZENAL';
          30: cdsManutencaoQuando.AsString:= 'MENSAL';
          90: cdsManutencaoQuando.AsString:= 'TRIMESTRAL';
         180: cdsManutencaoQuando.AsString:= 'SEMESTRAL';
         365: cdsManutencaoQuando.AsString:= 'ANUAL';
         730: cdsManutencaoQuando.AsString:= 'BIENAL';
        1095: cdsManutencaoQuando.AsString:= 'TRIENAL';
        1460: cdsManutencaoQuando.AsString:= 'QUADRIENAL';
        1825: cdsManutencaoQuando.AsString:= 'QUINQUENAL';
      end;
   except
      cdsManutencaoQuando.AsString:= CdsManutencaoquan_man.AsString;
   end;
end;

procedure Tdm.cdsPlanoAcaoacao_plaGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text := Copy(cdsPlanoAcaoacao_pla.AsString, 1, 50);
end;

procedure Tdm.cdsPlanoAcaoAfterPost(DataSet: TDataSet);
begin
   cdsPlanoAcao.ApplyUpdates(0);
end;

procedure Tdm.cdsPMCAfterPost(DataSet: TDataSet);
begin
  cdsPMC.ApplyUpdates(0);
end;

procedure Tdm.cdsPMCCalcFields(DataSet: TDataSet);
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select valo_com from tabela_combos'+
                    ' Where tipo_com = 4'+
                    ' And codi_com = ' + '''' + cdsPMC.FieldByName('tipo_pmc').AsString + '''';
      Active:= True;
      cdsPMC.FieldByName('DescTipo').AsString:= cdsAuxiliar.FieldByName('valo_com').AsString
   end;

   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select valo_com from tabela_combos'+
                    ' Where tipo_com = 5'+
                    ' And codi_com = ' + '''' + cdsPMC.FieldByName('orig_pmc').AsString + '''';
      Active:= True;
      cdsPMC.FieldByName('DescOrig').AsString:= cdsAuxiliar.FieldByName('valo_com').AsString
   end;

   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select nome_col from colaboradores'+
                    ' Where codi_col = ' + '''' + cdsPMC.FieldByName('resp_pmc').AsString + '''';
      Active:= True;
      cdsPMC.FieldByName('NomeResp').AsString:= cdsAuxiliar.FieldByName('nome_col').AsString
   end;
end;

procedure Tdm.cdsPmc_AcoesAfterPost(DataSet: TDataSet);
begin
   cdsPmc_Acoes.ApplyUpdates(0);
end;

procedure Tdm.cdsPmc_AcoesCalcFields(DataSet: TDataSet);
begin
   cdsPmc_AcoesDescricao.AsString:= Copy(cdsPmc_Acoesdesc_aco.AsString, 1, 50);
end;

procedure Tdm.cdsPmc_Acoesdesc_acoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text:= Copy(cdsPmc_Acoesdesc_aco.AsString, 1, 40);
end;

procedure Tdm.cdspAfterPost(DataSet: TDataSet);
begin
   cdsListaMestra.ApplyUpdates(0);
end;

procedure Tdm.cdspCalcFields(DataSet: TDataSet);
begin
   with dm.cdsListaMestra do begin
      if FieldByName('tipo_lis').AsInteger = 0 then begin
         FieldByName('DescTipo').AsString:= 'EXTERNO'
      end
      else begin
         FieldByName('DescTipo').AsString:= 'INTERNO';
      end;
   end;
end;

procedure Tdm.cdsProcessosAfterPost(DataSet: TDataSet);
begin
  cdsProcessos.ApplyUpdates(0);
end;

procedure Tdm.cdsTartarugaAfterPost(DataSet: TDataSet);
begin
  cdsTartaruga.ApplyUpdates(0);
end;

procedure Tdm.cdsTreinamentosAfterPost(DataSet: TDataSet);
begin
  cdsTreinamentos.ApplyUpdates(0);
end;

procedure Tdm.cdsUsuarioAfterPost(DataSet: TDataSet);
begin
  cdsUsuario.ApplyUpdates(0);
end;

procedure Tdm.cdsValorIndicadoresAfterPost(DataSet: TDataSet);
begin
//  cdsValorIndicadores.ApplyUpdates(0);
end;

procedure Tdm.cdsValorIndicadoresCalcFields(DataSet: TDataSet);
begin
//   cdsValorIndicadores.FieldByName('extMes').AsString:=
//                     MesExtenso(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2), true);
//   cdsValorIndicadores.FieldByName('ano').AsString:=
//                     Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
//   cdsValorIndicadores.FieldByName('periodo').AsString:=
//                     MesExtenso(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2), true) +
//                     '/' + Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
//   cdsValorIndicadoresValor.AsString:= FormatFloat('#####0.00000',cdsValorIndicadoresvalo_vin.AsFloat);
////   ShowMessage(FormatFloat('#####0.00000',cdsValorIndicadoresvalo_vin.AsFloat));
end;

procedure Tdm.cdsVisualizaAnaliseCalcFields(DataSet: TDataSet);
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select nome_col from colaboradores'+
                    ' Where codi_col = ' + '''' + cdsVisualizaAnalise.FieldByName('resp_aac').AsString + '''';
      Active:= True;
      cdsVisualizaAnalise.FieldByName('NomeResp').AsString:= cdsAuxiliar.FieldByName('nome_col').AsString
   end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
//   if not FileExists(ExtractFilePath(Application.ExeName) + '\Destra.Ini') then begin
//      GravaIni('localhost');
//   end;
//
//   try
//      with MySQLConexao do begin
//         Params[1]:= 'HostName=' + LeIni();
//         Connected:= True;
//      end;
//   except
//      on E: Exception do begin
//         Application.MessageBox(PChar('Erro ao conectar o banco de dados. Verifique' + E.Message), 'Erro', MB_OK + MB_ICONSTOP);
//         Application.Terminate;
//      end;
//   end;
//   AtualizaBanco;
end;

end.
