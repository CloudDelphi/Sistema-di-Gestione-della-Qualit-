unit AtualizaBanco;

interface

uses SysUtils, Inifiles, Forms, StdCtrls, Graphics, DBCtrls, Mask, WinProcs, DbiProcs,
     Messages, Dialogs, DBClient, Provider, DB, SqlExpr, Controls, Registry,
     IdSMTP, IdMessage, WinInet, DBGrids ; //MidasLib,

// Verifica se existem alterações no banco de dados a serem feitas
function AtualizarBanco(): Boolean;

// Grava as novas funçoes do sistema para o cadastro de acessos
procedure GravaUsuarios(funcao: string);
// Busca o código do equipamento na tabela estrutura e copia no campo novo cali_equip da tebela calibracao
procedure GravarCaliEquip();
// Atualiza o campo Tipo de Armazenamento no cadastro de Formulários
procedure AtualizarLocais();
// Carrega os registros padrão de Variáveis Externas
procedure InserirVariaveisExternas;
// Faz a gavação das variáveis externas
procedure GravarVariaveis(sCodigo: string; sFator: string; sDescricao: string; tipo: string);
// Insere uma nova função na tabela_combos
procedure GravarNovaFuncao(Codigo: Integer; Descricao: string; Ordem: Integer);
// Altera a descrição dos periodos de retenção dos formulários e insere novos
procedure AcertarRetencaoFormularios;
// Insere um novo item na tabela_combos
procedure GravarTabelaCombos(Tipo: Integer; NomeTipo: string; Codigo: Integer; Descricao: string; Ordem: Integer);
// Insere as variáveis internas padrão
procedure InserirVariaveisInternas();
// Converte os prazos das ações de PMC para o formato de data
procedure ConverterPrazoPMC();
// Copia as metas cadastradas no cadastro de indicadores para a nova tabela de metas mensais
procedure CopiaMetasInd();
// Cria uma lista de valores sequenciais para o novo campo chave da tabela auditoria_interna
procedure AcertarChaveAuditInterna();
// Cria campos em Tabelas
procedure CriarCampo(nomeCampo: string; nomeTabela: string; tipoCampo: string; valorPadrao: string = ''; tipoValorPadrao: string = '');
// Preenche as datas das ações do PMC vazias
procedure PreencherDataAcaoPMC();
// Grava os itens de Origem do cadastro de RNC
procedure GravarOrigemRNC();
// Grava os itens de Motivo do cadastro de RNC
procedure GravarMotivoRNC();
// Atualiza as opções de Retenção de Formulários
procedure AtualizarRetencao();
// Transfere os arquivos de evidência das ações para a nova tabela pmc_acoes_evidencias
procedure TransferirEvidenciasAcoes();
// Insere novos items de retenção de formulários
procedure GravarRetencaoFormularios();
// Insere os registros fixos do cronograma (FOR-43)
procedure InserirCronograma();

implementation

uses frm_dm, Funcoes;

function AtualizarBanco(): Boolean;
var
   sComando: string;
   iNumAtualizacao: Integer;
   iUltimo: Integer;
   i: Integer;
   iContHab, iContTre: Integer;
begin

//   //Cria o banco de dados
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT 1 FROM pg_database WHERE datname = ' + QuotedStr('destra');
//      Active:= True;
//
//      if RecordCount = 0 then begin
//         Active:= False;
//         CommandText:= ' CREATE DATABASE destra' +
//                       ' WITH OWNER = postgres' +
//                       '     ENCODING = ' + QuotedStr('UTF8') +
//                       '     TABLESPACE = pg_default' +
//                       '     TEMPLATE = template0' +
//                       '     LC_COLLATE = ' + QuotedStr('Portuguese_Brazil.1252') +
//                       '     LC_CTYPE = ' + QuotedStr('Portuguese_Brazil.1252') +
//                       '     CONNECTION LIMIT = -1';
//         Execute;
//      end;
//   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' CREATE TABLE IF NOT EXISTS atualiza_banco(' +
                    ' atu_codi integer NOT NULL,' +
                    ' atu_data date,' +
                    ' atu_desc character varying,' +
                    ' CONSTRAINT atu_codi PRIMARY KEY (atu_codi)' +
                    ' )';
      Execute;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT MAX(atu_codi) as Codigo FROM atualiza_banco';
      Active:= True;

      if FieldByName('Codigo').AsString = EmptyStr then begin
         iNumAtualizacao:= 1
      end
      else begin
         iNumAtualizacao:= FieldByName('Codigo').AsInteger + 1;
      end;
   end;

   //**********************************************
   // Alterar para o número do último comando aqui
   //**********************************************
   iUltimo:= 465;
   //**********************************************

   for i := iNumAtualizacao to iUltimo do begin
      sComando:= EmptyStr;
      case i of
         465: CriarCampo('usu_pend_rnc_naopreenchido', 'usuarios', 'integer', '0', 'I');
         464: GravarTabelaCombos(5, 'ORIGEM - ABERTURA PMC', 8, 'PROGRAMA 6S', 8);
         463: CriarCampo('aud_contOM', 'auditoria_auto', 'integer');
         462: CriarCampo('aud_contNC', 'auditoria_auto', 'integer');
         461: CriarCampo('aud_contOBS', 'auditoria_auto', 'integer');
         460: sComando:= ' CREATE TABLE auditoria_auto_cabec' +
                         '(' +
                         ' aud_data timestamp without time zone NOT NULL,' +
                         ' aud_auditor character varying(50),' +
                         ' aud_periodo_ini timestamp without time zone,' +
                         ' aud_periodo_fim timestamp without time zone,' +
                         ' aud_data_programa timestamp without time zone,' +
                         ' CONSTRAINT pk_auditoria_auto_cabec PRIMARY KEY (aud_data)' +
                         ')';
         459: GravarNovaFuncao(63, 'AUDITORIA AUTOMÁTICA', 63);
         458: GravarRetencaoFormularios();
         457: GravarTabelaCombos(3, 'DESCARTE - FORMULÁRIOS', 6, 'DESCARTAR', 6);
         456: sComando:= ' UPDATE cronograma SET cro_atividade = ' +
                          QuotedStr('DETERMINAR RISCOS A SEREM ABORDADOS POR MEIO DE PMC / PDCA.') +
                          ' WHERE cro_codigo = 25';
         455: sComando:= ' CREATE TABLE IF NOT EXISTS iqf_doc(' +
                         ' doc_codigo integer NOT NULL,' +
                         ' doc_cod_iqf integer NOT NULL,' +
                         ' doc_descricao character varying(200),' +
                         ' doc_caminho text,' +
                         ' CONSTRAINT PK_iqf_doc PRIMARY KEY (doc_codigo)' +
                         ' )';
         454: sComando:= 'UPDATE parametros SET mostra_carta = ' + QuotedStr('S');
         // 2.10 Acima
         453: GravarTabelaCombos(34, 'RELACIONAMENTO - RNC', 3, 'DEVOLUÇÃO', 3);
         452: CriarCampo('inf_status', 'infraestrutura', 'integer', '1', 'I'); // Valor padrão - Ativo
         451: GravarNovaFuncao(62, 'RELATÓRIO DE ANÁLISE DE RISCO', 62);
         450: sComando:= ' CREATE TABLE auditoria_auto' +
                         '(' +
                         ' aud_codigo integer NOT NULL,' +
                         ' aud_data timestamp without time zone NOT NULL,' +
                         ' aud_conformidade text,' +
                         ' aud_requisito character varying(10),' +
                         ' aud_naoconformidade text,' +
                         ' aud_tipo character(30),' +
                         ' aud_processo integer,' +
                         ' aud_gestor integer,' +
                         ' CONSTRAINT pk_auditoria_auto PRIMARY KEY (aud_codigo)' +
                         ')';
         449: GravarNovaFuncao(61, 'AUDITORIA AUTOMÁTICA', 61);
         448: CriarCampo('man_tipo', 'manut', 'integer', '1', 'I'); // Valor padrão - Programada
         447: GravarTabelaCombos(36, 'TIPO DE MANUTENÇÃO', 2, 'REALIZADA', 2);
         446: GravarTabelaCombos(36, 'TIPO DE MANUTENÇÃO', 1, 'PROGRAMADA', 1);
         445: CriarCampo('ind_monitoramento', 'indicadores', 'integer', '0', 'I'); // Valor padrão - Não
         444: CriarCampo('rnc_ordemprod', 'rnc', 'character varying(10)');
         443: GravarNovaFuncao(60, 'CRONOGRAMA DE IMPLEMENTAÇÃO', 60);
         442: InserirCronograma();
         441: sComando:= ' CREATE TABLE cronograma' +
                         '(' +
                         ' cro_codigo integer NOT NULL,' +
                         ' cro_requisito character(20) NOT NULL,' +
                         ' cro_tela_destra character(200),' +
                         ' cro_atividade text,' +
                         ' cro_responsavel integer,' +
                         ' cro_data_prevista timestamp without time zone,' +
                         ' cro_data_realizada timestamp without time zone,' +
                         ' cro_status character(20), ' +
                         ' cro_resultado text, ' +
                         ' CONSTRAINT pk_cronograma PRIMARY KEY (cro_codigo)' +
                         ')';
         440: CriarCampo('cali_email_enviado', 'calibracao', 'character(1)', 'N', 'S');
         439: GravarNovaFuncao(59, 'RELATÓRIO DE MANUTENÇÃO PREVENTIVA', 59);
         438: sComando:= ' DELETE FROM tabela_combos' +
                         ' WHERE tipo_com = 99 AND (codi_com = 18 OR codi_com = 33 OR codi_com = 34 OR codi_com = 57)';
         437: sComando:= ' ALTER TABLE infraestrutura' +
                         ' ALTER COLUMN desc_inf TYPE character varying(100);';
         436: sComando:= ' CREATE TABLE calibracao_documentos' +
                         '(' +
                         '  doc_codigo integer NOT NULL,' +
                         '  cal_codigo integer NOT NULL,' +
                         '  doc_descricao text,' +
                         '  doc_caminho text,' +
                         '  CONSTRAINT pk_calibracao_documentos PRIMARY KEY (doc_codigo)' +
                         ')';
         435: CriarCampo('emp_exclusoes', 'empresa', 'text');
         434: CriarCampo('man_email_enviado', 'manut', 'character(1)', 'N', 'S');
         433: CriarCampo('man_dias_aviso', 'manut_modelo', 'integer', '0', 'I');
         432: sComando:= ' CREATE TABLE parametros_email_aviso' +
                         '(' +
                         ' par_codigo integer NOT NULL,' +
                         ' par_tipo character(1),' +
                         ' par_colaborador integer, ' +
                         ' CONSTRAINT pk_parametros_email_aviso PRIMARY KEY (par_codigo)' +
                         ')';
         431: CriarCampo('tre_custo', 'colab_treinamentos', 'double precision');
         430: CriarCampo('tre_tempo', 'colab_treinamentos', 'character(5)');
         429: sComando:= ' CREATE TABLE manut_executores' +
                         '(' +
                         ' exe_codigo integer NOT NULL,' +
                         ' man_codigo integer,' +
                         ' exe_executor integer, ' +
                         ' CONSTRAINT pk_manut_executores PRIMARY KEY (exe_codigo)' +
                         ')';
         428: sComando:= ' CREATE TABLE manut_itens' +
                         '(' +
                         ' ite_codigo integer NOT NULL,' +
                         ' man_codigo integer,' +
                         ' ite_descricao character varying(100),' +
                         ' ite_verificado character(1),' +
                         ' ite_obs text,' +
                         ' CONSTRAINT pk_manut_itens PRIMARY KEY (ite_codigo)' +
                         ')';
         427: sComando:= ' CREATE TABLE manut' +
                         '(' +
                         ' man_codigo integer NOT NULL,' +
                         ' man_modelo integer,' +
                         ' man_processo integer,' +
                         ' man_datainicio timestamp without time zone,' +
                         ' man_datafim timestamp without time zone,' +
                         ' man_horainicio character varying(5),' +
                         ' man_horafim character varying(5),' +
                         ' man_equipamento integer,' +
                         ' CONSTRAINT pk_manut PRIMARY KEY (man_codigo)' +
                         ')';
         426: sComando:= ' CREATE TABLE manut_modelo_itens' +
                         '(' +
                         ' ite_codigo integer NOT NULL,' +
                         ' man_codigo integer,' +
                         ' ite_descricao character varying(100),' +
                         ' CONSTRAINT pk_manut_modelo_itens PRIMARY KEY (ite_codigo)' +
                         ')';
         425: sComando:= ' CREATE TABLE manut_modelo' +
                         '(' +
                         ' man_codigo integer NOT NULL,' +
                         ' man_identificacao character varying(30),' +
                         ' man_descricao character varying(150),' +
                         ' man_obs text,' +
                         ' CONSTRAINT pk_manut_modelo PRIMARY KEY (man_codigo)' +
                         ')';
         424: GravarRetencaoFormularios();
         423: CriarCampo('pro_nome_abreviado', 'processos', 'character(10)');
         422: CriarCampo('inf_unidade', 'infraestrutura', 'character(14)');
         421: CriarCampo('inf_resolucao', 'infraestrutura', 'character(30)');
         420: CriarCampo('inf_capacidade', 'infraestrutura', 'character(30)');
         419: CriarCampo('fun_organograma', 'funcoes', 'text');
         418: sComando:= ' UPDATE colab_treinamentos SET dtre_tre = null WHERE dtre_tre = ' + QuotedStr('1899-12-30');
         417: sComando:= ' UPDATE colab_treinamentos SET dtpr_tre = null WHERE dtpr_tre = ' + QuotedStr('1899-12-30');
         416: GravarNovaFuncao(58, 'RELATÓRIO DE TREINAMENTOS', 58);
         415: sComando:= 'UPDATE usuarios SET rnc = 1 WHERE nome_usu = ' + QuotedStr('DESTRA');
         414: CriarCampo('rnc', 'usuarios', 'character(1)');
         413: sComando:= ' ALTER TABLE colaboradores' +
                         ' ALTER COLUMN col_rg TYPE character varying(30);';
         412: CriarCampo('data_filtro_pmc', 'parametros', 'timestamp without time zone');
         411: sComando:= ' CREATE TABLE pmc_email_auto_acoes_nvenc' +
                         '(' +
                         ' aut_codacao integer NOT NULL,' +
                         ' CONSTRAINT pk_pmc_email_auto_acoes_nvenc PRIMARY KEY (aut_codacao)' +
                         ')';
         410: CriarCampo('usu_pend_pmc_acaoimediata', 'usuarios', 'integer', '0', 'I');
         409: CriarCampo('usu_pend_pmc_causa', 'usuarios', 'integer', '0', 'I');
         408: CriarCampo('ind_status', 'indicadores', 'integer', '1', 'I');
         407: sComando:= ' CREATE TABLE pmc_email_auto_acoes' +
                         '(' +
                         ' aut_codacao integer NOT NULL,' +
                         ' aut_ultimo_envio timestamp without time zone,' +
                         ' CONSTRAINT pk_pmc_email_auto_acoes PRIMARY KEY (aut_codacao)' +
                         ')';
         406: CriarCampo('col_validacao_educ_exp', 'colaboradores', 'integer', '0', 'I');
         405: sComando:= ' ALTER TABLE empresa' +
                         ' ALTER COLUMN ende_emp TYPE character varying(150);';
         404: sComando:= ' CREATE TABLE pmc_email_auto' +
                         '(' +
                         ' aut_codpmc integer NOT NULL,' +
                         ' aut_ultimo_envio timestamp without time zone,' +
                         ' CONSTRAINT pk_pmc_email_auto PRIMARY KEY (aut_codpmc)' +
                         ')';
         403: GravarTabelaCombos(3, 'DESCARTE - FORMULÁRIOS', 5, 'APÓS DEMISSÃO', 5);
         402: GravarTabelaCombos(27, 'ORIGEM PDCA', 8, 'PLANEJAMENTO DE MUDANÇAS', 8);
         401: CriarCampo('riscos_cores', 'parametros', 'integer', '0', 'I');
         400: sComando:= ' INSERT INTO processos(codi_pro, nome_pro, pro_exibelista)' +
                         ' VALUES (96, ' + QuotedStr('TRANSPORTADORAS') + ',' + QuotedStr('N') + ');';
         399: sComando:= ' INSERT INTO processos(codi_pro, nome_pro, pro_exibelista)' +
                         ' VALUES (97, ' + QuotedStr('REPRESENTANTES') + ',' + QuotedStr('N') + ');';
         398: TransferirEvidenciasAcoes();
         397: sComando:= ' CREATE TABLE pmc_acoes_evidencias' +
                         '(' +
                         ' evi_codigo integer NOT NULL,' +
                         ' evi_codacao integer,' +
                         ' evi_arquivo character varying(200),' +
                         '  CONSTRAINT pk_pmc_acoes_evidencias PRIMARY KEY (evi_codigo)' +
                         ')';
         396: CriarCampo('nao_enviar_email_pmc', 'parametros', 'integer', '1', 'I');
         395: CriarCampo('aviso_pmc', 'parametros', 'integer', '5', 'I');
         394: AtualizarRetencao();
         393: sComando:= ' CREATE TABLE risco_macro_hist' +
                         '(' +
                         ' his_codigo integer NOT NULL,' +
                         ' his_codanalise integer,' +
                         ' his_usuario character varying(30),' +
                         ' his_data timestamp without time zone,' +
                         ' his_probabilidade integer,' +
                         ' his_consequencia integer, ' +
                         ' his_texto text, ' +
                         '  CONSTRAINT pk_risco_macro_hist PRIMARY KEY (his_codigo)' +
                         ')';
         392: sComando:= ' CREATE TABLE risco_analiseint_hist' +
                         '(' +
                         ' his_codigo integer NOT NULL,' +
                         ' his_codanalise integer,' +
                         ' his_usuario character varying(30),' +
                         ' his_data timestamp without time zone,' +
                         ' his_probabilidade integer,' +
                         ' his_consequencia integer, ' +
                         ' his_texto text, ' +
                         '  CONSTRAINT pk_risco_analiseint_hist PRIMARY KEY (his_codigo)' +
                         ')';
         391: CriarCampo('primeiraavaliacao', 'parametros', 'integer', '30', 'I');
         390: sComando:= ' CREATE TABLE plan_mudanca' +
                         '(' +
                         ' pla_codigo integer NOT NULL,' +
                         ' pla_mudanca character varying(250),' +
                         ' pla_proposito text,' +
                         ' pla_integridade text,' +
                         ' pla_recursos text, ' +
                         ' pla_alocacao text, ' +
                         '  CONSTRAINT pk_plan_mudanca PRIMARY KEY (pla_codigo)' +
                         ')';
         389: CriarCampo('tre_status', 'treinamentos', 'integer', '1', 'I');
         388: sComando:= ' CREATE TABLE rnc_historico' +
                         '(' +
                         ' his_codigo integer NOT NULL,' +
                         ' rnc_codigo integer NOT NULL,' +
                         ' his_data timestamp without time zone,' +
                         ' his_historico character varying(250),' +
                         ' his_usuario character varying(30), ' +
                         ' his_disposicao text, ' +
                         '  CONSTRAINT pk_rnc_historico PRIMARY KEY (his_codigo)' +
                         ')';
         387: GravarNovaFuncao(57, 'ACEITAR/RECUSAR DISPOSIÇÃO DE RNC', 57);
         386: GravarNovaFuncao(56, 'CONSULTA DE RNC', 56);
         385: GravarTabelaCombos(35, 'STATUS - RNC', 1, 'ABERTO', 1);
         384: GravarTabelaCombos(35, 'STATUS - RNC', 2, 'RESPONDIDO', 2);
         383: GravarTabelaCombos(35, 'STATUS - RNC', 3, 'ACEITO', 3);
         382: GravarTabelaCombos(35, 'STATUS - RNC', 4, 'RECUSADO', 4);
         381: sComando:= ' ALTER TABLE colaboradores' +
                         ' ALTER COLUMN col_numero TYPE character varying(10);';
         380: GravarNovaFuncao(55, 'CADASTRO DE ORIGENS DE RNC', 55);
         379: GravarNovaFuncao(54, 'CADASTRO DE MOTIVOS DE RNC', 54);
         378: GravarTabelaCombos(3, 'DESCARTE - FORMULÁRIOS', 4, 'ARQUIVO MORTO', 4);
         377: sComando:= ' CREATE TABLE rnc_documentos' +
                         '(' +
                         '  rnc_codigo integer NOT NULL,' +
                         '  doc_codigo integer NOT NULL,' +
                         '  doc_descricao text,' +
                         '  doc_caminho text,' +
                         '  CONSTRAINT pk_rnc_documentos PRIMARY KEY (rnc_codigo, doc_codigo)' +
                         ')';
         376: GravarTabelaCombos(34, 'RELACIONAMENTO - RNC', 2, 'APOIO', 2);
         375: GravarTabelaCombos(34, 'RELACIONAMENTO - RNC', 1, 'RECLAMAÇÃO', 1);
         374: GravarNovaFuncao(53, 'ABERTURA DE RNC', 53);
         373: sComando:= ' CREATE TABLE rnc(' +
                         ' rnc_codigo integer NOT NULL, ' +
                         ' rnc_identificacao character varying(7) NOT NULL,' +
                         ' rnc_data timestamp without time zone,' +
                         ' rnc_emitido integer,' +
                         ' rnc_motivo integer,' +
                         ' rnc_processo integer,' +
                         ' rnc_setor character varying(25),' +
                         ' rnc_origem integer, ' +
                         ' rnc_cliente integer, ' +
                         ' rnc_fornecedor integer, ' +
                         ' rnc_consumidor character varying(60), ' +
                         ' rnc_nconformidade text,' +
                         ' rnc_procede integer, ' +
                         ' rnc_responsavel integer, ' +
                         ' rnc_departamento character varying(25), ' +
                         ' rnc_relacionamento integer, ' +
                         ' rnc_representante character varying(25), ' +
                         ' rnc_status integer, ' +
                         ' rnc_disposicao text, ' +
                         ' CONSTRAINT rnc_pkey PRIMARY KEY (rnc_codigo)' +
                         ')';
         372: CriarCampo('usu_desabilita_cliente_forn', 'usuarios', 'integer');
         371: CriarCampo('ind_pdca', 'indicadores', 'character varying(8)');
         370: try
                 GravarNovaFuncao(29, 'CADASTRO DE PRODUTOS', 29);
              except

              end;
         369: GravarMotivoRNC();
         368: GravarOrigemRNC();
         367: CriarCampo('cli_dataentrada', 'clientes', 'timestamp without time zone');
         366: CriarCampo('cli_datasaida', 'clientes', 'timestamp without time zone');
         365: CriarCampo('man_diasaviso', 'manutencao', 'integer', '0', 'I');
         364: sComando:= ' CREATE TABLE calibracao_executores(' +
                         ' exe_codigo integer NOT NULL, ' +
                         ' cal_codigo integer NOT NULL,' +
                         ' exe_executor integer NOT NULL,' +
                         ' CONSTRAINT calibracao_executores_pkey PRIMARY KEY (exe_codigo, cal_codigo)' +
                         ')';
         363: CriarCampo('cali_unidade', 'calibracao', 'character varying(14)');
         362: CriarCampo('pmc_fase', 'pmc', 'integer');
         361: CriarCampo('inf_diasaviso', 'infraestrutura', 'integer', '0', 'I');
         360: sComando:= ' CREATE TABLE clientes_obs(' +
                         ' cli_codigo integer NOT NULL, ' +
                         ' cli_codicli integer NOT NULL,' +
                         ' cli_data timestamp without time zone,' +
                         ' cli_contato character varying(30),' +
                         ' cli_mail character varying(60),' +
                         ' cli_fone character varying(60),' +
                         ' cli_depto character varying(60),' +
                         ' cli_obs text,' +
                         ' CONSTRAINT clientes_obs_pkey PRIMARY KEY (cli_codigo, cli_codicli)' +
                         ')';
         359: CriarCampo('usu_pend_indicadores', 'usuarios', 'integer', '0', 'I');
         358: CriarCampo('usu_pend_calibracao', 'usuarios', 'integer', '0', 'I');
         357: CriarCampo('usu_pend_pmc', 'usuarios', 'integer', '0', 'I');
         356: CriarCampo('usu_pend_pmcacoes', 'usuarios', 'integer', '0', 'I');
         355: CriarCampo('usu_pend_forn', 'usuarios', 'integer', '0', 'I');
         354: CriarCampo('usu_pend_procedimentos', 'usuarios', 'integer', '0', 'I');
         353: CriarCampo('usu_pend_avaliacao', 'usuarios', 'integer', '0', 'I');
         352: CriarCampo('usu_pend_treineficacia', 'usuarios', 'integer', '0', 'I');
         351: CriarCampo('usu_pend_treinprevisao', 'usuarios', 'integer', '0', 'I');
         350: CriarCampo('usu_pend_coleducacao', 'usuarios', 'integer', '0', 'I');
         349: CriarCampo('usu_pend_colexperiencia', 'usuarios', 'integer', '0', 'I');
         348: CriarCampo('usu_pend_manutpreventiva', 'usuarios', 'integer', '0', 'I');
         347: CriarCampo('usu_pend_pdcaacoes', 'usuarios', 'integer', '0', 'I');
         346: CriarCampo('usu_pend_analisecritica', 'usuarios', 'integer', '0', 'I');
         345: CriarCampo('usu_pend_habilidades', 'usuarios', 'integer', '0', 'I');

         344: CriarCampo('periodohab', 'parametros', 'integer', '1', 'I');
         343: GravarTabelaCombos(31, 'PERÍODO AVALIAÇÃO DE HABILIDADES', 3, '3 ANOS', 3);
         342: GravarTabelaCombos(31, 'PERÍODO AVALIAÇÃO DE HABILIDADES', 2, '2 ANOS', 2);
         341: GravarTabelaCombos(31, 'PERÍODO AVALIAÇÃO DE HABILIDADES', 1, '1 ANO', 1);
         340: CriarCampo('notapendencia', 'parametros', 'double precision', '2', 'I');
         339: CriarCampo('col_pis', 'colaboradores', 'character(20)');
         338: CriarCampo('col_ctps', 'colaboradores', 'character(15)');
         337: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 10, 'MESTRADO', 1);
         336: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 22, 'MESTRADO CURSANDO', 2);
         335: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 23, 'MESTRADO INCOMPLETO', 3);
         334: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  9, 'DOUTORADO', 4);
         333: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 21, 'DOUTORADO CURSANDO', 5);
         332: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 24, 'DOUTORADO INCOMPLETO', 6);
         331: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  8, 'PÓS GRADUAÇÃO', 7);
         330: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 20, 'PÓS GRADUAÇÃO CURSANDO', 8);
         329: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 13, 'PÓS GRADUAÇÃO INCOMPLETO', 9);
         328: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  1, 'SUPERIOR', 10);
         327: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 19, 'SUPERIOR CURSANDO', 11);
         326: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  2, 'SUPERIOR INCOMPLETO', 12);
         325: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  3, 'TÉCNICO', 13);
         324: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 18, 'TÉCNICO CURSANDO', 14);
         323: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 12, 'TÉCNICO INCOMPLETO', 15);
         322: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  4, 'ENSINO MÉDIO', 16);
         321: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 17, 'ENSINO MÉDIO CURSANDO', 17);
         320: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 15, 'ENSINO MÉDIO INCOMPLETO', 18);
         319: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  5, 'ENSINO FUNDAMENTAL', 19);
         318: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 16, 'ENSINO FUNDAMENTAL CURSANDO', 20);
         317: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 14, 'ENSINO FUNDAMENTAL INCOMPLETO', 21);
         316: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  6, 'ALFABETIZADO', 22);
         315: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES',  7, 'NÃO ALFABETIZADO', 23);
         314: GravarTabelaCombos(6, 'EDUCAÇÃO - FUNÇÕES', 11, 'NENHUMA', 24);
         313: sComando:= ' DELETE FROM tabela_combos WHERE tipo_com = 6';
         312: sComando:= ' CREATE TABLE lista_perigos_leis(' +
                         ' lir_identificacao character varying(6) NOT NULL,' +
                         ' lis_numperigo integer NOT NULL,' +
                         ' CONSTRAINT lista_perigos_leis_pkey PRIMARY KEY (lir_identificacao, lis_numperigo)' +
                         ')';
         311: sComando:= ' CREATE TABLE lista_perigos_danos(' +
                         ' lis_numdano integer NOT NULL,' +
                         ' lis_numperigo integer NOT NULL,' +
                         ' CONSTRAINT lista_perigos_danos_pkey PRIMARY KEY (lis_numdano, lis_numperigo)' +
                         ')';
         310: sComando:= 'DROP TABLE iqf;';
         309: sComando:= ' CREATE TABLE lista_perigos(' +
                         ' lis_numperigo integer NOT NULL,' +
                         ' lis_atividade character varying(250) NOT NULL,' +
                         ' lis_perigo character varying(250),' +
                         ' lis_tipo_atividade integer,' +
                         ' lis_processo integer,' +
                         ' lis_data timestamp without time zone,' +
                         ' lis_probabilidade integer,' +
                         ' lis_gravidade integer,' +
                         ' lis_responsavel integer,' +
                         ' lis_controle text,' +
                         ' lis_probabilidade_reav integer,' +
                         ' lis_gravidade_reav integer,' +
                         ' lis_data_reav timestamp without time zone,' +
                         ' lis_responsavel_reav integer,' +
                         ' lis_controle_reav text,' +
                         ' CONSTRAINT lista_perigos_pkey PRIMARY KEY (lis_numperigo)' +
                         ')';
         308: GravarNovaFuncao(52, 'LISTA DE PERIGOS E AVALIAÇÃO DOS RISCOS', 52);
         307: GravarNovaFuncao(51, 'CADASTRO DE RISCOS/DANOS', 51);
         306: GravarTabelaCombos(30, 'TIPO DE ATIVIDADE - RISCOS/DANOS', 2, 'NÃO ROTINEIRA', 2);
         305: GravarTabelaCombos(30, 'TIPO DE ATIVIDADE - RISCOS/DANOS', 1, 'ROTINEIRA', 1);
         304: sComando:= ' CREATE TABLE danos(' +
                         ' dan_codigo integer NOT NULL,' +
                         ' dan_nome character varying(250) NOT NULL,' +
                         ' dan_descricao text,' +
                         ' CONSTRAINT danos_pkey PRIMARY KEY (dan_codigo)' +
                         ')';
         303: CriarCampo('col_admissao', 'colaboradores', 'timestamp without time zone');
         302: CriarCampo('mac_pdca', 'risco_macro', 'character(10)');
         301: CriarCampo('int_pdca', 'risco_analiseint', 'character(10)');
         300: sComando:= ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('0.2') + ',' + QuotedStr('Principios de Gestão') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('0.3') + ',' + QuotedStr('Abordagem de processos') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('4.1.1') + ',' + QuotedStr('Organização e seu contexto') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('4.2') + ',' + QuotedStr('Necessidades e expectativas das partes interessadas') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('4.3') + ',' + QuotedStr('Determinação de escopo') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('4.4.1') + ',' + QuotedStr('Processos do SGQ') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('4.4.2') + ',' + QuotedStr('Extensão do SGQ') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('5.1.1') + ',' + QuotedStr('Liderança e comprometimento') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('5.1.2') + ',' + QuotedStr('Foco nos clientes') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('5.2.1') + ',' + QuotedStr('Desenvolvimento da política da qualidade') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('5.2.2') + ',' + QuotedStr('Comunicação da política da qualidade') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('5.3') + ',' + QuotedStr('Papéis, responsabilidades e autoridades') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('6.1') + ',' + QuotedStr('Abordagem de riscos e oportunidades') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('6.2') + ',' + QuotedStr('Objetivos da qualidade e planejamento') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('6.3') + ',' + QuotedStr('Planejamento de mudanças') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.1') + ',' + QuotedStr('Apoio - Recursos') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.2') + ',' + QuotedStr('Apoio - Pessoas') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.3') + ',' + QuotedStr('Apoio - Infraestrutura') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.4') + ',' + QuotedStr('Apoio - Ambiente para operações de processos') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.5.1') + ',' + QuotedStr('Recursos de monitoramento e medição') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.5.2') + ',' + QuotedStr('Rastreabilidade de medição') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.1.6') + ',' + QuotedStr('Conhecimento organizacional') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.2') + ',' + QuotedStr('Competência') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.3') + ',' + QuotedStr('Conscientização') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.4') + ',' + QuotedStr('Comunicação') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('7.5') + ',' + QuotedStr('Informação documentada') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.1') + ',' + QuotedStr('Planejamento e controle operacionais') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.2.1') + ',' + QuotedStr('Requisitos de produtos e serviços - Comunicação') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.2.2') + ',' + QuotedStr('Determinalção de requisitos de produtos e serviços') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.2.3') + ',' + QuotedStr('Análise crítica requisitos de produtos e serviços') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.2.4') + ',' + QuotedStr('Mudanças nos requisitos de produtos e serviços') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.3') + ',' + QuotedStr('Projeto e desenvolvimento') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.4') + ',' + QuotedStr('Controle de provedores externos') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.5.1') + ',' + QuotedStr('Controle produção e provisão de serviços') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.5.2') + ',' + QuotedStr('Identificação e rastreabilidade') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.5.3') + ',' + QuotedStr('Propriedade cliente ou provedores externos') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.5.4') + ',' + QuotedStr('Preservação') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.5.5') + ',' + QuotedStr('Atividades pós-entrega') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.5.6') + ',' + QuotedStr('Controle de mudanças') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.6') + ',' + QuotedStr('Liberação de produtos e serviços') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('8.7') + ',' + QuotedStr('Controle de saídas não conformes') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('9.1') + ',' + QuotedStr('Monitoramento medição, análise e avaliação') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('9.1.2') + ',' + QuotedStr('Satisfação do cliente') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('9.1.3.6') + ',' + QuotedStr('Análise e avaliação') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('9.2.6') + ',' + QuotedStr('Auditoria Interna') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('9.3') + ',' + QuotedStr('Análise crítica da direção') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('10.1') + ',' + QuotedStr('Melhorias') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('10.2') + ',' + QuotedStr('Não Conformidade e ação corretiva') + ');' +
                         ' INSERT INTO requisitos2015 VALUES (' + QuotedStr('10.3') + ',' + QuotedStr('Melhoria contínua') + ');';
         299: sComando:= ' CREATE TABLE requisitos2015(' +
                         ' req_codigo character(7) NOT NULL,' +
                         ' req_descricao character varying(70) NOT NULL,' +
                         ' CONSTRAINT requisitos2015_pkey PRIMARY KEY (req_codigo)' +
                         ')';
         298: sComando:= ' CREATE TABLE auditoria_interna_agenda2015(' +
                         ' aud_codigo integer NOT NULL,' +
                         ' aud_cod_auditoria integer NOT NULL,' +
                         ' aud_data date NOT NULL,' +
                         ' aud_horaini character varying(5),' +
                         ' aud_horafim character varying(5),' +
                         ' aud_auditores character varying(80),' +
                         ' aud_auditado integer,' +
                         ' aud_processo integer,' +
                         ' CONSTRAINT pk_auditoria_interna_agenda2015 PRIMARY KEY (aud_codigo)' +
                         ')';
         297: sComando:= ' CREATE TABLE auditoria_interna_rel_itens2015(' +
                         ' dtpr_aud timestamp without time zone NOT NULL,' +
                         ' proc_ite integer NOT NULL DEFAULT 0,' +
                         ' requ_ite character varying(60) NOT NULL,' +
                         ' cont_ite text,' +
                         ' tipo_ite integer,' +
                         ' ite_codigo integer NOT NULL DEFAULT 0,' +
                         ' CONSTRAINT auditoria_interna_rel_itens2015_pkey PRIMARY KEY (ite_codigo)' +
                         ' )';
         296: sComando:= ' CREATE TABLE auditoria_interna_rel2015(' +
                         ' dtpr_aud timestamp without time zone NOT NULL,' +
                         ' tama_aud character varying(100),' +
                         ' norm_aud character varying(100),' +
                         ' audi_aud character varying(100),' +
                         ' adtd_aud character varying(100),' +
                         ' hora_aud character varying(100),' +
                         ' data_aud character varying(100),' +
                         ' esco_aud text,' +
                         ' real_aud text,' +
                         ' resu_aud text,' +
                         ' repr_aud bigint,' +
                         ' CONSTRAINT auditoria_interna_rel2015_pkey PRIMARY KEY (dtpr_aud)' +
                         ' )';
         295: sComando:= ' CREATE TABLE auditoria_interna2015(' +
                         'aud_codigo integer NOT NULL,' +
                         'data_aud timestamp without time zone NOT NULL,' +
                         'proc_aud bigint NOT NULL DEFAULT 0,' +
                         'r02_aud smallint NOT NULL DEFAULT 0,' +
                         'r03_aud smallint NOT NULL DEFAULT 0,' +
                         'r411_aud smallint NOT NULL DEFAULT 0,' +
                         'r42_aud smallint NOT NULL DEFAULT 0,' +
                         'r43_aud smallint NOT NULL DEFAULT 0,' +
                         'r441_aud smallint NOT NULL DEFAULT 0,' +
                         'r442_aud smallint NOT NULL DEFAULT 0,' +
                         'r511_aud smallint NOT NULL DEFAULT 0,' +
                         'r512_aud smallint NOT NULL DEFAULT 0,' +
                         'r521_aud smallint NOT NULL DEFAULT 0,' +
                         'r522_aud smallint NOT NULL DEFAULT 0,' +
                         'r53_aud smallint NOT NULL DEFAULT 0,' +
                         'r61_aud smallint NOT NULL DEFAULT 0,' +
                         'r62_aud smallint NOT NULL DEFAULT 0,' +
                         'r63_aud smallint NOT NULL DEFAULT 0,' +
                         'r711_aud smallint NOT NULL DEFAULT 0,' +
                         'r712_aud smallint NOT NULL DEFAULT 0,' +
                         'r713_aud smallint NOT NULL DEFAULT 0,' +
                         'r714_aud smallint NOT NULL DEFAULT 0,' +
                         'r7151_aud smallint NOT NULL DEFAULT 0,' +
                         'r7152_aud smallint NOT NULL DEFAULT 0,' +
                         'r716_aud smallint NOT NULL DEFAULT 0,' +
                         'r72_aud smallint NOT NULL DEFAULT 0,' +
                         'r73_aud smallint NOT NULL DEFAULT 0,' +
                         'r74_aud smallint NOT NULL DEFAULT 0,' +
                         'r75_aud smallint NOT NULL DEFAULT 0,' +
                         'r81_aud smallint NOT NULL DEFAULT 0,' +
                         'r821_aud smallint NOT NULL DEFAULT 0,' +
                         'r822_aud smallint NOT NULL DEFAULT 0,' +
                         'r823_aud smallint NOT NULL DEFAULT 0,' +
                         'r824_aud smallint NOT NULL DEFAULT 0,' +
                         'r83_aud smallint NOT NULL DEFAULT 0,' +
                         'r84_aud smallint NOT NULL DEFAULT 0,' +
                         'r851_aud smallint NOT NULL DEFAULT 0,' +
                         'r852_aud smallint NOT NULL DEFAULT 0,' +
                         'r853_aud smallint NOT NULL DEFAULT 0,' +
                         'r854_aud smallint NOT NULL DEFAULT 0,' +
                         'r855_aud smallint NOT NULL DEFAULT 0,' +
                         'r856_aud smallint NOT NULL DEFAULT 0,' +
                         'r86_aud smallint NOT NULL DEFAULT 0,' +
                         'r87_aud smallint NOT NULL DEFAULT 0,' +
                         'r91_aud smallint NOT NULL DEFAULT 0,' +
                         'r912_aud smallint NOT NULL DEFAULT 0,' +
                         'r913_aud smallint NOT NULL DEFAULT 0,' +
                         'r92_aud smallint NOT NULL DEFAULT 0,' +
                         'r93_aud smallint NOT NULL DEFAULT 0,' +
                         'r101_aud smallint NOT NULL DEFAULT 0,' +
                         'r102_aud smallint NOT NULL DEFAULT 0,' +
                         'r103_aud smallint NOT NULL DEFAULT 0,' +
                         ' CONSTRAINT auditoria_interna2015_pkey PRIMARY KEY (aud_codigo, data_aud, proc_aud)' +
                         ' )';
         294: GravarNovaFuncao(50, 'RELATÓRIO DE AUDITORIA ISO-9001:2015', 50);
         293: GravarNovaFuncao(49, 'PROGRAMA DE AUDITORIA ISO-9001:2015', 49);
         292: sComando:= ' UPDATE tabela_combos SET valo_com = ' +
                         QuotedStr('RELATÓRIO DE AUDITORIA ISO-9001:2008') +
                         ' WHERE tipo_com = 99 AND codi_com = 20';
         291: sComando:= ' UPDATE tabela_combos SET valo_com = ' +
                         QuotedStr('PROGRAMA DE AUDITORIA ISO-9001:2008') +
                         ' WHERE tipo_com = 99 AND codi_com = 19';
         290: CriarCampo('usu_qtd_proc', 'usuarios', 'integer', '14', 'I');
         289: sComando:= 'DELETE FROM tabela_combos WHERE tipo_com = 99 AND codi_com = 29';
         288: CriarCampo('risco_severo_ame', 'parametros', 'integer', '1', 'I');
         287: CriarCampo('risco_alto_ame', 'parametros', 'integer', '1', 'I');
         286: CriarCampo('risco_medio_ame', 'parametros', 'integer', '1', 'I');
         285: CriarCampo('risco_baixo_ame', 'parametros', 'integer', '1', 'I');
         284: CriarCampo('risco_severo_opo', 'parametros', 'integer', '1', 'I');
         283: CriarCampo('risco_alto_opo', 'parametros', 'integer', '1', 'I');
         282: CriarCampo('risco_medio_opo', 'parametros', 'integer', '1', 'I');
         281: CriarCampo('risco_baixo_opo', 'parametros', 'integer', '1', 'I');
         280: CriarCampo('risco_severo_pfr', 'parametros', 'integer', '1', 'I');
         279: CriarCampo('risco_alto_pfr', 'parametros', 'integer', '1', 'I');
         278: CriarCampo('risco_medio_pfr', 'parametros', 'integer', '1', 'I');
         277: CriarCampo('risco_baixo_pfr', 'parametros', 'integer', '1', 'I');

         276: sComando:= ' ALTER TABLE parametros' +
                         ' RENAME risco_severo TO risco_severo_pfo;';
         275: sComando:= ' ALTER TABLE parametros' +
                         ' RENAME risco_alto TO risco_alto_pfo;';
         274: sComando:= ' ALTER TABLE parametros' +
                         ' RENAME risco_medio TO risco_medio_pfo;';
         273: sComando:= ' ALTER TABLE parametros' +
                         ' RENAME risco_baixo TO risco_baixo_pfo;';
         272: GravarTabelaCombos(27, 'ORIGEM PDCA', 7, 'ANÁLISE DE RISCOS', 7);
         271: GravarTabelaCombos(27, 'ORIGEM PDCA', 6, 'PMC', 6);
         270: sComando:= 'UPDATE parametros SET mostra_carta = ' + QuotedStr('S');
         // 2.09 Acima
//         269: sComando:= ' ALTER TABLE pdca' +
//                         ' ALTER COLUMN pdca_descricao TYPE character varying(150);';
//         268: sComando:= ' ALTER TABLE risco_analiseint' +
//                         ' ALTER COLUMN int_texto TYPE text;';
//         267: sComando:= ' ALTER TABLE risco_macro' +
//                         ' ALTER COLUMN mac_texto TYPE text;';
//         266: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 1, 'NENHUMA', 1);
//         265: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 2, '1 ANO', 4);
//         264: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 3, '2 ANOS', 5);
//         263: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 4, '3 ANOS', 6);
//         262: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 5, 'ACIMA DE 3 ANOS', 7);
//         261: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 6, '6 MESES', 3);
//         260: GravarTabelaCombos(7, 'EXPERIÊNCIA - FUNÇÕES', 7, '3 MESES', 2);
//         259: sComando:= ' DELETE FROM tabela_combos WHERE tipo_com = 7';
//         258: sComando:= ' UPDATE estados SET codi_est = 26 WHERE codi_est = 0';
//         257: sComando:= ' INSERT INTO processos(codi_pro, nome_pro, pro_exibelista)' +
//                         ' VALUES (99, ' + QuotedStr('FORNECEDORES') + ',' + QuotedStr('N') + ');';
//         256: sComando:= ' INSERT INTO processos(codi_pro, nome_pro, pro_exibelista)' +
//                         ' VALUES (98, ' + QuotedStr('CLIENTES') + ',' + QuotedStr('N') + ');';
//         255: CriarCampo('pro_exibelista', 'processos', 'character(1)', 'S', 'S');
//         254: CriarCampo('man_datacadastro', 'manutencao', 'timestamp without time zone');
//         253: sComando:= 'UPDATE parametros SET mostra_carta = ' + QuotedStr('S');
//         252: GravarTabelaCombos(29, 'TIPO ANÁLISE DE RISCO', 1, 'INTERNA', 1);
//         251: GravarTabelaCombos(29, 'TIPO ANÁLISE DE RISCO', 2, 'EXTERNA', 2);
//         250: CriarCampo('pmc_tiporisco', 'pmc', 'integer');
//         249: GravarNovaFuncao(48, 'VINCULAR RISCO AO PMC', 48);
//         248: CriarCampo('pmc_codrisco', 'pmc', 'integer');
//         247: CriarCampo('notamaxhab', 'parametros', 'double precision', '5', 'I');
//         246: GravarNovaFuncao(47, 'RELATÓRIO DE CALIBRAÇÃO', 47);
//         245: GravarNovaFuncao(46, 'LISTA DE TREINAMENTOS REALIZADOS/NÃO REALIZADOS', 46);
//         244: GravarNovaFuncao(45, 'LISTA DE HABILIDADES COM PENDÊNCIA', 45);
//         243: sComando:= ' CREATE TABLE IF NOT EXISTS pdca_docs(' +
//                         ' pdca_codigo integer NOT NULL,' +
//                         ' pdca_coddoc integer NOT NULL,' +
//                         ' pdca_descricao character varying(250),' +
//                         ' pdca_caminho text,' +
//                         ' CONSTRAINT pdca_doc PRIMARY KEY (pdca_codigo, pdca_coddoc)' +
//                         ' )';
//         242: CriarCampo('email_risco', 'parametros', 'integer');
//         241: CriarCampo('email_pmc', 'parametros', 'integer');
//         240: sComando:= 'UPDATE usuarios SET risco = 1, pdca = 1 WHERE nome_usu = ' + QuotedStr('DESTRA');
//         239: CriarCampo('risco', 'usuarios', 'character(1)');
//         238: CriarCampo('col_celular', 'colaboradores', 'character varying(20)');
//         237: CriarCampo('col_telefone', 'colaboradores', 'character varying(20)');
//         236: CriarCampo('col_cep', 'colaboradores', 'character varying(9)');
//         235: CriarCampo('col_estado', 'colaboradores', 'character(2)');
//         234: CriarCampo('col_cidade', 'colaboradores', 'character varying(80)');
//         233: CriarCampo('col_bairro', 'colaboradores', 'character varying(50)');
//         232: CriarCampo('col_numero', 'colaboradores', 'character varying(6)');
//         231: CriarCampo('col_endereco', 'colaboradores', 'character varying(80)');
//         230: sComando:= ' CREATE TABLE IF NOT EXISTS processos_subsequentes(' +
//                         ' sub_codigo integer NOT NULL,' +
//                         ' pro_codigo integer NOT NULL,' +
//                         ' CONSTRAINT PK_processos_subsequentes PRIMARY KEY (sub_codigo, pro_codigo)' +
//                         ' )';
//         229: sComando:= ' CREATE TABLE IF NOT EXISTS processos_antecedentes(' +
//                         ' ant_codigo integer NOT NULL,' +
//                         ' pro_codigo integer NOT NULL,' +
//                         ' CONSTRAINT PK_processos_antecedentes PRIMARY KEY (ant_codigo, pro_codigo)' +
//                         ' )';
//         228: CriarCampo('pdca', 'usuarios', 'character(1)');
//         227: GravarNovaFuncao(44, 'PDCA', 44);
//         226: CriarCampo('fun_cbo', 'funcoes', 'character varying(10)');
//         225: CriarCampo('risco_severo', 'parametros', 'integer', '1', 'I');
//         224: CriarCampo('risco_alto', 'parametros', 'integer', '1', 'I');
//         223: CriarCampo('risco_medio', 'parametros', 'integer', '1', 'I');
//         222: CriarCampo('risco_baixo', 'parametros', 'integer', '1', 'I');
//         221: CriarCampo('col_cpf', 'colaboradores', 'character varying(14)');
//         220: CriarCampo('col_rg', 'colaboradores', 'character varying(13)');
//         219: CriarCampo('casasindicador', 'parametros', 'integer', '2', 'I');
//         218: GravarTabelaCombos(27, 'ORIGEM PDCA', 5, 'ANÁLISE DE CONTEXTO', 5);
//         217: CriarCampo('edu_curso', 'colab_educacao', 'character varying(50)');
//         216: GravarTabelaCombos(28, 'FASE PMC', 6, 'FINALIZADO', 6);
//         215: GravarTabelaCombos(28, 'FASE PMC', 5, 'VERIFICAÇÃO DE EFICÁCIA', 5);
//         214: GravarTabelaCombos(28, 'FASE PMC', 4, 'IMPLANTAÇÃO DE AÇÕES', 4);
//         213: GravarTabelaCombos(28, 'FASE PMC', 3, 'DEFINIÇÃO DE AÇÕES', 3);
//         212: GravarTabelaCombos(28, 'FASE PMC', 2, 'IDENTIFICAÇÃO DA CAUSA', 2);
//         211: GravarTabelaCombos(28, 'FASE PMC', 1, 'AÇÃO DE CONTENCÃO IMEDIATA', 1);
//         210: CriarCampo('pmc_preveficacia', 'pmc', 'timestamp without time zone');
//         209: PreencherDataAcaoPMC();
//         208: CriarCampo('fec_quemforn', 'manutencao_fecha', 'integer', '0', 'I');
//         207: sComando:= ' CREATE TABLE IF NOT EXISTS pdca_lanc(' +
//                         ' lan_codigo integer NOT NULL,' +
//                         ' pdca_codigo integer NOT NULL,' +
//                         ' lan_oque text  ,' +
//                         ' lan_onde text,' +
//                         ' lan_porque text,' +
//                         ' lan_quando timestamp without time zone,' +
//                         ' lan_como text,' +
//                         ' lan_quem integer,' +
//                         ' lan_recursos text,' +
//                         ' lan_quanto double precision,' +
//                         ' lan_datarealizada timestamp without time zone,' +
//                         ' lan_verimplantacao text,' +
//                         ' lan_status integer,' +
//                         ' lan_dtprevista timestamp without time zone,' +
//                         ' lan_dtfinalizado timestamp without time zone,' +
//                         ' lan_chkobs text,' +
//                         ' CONSTRAINT PK_pdca_lanc PRIMARY KEY (lan_codigo)' +
//                         ' )';
//         206: GravarNovaFuncao(43, 'PARÂMETROS DO SISTEMA', 43);
//         205: CriarCampo('pesoiqfavaliacao', 'parametros', 'double precision', '20', 'I');
//         204: CriarCampo('pesoiqfpontualidade', 'parametros', 'double precision', '30', 'I');
//         203: CriarCampo('pesoiqfconformidade', 'parametros', 'double precision', '50', 'I');
//         202: GravarTabelaCombos(27, 'ORIGEM PDCA', 4, 'PARTE INTERESSADA', 4);
//         201: GravarTabelaCombos(27, 'ORIGEM PDCA', 3, 'PLANEJAMENTO ESTRATÉGICO', 3);
//         200: GravarTabelaCombos(27, 'ORIGEM PDCA', 2, 'OBJETIVOS', 2);
//         199: GravarTabelaCombos(27, 'ORIGEM PDCA', 1, 'INDICADOR', 1);
//         198: sComando:= ' CREATE TABLE IF NOT EXISTS pdca(' +
//                         ' pdca_codigo integer NOT NULL,' +
//                         ' pdca_identificacao character varying(8),' +
//                         ' pdca_data timestamp without time zone,' +
//                         ' pdca_descricao character varying(50),' +
//                         ' pdca_origem integer,' +
//                         ' pdca_processo integer,' +
//                         ' pdca_emitido integer,' +
//                         ' CONSTRAINT PK_pdca PRIMARY KEY (pdca_codigo)' +
//                         ' )';
//         197: CriarCampo('tre_conteudo', 'treinamentos', 'text');
//         196: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 1, 'DIÁRIO', 1);
//         195: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 7, 'SEMANAL', 2);
//         194: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 15, 'QUINZENAL', 3);
//         193: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 30, 'MENSAL', 4);
//         192: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 60, 'BIMESTRAL', 5);
//         191: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 90, 'TRIMESTRAL', 6);
//         190: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 180, 'SEMESTRAL', 7);
//         189: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 365, 'ANUAL', 8);
//         188: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 730, 'BIENAL', 9);
//         187: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 1095, 'TRIENAL', 10);
//         186: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 1460, 'QUADRIENAL', 11);
//         185: GravarTabelaCombos(19, 'PERIODICIDADE - DIAS', 1825, 'QUINQUENAL', 12);
//         184: sComando:= ' DELETE FROM tabela_combos' +
//                         ' WHERE tipo_com = 19';
//         183: GravarNovaFuncao(42, 'ANÁLISE DE CONTEXTO', 42);
//         182: GravaUsuarios('42');
//         181: sComando:= ' CREATE TABLE IF NOT EXISTS contexto_analise(' +
//                         ' ana_codigo integer NOT NULL,' +
//                         ' ana_contexto integer,' +
//                         ' ana_parte integer,' +
//                         ' ana_requisito text,' +
//                         ' ana_monitoramento text,' +
//                         ' CONSTRAINT PK_contexto_analise PRIMARY KEY (ana_codigo)' +
//                         ' )';
//         180: sComando:= ' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (5, ' + QuotedStr('SOCIEDADE') + ',' + QuotedStr('') + ');';
//         179: sComando:= ' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (4, ' + QuotedStr('FORNECEDOR') + ',' + QuotedStr('') + ');';
//         178: sComando:= ' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (3, ' + QuotedStr('FUNCIONÁRIO') + ',' + QuotedStr('') + ');';
//         177: sComando:= ' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (2, ' + QuotedStr('ACIONISTA') + ',' + QuotedStr('') + ');';
//         176: sComando:= ' INSERT INTO partes(par_codigo, par_nome, par_descricao)' +
//                         ' VALUES (1, ' + QuotedStr('CLIENTE') + ',' + QuotedStr('') + ');';
//         175: GravarNovaFuncao(41, 'CADASTRO DE PARTES INTERESSADAS', 41);
//         174: GravaUsuarios('41');
//         173: sComando:= ' CREATE TABLE IF NOT EXISTS partes(' +
//                         ' par_codigo integer NOT NULL,' +
//                         ' par_nome character varying(200),' +
//                         ' par_descricao text,' +
//                         ' CONSTRAINT PK_partes PRIMARY KEY (par_codigo)' +
//                         ' )';
//         172: GravarNovaFuncao(40, 'CADASTRO DE CONTEXTOS', 40);
//         171: GravaUsuarios('40');
//         170: sComando:= ' CREATE TABLE IF NOT EXISTS contextos(' +
//                         ' con_codigo integer NOT NULL,' +
//                         ' con_nome character varying(200),' +
//                         ' con_descricao text,' +
//                         ' CONSTRAINT PK_contextos PRIMARY KEY (con_codigo)' +
//                         ' )';
//         169: CriarCampo('hab_especificacao', 'habilidades', 'text');
//         168: CriarCampo('emp_Valores', 'empresa', 'text');
//         167: CriarCampo('emp_Visao', 'empresa', 'text');
//         166: CriarCampo('emp_Missao', 'empresa', 'text');
//         165: GravarTabelaCombos(26, 'DEFEITOS - STATUS', 1, 'NÃO APLICÁVEL', 1);
//         164: GravarTabelaCombos(26, 'DEFEITOS - STATUS', 2, 'APROVADO', 2);
//         163: GravarTabelaCombos(26, 'DEFEITOS - STATUS', 3, 'REPROVADO', 3);
//         162: sComando:= ' CREATE TABLE IF NOT EXISTS produtos(' +
//                         ' pro_codigo integer NOT NULL,' +
//                         ' pro_descricao character varying(200),' +
//                         ' CONSTRAINT PK_produtos PRIMARY KEY (pro_codigo)' +
//                         ' )';
//         161: sComando:= ' CREATE TABLE IF NOT EXISTS defeitos_lanc_itens(' +
//                         ' ite_codigo integer NOT NULL,' +
//                         ' lan_codigo integer NOT NULL,' +
//                         ' lan_defeito integer NOT NULL, ' +
//                         ' lan_qtd numeric(18,6) NOT NULL,' +
//                         ' CONSTRAINT PK_defeitos_lanc_itens PRIMARY KEY (ite_codigo)' +
//                         ' )';
//         160: sComando:= ' CREATE TABLE IF NOT EXISTS defeitos_lanc(' +
//                         ' lan_codigo integer NOT NULL,' +
//                         ' lan_data timestamp without time zone, ' +
//                         ' lan_origem integer NOT NULL, ' +
//                         ' lan_produto integer NOT NULL, ' +
//                         ' lan_rastreabilidade character varying(200),' +
//                         ' lan_qtd numeric(18,6) NOT NULL,' +
//                         ' lan_status integer NOT NULL, ' +
//                         ' CONSTRAINT PK_defeitos_lanc PRIMARY KEY (lan_codigo)' +
//                         ' )';
//         159: sComando:= ' CREATE TABLE IF NOT EXISTS defeitos_origem(' +
//                         ' ori_codigo integer NOT NULL,' +
//                         ' ori_descricao character varying(200),' +
//                         ' CONSTRAINT PK_defeitos_origem PRIMARY KEY (ori_codigo)' +
//                         ' )';
//         158: sComando:= ' CREATE TABLE IF NOT EXISTS defeitos(' +
//                         ' def_codigo integer NOT NULL,' +
//                         ' def_descricao character varying(200),' +
//                         ' def_classe integer NOT NULL,' +
//                         ' CONSTRAINT PK_defeitos PRIMARY KEY (def_codigo)' +
//                         ' )';
//         157: sComando:= ' CREATE TABLE IF NOT EXISTS defeitos_classe(' +
//                         ' cla_codigo integer NOT NULL,' +
//                         ' cla_descricao character varying(200),' +
//                         ' CONSTRAINT PK_defeitos_classe PRIMARY KEY (cla_codigo)' +
//                         ' )';
         // 2.08 Acima
//         156: sComando:= ' ALTER TABLE manutencao' +
//                         ' ALTER COLUMN anom_man TYPE text;';
//         155: sComando:= ' ALTER TABLE manutencao' +
//                         ' ALTER COLUMN como_man TYPE text;';
//         154: sComando:= ' ALTER TABLE manutencao' +
//                         ' ALTER COLUMN quan_man TYPE text;';
//         153: sComando:= ' ALTER TABLE manutencao' +
//                         ' ALTER COLUMN oque_man TYPE text;';
//         152: sComando:= ' ALTER TABLE requisitos' +
//                         ' ALTER COLUMN req_codigo TYPE character(5);';
//         151: sComando:= ' ALTER TABLE auditoria_interna_rel_itens' +
//                         ' ADD CONSTRAINT auditoria_interna_rel_itens_pkey' +
//                         ' PRIMARY KEY (ite_codigo);';
//         150: sComando:= ' UPDATE auditoria_interna_rel_itens SET ite_codigo = ' +
//                         ' NEXTVAL(' + QuotedStr('auditoria_interna_rel_itens_id_seq') + ');';
//         149: sComando:= ' ALTER TABLE auditoria_interna_rel_itens ALTER COLUMN ite_codigo' +
//                         ' SET DEFAULT NEXTVAL(' + QuotedStr('auditoria_interna_rel_itens_id_seq') + ');';
//         148: sComando:= ' CREATE SEQUENCE auditoria_interna_rel_itens_id_seq;';
//         147: sComando:= ' ALTER TABLE auditoria_interna_rel_itens' +
//                         ' ADD COLUMN ite_codigo integer';
//
//         146: sComando:= ' ALTER TABLE formularios_locais' +
//                         ' ADD CONSTRAINT formularios_locais_pkey' +
//                         ' PRIMARY KEY (for_codigo);';
//         145: sComando:= ' UPDATE formularios_locais SET for_codigo = ' +
//                         ' NEXTVAL(' + QuotedStr('formularios_locais_id_seq') + ');';
//         144: sComando:= ' ALTER TABLE formularios_locais ALTER COLUMN for_codigo' +
//                         ' SET DEFAULT NEXTVAL(' + QuotedStr('formularios_locais_id_seq') + ');';
//         143: sComando:= ' CREATE SEQUENCE formularios_locais_id_seq;';
//         142: sComando:= ' ALTER TABLE formularios_locais' +
//                         ' ADD COLUMN for_codigo integer;';
//         141: sComando:= ' ALTER TABLE formularios_locais' +
//                         ' DROP CONSTRAINT formularios_locais_pkey;';
//
//         140: sComando:= ' CREATE TABLE IF NOT EXISTS colab_doc(' +
//                         ' doc_codigo integer NOT NULL,' +
//                         ' doc_cod_colab integer NOT NULL,' +
//                         ' doc_descricao character varying(200),' +
//                         ' doc_caminho text,' +
//                         ' CONSTRAINT PK_colab_doc PRIMARY KEY (doc_codigo)' +
//                         ' )';
//         139: sComando:= ' ALTER TABLE formularios' +
//                         ' ALTER COLUMN nume_for TYPE character varying(18);';
//         138: sComando:= ' ALTER TABLE colab_treinamentos' +
//                         ' ADD COLUMN tre_certificado character varying(250);';
//         137: sComando:= ' UPDATE funcoes SET fun_edudesejada = educ_fun, fun_expdesejada = expe_fun';
//         136: sComando:= ' ALTER TABLE funcoes' +
//                         ' ADD COLUMN fun_expdesejada integer;';
//         135: sComando:= ' ALTER TABLE funcoes' +
//                         ' ADD COLUMN fun_edudesejada integer;';
//         134: sComando:= ' ALTER TABLE colab_educacao' +
//                         ' ALTER COLUMN edu_anexo TYPE character varying(250);';
//         133: sComando:= ' ALTER TABLE auditoria_interna' +
//                         ' ADD CONSTRAINT auditoria_interna_pkey' +
//                         ' PRIMARY KEY (aud_codigo, data_aud, proc_aud);';
//         132: AcertarChaveAuditInterna();
//         131: sComando:= ' ALTER TABLE auditoria_interna' +
//                         ' ADD COLUMN aud_codigo integer;';
//         130: sComando:= ' ALTER TABLE auditoria_interna' +
//                         ' DROP CONSTRAINT auditoria_interna_pkey;';
//         129: sComando:= ' CREATE TABLE IF NOT EXISTS auditoria_interna_agenda(' +
//                         ' aud_codigo integer NOT NULL,' +
//                         ' aud_cod_auditoria integer NOT NULL,' +
//                         ' aud_data date NOT NULL,' +
//                         ' aud_horaini character varying(5),' +
//                         ' aud_horafim character varying(5),' +
//                         ' aud_auditores character varying(80),' +
//                         ' aud_auditado integer,' +
//                         ' aud_processo integer,' +
//                         ' CONSTRAINT PK_auditoria_interna_agenda PRIMARY KEY (aud_codigo)' +
//                         ' )';
//         128: GravaUsuarios('39');
//         127: GravaUsuarios('38');
//         126: GravaUsuarios('37');
//         125: GravarVariaveis('85', '5', 'SATISFAÇÃO DO CLIENTE', 'E');
//         124: GravarVariaveis('84', '5', 'CONFORMIDADE DE PRODUTOS E SERVIÇOS', 'E');
//         123: sComando:= ' ALTER TABLE risco_analiseint' +
//                         ' ADD COLUMN int_consequencia integer;';
//         122: sComando:= ' ALTER TABLE risco_analiseint' +
//                         ' ADD COLUMN int_probabilidade integer;';
//         121: sComando:= ' ALTER TABLE risco_macro' +
//                         ' ADD COLUMN mac_consequencia integer;';
//         120: sComando:= ' ALTER TABLE risco_macro' +
//                         ' ADD COLUMN mac_probabilidade integer;';
//         119: GravarTabelaCombos(25, 'RISCOS - CONSEQUÊNCIA', 1, 'TRIVIAL', 1);
//         118: GravarTabelaCombos(25, 'RISCOS - CONSEQUÊNCIA', 2, 'MENOR', 2);
//         117: GravarTabelaCombos(25, 'RISCOS - CONSEQUÊNCIA', 3, 'MODERADO', 3);
//         116: GravarTabelaCombos(25, 'RISCOS - CONSEQUÊNCIA', 4, 'MAIOR', 4);
//         115: GravarTabelaCombos(25, 'RISCOS - CONSEQUÊNCIA', 5, 'SEVERO', 5);
//         114: GravarTabelaCombos(24, 'RISCOS - PROBABILIDADE', 1, 'QUASE CERTO', 1);
//         113: GravarTabelaCombos(24, 'RISCOS - PROBABILIDADE', 2, 'PROVÁVEL', 2);
//         112: GravarTabelaCombos(24, 'RISCOS - PROBABILIDADE', 3, 'POSSÍVEL', 3);
//         111: GravarTabelaCombos(24, 'RISCOS - PROBABILIDADE', 4, 'IMPROVÁVEL', 4);
//         110: GravarTabelaCombos(24, 'RISCOS - PROBABILIDADE', 5, 'RARO', 5);
//         108: CopiaMetasInd();
//         107: sComando:= ' CREATE TABLE IF NOT EXISTS indicadores_metas(' +
//                         ' met_codigo integer NOT NULL,' +
//                         ' met_codindicador integer NOT NULL,' +
//                         ' met_anomes character varying(6) NOT NULL,' +
//                         ' met_tipo integer NOT NULL,' +
//                         ' met_valor double precision,' +
//                         ' met_unidade character varying(50),' +
//                         ' CONSTRAINT PK_indicadores_metas PRIMARY KEY (met_codigo)' +
//                         ' )';
//         106: sComando:= ' ALTER TABLE pmc_acoes' +
//                         ' RENAME COLUMN praz_aco2 to aco_prazo;';
//         105: sComando:= ' ALTER TABLE pmc_acoes' +
//                         ' DROP COLUMN praz_aco;';
//         104: ConverterPrazoPMC();
//         103: sComando:= ' ALTER TABLE pmc_acoes' +
//                         ' ADD COLUMN praz_aco2 timestamp without time zone;';
//         102: sComando:= ' CREATE TABLE IF NOT EXISTS colab_avaliador(' +
//                         ' ava_codigo integer NOT NULL,' +
//                         ' ava_codcolaborador integer NOT NULL,' +
//                         ' ava_ano integer NOT NULL,' +
//                         ' ava_codavaliador integer NOT NULL,' +
//                         ' CONSTRAINT PK_colab_avaliador PRIMARY KEY (ava_codigo)' +
//                         ' )';
//         101: sComando:= ' ALTER TABLE manutencao' +
//                         ' ALTER COLUMN quan_man TYPE character varying(255);';
//         100: sComando:= ' ALTER TABLE manutencao' +
//                         ' ALTER COLUMN como_man TYPE character varying(255);';
//         99: sComando:= ' ALTER TABLE manutencao' +
//                        ' ALTER COLUMN oque_man TYPE character varying(255);';
//         98: sComando:= ' ALTER TABLE valor_indicador' +
//                        ' ADD COLUMN vin_arquivo character varying(250);';
//         97: GravarTabelaCombos(5, 'ORIGEM - ABERTURA PMC', 7, 'ANÁLISE DE RISCOS', 7);
//         96: GravarNovaFuncao(39, 'RISCOS - ANÁLISE DE RISCOS', 39);
//         95: InserirVariaveisExternas();
//         94: AcertarRetencaoFormularios();
//         93: sComando:= ' ALTER TABLE parametros' +
//                        ' ADD COLUMN contr1 character(10);';
//         92: sComando:= ' CREATE TABLE IF NOT EXISTS risco_analiseint(' +
//                        ' int_codigo integer NOT NULL,' +
//                        ' int_codfator integer NOT NULL,' +
//                        ' int_codvariavel integer NOT NULL,' +
//                        ' int_tipo integer NOT NULL,' +
//                        ' int_texto character(250) NOT NULL,' +
//                        ' int_processo integer NOT NULL,' +
//                        ' int_pmc character(10),' +
//                        ' CONSTRAINT PK_risco_analiseint PRIMARY KEY (int_codigo)' +
//                        ' )';
//         91: GravarNovaFuncao(38, 'RISCOS - ANÁLISE INTERNA', 38);
//         90: sComando:= ' CREATE TABLE IF NOT EXISTS risco_macro(' +
//                        ' mac_codigo integer NOT NULL,' +
//                        ' mac_codfator integer NOT NULL,' +
//                        ' mac_codvariavel integer NOT NULL,' +
//                        ' mac_tipo integer NOT NULL,' +
//                        ' mac_texto character(250) NOT NULL,' +
//                        ' mac_processo integer NOT NULL,' +
//                        ' mac_pmc character(10),' +
//                        ' CONSTRAINT PK_risco_macro PRIMARY KEY (mac_codigo)' +
//                        ' )';
//         89: GravarNovaFuncao(37, 'RISCOS - ANÁLISE DO MACRO AMBIENTE EXTERNO', 37);
//         88: InserirVariaveisInternas();
//         87: sComando:= ' CREATE TABLE IF NOT EXISTS risco_variaveis_int(' +
//                        ' var_codigo integer NOT NULL,' +
//                        ' var_codfator integer NOT NULL,' +
//                        ' var_descricao character(250) NOT NULL,' +
//                        ' CONSTRAINT PK_risco_variaveis_int PRIMARY KEY (var_codigo)' +
//                        ' )';
//         86: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('23') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES INTERNOS') + ',' +
//                        QuotedStr('2') + ',' +
//                        QuotedStr('PERFORMANCE') + ',' +
//                        QuotedStr('2') +
//                        ');';
//         85: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('23') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES INTERNOS') + ',' +
//                        QuotedStr('1') + ',' +
//                        QuotedStr('VALORES E CULTURA') + ',' +
//                        QuotedStr('1') +
//                        ');';
//         84: GravaUsuarios('36');
//         83: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('99') + ',' +
//                        QuotedStr('FUNÇÕES DO SISTEMA') + ',' +
//                        QuotedStr('36') + ',' +
//                        QuotedStr('RISCOS - VARIÁVEIS INTERNAS') + ',' +
//                        QuotedStr('36') +
//                        ');';
//         82: GravaUsuarios('35');
//         81: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('99') + ',' +
//                        QuotedStr('FUNÇÕES DO SISTEMA') + ',' +
//                        QuotedStr('35') + ',' +
//                        QuotedStr('RISCOS - VARIÁVEIS EXTERNAS') + ',' +
//                        QuotedStr('35') +
//                        ');';
//         80: sComando:= ' CREATE TABLE IF NOT EXISTS risco_variaveis_ext(' +
//                        ' var_codigo integer NOT NULL,' +
//                        ' var_codfator integer NOT NULL,' +
//                        ' var_descricao character(250) NOT NULL,' +
//                        ' CONSTRAINT PK_risco_variaveis_ext PRIMARY KEY (var_codigo)' +
//                        ' )';
//         79: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('9') + ',' +
//                        QuotedStr('PRODUTOS SUBSTITUTOS') + ',' +
//                        QuotedStr('9') +
//                        ');';
//         78: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('8') + ',' +
//                        QuotedStr('NOVOS ENTRANTES') + ',' +
//                        QuotedStr('8') +
//                        ');';
//         77: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('7') + ',' +
//                        QuotedStr('FORNECEDORES') + ',' +
//                        QuotedStr('7') +
//                        ');';
//         76: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('6') + ',' +
//                        QuotedStr('CONCORRENTES') + ',' +
//                        QuotedStr('6') +
//                        ');';
//         75: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('5') + ',' +
//                        QuotedStr('CLIENTE') + ',' +
//                        QuotedStr('5') +
//                        ');';
//         74: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('4') + ',' +
//                        QuotedStr('SOCIEDADE') + ',' +
//                        QuotedStr('4') +
//                        ');';
//         73: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('3') + ',' +
//                        QuotedStr('TECNOLÓGICO') + ',' +
//                        QuotedStr('3') +
//                        ');';
//         72: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('2') + ',' +
//                        QuotedStr('ECONÔMICO') + ',' +
//                        QuotedStr('2') +
//                        ');';
//         71: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('22') + ',' +
//                        QuotedStr('ANÁLISE DE RISCOS - FATORES EXTERNOS') + ',' +
//                        QuotedStr('1') + ',' +
//                        QuotedStr('POLÍTICO/LEGAL') + ',' +
//                        QuotedStr('1') +
//                        ');';
//         70: sComando:= ' INSERT INTO usuarios(nome_usu, senh_usu, proc_usu)' +
//                        ' VALUES (' + QuotedStr('N/A') + ', 1, 0);';
//         69: sComando:= ' ALTER TABLE formularios_locais' +
//                        ' ADD CONSTRAINT formularios_locais_pkey' +
//                        ' PRIMARY KEY (for_codprocesso, for_codform, for_tipo_protecao);';
//         68: sComando:= ' ALTER TABLE formularios_locais' +
//                       ' DROP CONSTRAINT formularios_locais_pkey;';
//         67: sComando:= ' UPDATE formularios_locais SET' +
//                        ' for_tipo_protecao = 0' +
//                        ' WHERE for_tipo_protecao IS NULL';
//         66: AtualizarLocais();
//         65: sComando:= ' ALTER TABLE formularios_locais' +
//                       ' ADD COLUMN for_tipo_protecao integer;';
//         64: sComando:= ' ALTER TABLE formularios_locais' +
//                       ' ADD COLUMN for_recuperacao integer;';
//         63: sComando:= ' ALTER TABLE formularios_locais' +
//                       ' ADD COLUMN for_retencao integer;';
//         62: sComando:= ' ALTER TABLE formularios_locais' +
//                       ' ADD COLUMN for_disposicao integer;';
//         61: sComando:= ' UPDATE pmc SET pmc_fornecedor = 999999' +
//                        ' WHERE pmc_fornecedor = 0 OR pmc_fornecedor = -1';
//         60: sComando:= ' UPDATE pmc SET pmc_cliente = 999999' +
//                        ' WHERE pmc_cliente = 0 OR pmc_cliente = -1';
//         59: sComando:= ' INSERT INTO fornecedores(forn_codigo, forn_nome)' +
//                        ' VALUES (999999, ' + QuotedStr('') +');';
//         58: sComando:= ' INSERT INTO clientes(cli_codigo, cli_nome)' +
//                        ' VALUES (999999, ' + QuotedStr('') +');';
//         57: sComando:= ' ALTER TABLE pmc' +
//                       ' RENAME COLUMN pmc_fornecedor2 TO pmc_fornecedor;';
//         56: sComando:= ' ALTER TABLE pmc' +
//                       ' DROP COLUMN pmc_fornecedor;';
//         55: sComando:= ' UPDATE pmc SET pmc_fornecedor2 = CAST(pmc_fornecedor AS integer);';
//         54: sComando:= ' ALTER TABLE pmc' +
//                       ' ADD COLUMN pmc_fornecedor2 integer;';
//         53: sComando:= ' UPDATE tabela_combos SET orde_com = 13' +
//                        ' WHERE codi_com = 6 AND tipo_com = 6';
//         52: sComando:= ' UPDATE tabela_combos SET orde_com = 14' +
//                        ' WHERE codi_com = 7 AND tipo_com = 6';
//         51: sComando:= ' UPDATE tabela_combos SET orde_com = 15' +
//                        ' WHERE codi_com = 11 AND tipo_com = 6';
//         50: sComando:= ' UPDATE tabela_combos SET orde_com = 11' +
//                        ' WHERE codi_com = 5 AND tipo_com = 6';
//         49: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('6') + ',' +
//                        QuotedStr('EDUCAÇÃO - FUNÇÕES') + ',' +
//                        QuotedStr('14') + ',' +
//                        QuotedStr('ENSINO FUNDAMENTAL INCOMPLETO') + ',' +
//                        QuotedStr('12') +
//                        ');';
//         48: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('6') + ',' +
//                        QuotedStr('EDUCAÇÃO - FUNÇÕES') + ',' +
//                        QuotedStr('15') + ',' +
//                        QuotedStr('ENSINO MÉDIO INCOMPLETO') + ',' +
//                        QuotedStr('10') +
//                        ');';
//         47: sComando:= ' CREATE TABLE IF NOT EXISTS forn_documentos(' +
//                        ' for_codigo integer NOT NULL,' +
//                        ' doc_codigo integer NOT NULL,' +
//                        ' doc_descricao text,' +
//                        ' doc_caminho text,' +
//                        ' CONSTRAINT PK_forn_documentos PRIMARY KEY (for_codigo, doc_codigo)' +
//                        ' )';
//         46: sComando:= ' UPDATE fornecedores SET forn_tipoProd = 0 WHERE forn_tipoProd = -1;';
//         45: sComando:= ' ALTER TABLE iqf_remessa' +
//                       ' RENAME COLUMN iqf_codfornecedor2 TO iqf_codfornecedor;';
//         44: sComando:= ' ALTER TABLE iqf_remessa' +
//                       ' DROP COLUMN iqf_codfornecedor;';
//         43: sComando:= ' UPDATE iqf_remessa SET iqf_codfornecedor2 = CAST(iqf_codfornecedor AS integer);';
//         42: sComando:= ' ALTER TABLE iqf_remessa' +
//                       ' ADD COLUMN iqf_codfornecedor2 Integer;';
//         41: sComando:= ' ALTER TABLE fornecedores' +
//                       ' ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (forn_codigo) ;';
//         40: sComando:= ' ALTER TABLE fornecedores' +
//                       ' RENAME COLUMN forn_codigo2 TO forn_codigo;';
//         39: sComando:= ' ALTER TABLE fornecedores' +
//                       ' DROP COLUMN forn_codigo;';
//         38: sComando:= ' UPDATE fornecedores SET forn_codigo2 = CAST(forn_codigo AS integer);';
//         37: sComando:= ' ALTER TABLE fornecedores' +
//                       ' ADD COLUMN forn_codigo2 Integer;';
//         36: sComando:= ' ALTER TABLE fornecedores' +
//                       ' DROP CONSTRAINT fornecedores_pkey;';
//         35: sComando:= ' UPDATE parametros SET mostra_carta = ' + QuotedStr('S');
//         // 2.07 Acima
//         34: sComando:= ' UPDATE indicadores SET ind_cea = 0';
//         33: sComando:= ' ALTER TABLE indicadores' +
//                        ' ADD COLUMN ind_cea integer';
//         32: sComando:= ' UPDATE pmc SET pmc_cea = 0';
//         31: sComando:= ' ALTER TABLE pmc' +
//                        ' ADD COLUMN pmc_cea integer';
//         30: sComando:= ' UPDATE parametros SET mostra_carta = ' + QuotedStr('S');
//         29: sComando:= ' ALTER TABLE parametros' +
//                        ' ADD COLUMN mostra_carta character(1)';
//         28: sComando:= ' ALTER TABLE parametros' +
//                        ' ADD CONSTRAINT PK_parametros PRIMARY KEY (contr)';
//         27: sComando:= ' ALTER TABLE manutencao' +
//                       ' ALTER COLUMN data_man DROP NOT NULL;';
//         26: sComando:= ' ALTER TABLE empresa' +
//                       ' ADD COLUMN emp_codidm character varying(5);';
//         25: sComando:= ' ALTER TABLE treinamentos' +
//                       ' ALTER COLUMN desc_tre TYPE character varying(120);';
//         24: sComando:= ' ALTER TABLE empresa' +
//                       ' ALTER COLUMN logo_emp TYPE character varying(250);';
//         23: GravaUsuarios('34');
//         22: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('99') + ',' +
//                        QuotedStr('FUNÇÕES DO SISTEMA') + ',' +
//                        QuotedStr('34') + ',' +
//                        QuotedStr('VISUALIZAÇÃO DE PROCEDIMENTOS DE COLABORADORES') + ',' +
//                        QuotedStr('34') +
//                        ');';
//         21: GravaUsuarios('33');
//         20: sComando:= ' INSERT INTO tabela_combos(' +
//                        '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                        ' VALUES (' +
//                        QuotedStr('99') + ',' +
//                        QuotedStr('FUNÇÕES DO SISTEMA') + ',' +
//                        QuotedStr('33') + ',' +
//                        QuotedStr('PROCEDIMENTOS DE COLABADORES') + ',' +
//                        QuotedStr('33') +
//                        ');';
//         19: sComando:= ' CREATE TABLE IF NOT EXISTS colab_procedimentos(' +
//                        ' col_codigo integer NOT NULL,' +
//                        ' pro_codproc integer NOT NULL,' +
//                        ' lis_novo character(1) NOT NULL,' +
//                        ' CONSTRAINT PK_colab_procedimentos PRIMARY KEY (col_codigo, pro_codproc)' +
//                        ' )';
//         18: sComando:= ' UPDATE fornecedores SET forn_status = 1;';
//         17: sComando:= ' ALTER TABLE fornecedores' +
//                       ' ADD COLUMN forn_status integer;';
//         16: sComando:= ' ALTER TABLE empresa' +
//                       ' ALTER COLUMN nome_emp TYPE character varying(200);';
//         15: sComando:= ' ALTER TABLE calibracao' +
//                       ' ADD COLUMN cali_obs text;';
//         14: sComando:= ' ALTER TABLE infraestrutura' +
//                       ' ALTER COLUMN manu_inf TYPE integer '; // using fx_chartoint(manu_inf);
//         13: sComando:= ' ALTER TABLE indicadores' +
//                       ' ALTER COLUMN tipo_ind TYPE integer using fx_chartoint(tipo_ind);';
//         12: GravarCaliEquip();
//
//
//
//
//
//
//         // Cria a função de conversão de Caracter para Integer
//          1: sComando:= ' CREATE OR REPLACE FUNCTION fx_chartoint(columnConvert character varying)' +
//                       '   RETURNS integer AS' +
//                       '   $BODY$' +
//                       '   SELECT CASE WHEN trim($1) SIMILAR TO ' + QuotedStr('[0-9]') +'' +
//                       '         THEN CAST(trim($1) AS integer)' +
//                       '     ELSE NULL END;' +
//                       '   $BODY$' +
//                       '   LANGUAGE ' + QuotedStr('sql') + ' IMMUTABLE STRICT;';
//          2: sComando:= ' ALTER TABLE colaboradores' +
//                       ' ALTER COLUMN col_status TYPE integer using fx_chartoint(CAST(col_status AS character varying));';
////          3: sComando:= ' ALTER TABLE formularios' +
////                       ' ALTER COLUMN rete_for TYPE bigint using fx_chartoint(rete_for);';
////          4: sComando:= ' ALTER TABLE pmc' +
////                       ' ALTER COLUMN orig_pmc TYPE bigint using fx_chartoint(orig_pmc);';
//          5: sComando:= ' ALTER TABLE calibracao' +
//                       ' ALTER COLUMN cali_numero TYPE character varying(40);';
//          6: sComando:= ' ALTER TABLE laaia' +
//                       ' ALTER COLUMN lai_controle TYPE character varying(200);';
//          7: sComando:= ' ALTER TABLE pmc' +
//                       ' DROP COLUMN from_pmc';
//          8: sComando:= ' ALTER TABLE pmc' +
//                       ' DROP COLUMN dtim_pmc';
//          9: sComando:= ' ALTER TABLE colab_treinamentos' +
//                       ' ALTER COLUMN dtpr_tre TYPE timestamp without time zone;';
//         10: sComando:= ' ALTER TABLE colab_treinamentos' +
//                       ' ALTER COLUMN dtre_tre TYPE timestamp without time zone;';
//         11: sComando:= ' ALTER TABLE calibracao   ' +
//                       ' ADD COLUMN cali_equip bigint;';



//         19: sComando:= ' ALTER TABLE fornecedores' +
//                       ' ALTER COLUMN forn_codigo TYPE integer using fx_chartoint(forn_codigo);';

//         1: sComando:= ' CREATE TABLE IF NOT EXISTS checklist (' +
//                       ' chk_codigo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,' +
//                       ' chk_tipo INTEGER UNSIGNED,' +
//                       ' chk_ponto INTEGER UNSIGNED,' +
//                       ' chk_item VARCHAR(120),' +
//                       ' chk_habilitado INTEGER UNSIGNED,' +
//                       ' PRIMARY KEY (chk_codigo)' +
//                       ' )' +
//                       ' ENGINE = InnoDB;';
      end;

      if sComando <> 'VAZIO' then begin
         if sComando <> EmptyStr then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= sComando;
               try
                  Execute;
               except
                  on E: Exception do begin
                     Application.MessageBox(PChar('Erro ao atualizar tabelas' + #13 + 'Comando nº ' + IntToStr(i) + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
                  end;
               end;
            end;

            with dm.cdsAuxiliar do begin
               Active:= False;
   //            CommandText:= 'INSERT INTO Atualiza_Banco VALUES(' +
   //                          IntToStr(i) + ',' +
   //                          ArrumaDataSQL(Date()) + ',' +
   //                          QuotedStr(Copy(sComando,1,100)) +
   //                          ')';
               CommandText:= 'INSERT INTO Atualiza_Banco VALUES(' +
                                IntToStr(i) + ',' +
                                ArrumaDataSQL(Date()) + ',' +
                                QuotedStr('Atualização número ' + IntToStr(i)) +
                                ')';
               try
                  Execute;
               except
                  Active:= False;
                  CommandText:= 'INSERT INTO Atualiza_Banco VALUES(' +
                                IntToStr(i) + ',' +
                                ArrumaDataSQL(Date()) + ',' +
                                QuotedStr('Atualização número ' + IntToStr(i)) +
                                ')';
                  Execute;
               end;
            end;
         end
         else begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= 'INSERT INTO Atualiza_Banco VALUES(' +
                             IntToStr(i) + ',' +
                             ArrumaDataSQL(Date()) + ',' +
                             QuotedStr('Atualização número ' + IntToStr(i)) +
                             ')';
               Execute;
            end;
         end;
      end;
   end;

   Result:= True;
end;

procedure InserirCronograma();
begin
   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)' +
            ' VALUES (1,' + QuotedStr('N.A') + ',' + QuotedStr('N.A') + ',' + QuotedStr('VISITA AS INSTALAÇÕES DA ORGANIZAÇÃO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  ' +
            ' VALUES (2,' + QuotedStr('N.A') + ',' + QuotedStr('CADASTRO/CADASTRO DE USUÁRIOS') + ',' + QuotedStr('CADASTRAR USUÁRIO NO SISTEMA DESTRA MANAGER. (CAPACITAR ORGANIZAÇÃO A CADASTRAR USUÁRIOS) ' +
            ' ORIENTAR SOBRE A NECESSIDADE DE INCLUIR PERMISSÕES CONFORME IMPLEMENTAÇÃO DO SGQ.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (3,' + QuotedStr('N.A') + ',' + QuotedStr('CADASTRO/EMPRESA') + ',' + QuotedStr('CADASTRAR DADOS DA EMPRESA. (DE NOME DA EMPRESA ATÉ E-MAIL)')+ ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (4,' + QuotedStr('4.4.1') + ',' + QuotedStr('CADASTRO/PROCESSOS') + ',' + QuotedStr('DEFINIR OS PROCESSOS DA ORGANIZAÇÃO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (5,' + QuotedStr('4.4.1') + ',' + QuotedStr('CADASTRO/RECURSOS HUMANOS/FUNÇÕES (ABA CADASTRO)') + ',' + QuotedStr('DEFINIR OS RESPONSÁVEIS PELOS PROCESSOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (6,' + QuotedStr('4.4.1') + ',' + QuotedStr('CADASTRO/RECURSOS HUMANOS/COLABORADORES (ABA CADASTRO)') + ',' + QuotedStr('DEFINIR OS RESPONSÁVEIS PELOS PROCESSOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (7,' + QuotedStr('4.4.1') + ',' + QuotedStr('CADASTRO/PROCESSOS') + ',' + QuotedStr('VINCULAR OS RESPONSÁVEIS AOS SEUS RESPECTIVOS PROCESSOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (8,' + QuotedStr('4.4.1') + ',' + QuotedStr('N.A ') + ',' + QuotedStr('DETERMINAR A SEQUÊNCIA E INTERAÇÃO DOS PROCESSOS. DOCUMENTAR.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (9,' + QuotedStr('4.4.1') + ',' + QuotedStr('CADASTRO/PROCESSOS') + ',' + QuotedStr('DETERMINAR AS ENTRADAS REQUERIDAS E SAÍDAS ESPERADAS PARA OS PROCESSOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (10,' + QuotedStr('4.4.1/5.1.1/7.1.1') + ',' + QuotedStr('CADASTRO/ESTRUTURA E AMBIENTE DE TRABALHO/INFRAESTRUTURA') + ',' + QuotedStr('DETERMINAR OS RECURSOS NECESSÁRIOS DESSES PROCESSOS E ASSEGURAR SUA DISPONIBILIDADE. DETERMINAR E PROVER OS RECURSOS NECESSÁRIOS PARA ESTABELECER, IMPLEMENTAR, MANTER E MELHORAR CONTINUAMENTE O SGQ') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (11,' + QuotedStr('4.3') + ',' + QuotedStr('CADASTRO/EMPRESA') + ',' + QuotedStr('ESTABELECER O ESCOPO E MANTER COMO INFORMAÇÃO DOCUMENTADA. (VER RESTRIÇÕES E APLICABILIDADES)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (12,' + QuotedStr('4.3') + ',' + QuotedStr('CADASTRO/EMPRESA') + ',' + QuotedStr('INCLUIR JUSTIFICATIVA A ALGUM REQUISITO QUE A ORGANIZAÇÃO DETERMINAR COMO NÃO APLICÁVEL AO ESCOPO DO SEU SISTEMA DE GESTÃO DA QUALIDADE. ') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (13,' + QuotedStr('5.2.1') + ',' + QuotedStr('CADASTRO/EMPRESA') + ',' + QuotedStr('ESTABELECER A POLITICA DA QUALIDADE. (DEVE SER APROPRIADA AO PROPÓSITO, CONTEXTO E DIRECIONAMENTO ESTRATÉGICO. FORNEÇA UMA ESTRUTURA PARA OS OBJETIVOS. INCLUA COMPROMENTIMENTO COM A SATISFAÇÃO DOS REQUISITOS APLICÁVEIS E A MELHORIA DO SGQ ') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (14,' + QuotedStr('5.2.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('DISPONIBILIZAR A POLITICA. (INTERNAMENTE E PARA AS PARTES INTERESSADAS)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (15,' + QuotedStr('5.1.1') + ',' + QuotedStr('CADASTRO/EMPRESA') + ',' + QuotedStr('ASSEGURAR QUE A POLITICA E OBJETIVOS SÃO COMPATIVEIS COM A ESTRATÉGIA DA ORGANIZAÇÃO. RECOMENDA-SE DEFINIÇÃO DA MISSÃO, VISÃO E VALORES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (16,' + QuotedStr('5.2.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('REALIZAR TREINAMENTO SOBRE A POLITICA DA QUALIDADE. ELA DEVE SER COMUNICADA E ENTENDIDA PELA ORGANIZAÇÃO.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (17,' + QuotedStr('4.1') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/ANÁLISE DE CONTEXTO E PARTES INTERESSADAS/CADASTRO DO CONTEXTO') + ',' + QuotedStr('DEFINIR O CONTEXTO DA ORGANIZAÇÃO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (18,' + QuotedStr('4.2') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/ANÁLISE DE CONTEXTO E PARTES INTERESSADAS/CADASTRO DE PARTES INTERESSADAS') + ',' + QuotedStr('DETERMINAR AS PARTES INTERESSADAS QUE SÃO RELEVANTES PARA O SISTEMA DE GESTÃO DA QUALIDADE.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (19,' + QuotedStr('4.2') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/ANÁLISE DE CONTEXTO E PARTES INTERESSADAS/ANÁLISE DE CONTEXTO') + ',' + QuotedStr('DETERMINAR OS REQUISITOS E O MONITORAMENTO DAS PARTES INTERESSADAS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (20,' + QuotedStr('4.1') + ',' + QuotedStr('CADASTRO/ANÁLISE DE RISCOS/VARIÁVEIS EXTERNAS') + ',' + QuotedStr('DETERMINAR OS FATORES EXTERNOS, QUE SÃO RELEVANTES PARA O PROPÓSITO DE SEU' +
            ' DIRECIONAMENTO ESTRATÉGICO E QUE AFETAM SUA CAPACIDADE DE ATINGIR OS RESULTADOS PRETENDIDOS PARA SEU SISTEMA DE GESTÃO DA QUALIDADE. MONITORAR E ANALISAR CRITICAMENTE.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (21,' + QuotedStr('4.1') + ',' + QuotedStr('CADASTRO/ANÁLISE DE RISCOS/VARIÁVEIS INTERNAS') + ',' + QuotedStr('DETERMINAR OS FATORES INTERNOS, QUE SÃO RELEVANTES PARA O PROPÓSITO DE SEU' +
            ' DIRECIONAMENTO ESTRATÉGICO E QUE AFETAM SUA CAPACIDADE DE ATINGIR OS RESULTADOS PRETENDIDOS PARA SEU SISTEMA DE GESTÃO DA QUALIDADE. MONITORAR E ANALISAR CRITICAMENTE.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (22,' + QuotedStr('5.1.2') + ',' + QuotedStr('CADASTRO/ANÁLISE DE RISCOS/VARIÁVEIS EXTERNAS (FATOR: CLIENTE)') + ',' + QuotedStr('ASSEGURAR QUE OS RISCOS E OPORTUNIDADES QUE POSSAM AFETAR A CONFORMIDADE DE PRODUTOS E SERVIÇOS E A CAPACIDADE PARA AUMENTAR A SATISFAÇÃO DO CLIENTE SÃO DETERMINADOS E ENFRENTADOS. AVALIAR O FATOR CLIENTE.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (23,' + QuotedStr('6.1.1') + ',' + QuotedStr('CADASTRO/ANÁLISE DE RISCOS/ANÁLISE DO MACRO AMBIENTE EXTERNO') + ',' + QuotedStr('DETERMINAR OS RISCOS E OPORTUNIDADES EXTERNOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (24,' + QuotedStr('6.1.1') + ',' + QuotedStr('CADASTRO/ANÁLISE DE RISCOS/ANÁLISE INTERNA') + ',' + QuotedStr('DETERMINAR OS RISCOS E OPORTUNIDADES INTERNOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (25,' + QuotedStr('6.1.1') + ',' + QuotedStr('PARÂMETROS/PARÂMETROS DO SISTEMA  (ABA ANÁLISE DE RISCOS)') + ',' + QuotedStr('DETERMINAR RISCOS A SEREM ABOARDADOS POR MEIO DE PMC / PDCA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (26,' + QuotedStr('6.1.2') + ',' + QuotedStr('CADASTRO/ANÁLISE DE RISCOS/ANÁLISE DE RISCO (DUPLO CLIQUE NO RISCO. ABRIR PMC OU ABRIR PDCA)') + ',' + QuotedStr('PLANEJAR AÇÕES PARA ABORDAR OS RISCOS E OPORTUNIDADES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (27,' + QuotedStr('4.4.2/8.1/8.5') + ',' + QuotedStr('N.A') + ',' + QuotedStr('MANTER INFORMAÇÃO DOCUMENTADA PARA APOIAR A OPERAÇÃO DOS PROCESSOS. ELABORAR OS PROCEDIMENTOS PARA OS PROCESSOS. INSERIR NOS PROCEDIMENTOS INFORMAÇOES RELEVANTES DE PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (28,' + QuotedStr('4.4.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('ELABORAR MANUAL DA QUALIDADE (INFORMAÇÃO DOCUMENTADA EXIGIDA PELA NBR ISO 9001)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (29,' + QuotedStr('4.4.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('RETER INFORMAÇÃO DOCUMENTADA PARA TER CONFIANÇA DE QUE OS PROCESSOS FORAM EXECUTADOS CONFORME PLANEJADO. PADRONIZAR OS FORMULÁRIOS.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (30,' + QuotedStr('7.5') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/PROCEDIMENTOS DOCUMENTADOS/LISTA MESTRA') + ',' + QuotedStr('CADASTRAR PROCEDIMENTOS NA LISTA MESTRA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (31,' + QuotedStr('7.5') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/PROCEDIMENTOS DOCUMENTADOS/APROVAÇÃO DE DOCUMENTOS') + ',' + QuotedStr('APROVAR OS PROCEDIMENTOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (32,' + QuotedStr('7.5') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/REGISTROS DA QUALIDADE') + ',' + QuotedStr('CADASTRAR FORMULÁRIOS NA RELAÇÃO DE FORMULÁRIOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (33,' + QuotedStr('7.5') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/CADASTRO DE MODO DE RECUPERAÇÃO DE REGISTROS') + ',' + QuotedStr('INCLUIR MODOS DE RECUPRAÇÃO DOS REGISTROS. (SE NECESSÁRIO)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (34,' + QuotedStr('6.2.1/4.4.1/9.1.1') + ',' + QuotedStr('CADASTRO/MONITORAMENTO DO SISTEMA/INDICADORES') + ',' + QuotedStr('ESTABELECER E MANTER INFORMAÇÃO DOCUMENTADA DOS OBJETIVOS DA QUALIDADE.' +
            'DETERMINAR E APLICAR OS CRITÉRIOS, MÉTODOS (INCLUINDO MONITORAMENTO, MEDIÇÕES E INDICADORES PARA RELATAR A' +
            'PERFORMANCE), NECESSÁRIOS PARA ASSEGURAR A EFETIVA OPERAÇÃO E CONTROLE DESSES PROCESSOS.' +
            'A ORGANIZAÇÃO DEVERÁ RETER INFORMAÇÃO DOCUMENTADA APROPRIADA DO QUE SERÁ MONITORADO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (35,' + QuotedStr('9.1.3') + ',' + QuotedStr('DESTRA QUALITY/<PROCESSO>/INDICADORES (ALIMENTAR INDICADORES E MONITORAMENTO DO PROCESSO)') + ',' + QuotedStr('ANALISAR E AVALIAR DADOS E INFORMAÇÕES APROPRIADAS ORIUNDAS DE MONITORAMENTO E MEDIÇÃO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (36,' + QuotedStr('N.A') + ',' + QuotedStr('PARÂMETROS/PARÂMETROS DO SISTEMA  (ABA DIVERSOS - INDICADORES)') + ',' + QuotedStr('PADRONIZAR CASAS DECIMAIS DOS INDICADORES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (37,' + QuotedStr('9.1.3') + ',' + QuotedStr('RELATÓRIOS/RESUMO DOS INDICADORES.') + ',' + QuotedStr('CAPACITAR RESPONSÁVEL, NOS RELATÓRIOS GERENCIAIS DE INDICADORES.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (38,' + QuotedStr('6.2.2') + ',' + QuotedStr('CADASTRO/MONITORAMENTO DO SISTEMA/PDCA OU CADASTRO/MONITORAMENTO DO SISTEMA/INDICADORES (BOTÃO PDCA)') + ',' + QuotedStr('PLANEJAR COMO ATINGIR OS OBJETIVOS DA QUALIDADE. CADASTRAR PDCA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (39,' + QuotedStr('7.1.3') + ',' + QuotedStr('CADASTRO/ESTRUTURA E AMBIENTE DE TRABALHO/MANUTENÇÃO PREVENTIVA') + ',' + QuotedStr('DETERMINAR, PROVER E MANTER A INFRAESTRUTURA NECESSÁRIA PARA A OPERAÇÃO DOS PROCESSOS E PARA' +
            'ATINGIR A CONFORMIDADE DE PRODUTOS E SERVIÇOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (40,' + QuotedStr('7.1.4') + ',' + QuotedStr('N.A') + ',' + QuotedStr('DETERMINAR, PROVER E MANTER O AMBIENTE NECESSÁRIO PARA A OPERAÇÃO DOS SEUS PROCESSOS E PARA' +
            'ATINGIR A CONFORMIDADE DOS PRODUTOS E SERVIÇOS. (CONSIDERAR FATORES SOCIAIS, PSICOLÓGICOS E FÍSÍCOS) ') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (41,' + QuotedStr('7.1.2/7.2') + ',' + QuotedStr('CADASTRO/RECURSOS HUMANOS/TREINAMENTOS CADASTRO/RECURSOS HUMANOS/FUNÇÕES CADASTRO/RECURSOS HUMANOS/COLABORADORES') + ',' +
            QuotedStr('DETERMINAR A COMPETÊNCIA NECESSÁRIA DO PESSOAL COM BASE NA EDUCAÇÃO, TREINAMENTO E EXPERIÊNCIA APROPRIADA.' +
            '(RETER INFORMAÇÕES DOCUMENTADAS APROPRIADAS, COMO EVIDÊNCIA DA COMPETÊNCIA)' +
            ' DETERMINAR E PROVER AS PESSOAS NECESSÁRIAS PARA A IMPLEMENTAÇÃO EFETIVA DO SEU SGQ E PARA A OPERAÇÃO E CONTROLE DE SEUS PROCESSOS') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (42,' + QuotedStr('7.3') + ',' + QuotedStr('CADASTRO/RECURSOS HUMANOS/TREINAMENTOS') + ',' + QuotedStr('ASSEGURAR QUE PESSOAS ESTEJAM CONSCIENTIZADAS QUANTO A POLÍTICA DA QUALIDADE, OBJETIVOS, SUA CONTRIBUIÇÃO PARA O SGQ E IMPLICAÇÕES DE NÃO CONFORMIDADES. (CAPACITAR PESSOAS)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (43,' + QuotedStr('7.1.6') + ',' + QuotedStr('CADASTRO/RECURSOS HUMANOS/HABILIDADES') + ',' + QuotedStr('DETERMINAR O CONHECIMENTO NECESSÁRIO PARA A OPERAÇÃO DOS PROCESSOS E PARA ATINGIR A CONFORMIDADE DE PRODUTOS E SERVIÇOS (CONHECIMENTO DEVE SER MANTIDO E DISPONIBILIZADO NA EXTENSÃO NECESSÁRIA)' +
            ' CONSIDERAR FONTES INTERNAS E EXTERNAS') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (44,' + QuotedStr('7.1.6') + ',' + QuotedStr('PARÂMETROS/PARÂMETROS DO SISTEMA  (ABA HABILIDADES)') + ',' + QuotedStr('CONFIGURAR NOTIFICAÇÃO DE PENDÊNCIAS DAS HABILIDADES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (45,' + QuotedStr('5.3') + ',' + QuotedStr('CADASTRO/RECURSOS HUMANOS/FUNÇÕES') + ',' + QuotedStr('A ALTA DIREÇÃO DEVE ATRIBUIR AUTORIDADE E RESPONSABILIDADE PARA:' +
            'A) ASSEGURAR QUE O SISTEMA DE GESTÃO DA QUALIDADE ESTEJA EM CONFORMIDADE COM OS REQUISITOS DESTA NORMA' +
            'INTERNACIONAL;' +
            'B) ASSEGURAR QUE OS PROCESSOS ESTEJAM ATENDENDO OS RESULTADOS DESEJADOS;' +
            'C) REPORTAR A PERFORMANCE DO SISTEMA DE GESTÃO DA QUALIDADE, SOBRE OPORTUNIDADES DE MELHORIAS (VER 10.1),' +
            'ESPECIALMENTE PARA A ALTA DIREÇÃO.' +
            'D) ASSEGURAR A PROMOÇÃO DO FOCO NO CLIENTE, ATRAVÉS DA ORGANIZAÇÃO;' +
            'E) ASSEGURAR QUE A INTEGRIDADE DO SISTEMA DE GESTÃO DA QUALIDADE É MANTIDA QUANDO MUDANÇAS NO SISTEMA DE' +
            'GESTÃO DA QUALIDADE SÃO PLANEJADAS E IMPLEMENTADAS.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (46,' + QuotedStr('7.2') + ',' + QuotedStr('RELATÓRIOS/AVALIAÇÃO DE HABILIDADES' +
            'RELATÓRIOS/PENDÊNCIAS DA MATRIZ DE COMPETÊNCIAS') + ',' + QuotedStr('CAPACITAR RESPONSÁVEL DE GESTÃO DE PESSOAS, NOS RELATÓRIOS GERENCIAIS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (47,' + QuotedStr('5.1.1') + ',' + QuotedStr('N.A') + ',' + QuotedStr('PROMOVER O USO DA ABORDAGEM DE PROCESSOS E DO PENSAMENTO BASEADO EM RISCO E COMUNICAR A IMPORTÂNCIA DE UMA GESTÃO DA QUALIDADE EFICAZ E DA CONFORMIDADE COM OS REQUISITOS DO SGQ') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (48,' + QuotedStr('7.4') + ',' + QuotedStr('N.A') + ',' + QuotedStr('DETERMINAR AS COMUNICAÇÕES INTERNAS E EXTERNAS RELEVANTES PARA O SGQ') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (49,' + QuotedStr('5.1.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ASSEGURAR QUE OS REQUISITOS DOS CLIENTES E OS REQUISITOS REGULATÓRIOS E ESTATUTÁRIOS APLICÁVEIS SÃO DETERMINADOS E CONSISTENTEMENTE ATENDIDOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (50,' + QuotedStr('8.2.1') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: IMPLEMENTAR COMUNICAÇÃO COM O CLIENTE QUE INCLUA:' +
            'A) FORNECIMENTO DE INFORMAÇÕES RELATIVAS AOS PRODUTOS E SERVIÇOS;' +
            'B) TRATAMENTO DE CONSULTAS, CONTRATOS OU PEDIDOS, INCLUINDO MUDANÇAS;' +
            'C) OBTENÇÃO DE REALIMENTAÇÃO DE CLIENTE RELACIONADA AOS PRODUTOS E SERVIÇOS, INCLUINDO RECLAMAÇÕES DE CLIENTES;' +
            'D) MANUSEIO OU CONTROLE DA PROPRIEDADE DO CLIENTE;' +
            'E) ESTABELECIMENTO DE REQUISITOS ESPECÍFICOS PARA AÇÕES DE CONTINGÊNCIA, QUANDO RELEVANTE.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (51,' + QuotedStr('8.2.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: IMPLEMENTAR COMUNICAÇÃO COM O CLIENTE QUE INCLUA:' +
            'A) FORNECIMENTO DE INFORMAÇÕES RELATIVAS AOS PRODUTOS E SERVIÇOS;' +
            'B) TRATAMENTO DE CONSULTAS, CONTRATOS OU PEDIDOS, INCLUINDO MUDANÇAS;' +
            'C) OBTENÇÃO DE REALIMENTAÇÃO DE CLIENTE RELACIONADA AOS PRODUTOS E SERVIÇOS QUE OFERECE.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (52,' + QuotedStr('8.2.3') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ' +
            ' ASSEGURAR QUE A ORGANIZAÇÃO REALIZE UMA ANÁLISE CRÍTICA (DEVE RETER INFORMAÇÕES DOCUMENTADAS, CONFORME APLICÁVEL) ANTES DE SE COMPROMETER A FORNECER PRODUTOS E SERVIÇOS A UM CLIENTE.' +
            'OS REQUISITOS DOS CLIENTES DEVEM SER CONFIRMADOS PELA ORGANIZAÇÃO ANTES DA ACEITAÇÃO, QUANDO O CLIENTE NÃO FORNECER UMA DECLARAÇÃO DOCUMENTADA DOS SEUS REQUISITOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (53,' + QuotedStr('8.2.4') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ASSEGURAR QUE A INFORMAÇÃO DOCUMENTADA RELEVANTE SEJA ALTERADA, E QUE AS PESSOAS RELEVANTES SÃO' +
            'INFORMADAS SOBRE OS REQUISITOS ALTERADOS, QUANDO OS REQUISITOS PARA PRODUTOS E SERVIÇOS SÃO ALTERADOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (54,' + QuotedStr('8.5.1') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: IMPLEMENTAR A PRODUÇÃO E PRESTAÇÃO DE SERVIÇO SOB CONDIÇÕES CONTROLADAS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (55,' + QuotedStr('8.5.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: UTILIZAR MEIOS ADEQUADOS PARA IDENTIFICAÇÃO E RASTREABILIDADE.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (56,' + QuotedStr('8.5.3') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ASSEGURAR O CUIDADO COM A PROPRIEDADE PERTENCENTE AOS CLIENTES OU FORNECEDORES EXTERNOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (57,' + QuotedStr('8.5.4') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ' +
            ' ASSEGURAR A PRESERVAÇÃO DAS SAÍDAS DO PROCESSO DURANTE A PRODUÇÃO E PRESTAÇÃO DE SERVIÇO. (PODE INCLUIR IDENTIFCAÇÃO, MANUSEIO, CONTROLE DE CONTAMINAÇÃO, EMBALAGEM, ARMAZENAMENTO, MOVIMENTAÇÃO OU TRANSPORTE, E PROTEÇÃO)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (58,' + QuotedStr('8.5.5') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ' +
            ' ATENDER AOS REQUISITOS PARA ATIVIDADES PÓS-ENTREGA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (59,' + QuotedStr('8.5.6') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ' +
            ' ANALISAR CRITICAMENTE E CONTROLAR AS MUDANÇAS PARA A PRODUÇÃO OU PRESTAÇÃO DE SERVIÇOS. ' +
            ' (RETER INFORMAÇÃO DOCUMENTADA QUE DESCREVA OS RESULTADOS DA ANÁLISE CRÍTICA DE MUDANÇAS)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (60,' + QuotedStr('8.6') + ',' + QuotedStr('N.A') + ',' +
            QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, ' +
            'CONSIDERAR: IMPLEMENTAR AS DISPOSIÇÕES PREVISTAS, EM ESTÁGIOS APROPRIADOS, PARA VERIFICAR SE OS ' +
            'REQUISITOS DE' +
            'PRODUTOS E SERVIÇOS FORAM ATENDIDOS (RETER INFORMAÇÃO DOCUMENTADA SOBRE A LIBERAÇÃO DE PRODUTOS E ' +
            'SERVIÇOS)') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (61,' + QuotedStr('8.7') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ' +
            ' ASSEGURAR QUE AS SAÍDAS QUE NÃO ESTEJAM EM CONFORMIDADE COM SEUS REQUISITOS SEJAM IDENTIFICADAS E CONTROLADAS PARA EVITAR SEU USO OU ENTREGA NÃO INTENCIONAL.' +
            'RETER INFORMAÇÃO DOCUMENTADA QUE:' +
            'A) DESCREVA A NÃO-CONFORMIDADE;' +
            'B) DESCREVA AS AÇÕES TOMADAS;' +
            'C) DESCREVA QUAISQUER CONCESSÕES OBTIDAS;' +
            'D) IDENTIFIQUE A AUTORIDADE QUE DECIDIU A AÇÃO REFERENTE A NÃO-CONFORMIDADE') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (62,' + QuotedStr('8.3') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR:' +
            'ESTABELECER, IMPLEMENTAR E MANTER UM PROCESSO DE PROJETO E DESENVOLVIMENTO QUE SEJA APROPRIADO PARA ASSEGURAR O FORNECIMENTO SUBSEQUENTE DE PRODUTOS E SERVIÇOS.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (63,' + QuotedStr('8.4') + ',' + QuotedStr('CADASTRO/COMPRAS/TIPO DE PRODUTO') + ',' + QuotedStr('CADASTRAR TIPOS DE PRODUTO. (SE APLICÁVEL)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (64,' + QuotedStr('8.4') + ',' + QuotedStr('CADASTRO/COMPRAS/PRODUTOS') + ',' + QuotedStr('CADASTRAR PRODUTOS. (SE APLICÁVEL)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (65,' + QuotedStr('8.4') + ',' + QuotedStr('CADASTRO/COMPRAS/FORNECEDORES.') + ',' + QuotedStr('CADASTRAR FORNECEDORES QUE IMPACTEM NA REALIZAÇÃO DO PRODUTO E SERVIÇO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (66,' + QuotedStr('8.4') + ',' + QuotedStr('PARÂMETROS/PARÂMETROS DO SISTEMA  (ABA DIVERSOS - IQF)') + ',' + QuotedStr('DEFINIR PESO PARA OS CRITÉRIOS DE MONITORAMENTO DE PROVEDORES EXTERNOS.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (67,' + QuotedStr('8.4.1') + ',' + QuotedStr('CADASTRO/COMPRAS/FORNECEDORES.') + ',' + QuotedStr('ESTABELECER E APLICAR CRITÉRIOS PARA AVALIAÇÃO, SELEÇÃO, MONITORAMENTO DE DESEMPENHO E' +
            'REAVALIAÇÃO DE FORNECEDORES EXTERNOS. HOMOLOGAR OS FORNECEDORES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (68,' + QuotedStr('8.4.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ASSEGURAR QUE OS PROCESSOS FORNECIDOS EXTERNAMENTE, PRODUTOS E SERVIÇOS NÃO AFETEM' +
            'ADVERSAMENTE A CAPACIDADE DA ORGANIZAÇÃO PARA ENTREGAR CONSISTENTEMENTE PRODUTOS E SERVIÇOS EM CONFORMIDADE COM OS SEUS CLIENTES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (69,' + QuotedStr('8.4.3') + ',' + QuotedStr('N.A') + ',' + QuotedStr('NA ELABORAÇÃO DO PLANEJAMENTO, CONTROLES OPERACIONAIS E REALIZAÇÃO DO PRODUTO E SERVIÇOS, CONSIDERAR: ' +
            ' ASSEGURAR A ADEQUAÇÃO DOS REQUISITOS ANTES DA SUA COMUNICAÇÃO AO FORNECEDOR EXTERNO. (A ORGANIZAÇÃO DEVE COMUNICAR AOS FORNECEDORES EXTERNOS SEUS REQUISITOS)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (70,' + QuotedStr('8.4.1') + ',' + QuotedStr('PROCESSOS/I.Q.F') + ',' + QuotedStr('MONITORAR O DESEMPENHO DOS FORNECEDORES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (71,' + QuotedStr('7.1.5') + ',' + QuotedStr('CADASTRO/ESTRUTURA E AMBIENTE DE TRABALHO/INFRAESTRUTURA') + ',' + QuotedStr('CADASTRAR EQUIPAMENTOS DE MONITORAMENTO E MEDIÇÃO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (72,' + QuotedStr('7.1.5') + ',' + QuotedStr('PROCESSO/METROLOGIA') + ',' + QuotedStr('DETERMINAR E PROVER OS RECURSOS NECESSÁRIOS PARA ASSEGURAR RESULTADOS VÁLIDOS E CONFIÁVEIS QUANDO' +
            'O MONITORAMENTO OU MEDIÇÃO É UTILIZADA PARA VERIFICAR A CONFORMIDADE AOS REQUISITOS DOS PRODUTOS E SERVIÇOS.' +
            '(RETER A INFORMAÇÃO DOCUMENTADA APROPRIADA COMO EVIDÊNCIA DA APTIDÃO DA SUA FINALIDADE)' +
            'CALIBRAR OU VERIFICAR EQUIPAMENTOS DE MEDIÇÃO. (CONTRA PADRÕES RASTREÁVEIS)' +
            'IDENTIFICAR OS EQUIPAMENTOS E PROTEGER CONTRA AJUSTES, DANOS OU VARIAÇÕES.') + ');');
   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (73,' + QuotedStr('') + ',' + QuotedStr('RELATÓRIOS/CALIBRAÇÃO') + ',' + QuotedStr('CAPACITAR RESPONSÁVEL, NOS RELATÓRIOS GERENCIAIS DE CALIBRAÇÃO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (74,' + QuotedStr('5.1.2/9.1.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('REALIZAR PESQUISA DE SATISFAÇÃO DE CLIENTES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (75,' + QuotedStr('6.3') + ',' + QuotedStr('N.A') + ',' + QuotedStr('PLANEJAR AS MUDANÇAS DO SGQ CONSIDERANDO:' +
            'A) O PROPÓSITO DA MUDANÇA E SUAS CONSEQUÊNCIAS POTENCIAIS;' +
            'B) A INTEGRIDADE DO SISTEMA DE GESTÃO DA QUALIDADE;' +
            'C) A DISPONIBILIDADE DOS RECURSOS;' +
            'D) A DEFINIÇÃO OU REDEFINIÇÃO DE RESPONSABILIDADES E AUTORIDADES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (76,' + QuotedStr('N.A') + ',' + QuotedStr('CADASTRO/CADASTRO DE CLIENTES') + ',' + QuotedStr('CADASTRAR CLIENTES. (SE APLICÁVEL)') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (77,' + QuotedStr('8.7') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/REGISTRO DE NÃO CONFORMIDADE - RNC') + ',' + QuotedStr('ASSEGURAR QUE AS SAÍDAS QUE NÃO ESTEJAM EM CONFORMIDADE COM SEUS REQUISITOS SEJAM IDENTIFICADAS E CONTROLADAS PARA EVITAR SEU USO OU ENTREGA NÃO INTENCIONAL.' +
            'RETER INFORMAÇÃO DOCUMENTADA QUE:' +
            'A) DESCREVA A NÃO-CONFORMIDADE;' +
            'B) DESCREVA AS AÇÕES TOMADAS;' +
            'C) DESCREVA QUAISQUER CONCESSÕES OBTIDAS;' +
            'D) IDENTIFIQUE A AUTORIDADE QUE DECIDIU A AÇÃO REFERENTE A NÃO-CONFORMIDADE') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (78,' + QuotedStr('10') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/AÇÃO PREVENTIVA/MELHORIA/CORRETIVA') + ',' + QuotedStr('DETERMINAR E SELECIONAR OPORTUNIDADES DE MELHORIA, E IMPLEMENTAR AS AÇÕES NECESSÁRIAS.' +
            'IMPLEMENTAR MÉTODO DE TRATATIVA DE NÃO CONFORMIDADES.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (79,' + QuotedStr('10') + ',' + QuotedStr('PARÂMETROS/PARÂMETROS DO SISTEMA  (ABA ENVIO DE E-MAILS)') + ',' + QuotedStr('CONFIGURAR NOTIFICAÇÕES DE E-MAILS DOS PMCS') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (80,' + QuotedStr('9.3') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/ANÁLISE CRÍTICA') + ',' + QuotedStr('REALIZAR ANÁLISE CRÍTICA DO SGQ.') + ');');

   Executar(' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (81,' + QuotedStr('9.2') + ',' + QuotedStr('N.A') + ',' + QuotedStr('QUALIFICAR AUDITOR INTERNO.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (82,' + QuotedStr('9.2') + ',' + QuotedStr('CADASTRO/MONITORAMENTO DO SISTEMA/AUDITORIA INTERNA/ISO-9001:2015/PROGRAMA DE AUDITORIA INTERNA') + ',' + QuotedStr('ELABORAR PROGRAMA DE AUDITORIA INTERNA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (83,' + QuotedStr('9.2') + ',' + QuotedStr('CADASTRO/MONITORAMENTO DO SISTEMA/AUDITORIA INTERNA/ISO-9001:2015/RELATÓRIO DE AUDITORIA INTERNA') + ',' + QuotedStr('REALIZAR AUDITORIA INTERNA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (84,' + QuotedStr('9.2/10') + ',' + QuotedStr('CADASTRO/REQUISITOS SISTÊMICOS/AÇÃO PREVENTIVA/MELHORIA/CORRETIVA/ABERTURA DE PMC') + ',' + QuotedStr('TOMAR AÇÕES NECESSÁRIAS MEDIANTE RESULTADO DA AUDITORIA INTERNA.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (85,' + QuotedStr('N.A') + ',' + QuotedStr('N.A') + ',' + QuotedStr('CONTRATAR ORGANISMO CERTIFICADOR.') + ');' +
            ' INSERT INTO cronograma(cro_codigo, cro_requisito, cro_tela_destra, cro_atividade)  VALUES (86,' + QuotedStr('N.A') + ',' + QuotedStr('N.A') + ',' + QuotedStr('REALIZAR AUDITORIA DE CERTIFICAÇÃO.') + ');');

end;

procedure TransferirEvidenciasAcoes();
begin
   with dm.cdsAux do begin

      Active:= False;
      CommandText:= ' SELECT codi_aco, arqu_aco' +
                    ' FROM pmc_acoes' +
                    ' WHERE arqu_aco <> ' + QuotedStr('');
      Active:= True;
      First;

      while not Eof do begin
         Executar(' INSERT INTO pmc_acoes_evidencias VALUES(' +
                  BuscarNovoCodigo('pmc_acoes_evidencias', 'evi_codigo') + ',' +
                  dm.cdsAux.FieldByName('codi_aco').AsString + ',' +
                  QuotedStr(dm.cdsAux.FieldByName('arqu_aco').AsString) +
                  ')');
         Next;
      end;
   end;
end;

procedure AtualizarRetencao();
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' DELETE FROM tabela_combos ' +
                    ' WHERE tipo_com = 10';
      Execute;
   end;

   // Insere todos os tipos de Retenção
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '6,' +
            QuotedStr('N.A.') + ',' +
            '1)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '12,' +
            QuotedStr('1 SEMANA') + ',' +
            '2)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '7,' +
            QuotedStr('1 MÊS') + ',' +
            '3)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '8,' +
            QuotedStr('3 MESES') + ',' +
            '4)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '1,' +
            QuotedStr('6 MESES') + ',' +
            '5)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '3,' +
            QuotedStr('1 ANO') + ',' +
            '6)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '9,' +
            QuotedStr('2 ANOS') + ',' +
            '7)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '4,' +
            QuotedStr('3 ANOS') + ',' +
            '8)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '5,' +
            QuotedStr('5 ANOS') + ',' +
            '9)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '13,' +
            QuotedStr('20 ANOS') + ',' +
            '10)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '10,' +
            QuotedStr('25 ANOS') + ',' +
            '11)');
   Executar(' INSERT INTO tabela_combos VALUES(10,' +
            QuotedStr('RETENÇÃO - FORMULARIOS') + ',' +
            '11,' +
            QuotedStr('PERMANENTE') + ',' +
            '12)');
end;

procedure GravarMotivoRNC();
begin
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 1, 'AMASSADO', 1);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 2, 'ARGOLINHA', 2);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 3, 'DESFIADO', 3);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 4, 'DESPENCADO', 4);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 5, 'DOBRADO', 5);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 6, 'EMBALAGEM AVARIADA', 6);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 7, 'EMENDA', 7);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 8, 'ENROLAMENTO', 8);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 9, 'ENTRADA INCORRETA', 9);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 10, 'ESTAMPA FALHADA', 10 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 11, 'ESTAMPA FORA DE COR', 11 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 12, 'FALTA DE FIO', 12 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 13, 'FALTA PRODUTO', 13 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 14, 'FIO ESTICADO', 14 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 15, 'FORA DE COR', 15 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 16, 'FORA DE QUANTIDADE', 16 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 17, 'GOMA', 17 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 18, 'GRAMPO', 18 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 19, 'IDENTIFICAÇÃO INCORRETA', 19 );
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 20, 'LARGURA', 20);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 21, 'MANCHA', 21);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 22, 'METRAGEM', 22);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 23, 'ODOR', 23);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 24, 'OURELA IRREGULAR', 24);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 25, 'RALEIRA', 25);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 26, 'SOLIDEZ', 26);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 27, 'SOQUEADO', 27);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 28, 'SUJO', 28);
   GravarTabelaCombos(32, 'MOTIVOS - RNC', 29, 'VINCO', 29);
end;

procedure GravarOrigemRNC();
begin
   GravarTabelaCombos(33, 'ORIGEM - RNC', 1, 'INTERNO', 1);
   GravarTabelaCombos(33, 'ORIGEM - RNC', 2, 'CLIENTE', 2);
   GravarTabelaCombos(33, 'ORIGEM - RNC', 3, 'FORNECEDOR', 3);
   GravarTabelaCombos(33, 'ORIGEM - RNC', 4, 'AUDITORIA', 4);
   GravarTabelaCombos(33, 'ORIGEM - RNC', 5, 'ANÁLISE DE RISCOS/OPORTUNIDADES', 5);
end;

procedure PreencherDataAcaoPMC();
var
   wDia, wAno, wMes: word;
   sData: string;
   iQtd: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT c.relname, a.attname as "Coluna",' +
                    ' pg_catalog.format_type(a.atttypid, a.atttypmod) as "TipoCampo" ' +
                    ' FROM pg_catalog.pg_attribute a   ' +
                    ' INNER JOIN pg_stat_user_tables c on a.attrelid = c.relid' +
                    ' WHERE a.attnum > 0 AND NOT a.attisdropped ' +
                    ' AND relname = ' + QuotedStr('pmc_acoes') + ' AND a.attname = ' + QuotedStr('praz_aco') +
                    ' ORDER BY c.relname, a.attname ';
      Active:= True;
      iQtd:= RecordCount;
   end;

   if iQtd > 0 then begin
      DecodeDate(Date(), wAno, wMes, wDia);
      sData:= IntToStr(wDia) + '/' + ZerosEsquerda(IntToStr(wMes),2) + '/' + IntToStr(wAno);
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' UPDATE pmc_acoes SET praz_aco = ' + QuotedStr(sData) + ' WHERE praz_aco = ' + QuotedStr('  /  /    ');
         Execute;
      end;
   end;;
end;

procedure GravarRetencaoFormularios();
begin
   // Exclui os itens de retenção de formulários
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' DELETE FROM tabela_combos ' +
                    ' WHERE tipo_com = 10';
      Execute;
   end;

   // Insere os itens na ordem cronológica
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 6, 'N.A.', 1);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 12, '1 SEMANA', 2);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 7, '1 MÊS', 3);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 14, '2 MESES', 4);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 8, '3 MESES', 5);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 15, '4 MESES', 6);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 16, '5 MESES', 7);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 1, '6 MESES', 8);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 3, '1 ANO', 9);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 9, '2 ANOS', 10);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 4, '3 ANOS', 11);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 17, '4 ANOS', 12);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 5, '5 ANOS', 13);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 18, '6 ANOS', 14);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 13, '20 ANOS', 15);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 10, '25 ANOS', 16);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 11, 'PERMANENTE', 17);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 19, 'INDETERMINADO', 18);
end;

procedure AcertarRetencaoFormularios;
begin
   // Exclui o código 2, pois será 6 meses assim como o código 1
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' DELETE FROM tabela_combos ' +
                    ' WHERE tipo_com = 10 AND codi_com = 2';
      Execute;
   end;
   // Converte o código 2 para o código 1 no cadastro de formulários
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE formularios_locais SET ' +
                    ' for_retencao = 1' +
                    ' WHERE for_retencao = 2';
      Execute;
   end;

   // Altera a descrição dos períodos existentes
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE tabela_combos SET ' +
                    ' valo_com = ' + QuotedStr('6 MESES') + ',' +
                    ' orde_com = 4' +
                    ' WHERE tipo_com = 10 AND codi_com = 1';
      Execute;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE tabela_combos SET ' +
                    ' valo_com = ' + QuotedStr('1 ANO') + ',' +
                    ' orde_com = 5' +
                    ' WHERE tipo_com = 10 AND codi_com = 3';
      Execute;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE tabela_combos SET ' +
                    ' valo_com = ' + QuotedStr('3 ANOS') + ',' +
                    ' orde_com = 7' +
                    ' WHERE tipo_com = 10 AND codi_com = 4';
      Execute;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE tabela_combos SET ' +
                    ' valo_com = ' + QuotedStr('5 ANOS') + ',' +
                    ' orde_com = 8' +
                    ' WHERE tipo_com = 10 AND codi_com = 5';
      Execute;
   end;

   // Insere os novos períodos
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 7, '1 MÊS', 2);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 8, '3 MESES', 3);
   GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 9, '2 ANOS', 6);

   // Feita essa verificação se existem esses registros porque foram inseridos
   // manualmente esses valores na Viação Sorriso para atender a auditoria
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT * FROM tabela_combos' +
                    ' WHERE tipo_com = 10 and (codi_com = 10 or codi_com = 11)';
      Active:= True;

      if RecordCount <= 0 then begin
         GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 10, '25 ANOS', 9);
         GravarTabelaCombos(10, 'RETENÇÃO - FORMULARIOS', 11, 'PERMANENTE', 10);
      end;
   end;
end;

procedure GravarTabelaCombos(Tipo: Integer; NomeTipo: string; Codigo: Integer; Descricao: string; Ordem: Integer);
begin
   with dm.cdsGravar do begin
      Active:= False;
      CommandText:= ' INSERT INTO tabela_combos(' +
                    '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                    ' VALUES (' +
                    IntToStr(Tipo) + ',' +
                    QuotedStr(NomeTipo) + ',' +
                    IntToStr(Codigo) + ',' +
                    QuotedStr(Descricao) + ',' +
                    IntToStr(Ordem) +
                    ');';
      Execute;
   end;
end;

procedure GravarNovaFuncao(Codigo: Integer; Descricao: string; Ordem: Integer);
begin
   with dm.cdsGravar do begin
      Active:= False;
      CommandText:= ' INSERT INTO tabela_combos(' +
                    '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                    ' VALUES (' +
                    QuotedStr('99') + ',' +
                    QuotedStr('FUNÇÕES DO SISTEMA') + ',' +
                    IntToStr(Codigo) + ',' +
                    QuotedStr(Descricao) + ',' +
                    IntToStr(Ordem) +
                    ');';
      Execute;
   end;

   GravaUsuarios(QuotedStr(IntToStr(Codigo)));
end;

// Grava uma nova função em todos os usuários cadastrados com o status "Sem permissão"
procedure GravaUsuarios(funcao: string);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT DISTINCT usua_ace FROM acessos';
      Active:= True;
      First;
   end;

   while not dm.cdsAuxiliar.Eof do begin
      with dm.cdsAux do begin
         Active:= False;

         with dm.cdsAux2 do begin
            Active:= False;
            CommandText:= ' SELECT COUNT(*) as Qtd FROM acessos' +
                          ' WHERE usua_ace = ' + QuotedStr(dm.cdsAuxiliar.FieldByName('usua_ace').AsString) +
                          ' AND func_ace = ' + funcao;
            Active:= True;

            if FieldByName('Qtd').AsInteger = 0 then begin
               if dm.cdsAuxiliar.FieldByName('usua_ace').AsString = 'DESTRA' then begin
                  dm.cdsAux.CommandText:= ' INSERT INTO acessos (usua_ace, func_ace, cadastro, alteracao, exclusao, acesso)' +
                                ' VALUES (' + QuotedStr(dm.cdsAuxiliar.FieldByName('usua_ace').AsString) + ',' + funcao + ', 1,1,1,1)';
               end
               else begin
                  dm.cdsAux.CommandText:= ' INSERT INTO acessos (usua_ace, func_ace, cadastro, alteracao, exclusao, acesso)' +
                                ' VALUES (' + QuotedStr(dm.cdsAuxiliar.FieldByName('usua_ace').AsString) + ',' + funcao + ', 0,0,0,0)';
               end;

               dm.cdsAux.Execute;
            end;
         end;
      end;
      dm.cdsAuxiliar.Next;
   end;
end;

procedure GravarCaliEquip();
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT cali_numero, codi_inf' +
                    ' FROM calibracao C' +
                    ' INNER JOIN infraestrutura I on I.iden_inf = C.cali_numero';
      Active:= True;

      First;

      while not Eof do begin
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE calibracao SET cali_equip = ' + dm.cdsAuxiliar.FieldByName('codi_inf').AsString +
                          ' WHERE cali_numero = ' + QuotedStr(dm.cdsAuxiliar.FieldByName('cali_numero').AsString);
            Execute;
         end;
         Next;
      end;
   end;
end;

procedure AtualizarLocais();
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_for, prot_for, rete_for, recu_for, desc_for' +
                    ' FROM formularios';
      Active:= True;

      First;
      while not Eof do begin
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE formularios_locais SET' +
                          ' for_disposicao = ' + dm.cdsAuxiliar.FieldByName('desc_for').AsString + ',' +
                          ' for_retencao = ' + dm.cdsAuxiliar.FieldByName('rete_for').AsString + ',' +
                          ' for_recuperacao = ' + dm.cdsAuxiliar.FieldByName('recu_for').AsString + ',' +
                          ' for_tipo_protecao = ' + dm.cdsAuxiliar.FieldByName('prot_for').AsString +
                          ' WHERE for_codform = ' + dm.cdsAuxiliar.FieldByName('codi_for').AsString;
            Execute;
         end;

         Next;
      end;
   end;
end;

procedure ConverterPrazoPMC();
var
   sData: string;
   wAno, wMes, wDia: Word;
begin
   DecodeDate(Date(), wAno, wMes, wDia);
   sData:= IntToStr(wDia) + '/' + IntToStr(wMes) + '/' + IntToStr(wAno);
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE pmc_acoes SET praz_aco = ' + QuotedStr(sData) + ' WHERE praz_aco = ' + QuotedStr('  /  /    ');
      Execute;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE pmc_acoes SET praz_aco2 = CAST(praz_aco AS timestamp without time zone);';
      Execute;
   end;
end;

procedure CopiaMetasInd();
var
   sCodigo: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_ind, meta_ind, ind_unidade, tipo_ind' +
                    ' FROM indicadores';
      Active:= True;
      First;
      sCodigo:= 0;
      while not Eof do begin
         sCodigo:= sCodigo + 1;
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' INSERT INTO indicadores_metas (met_codigo, met_codindicador, ' +
                          ' met_anomes, met_tipo, met_valor, met_unidade)' +
                          ' VALUES(' +
                          IntToStr(sCodigo) + ',' +
                          dm.cdsAuxiliar.FieldByName('codi_ind').AsString + ',' +
                          QuotedStr('201501') + ',' +
                          IntToStr(dm.cdsAuxiliar.FieldByName('tipo_ind').AsInteger) + ',' +
                          VirgulaParaPonto(dm.cdsAuxiliar.FieldByName('meta_ind').AsFloat, 8) + ',' +
                          QuotedStr(dm.cdsAuxiliar.FieldByName('ind_unidade').AsString) +
                          ')';
            Execute;
         end;

         Next;
      end;
   end;
end;

procedure AcertarChaveAuditInterna();
var
   iCont: integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT distinct data_aud FROM auditoria_interna;';
      Active:= True;

      First;
      iCont:= 0;
      while not Eof do begin
         iCont:= iCont + 1;
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' UPDATE auditoria_interna' +
                          ' SET aud_codigo = ' + IntToStr(iCont) +
                          ' WHERE data_aud = ' + QuotedStr(dm.cdsAuxiliar.FieldByName('data_aud').AsString);
            Execute;
         end;
         Next;
      end;
   end;
end;

procedure CriarCampo(nomeCampo: string; nomeTabela: string; tipoCampo: string; valorPadrao: string = ''; tipoValorPadrao: string = '');
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' ALTER TABLE ' + nomeTabela +
                    ' ADD COLUMN ' + nomeCampo + ' ' + tipoCampo;
      Execute;
   end;

   if valorPadrao <> '' then begin
      with dm.cdsAux2 do begin
         Active:= False;
         if tipoValorPadrao = 'I' then begin
            CommandText:= ' UPDATE ' + nomeTabela +
                          ' SET ' + nomeCampo + ' = ' + valorPadrao;
         end;
         if tipoValorPadrao = 'S' then begin
            CommandText:= ' UPDATE ' + nomeTabela +
                          ' SET ' + nomeCampo + ' = ' + QuotedStr(valorPadrao);
         end;
         Execute;
      end;
   end;
end;


procedure GravarVariaveis(sCodigo: string; sFator: string; sDescricao: string; tipo: string);
begin
   if tipo = 'E' then begin// Variáveis Externa
      with dm.cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO risco_variaveis_ext (var_codigo, var_codfator, var_descricao)' +
                       ' VALUES(' +
                       sCodigo + ',' +
                       sFator + ',' +
                       QuotedStr(sDescricao) +
                       ')';
         Execute;
      end;
   end
   else begin // Variável Interna
      with dm.cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO risco_variaveis_int (var_codigo, var_codfator, var_descricao)' +
                       ' VALUES(' +
                       sCodigo + ',' +
                       sFator + ',' +
                       QuotedStr(sDescricao) +
                       ')';
         Execute;
      end;
   end;
end;

procedure InserirVariaveisExternas();
var
   var1, var2, var3: string;
begin
   var1:= '1';
   var2:= '1';
   var3:= 'CONJUNTURA POLÍTICA NACIONAL E INTERNACIONAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '2';
   var2:= '1';
   var3:= 'PLANOS GOVERNAMENTAIS, REGIONAIS E SETORIAIS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '3';
   var2:= '1';
   var3:= 'INVESTIMENTOS EM POLÍTICAS SOCIAIS (HABITAÇÃO, SANEAMENTO, SAÚDE, ENSINO, AGRÁRIA, SEGURANÇA, EMPREGO)';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '4';
   var2:= '1';
   var3:= 'POLÍTICAS DE DESCENTRALIZAÇÃO (PRIVATIZAÇÃO E CONCESSÕES)';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '5';
   var2:= '1';
   var3:= 'POLÍTICAS DE EXPORTAÇÃO E IMPORTAÇÃO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '6';
   var2:= '1';
   var3:= 'POLÍTICA CAMBIAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '7';
   var2:= '1';
   var3:= 'LEGISLAÇÃO TRABALHISTA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '8';
   var2:= '1';
   var3:= 'LEGISLAÇÃO AMBIENTAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '9';
   var2:= '1';
   var3:= 'AGÊNCIAS REGULADORAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '10';
   var2:= '1';
   var3:= 'REFORMAS CONSTITUCIONAIS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '11';
   var2:= '1';
   var3:= 'POLÍTICAS DE INCENTIVOS GOVERNAMENTAIS (CENTRAL/REGIONAIS).';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '12';
   var2:= '2';
   var3:= 'IMPACTOS SALARIAIS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '13';
   var2:= '2';
   var3:= 'PRODUTO INTERNO BRUTO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '14';
   var2:= '2';
   var3:= 'PERSPECTIVAS DE INVESTIMENTO NA ECONOMIA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '15';
   var2:= '2';
   var3:= 'CONJUNTURA ECONÔMICA GLOBAL, NACIONAL E SETORIAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '16';
   var2:= '2';
   var3:= 'POLÍTICAS FISCAIS, DE INVESTIMENTOS E DE FINANCIAMENTOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '17';
   var2:= '2';
   var3:= 'TAXAS DE CÂMBIO, DE JUROS E INFLAÇÃO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '18';
   var2:= '2';
   var3:= 'FLUXO DE RECURSOS EXTERNOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '19';
   var2:= '2';
   var3:= 'EXPORTAÇÕES E IMPORTAÇÕES: GLOBAIS E SETORIAIS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '20';
   var2:= '2';
   var3:= 'BLOCOS ECONÔMICOS E ACORDOS MULTIBILATERAIS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '21';
   var2:= '2';
   var3:= 'DÍVIDA EXTERNA/DÉFICIT PÚBLICO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '22';
   var2:= '2';
   var3:= 'LIQUIDEZ INTERNA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '23';
   var2:= '2';
   var3:= 'GRAU DE PROTEÇÃO À INDÚSTRIA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '24';
   var2:= '2';
   var3:= 'RESTRIÇÕES ALFANDEGÁRIAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '25';
   var2:= '2';
   var3:= 'RESTRIÇÕES AO CAPITAL EXTERNO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '26';
   var2:= '3';
   var3:= 'EVOLUÇÃO DAS ATUAIS TECNOLOGIAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '27';
   var2:= '3';
   var3:= 'NOVAS TECNOLOGIAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '28';
   var2:= '3';
   var3:= 'ACESSO ÀS TECNOLOGIAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '29';
   var2:= '3';
   var3:= 'PARCERIAS TECNOLÓGICAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '30';
   var2:= '3';
   var3:= 'IMPACTO DA EVOLUÇÃO TECNOLÓGICA (PRODUTOS, GESTÃO, MERCADOS, NOVAS HABILIDADES REQUERIDAS, TREINAMENTOS, ETC)';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '31';
   var2:= '3';
   var3:= 'IMPACTO NA CADEIA DE VALOR';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '32';
   var2:= '3';
   var3:= 'NOVOS BENS E SERVIÇOS DECORRENTES';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '33';
   var2:= '4';
   var3:= 'ENTIDADES DE CLASSE';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '34';
   var2:= '4';
   var3:= 'SINDICATOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '35';
   var2:= '4';
   var3:= 'MÍDIAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '36';
   var2:= '4';
   var3:= 'DIREITOS DO CONSUMIDOR';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '37';
   var2:= '4';
   var3:= 'ÉTICA SOCIAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '38';
   var2:= '4';
   var3:= 'DEMOGRAFIA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '39';
   var2:= '4';
   var3:= 'NÍVEL DE EMPREGO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '40';
   var2:= '4';
   var3:= 'MÃO DE OBRA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '41';
   var2:= '4';
   var3:= 'PODER AQUISITIVO E INSERÇÃO SOCIAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '42';
   var2:= '4';
   var3:= 'MUDANÇAS DE HÁBITOS/MOBILIDADE SOCIAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '43';
   var2:= '4';
   var3:= 'MEIO AMBIENTE E SUSTENTABILIDADE';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '44';
   var2:= '4';
   var3:= 'QUALIDADE DE VIDA, LAZER';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '45';
   var2:= '4';
   var3:= 'IMAGEM DE EMPRESAS/EMPRESÁRIOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '46';
   var2:= '4';
   var3:= 'RELAÇÕES COM A COMUNIDADE';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '47';
   var2:= '4';
   var3:= 'SAZONALIDADES';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '48';
   var2:= '4';
   var3:= 'COMPORTAMENTO CULTURAL E QUESTÕES ÉTNICAS';
   GravarVariaveis(var1, var2, var3, 'E');

   // Clientes
   var1:= '49';
   var2:= '5';
   var3:= 'CONCENTRAÇÃO DOS COMPRADORES EM RELAÇÃO À CONCENTRAÇÃO DE EMPRESAS VENDEDORAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '50';
   var2:= '5';
   var3:= 'VOLUME DE COMPRAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '51';
   var2:= '5';
   var3:= 'DIFERENCIAÇÃO DE PRODUTOS ENTRE AS EMPRESAS DO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '52';
   var2:= '5';
   var3:= 'AMEAÇA DOS CLIENTES COMPRAREM AS EMPRESAS FORNECEDORAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '53';
   var2:= '5';
   var3:= 'CONHECIMENTO DOS COMPRADORES DE CUSTOS E DA ESTRUTURA DAS EMPRESAS NO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '54';
   var2:= '5';
   var3:= 'LUCRATIVIDADE DOS COMPRADORES';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '55';
   var2:= '5';
   var3:= 'REDUÇÃO DE CUSTOS POR MEIO DE PRODUTOS ALTERNATIVOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '56';
   var2:= '5';
   var3:= 'IMPORTÂNCIA DO FORNECEDOR PARA A QUALIDADE DO PRODUTO FINAL DO COMPRADOR';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '57';
   var2:= '5';
   var3:= 'PORCENTAGEM DE GASTOS DOS COMPRADORES EM PRODUTOS DOS FORNECEDORES';
   GravarVariaveis(var1, var2, var3, 'E');

   // Concorrentes
   var1:= '58';
   var2:= '6';
   var3:= 'NÚMERO DE CONCORRENTES';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '59';
   var2:= '6';
   var3:= 'DIVERSIDADE DE CONCORRENTES';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '60';
   var2:= '6';
   var3:= 'TAXA DE CRESCIMENTO DO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '61';
   var2:= '6';
   var3:= 'CUSTOS FIXOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '62';
   var2:= '6';
   var3:= 'CUSTOS DE ESTOCAGEM';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '63';
   var2:= '6';
   var3:= 'DIFERENCIAÇÃO DE PRODUTO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '64';
   var2:= '6';
   var3:= 'CUSTOS DE TROCA ENTRE PRODUTOS DA CONCORRÊNCIA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '65';
   var2:= '6';
   var3:= 'BARREIRAS DE SAÍDA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '66';
   var2:= '6';
   var3:= 'APOSTAS ESTRATÉGICAS';
   GravarVariaveis(var1, var2, var3, 'E');

   // Fornecedores
   var1:= '67';
   var2:= '7';
   var3:= 'CONCENTRAÇÃO DOS FORNECEDORES EM RELAÇÃO À CONCENTRAÇÃO DE COMPRADORES DO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '68';
   var2:= '7';
   var3:= 'DISPONIBILIDADE DE PRODUTOS SUBSTITUTOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '69';
   var2:= '7';
   var3:= 'IMPORTÂNCIA DO COMPRADOR PARA O FORNECEDOR';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '70';
   var2:= '7';
   var3:= 'DIFERENCIAÇÃO DOS PRODUTOS E SERVIÇOS DOS FORNECEDORES';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '71';
   var2:= '7';
   var3:= 'CUSTOS DE TROCA DO COMPRADOR';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '72';
   var2:= '7';
   var3:= 'AMEAÇA DOS FORNECEDORES COMPRAREM EMPRESAS COMPRADORAS';
   GravarVariaveis(var1, var2, var3, 'E');

   // Novos Entrantes
   var1:= '73';
   var2:= '8';
   var3:= 'ECONOMIAS DE ESCALA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '74';
   var2:= '8';
   var3:= 'DIFERENCIAÇÃO DE PRODUTO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '75';
   var2:= '8';
   var3:= 'NECESSIDADE DE CAPITAL';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '76';
   var2:= '8';
   var3:= 'CUSTOS DE TROCA';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '77';
   var2:= '8';
   var3:= 'CONTROLE DOS CANAIS DE DISTRIBUIÇÃO PELAS EMPRESAS QUE ATUAM NO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '78';
   var2:= '8';
   var3:= 'PROPRIEDADE INTELECTUAL DAS EMPRESAS QUE OPERAM NO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '79';
   var2:= '8';
   var3:= 'ACESSO ÀS MATÉRIAS PRIMAS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '80';
   var2:= '8';
   var3:= 'ACESSO AOS SUBSÍDIOS DO GOVERNO PELAS EMPRESAS QUE ESTÃO NO MERCADO';
   GravarVariaveis(var1, var2, var3, 'E');

   // Produtos Substitutos
   var1:= '81';
   var2:= '9';
   var3:= 'GANHO NA RELAÇÃO CUSTO/BENEFÍCIO DO PRODUTO SUBSTITUTO';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '82';
   var2:= '9';
   var3:= 'LUCRATIVIDADE DO MERCADO EM PRODUZIR PRODUTOS SUBSTITUTOS';
   GravarVariaveis(var1, var2, var3, 'E');

   var1:= '83';
   var2:= '9';
   var3:= 'CUSTOS DE TROCA PELO COMPRADOR DO PRODUTO';
   GravarVariaveis(var1, var2, var3, 'E');
end;

procedure InserirVariaveisInternas();
var
   var1, var2, var3: string;
begin
   var1:= '1';
   var2:= '1'; // Valores e Cultura
   var3:= 'MARCA RECONHECIDA';
   GravarVariaveis(var1, var2, var3, 'I');   // Codigo Fator Descrição

   var1:= '2';
   var2:= '1'; // Valores e Cultura
   var3:= 'PORTFÓLIO VARIADO';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '3';
   var2:= '1'; // Valores e Cultura
   var3:= 'DIFERENCIAL INOVADOR';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '4';
   var2:= '1'; // Valores e Cultura
   var3:= 'PRODUTOS VARIADOS';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '5';
   var2:= '1'; // Valores e Cultura
   var3:= 'CUSTO BAIXO';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '6';
   var2:= '1'; // Valores e Cultura
   var3:= 'LOCALIZAÇÃO PRIVILEGIADA';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '7';
   var2:= '1'; // Valores e Cultura
   var3:= 'INFRAESTRUTURA ADEQUADA';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '8';
   var2:= '1'; // Valores e Cultura
   var3:= 'TURNOVER BAIXO';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '9';
   var2:= '1'; // Valores e Cultura
   var3:= 'RECURSOS FINANCEIROS DISPONÍVEIS';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '10';
   var2:= '1'; // Valores e Cultura
   var3:= 'ESTABILIDADE DO NEGÓCIO';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '11';
   var2:= '1'; // Valores e Cultura
   var3:= 'RESPONSABILIDADE SOCIOAMBIENTAL';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '12';
   var2:= '2'; // Performance
   var3:= 'TECNOLOGIA PRÓPRIA';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '13';
   var2:= '2'; // Performance
   var3:= 'PRODUTO DE QUALIDADE';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '14';
   var2:= '2'; // Performance
   var3:= 'EMPREGADOS COMPETENTES';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '15';
   var2:= '2'; // Performance
   var3:= 'EFICIÊNCIA OPERACIONAL';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '16';
   var2:= '2'; // Performance
   var3:= 'CANAL DE VENDAS DIVERSIFICADO';
   GravarVariaveis(var1, var2, var3, 'I');

   var1:= '17';
   var2:= '2'; // Performance
   var3:= 'BASE DE CLIENTES GRANDE E DIVERSIFICADA';
   GravarVariaveis(var1, var2, var3, 'I');
end;

end.
