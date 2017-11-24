unit frm_AuditoriaAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass, frxDCtrl, frxPreview,
  frxDBSet;

type
   TFormAuditoriaAuto = class(TForm)
    pnlEsquerda: TPanel;
    pnl8: TPanel;
    btnSairImp: TBitBtn;
    btnGerarAuditoria: TBitBtn;
    btnImpCalibracao: TBitBtn;
    pnlRelatorio: TPanel;
    btnGravar: TBitBtn;
    dbgAspectos: TDBGrid;
    zqryAuditoria: TZQuery;
    dspAuditoria: TDataSetProvider;
    cdsAuditoria: TClientDataSet;
    dsAuditoria: TDataSource;
    cdsAuditoriaaud_data: TDateTimeField;
    cdsAuditoriaaud_conformidade: TWideMemoField;
    cdsAuditoriaaud_naoconformidade: TWideMemoField;
    cdsAuditoriaaud_tipo: TWideStringField;
    cdsAuditoriaaud_processo: TIntegerField;
    cdsAuditoriaaud_gestor: TIntegerField;
    dbg1: TDBGrid;
    frxReport1: TfrxReport;
    frxPreview1: TfrxPreview;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryGravadas: TZQuery;
    dspGravadas: TDataSetProvider;
    cdsGravadas: TClientDataSet;
    dsGravadas: TDataSource;
    frxDBAuditoriaAuto: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    cdsImprimiraud_codigo: TIntegerField;
    cdsImprimiraud_data: TDateTimeField;
    cdsImprimiraud_conformidade: TWideMemoField;
    cdsImprimiraud_naoconformidade: TWideMemoField;
    cdsImprimiraud_tipo: TWideStringField;
    cdsImprimiraud_processo: TIntegerField;
    cdsImprimiraud_gestor: TIntegerField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirgestor: TWideStringField;
    cdsAuditoriaaud_requisito: TStringField;
    cdsImprimiraud_requisito: TWideStringField;
    cdsImprimirfuncaogestor: TWideStringField;
    dsAux2: TDataSource;
    frxDBDSSemGravar: TfrxDBDataset;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    cdsAuditoriaProcesso: TStringField;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    cdsAuditoriaGestor: TStringField;
    btnCancelar: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnGerarAuditoriaClick(Sender: TObject);
    procedure GerarAuditoria();
    procedure frxReport1Preview(Sender: TObject);
    procedure btnImpCalibracaoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure AtualizarDados();
    procedure FormShow(Sender: TObject);
    procedure dbgAspectosCellClick(Column: TColumn);
    procedure Impressao();
    procedure btnCancelarClick(Sender: TObject);
    procedure Botoes(lFlag: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAuditoriaAuto: TFormAuditoriaAuto;

implementation

uses
   frm_dm, Funcoes;

{$R *.dfm}

procedure TFormAuditoriaAuto.AtualizarDados;
begin
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores';
      Active:= True;
   end;

   with cdsGravadas do begin
      Active:= False;
      CommandText:= ' SELECT aud_data' +
                    ' FROM auditoria_auto' +
                    ' GROUP BY aud_data' +
                    ' ORDER BY aud_data DESC';
      Active:= True;
   end;
end;

procedure TFormAuditoriaAuto.Botoes(lFlag: Boolean);
begin
   btnGerarAuditoria.Enabled:= lFlag;
   btnGravar.Enabled        := not lFlag;
   btnCancelar.Enabled      := not lFlag;
end;

procedure TFormAuditoriaAuto.btn1Click(Sender: TObject);
begin
   pnlRelatorio.Visible:= False;
end;

procedure TFormAuditoriaAuto.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
   cdsAuditoria.Active:= False;
end;

procedure TFormAuditoriaAuto.btnGravarClick(Sender: TObject);
begin
   // Verifica se já tem uma auditoria automática gravada para a data
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd' +
                    ' FROM auditoria_auto' +
                    ' WHERE aud_data = ' + ArrumaDataSQL(Date());
      Active:= True;
   end;

   if dm.cdsAuxiliar.FieldByName('Qtd').AsInteger > 0 then begin
      if Application.MessageBox('Já existe uma auditoria automática gravada para a data. ' +
                                'Deseja substituir para a auditoria atual? ' + #13 +
                                'Não será possível recuperar a auditoria anterior.', 'Aviso', MB_YESNO + MB_ICONWARNING) = IDYES then begin
         // Apaga a auditoria anterior
         Executar('DELETE FROM auditoria_auto' +
                  ' WHERE aud_data = ' + ArrumaDataSQL(Date()));
      end
      else begin
         Exit;
      end;
   end;

   // Grava os dados em tabela
   with cdsAuditoria do begin
      First;
      while not Eof do begin
         Executar(' INSERT INTO auditoria_auto(' +
                  ' aud_codigo, aud_data, aud_conformidade, aud_requisito, ' +
                  ' aud_naoconformidade, aud_tipo, aud_processo, aud_gestor) ' +
                  ' VALUES(' +
                  BuscarNovoCodigo('auditoria_auto', 'aud_codigo') + ',' +
                  ArrumaDataSQL(FieldByName('aud_data').AsDateTime) + ',' +
                  QuotedStr(FieldByName('aud_conformidade').AsString) + ',' +
                  QuotedStr(FieldByName('aud_requisito').AsString) + ',' +
                  QuotedStr(FieldByName('aud_naoconformidade').AsString) + ',' +
                  QuotedStr(FieldByName('aud_tipo').AsString) + ',' +
                  QuotedStr(FieldByName('aud_processo').AsString) + ',' +
                  Nulo(FieldByName('aud_gestor').AsString, 'I') +
                  ')');

         cdsAuditoria.Next;
      end;
   end;

   cdsAuditoria.Close;

   Botoes(True);
   AtualizarDados();
end;

procedure TFormAuditoriaAuto.btnImpCalibracaoClick(Sender: TObject);
begin
//   Impressao();
end;

procedure TFormAuditoriaAuto.btnSairImpClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormAuditoriaAuto.btnGerarAuditoriaClick(Sender: TObject);
begin
   cdsAuditoria.CreateDataSet;
   cdsAuditoria.Open;
   cdsAuditoria.EmptyDataSet;
   GerarAuditoria();
//   cdsAuditoria.Close;
   Botoes(False);

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AuditoriaAutoSemGravar.fr3');
      ShowReport;
   end;
end;

procedure TFormAuditoriaAuto.dbgAspectosCellClick(Column: TColumn);
begin
   Impressao();
end;

procedure TFormAuditoriaAuto.FormShow(Sender: TObject);
begin
   AtualizarDados();
   btnGravar.Enabled  := False;
   btnCancelar.Enabled:= False;
end;

procedure TFormAuditoriaAuto.frxReport1Preview(Sender: TObject);
var
   frmPreview: TfrxPreviewForm;
begin
   inherited;
   frxReport1.PreviewOptions.Modal      := False;
   frxReport1.EngineOptions.DestroyForms:= True;
//   frxReport1.PreviewOptions.Buttons := [pbPrint,pbLoad,pbSave,pbExport,pbZoom,pbFind,pbOutline,pbPageSetup,pbTools,pbNavigator,pbExportQuick,pbNoClose,pbNoFullScreen];
   frxReport1.PreviewForm.Align         := alClient;
   frmPreview:= TfrxPreviewForm(frxReport1.PreviewForm);
   frmPreview.BorderStyle:= bsNone;
   frmPreview.Left  :=0;
   frmPreview.Top   :=0;
   frmPreview.Width := pnlRelatorio.ClientWidth;
   frmPreview.Height:= pnlRelatorio.ClientHeight;
   frmPreview.Parent:= pnlRelatorio;
end;

procedure TFormAuditoriaAuto.GerarAuditoria;
var
   sCodProcesso: string;
   sCodGestor  : string;
   sConformidade, sNaoConformidade: string;
   wDia, wMes, wAno: Word;
   iMesAnterior: Integer;
   sNomeIndicador: string;
   nCont: Integer;
begin
   // Seleciona os processos para verificação dos itens da Auditoria Automática
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, gest_pro FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S');
      Active:= True;
   end;

   while not dm.cdsAuxiliar.Eof do begin
      sCodProcesso:= dm.cdsAuxiliar.FieldByName('codi_pro').AsString;
      sCodGestor  := dm.cdsAuxiliar.FieldByName('gest_pro').AsString;

      // ***** Verificar Análise Crítica
      // Verificar se há algo lançado, se sim e não houver nada em atraso apenas relatar que não há pendencias.
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT said_aac, praz_aac' +
                       ' FROM analise_acoes' +
                       ' WHERE proc_aac = ' + QuotedStr(sCodProcesso) +
                       ' AND praz_aac < ' + ArrumaDataSQL(Date());
         Active:= True;

         sConformidade:= '';
         sNaoConformidade:= '';
         if RecordCount = 0 then begin
            sConformidade:= 'Sem pendencias de análise crítica.';
         end
         else begin
            sNaoConformidade:= 'Evidenciado ações de análise critica vencidas:' + #13;
            while not dm.cdsAux.Eof do begin
               sNaoConformidade:= sNaoConformidade + FieldByName('said_aac').AsString + ' ' + 'Prazo: ' +
                                  FieldByName('praz_aac').AsString + #13 + #13;

               dm.cdsAux.Next;
            end;
         end;

         // Grava os dados na tabela em memória
         cdsAuditoria.Append;

         cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
         cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
         cdsAuditoria.FieldByName('aud_requisito').AsString      := '9.3';
         cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
         cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Análise Crítica';
         cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
         cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;

         cdsAuditoria.Post;
      end;

      // ***** Verifica se tem Indicadores desatualizados de cada processo
      sConformidade:= '';
      sNaoConformidade:= '';
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_ind, desc_ind, peri_ind, P.nome_pro ' +
                       ' FROM Indicadores' +
                       ' INNER JOIN processos P ON P.codi_pro = proc_ind' +
                       ' WHERE ind_monitoramento = 0' + // Não considera indicadores de Monitoramento
                       ' AND proc_ind = ' + QuotedStr(sCodProcesso) +
                       ' AND ind_status = 1'; // Somente indicadores ativos
         // Acertar aqui se não tiver processos para o usuário
         Active:= True;
         First;

         if dm.cdsAux.RecordCount = 0 then begin
            sConformidade:= 'Não há indicadores para esse processo';
         end;

         nCont:= 0;
         // Verifica se a última atualização do indicador está cadastrado conforme a periodicidade
         while not dm.cdsAux.Eof do begin
            sNomeIndicador:= dm.cdsAux.FieldByName('desc_ind').AsString;

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
                  0: iMesAnterior:= iMesAnterior - 88;
                  1: iMesAnterior:= iMesAnterior - 88;
                  2: iMesAnterior:= iMesAnterior - 88;
                  3: iMesAnterior:= iMesAnterior - 88;
                  4: iMesAnterior:= iMesAnterior - 88;
                  5: iMesAnterior:= iMesAnterior - 176;
                  6: iMesAnterior:= iMesAnterior - 264;
               end;
            end;

            with dm.cdsAux2 do begin
               Active:= False;
               CommandText:= ' SELECT V.codi_ind, V.proc_vin, I.desc_ind, I.peri_ind, V.peri_vin ' +
                             ' FROM valor_indicador V' +
                             ' INNER JOIN indicadores I ON I.codi_ind = V.codi_ind' +
                             ' WHERE V.codi_ind = ' + dm.cdsAux.FieldByName('codi_ind').AsString +
                             ' AND peri_vin >= ' + IntToStr(iMesAnterior);
               Active:= True;

               if RecordCount > 0 then begin
//                  sConformidade:= 'Sem pendencias de indicadores.';
               end
               else begin
                  nCont:= nCont + 1;
                  if nCont = 1 then begin
                     sNaoConformidade:= 'Evidenciado indicadores desatualizados:' + #13;
                  end;
                  sNaoConformidade:= sNaoConformidade + sNomeIndicador + #13#13;
               end;
            end;

            Next;
         end;

         // Busca o último valor dos indicadores para criar as Conformidades
//         dm.cdsAux.First;
//         while not dm.cdsAux.Eof do begin
            with dm.cdsAux4 do begin
               Active:= False;
               CommandText:= ' SELECT V.codi_ind, MAX(V.peri_vin) AS anomes' +
                             ' FROM valor_indicador V' +
                             ' WHERE V.proc_vin = ' + QuotedStr(sCodProcesso) +
                             ' GROUP BY V.codi_ind';
               Active:= True;
               First;

               while not dm.cdsAux4.Eof do begin
                  with dm.cdsAux5 do begin
                     Active:= False;
                     CommandText:= ' SELECT V.codi_ind, V.codi_vin, V.peri_vin, I.desc_ind,' +
                                   ' V.proc_vin, V.valo_vin, M.met_anomes, M.met_unidade,' +
                                   ' TC.valo_com || ' + QuotedStr(' ')  + ' || CAST(m.met_valor as numeric(18,2)) || ' +
                                   QuotedStr(' ') + ' || M.met_unidade AS meta,' +
                                   ' SUBSTRING(M.met_anomes, 5, 2) || ' + QuotedStr('/') + ' || SUBSTRING(M.met_anomes, 1, 4) as Anomes,' +
                                   ' P.gest_pro, C.nome_col as gestor, C.col_email as email_gestor' +
                                   ' FROM valor_indicador V' +
                                   ' INNER JOIN indicadores I ON I.codi_ind = V.codi_ind' +
                                   ' LEFT JOIN indicadores_metas M ON m.met_codindicador = V.codi_ind' +
                                   '           and M.met_anomes = cast(v.peri_vin as character varying)' +
                                   ' INNER JOIN processos P ON P.codi_pro = V.proc_vin' +
                                   ' LEFT JOIN colaboradores C ON C.codi_col = P.gest_pro' +
                                   ' INNER JOIN tabela_combos TC ON TC.tipo_com = 17 AND TC.codi_com = M.met_tipo' +
                                   ' WHERE v.codi_ind = ' + dm.cdsAux4.FieldByName('codi_ind').AsString +
                                   ' AND peri_vin = ' + dm.cdsAux4.FieldByName('anomes').AsString;
                     Active:= True;

                     sConformidade:= sConformidade + dm.cdsAux5.FieldByName('desc_ind').AsString + ' Meta:' +
                                     dm.cdsAux5.FieldByName('meta').AsString + ' Resultado: ' +
                                     dm.cdsAux5.FieldByName('Anomes').AsString + ': ' +
                                     dm.cdsAux5.FieldByName('valo_vin').AsString + ' ' +
                                     dm.cdsAux5.FieldByName('met_unidade').AsString + #13#13;
                  end;

                  Next;
               end;
            end;

//            dm.cdsAux.Next;
//         end;

         // Grava os dados na tabela em memória
         cdsAuditoria.Append;

         cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
         cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
         cdsAuditoria.FieldByName('aud_requisito').AsString      := '9.1';
         cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
         cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Indicadores de Desempenho';
         cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
         cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;

         cdsAuditoria.Post;
      end;

      // ***** Verifica procedimentos documentados
      sConformidade:= '';
      sNaoConformidade:= '';

      // Busca procedimentos não aprovados do processo
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_lis, iden_lis, desc_lis, revi_lis, tipo_lis, atua_lis, arqu_lis,' +
                       '        proc_lis, resp_lis, data_lis, apro_lis, dtap_lis, quem_lis, qtde_lis,' +
                       '        arma_lis, lis_treinamento' +
                       ' FROM lista_mestra L' +
                       ' INNER JOIN lista_mestra_proc P on P.lis_codiDocumento = L.codi_lis' +
                       ' WHERE lis_codiProcesso = ' + QuotedStr(sCodProcesso) +
                       ' AND apro_lis = ' + QuotedStr('N');
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= 'Evidenciado procedimentos não aprovados:' + #13;
            while not dm.cdsAux.Eof do begin
               sNaoConformidade:= sNaoConformidade + FieldByName('iden_lis').AsString + ' - ' +
                                  FieldByName('desc_lis').AsString + ' Revisão: ' +
                                  FieldByName('revi_lis').AsString + #13 + #13;

               dm.cdsAux.Next;
            end;
         end;
      end;

      // Busca procedimentos aprovados do processo
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_lis, iden_lis, desc_lis, revi_lis, tipo_lis, atua_lis, arqu_lis,' +
                       '        proc_lis, resp_lis, data_lis, apro_lis, dtap_lis, quem_lis, qtde_lis,' +
                       '        arma_lis, lis_treinamento' +
                       ' FROM lista_mestra L' +
                       ' INNER JOIN lista_mestra_proc P on P.lis_codiDocumento = L.codi_lis' +
                       ' WHERE lis_codiProcesso = ' + QuotedStr(sCodProcesso) +
                       ' AND apro_lis = ' + QuotedStr('S') +
                       ' LIMIT 3';
         Active:= True;

         if RecordCount > 0 then begin
            sConformidade:= 'Evidenciado procedimentos:' + #13;
            while not dm.cdsAux.Eof do begin
               sConformidade:= sConformidade + FieldByName('iden_lis').AsString + ' - ' +
                                  FieldByName('desc_lis').AsString + ' Revisão: ' +
                                  FieldByName('revi_lis').AsString + #13 + #13;

               dm.cdsAux.Next;
            end;
         end;
      end;

      // Grava os dados na tabela em memória
         cdsAuditoria.Append;

         cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
         cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
         cdsAuditoria.FieldByName('aud_requisito').AsString      := '7.5';
         cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
         cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Procedimentos Documentados';
         cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
         cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;

         cdsAuditoria.Post;

      // ***** Verifica registros da qualidade
      sConformidade:= '';
      sNaoConformidade:= '';

      // Busca 3 formulários aleatórios
      with dm.cdsAux do begin
         Active:= False;
         Active:= False;
         CommandText:= ' SELECT DISTINCT nume_for, revi_for, iden_for, arqu_for,' +
                       ' TC.valo_com as tipo_protecao' +
                       ' FROM formularios F' +
                       ' INNER JOIN formularios_locais FL ON FL.for_codForm = F.codi_for' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 1 AND TC.codi_com = FL.for_tipo_protecao' +
                       ' WHERE for_codProcesso = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nume_for' +
                       ' LIMIT 3';
         Active:= True;

         if RecordCount > 0 then begin
            sConformidade:= 'Evidenciado registros da qualidade:' + #13;
            while not dm.cdsAux.Eof do begin
               sConformidade:= sConformidade + FieldByName('nume_for').AsString + ' - ' +
                               FieldByName('iden_for').AsString + ' Revisão: ' +
                               FieldByName('revi_for').AsString + #13 + #13;

               dm.cdsAux.Next;
            end;
         end;
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '7.5';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Registros da Qualidade';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;

      cdsAuditoria.Post;

      // ***** Verifica PMC
      sConformidade:= '';
      sNaoConformidade:= '';

      // Verifica se tem ações do PMC com prazo vencido
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT DISTINCT P.nume_pmc' +
                       ' FROM pmc P' +
                       ' INNER JOIN pmc_acoes PA ON PA.codi_pmc = P.codi_pmc' +
                       ' INNER JOIN colaboradores C ON C.codi_col = PA.resp_aco' +
                       ' WHERE PA.aco_prazo <= ' + ArrumaDataSQL(Date()) + ' AND PA.vimp_aco = ' + QuotedStr('') +
                       ' AND prcs_pmc = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nume_pmc';
         Active:= True;

         if dm.cdsAux.RecordCount > 0 then begin
            sNaoConformidade:= 'Evidenciadas Ações de PMC com prazo vencido:' + #13;
            while not dm.cdsAux.Eof do begin
               sNaoConformidade:= sNaoConformidade + FieldByName('nume_pmc').AsString + #13;

               dm.cdsAux.Next;
            end;
         end;
      end;

      // Verifica se tem PMC com previsão de eficácia vencida
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT nume_pmc' +
                       ' FROM pmc P' +
//                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 and TC.codi_com = P.tipo_pmc' +
//                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 21 and TC1.codi_com = P.efic_pmc' +
//                       ' INNER JOIN colaboradores C ON C.codi_col = P.resp_pmc' +
                       ' WHERE pmc_preveficacia <= ' + ArrumaDataSQL(Date()) +
                       ' AND efic_pmc = 2' + // Em Espera
                       ' AND prcs_pmc = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nume_pmc';
         Active:= True;

         if dm.cdsAux.RecordCount > 0 then begin
            if sNaoConformidade = '' then begin
               sNaoConformidade:= 'Evidenciado PMC com previsão de eficácia vencido:' + #13;
            end
            else begin
               sNaoConformidade:= sNaoConformidade + #13 + 'Evidenciado PMC com previsão de eficácia vencido:' + #13;
            end;

            while not dm.cdsAux.Eof do begin
               sNaoConformidade:= sNaoConformidade + FieldByName('nume_pmc').AsString + #13;

               dm.cdsAux.Next;
            end;
         end;
      end;

      // Verifica se tem PMC sem preenchimento (considerar se não tiver ações cadastradas)
      nCont:= 0;
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT nume_pmc,' +
                       ' (SELECT COUNT(*) FROM pmc_acoes A WHERE A.codi_pmc = P.codi_pmc) as QtdAcoes' +
                       ' FROM pmc P' +
                       ' WHERE prcs_pmc = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nume_pmc';
         Active:= True;

         while not dm.cdsAux.Eof do begin
            if dm.cdsAux.FieldByName('QtdAcoes').AsInteger <= 0 then begin
               nCont:= nCont + 1;
               if nCont = 1 then begin
                  if sNaoConformidade = '' then begin
                     sNaoConformidade:= 'Evidenciado PMC sem ações cadastradas:' + #13;
                  end
                  else begin
                     sNaoConformidade:= sNaoConformidade + #13 + 'Evidenciado PMC sem ações cadastradas:' + #13;
                  end;
               end;

               sNaoConformidade:= sNaoConformidade + FieldByName('nume_pmc').AsString + #13;
            end;

            dm.cdsAux.Next;
         end;
      end;

      if sNaoConformidade = '' then begin
         sConformidade:= 'Sem Pendências';
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '10';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Ação Corretiva/Preventiva';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;

      cdsAuditoria.Post;



      dm.cdsAuxiliar.Next;
   end;
end;

procedure TFormAuditoriaAuto.Impressao;
begin
   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT aud_codigo, aud_data, aud_conformidade, aud_requisito, aud_naoconformidade,' +
                    '        aud_tipo, aud_processo, aud_gestor, P.nome_pro as Processo,' +
                    '        C.nome_col as Gestor, F.desc_fun as FuncaoGestor' +
                    ' FROM auditoria_auto' +
                    ' INNER JOIN processos P ON P.codi_pro = aud_processo' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = aud_gestor' +
                    ' LEFT JOIN funcoes F ON F.codi_fun = C.func_col' +
                    ' WHERE aud_data = ' + ArrumaDataSQL(cdsGravadas.FieldByName('aud_data').AsDateTime) +
                    ' ORDER BY Processo';
      Active:= True;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AuditoriaAuto.fr3');
      ShowReport;
   end;
end;

end.
