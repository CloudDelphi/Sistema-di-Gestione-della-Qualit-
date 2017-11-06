unit Estrutura;

interface

uses DBTables, SysUtils, DB, DBClient ;

type EInvalidCampo = Class( Exception ) ;
     TCampoCalcString  = TStringField ;
     TCampoCalcInteger = TIntegerField ;
     TCampoCalcFloat   = TFloatField  ;
     TCampoCalcDate    = TDateTimeField;
     TCampoInteger     = TIntegerField ;
     TCampoString      = TWideStringField ;
     TCampoFloat       = TFloatField  ;
     TCampoDate        = TSQLTimeStampField;
     TCampoMemo        = TWideMemoField ;
     TCampoSmallInt    = TIntegerField ;
     TCampoIntMySql    = TIntegerField ;

procedure CreatecdsFuncoes;
//procedure CreatecdsManutencao;
//procedure CreatecdsAprovaDocs;
//procedure CreatecdsFormularios;

implementation

uses frm_dm;
                
procedure CreatecdsFuncoes;
//var cdsFuncoesCODI_FUN : TCampoInteger;
//    cdsFuncoesDESC_FUN : TCampoCalcString;
//    cdsFuncoesEDUC_FUN : TCampoInteger;
//    cdsFuncoesEXPE_FUN : TCampoInteger;
//    cdsFuncoesRESP_FUN : TCampoMemo;
//    cdsFuncoesDESCEDUC : TCampoCalcString;
//    cdsFuncoesDESCEXPE : TCampoCalcString;
begin
//  with dm do
//  begin
//    cdsFuncoes.Fields.Clear;
//
//    with cdsFuncoesCODI_FUN do begin
//      cdsFuncoesCODI_FUN:= TCampoInteger.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesCODI_FUN';
//      DisplayLabel:= 'Código da função';
//      FieldName:= 'CODI_FUN';
//      DataSet:= cdsFuncoes;
//    end;
//
//    with cdsFuncoesDESC_FUN do
//    begin
//      cdsFuncoesDESC_FUN:= TCampoCalcString.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesDESC_FUN';
//      DisplayLabel:= 'Descrição da Função';
//      FieldName:= 'DESC_FUN';
//      Size:= 50;
//      DataSet:= cdsFuncoes;
//    end;
//
//    with cdsFuncoesEDUC_FUN do
//    begin
//      cdsFuncoesEDUC_FUN:= TCampoInteger.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesEDUC_FUN';
//      DisplayLabel:= 'Educação exigida';
//      FieldName:= 'EDUC_FUN';
//      DataSet:= cdsFuncoes;
//    end;
//
//    with cdsFuncoesEXPE_FUN do
//    begin
//      cdsFuncoesEXPE_FUN:= TCampoInteger.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesEXPE_FUN';
//      DisplayLabel:= 'Experiência Exigida';
//      FieldName:= 'EXPE_FUN';
//      DataSet:= cdsFuncoes;
//    end;
//
//    with cdsFuncoesRESP_FUN do
//    begin
//      cdsFuncoesRESP_FUN:= TCampoMemo.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesRESP_FUN';
//      DisplayLabel:= 'Responsabilidades';
//      FieldName:= 'RESP_FUN';
//      DataSet:= cdsFuncoes;
//    end;
//
//    with cdsFuncoesDESCEDUC do
//    begin
//      cdsFuncoesDESCEDUC:= TCampoCalcString.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesDESCEDUC';
//      DisplayLabel:= 'Descrição da Educação ';
//      FieldName:= 'DESCEDUC';
//      FieldKind:= fkCalculated;
//      Size:= 50;
//      LookupCache:= False;
//      DataSet:= cdsFuncoes;
//    end;
//
//    with cdsFuncoesDESCEXPE do
//    begin
//      cdsFuncoesDESCEXPE:= TCampoCalcString.Create(cdsFuncoes);
//      Name:= 'cdsFuncoesDESCEXPE';
//      DisplayLabel:= 'Descrição da Experiência ';
//      FieldName:= 'DESCEXPE';
//      FieldKind:= fkCalculated;
//      Size:= 50;
//      LookupCache:= False;
//      DataSet:= cdsFuncoes;
//    end;
//  end;
end;

//procedure CreatecdsManutencao;
//var cdsManutencaoCODI_MAN : TCampoInteger;
//    cdsManutencaoCODI_INF : TCampoInteger;
//    cdsManutencaoOQUE_MAN : TCampoCalcString;
//    cdsManutencaoCOMO_MAN : TCampoCalcString;
//    cdsManutencaoQUAN_MAN : TCampoDate;
//    cdsManutencaoQUEM_MAN : TCampoInteger;
//    cdsManutencaoONDE_MAN : TCampoInteger;
//    cdsManutencaoDATA_MAN : TCampoDate;
//    cdsManutencaoANOM_MAN : TCampoCalcString;
//    cdsManutencaoDESCITEM : TCampoCalcString;
//begin
//  with dm do
//  begin
//    cdsInfra.Fields.Clear;
//
//    with cdsManutencaoCODI_MAN do
//    begin
//      cdsManutencaoCODI_MAN:= TCampoInteger.Create(cdsManutencao);
//      Name:= 'cdsManutencaoCODI_MAN';
//      DisplayLabel:= 'Código da manutenção';
//      FieldName:= 'CODI_MAN';
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoCODI_INF do
//    begin
//      cdsManutencaoCODI_INF:= TCampoInteger.Create(cdsManutencao);
//      Name:= 'cdsManutencaoCODI_INF';
//      DisplayLabel:= 'Código da infraestrutura';
//      FieldName:= 'CODI_INF';
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoOQUE_MAN do
//    begin
//      cdsManutencaoOQUE_MAN:= TCampoCalcString.Create(cdsManutencao);
//      Name:= 'cdsManutencaoOQUE_MAN';
//      DisplayLabel:= 'O que fazer ?';
//      FieldName:= 'OQUE_MAN';
//      Size:= 100;
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoCOMO_MAN do
//    begin
//      cdsManutencaoCOMO_MAN:= TCampoCalcString.Create(cdsManutencao);
//      Name:= 'cdsManutencaoCOMO_MAN';
//      DisplayLabel:= 'Como fazer ?';
//      FieldName:= 'COMO_MAN';
//      Size:= 100;
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoQUAN_MAN do
//    begin
//      cdsManutencaoQUAN_MAN:= TCampoDate.Create(cdsManutencao);
//      Name:= 'cdsManutencaoQUAN_MAN';
//      DisplayLabel:= 'Data prevista da manutenção';
//      FieldName:= 'QUAN_MAN';
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoQUEM_MAN do
//    begin
//      cdsManutencaoQUEM_MAN:= TCampoInteger.Create(cdsManutencao);
//      Name:= 'cdsManutencaoQUEM_MAN';
//      DisplayLabel:= 'Responsável pela manutenção';
//      FieldName:= 'QUEM_MAN';
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoONDE_MAN do
//    begin
//      cdsManutencaoONDE_MAN:= TCampoInteger.Create(cdsManutencao);
//      Name:= 'cdsManutencaoONDE_MAN';
//      DisplayLabel:= 'Local da manutenção';
//      FieldName:= 'ONDE_MAN';
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoDATA_MAN do
//    begin
//      cdsManutencaoDATA_MAN:= TCampoDate.Create(cdsManutencao);
//      Name:= 'cdsManutencaoDATA_MAN';
//      DisplayLabel:= 'Data da manutenção';
//      FieldName:= 'DATA_MAN';
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoANOM_MAN do
//    begin
//      cdsManutencaoANOM_MAN:= TCampoCalcString.Create(cdsManutencao);
//      Name:= 'cdsManutencaoANOM_MAN';
//      DisplayLabel:= 'Anomalias';
//      FieldName:= 'ANOM_MAN';
//      Size:= 255;
//      DataSet:= cdsManutencao;
//    end;
//
//    with cdsManutencaoDESCITEM do
//    begin
//      cdsManutencaoDESCITEM:= TCampoCalcString.Create(cdsManutencao);
//      Name:= 'cdsManutencaoDESCITEM';
//      DisplayLabel:= 'Descrição do item';
//      FieldName:= 'DESCITEM';
//      FieldKind:= fkCalculated;
//      Size:= 50;
//      LookupCache:= False;
//      DataSet:= cdsManutencao;
//    end;
//  end;
//end;


//procedure CreatecdsColaboradores;
//var cdsColaboradoresCODI_COL : TCampoInteger;
//    cdsColaboradoresNOME_COL : TCampoCalcString;
//    cdsColaboradoresFUNC_COL : TCampoInteger;
//    cdsColaboradoresEDUC_COL : TCampoInteger;
//    cdsColaboradoresEXPE_COL : TCampoInteger;
//    cdsColaboradoresESCO_COL : TCampoCalcString;
//    cdsColaboradoresCONC_COL : TCampoCalcString;
//    cdsColaboradoresDESCFUNC : TCampoCalcString;
//    cdsColaboradoresDESCEXPE : TCampoCalcString;
//
//begin
//  with dm do
//  begin
//    cdsColaboradores.Fields.Clear;
//
//    with cdsColaboradoresCODI_COL do
//    begin
//      cdsColaboradoresCODI_COL:= TCampoInteger.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresCODI_COL';
//      DisplayLabel:= 'Código do Colaborador';
//      FieldName:= 'CODI_COL';
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresNOME_COL do
//    begin
//      cdsColaboradoresNOME_COL:= TCampoCalcString.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresNOME_COL';
//      DisplayLabel:= 'Nome do Colaborador';
//      FieldName:= 'NOME_COL';
//      Size:= 45;
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresFUNC_COL do
//    begin
//      cdsColaboradoresFUNC_COL:= TCampoInteger.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresFUNC_COL';
//      DisplayLabel:= 'Função do Colaborador';
//      FieldName:= 'FUNC_COL';
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresEDUC_COL do
//    begin
//      cdsColaboradoresEDUC_COL:= TCampoInteger.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresEDUC_COL';
//      DisplayLabel:= 'Educação do Colaborador';
//      FieldName:= 'EDUC_COL';
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresEXPE_COL do
//    begin
//      cdsColaboradoresEXPE_COL:= TCampoInteger.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresEXPE_COL';
//      DisplayLabel:= 'Experiência do Colaborador';
//      FieldName:= 'EXPE_COL';
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresESCO_COL do
//    begin
//      cdsColaboradoresESCO_COL:= TCampoCalcString.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresESCO_COL';
//      DisplayLabel:= 'Entidade de ensino do Colaborador';
//      FieldName:= 'ESCO_COL';
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresCONC_COL do
//    begin
//      cdsColaboradoresCONC_COL:= TCampoCalcString.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresCONC_COL';
//      DisplayLabel:= 'Conclusão';
//      FieldName:= 'CONC_COL';
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresDESCFUNC do
//    begin
//      cdsColaboradoresDESCFUNC:= TCampoCalcString.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresDESCFUNC';
//      DisplayLabel:= 'Descrição da função';
//      FieldName:= 'DESCFUNC';
//      FieldKind:= fkCalculated;
//      Size:= 50;
//      LookupCache:= False;
//      DataSet:= cdsColaboradores;
//    end;
//
//    with cdsColaboradoresDESCEXPE do
//    begin
//      cdsColaboradoresDESCEXPE:= TCampoCalcString.Create(cdsColaboradores);
//      Name:= 'cdsColaboradoresDESCEXPE';
//      DisplayLabel:= 'Descrição da experiência';
//      FieldName:= 'DESCEXPE';
//      FieldKind:= fkCalculated;
//      Size:= 50;
//      LookupCache:= False;
//      DataSet:= cdsColaboradores;
//    end;
//
//  end;
//end;

//procedure CreatecdsListaMestra;
//var cdsListaMestraCODI_LIS : TCampoInteger;
//    cdsListaMestraIDEN_LIS : TCampoCalcString;
//    cdsListaMestraDESC_LIS : TCampoCalcString;
//    cdsListaMestraREVI_LIS : TCampoCalcString;
//    cdsListaMestraTIPO_LIS : TCampoInteger;
//    cdsListaMestraATUA_LIS : TCampoCalcString;
//    cdsListaMestraARQU_LIS : TCampoCalcString;
//    cdsListaMestraPROC_LIS : TCampoInteger;
//    cdsListaMestraRESP_LIS : TCampoInteger;
//    cdsListaMestraDATA_LIS : TCampoDate;
//    cdsListaMestraAPRO_LIS : TCampoCalcString;
//    cdsListaMestraDTAP_LIS : TCampoDate;
//    cdsListaMestraQUEM_LIS : TCampoInteger;
//    cdsListaMestraTIPO     : TCampoCalcString;
//
//begin
//  with dm do
//  begin
//      cdsListaMestra.Fields.Clear;
//
//      with cdsListaMestraCODI_LIS do
//      begin
//        cdsListaMestraCODI_LIS:= TCampoInteger.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraCODI_LIS';
//        DisplayLabel:= 'Código';
//        FieldName:= 'CODI_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraIDEN_LIS do
//      begin
//        cdsListaMestraIDEN_LIS:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraIDEN_LIS';
//        DisplayLabel:= 'Identificação';
//        FieldName:= 'iden_lis';
//        Size:= 10;
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraDESC_LIS do
//      begin
//        cdsListaMestraDESC_LIS:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraDESC_LIS';
//        DisplayLabel:= 'Descrição';
//        FieldName:= 'DESC_LIS';
//        Size:= 50;
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraREVI_LIS do
//      begin
//        cdsListaMestraREVI_LIS:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraREVI_LIS';
//        DisplayLabel:= 'Responsável';
//        FieldName:= 'revi_lis';
//        Size:= 45;
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraTIPO_LIS do
//      begin
//        cdsListaMestraTIPO_LIS:= TCampoInteger.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraTIPO_LIS';
//        DisplayLabel:= 'Tipo do Documento';
//        FieldName:= 'tipo_lis';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraATUA_LIS do
//      begin
//        cdsListaMestraATUA_LIS:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraATUA_LIS';
//        DisplayLabel:= 'Atualizaçao do Documento';
//        FieldName:= 'atua_lis';
//        Size:= 10;
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraARQU_LIS do
//      begin
//        cdsListaMestraARQU_LIS:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraARQU_LIS';
//        DisplayLabel:= 'Data do Projeto';
//        FieldName:= 'arqu_lis';
//        Size:= 255;
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraPROC_LIS do
//      begin
//        cdsListaMestraPROC_LIS:= TCampoInteger.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraPROC_LIS';
//        DisplayLabel:= 'Processo';
//        FieldName:= 'PROC_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraRESP_LIS do
//      begin
//        cdsListaMestraRESP_LIS:= TCampoInteger.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraRESP_LIS';
//        DisplayLabel:= 'Responsável pela aprovação';
//        FieldName:= 'RESP_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraDATA_LIS do
//      begin
//        cdsListaMestraDATA_LIS:= TCampoDate.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraDATA_LIS';
//        DisplayLabel:= 'Data Atual do Arquivo';
//        FieldName:= 'DATA_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraAPRO_LIS do
//      begin
//        cdsListaMestraAPRO_LIS:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraAPRO_LIS';
//        DisplayLabel:= 'Aprovado ?';
//        FieldName:= 'APRO_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraDTAP_LIS do
//      begin
//        cdsListaMestraDTAP_LIS:= TCampoDate.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraDTAP_LIS';
//        DisplayLabel:= 'Data de Aprovação';
//        FieldName:= 'DTAP_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraQUEM_LIS do
//      begin
//        cdsListaMestraQUEM_LIS:= TCampoInteger.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraQUEM_LIS';
//        DisplayLabel:= 'Quem aprovou';
//        FieldName:= 'QUEM_LIS';
//        DataSet:= cdsListaMestra;
//      end;
//
//      with cdsListaMestraTIPO do
//      begin
//        cdsListaMestraTIPO:= TCampoCalcString.Create(cdsListaMestra);
//        Name:= 'cdsListaMestraTIPO';
//        DisplayLabel:= 'Descrição do tipo do Documento';
//        FieldName:= 'TIPO';
//        FieldKind:= fkCalculated;
//        Size:= 8;
//        LookupCache:= False;
//        DataSet:= cdsListaMestra;
//      end;
//
//  end;
//end;



//procedure CreatecdsFormularios;
//var
//  cdsFormulariosNUME_FOR: TCampoCalcString;
//  cdsFormulariosREVI_FOR: TCampoInteger;
//  cdsFormulariosIDEN_FOR: TCampoCalcString;
//  cdsFormulariosARMA_FOR: TCampoCalcString;
//  cdsFormulariosPROT_FOR: TCampoInteger;
//  cdsFormulariosRECU_FOR: TCampoInteger;
//  cdsFormulariosRETE_FOR: TCampoCalcString;
//  cdsFormulariosDESC_FOR: TCampoInteger;
//  cdsFormulariosARQU_FOR: TCampoCalcString;
//  cdsFormulariosArmazenar: TCampoCalcString;
////  cdsFormulariosDescTipo: TCampoCalcString;
////  cdsFormulariosDescOrig: TCampoCalcString;
//
//begin
//  with dm do
//  begin
//    cdsFormularios.Fields.Clear;
//
//    with cdsFormulariosNUME_FOR do
//    begin
//      cdsFormulariosNUME_FOR:= TCampoCalcString.Create(cdsFormularios);
//      Name:= 'cdsFormulariosNUME_FOR';
//      DisplayLabel:= 'Número do Formulário';
//      FieldName:= 'NUME_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosREVI_FOR do
//    begin
//      cdsFormulariosREVI_FOR:= TCampoInteger.Create(cdsFormularios);
//      Name:= 'cdsFormulariosREVI_FOR';
//      DisplayLabel:= 'Revisão do Formulário';
//      FieldName:= 'REVI_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosIDEN_FOR do
//    begin
//      cdsFormulariosIDEN_FOR:= TCampoCalcString.Create(cdsFormularios);
//      Name:= 'cdsFormulariosIDEN_FOR';
//      DisplayLabel:= 'Identificação do Formulário';
//      FieldName:= 'IDEN_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosARMA_FOR do
//    begin
//      cdsFormulariosARMA_FOR:= TCampoCalcString.Create(cdsFormularios);
//      Name:= 'cdsFormulariosARMA_FOR';
//      DisplayLabel:= 'Tipo de Armazenagem';
//      FieldName:= 'ARMA_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosPROT_FOR do
//    begin
//      cdsFormulariosPROT_FOR:= TCampoInteger.Create(cdsFormularios);
//      Name:= 'cdsFormulariosPROT_FOR';
//      DisplayLabel:= 'Tipo de Proteção';
//      FieldName:= 'PROT_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosRECU_FOR do
//    begin
//      cdsFormulariosRECU_FOR:= TCampoInteger.Create(cdsFormularios);
//      Name:= 'cdsFormulariosRECU_FOR';
//      DisplayLabel:= 'Modo de Recuperação';
//      FieldName:= 'RECU_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosRETE_FOR do
//    begin
//      cdsFormulariosRETE_FOR:= TCampoCalcString.Create(cdsFormularios);
//      Name:= 'cdsFormulariosRETE_FOR';
//      DisplayLabel:= 'Tempo de Retenção';
//      FieldName:= 'RETE_FOR';
//      Size:= 30;
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosDESC_FOR do
//    begin
//      cdsFormulariosDESC_FOR:= TCampoInteger.Create(cdsFormularios);
//      Name:= 'cdsFormulariosDESC_FOR';
//      DisplayLabel:= 'Tipo de Descarte';
//      FieldName:= 'DESC_FOR';
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosARQU_FOR do
//    begin
//      cdsFormulariosARQU_FOR:= TCampoCalcString.Create(cdsFormularios);
//      Name:= 'cdsFormulariosARQU_FOR';
//      DisplayLabel:= 'Arquivo físico';
//      FieldName:= 'ARQU_FOR';
//      Size:= 200;
//      DataSet:= cdsFormularios;
//    end;
//
//    with cdsFormulariosArmazenar do
//    begin
//      cdsFormulariosArmazenar:= TCampoCalcString.Create(cdsFormularios);
//      Name:= 'cdsFormulariosArmazenar';
//      DisplayLabel:= 'Descrição do local de armazenagem';
//      FieldName:= 'Armazenar';
//      KeyFields:= 'arma_for';
//      FieldKind:= fkLookup;
//      LookupDataSet:= cdsProcessos;
//      LookupKeyFields:= 'codi_pro';
//      LookupResultField:= 'nome_pro';
//      Size:= 50;
//      DataSet:= cdsFormularios;
//    end;
//  end;
//end;

//procedure CreatecdsPMC_Acoes;
//var
//  cdsPMC_AcoesCODI_ACO: TCampoInteger;
//  cdsPMC_AcoesCODI_PMC: TCampoInteger;
//  cdsPMC_AcoesRESP_ACO: TCampoInteger;
//  cdsPMC_AcoesPRAZ_ACO: TCampoCalcString;
//  cdsPMC_AcoesVIMP_ACO: TCampoCalcString;
//  cdsPMC_AcoesDESC_ACO: TCampoCalcString;
//  cdsPMC_AcoesNomeResp: TCampoCalcString;
//
//begin
//  with dm do
//  begin
//    cdsPMC_Acoes.Fields.Clear;
//
//    with cdsPMC_AcoesCODI_ACO do
//    begin
//      cdsPMC_AcoesCODI_ACO:= TCampoInteger.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesCODI_ACO';
//      DisplayLabel:= 'Código';
//      FieldName:= 'CODI_ACO';
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//    with cdsPMC_AcoesCODI_PMC do
//    begin
//      cdsPMC_AcoesCODI_PMC:= TCampoInteger.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesCODI_PMC';
//      DisplayLabel:= 'Código do PMC';
//      FieldName:= 'CODI_PMC';
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//    with cdsPMC_AcoesRESP_ACO do
//    begin
//      cdsPMC_AcoesRESP_ACO:= TCampoInteger.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesRESP_ACO';
//      DisplayLabel:= 'Responsável pela ação';
//      FieldName:= 'RESP_ACO';
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//    with cdsPMC_AcoesPRAZ_ACO do
//    begin
//      cdsPMC_AcoesPRAZ_ACO:= TCampoCalcString.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesPRAZ_ACO';
//      DisplayLabel:= 'Prazo';
//      FieldName:= 'PRAZ_ACO';
//      Size:= 45;
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//    with cdsPMC_AcoesVIMP_ACO do
//    begin
//      cdsPMC_AcoesVIMP_ACO:= TCampoCalcString.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesVIMP_ACO';
//      DisplayLabel:= 'Depto';
//      FieldName:= 'VIMP_ACO';
//      Size:= 200;
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//    with cdsPMC_AcoesDESC_ACO do
//    begin
//      cdsPMC_AcoesDESC_ACO:= TCampoCalcString.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesDESC_ACO';
//      DisplayLabel:= 'Verificação da Implantação';
//      FieldName:= 'DESC_ACO';
//      Size:= 200;
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//
//    with cdsPMC_AcoesNomeResp do
//    begin
//      cdsPMC_AcoesNomeResp:= TCampoCalcString.Create(cdsPMC_Acoes);
//      Name:= 'cdsPMC_AcoesNomeResp';
//      DisplayLabel:= 'Nome do Responsável';
//      FieldName:= 'NomeResp';
//      KeyFields:= 'resp_aco';
//      FieldKind:= fkLookup;
//      LookupDataSet:= cdsColaboradores;
//      LookupKeyFields:= 'codi_col';
//      LookupResultField:= 'nome_col';
//      Size:= 50;
//      DataSet:= cdsPMC_Acoes;
//    end;
//
//  end;
//end;

end.
