unit Funcoes;

interface

uses SysUtils, Inifiles, Forms, StdCtrls, Graphics, DBCtrls, Mask, WinProcs, DbiProcs,
     Messages, Dialogs, MidasLib, DBClient, Provider, DB, SqlExpr, Controls, Registry,
     IdSMTP, IdMessage, WinInet, rxToolEdit, rxCurrEdit, JvgPage, Variants, Buttons,
     ShellAPI, DBGrids, ExtCtrls, RXSpin, frxClass, ComObj, Classes, ComCtrls ;

const
   Chave = 16685;
   C1 = 66265;
   C2 = 09075;

procedure MudaEdicao(Form : TForm; Sender: TObject; Key: Word);
// Converte um caracter em maiúsculo
function AcertaUpperLetra(Key: Char): Char;
// Converte a string para maiúsculo considerando caracteres especiais
function AcertaUpper(Palavra: string): string;
function MontaCombosGeral(Tipo:Integer; Combo:TObject): Boolean;
function CarregaCombosGeral(Tipo:Integer; Combo:TObject; cds:TClientDataSet; Campo: String): Boolean;
function BuscaCodigoTabelaCombos(Tipo:Integer; Valor:String): Integer;
// Busca a descrição da função cadastrada na tabela Tabela_Combos
function BuscaNomeFuncaoSistema(Codigo:Integer): String;

procedure Auditoria(cTabela, cDocto, cOperacao, cRevisao: String);
// Retorna o nome do mês em extenso 
function MesExtenso(NumMes: string; Maiuscula: boolean): string;
function SetScreenResolution(Width, Height: integer): Longint;
// Arruma a data para o formato SQL YYYY-MM-DD
function ArrumaDataSQL(dData: TDateTime): string;
// centraliza uma string
function Centraliza(texto: string; num: Integer): string;
// Alinha o texto à direita
function Direita(texto: string; num: Integer): string;
// Replica um determinado caracter n vezes
function Replic(caracter: string; numVezes: Integer): string;
// Insere n caracteres em branco a direita do texto
function PadR(texto: string; NumCaracteres: Integer): string;
// Insere n caracteres especificado a direita do texto
function PadRc(texto: string; NumCaracteres: Integer; Caracter: string): string;
// Insere n caracteres especificado a esquerda do texto
function PadLc(texto: string; NumCaracteres: Integer; Caracter: string): string;
// Troca os caracteres especiais (EX: Ç por C)
function AcertaLetras(Palavra: string): string;
// Limpa os espaços em branco a esquerda e a direita da string
function AllTrim(Expressao: string): string;
// Busca o valor padrão da nota das habiliadades do colaborador (Específico Destra Manager)
//function BuscaNotaHabilidade(): Real;
// Procedure que esconde ou mostra o botão Iniciar da barra de tarefas do windows
procedure EscondeIniciar(Visible: Boolean);
// Procedure que esconde ou mostra a barra de tarefas do windows
procedure SetTaskBar(Visible: Boolean);
// Função para validar o acesso de usuário
function Acesso(Usuario: string; Funcao: Integer; Opcao: String; ExibeMsg: string = 'S'): Integer;
// Muda o sinal decimal de vírgula para ponto
function VirgulaParaPonto(valor: Real; casas: Integer; MantemVirgula: string = 'N'): string;
// Verifica se existem alterações no banco de dados a serem feitas
function AtualizaBanco(): Boolean;
// Preenche a tabela auditoria_interna com os dados dos processos na primeira vez. Depois a tabela
// será alimentada quando do cadastro de um novo processo
procedure PreencheAuditoria(parData: TDateTime);
// Preenche a tabela auditoria_interna 2015 com os dados dos processos na primeira vez. Depois a tabela
// será alimentada quando do cadastro de um novo processo
procedure PreencheAuditoria2015(parData: TDateTime);
// Busca as informações de versão do executável
procedure GetBuildInfo(var V1, V2, V3, V4: Word);
// Usa a função GetBuidInfo para mostras as informações de versão.
function GetVersionInfo: string;
// Duplica a barra para corrigira gravação de caminhos de arquivos
function DuploBar(s: string): string;
// Cria o arquivo .INI
procedure GravaIni(IP: String);
// Lê o arquivo .INI
function LeIni(sTipo: string): string;
// Grava as novas funçoes do sistema para o cadastro de acessos
procedure GravaUsuarios(funcao: string);
// função que criptografa strings - 32 Bits
function Criptografar(par_texto: string): string;
// função que descriptografa strings - 32 Bits
function Descriptografar(par_texto: string): string;
// gera a sequencia dos valores dos indicadores para sair corretamente do gráfico
procedure AcertarSeqIndicadores();
// Verifica se a tecla digitada é número. Se não for, retorna false
function Numero(Tecla: Char): Boolean;

//******** Funções da nova validação do sistema
// Tenta jogar o foco para o componente desejado
procedure TryFocus(Componente: TObject);
// Função que verifica se a chave digitata é válida
function VerificaChave(Chave: String): Boolean;

function InverteString(texto: String): String;

function LimpaCPFCNPJ(sTexto: String): String;

function RetDataChave(Chave: String): TDateTime;

// Retorna o número de série do HD da máquina
function RetNumSerieHD(Hexadecimal: Boolean = False): String;
// Grava dados no registro do Windows
procedure GravarRegistro(Chave, SubChave: String; Conteudo: String = '');
// Lê o registro do Windows
function LerRegistro(Chave, SubChave: String): String;
// Grava dados de registro do sistems
procedure GravarRegistroNovo(Chave: String);
// Lê os dados de registro do sistema
function LerRegistroNovo(): String;
// Função de criptação dos dados
function Cript(texto: String): String;
// Função de descriptação dos dados
function Decript(texto: String): String;
// Converte um caracter ASCII em Inteiro
function AsciiToInt(caracter: Char): Integer;

function StrZero(Numero, Tamanho: Integer): String;

function RetWinPath: String;

function GeraChave(Serial: String; HabilitaSistema: Boolean = False;
   DataLimite: TDateTime = 0): String;

function LogicoParaString(valor: Boolean): string;

function StringParaLogico(valor: string): Boolean;

function AcessoTartaruga(item: string): Boolean;
// Copia habilidades e treinamentos da função para o colaborador
procedure GravaAtributos(iCodCol, iCodFuncao: Integer; sTipo: string = 'A');

// Acerta os treinamentos e habilidades dos colaboradores
procedure AcertarAtributos();

// Preenche o campo com zeros a esquerda
function ZerosEsquerda(texto: string; NumZeros: Integer): string;
// Acerta o formato de uma data no formato string
function ArrumaDataString(sData: string): string;

procedure IncluiProcessoListaMestra();

procedure MostrarErro(Mensagem: string; MensagemDelphi: string; Formulario: string);
// Envia e-mails do sistema
procedure EnviarEmail(sTexto: string; sAssunto: string; sPara: string; sTipo: string; sMostraForm: string = 'S');
// Verifica se existe a configuração de e-mail cadastradas
function VerificarConfigEmail(): Boolean;
// Verifica se está conectado à internet
function VerificarConexaoInternet(ExibeMsg: Boolean): Boolean;
// Busca dados da empresa
function BuscarNomeEmpresa(): TStringList;
// Copia o processo de armazenamento dos registros da qualidade para a nova tabela formularios_locais
procedure CopiarArmazenamento();
// Habilita ou desabilita os campos de um formulário
procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean; Tela: TForm; NumPageControlOcultar: Integer = -1;
                          NumPageControlOcultar1: Integer = -1; NumPageControlOcultar2: Integer = -1);
// Verifica se um valor é nulo e retorna o valor correto
function Nulo(Valor: Variant; TipoDadoEsperado: string): Variant;
// Limpa os campos da tela do form especificado
procedure LimparCampos(Tela: TForm);
// Controla a habilitação do botão visualiza documentos nos forms
procedure ControlarBotaoVisualiza(Tela: TForm);
// Abre os arquivos físicos
procedure AbrirArquivo(arquivo: string; Tela: string; Maximizado: string = 'S');
// Executa comandos SQL
function Executar(sComando: string): Boolean;
// No filtro dos dataset a barra de rolagem some. Essa procedure dá um "refresh" para reaparecer a barra
procedure AjustaBarraGrid(NomeDBGrid: TDBGrid);
// Lê a tabela config com os dados de configuração do Banco de Dados
function LeConfig(sTipo: string): string;
// Verifica se o cliente é do projeto C&A
function VerificarProjetoCEA(): Boolean;
// Verifica se é o projeto específico da Spiltag
function VerificarProjetoSpiltag(): Boolean;
// Transforma uma data em um número inteiro para comparações entre datas
function ArrumaDataNumero(dData: TDateTime): Integer;
// Transforma dados no formato anomes tipo caracter
function AnoMes(Mes: string; Ano: string): string;
// Define as cores dos Riscos
procedure ColorirRisco(Panel: TPanel; Consequencia: Integer; Probabilidade: Integer; TipoRisco: Integer);
// Retorna a descrição conforme o tipo do Risco
function BuscarDescricaoRisco(Cor: TColor; Tipo: Integer; TipoAnalise: string): string;
// Busca o novo código na tabela especificada
function BuscarNovoCodigo(Tabela: string; Campo: string): string;
// Executa comandos DOS
procedure ExecutaDOS(Comando: string);
// Atualiza as metas dos indicadores copiando o valor do mês corrente
procedure GravarMesesMetaIndicadores(AnoMesAtual: string);
// Comandos para imprimir relatórios
procedure Imprimir(nomeRelatorio: string; Report: TfrxReport; tipoImp: string;
                   sNomeVariavel1: string = ''; sValorVariavel1: string = '';
                   sNomeVariavel2: string = ''; sValorVariavel2: string = '';
                   sNomeVariavel3: string = ''; sValorVariavel3: string = '';
                   sNomeVariavel4: string = ''; sValorVariavel4: string = '';
                   sNomeVariavel5: string = ''; sValorVariavel5: string = '';
                   sNomeVariavel6: string = ''; sValorVariavel6: string = '';
                   sNomeVariavel7: string = ''; sValorVariavel7: string = '');
// Subtrai meses de um anomes
function SubtrairAnoMes(anomes: string; meses: Integer): string;
// Soma meses de um anomes
function SomarAnoMes(anomes: string; meses: Integer): string;
// Valida os campos obrigatórios dos cadastros
function ValidarCampos(sForm: TForm; sNomeComponente: string): Boolean;
// Monta um novo código para o PDCA
function BuscarNovoCodigoPDCA(): string;
// Valida um campo DBLookup antes de gravar
function ValidarDBLookup(CampoDBL: TDBLookupComboBox): Boolean;
// Validar CPF / CNPJ
function CalculaCnpjCpf(Numero : String) : Boolean;
// IF Concatenado
function IIf(pCond: Boolean; pTrue, pFalse: Variant): Variant;
// Calcula o tipo do Risco da Análise de Riscos
function CalcularRisco(iConsequencia: Integer; iProbabilidade: Integer): string;
// Arredonda números reais
function RoundNExtend(ValorReal: Extended; Casas: Integer): Extended;
// Exporta dados para o Excel
procedure ExpExcel(dbGrid: TDBGrid; cds: TClientDataSet; Titulo: string; Form: TForm);
// Exibe e alinha panels de impressão
procedure AbrePanel(panel: TPanel; tela: TForm);
// Busca a última meta cadastrada do indicador
function BuscarUltimaMetaIndicador(CodIndicador: string): string;
// Abre um formulário
procedure AbrirForm(ClasseForm: TComponentClass; Form: TForm; iTela: Integer = 0; CodRegistro: string = '');
// Busca o código do PMV cm base no seu número
function BuscarCodPMC(NumPMC: string): string;
// Verifica se o usuário tem permissão de ver Clientes e Fornecedores
function LiberarClienteForn(): Boolean;
// Grava o histórico das movimentações de RNC
procedure GravarHistoricoRNC(CodRNC: string; sHistorico: string; sDisposicao: string = ''; sMotivoRecusa: string = '');
// Grava o status de RNC
procedure AtualizarStatusRNC(CodRNC: string; CodStatus: string);
// Busca a nota minima de habilidades em Parâmetros
function BuscarNotaMinimaHab(): string;
// Busca os dias da primeira avaliação para considerar pendências de habilidades em Parâmetros
function BuscarDiasPendHab(): Integer;
// Busca o padrão de cores escolhido em parâmetros
function BuscarParametroCoresRisco: string;
// Envia os e-mails automáticos do sistema configurados em Parêmetros
procedure EnviarEmailAutomatico();
// Prepara o e-mail automático para envio - PMC
procedure PrepararEmailAutoPMC(sEmail: string; sDataVencida: string = 'S');
// Busca o e-mail de um colaborador
function BuscarEmail(sCodColaborador: string): string;
// Prepara o e-mail automático para envio - Ações
procedure PrepararEmailAutoAcoes(sEmail: string; sDataVencida: string = 'S');
// Busca a data de filtro de PMC no cadastro de Parâmetros
function BuscarDataFiltroPMC(sTipo: string = 'D'):Variant;
// Prepara o e-mail automático para envio - Aviso de Manutenção
procedure PrepararEmailAutoManut(sEmail: string);
// Prepara o e-mail automático para envio - Aviso de Calibração
procedure PrepararEmailAutoCalib(sEmail: string);
// Atualiza o grid para que a barra de rolagem apareça, pois as vezes ao atualizar dados ela some
procedure AtualizarGrid(dbGrid: TDBGrid);
// Busca o nome do gestor do processo especificado
function BuscarGestorProcesso(sCodProcesso: string; sRetorno: string = 'Nome'): string;
// Busca o código do processo do indicador especificado
function BuscarProcessoInd(sCodIndicador: string): string;
// Busca o nome do colaborador se tiver usuário relacionado
function BuscarNomeColaborador(sUsuario: string): string;
// Busca o parâmetro do dia do indicador para pendência
function BuscarParametroDiaIndicador(): string;
// Verifica se o indicador está vencido na data de atualizaçãi em Parâmetros - TT162
function VerificaPendIndicador(iMesAnterior: Integer): Boolean;
// Busca o parâmetro de envio de e-mail de PMC ao gestor
function BuscarParametroEnvioGestor(): string;
// Busca o parâmetro de exibir texto no Cabeçalho/Rodapé dos relatórios
function BuscarParametroConf(sTipo: string): string;
// Busca o texto para o Cabeçalho/Rodapé dos relatórios
function BuscarTextoRel(): string;
// Busca o parâmetro Usar Filtro de Motivos por Processo
function BuscarParametroMotivoProc(): string;
// Busca o valor do parâmetro especificado na chamada da função
function BuscarParametro(sNomeCampoParametro: string): string;
// Retorna o último dia de um mês
function UltimoDiaDoMes(Data: TDate): string;
// Verifica a troca de senha a cada x dias (determinado em parâmetros)
function MudarSenha(): Boolean;
// Verifica se a senha é forte de acordo com os critérios
function VerificarSenhaForte(sSenha: string): Boolean;
// Busca a última data de troca de senha do usuário logado
function BuscarUltimaDataTrocaSenha(sUsuario: string): TDate;

implementation

uses frm_dm, frm_Inicial, frm_MsgErro, WebBrowser;

function BuscarUltimaDataTrocaSenha(sUsuario: string): TDate;
begin
   with dm.cdsAux6 do begin
      Active:= False;
      CommandText:= ' SELECT usu_data_troca_senha' +
                    ' FROM usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(sUsuario);
      Active:= True;

      Result:= FieldByName('usu_data_troca_senha').AsDateTime;
   end;
end;

function VerificarSenhaForte(sSenha: string): Boolean;
  var
   i: Integer;
   nContEsp, nContNum, nContMai, nContMin: Integer;
Const
   CharEspeciais    : set of Char = [#0..#255] - ['a'..'z','A'..'Z','0'..'9'];
   sNumeros         : set of Char = ['0'..'9'];
   sLetrasMaiusculas: set of Char = ['A'..'Z'];
   sLetrasMinusculas: set of Char = ['a'..'z'];
begin
   Result:= True;

   if BuscarParametro('senha_forte') = '1' then begin
      nContEsp:= 0;
      nContNum:= 0;
      nContMai:= 0;
      nContMin:= 0;

      for i:= 1 to Length(sSenha) do begin
         if sSenha[i] in CharEspeciais then begin
            nContEsp:= 1;
         end;
         if sSenha[i] in sNumeros then begin
            nContNum:= 1;
         end;
         if sSenha[i] in sLetrasMaiusculas then begin
            nContMai:= 1;
         end;
         if sSenha[i] in sLetrasMinusculas then begin
            nContMin:= 1;
         end;
      end;

      if nContEsp + nContNum + nContMai + nContMin < 4 then begin
         Application.MessageBox('A senha tem que ter pelo menos um número, uma letra maíuscula, uma letra minúscula e um caracter especial', 'Aviso', MB_OK + MB_ICONWARNING);
         Result:= False;
      end;
   end;
end;

function MudarSenha(): Boolean;
var
   nDiasTroca: Integer;
   dDataUltimaTroca: TDate;
begin
   // Projeto TT437 - Zanini
   Result:= False;

   if BuscarParametro('troca_senha') = '1' then begin
      nDiasTroca      := StrToInt(BuscarParametro('dias_troca_senha'));
      dDataUltimaTroca:= BuscarUltimaDataTrocaSenha(cUsuario);

      if (DateToStr(dDataUltimaTroca) = '30/12/1899') or
         (DateToStr(dDataUltimaTroca) = '') then begin // Data vazia
         Result:= True;
         Exit;
      end;

      if Date() - nDiasTroca > dDataUltimaTroca then begin
         Result:= True;
         Exit;
      end;
   end;
end;

function UltimoDiaDoMes(Data: TDate): string;
var
   wDia: Word;
   wMes: Word;
   wAno: Word;
begin
   DecodeDate(Data, wAno, wMes, wDia);
   if wMes in [1, 3, 5, 7, 8, 10, 12] then begin
      UltimoDiaDoMes:= '31';
   end;

   if wMes in [4, 6, 9, 11] then begin
      UltimoDiaDoMes:= '30';
   end;

   if wMes = 2 then begin
      if (wAno) mod 4 = 0 then begin
         UltimoDiaDoMes := '29';
      end
      else begin
         UltimoDiaDoMes := '28';
      end;
   end;


end;

function BuscarParametro(sNomeCampoParametro: string): string;
begin
   with dm.cdsAux4 do begin
      Active:= False;
      CommandText:= ' SELECT ' + sNomeCampoParametro +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName(sNomeCampoParametro).AsString;
   end;
end;

function BuscarParametroMotivoProc(): string;
begin
   // Projeto TT440
   with dm.cdsAux4 do begin
      Active:= False;
      CommandText:= ' SELECT filtro_motivo_processo' +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName('filtro_motivo_processo').AsString;
   end;
end;

function BuscarTextoRel(): string;
begin
   with dm.cdsAux4 do begin
      Active:= False;
      CommandText:= ' SELECT texto_cabec_rodape' +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName('texto_cabec_rodape').AsString;
   end;
end;

function VerificaPendIndicador(iMesAnterior: Integer): Boolean;
var
   iMes, iAno: Integer;
   sDataVerificacaoInd: string;
begin
   iMes:= StrToInt(Copy(IntToStr(iMesAnterior), 5,2));
   iAno:= StrToInt(Copy(IntToStr(iMesAnterior), 1,4));
   sDataVerificacaoInd:= BuscarParametroDiaIndicador();
   sDataVerificacaoInd:= ZerosEsquerda(sDataVerificacaoInd,2) + '/' +
                         ZerosEsquerda(IntToStr(iMes),2) + '/' +
                         IntToStr(iAno);

   if IncMonth(StrToDate(sDataVerificacaoInd)) <= Date() then begin
      Result:= True;
   end
   else begin
      Result:= False;
   end;
end;

function BuscarParametroDiaIndicador(): string;
begin
   // Projeto TT162
    with dm.cdsAux4 do begin
      Active:= False;
      CommandText:= ' SELECT dias_indicadores' +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName('dias_indicadores').AsString;
    end;
end;

function BuscarParametroEnvioGestor(): string;
begin
   with dm.cdsAux4 do begin
      Active:= False;
      CommandText:= ' SELECT enviogestor' +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName('enviogestor').AsString;
   end;
end;

function BuscarNomeColaborador(sUsuario: string): string;
begin
   if sUsuario = EmptyStr then begin
      Result:= '';
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_col ' +
                    ' FROM colaboradores' +
                    ' WHERE col_usuario = ' + QuotedStr(sUsuario);
      Active:= True;

      Result:= FieldByName('nome_col').AsString;
   end;
end;

function BuscarProcessoInd(sCodIndicador: string): string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT proc_ind ' +
                    ' FROM indicadores' +
                    ' WHERE codi_ind = ' + sCodIndicador;
      Active:= True;

      Result:= FieldByName('proc_ind').AsString;
   end;
end;

function BuscarGestorProcesso(sCodProcesso: string; sRetorno: string = 'Nome'): string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT C.codi_col, C.nome_col as Gestor ' +
                    ' FROM processos P' +
                    ' INNER JOIN colaboradores C ON C.codi_col = P.gest_pro' +
                    ' WHERE codi_pro = ' + sCodProcesso;
      Active:= True;

      if sRetorno = 'Nome' then begin
         Result:= FieldByName('Gestor').AsString;
      end;

      if sRetorno = 'Cod' then begin
         Result:= FieldByName('codi_col').AsString;
      end;
   end;
end;

procedure AtualizarGrid(dbGrid: TDBGrid);
begin
   dbGrid.Width:= dbGrid.Width + 1;
   dbGrid.Width:= dbGrid.Width - 1;
end;

function BuscarDataFiltroPMC(sTipo: string):Variant;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT data_filtro_pmc' +
                    ' FROM parametros';
      Active:= True;

      if sTipo = 'S' then begin // Retorno no formato String
         Result:= FieldByName('data_filtro_pmc').AsString;
      end
      else begin // Retorno no formato Data
         Result:= FieldByName('data_filtro_pmc').AsDateTime;
      end;
   end;
end;

procedure PrepararEmailAutoAcoes(sEmail: string; sDataVencida: string = 'S');
var
   sTextoNC, sTextoAcao: string;
   i: Integer;
   sTitulo: string;
begin
//   if VerificarConexaoInternet(True) then begin
      sTextoNC:= '';
      // Busca <Enter> na não conformidade para ajustar o envio de e-mail
      for i:= 1 to Length(dm.cdsAux5.FieldByName('ncon_pmc').AsString) do begin
         sTextoNC:= sTextoNC + dm.cdsAux5.FieldByName('ncon_pmc').AsString[i];

         if dm.cdsAux5.FieldByName('ncon_pmc').AsString[i] = #13 then begin
            sTextoNC:= sTextoNC + '<br>'
         end;
      end;

      sTextoNC:= StringReplace(sTextoNC, #$D, '', [rfReplaceAll]);
      sTextoNC:= StringReplace(sTextoNC, #$A, '', [rfReplaceAll]);
      sTextoNC:= StringReplace(sTextoNC, '#', '-', [rfReplaceAll, rfIgnoreCase]);
      sTextoNC:= StringReplace(sTextoNC, '&', 'e', [rfReplaceAll]);
      sTextoNC:= StringReplace(sTextoNC, '  ', ' ', [rfReplaceAll]);

      sTextoAcao:= '';
      // Busca <Enter> na descrição da Ação para ajustar o envio de e-mail
      for i:= 1 to Length(dm.cdsAux5.FieldByName('desc_aco').AsString) do begin
         sTextoAcao:= sTextoAcao + dm.cdsAux5.FieldByName('desc_aco').AsString[i];

         if dm.cdsAux5.FieldByName('desc_aco').AsString[i] = #13 then begin
            sTextoAcao:= sTextoAcao + '<br>'
         end;
      end;

      sTextoAcao:= StringReplace(sTextoAcao, #$D, '', [rfReplaceAll]);
      sTextoAcao:= StringReplace(sTextoAcao, #$A, '', [rfReplaceAll]);
      sTextoAcao:= StringReplace(sTextoAcao, '#', '-', [rfReplaceAll, rfIgnoreCase]);
      sTextoAcao:= StringReplace(sTextoAcao, '&', 'e', [rfReplaceAll]);
      sTextoAcao:= StringReplace(sTextoAcao, '  ', ' ', [rfReplaceAll]);

//      sTextoAcao:= Copy(sTextoAcao, 1, 500);

      if sDataVencida = 'S' then begin
         sTextoEmail:= 'O prazo para a Ação do PMC especificado abaixo está <b>vencido</b>: <br><br>' +
                       '<b>PMC:</b> ' + dm.cdsAux5.FieldByName('nume_pmc').AsString + '<br>' +
                       '<b>Data PMC:</b> ' + dm.cdsAux5.FieldByName('data_pmc').AsString + '<br>' +
//                       '<b>Não Conformidade:</b> ' + sTextoNC + '<br>' +
                       '<b>Descrição da Ação:</b> ' + sTextoAcao + '<br>' +
                       '<b>Prazo da Ação:</b> ' + dm.cdsAux5.FieldByName('aco_prazo').AsString +
                       '<br><br>'+
                       'Acesse o sistema Destra Manager para maiores detalhes.';

         sTitulo:= 'Ação de PMC vencida';
      end
      else begin
         sTextoEmail:= 'O prazo para a Ação do PMC especificado abaixo está vencendo em alguns dias: <br><br>' +
                       '<b>PMC:</b> ' + dm.cdsAux5.FieldByName('nume_pmc').AsString + '<br>' +
                       '<b>Data PMC:</b> ' + dm.cdsAux5.FieldByName('data_pmc').AsString + '<br>' +
//                       '<b>Não Conformidade:</b> ' + sTextoNC + '<br>' +
                       '<b>Descrição da Ação:</b> ' + sTextoAcao + '<br>' +
                       '<b>Prazo da Ação:</b> ' + dm.cdsAux5.FieldByName('aco_prazo').AsString +
                       '<br><br>'+
                       'Acesse o sistema Destra Manager para maiores detalhes.';

         sTitulo:= 'Ação de PMC com vencimento em breve';
      end;

      EnviarEmail(sTextoEmail, sTitulo, sEmail, 'sistema', 'N');
//   end;

end;

function BuscarEmail(sCodColaborador: string): string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT col_email ' +
                    ' FROM colaboradores' +
                    ' WHERE codi_col = ' + sCodColaborador;
      Active:= True;

      Result:= FieldByName('col_email').AsString;
   end;
end;

procedure PrepararEmailAutoPMC(sEmail: string; sDataVencida: string = 'S');
var
   sTextoNC: string;
   i: Integer;
   sTitulo: string;
begin
//   if VerificarConexaoInternet(True) then begin
      sTextoNC:= '';
      // Busca <Enter> na não conformidade para ajustar o envio de e-mail
      for i:= 1 to Length(dm.cdsAux2.FieldByName('ncon_pmc').AsString) do begin
         sTextoNC:= sTextoNC + dm.cdsAux2.FieldByName('ncon_pmc').AsString[i];

         if dm.cdsAux2.FieldByName('ncon_pmc').AsString[i] = #13 then begin
            sTextoNC:= sTextoNC + '<br>'
         end;
      end;

      sTextoNC:= StringReplace(sTextoNC, #$D, '', [rfReplaceAll]);
      sTextoNC:= StringReplace(sTextoNC, #$A, '', [rfReplaceAll]);
      sTextoNC:= StringReplace(sTextoNC, '#', '-', [rfReplaceAll, rfIgnoreCase]);
      sTextoNC:= StringReplace(sTextoNC, '&', 'e', [rfReplaceAll]);
      sTextoNC:= StringReplace(sTextoNC, '  ', ' ', [rfReplaceAll]);

      if sDataVencida = 'S' then begin
         sTextoEmail:= 'O PMC especificado abaixo está com a verificação de eficácia <b>vencida</b>: <br><br>' +
                       '<b>PMC:</b> ' + dm.cdsAux2.FieldByName('nume_pmc').AsString + '<br>' +
                       '<b>Data PMC:</b> ' + dm.cdsAux2.FieldByName('data_pmc').AsString + '<br>' +
                       '<b>Não Conformidade:</b> ' + sTextoNC + '<br>' +
                       '<b>Previsão de Verificação de Eficácia:</b> ' + dm.cdsAux2.FieldByName('pmc_preveficacia').AsString +
                       '<br><br>'+
                       'Acesse o sistema Destra Manager para maiores detalhes.';

         sTitulo:= 'Verificação de Eficácia de PMC vencida';
      end
      else begin
         sTextoEmail:= 'O PMC especificado abaixo está com a verificação de eficácia vencendo em alguns dias: <br><br>' +
                       '<b>PMC:</b> ' + dm.cdsAux2.FieldByName('nume_pmc').AsString + '<br>' +
                       '<b>Data PMC:</b> ' + dm.cdsAux2.FieldByName('data_pmc').AsString + '<br>' +
                       '<b>Não Conformidade:</b> ' + sTextoNC + '<br>' +
                       '<b>Previsão de Verificação de Eficácia:</b> ' + dm.cdsAux2.FieldByName('pmc_preveficacia').AsString +
                       '<br><br>'+
                       'Acesse o sistema Destra Manager para maiores detalhes.';

         sTitulo:= 'Verificação de Eficácia de PMC com vencimento em breve';
      end;

      EnviarEmail(sTextoEmail, sTitulo, sEmail, 'sistema', 'N');
//   end;
end;

procedure EnviarEmailAutomatico();
var
   sEmail: string;
begin
   if VerificarConexaoInternet(True) then begin
      with dm.cdsAux3 do begin
         Active:= False;
         CommandText:= ' SELECT email_pmc, aviso_pmc, nao_enviar_email_pmc' +
                       ' FROM parametros';
         Active:= True;
      end;

      if dm.cdsAux3.FieldByName('nao_enviar_email_pmc').AsInteger = 0 then begin  // Enviar e-mail PMC
      // Para a PH-FIT somente as ações devem ser enviadas para os responsáveis
      // As datas de eficácia são verificadas pela qualidade e não tem necessidade
//         // Verifica Eficácia de PMC
//         with dm.cdsAux2 do begin
//            Active:= False;
//            CommandText:= ' SELECT * FROM pmc' +
//                          ' WHERE pmc_fase < 6' + // Fase 6 -> Finalizado
//                          ' AND pmc_preveficacia notnull';
//            Active:= True;
//
//            First;
//
//            while not Eof do begin
//               sEmail:= BuscarEmail(dm.cdsAux2.FieldByName('resp_pmc').AsString);
//               // PMC Vencidos
//               // Verifica se a verificação de eficácia do PMC está vencendo hoje ou vencida
//               if dm.cdsAux2.FieldByName('pmc_preveficacia').AsDateTime <= Date() then begin
//                  // Verifica se já foi enviado a notificação do PMC dentro dos dias especificado em parâmetros
//                  with dm.cdsAux4 do begin
//                     Active:= False;
//                     CommandText:= ' SELECT aut_codpmc, aut_ultimo_envio' +
//                                   ' FROM pmc_email_auto' +
//                                   ' WHERE aut_codpmc = ' + dm.cdsAux2.FieldByName('codi_pmc').AsString;
//                     Active:= True;
//                  end;
//                  if dm.cdsAux4.RecordCount <= 0 then begin // Não encontrou registros do PMC
//                     // Manda o e-mail de aviso no primeiro vencimento da previsão de verificação de eficácia
//                     PrepararEmailAutoPMC(sEmail);
//                     Executar('INSERT INTO pmc_email_auto VALUES (' +
//                             dm.cdsAux2.FieldByName('codi_pmc').AsString + ',' +
//                             arrumaDataSQL(Date()) +
//                             ')');
//                  end
//                  else begin
//                     if dm.cdsAux3.FieldByName('email_pmc').AsInteger +
//                        dm.cdsAux4.FieldByName('aut_ultimo_envio').AsDateTime <= Date() then begin
//                        // Manda o e-mail de aviso a cada x dias depois do vencimento
//                        PrepararEmailAutoPMC(sEmail);
//
//                        Executar('UPDATE pmc_email_auto SET aut_ultimo_envio = ' +
//                        ArrumaDataSQL(Date()) +
//                        'WHERE aut_codpmc = ' + dm.cdsAux2.FieldByName('codi_pmc').AsString);
//                     end;
//                  end;
//               end
//               else begin
//                  // PMC não vencidos
//                  if dm.cdsAux2.FieldByName('pmc_preveficacia').AsDateTime -
//                     dm.cdsAux3.FieldByName('aviso_pmc').AsInteger = Date() then begin
//                     // Manda o e-mail de aviso x dias antes do vencimento da verificação de eficácia
//                     PrepararEmailAutoPMC(sEmail, 'N');
//                  end;
//               end;
//
//               Next;
//            end;
//         end;

         // Verifica Ações de PMC vencidas
         with dm.cdsAux5 do begin
            Active:= False;
            CommandText:= ' SELECT P.nume_pmc, P.data_pmc, P.ncon_pmc, P.pmc_preveficacia,' +
                          ' PA.codi_aco, PA.desc_aco, PA.resp_aco, PA.aco_prazo' +
                          ' FROM pmc P' +
                          ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = P.codi_pmc' +
                          ' WHERE pmc_fase < 6 AND PA.vimp_aco = ' + QuotedStr('') +
                          ' ORDER BY nume_pmc';
            Active:= True;

            First;

            while not Eof do begin
               sEmail:= BuscarEmail(dm.cdsAux5.FieldByName('resp_aco').AsString);
               // Ações Vencidas
               // Verifica se o prazo da ação está vencendo hoje ou vencida
               if dm.cdsAux5.FieldByName('aco_prazo').AsDateTime <= Date() then begin
                  // Verifica se já foi enviado a notificação da Ação dentro dos dias especificado em parâmetros
                  with dm.cdsAux4 do begin
                     Active:= False;
                     CommandText:= ' SELECT aut_codacao, aut_ultimo_envio' +
                                   ' FROM pmc_email_auto_acoes' +
                                   ' WHERE aut_codacao = ' + dm.cdsAux5.FieldByName('codi_aco').AsString;
                     Active:= True;
                  end;
                  if dm.cdsAux4.RecordCount <= 0 then begin // Não encontrou registros da Ação
                     // Manda o e-mail de aviso no primeiro vencimento da previsão de verificação de eficácia
                     PrepararEmailAutoAcoes(sEmail);
                     Executar('INSERT INTO pmc_email_auto_acoes VALUES (' +
                             dm.cdsAux5.FieldByName('codi_aco').AsString + ',' +
                             arrumaDataSQL(Date()) +
                             ')');
                  end
                  else begin
                     if dm.cdsAux3.FieldByName('email_pmc').AsInteger +
                        dm.cdsAux4.FieldByName('aut_ultimo_envio').AsDateTime <= Date() then begin
                        // Manda o e-mail de aviso a cada x dias depois do vencimento
                        PrepararEmailAutoAcoes(sEmail);

                        Executar('UPDATE pmc_email_auto_acoes SET aut_ultimo_envio = ' +
                                 ArrumaDataSQL(Date()) +
                                'WHERE aut_codacao = ' + dm.cdsAux5.FieldByName('codi_aco').AsString);
                     end;
                  end;
               end
               else begin
                  // PMC não vencidos
                  // Verifica se já foi mandado o e-mail para não enviar várias vezes no mesmo dia
                  with dm.cdsAux6 do begin
                     Active:= False;
                     CommandText:= ' SELECT aut_codacao' +
                                   ' FROM pmc_email_auto_acoes_nvenc' +
                                   ' WHERE aut_codacao = ' + dm.cdsAux5.FieldByName('codi_aco').AsString;
                     Active:= True;
                  end;
                  if dm.cdsAux6.RecordCount <= 0 then begin
                     if dm.cdsAux5.FieldByName('aco_prazo').AsDateTime -
                        dm.cdsAux3.FieldByName('aviso_pmc').AsInteger = Date() then begin
                        // Manda o e-mail de aviso x dias antes do vencimento do prazo da ação
                        PrepararEmailAutoAcoes(sEmail, 'N');
                        Executar('INSERT INTO pmc_email_auto_acoes_nvenc VALUES (' +
                                dm.cdsAux5.FieldByName('codi_aco').AsString + ')');
                     end;
                  end;
               end;

               Next;
            end;
         end;
      end;

      // Envio de aviso de Manutenção Preventiva
      // Busca os e-mails dos destinatários cadastrados em parâmetros
      with dm.cdsAux4 do begin
         Active:= False;
         CommandText:= ' SELECT par_codigo, par_tipo, par_colaborador, C.nome_col, C.col_email' +
                       ' FROM parametros_email_aviso' +
                       ' INNER JOIN colaboradores C ON C.codi_col = par_colaborador' +
                       ' WHERE par_tipo = ' + QuotedStr('M');
         Active:= True;

         sEmail:= '';
         First;
         while not Eof do begin
            sEmail:= sEmail + dm.cdsAux4.FieldByName('col_email').AsString + ',';
            Next;
         end;
      end;

      sEmail:= Copy(sEmail, 1, Length(sEmail) - 1);
      
      // Verifica se tem manutenção vencendo no prazo determinado no cadastro
      // de modelo de manutenção
      with dm.cdsAux3 do begin
         Active:= False;
         CommandText:= ' SELECT M.man_codigo, M.man_modelo, M.man_processo, M.man_datainicio, M.man_datafim,' +
                       '        M.man_horainicio, M.man_horafim, M.man_equipamento, MM.man_dias_aviso,' +
                       '        P.nome_pro as Processo, I.codi_inf || ' + QuotedStr(' - ') + ' || I.desc_inf as Equipamento' +
                       ' FROM manut M' +
                       ' INNER JOIN manut_modelo MM ON MM.man_codigo = M.man_modelo' +
                       ' INNER JOIN processos P ON P.codi_pro = M.man_processo' +
                       ' INNER JOIN infraestrutura I ON I.codi_inf = M.man_equipamento' + 
                       ' WHERE M.man_datainicio = CAST(' + ArrumadataSQL(Date()) + ' AS date) + MM.man_dias_aviso' +
                       '       AND man_email_enviado = ' + QuotedStr('N');
         Active:= True;

         First;
         while not Eof do begin
            PrepararEmailAutoManut(sEmail);
            // Marca a manutenção para não enviar mais e-mails
            Executar(' UPDATE manut set' +
                     ' man_email_enviado = ' + QuotedStr('S') +
                     ' WHERE man_codigo = ' + FieldByName('man_codigo').AsString);
            Next;
         end;
      end;

      // Envio de aviso de Calibração
      // Busca os e-mails dos destinatários cadastrados em parâmetros
      with dm.cdsAux4 do begin
         Active:= False;
         CommandText:= ' SELECT par_codigo, par_tipo, par_colaborador, C.nome_col, C.col_email' +
                       ' FROM parametros_email_aviso' +
                       ' INNER JOIN colaboradores C ON C.codi_col = par_colaborador' +
                       ' WHERE par_tipo = ' + QuotedStr('C');
         Active:= True;

         sEmail:= '';
         First;
         while not Eof do begin
            sEmail:= sEmail + dm.cdsAux4.FieldByName('col_email').AsString + ',';
            Next;
         end;
      end;

      sEmail:= Copy(sEmail, 1, Length(sEmail) - 1);

      // Verifica se tem manutenção vencendo no prazo determinado no cadastro
      // de infraestrutura
      with dm.cdsAux3 do begin
         Active:= False;
         CommandText:= ' SELECT cali_codigo, I.inf_diasaviso, cali_numero, cali_resolucao, cali_localizacao,' +
                       '        cali_frequencia, cali_faixa, cali_capacidade, cali_criterio,' +
                       '        cali_certificado, cali_datacalibracao, cali_proxcalibracao, cali_padroes,' +
                       '        cali_erro, cali_parecer, cali_processo, cali_arquivo, cali_incerteza,' +
                       '        cali_errototal, cali_aprovado, cali_equip, cali_obs, cali_unidade,' +
                       '        cali_numero || ' + QuotedStr(' - ') + ' || I.desc_inf as Equipamento,' +
                       '        P.nome_pro as Processo' +
                       ' FROM calibracao C' +
                       ' INNER JOIN infraestrutura I ON I.codi_inf = C.cali_equip' +
                       ' INNER JOIN processos P ON P.codi_pro = C.cali_processo' +
                       ' WHERE C.cali_proxcalibracao = CAST(' + ArrumadataSQL(Date()) + ' AS date) + I.inf_diasaviso' +
                       '       AND cali_email_enviado = ' + QuotedStr('N');
         Active:= True;

         First;
         while not Eof do begin
            PrepararEmailAutoCalib(sEmail);
            // Marca a calibração para não enviar mais e-mails
            Executar(' UPDATE calibracao set' +
                     ' cali_email_enviado = ' + QuotedStr('S') +
                     ' WHERE cali_codigo = ' + FieldByName('cali_codigo').AsString);
            Next;
         end;
      end;
   end;
end;

procedure PrepararEmailAutoManut(sEmail: string);
var
   sTitulo: string;
begin
   sTextoEmail:= 'Há uma manutenção preventiva programada: <br><br>' +
                 '<b>Data Início:</b> ' + dm.cdsAux3.FieldByName('man_datainicio').AsString + '<br>' +
                 '<b>Data Fim:</b> ' + dm.cdsAux3.FieldByName('man_datafim').AsString + '<br>' +
                 '<b>Processo:</b> ' + dm.cdsAux3.FieldByName('Processo').AsString + '<br>' +
                 '<b>Equipamento:</b> ' + dm.cdsAux3.FieldByName('Equipamento').AsString +
                 '<br><br>'+
                 'Acesse o sistema Destra Manager para maiores detalhes.';

   sTitulo:= 'Aviso de Manutenção Preventiva';

   EnviarEmail(sTextoEmail, sTitulo, sEmail, 'sistema', 'N');
end;

procedure PrepararEmailAutoCalib(sEmail: string);
var
   sTitulo: string;
begin
   sTextoEmail:= 'Há uma calibração a vencer: <br><br>' +
                 '<b>Data Calibração:</b> ' + dm.cdsAux3.FieldByName('cali_proxcalibracao').AsString + '<br>' +
                 '<b>Processo:</b> ' + dm.cdsAux3.FieldByName('Processo').AsString + '<br>' +
                 '<b>Equipamento:</b> ' + dm.cdsAux3.FieldByName('Equipamento').AsString + '<br>' +
                 '<b>Localização:</b> ' + dm.cdsAux3.FieldByName('cali_localizacao').AsString +
                 '<br><br>'+
                 'Acesse o sistema Destra Manager para maiores detalhes.';

   sTitulo:= 'Aviso de Calibração de Equipamento';

   EnviarEmail(sTextoEmail, sTitulo, sEmail, 'sistema', 'N');
end;

function BuscarDiasPendHab(): Integer;
begin
   with dm.cdsAux3 do begin
      Active:= False;
      CommandText:= ' SELECT primeiraavaliacao' +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName('primeiraavaliacao').AsInteger;
   end;
end;

function BuscarNotaMinimaHab(): string;
begin
   with dm.cdsAux3 do begin
      Active:= False;
      CommandText:= ' SELECT notapendencia' +
                    ' FROM parametros';
      Active:= True;

      Result:= FieldByName('notapendencia').AsString;
   end;
end;

procedure AtualizarStatusRNC(CodRNC: string; CodStatus: string);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE rnc SET' +
                    ' rnc_status = ' + CodStatus +
                    ' WHERE rnc_codigo = ' + CodRNC;
      Execute;
   end;
end;

procedure GravarHistoricoRNC(CodRNC: string; sHistorico: string; sDisposicao: string = ''; sMotivoRecusa: string = '');
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' INSERT INTO rnc_historico (his_codigo, rnc_codigo, his_data, ' +
                    ' his_historico, his_usuario, his_disposicao, his_motivo_recusa)' +
                    ' VALUES (' +
                    BuscarNovoCodigo('rnc_historico', 'his_codigo') + ',' +
                    QuotedStr(CodRNC) + ',' +
                    ArrumaDataSQL(Date()) + ',' +
                    QuotedStr(sHistorico) + ',' +
                    QuotedStr(cUsuario) + ',' +
                    QuotedStr(sDisposicao) + ',' +
                    QuotedStr(sMotivoRecusa) +
                    ')';
      Execute;
   end;
end;

function LiberarClienteForn(): Boolean;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT usu_desabilita_cliente_forn' +
                    ' FROM usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;

      Result:= FieldByName('usu_desabilita_cliente_forn').AsInteger = 1;
   end;
end;

function BuscarCodPMC(NumPMC: string): string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_pmc' +
                    ' FROM pmc' +
                    ' WHERE nume_pmc = ' + QuotedStr(NumPMC);
      Active:= True;

      if RecordCount > 0 then begin
         Result:= FieldByName('codi_pmc').AsString;
      end
      else begin
         Application.MessageBox(PChar('Houve um problema ao buscar o código do ' + NumPMC), 'Aviso', MB_OK + MB_ICONWARNING);
      end;

   end;
end;

procedure AbrirForm(ClasseForm: TComponentClass; Form: TForm; iTela: Integer = 0; CodRegistro: string = '');
begin
   Application.CreateForm(ClasseForm, Form);
   try
      if iTela > 0 then begin
         Form.Tag:= iTela;
         Form.HelpKeyword:= CodRegistro;
      end;
      Form.ShowModal;
      Form.Release;
   finally
      FreeAndNil(Form);
   end;
end;

function BuscarUltimaMetaIndicador(CodIndicador: string): string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT I.met_anomes, TC.valo_com || ' + QuotedStr(' ') +
                    ' || I.met_valor || ' + QuotedStr(' ') + ' || I.met_unidade as meta' +
                    ' FROM indicadores_metas I' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 17 AND TC.codi_com = I.met_tipo' +
                    ' WHERE met_codindicador = ' + CodIndicador +
                    ' ORDER BY I.met_anomes desc' +
                    ' LIMIT 1 ';
      Active:= True;

      if RecordCount > 0 then begin
         Result:= MesExtenso(Copy(FieldByName('met_anomes').AsString, 5,2), True) + '/' +
                  Copy(FieldByName('met_anomes').AsString, 1,4) +
                  ' - ' +  FieldByName('meta').AsString;
      end;
   end;
end;

procedure AbrePanel(panel: TPanel; tela: TForm);
begin
   (panel as TPanel).Top    := (tela as TForm).Height div 2 - (panel as TPanel).Height div 2;
   (panel as TPanel).Left   := (tela as TForm).Width div 2 - (panel as TPanel).Width div 2;
   (panel as TPanel).Visible:= True;
end;

procedure ExpExcel(dbGrid: TDBGrid; cds: TClientDataSet; Titulo: string; Form: TForm);
var linha, coluna: integer;
    planilha: variant;
    valorcampo: string;
    i: Integer;
    pAguarde: TPanel;
begin
   try
      pAguarde := TPanel.Create(Form);
      with pAguarde do begin
         Width := 300;
         Height:= 100;
         Parent:= Form;
         Caption:= 'Gerando arquivo Excel. Aguarde...';
      end;
      AbrePanel(pAguarde, Form);

      planilha:= CreateoleObject('Excel.Application');
      planilha.WorkBooks.add(1);
      planilha.Caption:= Titulo;
      planilha.Visible:= True;

      with dbGrid do begin
         // Grava os títulos da coluna
         coluna:= 0;
         for i := 0 to FieldCount - 1 do begin
            coluna:= coluna + 1;
            valorcampo:= Columns[i].Title.Caption;
            planilha.cells[2, coluna]:= valorCampo;
         end;

         // Grava os dados da grid vindos do dataset
         coluna:= 0;
         with cds do begin
            First;
            while not Eof do begin
               for coluna:= 0 to cds.FieldCount - 1 do begin
   //               ShowMessage(Fields.FieldByNumber(coluna + 2).AsString);
                  valorcampo:= Fields.FieldByNumber(coluna + 1).AsString;
                  planilha.cells[RecNo + 2, coluna + 1]:= valorCampo;
               end;

               Next;
            end;
         end;
      end;

   //    http://www.devmedia.com.br/capturando-informacoes-do-dataset-em-conjunto-com-dbgrid-em-delphi/25086

      planilha.columns.Autofit; // Ajusta o tamanho das colunas
   except
      
   end;

   pAguarde.Free;
end;

function RoundNExtend(ValorReal: Extended; Casas: Integer): Extended;

{ RoundN(123,456, 0) = 123,00
  RoundN(123,456, 2) = 123,46
  RoundN(123456, -3) = 123000 }

const
  t: array [0..12] of int64 = (1, 10, 100, 1000, 10000, 100000,
    1000000, 10000000, 100000000, 1000000000, 10000000000,
    100000000000, 1000000000000);

begin
  if Abs(Casas) > 12 then begin
     raise ERangeError.Create('RoundN: Value must be in -12..12');
  end;

  if Casas = 0 then begin
    Result := Int(ValorReal) + Int(Frac(ValorReal) * 2)
  end
  else begin
     if Casas > 0 then begin
        ValorReal := ValorReal * t[Casas];
        Result := (Int(ValorReal) + Int(Frac(ValorReal) * 2)) / t[Casas];
     end
     else begin  // Casas Negativas
        ValorReal := ValorReal / t[-Casas];
        Result := (Int(ValorReal) + Int(Frac(ValorReal) * 2)) * t[-Casas];
     end;
  end;
end;


function CalcularRisco(iConsequencia: Integer; iProbabilidade: Integer): string;
begin
   case iConsequencia of
      1: begin // Insignificante (Trivial)
         Result:= 'BAIXO';
      end;
      2: begin // Baixo (Minor)
         if iProbabilidade = 5 then begin
            Result:= 'BAIXO';
         end
         else if iProbabilidade = 1 then begin
            Result:= 'ALTO';
         end
         else if (iProbabilidade <= 4) and (iProbabilidade > 1) then begin
            Result:= 'MÉDIO';
         end;
      end;
      3: begin // Moderado (Moderate)
         if iProbabilidade <= 2 then begin
            Result:= 'ALTO';
         end
         else if iProbabilidade >= 3 then begin
            Result:= 'MÉDIO';
         end;
      end;
      4: begin // Grave (Major)
         if iProbabilidade = 1 then begin
            Result:= 'SEVERO';
         end
         else if (iProbabilidade >= 2) and (iProbabilidade <= 4) then begin
            Result:= 'ALTO';
         end
         else if iProbabilidade = 5 then begin
            Result:= 'MÉDIO';
         end;
      end;
      5: begin // Severo (Severe)
         if (iProbabilidade >= 1) and (iProbabilidade <= 3) then begin
            Result:= 'SEVERO';
         end
         else if iProbabilidade >= 4 then begin
            Result:= 'ALTO';
         end;
      end;
      else begin
         Result:= '';
      end;
   end;
end;

function CalculaCnpjCpf(Numero : String) : Boolean;
Var
   i,d,b,
   Digito : Byte;
   Soma : Integer;
   CNPJ : Boolean;
   DgPass,
   DgCalc : String;
begin
   Result:= False;
   Numero:= LimpaCPFCNPJ(Numero);
   // Caso o número não seja 11 (CPF) ou 14 (CNPJ), aborta
   Case Length(Numero) of
      11: CNPJ := False;
      14: CNPJ := True;
      else Exit;
   end;

   // Separa o número do digito
   DgCalc:= '';
   DgPass:= Copy(Numero,Length(Numero)-1,2);
   Numero:= Copy(Numero,1,Length(Numero)-2);

   // Calcula o digito 1 e 2
   For d := 1 to 2 do begin
      B:= IIF(D=1,2,3); // BYTE
      Soma := IIF(D=1,0,STRTOINTDEF(DGCALC,0) * 2);
      for i := Length(Numero) downto 1 do begin
         Soma := Soma + (Ord(Numero[I])-Ord('0'))* b;
         Inc(b);
         If (b > 9) And CNPJ then begin
            b:= 2;
         end;
      end;
      Digito:= 11 - Soma mod 11;
      if Digito >= 10 then begin
         Digito:= 0;
      end;
      DgCalc:= DgCalc + Chr(Digito + Ord('0'));
   end;
   Result:= DgCalc = DgPass;
end;

function IIf(pCond:Boolean;pTrue,pFalse:Variant): Variant;
begin
  If pCond Then begin
     Result := pTrue
  end
  else begin
     Result := pFalse;
  end;
end;

function ValidarDBLookup(CampoDBL: TDBLookupComboBox): Boolean;
begin
   if (CampoDBL as TDBLookupComboBox).KeyValue = -1 then begin
      Result:= False;
      Exit;
   end;

   if (CampoDBL as TDBLookupComboBox).KeyValue = Null then begin
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function BuscarNovoCodigoPDCA(): string;
var
   Aux: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(pdca_identificacao) AS UltCodigo FROM pdca ' +
                    ' WHERE pdca_identificacao like ' + QuotedStr('PDCA%');
      Active:= True;

     if FieldByName('UltCodigo').AsString = EmptyStr then begin
        Result:= 'PDCA0001';
     end
     else begin
        try
           Aux:= StrToInt(Copy(FieldByName('UltCodigo').AsString,5,4));
           Aux:= Aux + 1;
           Result:= 'PDCA' + StrZero(Aux,4);
        except
           Result:= 'PDCA0001';
        end;
     end;

   end;
end;

function ValidarCampos(sForm: TForm; sNomeComponente: string): Boolean;
var
   i: Integer;
begin
   // Limpa todos os edit da tela
//   for i:= 0 to sForm.ComponentCount - 1 do begin
//      if (sForm.Components[i] is TEdit) then begin
//         if (sForm.Components[i] as TEdit).Name = sNomeComponente then begin
//            if AllTrim((sForm.Components[i] as TEdit).Text) = EmptyStr then begin
//               Application.MessageBox(PChar('Campo ' + (sForm.Components[i] as TEdit).Name + ' é obrigatório'), 'Aviso', MB_OK + MB_ICONWARNING);
//               TryFocus((sForm.Components[i] is TEdit));
//               Result:= False;
//               Exit;
//            end;
//         end;
//      end;
//   end;

   Result:= True;
end;

function SubtrairAnoMes(anomes: string; meses: Integer): string;
var
   iAnoMes: integer;
   i: integer;
begin
   iAnoMes:= StrToInt(anomes);

   for i:= 1 to meses do begin
      iAnoMes:= iAnoMes - 1;

      if Copy(IntToStr(iAnoMes),5,2) = '00' then begin
         iAnoMes:= iAnoMes - 88;
      end;
   end;


   Result:= IntToStr(iAnoMes);
end;

function SomarAnoMes(anomes: string; meses: Integer): string;
var
   iAnoMes: integer;
   i: integer;
begin
   iAnoMes:= StrToInt(anomes);

   for i:= 1 to meses do begin
      iAnoMes:= iAnoMes + 1;

      if Copy(IntToStr(iAnoMes),5,2) = '13' then begin
         iAnoMes:= iAnoMes + 88;
      end;
   end;


   Result:= IntToStr(iAnoMes);
end;

function BuscarParametroConf(sTipo: string): string;
begin
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT rel_conf_cabec, rel_conf_rodap' +
                    ' FROM parametros';
      Active:= True;

      if sTipo = 'C' then begin
         Result:= FieldByName('rel_conf_cabec').AsString;
      end;

      if sTipo = 'R' then begin
         Result:= FieldByName('rel_conf_rodap').AsString;
      end;
   end;
end;

procedure Imprimir(nomeRelatorio: string; Report: TfrxReport; tipoImp: string;
                   sNomeVariavel1: string = ''; sValorVariavel1: string = '';
                   sNomeVariavel2: string = ''; sValorVariavel2: string = '';
                   sNomeVariavel3: string = ''; sValorVariavel3: string = '';
                   sNomeVariavel4: string = ''; sValorVariavel4: string = '';
                   sNomeVariavel5: string = ''; sValorVariavel5: string = '';
                   sNomeVariavel6: string = ''; sValorVariavel6: string = '';
                   sNomeVariavel7: string = ''; sValorVariavel7: string = '');
var
   i: integer;
begin
   with Report do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\' + nomeRelatorio + '.fr3');
      if sValorVariavel1 <> '' then begin
         Variables[sNomeVariavel1]:= QuotedStr(sValorVariavel1);
      end;
      if sValorVariavel2 <> '' then begin
         Variables[sNomeVariavel2]:= QuotedStr(sValorVariavel2);
      end;
      if sValorVariavel3 <> '' then begin
         Variables[sNomeVariavel3]:= QuotedStr(sValorVariavel3);
      end;
      if sValorVariavel4 <> '' then begin
         Variables[sNomeVariavel4]:= QuotedStr(sValorVariavel4);
      end;
      if sValorVariavel5<> '' then begin
         Variables[sNomeVariavel5]:= QuotedStr(sValorVariavel5);
      end;
      if sValorVariavel6 <> '' then begin
         Variables[sNomeVariavel6]:= QuotedStr(sValorVariavel6);
      end;
      if sValorVariavel7 <> '' then begin
         Variables[sNomeVariavel7]:= QuotedStr(sValorVariavel7);
      end;

      Variables['ConfCabec']:= BuscarParametroConf('C');
      Variables['ConfRod']  := BuscarParametroConf('R');
      Variables['TextoConf']:= QuotedStr(BuscarTextoRel());

      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
         PrintOptions.ShowDialog:= True; // Mostra a tela apra escolher impressora
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

procedure ExecutaDOS(Comando: string);
var
   SI: TStartupInfo;
   PI: TProcessInformation;
begin
   FillChar(SI, SizeOf(SI), 0);
   SI.cb := SizeOf(StartupInfo);
   SI.dwFlags := STARTF_USESHOWWINDOW;
   SI.wShowWindow := SW_HIDE;
   if CreateProcess(nil, PChar(Comando), nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then begin
      WaitForSingleObject(PI.hProcess, INFINITE);
   end;
end;

procedure Auditoria(cTabela, cDocto, cOperacao, cRevisao: String);
var
   iCodigo: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(CODI_AUD) AS NovoCodigo' +
                    ' FROM auditoria';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         iCodigo:= 1;
      end
      else begin
         iCodigo:= FieldByName('NovoCodigo').AsInteger + 1;
      end;
   end;

   if cOperacao = 'I' then begin
      cOperacao:= 'INCLUSÃO';
   end;
   if cOperacao = 'A' then begin
      cOperacao:= 'ALTERAÇÃO';
   end;
   if cOperacao = 'E' then begin
      cOperacao:= 'EXCLUSÃO';
   end;
   if cOperacao = 'R' then begin
      cOperacao:= 'RELATÓRIO';
   end;

   with dm.cdsAuditoria do begin
      Active:= False;
      CommandText:= ' INSERT INTO auditoria' +
                    ' (CODI_AUD, USER_AUD, DATA_AUD, TABE_AUD, DOCU_AUD, OPER_AUD, Revisao)' +
                    ' VALUES(' +
                    IntToStr(iCodigo) + ',' +
                    QuotedStr(cUsuario) + ',' +
                    ArrumaDataSQL(Now) + ',' +
                    QuotedStr(cTabela) + ',' +
                    QuotedStr(cDocto) + ',' +
                    QuotedStr(cOperacao) + ',' +
                    QuotedStr(cRevisao) +
                    ')';
      Execute;
   end;
end;

function BuscaCodigoTabelaCombos(Tipo:Integer; Valor:String): Integer;
begin
   with dm.cdsAuxiliar do
   begin
      Active:= False;
      CommandText:= ' Select codi_com from tabela_combos' +
                    ' where tipo_com = ' + IntToStr(Tipo) +
                    ' AND valo_com = ' + '''' + Valor + '''';
      Active:= True;
      Result:= FieldByName('codi_com').AsInteger;
   end;
end;

// Quando clicar no registro, carrega o valor texto no combo correspondente
function CarregaCombosGeral(Tipo:Integer; Combo: TObject; cds: TClientDataSet; Campo: String): Boolean;
begin
   Result:= True;
   try
      with dm.cdsAuxiliar do
      begin
         Active:= False;
         CommandText:= ' Select valo_com from tabela_combos' +
                       ' where tipo_com = ' + IntToStr(Tipo) +
                       ' AND codi_com = ' + '''' + (cds as TClientDataSet).FieldByName(Campo).AsString + '''';
         Active:= True;
         if RecordCount > 0 then
            (Combo as TComboBox).Text:= FieldByName('valo_com').AsString
         else
            Application.MessageBox('Erro no carregamento de registro !','Erro',MB_OK+MB_ICONEXCLAMATION);
      end;
   except
      Result:= False;
   end;
end;

// Carrega as opções no combo correspondente
function MontaCombosGeral(Tipo:Integer; Combo: TObject): Boolean;
begin
   Result:= True;

   with dm.cdsAuxiliar do
   begin
      Active:= False;
      CommandText:= ' SELECT valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = ' + '''' + IntToStr(Tipo) + '''' +
                    ' ORDER BY orde_com';
      Active:= True;

      (Combo as TComboBox).Items.Clear;
      while not Eof do
      begin
         (Combo as TComboBox).Items.Add(FieldByName('valo_com').AsString);
         Next;
      end;
   end;
end;

// Quando clicar no registro, carrega o valor texto no combo correspondente
function BuscaNomeFuncaoSistema(Codigo:Integer): String;
begin
   Result:= EmptyStr;
   try
      with dm.cdsAuxiliar do
      begin
         Active:= False;
         CommandText:= ' Select valo_com from tabela_combos' +
                       ' where tipo_com = 99' +
                       ' AND codi_com = ' + IntToStr(Codigo);
         Active:= True;

         if RecordCount > 0 then
            Result:= FieldByName('valo_com').AsString;
//         else
//            Application.MessageBox('Não há função do sistema cadastrada para esse código !','Erro',MB_OK+MB_ICONERROR);
      end;
   except
      on E: Exception  do begin
         Application.MessageBox(PChar('Erro no carregamento do valor' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
         Result:= EmptyStr;
      end;
   end;
end;

procedure MudaEdicao(Form : TForm; Sender: TObject; Key: Word);
begin
   if not (Sender is TComboBox) then begin
      case Key of
         VK_RETURN, VK_DOWN : Form.Perform(WM_NEXTDLGCTL, 0, 0);
         VK_UP : Form.Perform(WM_NEXTDLGCTL, 1, 0);
      end;
   end
   else begin
      case Key of
         VK_RETURN : Form.Perform(WM_NEXTDLGCTL, 0, 0);
      end;
   end;
end;

//function AcertaUpper(Key: Char): Char;
function AcertaUpper(Palavra: string): string;
var
  i: Integer;
begin
   for I := 1 to Length(Palavra) do begin
      if (Palavra[i] in ['ç','ã','õ','á','é','í','ó','ú','à','â','ê','ô']) then
      begin
        if (Palavra[i] = 'ç') then
           Palavra[i]:= 'Ç';
        if (Palavra[i] = 'ã') then
           Palavra[i]:= 'Ã';
        if (Palavra[i] = 'õ') then
           Palavra[i]:= 'Õ';
        if (Palavra[i] = 'á') then
           Palavra[i]:= 'Á';
        if (Palavra[i] = 'é') then
           Palavra[i]:= 'É';
        if (Palavra[i] = 'í') then
           Palavra[i]:= 'Í';
        if (Palavra[i] = 'ó') then
           Palavra[i]:= 'Ó';
        if (Palavra[i] = 'ú') then
           Palavra[i]:= 'Ú';
        if (Palavra[i] = 'à') then
           Palavra[i]:= 'À';
        if (Palavra[i] = 'â') then
           Palavra[i]:= 'Â';
        if (Palavra[i] = 'ê') then
           Palavra[i]:= 'Ê';
        if (Palavra[i] = 'ô') then
           Palavra[i]:= 'Ô';
     end
     else
       Palavra[i]:= UpCase(Palavra[i]);
   end;
   Result:= Palavra;
end;

function AcertaUpperLetra(Key: Char): Char;
begin
   if (Key in ['ç','ã','õ','á','é','í','ó','ú','à','â','ê','ô']) then
   begin
      if (Key = 'ç') then
         Key:= 'Ç';
      if (Key = 'ã') then
         Key:= 'Ã';
      if (Key = 'õ') then
         Key:= 'Õ';
      if (Key = 'á') then
         Key:= 'Á';
      if (Key = 'é') then
         Key:= 'É';
      if (Key = 'í') then
         Key:= 'Í';
      if (Key = 'ó') then
         Key:= 'Ó';
      if (Key = 'ú') then
         Key:= 'Ú';
      if (Key = 'à') then
         Key:= 'À';
      if (Key = 'â') then
         Key:= 'Â';
      if (Key = 'ê') then
         Key:= 'Ê';
      if (Key = 'ô') then
         Key:= 'Ô';
   end
   else
      Key:= UpCase(Key);

   Result:= Key;
end;

function MesExtenso(NumMes: string; Maiuscula: boolean): string;
var
   Extenso: string;
begin
   if NumMes = '' then
      NumMes:= '0';

   case StrToInt(NumMes) of
       1: Extenso:= 'Janeiro';
       2: Extenso:= 'Fevereiro';
       3: Extenso:= 'Março';
       4: Extenso:= 'Abril';
       5: Extenso:= 'Maio';
       6: Extenso:= 'Junho';
       7: Extenso:= 'Julho';
       8: Extenso:= 'Agosto';
       9: Extenso:= 'Setembro';
      10: Extenso:= 'Outubro';
      11: Extenso:= 'Novembro';
      12: Extenso:= 'Dezembro';
   end;

   if Maiuscula then begin
      Extenso:= UpperCase(Extenso);
      if StrToInt(NumMes) = 3 then begin
         Extenso:= 'MARÇO';
      end;

   end;

   Result:= Extenso;
end;

function SetScreenResolution(Width, Height: integer): Longint;
var
   DeviceMode: TDeviceMode;
begin
   with DeviceMode do begin
      dmSize := SizeOf(TDeviceMode);
      dmPelsWidth := Width;
      dmPelsHeight := Height;
      dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
   end;
   Result := ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

function ArrumaDataNumero(dData: TDateTime): Integer;
var
   wDia, wMes, wAno: Word;
begin
   DecodeDate(dData,wAno,wMes,wDia);

   Result:= StrToInt(FormatFloat('0000',wAno) +
                     FormatFloat('00',wMes) +
                     FormatFloat('00',wDia));
end;

function ArrumaDataSQL(dData: TDateTime): string;
var
   wDia, wMes, wAno: Word;
begin
   DecodeDate(dData,wAno,wMes,wDia);

   if DateToStr(dData) = '30/12/1899' then begin
      Result:= 'Null';
   end
   else begin
     Result:= QuotedStr(FormatFloat('0000',wAno) + '-' +
                        FormatFloat('00',wMes) + '-' +
                        FormatFloat('00',wDia));
   end;
end;

function ArrumaDataString(sData: string): string;
var
   sAno, sMes, sDia, sHora, sMin, sSeg: string;
//   wDia, wMes, wAno: Word;
begin
//   23/06/1976 15:15:00
   sAno:= Copy(sData,7,4);
   sMes:= Copy(sData,4,2);
   sDia:= Copy(sData,1,2);

   sHora:= Copy(sData,12,2);
   sMin := Copy(sData,15,2);
   sSeg := Copy(sData,18,2);

   Result:= QuotedStr(FormatFloat('0000',StrToInt(sAno)) + '-' +
                      FormatFloat('00',StrToInt(sMes)) + '-' +
                      FormatFloat('00',StrToInt(sDia)) + ' ' +
                      FormatFloat('00',StrToInt(sHora)) + ':' +
                      FormatFloat('00',StrToInt(sMin)) + ':' +
                      FormatFloat('00',StrToInt(sSeg)));

end;

function Centraliza(texto: string; num: Integer): string;
var
   iAux: string;
   iTam: Real;
   sRetorno: string;
begin
   iTam:= num - Length(texto);
   iAux:= FloatToStr(Int(iTam / 2));

   sRetorno:= Replic(' ',StrToInt(iAux)) + texto + Replic(' ',StrToInt(iAux));

   Result:= Copy(sRetorno,1,num);
end;

function Replic(caracter: string; numVezes: Integer): string;
var
   i: Integer;
   sRetorno: string;
begin
   for i := 1 to numVezes do
      sRetorno:= sRetorno + caracter;

   Result:= sRetorno;
end;

function PadR(texto: string; NumCaracteres: Integer): string;
var
   sTexto: string;
begin
   sTexto:= texto + Replic(' ',NumCaracteres - Length(texto));
   Result:= Copy(sTexto,1,NumCaracteres);
end;

function PadRc(texto: string; NumCaracteres: Integer; Caracter: string): string;
var
   sTexto: string;
begin
   sTexto:= texto + Replic(Caracter ,NumCaracteres - Length(texto));
   Result:= Copy(sTexto,1,NumCaracteres);
end;

function PadLc(texto: string; NumCaracteres: Integer; Caracter: string): string;
var
   sTexto: string;
begin
   sTexto:= Replic(Caracter ,NumCaracteres - Length(texto)) + texto ;
   Result:= sTexto;
end;

function Direita(texto: string; num: Integer): string;
var
   iAux: Integer;
//   iTam: Real;
   sRetorno: string;
begin
   iAux:= num - Length(texto);
//  iAux:= FloatToStr(Int(iTam));

   sRetorno:= Replic(' ',iAux) + texto;

   Result:= Copy(sRetorno,1,num);
end;

function AcertaLetras(Palavra: string): string;
var
   i: Integer;
begin
   for I := 1 to Length(Palavra) do begin
      if (Palavra[i] in ['Ç','Ã','Õ','Á','É','Í','Ó','Ú','À','Â','Ê','Ô','´']) then
      begin
         if (Palavra[i] = 'Ç') then
            Palavra[i]:= 'C';
         if (Palavra[i] = 'Ã') then
            Palavra[i]:= 'A';
         if (Palavra[i] = 'Õ') then
            Palavra[i]:= 'O';
         if (Palavra[i] = 'Á') then
            Palavra[i]:= 'A';
         if (Palavra[i] = 'É') then
            Palavra[i]:= 'E';
         if (Palavra[i] = 'Í') then
            Palavra[i]:= 'I';
         if (Palavra[i] = 'Ó') then
            Palavra[i]:= 'O';
         if (Palavra[i] = 'Ú') then
            Palavra[i]:= 'U';
         if (Palavra[i] = 'À') then
            Palavra[i]:= 'A';
         if (Palavra[i] = 'Â') then
            Palavra[i]:= 'A';
         if (Palavra[i] = 'Ê') then
            Palavra[i]:= 'E';
         if (Palavra[i] = 'Ô') then
            Palavra[i]:= 'O';
         if (Palavra[i] = '´') then
            Palavra[i]:= '''';
      end
      else
         Palavra[i]:= UpCase(Palavra[i]);
   end;
   Result:= Palavra;
end;

function AllTrim(Expressao: string): string;
begin
   Result:= TrimRight(TrimLeft(Expressao));
end;

procedure EscondeIniciar(Visible:Boolean);
Var
   taskbarhandle, buttonhandle : HWND;
begin
   taskbarhandle := FindWindow('Shell_TrayWnd', nil);
   buttonhandle := GetWindow(taskbarhandle, GW_CHILD);
   if Visible then begin
      ShowWindow(buttonhandle, SW_RESTORE) {mostra o botão}
   end
   else begin
      ShowWindow(buttonhandle, SW_HIDE); {esconde o botão}
   end;
end;

procedure SetTaskBar(Visible: Boolean);
var
   wndHandle : THandle;
   wndClass : array[0..50] of Char;
begin
   StrPCopy(@wndClass[0],'Shell_TrayWnd');
   wndHandle := FindWindow(@wndClass[0], nil);
   If Visible = True then
      ShowWindow(wndHandle, SW_RESTORE)
   else ShowWindow(wndHandle, SW_HIDE);
end;

function Acesso(Usuario: string; Funcao: Integer; Opcao: String; ExibeMsg: string = 'S'): Integer;
var
   DescFuncao: string;
begin
   with dm.cdsAcesso do begin
      Active:= False;
      CommandText:= ' SELECT ' + Opcao + ' FROM acessos' +
                    ' WHERE func_ace = ' + IntToStr(Funcao) + ' and usua_ace = ' + QuotedStr(Usuario);
      Active:= True;

      if Opcao = 'cadastro' then begin
         DescFuncao:= 'cadastrar o registro';
      end;
      if Opcao = 'alteracao' then begin
         DescFuncao:= 'alterar o registro';
      end;
      if Opcao = 'exclusao' then begin
         DescFuncao:= 'excluir o registro';
      end;
      if Opcao = 'acesso' then begin
         DescFuncao:= 'acessar a função.';
      end;
      if Opcao = 'especial2' then begin
         DescFuncao:= 'executar esta funcionalidade.';
      end;
      

      if FieldByName(Opcao).AsInteger = 0 then begin
         if ExibeMsg = 'S' then begin
            Application.MessageBox(PChar('Usuário ' + Usuario + ' não tem permissão para ' + DescFuncao),'Acesso negado',MB_OK + MB_ICONERROR);
         end;
      end;
      Result:= FieldByName(Opcao).AsInteger;
   end;
end;

function VirgulaParaPonto(valor: Real; casas: Integer; MantemVirgula: string = 'N'): string;
var
   posicaoPonto: Integer;
begin
   posicaoPonto:= Pos(',', FloatToStr(valor));

   if posicaoPonto = 0 then begin
      Result:= FloatToStr(valor)
   end
   else begin
      if MantemVirgula = 'S' then begin
         Result:= Copy(FloatToStr(valor), 1, posicaoPonto - 1) + ',' + Copy(FloatToStr(valor), posicaoPonto + 1, casas);
      end
      else begin
         Result:= Copy(FloatToStr(valor), 1, posicaoPonto - 1) + '.' + Copy(FloatToStr(valor), posicaoPonto + 1, casas);
      end;
   end;
end;

function AtualizaBanco(): Boolean;
var
   sComando: string;
   iNumAtualizacao: Integer;
   iUltimo: Integer;
   i: Integer;
   iContHab, iContTre: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'CREATE TABLE IF NOT EXISTS atualiza_banco (' +
                    'atu_codi INTEGER UNSIGNED NOT NULL COMMENT "Codigo de Controle das atualizacoes",' +
                    'atu_data TIMESTAMP NOT NULL DEFAULT 0 COMMENT "Data da Atualizacao",' +
                    'atu_desc VARCHAR(100) DEFAULT NULL COMMENT "Descricao da Atualizacao",' +
                    'PRIMARY KEY (atu_codi)' +
                    ')' +
                    'ENGINE = InnoDB;';
      Execute;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'CREATE TABLE IF NOT EXISTS auditoria_interna_rel_itens (' +
                    'dtpr_aud DATETIME NOT NULL COMMENT "Data do relatorio de auditoria",' +
                    'proc_ite INTEGER NOT NULL COMMENT "Processo",' +
                    'requ_ite VARCHAR(60) DEFAULT NULL COMMENT "Requisito da Norma",' +
                    'cont_ite TEXT COMMENT "Constatacoes e Evidencias",' +
                    'tipo_ite INTEGER COMMENT "Tipo de Constatacoes e Evidencias",' +
                    'PRIMARY KEY (dtpr_aud, proc_ite, requ_ite)' +
                    ')' +
                    'ENGINE = InnoDB;';
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
   iUltimo:= 259;
   //**********************************************

   for i := iNumAtualizacao to iUltimo do begin
      sComando:= EmptyStr;

      case i of
//         1: sComando:= 'ALTER TABLE manutencao ADD COLUMN efic_man VARCHAR(3) AFTER proc_man;';
//         2: sComando:= 'ALTER TABLE colab_treinamentos MODIFY COLUMN dtpr_tre VARCHAR(20) DEFAULT NULL;';
//         3: sComando:= 'ALTER TABLE colab_treinamentos MODIFY COLUMN dtre_tre VARCHAR(20) DEFAULT NULL;';
//         4: sComando:= 'ALTER TABLE parametros ADD COLUMN audit_interna_ja_fez CHAR NOT NULL;';
//         5: sComando:= 'UPDATE parametros SET audit_interna_ja_fez = "N";';
//         6: sComando:= 'CREATE TABLE IF NOT EXISTS auditoria_interna (' +
//                          'codi_aud INTEGER UNSIGNED NOT NULL,' +
//                          'proc_aud INTEGER UNSIGNED NOT NULL,' +
//                          'r41_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r422_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r423_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r424_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r51_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r52_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r53_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r541_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r542_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r551_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r552_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r553_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r56_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r61_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r621_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r622_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r63_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r64_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r71_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r721_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r722_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r723_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r73_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r74_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r751_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r752_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r753_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r754_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r755_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r76_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r821_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r822_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r823_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r824_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r83_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r84_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r851_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r852_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r853_aud TINYINT UNSIGNED NOT NULL,' +
//                          'audi_aud VARCHAR(80),' +
//                          'adtd_aud VARCHAR(80),' +
//                          'hora_aud VARCHAR(50),' +
//                          'data_aud VARCHAR(50),' +
//                          'PRIMARY KEY (codi_aud) )' +
//                          'ENGINE = InnoDB;';
////         7: PreencheAuditoria();
//         8: sComando:= 'UPDATE parametros SET audit_interna_ja_fez = "S";';
//         9: sComando:= 'ALTER TABLE colab_treinamentos MODIFY COLUMN dtpr_tre TIMESTAMP DEFAULT "0000-00-00 00:00";';
//        10: sComando:= 'ALTER TABLE colab_treinamentos MODIFY COLUMN dtre_tre TIMESTAMP DEFAULT "0000-00-00 00:00";';
//        // GravaIni('localhost');
//        11: sComando:= 'UPDATE tabela_combos SET valo_com = "PROGRAMA DE AUDITORIA" ' +
//                       ' WHERE tipo_com = 99 AND codi_com = 19';
//        12: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 20, "RELATÓRIO DE AUDITORIA", 20)';
//        13: GravaUsuarios('20');
//        14: sComando:= 'CREATE TABLE IF NOT EXISTS usuarios_processos ( ' +
//                       'usu_nome VARCHAR(45) NOT NULL, ' +
//                       'usu_proc INTEGER UNSIGNED NOT NULL, ' +
//                       'PRIMARY KEY (usu_nome, usu_proc)' +
//                       ')' +
//                       ' ENGINE = InnoDB;';
//        15: GravaUsuarios('21');
//        16: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 21, "CADASTRO DE PROCESSOS DE USUÁRIOS", 21)';
//        17: sComando:= 'ALTER TABLE valor_indicador MODIFY COLUMN valo_vin FLOAT DEFAULT NULL;';
//        18: sComando:= 'ALTER TABLE parametros ADD COLUMN contr VARCHAR(10);';
//        19: sComando:= 'UPDATE Parametros SET contr = ' + QuotedStr(Criptografar('01' + DateToStr(Date())));
//        20: sComando:= 'ALTER TABLE valor_indicador ADD COLUMN sequ_vin INTEGER UNSIGNED;';
//        21: AcertarSeqIndicadores();
////        22: sComando:= ' ALTER TABLE auditoria_interna CHANGE COLUMN codi_aud ano_aud INTEGER UNSIGNED NOT NULL DEFAULT 0, ' +
////                       ' DROP PRIMARY KEY, ' +
////                       ' ADD PRIMARY KEY  USING BTREE(ano_aud, proc_aud);';
//        23: sComando:= 'DELETE FROM auditoria_interna';
//        24: sComando:= 'ALTER TABLE colab_treinamentos ADD COLUMN codi_pla INTEGER UNSIGNED COMMENT "Codigo do Plano de Açao" AFTER dtre_tre;';
//        25: sComando:= 'ALTER TABLE colab_habilidades ADD COLUMN codi_pla INTEGER UNSIGNED COMMENT "Codigo do Plano de Açao" AFTER nota_hab;';
//        26: sComando:= 'CREATE TABLE IF NOT EXISTS auditoria_interna_rel (' +
//                       ' ano_aud INTEGER NOT NULL,' +
//                       ' tama_aud VARCHAR(100),' +
//                       ' norm_aud VARCHAR(100),' +
//                       ' audi_aud VARCHAR(100),' +
//                       ' adtd_aud VARCHAR(100),' +
//                       ' hora_aud VARCHAR(100),' +
//                       ' data_aud VARCHAR(100),' +
//                       ' esco_aud TEXT,' +
//                       ' real_aud TEXT,' +
//                       ' resu_aud TEXT,' +
//                       ' PRIMARY KEY (ano_aud)' +
//                       ' )' +
//                       ' ENGINE = InnoDB;';
//        27: sComando:= 'DROP TABLE auditoria_interna';
//        28: sComando:= 'CREATE TABLE IF NOT EXISTS auditoria_interna (' +
//                          'ano_aud INTEGER UNSIGNED NOT NULL,' +
//                          'proc_aud INTEGER UNSIGNED NOT NULL,' +
//                          'r41_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r422_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r423_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r424_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r51_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r52_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r53_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r541_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r542_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r551_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r552_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r553_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r56_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r61_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r621_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r622_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r63_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r64_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r71_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r721_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r722_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r723_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r73_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r74_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r751_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r752_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r753_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r754_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r755_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r76_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r821_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r822_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r823_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r824_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r83_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r84_aud  TINYINT UNSIGNED NOT NULL,' +
//                          'r851_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r852_aud TINYINT UNSIGNED NOT NULL,' +
//                          'r853_aud TINYINT UNSIGNED NOT NULL,' +
//                          'PRIMARY KEY (ano_aud, proc_aud) )' +
//                          'ENGINE = InnoDB;';
//        29: sComando:= ' ALTER TABLE auditoria_interna CHANGE COLUMN ano_aud data_aud DATETIME NOT NULL DEFAULT 0,' +
//                       ' DROP PRIMARY KEY, '+
//                       ' ADD PRIMARY KEY  USING BTREE(data_aud, proc_aud);';
//        30: sComando:= ' ALTER TABLE auditoria_interna_rel CHANGE COLUMN ano_aud dtpr_aud DATETIME NOT NULL DEFAULT 0,' +
//                       ' DROP PRIMARY KEY, '+
//                       ' ADD PRIMARY KEY  USING BTREE(dtpr_aud);';
//        31: sComando:= ' ALTER TABLE usuarios ADD COLUMN proc_usu VARCHAR(1) NOT NULL;';
//        32: sComando:= ' UPDATE usuarios SET proc_usu = 0;';
//        33: sComando:= ' ALTER TABLE formularios MODIFY COLUMN revi_for VARCHAR(20) DEFAULT NULL COMMENT "Revisao do Formulario";';
//        34: sComando:= ' ALTER TABLE indicadores ADD COLUMN peri_ind INTEGER UNSIGNED COMMENT "Periodicidade do indicador";';
////        35: sComando:= ' ALTER TABLE indicadores ADD COLUMN peri_ind INTEGER UNSIGNED COMMENT "Periodicidade do indicador";';
//        36: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 22, "IQF", 22)';
//        37: GravaUsuarios('22');
//        38: sComando:= 'CREATE TABLE iqf (' +
//                       ' iqf_codigo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,' +
//                       ' iqf_anomes VARCHAR(6),' +
//                       ' iqf_avaliacao FLOAT,' +
//                       ' iqf_nomeFornecedor VARCHAR(80),' +
//                       ' iqf_remessa FLOAT,' +
//                       ' iqf_pontual FLOAT,' +
//                       ' iqf_conforme FLOAT,' +
//                       'PRIMARY KEY (iqf_codigo)' +
//                       ' )' +
//                       ' ENGINE = InnoDB;';
//
//        39: sComando:= ' CREATE TABLE calibracao (' +
//                       ' cali_codigo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,' +
//                       ' cali_numero VARCHAR(10),' +
//                       ' cali_equipamento VARCHAR(50),' +
//                       ' cali_resolucao VARCHAR(30),' +
//                       ' cali_localizacao VARCHAR(50),' +
//                       ' cali_frequencia VARCHAR(20),' +
//                       ' cali_faixa VARCHAR(30),' +
//                       ' cali_capacidade VARCHAR(30),' +
//                       ' cali_criterio VARCHAR(30),' +
//                       ' cali_certificado VARCHAR(30),' +
//                       ' cali_dataCalibracao DATETIME,' +
//                       ' cali_proxCalibracao DATETIME,' +
//                       ' cali_padroes TEXT,' +
//                       ' cali_erro VARCHAR(30),' +
//                       ' cali_parecer VARCHAR(1),' +
//                       ' PRIMARY KEY (cali_codigo)' +
//                       ' )' +
//                       ' ENGINE = InnoDB;';
//        40: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 23, "TABELA DE CALIBRAÇÃO", 23)';
//        41: GravaUsuarios('23');
//        42: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 24, "RESUMO DOS INDICADORES", 24)';
//        43: GravaUsuarios('24');
//        44: sComando:= 'ALTER TABLE valor_indicador MODIFY COLUMN valo_vin DECIMAL(18,6) DEFAULT NULL;';
//        45: sComando:= ' CREATE TABLE fornecedores (' +
//                       ' forn_codigo INTEGER UNSIGNED NOT NULL,' +
//                       ' forn_nome VARCHAR(80) NULL,' +
//                       ' PRIMARY KEY(forn_codigo)' +
//                       ' )' +
//                       ' ENGINE = InnoDB;';
//        46: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 25, "CADASTRO DE FORNECEDORES", 25)';
//        47: GravaUsuarios('25');
//        48: sComando:= 'ALTER TABLE fornecedores ADD COLUMN forn_endereco VARCHAR(50), ' +
//                       '                         ADD COLUMN forn_numero VARCHAR(6), ' +
//                       '                         ADD COLUMN forn_bairro VARCHAR(40), ' +
//                       '                         ADD COLUMN forn_cidade VARCHAR(50), ' +
//                       '                         ADD COLUMN forn_estado VARCHAR(2), ' +
//                       '                         ADD COLUMN forn_cep VARCHAR(9), ' +
//                       '                         ADD COLUMN forn_avaliacao FLOAT;';
//        49: sComando:= 'INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
//                       ' VALUES (99,"FUNÇÕES DO SISTEMA", 26, "LOG DE USUÁRIOS", 26)';
//        50: GravaUsuarios('26');
//        51: sComando:= ' CREATE TABLE Colab_Educacao (' +
//                       ' edu_codigo int(10) unsigned NOT NULL auto_increment COMMENT "Codigo autoincremento",' +
//                       ' edu_colaborador int(10) unsigned NOT NULL default "0" COMMENT "Codigo do Colaborador",' +
//                       ' edu_de varchar(7) default "" COMMENT "Periodo de Estudo (de)",' +
//                       ' edu_ate varchar(7) default "" COMMENT "Periodo de Estudo (ate)",' +
//                       ' edu_grau int(10) default "0" COMMENT "Grau de Instrução",' +
//                       ' edu_escola varchar(50) default "" COMMENT "Escola em que estudou",' +
//                       ' edu_anexo varchar(150) default "" COMMENT "Anexo do certificado",' +
//                       ' PRIMARY KEY (edu_codigo)' +
//                       ') ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT="Cadastro do histórico de educação do colaborador";';
//
//        52: sComando:= ' UPDATE tabela_combos set valo_com = "3 ANOS"' +
//                       ' WHERE tipo_com = 7 AND codi_com = 4;';
//        53: sComando:= ' UPDATE tabela_combos set valo_com = "ACIMA DE 3 ANOS"' +
//                       ' WHERE tipo_com = 7 AND codi_com = 5;';
//        54: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                       ' VALUES(6, "EDUCAÇÃO - FUNÇÕES", 10, "MESTRADO", 1)';
//        55: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                       ' VALUES(6, "EDUCAÇÃO - FUNÇÕES", 9, "DOUTORADO", 2)';
//        56: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                       ' VALUES(6, "EDUCAÇÃO - FUNÇÕES", 8, "PÓS GRADUAÇÃO", 3)';
//        57: sComando:= ' UPDATE tabela_combos set orde_com = 4' +
//                       ' WHERE tipo_com = 6 AND codi_com = 1;';
//        58: sComando:= ' UPDATE tabela_combos set orde_com = 5' +
//                       ' WHERE tipo_com = 6 AND codi_com = 2;';
//        59: sComando:= ' UPDATE tabela_combos set orde_com = 6' +
//                       ' WHERE tipo_com = 6 AND codi_com = 3;';
//        60: sComando:= ' UPDATE tabela_combos set orde_com = 7' +
//                       ' WHERE tipo_com = 6 AND codi_com = 4;';
//        61: sComando:= ' UPDATE tabela_combos set orde_com = 8' +
//                       ' WHERE tipo_com = 6 AND codi_com = 5;';
//        62: sComando:= ' UPDATE tabela_combos set orde_com = 9' +
//                       ' WHERE tipo_com = 6 AND codi_com = 6;';
//        63: sComando:= ' UPDATE tabela_combos set orde_com = 10' +
//                       ' WHERE tipo_com = 6 AND codi_com = 7;';
//        64: sComando:= ' CREATE TABLE iqf_remessa (' +
//                       ' iqf_codigo        int(10) unsigned NOT NULL auto_increment,' +
//                       ' iqf_data          datetime default NULL,' +
//                       ' iqf_CodFornecedor int(10) unsigned default NULL,' +
//                       ' iqf_pontual       int(10) unsigned default NULL,' +
//                       ' iqf_conforme      int(10) unsigned default NULL,' +
//                       ' iqf_NF            varchar(20) default NULL,' +
//                       ' iqf_responsavel   int(10) unsigned default NULL,' +
//                       ' PRIMARY KEY (iqf_codigo)' +
//                       ')  ENGINE=InnoDB DEFAULT CHARSET=latin1;';
//        65: sComando:= 'ALTER TABLE fornecedores ADD COLUMN forn_obs TEXT,' +
//                       '                         ADD COLUMN forn_fantasia VARCHAR(50),' +
//                       '                         ADD COLUMN forn_fone VARCHAR(20),' +
//                       '                         ADD COLUMN forn_CNPJ VARCHAR(20),' +
//                       '                         ADD COLUMN forn_inscEst VARCHAR(20),' +
//                       '                         ADD COLUMN forn_validade DATETIME,' +
//                       '                         ADD COLUMN forn_area VARCHAR(50),' +
//                       '                         ADD COLUMN forn_contato VARCHAR(30),' +
//                       '                         ADD COLUMN forn_mail VARCHAR(50);';
//        66: sComando:= ' ALTER TABLE analise_acoes MODIFY COLUMN said_aac TEXT ' +
//                       ' CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL;';
//        67: sComando:= ' ALTER TABLE pmc_acoes ADD COLUMN arqu_aco VARCHAR(200);';
//        68: sComando:= ' ALTER TABLE calibracao ADD COLUMN cali_processo INTEGER UNSIGNED;';
//        69: sComando:= ' ALTER TABLE analise_acoes ADD COLUMN dcad_aac DATETIME;';
//        70: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
//                       ' VALUES(6, "EDUCAÇÃO - FUNÇÕES", 11, "NENHUMA", 11)';
//        71: sComando:= ' ALTER TABLE colaboradores ADD COLUMN obs_col TEXT;';
//        72: sComando:= ' ALTER TABLE usuarios ADD COLUMN Analise CHAR(1),' +
//                       '                      ADD COLUMN Indicadores CHAR(1),' +
//                       '                      ADD COLUMN Procedimentos CHAR(1),' +
//                       '                      ADD COLUMN Registros CHAR(1),' +
//                       '                      ADD COLUMN AcaoCorretiva CHAR(1),' +
//                       '                      ADD COLUMN Infraestrutura CHAR(1),' +
//                       '                      ADD COLUMN Manutencao CHAR(1),' +
//                       '                      ADD COLUMN Matriz CHAR(1)';
//        73: begin
//           with dm.cdsColaboradores do begin
//              Active:= False;
//              CommandText:= ' SELECT * FROM Colaboradores';
//              Active:= True;
//              First;
//
//              while not Eof do begin
//                 with dm.cdsAux do begin
//                    Active:= False;
//                    CommandText:= ' SELECT COUNT(*) as Qtd FROM colab_habilidades' +
//                                  ' WHERE codi_col = ' + dm.cdsColaboradorescodi_col.AsString;
//                    Active:= True;
//                    iContHab:= FieldByName('Qtd').AsInteger;
//                 end;
//
//                 with dm.cdsAux do begin
//                    Active:= False;
//                    CommandText:= ' SELECT COUNT(*) as Qtd FROM colab_treinamentos' +
//                                  ' WHERE codi_col = ' + dm.cdsColaboradorescodi_col.AsString;
//                    Active:= True;
//                    iContTre:= FieldByName('Qtd').AsInteger;
//                 end;
//
//                 if iContHab + iContTre = 0 then begin
//                    GravaAtributos(dm.cdsColaboradorescodi_col.AsInteger, dm.cdsColaboradoresfunc_col.AsInteger);
//                 end;
//
//                 Next;
//              end;
//           end;
//        end;
//        74: sComando:= 'ALTER TABLE auditoria_interna_rel ADD COLUMN repr_aud INTEGER UNSIGNED;';
//        75: sComando:= ' CREATE TABLE IF NOT EXISTS requisitos (' +
//                        '  req_codigo VARCHAR(3) NOT NULL,' +
//                        '  req_descricao VARCHAR(50) NOT NULL,' +
//                        '  PRIMARY KEY (req_codigo)' +
//                        ')ENGINE = InnoDB;';
//        76: sComando:= ' INSERT INTO Requisitos VALUES ("4.1","Requisitos gerais");' +
//                       ' INSERT INTO Requisitos VALUES ("4.2","Requisitos de documentação");' +
//                       ' INSERT INTO Requisitos VALUES ("5.1","Comprometimento da direção");' +
//                       ' INSERT INTO Requisitos VALUES ("5.2","Foco no cliente");' +
//                       ' INSERT INTO Requisitos VALUES ("5.3","Política da qualidade");' +
//                       ' INSERT INTO Requisitos VALUES ("5.4","Planejamento");' +
//                       ' INSERT INTO Requisitos VALUES ("5.5","Responsabilidade, autoridade e comunicação");' +
//                       ' INSERT INTO Requisitos VALUES ("5.6","Análise Crítica pela direção");' +
//                       ' INSERT INTO Requisitos VALUES ("6.1","Provisão de recursos");' +
//                       ' INSERT INTO Requisitos VALUES ("6.2","Recursos humanos");' +
//                       ' INSERT INTO Requisitos VALUES ("6.3","Infra-estrutura");' +
//                       ' INSERT INTO Requisitos VALUES ("6.4","Ambiente de trabalho");' +
//                       ' INSERT INTO Requisitos VALUES ("7.1","Planejamento da realização do produto");' +
//                       ' INSERT INTO Requisitos VALUES ("7.2","Processos relacionados a clientes");' +
//                       ' INSERT INTO Requisitos VALUES ("7.3","Projeto e desenvolvimento");' +
//                       ' INSERT INTO Requisitos VALUES ("7.4","Aquisição");' +
//                       ' INSERT INTO Requisitos VALUES ("7.5","Produção e fornecimento de serviço");' +
//                       ' INSERT INTO Requisitos VALUES ("7.6","Controle de equipamentos de medição e ensaios");' +
//                       ' INSERT INTO Requisitos VALUES ("8.2","Medição e monitoramento");' +
//                       ' INSERT INTO Requisitos VALUES ("8.3","Controle de produção não conforme");' +
//                       ' INSERT INTO Requisitos VALUES ("8.4","Análise de dados");' +
//                       ' INSERT INTO Requisitos VALUES ("8.5","Melhorias");';
//        77: sComando:= ' CREATE TABLE IF NOT EXISTS manutencao_fecha (' +
//                       ' fec_codigo INTEGER UNSIGNED NOT NULL,' +
//                       ' man_codigo INTEGER UNSIGNED,' +
//                       ' fec_quem INTEGER UNSIGNED,' +
//                       ' fec_onde INTEGER UNSIGNED,' +
//                       ' fec_data_realizado DATETIME,' +
//                       ' fec_anomalias TEXT,' +
//                       '   PRIMARY KEY (fec_codigo)' +
//                       ' ) ENGINE = InnoDB;';
//        78: sComando:= ' UPDATE Usuarios SET ' +
//                       ' Analise = 1,' +
//                       ' Indicadores = 1,' +
//                       ' Procedimentos = 1,' +
//                       ' Registros = 1,' +
//                       ' AcaoCorretiva = 1,' +
//                       ' InfraEstrutura = 1,' +
//                       ' Manutencao = 1,' +
//                       ' Matriz = 1';
//        79: AcertarAtributos();
//        80: sComando:= ' ALTER TABLE calibracao ADD COLUMN cali_arquivo VARCHAR(150);';
//        81: sComando:= ' ALTER TABLE fornecedores MODIFY COLUMN forn_codigo VARCHAR(8) NOT NULL;';
//        82: sComando:= ' UPDATE Fornecedores SET forn_codigo = LPAD(forn_codigo,"8","0")';
//        83: sComando:= ' ALTER TABLE iqf_remessa MODIFY COLUMN iqf_CodFornecedor VARCHAR(8) DEFAULT NULL;';
//        84: sComando:= ' ALTER TABLE infraestrutura MODIFY COLUMN tipo_inf INTEGER UNSIGNED DEFAULT 0, ' +
//                       ' MODIFY COLUMN qtde_inf INTEGER UNSIGNED DEFAULT 0,' +
//                       ' MODIFY COLUMN desc_inf VARCHAR(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci ,' +
//                       ' MODIFY COLUMN seto_inf INTEGER UNSIGNED DEFAULT 0 ,' +
//                       ' MODIFY COLUMN iden_inf VARCHAR(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 0 ,' +
//                       ' MODIFY COLUMN proc_inf INTEGER UNSIGNED DEFAULT 0 ,' +
//                       ' MODIFY COLUMN manu_inf CHAR(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci;';
//        85: sComando:= ' ALTER TABLE colaboradores ADD COLUMN col_status VARCHAR(1);';
//        86: sComando:= ' UPDATE colaboradores SET col_status = "1" ';
//        87: sComando:= ' ALTER TABLE fornecedores ADD COLUMN forn_certificado VARCHAR(100);';
//        88: sComando:= ' ALTER TABLE analise_acoes ADD COLUMN aac_resultados TEXT;';
//        89: sComando:= ' ALTER TABLE auditoria MODIFY COLUMN tabe_aud VARCHAR(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT "Tabela alvo da ação";';
//        90: sComando:= ' ALTER TABLE valor_indicador MODIFY COLUMN obse_vin TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL;';
//        91: sComando:= ' ALTER TABLE auditoria_interna_rel_itens DROP PRIMARY KEY';
//        92: sComando:= ' ALTER TABLE usuarios ADD COLUMN AprovaDoc CHAR(1);';
//        93: sComando:= ' ALTER TABLE auditoria MODIFY COLUMN oper_aud VARCHAR(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT "Açao realizada";';
//        94: sComando:= ' ALTER TABLE fornecedores MODIFY COLUMN forn_certificado VARCHAR(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL;';
//        95: sComando:= ' CREATE TABLE IF NOT EXISTS lista_mestra_proc ( ' +
//                       '   lis_codiProcesso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,' +
//                       '   lis_codiDocumento INTEGER UNSIGNED NOT NULL,' +
//                       '   lis_qtd INTEGER UNSIGNED,' +
//                       '   PRIMARY KEY (lis_codiProcesso, lis_codiDocumento)' +
//                       ' )' +
//                       ' ENGINE = InnoDB;';
//        96: IncluiProcessoListaMestra();
//        97: sComando:= ' ALTER TABLE auditoria ADD COLUMN revisao VARCHAR(45);';
//        98: sComando:= ' ALTER TABLE auditoria MODIFY COLUMN docu_aud VARCHAR(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT "Registro alvo da açao";';
//        99: sComando:= ' ALTER TABLE pmc ADD COLUMN pmc_dataFecha DATETIME;';
//        100: sComando:= ' ALTER TABLE auditoria MODIFY COLUMN oper_aud VARCHAR(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT "Açao realizada";';
        101: sComando:= ' ALTER TABLE lista_mestra MODIFY COLUMN arqu_lis TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT "Caminho fisico do arquivo";';
        102: sComando:= ' ALTER TABLE iqf_remessa ADD COLUMN iqf_obs TEXT;';
        103: sComando:= ' ALTER TABLE fornecedores MODIFY COLUMN forn_area TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL;';
        104: sComando:= ' ALTER TABLE colab_treinamentos ADD COLUMN tipo_tre CHAR(1);';
        105: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES(6, "EDUCAÇÃO - FUNÇÕES", 12, "TÉCNICO INCOMPLETO", 8)';
        106: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES(6, "EDUCAÇÃO - FUNÇÕES", 13, "PÓS GRADUAÇÃO INCOMPLETO", 4)';
        107: sComando:= ' UPDATE tabela_combos set orde_com = 9' +
                        ' WHERE tipo_com = 6 AND codi_com = 4;';
        108: sComando:= ' UPDATE tabela_combos set orde_com = 10' +
                        ' WHERE tipo_com = 6 AND codi_com = 5;';
        109: sComando:= ' UPDATE tabela_combos set orde_com = 11' +
                        ' WHERE tipo_com = 6 AND codi_com = 6;';
        110: sComando:= ' UPDATE tabela_combos set orde_com = 12' +
                        ' WHERE tipo_com = 6 AND codi_com = 7;';
        111: sComando:= ' UPDATE tabela_combos set orde_com = 13' +
                        ' WHERE tipo_com = 6 AND codi_com = 11;';
        112: sComando:= ' UPDATE tabela_combos set orde_com = 5' +
                        ' WHERE tipo_com = 6 AND codi_com = 1;';
        113: sComando:= ' UPDATE tabela_combos set orde_com = 6' +
                        ' WHERE tipo_com = 6 AND codi_com = 2;';
        114: sComando:= ' UPDATE tabela_combos set orde_com = 7' +
                        ' WHERE tipo_com = 6 AND codi_com = 3;';
        115: sComando:= ' ALTER TABLE colab_habilidades ADD COLUMN hab_ano VARCHAR(4) NOT NULL , ' +
                        ' DROP PRIMARY KEY,' +
                        ' ADD PRIMARY KEY  USING BTREE(codi_col, codi_hab, hab_ano);';
        116: sComando:= ' ALTER TABLE lista_mestra_proc ADD COLUMN lis_novo VARCHAR(1) COMMENT "Indica se o documento foi aberto na tela de tartaruga do processo" AFTER lis_qtd;';
        117: sComando:= ' ALTER TABLE colaboradores ADD COLUMN col_avaliador VARCHAR(50) COMMENT "Avaliador das habilidades do colaborador";';

        118: sComando:= ' ALTER TABLE fornecedores MODIFY COLUMN forn_area TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL;';
        119: sComando:= ' ALTER TABLE lista_mestra MODIFY COLUMN arqu_lis TEXT CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT "Caminho fisico do arquivo";';
        120: sComando:= ' UPDATE colab_habilidades SET hab_ano = "2013"';

        121: sComando:= ' CREATE TABLE IF NOT EXISTS laaia (' +
                        '  lai_numAspecto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,' +
                        '  lai_atividade VARCHAR(80) NULL,' +
                        '  lai_aspecto INTEGER UNSIGNED NULL,' +
                        '  lai_impacto INTEGER UNSIGNED NULL,' +
                        '  lai_condicao INTEGER UNSIGNED NULL,' +
                        '  lai_processo INTEGER UNSIGNED NULL,' +
                        '  lai_frequencia INTEGER UNSIGNED NULL,' +
                        '  lai_gravidade INTEGER UNSIGNED NULL,' +
                        '  lai_controle VARCHAR(60) NULL,' +
                        '  lai_pmc VARCHAR(15) NULL,' +
                        '  lai_atualizacao DATE NULL,' +
                        '  lai_aprovado VARCHAR(50) NULL,' +
                        '  lai_eficaz VARCHAR(3) NULL,' +
                        '  PRIMARY KEY(lai_numAspecto)' +
                        ');';
        122: sComando:= ' CREATE TABLE IF NOT EXISTS aspectos_ambientais (' +
                        '  asp_codigo INTEGER NOT NULL,' +
                        '  asp_descricao VARCHAR(80) NULL,' +
                        '  PRIMARY KEY(asp_codigo)' +
                        ');';
        123: sComando:= ' CREATE TABLE IF NOT EXISTS impactos_ambientais (' +
                        '  imp_codigo INTEGER NOT NULL,' +
                        '  imp_descricao VARCHAR(80) NULL,' +
                        '  PRIMARY KEY(imp_codigo)' +
                        ');';
        124: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (11, "CONDIÇÃO DE OPERAÇÃO - LAAIA", 1, "NORMAL", 1);';
        125: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (11, "CONDIÇÃO DE OPERAÇÃO - LAAIA", 2, "ANORMAL", 2);';
        126: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (11, "CONDIÇÃO DE OPERAÇÃO - LAAIA", 3, "EMERGENCIAL", 3);';
        127: sComando:= ' DELETE FROM impactos_ambientais;';
        128: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                       ' VALUES (1, "ALTERAÇÃO DA FAUNA / FLORA");';
        129: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (2, "ALTERAÇÃO DA QUALIDADE DA ÁGUA SUPERFICIAL / SUBTERRÂNEA");';
        130: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (3, "ALTERAÇÃO DA QUALIDADE DO AR");';
        131: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (4, "ALTERAÇÃO DA QUALIDADE DO SOLO");';
        132: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (5, "ASSOREAMENTO DE CORPOS DE ÁGUA");';
        133: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (6, "CAPTAÇÃO DE GÁS CARBÔNICO (CO2) E EMISSÃO DE OXIGÊNIO (O2)");';
        134: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (7, "COMPACTAÇÃO DO SOLO");';
        135: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (8, "CONTRIBUI PARA A FORMAÇÃO DO EFEITO ESTUFA (CO, CO2)");';
        136: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (9, "CONTRIBUI PARA O ESGOTAMENTO / REDUÇÃO DA DISPONIBILIDADE DE RECURSOS NATURAIS");';
        137: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (10, "DEPLEÇÃO/DIMINUIÇÃO DA CAMADA DE OZÔNIO (CFC)");';
        138: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (11, "EROSÃO");';
        139: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (12, "INCÔMODOS A COMUNIDADE");';
        140: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (13, "POLUIÇÃO DO SOLO/OCUPAÇÃO DE ATERRO SANITÁRIO");';
        141: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (14, "RESÍDUOS ORGÂNICOS NO SOLO / OCUPAÇÃO DO ATERRO");';
        142: sComando:= ' INSERT INTO impactos_ambientais (imp_codigo, imp_descricao)' +
                        ' VALUES (15, "VAZAMENTO / EXPLOSÃO / INCÊNDIO");';
        143: sComando:= ' DROP TABLE lira';
        144: sComando:= ' CREATE TABLE lira (' +
                        '  lir_codigo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,' +
                        '  lir_identificacao VARCHAR(6) NULL,' +
                        '  lir_descricao VARCHAR(80) NULL,' +
                        '  lir_ambito VARCHAR(20) NULL,' +
                        '  lir_tema VARCHAR(80) NULL,' +
                        '  lir_orgao VARCHAR(20) NULL,' +
                        '  lir_sumario TEXT NULL,' +
                        '  lir_evidencia TEXT NULL,' +
                        '  lir_documento TEXT NULL,' +
                        '  lir_avaliacao INTEGER UNSIGNED NULL,' +
                        '  lir_dataVerificacao DATE NULL,' +
                        '  lir_alterada INTEGER UNSIGNED NULL,' +
                        '  lir_responsavel VARCHAR(80) NULL,' +
                        '  lir_avaliacaoEvid INTEGER UNSIGNED NULL,' +
                        '  lir_dataVerificacaoEvid DATE NULL,' +
                        '  lir_alteradaEvid INTEGER UNSIGNED NULL,' +
                        '  PRIMARY KEY(lir_codigo)' +
                        ');';
        145: sComando:= ' CREATE TABLE IF NOT EXISTS laaia_lei (' +
                        '  lir_identificacao VARCHAR(6) NOT NULL,' +
                        '  lai_numAspecto INTEGER UNSIGNED NOT NULL,' +
                        '  PRIMARY KEY(lir_identificacao, lai_numAspecto)' +
                        ');';
        146: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (12, "ÂMBITO - LIRA", 1, "MUNICIPAL", 1);';
        147: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (12, "ÂMBITO - LIRA", 2, "ESTADUAL", 2);';
        148: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (12, "ÂMBITO - LIRA", 3, "FEDERAL", 3);';
        149: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (12, "ÂMBITO - LIRA", 4, "INTERNACIONAL", 4);';
        150: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 1, "DIÁRIO", 1);';
        151: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 2, "SEMANAL", 2);';
        152: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 3, "QUINZENAL", 3);';
        153: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 4, "MENSAL", 4);';
        154: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 5, "TRIMESTRAL", 5);';
        155: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 6, "SEMESTRAL", 6);';
        156: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 7, "ANUAL", 7);';
        157: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 8, "BIENAL", 8);';
        158: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 9, "TRIENAL", 9);';
        159: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 10, "QUADRIENAL", 10);';
        160: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (13, "FREQUÊNCIA - LIRA", 11, "QUINQUENAL", 11);';
        161: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (14, "SIM/NÃO", 0, "SIM", 1);';
        162: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (14, "SIM/NÃO", 1, "NÃO", 2);';
        163: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (15, "SITUAÇÃO COLABORADOR", 1, "ATIVO", 1);';
        164: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (15, "SITUAÇÃO COLABORADOR", 2, "INATIVO", 2);';
        165: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (16, "TIPO DE DOCUMENTO - LISTA MESTRA", 0, "INTERNO", 1);';
        166: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (16, "TIPO DE DOCUMENTO - LISTA MESTRA", 1, "EXTERNO", 2);';
        167: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (1, "PROTEÇÃO - FORMULÁRIOS", 3, "MEIO ELETRÔNICO E FÍSICO", 3);';
        168: sComando:= ' CREATE TABLE IF NOT EXISTS laaia_impactos (' +
                        '   lai_numAspecto INTEGER UNSIGNED NOT NULL,' +
                        '   lai_codImpacto INTEGER UNSIGNED NOT NULL,' +
                        '   PRIMARY KEY (lai_numAspecto, lai_codImpacto)' +
                        ' )' +
                        ' ENGINE = InnoDB;';
        169: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (99, "FUNÇÕES DO SISTEMA", 27, "AÇÕES DO PMC", 27);';
        170: GravaUsuarios('27');
        171: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (17, "TIPO DE META - INDICADORES", 1, "IGUAL A", 1);';
        172: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (17, "TIPO DE META - INDICADORES", 2, "MAIOR QUE", 2);';
        173: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (17, "TIPO DE META - INDICADORES", 3, "MENOR QUE", 3);';
        174: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (17, "TIPO DE META - INDICADORES", 4, "MAIOR IGUAL QUE", 4);';
        175: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (17, "TIPO DE META - INDICADORES", 5, "MENOR IGUAL QUE", 5);';
        176: sComando:= ' UPDATE Indicadores SET tipo_ind = "1" WHERE tipo_ind = "Igual a"';
        177: sComando:= ' UPDATE Indicadores SET tipo_ind = "2" WHERE tipo_ind = "Maior que"';
        178: sComando:= ' UPDATE Indicadores SET tipo_ind = "3" WHERE tipo_ind = "Menor que"';
        179: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 0, "MENSAL", 0);';
        180: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 1, "BIMESTRAL", 1);';
        181: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 2, "TRIMESTRAL", 2);';
        182: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 3, "SEMESTRAL", 3);';
        183: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 4, "ANUAL", 4);';
        184: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 5, "BIENAL", 5);';
        185: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (18, "PERIODICIDADE - INDICADORES", 6, "TRIENAL", 6);';
        186: sComando:= ' UPDATE Infraestrutura SET manu_inf = "0" WHERE manu_inf = "SIM"';
        187: sComando:= ' UPDATE Infraestrutura SET manu_inf = "1" WHERE manu_inf = "NÃO"';
        188: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 1, "DIÁRIO", 1);';
        189: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 7, "SEMANAL", 2);';
        190: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 15, "QUINZENAL", 3);';
        191: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 30, "MENSAL", 4);';
        192: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 180, "SEMESTRAL", 5);';
        193: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 365, "ANUAL", 6);';
        194: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 730, "BIENAL", 7);';
        195: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 1095, "TRIENAL", 8);';
        196: sComando:= ' CREATE TABLE IF NOT EXISTS forn_tipo_produto (' +
                        ' tipo_codigo INTEGER NOT NULL,' +
                        ' tipo_nomeTipo VARCHAR(100),' +
                        ' PRIMARY KEY (tipo_codigo)' +
                        ' )' +
                        ' ENGINE = InnoDB;';
        197: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
                        ' VALUES (99,"FUNÇÕES DO SISTEMA", 28, "CADASTRO TIPO DE PRODUTO", 28)';
        198: GravaUsuarios('28');
        199: sComando:= ' ALTER TABLE fornecedores ADD COLUMN forn_tipoProd INTEGER;';
        200: sComando:= ' UPDATE manutencao_fecha SET fec_onde = 2 WHERE fec_onde = 0';
        201: sComando:= ' UPDATE manutencao_fecha SET fec_onde = 0 WHERE fec_onde = 1';
        202: sComando:= ' UPDATE manutencao_fecha SET fec_onde = 1 WHERE fec_onde = 2';
        203: sComando:= ' ALTER TABLE colab_treinamentos MODIFY COLUMN dtpr_tre DATETIME DEFAULT "0000-00-00 00:00:00", ' +
                        ' MODIFY COLUMN dtre_tre DATETIME DEFAULT "0000-00-00 00:00:00";';
        204: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (20, "SIM/NÃO IQF", 1, "SIM", 1);';
        205: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (20, "SIM/NÃO IQF", 0, "NÃO", 2);';
        206:sComando:=  ' DELETE FROM tabela_combos WHERE tipo_com = 19';
        207:sComando:=  ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 1, "DIÁRIO", 1);';
        208: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 7, "SEMANAL", 2);';
        209: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 15, "QUINZENAL", 3);';
        210: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 30, "MENSAL", 4);';
        211: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 90, "TRIMESTRAL", 5);';
        212: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 180, "SEMESTRAL", 6);';
        213: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 365, "ANUAL", 7);';
        214: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 730, "BIENAL", 8);';
        215: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 1095, "TRIENAL", 9);';
        216: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 1460, "QUADRIENAL", 10);';
        217: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (19, "PERIODICIDADE - DIAS", 1825, "QUINQUENAL", 11);';
        218: sComando:= ' ALTER TABLE empresa ADD COLUMN emp_escopo TEXT, ' +
                        ' ADD COLUMN emp_politica TEXT;';
        219: sComando:= ' ALTER TABLE colaboradores ADD COLUMN col_usuario VARCHAR(30) COMMENT "Usuario relacionado ao Colaborador";';
        220: sComando:= ' ALTER TABLE colaboradores ADD COLUMN col_email VARCHAR(80) COMMENT "E-mail do Colaborador";';
        221: sComando:= ' CREATE TABLE config_email (' +
                        ' smtp VARCHAR(80) NOT NULL,' +
                        ' porta VARCHAR(4),' +
                        ' email VARCHAR(80),' +
                        ' senha VARCHAR(80),' +
                        ' autenticacao INTEGER UNSIGNED,' +
                        ' remetente VARCHAR(80),' +
                        ' PRIMARY KEY (smtp)' +
                        ' )' +
                        ' ENGINE = InnoDB;';
        222: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
                        ' VALUES (99,"FUNÇÕES DO SISTEMA", 29, "CONFIGURAÇÃO DE E-MAIL", 29)';
        223: GravaUsuarios('29');
        224: sComando:= ' ALTER TABLE formularios MODIFY COLUMN iden_for VARCHAR(120) COMMENT "Identificação do Registro";';
        225: sComando:= ' ALTER TABLE indicadores ADD COLUMN ind_unidade VARCHAR(20) COMMENT "Unidade do indicador";';
        226: sComando:= ' ALTER TABLE indicadores ADD COLUMN ind_objetivo VARCHAR(120) COMMENT "Objetivo do indicador";';
        227: sComando:= ' ALTER TABLE indicadores ADD COLUMN ind_caminho_base TEXT COMMENT "Caminho da base de dados";';
        228: sComando:= ' ALTER TABLE indicadores ADD COLUMN ind_metodologia TEXT COMMENT "Metodologia do indicador";';
        229: sComando:= ' ALTER TABLE lista_mestra ADD COLUMN lis_treinamento Integer COMMENT "Treinamento relacionado ao documento";';
        230: sComando:= ' ALTER TABLE auditoria MODIFY COLUMN tabe_aud VARCHAR(80) COMMENT "Tabela alvo da ação";';
        231: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
                        ' VALUES (99,"FUNÇÕES DO SISTEMA", 30, "RELATÓRIO DE AVALIAÇÃO DE HABILIDADES", 30)';
        232: GravaUsuarios('30');
        233: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
                        ' VALUES (99,"FUNÇÕES DO SISTEMA", 31, "RELATÓRIO DE PENDÊNCIAS DA MATRIZ DE COMPETÊNCIAS", 31)';
        234: GravaUsuarios('31');
        235: sComando:= ' UPDATE planoacao set efic_pla = "0"' +
                        ' WHERE efic_pla = "S";';
        236: sComando:= ' UPDATE planoacao set efic_pla = "1"' +
                        ' WHERE efic_pla = "N";';
        237: sComando:= ' CREATE TABLE formularios_locais (' +
                        ' for_codProcesso INTEGER UNSIGNED NOT NULL,' +
                        ' for_codForm INTEGER UNSIGNED NOT NULL,' +
                        ' PRIMARY KEY (for_codProcesso, for_codForm)' +
                        ')' +
                        'ENGINE = InnoDB;';
        238: CopiarArmazenamento();
        239: sComando:= ' ALTER TABLE calibracao ADD COLUMN cali_incerteza Varchar(50) COMMENT "Incerteza";';
        240: sComando:= ' ALTER TABLE calibracao ADD COLUMN cali_erroTotal Varchar(50) COMMENT "Erro Total";';
        241: sComando:= ' ALTER TABLE calibracao ADD COLUMN cali_aprovado Integer COMMENT "Certificado Aprovado";';
        242: sComando:= ' ALTER TABLE pmc ADD COLUMN pmc_fornecedor Varchar(08) COMMENT "Fornecedor da Reclamação";';
        243: sComando:= ' ALTER TABLE pmc ADD COLUMN pmc_cliente Integer COMMENT "Cliente da Reclamação";';
        244: sComando:= ' ALTER TABLE pmc ADD COLUMN pmc_fechado Integer COMMENT "Marca se o PMC foi fechado";';
        245: sComando:= ' CREATE TABLE clientes (' +
                        ' cli_codigo INTEGER NOT NULL COMMENT "Código do Cliente",' +
                        ' cli_nome VARCHAR(200) COMMENT "Nome do Cliente",' +
                        ' cli_fantasia VARCHAR(100) COMMENT "Nome Fantasia do Cliente",' +
                        ' cli_endereco VARCHAR(100) COMMENT "Endereço do Cliente",' +
                        ' cli_numero VARCHAR(12) COMMENT "Número do Endereço",' +
                        ' cli_bairro VARCHAR(40) COMMENT "Bairro do Cliente",' +
                        ' cli_cidade VARCHAR(50) COMMENT "Cidade do Cliente",' +
                        ' cli_estado VARCHAR(02) COMMENT "Estado do Cliente",' +
                        ' cli_cep VARCHAR(09) COMMENT "CEP do Cliente",' +
                        ' cli_fone VARCHAR(40) COMMENT "Telefone do Cliente",' +
                        ' cli_contato VARCHAR(30) COMMENT "Nome do Contato",' +
                        ' cli_mail VARCHAR(50) COMMENT "E-mail do Contato",' +
                        ' cli_obs TEXT COMMENT "Observações",' +
                        ' cli_inscricao VARCHAR(30) COMMENT "Inscrição Estadual",' +
                        ' cli_cnpj VARCHAR(20) COMMENT "CNPJ",' +
                        ' PRIMARY KEY (cli_codigo)' +
                        ' )' +
                        ' ENGINE = InnoDB;';
        246: sComando:= ' ALTER TABLE iqf_remessa MODIFY COLUMN iqf_NF VARCHAR(100) COMMENT "Nota Fiscal ou Lote da remessa";';
        247: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com) ' +
                        ' VALUES (99,"FUNÇÕES DO SISTEMA", 32, "CADASTRO DE CLIENTES", 32)';
        248: GravaUsuarios('32');
        249: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (21, "PMC - EFICÁCIA", 0, "SIM", 2);';
        250: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (21, "PMC - EFICÁCIA", 1, "NÃO", 3);';
        251: sComando:= ' INSERT INTO tabela_combos (tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                        ' VALUES (21, "PMC - EFICÁCIA", 2, "AGUARDANDO", 1);';
        252: sComando:= ' ALTER TABLE indicadores ADD COLUMN ind_responsavel Integer COMMENT "Função responsável pelo indicador";';
        253: sComando:= ' CREATE TABLE ishikawa (' +
                        ' ish_codigo INTEGER NOT NULL,' +
                        ' ish_codigopmc INTEGER,' +
                        ' ish_meioambiente TEXT,' +
                        ' ish_maquina TEXT,' +
                        ' ish_metodo TEXT,' +
                        ' ish_medicao TEXT,' +
                        ' ish_maodeobra TEXT,' +
                        ' ish_materiaprima TEXT,' +
                        ' ish_problema TEXT,' +
                        ' PRIMARY KEY (ish_codigo)' +
                        ' )';
        254: sComando:= ' ALTER TABLE pmc ADD COLUMN pmc_arq_evidencia TEXT;';
        255: sComando:= ' UPDATE tabela_combos SET valo_com = "EM ESPERA" ' +
                        ' WHERE tipo_com = 21 AND codi_com = 2;';
        256: sComando:= ' ALTER TABLE pmc ADD COLUMN pmc_substituto VARCHAR(15);';
        257: sComando:= ' ALTER TABLE fornecedores MODIFY COLUMN forn_numero VARCHAR(10);';
        258: sComando:= ' ALTER TABLE aspectos_ambientais MODIFY COLUMN asp_descricao VARCHAR(100);';
        259: sComando:= ' ALTER TABLE colaboradores ADD COLUMN col_curriculo TEXT;';
      end;

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
            CommandText:= 'INSERT INTO atualiza_banco VALUES(' +
                          IntToStr(i) + ',' +
                          ArrumaDataSQL(Date()) + ',' +
                          QuotedStr(Copy(sComando,1,100)) +
                          ')';
            try
               Execute;
            except
               Active:= False;
               CommandText:= 'INSERT INTO atualiza_banco VALUES(' +
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
            CommandText:= 'INSERT INTO atualiza_banco VALUES(' +
                          IntToStr(i) + ',' +
                          ArrumaDataSQL(Date()) + ',' +
                          QuotedStr('Atualização número ' + IntToStr(i)) +
                          ')';
            Execute;
         end;
      end;
   end;

   Result:= True;
end;

procedure CopiarArmazenamento();
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_for, arma_for' +
                    ' FROM formularios';
      Active:= True;

      First;

      while not Eof do begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' INSERT INTO formularios_locais (for_codProcesso, for_codForm)' +
                          ' VALUES (' +
                          dm.cdsAuxiliar.FieldByName('arma_for').AsString + ',' +
                          dm.cdsAuxiliar.FieldByName('codi_for').AsString +
                          ')';
            Execute;
         end;

         Next;
      end;
   end;
end;

procedure PreencheAuditoria(parData: TDateTime);
var
   sNovoCodAuditoria: string;
begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
         Active:= True;
      end;

      with dm.cdsAux2 do begin
         Active:= False;
         CommandText:= ' SELECT MAX(aud_codigo) as Cod FROM auditoria_interna';
         Active:= True;

         sNovoCodAuditoria:= IntToStr(FieldByName('Cod').AsInteger + 1);
      end;

      dm.cdsAuxiliar.First;
      while not dm.cdsAuxiliar.Eof do begin
//         iUltCod:= iUltCod + 1;
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' INSERT INTO auditoria_interna (' +
                          ' data_aud, proc_aud, r41_aud, r422_aud, r423_aud, r424_aud, r51_aud,' +
                          ' r52_aud, r53_aud, r541_aud, r542_aud, r551_aud, r552_aud, r553_aud,' +
                          ' r56_aud, r61_aud, r621_aud, r622_aud, r63_aud, r64_aud, r71_aud,' +
                          ' r721_aud, r722_aud, r723_aud, r73_aud, r74_aud, r751_aud, r752_aud,' +
                          ' r753_aud, r754_aud, r755_aud, r76_aud, r821_aud, r822_aud, r823_aud,' +
                          ' r824_aud, r83_aud, r84_aud, r851_aud, r852_aud, r853_aud, aud_codigo)' +
                          ' VALUES (' +
                          ArrumaDataSQL(parData) + ',' +
                          dm.cdsAuxiliar.FieldByName('codi_pro').AsString + ',' +
                          '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,' +
                          '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0, ' + sNovoCodAuditoria +
                          ')';
            Execute;
         end;

         dm.cdsAuxiliar.Next;
      end;

      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' INSERT INTO auditoria_interna_rel VALUES (' +
                       ArrumaDataSQL(parData)  + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       '0' +
                       ')';
         Execute;
      end;
//   end;
end;

procedure PreencheAuditoria2015(parData: TDateTime);
var
   sNovoCodAuditoria: string;
begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT codi_pro, nome_pro ' +
                       ' FROM processos' +
                       ' WHERE pro_exibelista = ' + QuotedStr('S') +
                       ' ORDER BY nome_pro';
         Active:= True;
      end;

      with dm.cdsAux2 do begin
         Active:= False;
         CommandText:= ' SELECT MAX(aud_codigo) as Cod FROM auditoria_interna2015';
         Active:= True;

         sNovoCodAuditoria:= IntToStr(FieldByName('Cod').AsInteger + 1);
      end;

      dm.cdsAuxiliar.First;
      while not dm.cdsAuxiliar.Eof do begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' INSERT INTO auditoria_interna2015 (' +
                          ' aud_codigo, data_aud, proc_aud, r02_aud, r03_aud, r411_aud, r42_aud,' +
                          ' r43_aud, r441_aud, r442_aud, r511_aud, r512_aud, r521_aud, r522_aud,' +
                          ' r53_aud, r61_aud, r62_aud, r63_aud, r711_aud, r712_aud, r713_aud,' +
                          ' r714_aud, r7151_aud, r7152_aud, r716_aud, r72_aud, r73_aud, r74_aud,' +
                          ' r75_aud, r81_aud, r821_aud, r822_aud, r823_aud, r824_aud, r83_aud,' +
                          ' r84_aud, r851_aud, r852_aud, r853_aud, r854_aud, r855_aud, r856_aud,' +
                          ' r86_aud, r87_aud, r91_aud, r912_aud, r913_aud, r92_aud, r93_aud,' +
                          ' r101_aud, r102_aud, r103_aud)' +
                          ' VALUES (' +
                          sNovoCodAuditoria + ',' +
                          ArrumaDataSQL(parData) + ',' +
                          dm.cdsAuxiliar.FieldByName('codi_pro').AsString + ',' +
                          '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,' +
                          '0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ' +
                          ')';
            Execute;
         end;

         dm.cdsAuxiliar.Next;
      end;

      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' INSERT INTO auditoria_interna_rel2015 VALUES (' +
                       ArrumaDataSQL(parData)  + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       QuotedStr('') + ',' +
                       '0' +
                       ')';
         Execute;
      end;
//   end;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: Word);
var
   VerInfoSize, VerValueSize, Dummy: DWORD;
   VerInfo: Pointer;
   VerValue: PVSFixedFileInfo;
begin
   VerInfoSize := GetFileVersionInfoSize(Pchar(ParamStr(0)), Dummy);
   GetMem(VerInfo, VerInfoSize);
   GetFileVersionInfo(Pchar(ParamStr(0)), 0, VerInfoSize, VerInfo);
   VerQueryValue(VerInfo, '''', Pointer(VerValue), VerValueSize);
   with VerValue^ do begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
   end;
   Freemem(VerInfo, VerInfoSize);
end;

function GetVersionInfo: string;
var
   V1, V2, V3, V4: Word;
begin
   GetBuildInfo(V1, V2, V3, V4);
   Result := IntToStr(V1) + '.' + IntToStr(V2) + IntToStr(V3) + ' (Release ' + IntToStr(V4) + ')';
end;

function DuploBar(s: string): string;
var
   i: integer;
   retorno: string;
begin
   retorno:= EmptyStr;
   for i:= 1 to Length(s) do begin
      retorno:= retorno + s[i];
      if s[i] = '\' then
         retorno:= retorno + '\';
   end;

   Result:= retorno;
end;

procedure GravaIni(IP: String);
var
   ArqIni : TIniFile;
begin
   ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Destra.Ini');
   try
      ArqIni.WriteString('Configuração de IP', 'IP', IP);
      ArqIni.WriteString('User', 'User', 'root');
      ArqIni.WriteString('Password', 'Senha', '');
      ArqIni.WriteString('Database', 'Database', 'iso');
   finally
      ArqIni.Free;
   end;
end;

function LeIni(sTipo: string): string;
var
   ArqIni: TIniFile;
begin
   ArqIni:= TIniFile.Create(ExtractFilePath(Application.ExeName) + '\Destra.Ini');
   try
      if sTipo = 'IP' then begin
         Result := ArqIni.ReadString('Configuração de IP', 'IP','');
      end;
      if sTipo = 'User' then begin
         Result := ArqIni.ReadString('User', 'User','');
      end;
      if sTipo = 'Senha' then begin
         Result := ArqIni.ReadString('Password', 'Senha','');
      end;
      if sTipo = 'Database' then begin
         Result := ArqIni.ReadString('Database', 'Database','');
      end;
      if sTipo = 'Porta' then begin
         Result := ArqIni.ReadString('Porta', 'Porta','');
      end;
   finally
      ArqIni.Free;
   end;
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
         if dm.cdsAuxiliar.FieldByName('usua_ace').AsString = 'DESTRA' then begin
            CommandText:= ' INSERT INTO acessos (usua_ace, func_ace, cadastro, alteracao, exclusao, acesso, especial2)' +
                          ' VALUES (' + QuotedStr(dm.cdsAuxiliar.FieldByName('usua_ace').AsString) + ',' + funcao + ', 1,1,1,1,1)';
         end
         else begin
            CommandText:= ' INSERT INTO acessos (usua_ace, func_ace, cadastro, alteracao, exclusao, acesso, especial2)' +
                          ' VALUES (' + QuotedStr(dm.cdsAuxiliar.FieldByName('usua_ace').AsString) + ',' + funcao + ', 0,0,0,0,0)';
         end;
         Execute;
      end;
      dm.cdsAuxiliar.Next;
   end;
end;

function Criptografar(par_texto: string): string;
var
   vChave: Word;
   Texto: string;
   pos : integer;
begin
   vChave:= 250;
   for pos:= 1 to length(par_texto) do
      par_texto[pos]:= chr(ord(par_texto[pos]) + vChave);
   Texto:= par_texto;

//   vChave:= Chave;
//   for pos:= 1 to Length(par_texto) do begin
//      Texto:= Texto + Char(Byte(par_texto[pos]) xor (vChave shr 8));
//      vChave:= (Byte(Texto[pos]) + vChave) * C1 + C2;
//   end;

   Result:= Texto;
end;

function Descriptografar(par_texto: string): string;
var
   pos: integer;
   vChave: Word;
   Texto: string;
begin
   vChave:= 250;
   for pos:= 1 to length(par_texto) do
      par_texto[pos]:= chr(ord(par_texto[pos]) - vChave);
   Texto:= par_texto;

//   vChave:= Chave;
//   for pos:= 1 to Length(par_texto) do begin
//      Texto:= Texto + Char(Byte(par_texto[pos]) xor (vChave shr 8));
//      vChave:= ((Byte(Texto[pos]) + vChave) - C2) / C1;
//   end;

   Result:= Texto;
end;

procedure AcertarSeqIndicadores();
var
   iNum: Integer;
begin
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= 'SELECT codi_ind FROM valor_indicador';
      Active:= True;
      First;

      while not Eof do begin
         // Busca os dados de cada código de indicador
         dm.cdsAuxiliar.Active:= False;
         dm.cdsAuxiliar.CommandText:= ' SELECT * FROM valor_indicador' +
                                      ' WHERE codi_ind = ' + FieldByName('codi_ind').AsString +
                                      ' ORDER BY peri_vin';
         dm.cdsAuxiliar.Active:= True;
         dm.cdsAuxiliar.First;
         // Acerta a sequência
         iNum:= 0;
         while not dm.cdsAuxiliar.Eof do begin
            iNum:= iNum + 1;
            dm.cdsAuxiliar.Edit;
            dm.cdsAuxiliar.FieldByName('sequ_vin').AsInteger:= iNum;

            dm.cdsAuxiliar.Next;
         end;
         dm.cdsAuxiliar.Edit;
         dm.cdsAuxiliar.Post;
         dm.cdsAuxiliar.ApplyUpdates(0);
         Next;
      end; 

   end;
end;

function Numero(Tecla: Char): Boolean;
begin
   if Tecla in ['0'..'9'] then begin
      Result:= True
   end
   else begin
      Result:= False;
   end;
end;

procedure TryFocus(Componente: TObject);
begin
   try
      TWinControl(Componente).SetFocus;
   except
   end;
end;

function VerificaChave(Chave: String): Boolean;
var
   HD_HEX, Dia, Mes, Ano, HD_HEX_SYS: String;
   HD_HEX_OK, DATA_OK: Boolean;
   Data: TDateTime;
begin

   // Tira os traços da chave
   Chave := InverteString(LimpaCPFCNPJ(Chave));
   Chave := Copy(Chave, 12, 11) + Copy(Chave, 1, 11);

   HD_HEX := Copy(Chave, 1, 2) + Copy(Chave, 7, 2) + Copy(Chave, 13, 2) +
      Copy(Chave, 21, 2);

   // Verifica o HD hexa
   HD_HEX_SYS := RetNumSerieHD(True);
   HD_HEX_OK := HD_HEX = HD_HEX_SYS;

   Dia := Copy(Chave, 3, 2);
   Mes := Copy(Chave, 9, 2);
   Ano := Copy(Chave, 15, 4);

   // Monta a data novamente
   if Length(Dia + Mes + Ano) <> 8 then
      DATA_OK := False
   else begin
      try
         Data := EncodeDate(StrToInt(Ano), StrToInt(Mes), StrToInt(Dia));
         DATA_OK := True;
      except
         DATA_OK := False;
      end;
   end;

   Result := HD_HEX_OK and DATA_OK;

   if not Result then begin
      Application.MessageBox('Chave de Ativação inválida!', 'Erro ao registrar', MB_OK + MB_ICONERROR);
   end;
end;

function InverteString(texto: String): String;
var
   nI: Integer;
   cAux: String;
begin

   for nI := Length(texto) downto 1 do
      cAux := cAux + Copy(texto, nI, 1);

   Result := cAux;
end;

function LimpaCPFCNPJ(sTexto: String): String;
var
   cAux: String;
begin
   cAux  := sTexto;
   cAux  := StringReplace(cAux, '.', '', [rfReplaceAll]);
   cAux  := StringReplace(cAux, '-', '', [rfReplaceAll]);
   cAux  := StringReplace(cAux, '/', '', [rfReplaceAll]);
   Result:= Trim(cAux);
end;

function RetNumSerieHD(Hexadecimal: Boolean = False): String;
var
   NomeVol, SisArq: String;
   NumSerial, Flags, TamMax: DWord;
begin
   SetLength(NomeVol, 255);
   SetLength(SisArq, 255);
   GetVolumeInformation('c:\', PChar(NomeVol), 255, @NumSerial, TamMax, Flags,
      PChar(SisArq), 255);
   if Hexadecimal then
      Result := IntToHex(NumSerial, 8)
   else
      Result := IntToStr(NumSerial);
end;

function RetDataChave(Chave: String): TDateTime;
var
   Dia, Mes, Ano: String;
begin

   // Tira os traços da chave
   Chave := InverteString(LimpaCPFCNPJ(Chave));
   Chave := Copy(Chave, 12, 11) + Copy(Chave, 1, 11);

   Dia := Copy(Chave, 3, 2);
   Mes := Copy(Chave, 9, 2);
   Ano := Copy(Chave, 15, 4);

   Result := EncodeDate(StrToInt(Ano), StrToInt(Mes), StrToInt(Dia));
end;

procedure GravarRegistro(Chave, SubChave: String; Conteudo: String = '');
var
   Reg: TRegistry;
begin
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_CURRENT_USER;
//      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Reg.OpenKey(Chave, True);
      Reg.WriteString(SubChave, Conteudo);
   finally
      Reg.CloseKey;
      Reg.Free;
   end;
end;

// Ler um valor
function LerRegistro(Chave, SubChave: String): String;
var
   Reg: TRegistry;
begin
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_CURRENT_USER;
//      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Reg.OpenKey(Chave, False);
      Result := Reg.ReadString(SubChave);
   finally
      Reg.CloseKey;
      Reg.Free;
   end;
end;

procedure GravarRegistroNovo(Chave: String);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 100 AND codi_com = 1';
      Active:= True;

      if RecordCount > 0 then begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' UPDATE tabela_combos SET' +
                          ' valo_com = ' + QuotedStr(Chave) +
                          ' WHERE tipo_com = 100 AND codi_com = 1';
            Execute;
         end;
      end
      else begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' INSERT INTO tabela_combos(' +
                          '         tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                          ' VALUES (' +
                          QuotedStr('100') + ',' +
                          QuotedStr('FUNÇÕES DO SISTEMA') + ',' +
                          QuotedStr('1') + ',' +
                          QuotedStr(Chave) + ',' +
                          QuotedStr('1') +
                          ');';
            Execute;
         end;
      end;
   end;
end;

function LerRegistroNovo(): String;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 100 AND codi_com = 1';
      Active:= True;

      Result:= FieldByName('valo_com').AsString;
   end;
end;

function Cript(texto: String): String;
var
   nI: Integer;
   cAux, cAux2: String;
begin

   cAux := EmptyStr;

   nI := 1;

   while nI <= Length(texto) do begin
      cAux := cAux + Copy(texto, nI + 1, 1) + Copy(texto, nI, 1);
      Inc(nI, 2);
   end;

   cAux2 := EmptyStr;

   for nI := Length(cAux) downto 1 do begin
      cAux2 := cAux2 + Copy(cAux, nI, 1);
   end;

   cAux := EmptyStr;

   for nI := 1 to Length(cAux2) do begin
      cAux := cAux + chr(AsciiToInt(cAux2[nI]) + 2);
   end;

   Result := cAux;

end;

function Decript(texto: String): String;
var
   nI: Integer;
   cAux, cAux2: String;
begin

   cAux := EmptyStr;

   for nI := 1 to Length(texto) do begin
      cAux := cAux + chr(AsciiToInt(texto[nI]) - 2);
   end;

   cAux2 := EmptyStr;

   for nI := Length(cAux) downto 1 do begin
      cAux2 := cAux2 + Copy(cAux, nI, 1);
   end;

   cAux := EmptyStr;

   nI := 1;

   while nI <= Length(cAux2) do begin
      cAux := cAux + Copy(cAux2, nI + 1, 1) + Copy(cAux2, nI, 1);
      Inc(nI, 2);
   end;

   Result := cAux;
end;

function AsciiToInt(caracter: Char): Integer;
var
   i: Integer;
begin
   i := 32;
   while i < 255 do begin
      if chr(i) = caracter then
         Break;
      i := i + 1;
   end;
   Result := i;
end;

function RetWinPath: String;
var
   Diret, Caminho: String;
begin

   SetLength(Diret, MAX_PATH);
   GetSystemDirectory(PChar(Diret), MAX_PATH);
   Caminho := Copy(Diret, 1, StrLen(PChar(Diret)));

   Result := Caminho;
end;

function GeraChave(Serial: String; HabilitaSistema: Boolean = False;
   DataLimite: TDateTime = 0): String;
var
   HD_HEX, HD_HEX1, HD_HEX2, HD_HEX3, HD_HEX4, Dia, Mes, Ano, DIA_INV, MES_INV,
      ANO_INV, HORA, MIN, SEC, Chave: String;
   wDia, wMes, wAno: Word;
begin

   if not HabilitaSistema then begin

      HD_HEX := Serial;
      HD_HEX1 := Copy(HD_HEX, 1, 2);
      HD_HEX2 := Copy(HD_HEX, 3, 2);
      HD_HEX3 := Copy(HD_HEX, 5, 2);
      HD_HEX4 := Copy(HD_HEX, 7, 2);

      DecodeDate(Date, wAno, wMes, wDia);

      Dia := StrZero(wDia, 2);
      Mes := StrZero(wMes, 2);
      Ano := StrZero(wAno, 4);
      DIA_INV := InverteString(Dia);
      MES_INV := InverteString(Mes);
      ANO_INV := InverteString(Ano);

      Chave := InverteString(HD_HEX1 + DIA_INV + HD_HEX2 + MES_INV + HD_HEX3 +
         ANO_INV + HD_HEX4);
      Chave := Copy(Chave, 1, 4) + '-' + Copy(Chave, 5, 4) + '-' +
         Copy(Chave, 9, 4) + '-' + Copy(Chave, 13, 4);

   end
   else begin

      Serial := LimpaCPFCNPJ(Serial);
      Serial := InverteString(Serial);

      HD_HEX1 := Copy(Serial, 1, 2);
      HD_HEX2 := Copy(Serial, 5, 2);
      HD_HEX3 := Copy(Serial, 9, 2);
      HD_HEX4 := Copy(Serial, 15, 2);
      HD_HEX := HD_HEX1 + HD_HEX2 + HD_HEX3 + HD_HEX4;

      // DecodeDate(Date, wAno, wMes, wDia);
      if DataLimite > 0 then
         DecodeDate(DataLimite, wAno, wMes, wDia)
      else
         DecodeDate(Date, wAno, wMes, wDia);

      Dia := StrZero(wDia, 2);
      Mes := StrZero(wMes, 2);
      Ano := StrZero(wAno, 4);
      HORA := Copy(FormatDateTime('hh:mm:ss', Now), 1, 2);
      MIN := Copy(FormatDateTime('hh:mm:ss', Now), 4, 2);
      SEC := Copy(FormatDateTime('hh:mm:ss', Now), 7, 2);

      Chave := InverteString(HD_HEX1 + Dia + HORA + HD_HEX2 + Mes + MIN +
         HD_HEX3 + Ano + SEC + HD_HEX4);
      Chave := Copy(Chave, 12, 11) + Copy(Chave, 1, 11);
      Chave := Copy(Chave, 1, 5) + '-' + Copy(Chave, 6, 5) + '-' +
         Copy(Chave, 11, 5) + '-' + Copy(Chave, 16, 5) + '-' +
         Copy(Chave, 21, 2);

   end;

   Result := Chave;
end;

function StrZero(Numero, Tamanho: Integer): String;
var
   nTam: Integer;
begin

   Result := Trim(IntToStr(Numero));
   nTam := Length(Result);

   while nTam < Tamanho do begin
      Result := '0' + Result;
      nTam := Length(Result);
   end;
end;

function LogicoParaString(valor: Boolean): string;
begin
   if valor = True then begin
      Result:= '1';
   end
   else begin
      Result:= '0';
   end;
end;

function StringParaLogico(valor: string): Boolean;
begin
   if valor = '1' then begin
      Result:= True;
   end
   else begin
      Result:= False;
   end;
end;

function AcessoTartaruga(item: string): Boolean;
begin
   // Verifica se o processo está liberado para o usuário
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT ' + item + ' FROM usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;

      Result:= StringParaLogico(FieldByName(item).AsString);

      if StringParaLogico(FieldByName(item).AsString) = False then begin
         Application.MessageBox(PChar('Usuário ' + cUsuario + ' não pode acessar este item'), 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure GravaAtributos(iCodCol, iCodFuncao: Integer; sTipo: string = 'A');
begin
   // A - ALL (Habilidades e Treinamentos)
   // H - Só Habilidades
   // T - Só Treinamentos

   if (sTipo = 'A') or (sTipo = 'H') then begin
      // Grava as habilidades da função do colaborador no cadastro de Habilidades do Colaborador
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT codi_hab FROM funcoes_habilidades' +
                       ' WHERE codi_fun = ' + IntToStr(iCodFuncao);
         Active:= True;
         First;

         while not Eof do begin
            // Verifica se a função já está cadastrada.
            dm.cdsAux3.Active:= False;
            dm.cdsAux3.CommandText:= ' SELECT COUNT(*) as Qtd' +
                                     ' FROM colab_habilidades' +
                                     ' WHERE codi_col = ' + IntToStr(iCodCol) +
                                     ' AND codi_hab = ' + dm.cdsAuxiliar.FieldByName('codi_hab').AsString +
                                     ' AND hab_ano = ' + QuotedStr(FormatDateTime('yyyy',Date()));
            dm.cdsAux3.Active:= True;

            // Se estiver cadastrada mantem o registro cadastrado
            if dm.cdsAux3.FieldByName('Qtd').AsInteger = 0 then begin
               dm.cdsAux2.Active:= False;
               dm.cdsAux2.CommandText:= ' INSERT INTO colab_habilidades' +
                                        ' (codi_col, codi_hab, nota_hab, hab_ano)' +
                                        ' VALUES('+
                                        IntToStr(iCodCol) +','+
                                        dm.cdsAuxiliar.FieldByName('codi_hab').AsString + ',' +
                                        '0' + ',' +
                                        FormatDateTime('yyyy',Date()) +
                                        ')';
               dm.cdsAux2.Execute;
            end;
            Next;
         end;
      end;
   end;

   if (sTipo = 'A') or (sTipo = 'T') then begin
      // Grava os treinamentos da função do colaborador no cadastro de Treinamentos do Colaborador
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT codi_tre, tipo_tre ' +
                       ' FROM funcoes_treinamentos' +
                       ' WHERE codi_fun = ' + IntToStr(iCodFuncao);
         Active:= True;
         First;

         while not Eof do begin
            dm.cdsAux2.Active:= False;
            dm.cdsAux2.CommandText:= ' INSERT INTO colab_treinamentos' +
                                     ' (codi_col, codi_tre, tipo_tre)' +
                                     ' VALUES('+
                                     IntToStr(iCodCol) +','+
                                     dm.cdsAuxiliar.FieldByName('codi_tre').AsString + ',' +
                                     QuotedStr(dm.cdsAuxiliar.FieldByName('tipo_tre').AsString) +
                                     ')';
            dm.cdsAux2.Execute;
            Next;
         end;
      end;
   end;
end;

procedure AcertarAtributos();
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT codi_fun FROM funcoes';
      Active:= True;
      First;
   end;

   while not dm.cdsAuxiliar.Eof do begin
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_col FROM colaboradores' +
                       ' WHERE func_col = ' + dm.cdsAuxiliar.FieldByName('codi_fun').AsString;
         Active:= True;

         while not dm.cdsAux.Eof do begin
            with dm.cdsAux2 do begin
               Active:= False;
               CommandText:= ' SELECT * FROM colab_treinamentos T' +
                             ' INNER JOIN colaboradores C ON C.codi_col = T.codi_col' +
                             ' WHERE C.codi_col = ' + dm.cdsAux.FieldByName('codi_col').AsString;
               Active:= True;

               with dm.cdsAux3 do begin
                  Active:= False;
                  CommandText:= ' SELECT codi_tre FROM funcoes_treinamentos' +
                                ' WHERE codi_fun = ' + dm.cdsAuxiliar.FieldByName('codi_fun').AsString;
                  Active:= True;
                  First;
               end;

               while not dm.cdsAux3.Eof do begin
                  if not dm.cdsAux2.Locate('codi_tre',dm.cdsAux3.FieldByName('codi_tre').AsString,[]) then begin
                     with dm.cdsAux4 do begin
                        Active:= False;
                        CommandText:= ' INSERT INTO colab_treinamentos(codi_col, codi_tre)' +
                                      ' VALUES (' + dm.cdsAux.FieldByName('codi_col').AsString + ',' +
                                      dm.cdsAux3.FieldByName('codi_tre').AsString +
                                      ')';
                        Execute;
                     end;
                  end;

                  dm.cdsAux3.Next;
               end;
            end;

            dm.cdsAux.Next;
         end;
      end;
      dm.cdsAuxiliar.Next;
   end;
end;

function ZerosEsquerda(texto: string; NumZeros: Integer): string;
var
   Auxiliar: Integer;
begin
   Auxiliar := NumZeros - Length(texto);
   Result := Replic('0', Auxiliar) + texto;
end;

procedure IncluiProcessoListaMestra();
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_lis, iden_lis, proc_lis, qtde_lis' +
                    ' FROM lista_mestra';
      Active:= True;

      First;
      while not eof do begin
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' INSERT INTO lista_mestra_proc' +
                          ' (lis_codiProcesso, lis_codiDocumento, lis_qtd)' +
                          ' VALUES(' +
                          dm.cdsAuxiliar.FieldByName('proc_lis').AsString + ',' +
                          dm.cdsAuxiliar.FieldByName('codi_lis').AsString + ',' +
                          dm.cdsAuxiliar.FieldByName('qtde_lis').AsString +
                          ')';
            Execute;
         end;

         Next;
      end;

   end;
end;

procedure MostrarErro(Mensagem: string; MensagemDelphi: string; Formulario: string);
var
   aDadosEmpresa: TStringList;
begin
   aDadosEmpresa:= TStringList.Create;

   FormMsgErro:= TFormMsgErro.Create(nil);
   FormMsgErro.sErro       := Mensagem;
   FormMsgErro.sErroDelphi := MensagemDelphi;
   FormMsgErro.sFormulario := Formulario;
//   FormMsgErro.sNomeEmpresa:= dm.cdsAux.FieldByName('nome_emp').AsString;
   aDadosEmpresa:= BuscarNomeEmpresa();
   FormMsgErro.sNomeEmpresa:= aDadosEmpresa[0]; // Nome da Empresa
   FormMsgErro.sCodigoDM   := aDadosEmpresa[2]; // Código DM
   FormMsgErro.ShowModal;
   FormMsgErro.Release;
end;

procedure EnviarEmail(sTexto: string; sAssunto: string; sPara: string; sTipo: string; sMostraForm: string = 'S');
var
   str : string;
   SSL, Autentica : string;
   i : integer;
   Componente: TWinControl;
   sData: string;
   arq: TextFile;
//   IdCorpo: TIdText;
begin
   if sTipo = 'sistema' then begin
      FormWebBrowser:= TFormWebBrowser.Create(nil);
      FormWebBrowser.url:= 'www.destraconsultoria.com.br/enviar.php?texto=' + sTexto + '&para=' + sPara + '&assunto=' + sAssunto;

//      AssignFile(arq, 'E:\zzz.txt');
//      Rewrite(arq); { [ 2 ] Cria o arquivo texto "tabuada.txt" na unidade de disco "d" }
//
//      Writeln(arq, FormWebBrowser.url); { [ 8 ] Grava uma linha no arquivo }
//      CloseFile(arq); { [ 8 ] Fecha o arquivo texto "tabuada.txt". }

      if sMostraForm = 'N' then begin
         FormWebBrowser.Show;
//         FormWebBrowser.Hide;  Não funcionou
         Sleep(1000);
      end
      else begin
         FormWebBrowser.ShowModal;
      end;
      FormWebBrowser.Release;
   end;

   exit;
   try
//      if sTipo = 'sistema' then begin
//      // Busca os dados da configuração de e-mail
//         with dm.cdsAuxiliar do begin
//            Active:= False;
//            CommandText:= ' SELECT smtp, porta, email, senha, autenticacao, remetente' +
//                          ' FROM config_email';
//            Active:= True;
//         end;
//      end;

   // Configurando componentes de envio
      with dm.SMTP do begin
         if sTipo = 'sistema' then begin
            Host    := 'mail.destraconsultoria.com.br';
            Username:= 'destramanager@destraconsultoria.com.br';
            Password:= 'hpzx2d81l8no';
            Port    := 587;
            AuthType:= satNone;

            //Host    := dm.cdsAuxiliar.FieldByName('smtp').AsString;

   //         if CBSMTPSSL.Checked Then begin
//               IOHandler:= IO_OpenSSL
   //         end
   //         else begin
   //            IOHandler:= nil;
   //         end;

   //         IOHandler:= IO_OpenSSL;
            //Username:= dm.cdsAuxiliar.FieldByName('email').AsString;
            //Password:= dm.cdsAuxiliar.FieldByName('senha').AsString;
            //Port    := dm.cdsAuxiliar.FieldByName('porta').AsInteger;

   //         case CbTSL.ItemIndex of
   //            0 : UseTLS    := utNoTLSSupport;
   //            1 : UseTLS    := utUseImplicitTLS;
   //            2 : UseTLS    := utUseRequireTLS;
   //            3 : UseTLS    := utUseExplicitTLS;
   //         end;

   //         case CbMetodoTSL.ItemIndex of
   //            0 : IO_OpenSSL.SSLOptions.Method:= sslvSSLv2;
   //            1 : IO_OpenSSL.SSLOptions.Method:= sslvSSLv23;
   //            2 : IO_OpenSSL.SSLOptions.Method:= sslvSSLv3;
   //            3 : IO_OpenSSL.SSLOptions.Method:= sslvTLSv1;
   //         end;

            //if dm.cdsAuxiliar.FieldByName('autenticacao').AsInteger = 1 then begin
            //   AuthType:= satDefault
            //end
            //else begin
            //   AuthType:= satNone;
            //end;
         end
         else begin  // Tipo = destra
            Host    := 'mail.destraconsultoria.com.br';
            Username:= 'erro@destraconsultoria.com.br';
            Password:= 'erro3170';
            Port    := 587;
            AuthType:= satNone;
         end;
         ConnectTimeout:= 5000;
         ReadTimeout   := 5000;
      end;

      //Conexão SSL
//      if CBSMTPSSL.Checked then begin
//         with IO_OpenSSL do begin
//            SSLOptions.Method := sslvSSLv23;
//            SSLOptions.Mode   := sslmClient;
//         end;
//      end;

      //Mensagem
      Componente:= Screen.ActiveControl;
      sData:= DateTimeToStr(Date());
      with dm.Msg do begin
         ContentType := 'text/html'; // Envia no formato HTML
         CharSet     := 'ISO-8859-1'; // Envia com acentuação

         if sTipo = 'sistema' then begin
         // Informações "de quem está enviando"
            From.Name         := 'Destra Manager';
            From.Address      := 'destramanager@destraconsultoriacom.br'; //dm.cdsAuxiliar.FieldByName('email').AsString;
            From.DisplayName  := sAssunto;

            // Informações "Para quem está enviando"
            Subject                   := sAssunto;
            Sender.Address            := sPara;
            Sender.Name               := 'Destra Manager';
            Recipients.EMailAddresses := sPara;
         end
         else begin
            // Informações "de quem está enviando"
            From.Name         := 'Destra Manager';
            From.Address      := 'erro@destraconsultoria.com.br';
            From.DisplayName  := 'Erro Destra Manager';

            // Informações "Para quem está enviando"
            Subject                   := 'Erro Destra Manager';
            Sender.Address            := 'erro@destraconsultoria.com.br';
            Sender.Name               := 'Destra Manager';
            Recipients.EMailAddresses := 'erro@destraconsultoria.com.br';
         end;

//         IdCorpo := TIdText.Create(IdMessage.MessageParts,nil);
//         IdCorpo.ContentDescription := 'multipart-1';
//         IdCorpo.CharSet := 'ISO-8859-1';
//         IdCorpo.ContentTransfer := '16bit';
//         IdCorpo.ContentDescription := 'Corpo da Mensagem';
//         IdCorpo.Body.Clear;
//         IdCorpo.Body.Add(fCorpo);

         // Informações da mensagem
         Body.Text := ' <html><head>' +
                      ' <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">' +
                      ' </head><body>' +
                      ' <font size="2" face="Tahoma">' +
                      ' <p>' + sTexto + '</p>' +
                      ' <img src="http://www.destraconsultoria.com.br\logo_dm.png"/> ' +
                      ' <br>Não responda este e-mail, pois esta conta não é monitorada. ' +
                      'Entre em contato com o gestor da sua área ou com o gestor da Qualidade.' +
                      ' </font>' +
                      ' </body></html>';
//         ShowMessage(Body.Text);
   //         CCList.EMailAddresses := EdCC.Text;
   //         BccList.EMailAddresses := EdCCO.Text;

         // Prioridade da mensagem
         Priority := mpHighest;

   //         case CBPrioridade.ItemIndex of
   //            0:Priority := mpNormal;
   //            1:Priority := mpLow;
   //            2:Priority := mpLowest;
   //            3:Priority := mpHigh;
   //            4:Priority := mpHighest;
   //         End;

         // Insira os anexos caso possua
         MessageParts.Clear;
            //if F_Envia_Email.Showing Then
   //         for i := 0 to MemoAnexo.Items.Count - 1 do begin
   //            if FileExists(MemoAnexo.Items[i]) Then begin
   //               TIdAttachmentFile.Create(MessageParts, MemoAnexo.Items[i]);
   //            end;
   //         end;
      end;

      // Tente Enviar a Mensagem
      try
      // Conecte ao Servidor
         if not dm.SMTP.Connected then begin
            dm.SMTP.Connect();
//            if CbAutentica.Checked then begin
//               SMTP.Authenticate();
//            end;
         end;

         // Envie o Email
         if dm.SMTP.Connected then begin
//            LbStatus.Caption := 'Aguarde, enviando E-Mail...';
//            Refresh;
            dm.SMTP.Send(dm.Msg);
            dm.SMTP.Disconnect;
         end;

         if sTipo = 'sistema' then begin
            Application.MessageBox(Pchar('E-mail enviado para ' + sPara + ' corretamente'), 'Informação', MB_OK + MB_ICONINFORMATION);
         end;

   //      Mensagem('E-Mail enviado!', 'Informação', 'i');

      Except
         // Tratamento de exceções
         on E: Exception do
//         if (tag = 0) then begin
            if (Pos(UpperCase('Credentials Rejected'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar E-Mail! Login ou Senha inválidos', E.Message, 'E-mail PMC');
            end
            else if (Pos(UpperCase('Host not found'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar e-mail. O Servidor "' + dm.SMTP.Host + '" não foi encontrado', E.Message, 'E-mail PMC');
            end
            else if (Pos(UpperCase('Connection timed out'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar e-mail. O servidor "' + dm.SMTP.Host +
               '" demorou a responder, verifique se a porta para conexão está correta!' , E.Message, 'E-mail PMC');
            end
            else if (Pos(UpperCase('read timeout'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar e-mail. O servidor "' + dm.SMTP.Host +
               '" demorou a responder, talvez o mesmo requeira uma Conexão SSL segura!', E.Message, 'E-mail PMC');
            end
            else if (Pos(UpperCase('connection closed'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar e-mail. Envio cancelado', E.Message, 'E-mail PMC');
            end
            else if (Pos(UpperCase('Incorrect authentication data'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar e-mail. Verifique o Nome da Conta e Senha', E.Message, 'E-mail PMC');
            end
            else if (Pos(UpperCase('Invalid HELO'), UpperCase(E.Message)) > 0) then begin
               MostrarErro('Erro ao enviar e-mail. Verifique se o campo "Meu servidor requer autenticação" está marcado corretamente', E.Message, 'E-mail PMC');
            end
            else begin
               MostrarErro('Erro ao enviar e-mail', E.Message, 'E-mail PMC');
            end;
//         end;
      end;
   finally
      if dm.SMTP.Connected then begin
         dm.SMTP.Disconnect;
      end;
   end;
end;

function VerificarConfigEmail(): Boolean;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd' +
                    ' FROM config_email';
      Active:= True;

      if FieldByName('Qtd').AsInteger = 0 then begin
         Result:= False;
         MostrarErro('Verifique se as configurações de e-mail estão preenchidas!','Acesse o menu Cadastros -> Configuração de envio de e-mail','');
      end
      else begin
         Result:= True;
      end;
   end;
end;

function VerificarConexaoInternet(ExibeMsg: Boolean): Boolean;
var
   Flags : Cardinal;
begin
   if InternetCheckConnection('http://www.destraconsultoria.com.br/', 1, 0) then begin
      Result:= True;
   end
   else begin
      Result:= False;
   end;

//   if not InternetGetConnectedState(@Flags, 0) then begin
////      MostrarErro('Você não está conectado à internet.' + #13#10 + 'Verifique !','','')
//      if ExibeMsg = True then begin
//         Application.MessageBox('Você não está conectado à internet.' + #13#10 + 'Verifique !', 'Aviso', MB_OK + MB_ICONWARNING);
//      end;
//       Result:= False;
//   end
////   else if Flags and INTERNET_CONNECTION_LAN <> 0 then begin
////      Result:= True
//////     ShowMessage('Você está conectado à Internet através de um roteador')
////   end
////   else if Flags and INTERNET_CONNECTION_PROXY <> 0 then begin
////      Result:= True
//////     ShowMessage('Você está conectado à Internet através de um proxy')
////   end
//   else begin
//      Result:= True;
////     ShowMessage('Você está conectado à Internet')
//   end;
end;

function BuscarNomeEmpresa(): TStringList;
var
   aDadosEmpresa: TStringList;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_emp, emp_escopo, emp_codidm ' +
                    ' FROM empresa ';
      Active:= True;

      aDadosEmpresa:= TStringList.Create;

      aDadosEmpresa.Add(FieldByName('nome_emp').AsString);
      aDadosEmpresa.Add(FieldByName('emp_escopo').AsString);
      aDadosEmpresa.Add(FieldByName('emp_codidm').AsString);

      Result:= aDadosEmpresa;
   end;
end;

procedure ControlarBotaoVisualiza(Tela: TForm);
var
   i, j: Integer;
begin
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if Tela.Components[i] is TEdit then begin
         if (Tela.Components[i] as TEdit).Name = 'edtCaminho' then begin
            if AllTrim((Tela.Components[i] as TEdit).Text) <> EmptyStr then begin
               for j:= 0 to Tela.ComponentCount - 1 do begin
                  if Tela.Components[j] is TSpeedButton then begin
                     if (Tela.Components[j] as TSpeedButton).Name = 'sbVisualizar' then begin
                        (Tela.Components[j] as TSpeedButton).Enabled:= True;
                     end;
                  end;
               end;
            end
            else begin
               for j:= 0 to Tela.ComponentCount - 1 do begin
                  if Tela.Components[j] is TSpeedButton then begin
                     if (Tela.Components[j] as TSpeedButton).Name = 'sbVisualizar' then begin
                        (Tela.Components[j] as TSpeedButton).Enabled:= False;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
end;

procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean; Tela: TForm; NumPageControlOcultar: Integer = -1;
                          NumPageControlOcultar1: Integer = -1; NumPageControlOcultar2: Integer = -1);
var
   i, j, k: Integer;
begin
   // Tag  0 = Habilitar e limpar campos
   // Tag 10 = Habilitar somente - Não limpar campos
   // Tag 20 = Limpar campos somente - Não habilitar
   // Tag 30 = Nem habilitar nem limpar campos

   // Adicionado o PageControl nativo do Delphi
   if NumPageControlOcultar > -1 then begin
      for i:= 0 to Tela.ComponentCount - 1 do begin
         if Tela.Components[i] is TPageControl then begin
            (Tela.Components[i] as TPageControl).Pages[NumPageControlOcultar].TabVisible:= not Flag;
         end;
      end;
   end;

   if NumPageControlOcultar1 > -1 then begin
      for i:= 0 to Tela.ComponentCount - 1 do begin
         if Tela.Components[i] is TPageControl then begin
            (Tela.Components[i] as TPageControl).Pages[NumPageControlOcultar1].TabVisible:= not Flag;
         end;
      end;
   end;

   if NumPageControlOcultar2 > -1 then begin
      for i:= 0 to Tela.ComponentCount - 1 do begin
         if Tela.Components[i] is TPageControl then begin
            (Tela.Components[i] as TPageControl).Pages[NumPageControlOcultar2].TabVisible:= not Flag;
         end;
      end;
   end;

   if NumPageControlOcultar > -1 then begin
      for i:= 0 to Tela.ComponentCount - 1 do begin
         if Tela.Components[i] is TJvgPageControl then begin
            (Tela.Components[i] as TJvgPageControl).Pages[NumPageControlOcultar].TabVisible:= not Flag;
         end;
      end;
   end;

   if NumPageControlOcultar1 > -1 then begin
      for i:= 0 to Tela.ComponentCount - 1 do begin
         if Tela.Components[i] is TJvgPageControl then begin
            (Tela.Components[i] as TJvgPageControl).Pages[NumPageControlOcultar1].TabVisible:= not Flag;
         end;
      end;
   end;

   if NumPageControlOcultar2 > -1 then begin
      for i:= 0 to Tela.ComponentCount - 1 do begin
         if Tela.Components[i] is TJvgPageControl then begin
            (Tela.Components[i] as TJvgPageControl).Pages[NumPageControlOcultar2].TabVisible:= not Flag;
         end;
      end;
   end;

   // Habilita ou não os BitBtn com tag 50
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TBitBtn) and (((Tela.Components[i] as TBitBtn).Tag = 50)) then begin
         (Tela.Components[i] as TBitBtn).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os radiobuttons da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TRadioButton) and (((Tela.Components[i] as TRadioButton).Tag = 0) or ((Tela.Components[i] as TRadioButton).Tag = 10)) then begin
         (Tela.Components[i] as TRadioButton).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os checkbox da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TCheckBox) and (((Tela.Components[i] as TCheckBox).Tag = 0) or ((Tela.Components[i] as TCheckBox).Tag = 10)) then begin
         (Tela.Components[i] as TCheckBox).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os radiogroup da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TRadioGroup) and (((Tela.Components[i] as TRadioGroup).Tag = 0) or ((Tela.Components[i] as TRadioGroup).Tag = 10)) then begin
         (Tela.Components[i] as TRadioGroup).Enabled:= Flag;
      end;
   end;

   // Habilita ou não o botão sbArquivo
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if Tela.Components[i] is TSpeedButton then begin
         if (Tela.Components[i] as TSpeedButton).Name = 'sbArquivo' then begin
            (Tela.Components[i] as TSpeedButton).Enabled:= Flag;
         end;
      end;
   end;

   // Habilita ou não todos os edit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TEdit) and (((Tela.Components[i] as TEdit).Tag = 0) or ((Tela.Components[i] as TEdit).Tag = 10)) then begin
         (Tela.Components[i] as TEdit).Enabled:= Flag;

         if (Tela.Components[i] as TEdit).Name = 'edtCodigo' then begin
            (Tela.Components[i] as TEdit).Enabled:= Codigo;
         end;

         ControlarBotaoVisualiza(Tela);
      end;
   end;

   // Habilita ou não todos os TDBLookupComboBox da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TDBLookupComboBox) and (((Tela.Components[i] as TDBLookupComboBox).Tag = 0) or ((Tela.Components[i] as TDBLookupComboBox).Tag = 10)) then begin
         (Tela.Components[i] as TDBLookupComboBox).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os TMemo da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TMemo) and (((Tela.Components[i] as TMemo).Tag = 0) or ((Tela.Components[i] as TMemo).Tag = 10)) then begin
         (Tela.Components[i] as TMemo).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os TDateEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TDateEdit) and (((Tela.Components[i] as TDateEdit).Tag = 0) or ((Tela.Components[i] as TDateEdit).Tag = 10)) then begin
         (Tela.Components[i] as TDateEdit).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os TMaskEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TMaskEdit) and (((Tela.Components[i] as TMaskEdit).Tag = 0) or ((Tela.Components[i] as TMaskEdit).Tag = 10)) then begin
         (Tela.Components[i] as TMaskEdit).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os TCurrencyEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TCurrencyEdit) and (((Tela.Components[i] as TCurrencyEdit).Tag = 0) or ((Tela.Components[i] as TCurrencyEdit).Tag = 10)) then begin
         (Tela.Components[i] as TCurrencyEdit).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os TRXSpinEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TRXSpinEdit) and (((Tela.Components[i] as TRXSpinEdit).Tag = 0) or ((Tela.Components[i] as TRXSpinEdit).Tag = 10)) then begin
         (Tela.Components[i] as TRXSpinEdit).Enabled:= Flag;
      end;
   end;

   // Habilita ou não todos os TComboBox da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TComboBox) and (((Tela.Components[i] as TComboBox).Tag = 0) or ((Tela.Components[i] as TComboBox).Tag = 10)) then begin
         (Tela.Components[i] as TComboBox).Enabled:= Flag;
      end;
   end;
end;

procedure LimparCampos(Tela: TForm);
var
   i: Integer;
begin
   // Tag  0 = Habilitar e limpar campos
   // Tag 10 = Habilitar somente - Não limpar campos
   // Tag 20 = Limpar campos somente - Não habilitar
   // Tag 30 = Nem habilitar nem limpar campos

   // Limpa todos os edit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TEdit) and (((Tela.Components[i] as TEdit).Tag = 0) or ((Tela.Components[i] as TEdit).Tag = 20)) then begin
         (Tela.Components[i] as TEdit).Clear;
      end;
   end;

   // Limpa todos os TDBLookupComboBox da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TDBLookupComboBox) and (((Tela.Components[i] as TDBLookupComboBox).Tag = 0) or ((Tela.Components[i] as TDBLookupComboBox).Tag = 20)) then begin
         (Tela.Components[i] as TDBLookupComboBox).KeyValue:= -1;
      end;
   end;

   // Limpa todos os TMemo da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TMemo) and (((Tela.Components[i] as TMemo).Tag = 0) or ((Tela.Components[i] as TMemo).Tag = 20)) then begin
         (Tela.Components[i] as TMemo).Clear;
      end;
   end;

   // Limpa todos os TDateEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TDateEdit) and (((Tela.Components[i] as TDateEdit).Tag = 0) or ((Tela.Components[i] as TDateEdit).Tag = 20)) then begin
         (Tela.Components[i] as TDateEdit).Clear;
      end;
   end;

   // Limpa todos os TMaskEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TMaskEdit) and (((Tela.Components[i] as TMaskEdit).Tag = 0) or ((Tela.Components[i] as TMaskEdit).Tag = 20)) then begin
         (Tela.Components[i] as TMaskEdit).Clear;
      end;
   end;

   // Limpa todos os TCurrencyEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TCurrencyEdit) and (((Tela.Components[i] as TCurrencyEdit).Tag = 0) or ((Tela.Components[i] as TCurrencyEdit).Tag = 20)) then begin
         (Tela.Components[i] as TCurrencyEdit).Value:= 0;
      end;
   end;

   // Limpa todos os TRxSpinEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TRxSpinEdit) and (((Tela.Components[i] as TRxSpinEdit).Tag = 0) or ((Tela.Components[i] as TRxSpinEdit).Tag = 20)) then begin
         (Tela.Components[i] as TRxSpinEdit).Value:= 0;
      end;
   end;

   // Limpa todos os TRxSpinEdit da tela
   for i:= 0 to Tela.ComponentCount - 1 do begin
      if (Tela.Components[i] is TComboBox) and (((Tela.Components[i] as TComboBox).Tag = 0) or ((Tela.Components[i] as TComboBox).Tag = 20)) then begin
         (Tela.Components[i] as TComboBox).ItemIndex:= -1;
      end;
   end;
end;

function Nulo(Valor: Variant; TipoDadoEsperado: string): Variant;
begin
//   ShowMessage(IntToStr(VarType(Valor)));
   if Valor = Null then begin
      if TipoDadoEsperado = 'I' then begin
         Result:= '0';
      end;
      if TipoDadoEsperado = 'S' then begin
         Result:= QuotedStr('');
      end;
   end
   else begin
      if VarType(Valor) in [2,3,4,5,16,17,18,19,20,21] then begin
         if TipoDadoEsperado = 'I' then begin
            Result:= IntToStr(Valor);
         end;
         if TipoDadoEsperado = 'S' then begin
            Result:= QuotedStr(IntToStr(Valor));
         end;
      end;

      if (VarType(Valor) = varString) or (VarType(Valor) = varUString) or
         (VarType(Valor) = varStrArg) or (VarType(Valor) = varAny) then begin
         if TipoDadoEsperado = 'I' then begin
            if Valor = '' then begin
               Result:= '0'
            end
            else begin
               Result:= Valor;
            end;
         end;
         if TipoDadoEsperado = 'S' then begin
            Result:= QuotedStr(Valor);
         end;
      end;
   end;
end;

procedure AbrirArquivo(Arquivo: string; Tela: string; Maximizado: string = 'S');
var
   iErro: Integer;
begin
   try
      if not (UpperCase(Copy(arquivo, 1, 4)) = 'HTTP') then begin
         if not FileExists(arquivo) then begin
            Application.MessageBox(PChar('O documento não foi encontrado na pasta especificada ou o caminho gravado está incorreto ou indisponível' + #13 + #13 + arquivo), 'Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;

      if Maximizado = 'S' then begin
//      ShellExecute(Application.Handle, nil, PChar(arquivo), nil, nil, SW_SHOWMAXIMIZED);
         iErro:= ShellExecute(Application.Handle,'open',PChar(arquivo),nil, nil,SW_SHOWMAXIMIZED);
      end
      else begin
         iErro:= ShellExecute(Application.Handle,'open',PChar(arquivo),nil, nil,SW_SHOWNORMAL);
      end;

      case iErro of
         2: begin // ERROR_FILE_NOT_FOUND

         end;
         3: begin // ERROR_PATH_NOT_FOUND

         end;
         31: begin // ERROR_GEN_FAILURE

         end;
         5: begin  //SE_ERR_ACCESSDENIED

         end;
      end;
   except
      on E: Exception do begin
         MostrarErro('Não foi possível abrir o arquivo.',E.Message + #13 + 'Código: ' + IntToStr(iErro), Tela);
      end;
   end;
end;

function Executar(sComando: string): Boolean;
begin
   Result:= False;

   with dm.cdsGravar do begin
      Active:= False;
      CommandText:= sComando;
      try
         Execute;
         Result:= True;
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao executar comando SQL. Verifique' + #13 + #13 + sComando + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure AjustaBarraGrid(NomeDBGrid: TDBGrid);
begin
   NomeDBGrid.Width:= NomeDBGrid.Width + 1;
   NomeDBGrid.Width:= NomeDBGrid.Width - 1;
end;

function LeConfig(sTipo: string): string;
begin
   try
      if sTipo = 'IP' then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT ip FROM config';
            Active:= True;

            Result := Descriptografar(FieldByName('ip').AsString);
         end;
      end;
      if sTipo = 'User' then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT usuario FROM config';
            Active:= True;

            Result := Descriptografar(FieldByName('usuario').AsString);
         end;
      end;
      if sTipo = 'Senha' then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT pass FROM config';
            Active:= True;

            Result := Descriptografar(FieldByName('pass').AsString);
         end;
      end;
      if sTipo = 'Database' then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT database FROM config';
            Active:= True;

            Result := Descriptografar(FieldByName('database').AsString);
         end;
      end;
   finally

   end;
end;

function VerificarProjetoCEA(): Boolean;
begin
   if FileExists(ExtractFilePath(Application.ExeName) + 'Exp/DestraExp.exe') then begin
      Result:= True;
   end
   else begin
      Result:= False;
   end;
end;

function VerificarProjetoSpiltag(): Boolean;
begin
   if FileExists(ExtractFilePath(Application.ExeName) + 'Spiltag/ImportarTOTVS.exe') then begin
      Result:= True;
   end
   else begin
      Result:= False;
   end;
end;

function AnoMes(Mes: string; Ano: string): string;
begin
   Result:= Ano + FormatFloat('00', StrToFloat(Mes));
end;

function BuscarParametroCoresRisco: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT riscos_cores FROM parametros';
      Active:= True;

      Result:= FieldByName('riscos_cores').AsString;
   end;
end;

procedure ColorirRisco(Panel: TPanel; Consequencia: Integer; Probabilidade: Integer; TipoRisco: Integer);
var
   sParCores: string;
begin
   // http://shibolete.tripod.com/RGB.html
   // Busca a opção de cores
   sParCores:= BuscarParametroCoresRisco();

   if sParCores = '0' then begin
      case Consequencia of
         1: begin // Insignificante (Trivial)
            Panel.Color:= RGB(35,142,35);
            Panel.Caption:= 'BAIXO';
         end;
         2: begin // Baixo (Minor)
            if Probabilidade = 5 then begin
               Panel.Color:= RGB(35,142,35);
               Panel.Caption:= 'BAIXO';
            end
            else if Probabilidade = 1 then begin
               Panel.Color:= RGB(255,165,0);
               Panel.Caption:= 'ALTO';
            end
            else if (Probabilidade <= 4) and (Probabilidade > 1) then begin
               Panel.Color:= RGB(255,255,0);
               Panel.Caption:= 'MÉDIO';
            end;
         end;
         3: begin // Moderado (Moderate)
            if Probabilidade <= 2 then begin
               Panel.Color:= RGB(255,165,0);
               Panel.Caption:= 'ALTO';
            end
            else if Probabilidade >= 3 then begin
               Panel.Color:= RGB(255,255,0);
               Panel.Caption:= 'MÉDIO';
            end;
         end;
         4: begin // Grave (Major)
            if Probabilidade = 1 then begin
               Panel.Color:= RGB(255,0,0);
               Panel.Caption:= 'SEVERO';
            end
            else if (Probabilidade >= 2) and (Probabilidade <= 4) then begin
               Panel.Color:= RGB(255,165,0);
               Panel.Caption:= 'ALTO';
            end
            else if Probabilidade = 5 then begin
               Panel.Color:= RGB(255,255,0);
               Panel.Caption:= 'MÉDIO';
            end;
         end;
         5: begin // Severo (Severe)
            if (Probabilidade >= 1) and (Probabilidade <= 3) then begin
               Panel.Color:= RGB(255,0,0);
               Panel.Caption:= 'SEVERO';
            end
            else if Probabilidade >= 4 then begin
               Panel.Color:= RGB(255,165,0);
               Panel.Caption:= 'ALTO';
            end;
         end;
         else begin
            Panel.Color:= clBtnFace;
            Panel.Caption:= '';
         end;
      end;
   end
   else begin
// ponto fraco e ameaça
//      pnlBaixo1.Color := RGB(240,230,140);
//      pnlMedio1.Color := RGB(255,255,0);
//      pnlAlto1.Color  := RGB(255,165,0);
//      pnlSevero1.Color:= RGB(255,0,0);

// ponto forte e oportunidade
   //      pnlBaixo.Color := RGB(0,0,128);
//      pnlMedio.Color := RGB(135,206,250);
//      pnlAlto.Color  := RGB(0,255,0);
//      pnlSevero.Color:= RGB(35,142,35);
//
//
      case Consequencia of
         1: begin // Insignificante (Trivial)
            if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
               Panel.Color:= RGB(240,230,140);
            end
            else begin
               Panel.Color:= RGB(0,0,128);
            end;
            Panel.Caption:= 'BAIXO';
         end;
         2: begin // Baixo (Minor)
            if Probabilidade = 5 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(240,230,140);
               end
               else begin
                  Panel.Color:= RGB(0,0,128);
               end;
               Panel.Caption:= 'BAIXO';
            end
            else if Probabilidade = 1 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,165,0);
               end
               else begin
                  Panel.Color:= RGB(0,255,0);
               end;
               Panel.Caption:= 'ALTO';
            end
            else if (Probabilidade <= 4) and (Probabilidade > 1) then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,255,0);
               end
               else begin
                  Panel.Color:= RGB(135,206,250);
               end;
               Panel.Caption:= 'MÉDIO';
            end;
         end;
         3: begin // Moderado (Moderate)
            if Probabilidade <= 2 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,165,0);
               end
               else begin
                  Panel.Color:= RGB(0,255,0);
               end;
               Panel.Caption:= 'ALTO';
            end
            else if Probabilidade >= 3 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,255,0);
               end
               else begin
                  Panel.Color:= RGB(135,206,250);
               end;
               Panel.Caption:= 'MÉDIO';
            end;
         end;
         4: begin // Grave (Major)
            if Probabilidade = 1 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,0,0);
               end
               else begin
                  Panel.Color:= RGB(35,142,35);
               end;
               Panel.Caption:= 'SEVERO';
            end
            else if (Probabilidade >= 2) and (Probabilidade <= 4) then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,165,0);
               end
               else begin
                  Panel.Color:= RGB(0,255,0);
               end;
               Panel.Caption:= 'ALTO';
            end
            else if Probabilidade = 5 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,255,0);
               end
               else begin
                  Panel.Color:= RGB(135,206,250);
               end;
               Panel.Caption:= 'MÉDIO';
            end;
         end;
         5: begin // Severo (Severe)
            if (Probabilidade >= 1) and (Probabilidade <= 3) then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,0,0);
               end
               else begin
                  Panel.Color:= RGB(35,142,35);
               end;
               Panel.Caption:= 'SEVERO';
            end
            else if Probabilidade >= 4 then begin
               if TipoRisco = 0 then begin// Ameaça/Ponto Fraco
                  Panel.Color:= RGB(255,165,0);
               end
               else begin
                  Panel.Color:= RGB(0,255,0);
               end;
               Panel.Caption:= 'ALTO';
            end;
         end;
         else begin
            Panel.Color:= clBtnFace;
            Panel.Caption:= '';
         end;
      end;
   end;
end;

function BuscarDescricaoRisco(Cor: TColor; Tipo: Integer; TipoAnalise: string): string;
var
   sDescricaoRisco: string;
begin
   if Cor = RGB(35,142,35) then begin // Baixo
      sDescricaoRisco:= 'Questões de baixo risco que pode ser tratadas ' + #13 +
                        'ou podem ser consideradas aceitáveis quando acontecem.';
      if Tipo = 0 then begin // Ponto Fraco
         sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                            'Não requer abertura de PMC.';
      end
      else begin
         sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                            'Não requer abertura de PMC.';
      end;
   end;
   if Cor = RGB(255,255,0) then begin // Médio
      sDescricaoRisco:= 'Questões de risco médio são uma ótima oportunidade de ' + #13 +
                        'analisar novas medidas de adaptação.';
      if Tipo = 0 then begin // Ponto Fraco
         sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                            'Abertura de PMC Corretiva se torna facultativa - Tratada somente na contenção imediata.';
      end
      else begin
         sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                            'Não requer abertura de PMC.';
      end;
   end;
   if Cor = RGB(255,165,0) then begin // Alto
      sDescricaoRisco:= 'Questões de alto risco requerem pesquisas adicionais ' + #13 +
                        'ou ações imediatas.';
      if Tipo = 0 then begin // Ponto Fraco
         sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                            'Abrir PMC Corretiva - Requer análise de causa e plano de ação.';
      end
      else begin
         if TipoAnalise = 'I' then begin // Interna
            sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                               'Não requer abertura de PMC.';
         end
         else begin // Externa
            sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                               'Avaliar a viabilidade de abrir PMC de Melhoria.';
         end;
      end;
   end;
   if Cor = RGB(255,0,0) then begin // Severo
      sDescricaoRisco:= 'Questões de risco extremo requerem ações imediatas!';
      if Tipo = 0 then begin // Ponto Fraco
         sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                            'Abrir PMC Corretiva - Requer análise de causa e plano de ação.';
      end
      else begin
         if TipoAnalise = 'I' then begin // Interna
            sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                               'Não requer abertura de PMC.';
         end
         else begin // Externa
            sDescricaoRisco:= sDescricaoRisco + #13 + #13 +
                               'Avaliar a viabilidade de abrir PMC de Melhoria.';
         end;
      end;
   end;

   Result:= sDescricaoRisco;
end;

function BuscarNovoCodigo(Tabela: string; Campo: string): string;
var
   sNovoCodigo: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(' + Campo + ') AS NovoCodigo FROM ' + Tabela +
                    ' WHERE ' + Campo + ' < 999999';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;

   Result:= sNovoCodigo;
end;

procedure GravarMesesMetaIndicadores(AnoMesAtual: string);
var
   iMesAnterior: Integer;
   rValorMeta  : Real;
   sTipoMeta   : string;
   sUnidade    : string;
   sNovoCodigo : string;
begin
   with dm.cdsAux2 do begin
      Active:= False;
      CommandText:= ' SELECT codi_ind FROM indicadores ORDER BY codi_ind';
      Active:= True;
   end;

   while not dm.cdsAux2.Eof do begin
      // Busca o último mês gravado do indicador
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT met_anomes, met_valor, met_tipo, met_unidade' +
                       ' FROM indicadores_metas ' +
                       ' WHERE met_codindicador = ' + dm.cdsAux2.FieldByName('codi_ind').AsString +
                       ' ORDER BY met_anomes desc LIMIT 1';
         Active:= True;

         if dm.cdsAuxiliar.RecordCount > 0 then begin
            iMesAnterior:= FieldByName('met_anomes').AsInteger;
            rValorMeta  := FieldByName('met_valor').AsFloat;
            sTipoMeta   := FieldByName('met_tipo').AsString;
            sUnidade    := FieldByName('met_unidade').AsString;
         end
         else begin
            // Para não entrar no while abaixo
            iMesAnterior:= StrToInt(AnoMesAtual) + 1;
         end;
      end;

      iMesAnterior:= iMesAnterior + 1;

      while iMesAnterior <= StrToInt(AnoMesAtual) do begin
         sNovoCodigo:= BuscarNovoCodigo('indicadores_metas', 'met_codigo');
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' INSERT INTO indicadores_metas ' +
                          ' (met_codigo, met_codindicador, met_anomes, met_tipo, ' +
                          ' met_valor, met_unidade)' +
                          ' VALUES(' +
                          sNovoCodigo + ',' +
                          dm.cdsAux2.FieldByName('codi_ind').AsString + ',' +
                          QuotedStr(IntToStr(iMesAnterior)) + ',' +
                          sTipoMeta + ',' +
                          VirgulaParaPonto(rValorMeta,2) + ',' +
                          QuotedStr(sUnidade) +
                          ')';
            Execute;
         end;

         iMesAnterior:= iMesAnterior + 1;
         if Copy(IntToStr(iMesAnterior),5,2) = '13' then begin
            iMesAnterior:= iMesAnterior + 88;
         end;
      end;

      dm.cdsAux2.Next;
   end;
end;

end.

