unit frm_AuditoriaAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass, frxDCtrl, frxPreview,
  frxDBSet, DBCtrls, Mask, rxToolEdit;

type
   TFormAuditoriaAuto = class(TForm)
    pnlEsquerda: TPanel;
    pnlRelatorio: TPanel;
    dbgAuditorias: TDBGrid;
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
    zqryProcessoImp: TZQuery;
    dspProcessoImp: TDataSetProvider;
    cdsProcessoImp: TClientDataSet;
    cds2: TLargeintField;
    cds3: TWideStringField;
    dsProcessoImp: TDataSource;
    zqryFuncoes: TZQuery;
    dspFuncoes: TDataSetProvider;
    pnl1: TPanel;
    btnSair: TBitBtn;
    btnGerarAuditoria: TBitBtn;
    btnImprimir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    cdsFuncoes: TClientDataSet;
    dsFuncoes: TDataSource;
    cdsFuncoescodi_fun: TLargeintField;
    cdsFuncoesdesc_fun: TWideStringField;
    cdsAuditoriaFuncaoGestor: TStringField;
    btnEvidencias: TBitBtn;
    pnlEvidencias: TPanel;
    pnl2: TPanel;
    btnSairEvid: TBitBtn;
    pnlTitulo: TPanel;
    pnls: TPanel;
    btnGravarEvid: TBitBtn;
    lbl18: TLabel;
    dblProcesso: TDBLookupComboBox;
    lbl2: TLabel;
    edtIdentificacao: TEdit;
    lbl8: TLabel;
    mmoConformidade: TMemo;
    mmoNaoConformidade: TMemo;
    lbl1: TLabel;
    edtRequisito: TEdit;
    lbl3: TLabel;
    zqryProcessosEvid: TZQuery;
    dspProcessosEvid: TDataSetProvider;
    cdsProcessosEvid: TClientDataSet;
    dsProcessosEvid: TDataSource;
    btnExcluir: TBitBtn;
    zqryCabec: TZQuery;
    dspCabec: TDataSetProvider;
    cdsCabec: TClientDataSet;
    frxDBDSCabec: TfrxDBDataset;
    cdsCabecnome_emp: TWideStringField;
    cdsCabecemp_escopo: TWideMemoField;
    cdsCabecaud_data: TDateTimeField;
    cdsCabecaud_auditor: TWideStringField;
    cdsCabecaud_periodo_ini: TDateTimeField;
    cdsCabecaud_periodo_fim: TDateTimeField;
    cdsCabecaud_data_programa: TDateTimeField;
    procedure btn1Click(Sender: TObject);
    procedure btnSairEvidClick(Sender: TObject);
    procedure GerarAuditoria();
    procedure frxReport1Preview(Sender: TObject);
    procedure AtualizarDados();
    procedure FormShow(Sender: TObject);
    procedure dbgAuditoriasCellClick(Column: TColumn);
    procedure Impressao();
    procedure Botoes(lFlag: Boolean);
    procedure btnGerarAuditoriaClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnEvidenciasClick(Sender: TObject);
    procedure btnGravarEvidClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iContinua: Integer; // 0 - Não cria o relatório / 1 - Cria o relatório
  end;

var
  FormAuditoriaAuto: TFormAuditoriaAuto;

implementation

uses
   frm_dm, Funcoes, frm_Inicial, frm_CadAuditoriaAutoCabec;

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

   with cdsProcessoImp do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsProcessosEvid do begin
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

procedure TFormAuditoriaAuto.btnEvidenciasClick(Sender: TObject);
begin
   if Acesso(cUsuario, 63, 'cadastro') = 1 then begin
      AbrePanel(pnlEvidencias, Self);
      pnlTitulo.Caption:= ' Cadastro de Evidências - ' + cdsGravadas.FieldByName('aud_data').AsString;
      TryFocus(dblProcesso);
   end;
end;

procedure TFormAuditoriaAuto.btnExcluirClick(Sender: TObject);
begin
   if Acesso(cUsuario, 63, 'exclusao') = 1 then begin
      if Application.MessageBox(PChar('Confirma a exclusão da auditoria de ' + cdsGravadas.FieldByName('aud_data').AsString + ' ?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         Executar(' DELETE FROM auditoria_auto' +
                  ' WHERE aud_data = ' + ArrumaDataSQL(cdsGravadas.FieldByName('aud_data').AsDateTime));

         AtualizarDados();
      end;
   end;
end;

procedure TFormAuditoriaAuto.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
   cdsAuditoria.Active:= False;
end;

procedure TFormAuditoriaAuto.btnGerarAuditoriaClick(Sender: TObject);
begin
   if Acesso(cUsuario, 63, 'cadastro') = 1 then begin
      FormCadAuditoriaAutoCabec:= TFormCadAuditoriaAutoCabec.Create(nil);
//      if cdsGravadas.FieldByName('aud_data').AsString = '' then begin
         FormCadAuditoriaAutoCabec.dDataAuditoria:= Date();
//      end
//      else begin
//         FormCadAuditoriaAutoCabec.dDataAuditoria:= cdsGravadas.FieldByName('aud_data').AsDateTime;
//      end;

      FormCadAuditoriaAutoCabec.ShowModal;
      FormCadAuditoriaAutoCabec.Release;

      if iContinua = 1 then begin
         btnEvidencias.Enabled:= False;
         btnExcluir.Enabled   := False;
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
   end;
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

   Auditoria('RELATÓRIO DE AUDITORIA AUTOMÁTICA', DateToStr(Date()), 'I','');

   cdsAuditoria.Close;

   Botoes(True);
   AtualizarDados();
end;

procedure TFormAuditoriaAuto.btnGravarEvidClick(Sender: TObject);
begin
   try
      // Grava os dados em tabela
      Executar(' INSERT INTO auditoria_auto(' +
               ' aud_codigo, aud_data, aud_conformidade, aud_requisito, ' +
               ' aud_naoconformidade, aud_tipo, aud_processo, aud_gestor) ' +
               ' VALUES(' +
               BuscarNovoCodigo('auditoria_auto', 'aud_codigo') + ',' +
               ArrumaDataSQL(cdsGravadas.FieldByName('aud_data').AsDateTime) + ',' +
               QuotedStr(mmoConformidade.Text) + ',' +
               QuotedStr(edtRequisito.Text) + ',' +
               QuotedStr(mmoNaoConformidade.Text) + ',' +
               QuotedStr(edtIdentificacao.Text) + ',' +
               QuotedStr(dblProcesso.KeyValue) + ',' +
               '0' +
   //            Nulo(FieldByName('aud_gestor').AsString, 'I') +
               ')');

      Application.MessageBox('Evidência gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
   except
      on E:Exception do begin
         MostrarErro('Erro ao gravar evidência', E.Message, Self.Name);
      end;
   end;

   Impressao();
end;

procedure TFormAuditoriaAuto.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormAuditoriaAuto.btnSairEvidClick(Sender: TObject);
begin
   pnlEvidencias.Visible:= False;
end;

procedure TFormAuditoriaAuto.dbgAuditoriasCellClick(Column: TColumn);
begin
   btnExcluir.Enabled:= True;
   Impressao();
end;

procedure TFormAuditoriaAuto.FormShow(Sender: TObject);
begin
   AtualizarDados();
   btnGravar.Enabled    := False;
   btnCancelar.Enabled  := False;
   btnExcluir.Enabled   := False;
   btnEvidencias.Enabled:= False;
   pnlEvidencias.Visible:= False;
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
   sFuncaoGestor: string;
   sRequisito: string;
begin
   // Seleciona os processos para verificação dos itens da Auditoria Automática
   sRequisito:= '9.3';

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, gest_pro, F.desc_fun,' +
                    ' entr_pro, said_pro, requ_pro,' +
                    ' (SELECT COUNT(*) FROM processos_antecedentes WHERE pro_codigo = codi_pro) as ProcAntec,' +
                    ' (SELECT COUNT(*) FROM processos_subsequentes WHERE pro_codigo = codi_pro) as ProcSub' +
                    ' FROM processos' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = gest_pro' +
                    ' LEFT JOIN funcoes F ON F.codi_fun = C.func_col' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   while not dm.cdsAuxiliar.Eof do begin
      sCodProcesso := dm.cdsAuxiliar.FieldByName('codi_pro').AsString;
      sCodGestor   := dm.cdsAuxiliar.FieldByName('gest_pro').AsString;
      sFuncaoGestor:= dm.cdsAuxiliar.FieldByName('desc_fun').AsString;

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
               sNaoConformidade:= sNaoConformidade + 'Requisito: ' + sRequisito + ' - NC - ' +
                                  FieldByName('said_aac').AsString + ' ' + 'Prazo: ' +
                                  FieldByName('praz_aac').AsString + #13 + #13;

               dm.cdsAux.Next;
            end;
         end;

         // Grava os dados na tabela em memória
         cdsAuditoria.Append;

         cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
         cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
         cdsAuditoria.FieldByName('aud_requisito').AsString      := sRequisito;
         cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
         cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Análise Crítica';
         cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
         cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;
         cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

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
         cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

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
         cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

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
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

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
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

      cdsAuditoria.Post;

      // ***** Infraestrutura
      sConformidade:= '';
      sNaoConformidade:= '';

      // Verifica se tem PMC com previsão de eficácia vencida
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT iden_inf || ' + QuotedStr('-') + ' || desc_inf as Equipamento' +
                       ' FROM infraestrutura' +
                       ' WHERE proc_inf = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY RANDOM() LIMIT 3';
         Active:= True;

         while not dm.cdsAux.Eof do begin
            sConformidade:= sConformidade + FieldByName('Equipamento').AsString + #13;

            dm.cdsAux.Next;
         end;
      end;

      if sConformidade = '' then begin
         sConformidade:= 'Sem Pendências';
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '7.1.3';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Infraestrutura';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

      cdsAuditoria.Post;

      // ***** Manutenção Preventiva antiga
      sConformidade:= '';
      sNaoConformidade:= '';

      // Verifica se tem manutenção preventiva vencida (Modelo antigo)
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' as DataLimite, ' +
                       ' MAX(fec_data_realizado) as UltimaData, F.man_codigo, I.iden_inf || ' + QuotedStr('-') + ' || I.desc_inf as iden_inf,  M.oque_man, ' +
                       ' M.quan_man, TC.valo_com as Periodicidade ' +
                       ' FROM manutencao_fecha F' +
                       ' INNER JOIN manutencao M ON M.codi_man = F.man_codigo' +
                       ' INNER JOIN infraestrutura I ON I.codi_inf = M.codi_inf AND I.inf_status = 1' + // Ativos
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 19 AND TC.codi_com = cast(M.quan_man as integer)' +
                       ' WHERE M.proc_man = ' + QuotedStr(sCodProcesso) +
                       ' GROUP BY F.man_codigo, M.quan_man, I.desc_inf, I.iden_inf, M.oque_man, TC.valo_com' +
                       ' HAVING current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' > MAX(fec_data_realizado)';
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= 'Verificadas manutenções preventivas vencidas:' + #13;
         end;

         while not dm.cdsAux.Eof do begin
            sNaoConformidade:= sNaoConformidade + FieldByName('iden_inf').AsString + #13 +
                               'Última data realizada: ' + FieldByName('UltimaData').AsString + #13 +
                               'Prazo limite: ' + FieldByName('DataLimite').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Mostra as manutenções dentro do prazo (3 aleatórias)
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' as DataLimite, ' +
                       ' MAX(fec_data_realizado) as UltimaData, F.man_codigo, I.iden_inf || ' + QuotedStr('-') + ' || I.desc_inf as iden_inf,  M.oque_man, ' +
                       ' M.quan_man, TC.valo_com as Periodicidade ' +
                       ' FROM manutencao_fecha F' +
                       ' INNER JOIN manutencao M ON M.codi_man = F.man_codigo' +
                       ' INNER JOIN infraestrutura I ON I.codi_inf = M.codi_inf AND I.inf_status = 1' + // Ativos
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 19 AND TC.codi_com = cast(M.quan_man as integer)' +
                       ' WHERE M.proc_man = ' + QuotedStr(sCodProcesso) +
                       ' GROUP BY F.man_codigo, M.quan_man, I.desc_inf, I.iden_inf, M.oque_man, TC.valo_com' +
                       ' HAVING current_date - cast(M.quan_man as integer) * INTERVAL ' + QuotedStr('1 day') + ' <= MAX(fec_data_realizado)' +
                       ' ORDER BY RANDOM() LIMIT 3';
         Active:= True;

         while not dm.cdsAux.Eof do begin
            sConformidade:= sConformidade + FieldByName('iden_inf').AsString + #13 +
                         'Última data realizada: ' + FieldByName('UltimaData').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      if sConformidade = '' then begin
         sConformidade:= 'Sem Pendências';
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '7.1.3';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Manutenção Preventiva (Antiga)';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

      cdsAuditoria.Post;

      // ***** Matriz de Competências
      sConformidade:= '';
      sNaoConformidade:= '';

      // Mostra os colaboradores que não atendem a Educação exigida na função
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_col, nome_col, educ_col, F.desc_fun as Funcao,' +
                       ' TC1.orde_com as OrdemEduc, TC1.valo_com as educacaoCol,' +
                       ' TC2.orde_com as OrdemEducFun, TC2.valo_com as educacaoFun' +
                       ' FROM colaboradores C' +
                       ' INNER JOIN funcoes F ON F.codi_fun = C.func_col' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 6 AND TC1.codi_com = C.educ_col' +
                       ' INNER JOIN tabela_combos TC2 ON TC2.tipo_com = 6 AND TC2.codi_com = F.educ_fun' +
                       ' WHERE TC1.orde_com > TC2.orde_com' +
                       '       AND C.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= 'Não evidenciado atendimento à educação prevista na matriz de competência para:' + #13;
         end;

         while not dm.cdsAux.Eof do begin
            sNaoConformidade:= sNaoConformidade + FieldByName('nome_col').AsString + #13 +
                         'Função: ' + FieldByName('Funcao').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Mostra os colaboradores que não atendem a Experiência exigida na função
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_col, nome_col, expe_col, F.desc_fun as Funcao,' +
                       ' TC1.orde_com as OrdemExp, TC1.valo_com as ExpCol,' +
                       ' TC2.orde_com as OrdemExpFun, TC2.valo_com as ExpFun' +
                       ' FROM colaboradores C' +
                       ' INNER JOIN funcoes F ON F.codi_fun = C.func_col' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 7 AND TC1.codi_com = C.expe_col' +
                       ' INNER JOIN tabela_combos TC2 ON TC2.tipo_com = 7 AND TC2.codi_com = F.expe_fun' +
                       ' WHERE TC1.orde_com < TC2.orde_com' +
                       '       AND C.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= sNaoConformidade + 'Não evidenciado atendimento à experiência prevista na matriz de competência para:' + #13;
         end;

         while not dm.cdsAux.Eof do begin
            sNaoConformidade:= sNaoConformidade + FieldByName('nome_col').AsString + #13 +
                         'Função: ' + FieldByName('Funcao').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Mostra os colaboradores que tem Treinamentos com previsão vencida ou sem data de previsão
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.nome_col, T.desc_tre as Treinamento,' +
                       ' CT.dtpr_tre, CT.dtre_tre' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE (dtpr_tre is null OR (dtpr_tre < CURRENT_DATE AND dtre_tre is null))' +
                       '       AND C.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= sNaoConformidade + 'Evidenciados treinamentos com previsão vencida ou sem data de previsão:' + #13;
         end;

         while not dm.cdsAux.Eof do begin
            sNaoConformidade:= sNaoConformidade + FieldByName('nome_col').AsString + #13 +
                         'Treinamento: ' + FieldByName('Treinamento').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Mostra os colaboradores que tem Treinamentos sem verificação de eficácia
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, CT.codi_col, T.desc_tre as Treinamento, CT.codi_tre, ' +
                       ' CT.dtpr_tre, CT.dtre_tre, CT.codi_pla, CT.tipo_tre, CT.tre_certificado' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col AND C.col_status = 1' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE (codi_pla = 0 OR codi_pla isnull) and (dtre_tre notnull)' +
                       '       AND C.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY nome_col';
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= sNaoConformidade + 'Evidenciados treinamentos sem verificação de eficácia:' + #13;
         end;

         while not dm.cdsAux.Eof do begin
            sNaoConformidade:= sNaoConformidade + FieldByName('nome_col').AsString + #13 +
                         'Treinamento: ' + FieldByName('Treinamento').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Busca 3 funções de colaboradores aleatórias
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.nome_col, C.func_col,' +
                       ' F.desc_fun as Funcao' +
                       ' FROM colaboradores C' +
                       ' INNER JOIN funcoes F ON F.codi_fun = C.func_col' +
                       ' WHERE C.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY RANDOM() LIMIT 3';
         Active:= True;

         while not dm.cdsAux.Eof do begin
            sConformidade:= sConformidade + FieldByName('nome_col').AsString + #13 +
                         'Função: ' + FieldByName('Funcao').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Busca 3 treinamentos de colaboradores aleatórias
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.codi_tre, C.dtpr_tre, C.dtre_tre,' +
                       ' T.desc_tre as Treinamento, CL.nome_col as Colaborador' +
                       ' FROM colab_treinamentos C' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = C.codi_tre' +
                       ' INNER JOIN colaboradores CL ON CL.codi_col = C.codi_col' +
                       ' WHERE dtre_tre notnull' +
                       ' AND CL.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY RANDOM() LIMIT 3';
         Active:= True;

         while not dm.cdsAux.Eof do begin
            sConformidade:= sConformidade + FieldByName('Colaborador').AsString + #13 +
                         'Treinamento: ' + FieldByName('Treinamento').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Busca 3 habilidades de colaboradores aleatórias
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.codi_hab, MAX(C.hab_ano) as Ano, ' +
                       ' H.desc_hab as Habilidade, CL.nome_col as Colaborador' +
                       ' FROM colab_habilidades C' +
                       ' INNER JOIN habilidades H ON H.codi_hab = C.codi_hab' +
                       ' INNER JOIN colaboradores CL ON CL.codi_col = C.codi_col' +
                       ' WHERE CL.proc_col = ' + QuotedStr(sCodProcesso) +
                       ' GROUP BY C.codi_col, C.codi_hab, H.desc_hab, CL.nome_col ' +
                       ' ORDER BY RANDOM() LIMIT 3';
         Active:= True;

         while not dm.cdsAux.Eof do begin
            sConformidade:= sConformidade + FieldByName('Colaborador').AsString + #13 +
                         'Habilidade: ' + FieldByName('Habilidade').AsString + ' - ' +
                         FieldByName('Ano').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      if sConformidade = '' then begin
         sConformidade:= 'Sem Pendências';
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '7.2';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Matriz de Competências';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

      cdsAuditoria.Post;

      // ***** Processo
      sConformidade:= '';
      sNaoConformidade:= '';

      // Verifica se o processo tem Processos Antecedente, Processos Subsequentes,
      // Entradas, Saídas, Requisitos e Gestor cadastrados
      if Length(dm.cdsAuxiliar.FieldByName('entr_pro').AsString) < 5 then begin
         sNaoConformidade:= sNaoConformidade + 'Entradas' + #13;
      end
      else begin
         sConformidade:= sConformidade + 'Entradas' + #13;
      end;

      if Length(dm.cdsAuxiliar.FieldByName('said_pro').AsString) < 5 then begin
         sNaoConformidade:= sNaoConformidade + 'Saídas' + #13;
      end
      else begin
         sConformidade:= sConformidade + 'Saídas' + #13;
      end;

      if Length(dm.cdsAuxiliar.FieldByName('requ_pro').AsString) < 5 then begin
         sNaoConformidade:= sNaoConformidade + 'Requisitos ' + #13;
      end
      else begin
         sConformidade:= sConformidade + 'Requisitos' + #13;
      end;

      if dm.cdsAuxiliar.FieldByName('gest_pro').AsString = '' then begin
         sNaoConformidade:= sNaoConformidade + 'Gestor' + #13;
      end
      else begin
         sConformidade:= sConformidade + 'Gestor' + #13;
      end;

      if dm.cdsAuxiliar.FieldByName('ProcAntec').AsInteger <= 0 then begin
         sNaoConformidade:= sNaoConformidade + 'Processos Antecedentes' + #13;
      end
      else begin
         sConformidade:= sConformidade + 'Processos Antecedentes' + #13;
      end;

      if dm.cdsAuxiliar.FieldByName('ProcSub').AsInteger <= 0 then begin
         sNaoConformidade:= sNaoConformidade + 'Processos Subsequentes' + #13;
      end
      else begin
         sConformidade:= sConformidade + 'Processos Subsequentes' + #13;
      end;

      if sNaoConformidade <> EmptyStr then begin
         sNaoConformidade:= 'Não foi evidenciado:' + #13 + sNaoConformidade;
      end;

      if sConformidade <> EmptyStr then begin
         sConformidade:= 'Foi evidenciado:' + #13 + sConformidade;
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '4.4.1';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Processo';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

      cdsAuditoria.Post;

      // ***** Calibração
      sConformidade:= '';
      sNaoConformidade:= '';

      // Mostra os equipamentos com calibração vencida
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT cali_codigo, cali_numero, I.desc_inf as Equipamento, cali_resolucao, cali_localizacao, ' +
                       ' cali_frequencia, cali_faixa, cali_capacidade, cali_criterio,' +
                       ' cali_certificado, cali_datacalibracao, cali_proxcalibracao, cali_padroes,' +
                       ' cali_erro, cali_parecer, cali_processo, cali_arquivo, cali_incerteza,' +
                       ' cali_errototal, cali_aprovado, cali_equip, cali_obs, P.nome_pro' +
                       ' FROM calibracao' +
                       // Usado Inner Join para que os equipamentos excluídos não
                       // apareçam nas pendência(s) de calibração
                       ' INNER JOIN infraestrutura I ON I.codi_inf = cali_equip AND I.inf_status = 1' + // Ativos
                       ' INNER JOIN processos P ON P.codi_pro = cali_processo' +
                       ' WHERE cali_proxcalibracao <= ' + ArrumaDataSQL(Date()) +
                       '       AND cali_processo = ' + QuotedStr(sCodProcesso);
         Active:= True;

         if RecordCount > 0 then begin
            sNaoConformidade:= 'Evidenciado calibração vencida:' + #13;
         end;

         while not dm.cdsAux.Eof do begin
            sNaoConformidade:= sNaoConformidade + FieldByName('Equipamento').AsString + #13 +
                         'Próx. Calibração: ' + FieldByName('cali_proxcalibracao').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Mostra 3 calibrações aleatórias não vencidas
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT cali_codigo, cali_numero, I.desc_inf as Equipamento,' +
                       ' cali_datacalibracao, cali_proxcalibracao' +
                       ' FROM calibracao' +
                       // Usado Inner Join para que os equipamentos excluídos não
                       // apareçam nas pendência(s) de calibração
                       ' INNER JOIN infraestrutura I ON I.codi_inf = cali_equip AND I.inf_status = 1' + // Ativos
                       ' WHERE cali_proxcalibracao > ' + ArrumaDataSQL(Date()) +
                       '       AND cali_processo = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY RANDOM() LIMIT 3';
         Active:= True;

//         if RecordCount > 0 then begin
//            sConformidade:= 'Evidenciado calibração vencida:' + #13;
//         end;

         while not dm.cdsAux.Eof do begin
            sConformidade:= sConformidade + 'Código: ' + FieldByName('cali_codigo').AsString + #13 +
                         'Identificação: ' + FieldByName('cali_numero').AsString + #13 +
                         'Equipamento: ' + FieldByName('Equipamento').AsString + #13 +
                         'Última Calibração: ' + FieldByName('cali_datacalibracao').AsString + #13 +
                         'Próx. Calibração: ' + FieldByName('cali_proxcalibracao').AsString + #13 + #13;
            dm.cdsAux.Next;
         end;
      end;

      // Grava os dados na tabela em memória
      cdsAuditoria.Append;

      cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
      cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
      cdsAuditoria.FieldByName('aud_requisito').AsString      := '7.1.5';
      cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
      cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Calibração';
      cdsAuditoria.FieldByName('aud_processo').AsString       := sCodProcesso;
      cdsAuditoria.FieldByName('aud_gestor').AsString         := sCodGestor;
      cdsAuditoria.FieldByName('FuncaoGestor').AsString       := sFuncaoGestor;

      // Muda o processo
      dm.cdsAuxiliar.Next;
   end;

   // ***** Provedores Externos (Fornecedores)
   sConformidade:= '';
   sNaoConformidade:= '';

   // Busca 3 fornecedores aleatórios
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT forn_nome, forn_validade, forn_avaliacao' +
                    ' FROM fornecedores' +
                    ' WHERE forn_validade > ' + ArrumaDataSQL(Date()) +
                    ' ORDER BY RANDOM() LIMIT 3';
      Active:= True;

      while not dm.cdsAux.Eof do begin
         sConformidade:= sConformidade + FieldByName('forn_nome').AsString + ' - Validade: ' +
                         FieldByName('forn_validade').AsString + ' - Nota: ' +
                         FieldByName('forn_avaliacao').AsString + #13 + #13;

         dm.cdsAux.Next;
      end;
   end;

   // Busca fornecedores com a avaliação vencida
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT forn_nome, forn_validade, forn_avaliacao' +
                    ' FROM fornecedores' +
                    ' WHERE forn_validade <= ' + ArrumaDataSQL(Date()) +
                    ' ORDER BY forn_nome';
      Active:= True;

      sNaoConformidade:= 'Evidenciado homologação vencida:' + #13;

      while not dm.cdsAux.Eof do begin
         sNaoConformidade:= sNaoConformidade + FieldByName('forn_nome').AsString + ' - Validade: ' +
                            FieldByName('forn_validade').AsString + #13 + #13;

         dm.cdsAux.Next;
      end;
   end;

   if (AllTrim(sConformidade) = '') and (dm.cdsAux.RecordCount = 0) then begin
      sConformidade:= 'Sem fornecedores cadastrados';
   end;

   // Grava os dados na tabela em memória
   cdsAuditoria.Append;

   cdsAuditoria.FieldByName('aud_data').AsDateTime         := Date();
   cdsAuditoria.FieldByName('aud_conformidade').AsString   := sConformidade;
   cdsAuditoria.FieldByName('aud_requisito').AsString      := '8.4';
   cdsAuditoria.FieldByName('aud_naoconformidade').AsString:= sNaoConformidade;
   cdsAuditoria.FieldByName('aud_tipo').AsString           := 'Provedores Externos';
   cdsAuditoria.FieldByName('aud_processo').AsString       := '99';
   cdsAuditoria.FieldByName('aud_gestor').AsString         := '';
   cdsAuditoria.FieldByName('FuncaoGestor').AsString       := '';

   cdsAuditoria.Post;
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
                    ' ORDER BY Processo, aud_codigo';
      Active:= True;

      if RecordCount > 0 then begin
         btnEvidencias.Enabled:= True;
      end;
   end;


   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AuditoriaAuto.fr3');
      ShowReport;
   end;
end;

end.
