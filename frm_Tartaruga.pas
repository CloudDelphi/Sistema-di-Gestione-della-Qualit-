unit frm_Tartaruga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ToolWin, ComCtrls,
  ImgList, FMTBcd, DBClient, Provider, DB, SqlExpr, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, dxGDIPlusClasses;

type
  TFormTartaruga = class(TForm)
    pnProcesso: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel8: TPanel;
    lblNomeProcesso: TLabel;
    lblGestor: TLabel;
    lblCodigo: TLabel;
    mEntradas: TMemo;
    mSaidas: TMemo;
    mRequisitos: TMemo;
    lblCargo: TLabel;
    sbProcedimentos: TSpeedButton;
    sbRegistros: TSpeedButton;
    sbAcaoCorretiva: TSpeedButton;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    sbInfraestrutura: TSpeedButton;
    sbManutencao: TSpeedButton;
    sbIndicador: TSpeedButton;
    sbMatriz: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbMensagem: TLabel;
    tmrMensagem: TTimer;
    dspAuxiliar: TDataSetProvider;
    cdsAux: TClientDataSet;
    sbAnalise: TSpeedButton;
    lb1: TLabel;
    sbAuditoriaInterna: TSpeedButton;
    lb2: TLabel;
    zqryAuxiliar: TZQuery;
    imgOk: TImage;
    imgX: TImage;
    imgRisco: TImage;
    imgIndicadores: TImage;
    imgCrit: TImage;
    imgAcao: TImage;
    imgReg: TImage;
    imgProc: TImage;
    imgMatriz: TImage;
    imgManut: TImage;
    imgInfra: TImage;
    imgGestor: TImage;
    sbPDCA: TSpeedButton;
    lbl1: TLabel;
    imgPDCA: TImage;
    imgSetaDireita: TImage;
    imgSetaAbaixo: TImage;
    zqryProcessoAntLista: TZQuery;
    dspProcessoAntLista: TDataSetProvider;
    cdsProcessoAntLista: TClientDataSet;
    cdsProcessoAntListaant_codigo: TIntegerField;
    cdsProcessoAntListapro_codigo: TIntegerField;
    cdsProcessoAntListanome_pro: TWideStringField;
    dsProcessoAntLista: TDataSource;
    zqryProcessoSubLista: TZQuery;
    dspProcessoSubLista: TDataSetProvider;
    cdsProcessoSubLista: TClientDataSet;
    cdsProcessoSubListasub_codigo: TIntegerField;
    cdsProcessoSubListapro_codigo: TIntegerField;
    cdsProcessoSubListanome_pro: TWideStringField;
    dsProcessoSubLista: TDataSource;
    pnl1: TPanel;
    mmoProcAnt: TMemo;
    pnl2: TPanel;
    mmoProcSub: TMemo;
    pnl3: TPanel;
    pnlInfra: TPanel;
    pnlMatriz: TPanel;
    pnlRequisitos: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    btnSair: TBitBtn;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    sbRNC: TSpeedButton;
    lbl2: TLabel;
    imgRNC: TImage;
    procedure sbMatrizClick(Sender: TObject);
    procedure sbAnaliseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbProcedimentosClick(Sender: TObject);
    procedure mEntradasClick(Sender: TObject);
    procedure mSaidasClick(Sender: TObject);
    procedure mRequisitosClick(Sender: TObject);
    procedure sbInfraestruturaClick(Sender: TObject);
    procedure sbAcaoCorretivaClick(Sender: TObject);
    procedure sbRegistrosClick(Sender: TObject);
    procedure sbManutencaoClick(Sender: TObject);
    procedure VerificaPendencias;
    procedure sbIndicadorClick(Sender: TObject);
    procedure tmrMensagemTimer(Sender: TObject);
    function BuscaNotaHabilidade: Real;
    procedure btnSairClick(Sender: TObject);
    procedure sbAuditoriaInternaClick(Sender: TObject);
    procedure sbPDCAClick(Sender: TObject);
    procedure sbRNCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTartaruga: TFormTartaruga;

implementation

uses frm_dm, frm_CadInfra, frm_VisualizaDocumentos,
  frm_VisualizaPMC, frm_VisualizaInfra, frm_VisualizaFormularios,
  frm_Manutencao, Funcoes, frm_ValoresIndicador, frm_VisualizaAnaliseCritica,
  frm_VisualizaMatriz, frm_ManutencaoFecha, frm_Inicial, frm_Processos,
  frm_CadRiscoAnaliseRisco, frm_VisualizaPDCA, frm_VisualizaRNC;

{$R *.dfm}

//procedure Tt_Tartaruga.dbgProcedimentosDrawColumnCell(Sender: TObject;
//  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
//begin
//  if ContProcedimentos > 0 then
//    sbProcedimentos.Enabled:= True;
//end;

procedure TFormTartaruga.FormShow(Sender: TObject);
var
   CodCargo: string;
begin
   imgReg.Picture   := imgOk.Picture;
   imgGestor.Picture:= imgX.Picture;

   ContProcedimentos:= 0;
   lblNomeProcesso.Caption:= FormProcessos.cNomeProcesso;
   lblNomeProcesso.Caption:= FormProcessos.cNomeProcesso;

   with dm.cdsTartaruga do begin
      Active:= False;
      CommandText:= ' SELECT * FROM processos' +
                    ' WHERE nome_pro = ' + QuotedStr(FormProcessos.cNomeProcesso);
      Active:= True;
                                            //    lblNomeProcesso.Caption
      lblCodigo.Caption:= FieldByName('codi_pro').AsString;

      if dm.cdsTartaruga.FieldByName('gest_pro').AsString <> EmptyStr then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT nome_col, func_col FROM colaboradores ' +
                        ' WHERE codi_col = ' + QuotedStr(dm.cdsTartaruga.FieldByName('gest_pro').AsString);
            Active:= True;

            lblGestor.Caption:= FieldByName('nome_col').AsString;
            CodCargo         := FieldByName('func_col').AsString;

            if Alltrim(CodCargo) <> EmptyStr then begin
               Active:= False;
               CommandText:= ' SELECT desc_fun FROM funcoes ' +
                           ' WHERE codi_fun = ' + QuotedStr(CodCargo);
               Active:= True;

               lblCargo.Caption := FieldByName('desc_fun').AsString;
            end
            else begin
               lblCargo.Caption := '';
            end;
         end;
      end;

      mEntradas.Text  := FieldByName('entr_pro').AsString;
      mSaidas.Text    := FieldByName('said_pro').AsString;
      mRequisitos.Text:= FieldByName('requ_pro').AsString;
   end;

  // Labels do centro
 //  lblCodigo.Width:= 184;
 //  lblCodigo.Left:= 1;
   lblGestor.Width:= 150;
   lblGestor.Left:= 1;
   lblCargo.Width:= 150;
   lblCargo.Left:= 1;
   lblNomeProcesso.Width:= 150;
   lblNomeProcesso.Left:= 1;

   VerificaPendencias();

   Panel5.SetFocus;

   // Deixa o timer da mensagem e o label da mensagem desabilitados
   tmrMensagem.Enabled:= False;
   lbMensagem.Visible := False;
   imgGestor.Visible  := False;

   // Verifica se o processo tem um gestor definido, senão fica piscando a mensagem na tela.
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT gest_pro FROM processos ' +
                    ' WHERE codi_pro = ' + lblCodigo.Caption;
      Active:= True;

      if lblGestor.Caption = 'GESTOR' then begin // Se não tiver gestor cadastrado
//      if FieldByName('gest_pro').AsInteger = 0 then begin
         tmrMensagem.Enabled:= True;
      end;
   end;

   // Busca os processos antecedentes e subsequentes
   with cdsProcessoAntLista do begin
      Active:= False;
      CommandText:= ' SELECT ant_codigo, pro_codigo, P.nome_pro' +
                    ' FROM processos_antecedentes' +
                    ' INNER JOIN processos P ON P.codi_pro = ant_codigo' +
                    ' WHERE pro_codigo = ' + lblCodigo.Caption +
                    ' ORDER BY nome_pro';
      Active:= True;

      while not Eof do begin
         mmoProcAnt.Lines.Add(FieldByName('nome_pro').AsString);
         Next;
      end;
   end;

   with cdsProcessoSubLista do begin
      Active:= False;
      CommandText:= ' SELECT sub_codigo, pro_codigo, P.nome_pro' +
                    ' FROM processos_subsequentes' +
                    ' INNER JOIN processos P ON P.codi_pro = sub_codigo' +
                    ' WHERE pro_codigo = ' + lblCodigo.Caption +
                    ' ORDER BY nome_pro';
      Active:= True;

      while not Eof do begin
         mmoProcSub.Lines.Add(FieldByName('nome_pro').AsString);
         Next;
      end;
   end;
end;

procedure TFormTartaruga.mEntradasClick(Sender: TObject);
begin
   Panel5.SetFocus;
end;

procedure TFormTartaruga.mRequisitosClick(Sender: TObject);
begin
   Panel5.SetFocus;
end;

procedure TFormTartaruga.mSaidasClick(Sender: TObject);
begin
   Panel5.SetFocus;
end;

procedure TFormTartaruga.tmrMensagemTimer(Sender: TObject);
begin
   lbMensagem.Visible:= not lbMensagem.Visible;
   imgGestor.Visible := not imgGestor.Visible;
end;

procedure TFormTartaruga.VerificaPendencias;
var
   wDia, wMes, wAno: Word;
   iMesAnterior: Integer;
   iCodExpCol, iCodEduCol: Integer;
   iCodExpFun, iCodEduFun: Integer;
   iValidacao_educ_exp: Integer;
   iEducacaoEx, iEducacaoCp: Integer;
   iExperienciaEx, iExperienciaCp: Integer;
   bResultado: Boolean;
   iQtdIndicadores: Integer;
   lFlag: Boolean;
   iQtd: Integer;
   sAnoHabilidade, sNotaPendencia: string;
   sTipoRisco: string;
   sRiscoBaixoPfr, sRiscoMedioPfr, sRiscoAltoPfr, sRiscoSeveroPfr: Integer;
   sRiscoBaixoPfo, sRiscoMedioPfo, sRiscoAltoPfo, sRiscoSeveroPfo: Integer;
   sRiscoBaixoAme, sRiscoMedioAme, sRiscoAltoAme, sRiscoSeveroAme: Integer;
   sRiscoBaixoOpo, sRiscoMedioOpo, sRiscoAltoOpo, sRiscoSeveroOpo: Integer;
begin
   // Infraetrutura não gera pendência
   imgInfra.Picture:= imgOk.Picture;

   iEducacaoEx   := 0;
   iEducacaoCp   := 0;
   iExperienciaEx:= 0;
   iExperienciaCp:= 0;

   // Verifica pendências de Análise Crítica
   // Se tiver alguma ação NS-Não Satisfaz ou SP-Satisfaz Parcialmente gera pendência
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select Count(*) as total' +
                    ' FROM analise_acoes' +
                    ' where proc_aac = ' + QuotedStr(lblCodigo.Caption) +
                    '       and (pare_aac = ' + QuotedStr('NS') + ' OR pare_aac = ' + QuotedStr('SP') + ')' +
                    ' group by resp_aac ' +
                    ' Order By resp_aac';
      Active:= True;

      if FieldByName('total').AsInteger <= 0 then begin
         imgCrit.Picture:= imgOk.Picture;
      end
      else begin
         imgCrit.Picture:= imgX.Picture;
      end;

//      if FieldByName('total').AsInteger > 0 then
//         sbCrit.Enabled:= True
//      else
//         sbCrit.Enabled:= False;
   end;

//   // Verifica pendências de Análise Crítica
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' select count(*) as total from Analise_acoes ' +
//                    ' where pare_aac = ' + QuotedStr('NS');
//      Active:= True;
//
//      if FieldByName('total').AsInteger > 0 then
//         sbCrit.Enabled:= True
//      else
//         sbCrit.Enabled:= False;
//   end;

   // Verifica pendências de Procedimentos
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT Count(*) as Total FROM lista_mestra L' +
                    ' INNER JOIN lista_mestra_proc P on P.lis_codiDocumento = L.codi_lis' +
                    ' WHERE lis_codiProcesso = ' + QuotedStr(lblCodigo.Caption) +
                    ' and apro_lis = ' + QuotedStr('N');
//      CommandText:= ' select count(*) as total from lista_mestra ' +
//                    ' where proc_lis = ' + QuotedStr(lblCodigo.Caption) +
//                    ' and apro_lis = ' + QuotedStr('N');
      Active:= True;

      if FieldByName('total').AsInteger <= 0 then begin
         imgProc.Picture:= imgOk.Picture;
      end
      else begin
         imgProc.Picture:= imgX.Picture;
      end;
   end;

   // Verifica pendências de PMC
   lFlag:= True;
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd FROM pmc' +
                    ' WHERE efic_pmc = 2' +  // Em Espera
                    ' AND pmc_preveficacia <= ' + ArrumaDataSQL(Date()) +
                    ' AND prcs_pmc = ' + QuotedStr(lblCodigo.Caption);
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         lFlag:= False
      end;

      // Verifica se tem PMC sem preenchimento nenhum
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd' +
                    ' FROM pmc P' +
                    ' WHERE (imed_pmc = ' + QuotedStr('') +
                    ' OR imed_pmc isnull)' +
                    ' AND prcs_pmc = ' + QuotedStr(lblCodigo.Caption);
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         lFlag:= False
      end;

      // Verifica se tem ações vencidas em PMC do processo
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd' +
                    ' FROM pmc PM' +
                    ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = PM.codi_pmc' +
                    ' WHERE PA.vimp_aco = ' + QuotedStr('') + ' AND PA.aco_prazo <= ' + ArrumaDataSQL(Date()) +
                    ' AND prcs_pmc = ' + QuotedStr(lblCodigo.Caption);
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         lFlag:= False
      end;

      // Verifica todas as pendências de PMC
      if lFlag = True then begin
         imgAcao.Picture:= imgOk.Picture;
      end
      else begin
         imgAcao.Picture:= imgX.Picture;
      end;
   end;

   // Verifica pendências de Manutenção preventiva
   with dm.cdsAuxiliar do begin
      Active:= False;
//      CommandText:= ' SELECT DATE_SUB(CURDATE(), INTERVAL M.quan_man DAY) as DataLimite, ' +
//                    ' MAX(fec_data_realizado) as UltimaData, M.codi_man, ' +
//                    ' man_codigo, fec_codigo, M.proc_man, M.quan_man' +
//                    ' FROM manutencao_fecha F' +
//                    ' INNER JOIN manutencao M ON M.codi_man = F.man_codigo' +
//                    ' WHERE M.proc_man = ' + QuotedStr(lblCodigo.Caption) +
//                    ' GROUP BY F.man_codigo;';

      CommandText:= ' SELECT current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' as DataLimite, ' +
                    ' MAX(fec_data_realizado) as UltimaData, F.man_codigo ' +
                    ' FROM manutencao_fecha F' +
                    ' INNER JOIN manutencao M ON M.codi_man = F.man_codigo' +
                    ' WHERE M.proc_man = ' + QuotedStr(lblCodigo.Caption) +
                    ' GROUP BY F.man_codigo, M.quan_man;';
      Active:= True;
      First;

      lFlag:= True;
      while not Eof do begin
         if FieldByName('DataLimite').AsDateTime > FieldByName('UltimaData').AsDateTime then begin
            lFlag:= False;
         end;
         
         Next;
      end;

      if lFlag = True then begin
         imgManut.Picture:= imgOk.Picture;
      end
      else begin
         imgManut.Picture:= imgX.Picture;
      end;
   end;

   // Verifica pendências de Indicadores
   // Busca os indicadores do processo.
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT codi_ind, peri_ind ' +
                    ' FROM Indicadores' +
                    ' WHERE ind_status = 1 ' + // Ativos
                    ' AND ind_monitoramento = 0' + // Monitoramento = Não
                    ' AND proc_ind = ' + QuotedStr(lblCodigo.Caption);
      Active:= True;
      First;

      lFlag:= True; // Luz Verde
      // Verifica se a última atualização do indicador está cadastrado conforme a periodicidade
      while not Eof do begin
         DecodeDate(date,wAno, wMes, wDia);
         // Determina o mês de atualização do indicador conforme a periodicidade
         case FieldByName('peri_ind').AsInteger of
            0: iMesAnterior:= (wAno * 100) + wMes - 1;
            1: iMesAnterior:= (wAno * 100) + wMes - 2;
            2: iMesAnterior:= (wAno * 100) + wMes - 3;
            3: iMesAnterior:= (wAno * 100) + wMes - 6;
            4: iMesAnterior:= (wAno * 100) + wMes - 12;
            5: iMesAnterior:= (wAno * 100) + wMes - 24;
            6: iMesAnterior:= (wAno * 100) + wMes - 36;
         end;

         if (Copy(IntToStr(iMesAnterior),5,2) = '00') or (StrToInt(Copy(IntToStr(iMesAnterior),5,2)) >= 13) then begin
            case FieldByName('peri_ind').AsInteger of
               0: iMesAnterior:= iMesAnterior - 89;
               1: iMesAnterior:= iMesAnterior - 89;
               2: iMesAnterior:= iMesAnterior - 89;
               3: iMesAnterior:= iMesAnterior - 89;
               4: iMesAnterior:= iMesAnterior - 89;
               5: iMesAnterior:= iMesAnterior - 176;
               6: iMesAnterior:= iMesAnterior - 264;
            end;
         end;

         with cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT Count(*) as TemMesAnt ' +
                          ' FROM valor_indicador' +
//                          ' WHERE proc_vin = ' + QuotedStr(lblCodigo.Caption) +
                          ' WHERE codi_ind = ' + dm.cdsAux.FieldByName('codi_ind').AsString +
                          ' AND peri_vin >= ' + IntToStr(iMesAnterior);
            Active:= True;
         end;

         // Se não tiver lançamento para o último mês da periodicidade, tem pendência
         if cdsAux.FieldByName('TemMesAnt').AsInteger = 0 then begin
            lFlag:= False; // Luz Vermelha
         end;

         Next;
      end;
   end;

   if lFlag = True then begin
      imgIndicadores.Picture:= imgOk.Picture;
   end
   else begin
      imgIndicadores.Picture:= imgX.Picture;
   end;

//    Busca o mês atual
//   DecodeDate(date,wAno, wMes, wDia);
//   iMesAnterior:= (wAno * 100) + wMes -1;
//   if Copy(IntToStr(iMesAnterior),5,2) = '00' then begin
//      iMesAnterior:= iMesAnterior - 88;
//   end;

//   // Verifica se o mês anterior ao atual está cadastrado
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT Count(*) as QtdIndic ' +
//                    ' FROM indicadores' +
//                    ' WHERE proc_ind = ' + QuotedStr(lblCodigo.Caption);
//      Active:= True;
//      iQtdIndicadores:= FieldByName('QtdIndic').AsInteger;
//
//      Active:= False;
////      CommandText:= ' SELECT Max(peri_vin) as UltimoMes from valor_indicador' +
////                    ' where proc_vin = ' + '''' + lblCodigo.Caption + '''';
//      CommandText:= ' SELECT Count(*) as TemMesAnt from valor_indicador' +
//                    ' where proc_vin = ' + QuotedStr(lblCodigo.Caption) +
//                    ' AND peri_vin = ' + IntToStr(iMesAnterior);
//      Active:= True;
//
//
////      if FieldByName('UltimoMes').AsInteger <> iMesAnterior then
//      if FieldByName('TemMesAnt').AsInteger < iQtdIndicadores then
//         sbIndicadores.Enabled:= True  // Vermelho
//      else
//         sbIndicadores.Enabled:= False;   // Verde
//   end;

   // Verifica pendências de Matriz de Competência
   bResultado:= True; // Nenhuma Pendência

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT expe_fun, educ_fun, expe_col, educ_col, col_validacao_educ_exp' +
                    ' FROM funcoes' +
                    ' INNER JOIN colaboradores on codi_fun = func_col' +
                    ' WHERE proc_col = ' + lblCodigo.Caption +
                    ' AND col_status = 1'; // Ativos
      Active:= True;

      First;
      while not Eof do begin
         iCodExpCol:= FieldByName('expe_col').AsInteger;
         iCodEduCol:= FieldByName('educ_col').AsInteger;
         iCodExpFun:= FieldByName('expe_fun').AsInteger;
         iCodEduFun:= FieldByName('educ_fun').AsInteger;
         iValidacao_educ_exp:= FieldByName('col_validacao_educ_exp').AsInteger;

         if iCodExpFun <> 0 then begin
            with cdsAux do begin
               Active:= False;
               CommandText:= ' SELECT orde_com' +
                             ' FROM tabela_combos' +
                             ' WHERE codi_com = ' + IntToStr(iCodExpFun) +
                             ' AND tipo_com = 7';
               Active:= True;

               iExperienciaEx:= cdsAux.FieldByName('orde_com').AsInteger;
            end
         end;

         if iCodExpCol <> 0 then begin
            with cdsAux do begin
               Active:= False;
               CommandText:= ' SELECT orde_com' +
                             ' FROM tabela_combos' +
                             ' WHERE codi_com = ' + IntToStr(iCodExpCol) +
                             ' AND tipo_com = 7';
               Active:= True;

               iExperienciaCp:= cdsAux.FieldByName('orde_com').AsInteger;
            end
         end;

         // Verifica se a EXPERIÊNCIA Exigida é compatível com a Comprovada
         if (iExperienciaEx > iExperienciaCp) and (iValidacao_educ_exp = 0) then begin
            bResultado:= False; // Há inconsistências de Experiência
         end;


         //-----------------------------------------------------------------

         if iCodEduFun <> 0 then begin
            with cdsAux do begin
               Active:= False;
               CommandText:= ' SELECT orde_com' +
                             ' FROM tabela_combos' +
                             ' WHERE codi_com = ' + IntToStr(iCodEduFun) +
                             ' AND tipo_com = 6';
               Active:= True;

               iEducacaoEx:= cdsAux.FieldByName('orde_com').AsInteger;
            end
         end;

         if iCodEduCol <> 0 then begin
            with cdsAux do begin
               Active:= False;
               CommandText:= ' SELECT orde_com' +
                             ' FROM tabela_combos' +
                             ' WHERE codi_com = ' + IntToStr(iCodEduCol) +
                             ' AND tipo_com = 6';
               Active:= True;

               iEducacaoCp:= cdsAux.FieldByName('orde_com').AsInteger;
            end
         end;

         // Verifica se a EDUCAÇÃO Exigida é compatível com a Comprovada
         if (iEducacaoEx < iEducacaoCp) and (iValidacao_educ_exp = 0) then begin
            bResultado:= False; // Há inconsistências de Educação
         end;

         Next;
      end;
   end;

//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT ch.nota_hab FROM colaboradores c ' +
//                    ' inner join colab_habilidades ch on ch.codi_col = c.codi_col ' +
//                    ' WHERE proc_col = ' + lblCodigo.Caption;
//      Active:= True;
//
//      First;
//      while not Eof do begin
//         if FieldByName('nota_hab').AsFloat < BuscaNotaHabilidade() then
//            bResultado:= True; // Há Habilidades abaixo da nota mínima
//         Next;
//      end;
//   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores c ' +
                    ' inner join colab_treinamentos ct on ct.codi_col = c.codi_col ' +
                    ' WHERE col_status = 1' + // Ativos
                    ' AND proc_col = ' + lblCodigo.Caption;

      Active:= True;
      First;

      while not Eof do begin
         if (dm.cdsAuxiliar.FieldByName('dtpr_tre').AsDateTime < Date())
            and (dm.cdsAuxiliar.FieldByName('dtre_tre').AsString = EmptyStr) then begin
            bResultado:= False; // Há treinamentos não realizados
         end;
         Next;
      end;
   end;

   // Verifica se existe algum plano de ação NÃO eficaz dos colaboradores do processo
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT * FROM colaboradores c ' +
//                    ' inner join planoacao pa on pa.cola_pla = c.codi_col ' +
//                    ' WHERE efic_pla = "N" AND proc_col = ' + lblCodigo.Caption;
//      Active:= True;
//
//      if not IsEmpty then
//         bResultado:= True;
//   end;

   // Busca a nota de pendência e o período de avaliação de habilidades em parametros
   with dm.cdsAux3 do begin
      Active:= False;
      CommandText:= ' SELECT notapendencia, periodohab' +
                    ' FROM parametros';
      Active:= True;

      sNotaPendencia:= FieldByName('notapendencia').AsString;
   end;

   // Verifica se tem HABILIDADES cadastradas para o colaborador dentro do período de avaliação
   // gravada em parâmetros no campo "Período e Avaliação de Habilidades"
      // Considerando o ano atual como 2017
      // Se o parâmetro for 1 ano
      //    Se existirem habilidades cadastradas para 2016 não gera pendência
      // Se o parâmetro for 2 anos
      //    Se existirem habilidades cadastradas para 2015 não gera pendência
      // Se o parâmetro for 3 anos
      //    Se existirem habilidades cadastradas para 2014 não gera pendência
   sAnoHabilidade:= IntToStr(CurrentYear() - dm.cdsAux3.FieldByName('periodohab').AsInteger);


   // Busca a lista de colaboradores ativos cadastrados do processo
   with dm.cdsAux2 do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col, col_admissao' +
                    ' FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' and proc_col = ' + lblCodigo.Caption;
      Active:= True;
      First;
      while not Eof do begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT COUNT(*) as Qtd' +
                          ' FROM colab_habilidades H' +
                          ' INNER JOIN Colaboradores C ON C.codi_col = H.codi_col ' +
                          ' INNER JOIN Habilidades HB ON HB.codi_hab = H.codi_hab ' +
                          ' WHERE C.codi_col = ' + dm.cdsAux2.FieldByName('codi_col').AsString +
                          ' AND H.hab_ano >= ' + QuotedStr(sAnoHabilidade);
            Active:= True;

            if FieldByName('Qtd').AsInteger = 0 then begin
               // Verifica se gera pendência pelo parâmetro de dias da primeira avaliação
               // cadastrado em Parâmetros
               if dm.cdsAux2.FieldByName('col_admissao').AsString = '' then begin
                  bResultado:= False;
               end
               else begin
                  if dm.cdsAux2.FieldByName('col_admissao').AsDateTime + BuscarDiasPendHab() < Date() then begin
                     bResultado:= False;
                  end;
               end;
            end;
         end;

         Next;
      end;
   end;

   // Verifica se as notas de HABILIDADES dos colaboradores são menores ou iguais a
   // nota de pendência em parametros, na última avaliação feita

   // Busca a lista de colaboradores cadastrados
   with dm.cdsAux2 do begin
      // Usa a mesma consulta do item acima
      First;
      while not Eof do begin
         // Verifica qual o ano da última avaliação feita
         with dm.cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT MAX(hab_ano) as MaiorAno ' +
                          ' FROM colab_habilidades H' +
                          ' INNER JOIN Colaboradores C ON C.codi_col = H.codi_col' +
                          ' WHERE C.codi_col = ' + dm.cdsAux2.FieldByName('codi_col').AsString +
                          ' AND C.proc_col = ' + lblCodigo.Caption;
            Active:= True;

            sAnoHabilidade:= FieldByName('MaiorAno').AsString;

            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) as Qtd' +
                             ' FROM colab_habilidades H' +
                             ' INNER JOIN Colaboradores C ON C.codi_col = H.codi_col ' +
                             ' INNER JOIN Habilidades HB ON HB.codi_hab = H.codi_hab ' +
                             ' WHERE nota_hab <= ' + sNotaPendencia +
                             ' AND C.codi_col = ' + dm.cdsAux2.FieldByName('codi_col').AsString +
                             ' AND H.hab_ano = ' + QuotedStr(sAnoHabilidade);
               Active:= True;

               if FieldByName('Qtd').AsInteger > 0 then begin
                  bResultado:= False;
               end;
            end;
         end;
         Next;
      end;
   end;

   if bResultado = True then begin
      imgMatriz.Picture:= imgOk.Picture;
   end
   else begin
      imgMatriz.Picture:= imgX.Picture;
   end;

   // Verifica se tem todos os PMC abertos para as análises de risco do processo
   // conforme configuração do tipo em parâmetros.
   // A eficácia do PMC não importa, basta estar aberto.

   // Busca a configuração em Parâmetros
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT risco_baixo_pfr, risco_medio_pfr, risco_alto_pfr, risco_severo_pfr,' +
                    ' risco_baixo_pfo, risco_medio_pfo, risco_alto_pfo, risco_severo_pfo, ' +
                    ' risco_baixo_ame, risco_medio_ame, risco_alto_ame, risco_severo_ame, ' +
                    ' risco_baixo_opo, risco_medio_opo, risco_alto_opo, risco_severo_opo ' +
                    ' FROM parametros';
      Active:= True;

      sRiscoBaixoPfr := FieldByName('risco_baixo_pfr').AsInteger;
      sRiscoMedioPfr := FieldByName('risco_medio_pfr').AsInteger;
      sRiscoAltoPfr  := FieldByName('risco_alto_pfr').AsInteger;
      sRiscoSeveroPfr:= FieldByName('risco_severo_pfr').AsInteger;

      sRiscoBaixoPfo := FieldByName('risco_baixo_pfo').AsInteger;
      sRiscoMedioPfo := FieldByName('risco_medio_pfo').AsInteger;
      sRiscoAltoPfo  := FieldByName('risco_alto_pfo').AsInteger;
      sRiscoSeveroPfo:= FieldByName('risco_severo_pfo').AsInteger;

      sRiscoBaixoAme := FieldByName('risco_baixo_ame').AsInteger;
      sRiscoMedioAme := FieldByName('risco_medio_ame').AsInteger;
      sRiscoAltoAme  := FieldByName('risco_alto_ame').AsInteger;
      sRiscoSeveroAme:= FieldByName('risco_severo_ame').AsInteger;

      sRiscoBaixoOpo := FieldByName('risco_baixo_opo').AsInteger;
      sRiscoMedioOpo := FieldByName('risco_medio_opo').AsInteger;
      sRiscoAltoOpo  := FieldByName('risco_alto_opo').AsInteger;
      sRiscoSeveroOpo:= FieldByName('risco_severo_opo').AsInteger;
   end;

   iQtd:= 0;

   // Externa
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT *' +
                    ' FROM risco_macro' +
                    ' WHERE ((mac_pmc isnull OR mac_pmc = ' + QuotedStr('') + ')' +
                    ' AND (mac_pdca isnull OR mac_pdca =  ' + QuotedStr('') + '))'+
                    ' AND mac_processo = ' + lblCodigo.Caption;
      Active:= True;

      while not Eof do begin
         sTipoRisco:= CalcularRisco(FieldByName('mac_consequencia').AsInteger, FieldByName('mac_probabilidade').AsInteger);

         case FieldByName('mac_tipo').AsInteger of
            0: begin // Ameaça
               if (sRiscoBaixoAme = 1) and (sTipoRisco = 'BAIXO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoMedioAme = 1) and (sTipoRisco = 'MÉDIO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoAltoAme = 1) and (sTipoRisco = 'ALTO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoSeveroAme = 1) and (sTipoRisco = 'SEVERO') then begin
                  iQtd:= iQtd + 1;
               end;
            end;
            1: begin // Oportunidade
               if (sRiscoBaixoOpo = 1) and (sTipoRisco = 'BAIXO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoMedioOpo = 1) and (sTipoRisco = 'MÉDIO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoAltoOpo = 1) and (sTipoRisco = 'ALTO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoSeveroOpo = 1) and (sTipoRisco = 'SEVERO') then begin
                  iQtd:= iQtd + 1;
               end;
            end;
         end;

         Next;
      end;
   end;

   // Interna
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT *' +
                    ' FROM risco_analiseint' +
                    ' WHERE ((int_pmc isnull OR int_pmc = ' + QuotedStr('') + ')' +
                    ' AND (int_pdca isnull OR int_pdca =  ' + QuotedStr('') + '))' +
                    ' AND int_processo = ' + lblCodigo.Caption;
      Active:= True;

      while not Eof do begin
         sTipoRisco:= CalcularRisco(FieldByName('int_consequencia').AsInteger, FieldByName('int_probabilidade').AsInteger);

         case FieldByName('int_tipo').AsInteger of
            0: begin // Ponto Fraco
               if (sRiscoBaixoPfr = 1) and (sTipoRisco = 'BAIXO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoMedioPfr = 1) and (sTipoRisco = 'MÉDIO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoAltoPfr = 1) and (sTipoRisco = 'ALTO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoSeveroPfr = 1) and (sTipoRisco = 'SEVERO') then begin
                  iQtd:= iQtd + 1;
               end;
            end;
            1: begin // Ponto Forte
               if (sRiscoBaixoPfo = 1) and (sTipoRisco = 'BAIXO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoMedioPfo = 1) and (sTipoRisco = 'MÉDIO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoAltoPfo = 1) and (sTipoRisco = 'ALTO') then begin
                  iQtd:= iQtd + 1;
               end;
               if (sRiscoSeveroPfo = 1) and (sTipoRisco = 'SEVERO') then begin
                  iQtd:= iQtd + 1;
               end;
            end;
         end;

         Next;
      end;
   end;

   if iQtd <= 0 then begin
      imgRisco.Picture:= imgOk.Picture;
   end
   else begin
      imgRisco.Picture:= imgX.Picture;
   end;

//-----------------------------------------------------------------
// PDCA
//-----------------------------------------------------------------
   // Verfica se o PDCA tem ações(lançamentos) cadastradas
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT P.pdca_codigo, COUNT(lan_codigo) > 0 as TemAcao' +
//                    ' FROM pdca P' +
//                    ' LEFT JOIN pdca_lanc L ON L.pdca_codigo = P.pdca_codigo' +
//                    ' WHERE P.pdca_processo = ' + lblCodigo.Caption +
//                    ' GROUP BY P.pdca_codigo';
//      Active:= True;
//      First;
//
//      bResultado:= True;
//      while not Eof do begin
//         if FieldByName('TemAcao').AsBoolean = False then begin
//            bResultado:= False;
//            Break;
//         end;
//
//         Next;
//      end;
//   end;

   // Verifica se tem ação, mas o PDCA não foi finalizado, considerando a data de previsão
   bResultado:= True;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT Count(*) as qtd' +
                    ' FROM pdca P ' +
                    ' LEFT JOIN pdca_lanc L ON L.pdca_codigo = P.pdca_codigo ' +
                    ' WHERE P.pdca_processo = ' + lblCodigo.Caption +
                    ' AND (lan_dtprevista is null OR (lan_dtprevista < CURRENT_DATE AND lan_dtfinalizado is null))';
      Active:= True;
      First;

      if FieldByName('qtd').AsInteger > 0 then begin
         bResultado:= False;
      end;
   end;

   if bResultado = True then begin
      imgPDCA.Picture:= imgOk.Picture;
   end
   else begin
      imgPDCA.Picture:= imgX.Picture;
   end;

   // Verifica pendências de RNC
   bResultado:= True;
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd FROM rnc' +
                    ' WHERE (rnc_status = 1 OR rnc_status = 4)' +  // Aberto ou Recusado
                    ' AND rnc_processo = ' + QuotedStr(lblCodigo.Caption);
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         bResultado:= False;
      end;
   end;

   if bResultado = True then begin
      imgRNC.Picture:= imgOk.Picture;
   end
   else begin
      imgRNC.Picture:= imgX.Picture;
   end;
end;

procedure TFormTartaruga.sbAcaoCorretivaClick(Sender: TObject);
begin
   if AcessoTartaruga('AcaoCorretiva') then begin
      FormVisualizaPMC:= TFormVisualizaPMC.Create(nil);
      FormVisualizaPMC.sCodigoProcesso:= lblCodigo.Caption;
      FormVisualizaPMC.ShowModal;
      FormVisualizaPMC.Release;
   end;
end;

procedure TFormTartaruga.sbAnaliseClick(Sender: TObject);
begin
   if AcessoTartaruga('Analise') then begin
      FormVisualizaAnalise:= TFormVisualizaAnalise.Create(nil);
      FormVisualizaAnalise.sCodigoProcesso:= lblCodigo.Caption;
      FormVisualizaAnalise.ShowModal;
      FormVisualizaAnalise.Release;
   end;
end;

procedure TFormTartaruga.sbAuditoriaInternaClick(Sender: TObject);
begin
   if AcessoTartaruga('risco') then begin
      FormAnaliseRisco:= TFormAnaliseRisco.Create(nil);
      FormAnaliseRisco.iTela:= 2;
      FormAnaliseRisco.sCodProcesso:= lblCodigo.Caption;
      FormAnaliseRisco.ShowModal;
      FormAnaliseRisco.Release;
   end;
end;

procedure TFormTartaruga.sbIndicadorClick(Sender: TObject);
begin
   if AcessoTartaruga('Indicadores') then begin
      FormValorIndicadores:= TFormValorIndicadores.Create(nil);
      FormValorIndicadores.lblCodigo.Caption:= lblNomeProcesso.Caption;
      FormValorIndicadores.iProcesso:= StrToInt(lblCodigo.Caption);
      FormValorIndicadores.ShowModal;
      FormValorIndicadores.Release;
   end;
end;

procedure TFormTartaruga.sbInfraestruturaClick(Sender: TObject);
begin
   if AcessoTartaruga('Infraestrutura') then begin
      FormVisualizaInfra:= TFormVisualizaInfra.Create(nil);
      FormVisualizaInfra.sCodigoProcesso:= lblCodigo.Caption;
      FormVisualizaInfra.ShowModal;
      FormVisualizaInfra.Release;
   end;
end;

procedure TFormTartaruga.sbManutencaoClick(Sender: TObject);
begin
   if AcessoTartaruga('Manutencao') then begin
      FormManutencaoFecha:= TFormManutencaoFecha.Create(nil);
      FormManutencaoFecha.sCodProcesso:= lblCodigo.Caption;
      FormManutencaoFecha.ShowModal;
      FormManutencaoFecha.Release;
   end;
end;

procedure TFormTartaruga.sbMatrizClick(Sender: TObject);
var
   lAcesso: Boolean;
begin
//   if Acesso(cUsuario, 18, 'acesso') = 1 then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT proc_usu FROM Usuarios' +
                       ' WHERE nome_usu = ' + QuotedStr(cUsuario);
         Active:= True;

         if FieldByName('proc_usu').AsInteger = 0 then begin
            dm.cdsAux.Active:= False;
            dm.cdsAux.CommandText:= ' SELECT usu_proc FROM usuarios_processos' +
                                    ' WHERE usu_nome = ' + QuotedStr(cUsuario);
            dm.cdsAux.Active:= True;

            dm.cdsAux.First;
            lAcesso:= False;
            while not dm.cdsAux.Eof do begin
               if dm.cdsAux.FieldByName('usu_proc').AsInteger = StrToInt(lblCodigo.Caption) then
                  lAcesso:= True;
               dm.cdsAux.Next;
            end;
         end
         else begin
            lAcesso:= True;
         end;

      end;

      if lAcesso = True then begin
         if AcessoTartaruga('Matriz') then begin
            FormVisualizaMatriz:= TFormVisualizaMatriz.Create(nil);
            FormVisualizaMatriz.ShowModal;
            FormVisualizaMatriz.Release;
         end;
      end
      else begin
         Application.MessageBox(PChar('Usuário ' + cUsuario + ' não tem permissão para acessar a Matriz de Competência'), 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
//   end;
end;

procedure TFormTartaruga.sbPDCAClick(Sender: TObject);
begin
   if AcessoTartaruga('PDCA') then begin
      FormVisualizaPDCA:= TFormVisualizaPDCA.Create(nil);
      FormVisualizaPDCA.lblCodigo.Caption:= lblCodigo.Caption;
      FormVisualizaPDCA.sCodigoProcesso:= lblCodigo.Caption;
      FormVisualizaPDCA.ShowModal;
      FormVisualizaPDCA.Release;
   end;
end;

procedure TFormTartaruga.sbProcedimentosClick(Sender: TObject);
begin
   if AcessoTartaruga('Procedimentos') then begin
      FormVisualizaDocumentos:= TFormVisualizaDocumentos.Create(nil);
      FormVisualizaDocumentos.lblCodigo.Caption:= lblCodigo.Caption;
      FormVisualizaDocumentos.iTela:= 1;
      FormVisualizaDocumentos.ShowModal;
      FormVisualizaDocumentos.Release;
   end;
end;

procedure TFormTartaruga.sbRegistrosClick(Sender: TObject);
begin
   if AcessoTartaruga('Registros') then begin
      FormVisualizaFormularios:= TFormVisualizaFormularios.Create(nil);
      FormVisualizaFormularios.lblCodigo.Caption:= lblCodigo.Caption;
      FormVisualizaFormularios.ShowModal;
      FormVisualizaFormularios.Release;
   end;
end;

procedure TFormTartaruga.sbRNCClick(Sender: TObject);
begin
   if AcessoTartaruga('RNC') then begin
      FormVisualizaRNC:= TFormVisualizaRNC.Create(nil);
      FormVisualizaRNC.sCodigoProcesso:= lblCodigo.Caption;
      FormVisualizaRNC.ShowModal;
      FormVisualizaRNC.Release;
      FreeAndNil(FormVisualizaRNC);
   end;
end;

procedure TFormTartaruga.btnSairClick(Sender: TObject);
begin
   Self.Close;
//   t_Principal.dbimage1.Visible:= True;
end;

function TFormTartaruga.BuscaNotaHabilidade: Real;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT nota_padrao_habilidade FROM Parametros';
      Active:= True;

      Result:= FieldByName('nota_padrao_habilidade').AsFloat;
   end;
end;

end.
