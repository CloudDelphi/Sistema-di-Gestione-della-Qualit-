unit frm_CadParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls, Mask, rxToolEdit, rxCurrEdit, RXSpin;

type
  TFormCadParametros = class(TForm)
    pctParametros: TJvgPageControl;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    zqryParametros: TZQuery;
    dspParametros: TDataSetProvider;
    cdsParametros: TClientDataSet;
    tsCadastro: TTabSheet;
    cdsParametrospesoiqfconformidade: TFloatField;
    cdsParametrospesoiqfpontualidade: TFloatField;
    cdsParametrospesoiqfavaliacao: TFloatField;
    tsIndicadores: TTabSheet;
    cdsParametroscasasindicador: TIntegerField;
    tsRisco: TTabSheet;
    lbl5: TLabel;
    lbl6: TLabel;
    tsEmail: TTabSheet;
    grp1: TGroupBox;
    lbl7: TLabel;
    spnEmailPMC: TRxSpinEdit;
    lbl8: TLabel;
    grp2: TGroupBox;
    lbl9: TLabel;
    lbl10: TLabel;
    spnEmailRisco: TRxSpinEdit;
    cdsParametrosemail_pmc: TIntegerField;
    cdsParametrosemail_risco: TIntegerField;
    tsv: TTabSheet;
    lbl11: TLabel;
    spnNota: TRxSpinEdit;
    cdsParametrosnotamaxhab: TFloatField;
    lbl12: TLabel;
    spnAvisoPMC: TRxSpinEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    spn1: TRxSpinEdit;
    lbl16: TLabel;
    chkEmailPMC: TCheckBox;
    chk2: TCheckBox;
    grp3: TGroupBox;
    chkRiscoBaixoPFO: TCheckBox;
    chkRiscoMedioPFO: TCheckBox;
    chkRiscoAltoPFO: TCheckBox;
    chkRiscoSeveroPFO: TCheckBox;
    grp4: TGroupBox;
    chkRiscoBaixoPFR: TCheckBox;
    chkRiscoMedioPFR: TCheckBox;
    chkRiscoAltoPFR: TCheckBox;
    chkRiscoSeveroPFR: TCheckBox;
    grp5: TGroupBox;
    chkRiscoBaixoOPO: TCheckBox;
    chkRiscoMedioOPO: TCheckBox;
    chkRiscoAltoOPO: TCheckBox;
    chkRiscoSeveroOPO: TCheckBox;
    grp6: TGroupBox;
    chkRiscoBaixoAME: TCheckBox;
    chkRiscoMedioAME: TCheckBox;
    chkRiscoAltoAME: TCheckBox;
    chkRiscoSeveroAME: TCheckBox;
    cdsParametrosrisco_baixo_pfr: TIntegerField;
    cdsParametrosrisco_medio_pfr: TIntegerField;
    cdsParametrosrisco_alto_pfr: TIntegerField;
    cdsParametrosrisco_severo_pfr: TIntegerField;
    cdsParametrosrisco_baixo_opo: TIntegerField;
    cdsParametrosrisco_medio_opo: TIntegerField;
    cdsParametrosrisco_alto_opo: TIntegerField;
    cdsParametrosrisco_severo_opo: TIntegerField;
    cdsParametrosrisco_baixo_ame: TIntegerField;
    cdsParametrosrisco_medio_ame: TIntegerField;
    cdsParametrosrisco_alto_ame: TIntegerField;
    cdsParametrosrisco_severo_ame: TIntegerField;
    cdsParametrosrisco_baixo_pfo: TIntegerField;
    cdsParametrosrisco_medio_pfo: TIntegerField;
    cdsParametrosrisco_alto_pfo: TIntegerField;
    cdsParametrosrisco_severo_pfo: TIntegerField;
    lbl17: TLabel;
    spnNotaPendencia: TRxSpinEdit;
    cdsParametrosnotapendencia: TFloatField;
    lbl18: TLabel;
    dblPeriodoHab: TDBLookupComboBox;
    cdsPeriodoHab: TClientDataSet;
    dspPeriodoHab: TDataSetProvider;
    zqryPeriodoHab: TZQuery;
    dsPeriodoHab: TDataSource;
    cdsPeriodoHabcodi_com: TLargeintField;
    cdsPeriodoHabvalo_com: TWideStringField;
    cdsParametrosperiodohab: TIntegerField;
    lbl19: TLabel;
    spnPrimeiraAvaliacao: TRxSpinEdit;
    lbl20: TLabel;
    cdsParametrosprimeiraavaliacao: TIntegerField;
    cdsParametrosaviso_pmc: TIntegerField;
    cdsParametrosnao_enviar_email_pmc: TIntegerField;
    tsRiscosCores: TTabSheet;
    grp7: TGroupBox;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    pnlBaixoOp1a: TPanel;
    pnlAltoOp1a: TPanel;
    pnlMedioOp1a: TPanel;
    pnlSeveroOp1a: TPanel;
    grp8: TGroupBox;
    lbl26: TLabel;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    pnlBaixoOp1b: TPanel;
    pnlAltoOp1b: TPanel;
    pnlMedioOp1b: TPanel;
    pnlSeveroOp1b: TPanel;
    grp9: TGroupBox;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    pnlBaixoOp2b: TPanel;
    pnlAltoOp2b: TPanel;
    pnlMedioOp2b: TPanel;
    pnlSeveroOp2b: TPanel;
    grp10: TGroupBox;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    pnlBaixoOp2a: TPanel;
    pnlAltoOp2a: TPanel;
    pnlMedioOp2a: TPanel;
    pnlSeveroOp2a: TPanel;
    cdsParametrosriscos_cores: TIntegerField;
    rbOpcao1: TRadioButton;
    rbOpcao2: TRadioButton;
    grp11: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtAvaliacao: TCurrencyEdit;
    edtPontualidade: TCurrencyEdit;
    edtConformidade: TCurrencyEdit;
    grp13: TGroupBox;
    lbl21: TLabel;
    dtPMC: TDateEdit;
    lbl38: TLabel;
    btnLimpaDataPMC: TBitBtn;
    cdsParametrosdata_filtro_pmc: TDateTimeField;
    tsAvisoCalib: TTabSheet;
    lbl39: TLabel;
    lbl40: TLabel;
    dblColCalibracao: TDBLookupComboBox;
    dblColManutencao: TDBLookupComboBox;
    dbgCalibracao: TDBGrid;
    dbgManutencao: TDBGrid;
    btnInserirEmailCalib: TBitBtn;
    btnExcluirEmailCalib: TBitBtn;
    btnInserirEmailManut: TBitBtn;
    btnExcluirEmailManut: TBitBtn;
    zqryParEmailCalib: TZQuery;
    dspParEmailCalib: TDataSetProvider;
    cdsParEmailCalib: TClientDataSet;
    dsParEmailCalib: TDataSource;
    zqryParEmailManut: TZQuery;
    dspParEmailManut: TDataSetProvider;
    cdsParEmailManut: TClientDataSet;
    dsParEmailManut: TDataSource;
    zqryColabCalibracao: TZQuery;
    dspColabCalibracao: TDataSetProvider;
    cdsColabCalibracao: TClientDataSet;
    dsColabCalibracao: TDataSource;
    zqryColabManut: TZQuery;
    dspColabManut: TDataSetProvider;
    cdsColabManut: TClientDataSet;
    dsColabManut: TDataSource;
    grp12: TGroupBox;
    lbl15: TLabel;
    lbl4: TLabel;
    lblExemplo: TLabel;
    spnCasas: TRxSpinEdit;
    grp14: TGroupBox;
    lbl41: TLabel;
    spnDiaAtuIndicador: TRxSpinEdit;
    cdsParametrosdias_indicadores: TIntegerField;
    chkEnvioGestor: TCheckBox;
    cdsParametrosenviogestor: TIntegerField;
    procedure btnSairClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgContextosCellClick(Column: TColumn);
    function ValidarDados(): Boolean;
    procedure spnCasasChange(Sender: TObject);
    procedure btnLimpaDataPMCClick(Sender: TObject);
    procedure btnInserirEmailCalibClick(Sender: TObject);
    procedure btnInserirEmailManutClick(Sender: TObject);
    function ValidarDadosEmailCalib(): Boolean;
    function ValidarDadosEmailManut(): Boolean;
    procedure btnExcluirEmailCalibClick(Sender: TObject);
    procedure btnExcluirEmailManutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadParametros: TFormCadParametros;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadParametros.AtualizarDados;
begin
   cdsParametros.Active:= False;
   cdsParametros.Active:= True;

   with cdsPeriodoHab do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 31' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsColabCalibracao do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' WHERE col_status = 1' +
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsColabManut do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' WHERE col_status = 1' +
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsParEmailCalib do begin
      Active:= False;
      CommandText:= ' SELECT par_codigo, par_tipo, par_colaborador, C.nome_col' +
                    ' FROM parametros_email_aviso' +
                    ' INNER JOIN colaboradores C ON C.codi_col = par_colaborador' +
                    ' WHERE par_tipo = ' + QuotedStr('C');
      Active:= True;

      btnExcluirEmailCalib.Enabled:= RecordCount > 0;
   end;

   with cdsParEmailManut do begin
      Active:= False;
      CommandText:= ' SELECT par_codigo, par_tipo, par_colaborador, C.nome_col' +
                    ' FROM parametros_email_aviso' +
                    ' INNER JOIN colaboradores C ON C.codi_col = par_colaborador' +
                    ' WHERE par_tipo = ' + QuotedStr('M');
      Active:= True;

      btnExcluirEmailManut.Enabled:= RecordCount > 0;
   end;
end;

procedure TFormCadParametros.Botoes(Flag: Boolean);
begin
   btnAlterar.Enabled      := Flag;
   btnGravar.Enabled       := not Flag;
   btnCancelar.Enabled     := not Flag;
   btnLimpaDataPMC.Enabled := not Flag;
end;

procedure TFormCadParametros.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 43, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, -1);
   btnExcluirEmailCalib.Enabled:= cdsParEmailCalib.RecordCount > 0;
   btnExcluirEmailManut.Enabled:= cdsParEmailManut.RecordCount > 0;
//   TryFocus(edtAvaliacao);
   Botoes(False);
end;

procedure TFormCadParametros.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, -1);
end;

procedure TFormCadParametros.btnExcluirEmailCalibClick(Sender: TObject);
begin
   Executar(' DELETE FROM parametros_email_aviso' +
            ' WHERE par_codigo = ' + cdsParEmailCalib.FieldByName('par_codigo').AsString);

   AtualizarDados();
end;

procedure TFormCadParametros.btnExcluirEmailManutClick(Sender: TObject);
begin
   Executar(' DELETE FROM parametros_email_aviso' +
            ' WHERE par_codigo = ' + cdsParEmailManut.FieldByName('par_codigo').AsString);

   AtualizarDados();
end;

procedure TFormCadParametros.btnGravarClick(Sender: TObject);
var
   sOpcaoCoresRisco: string;
begin
   if ValidarDados() then begin
      try
         if rbOpcao1.Checked = True then begin
            sOpcaoCoresRisco:= '0';
         end
         else begin
            sOpcaoCoresRisco:= '1';
         end;

         with cdsGravar do begin
            Active:= False;
               CommandText:= ' UPDATE parametros SET' +
                             ' pesoiqfconformidade = ' + VirgulaParaPonto(edtConformidade.Value, 0) + ',' +
                             ' pesoiqfpontualidade = ' + VirgulaParaPonto(edtPontualidade.Value, 0) + ',' +
                             ' pesoiqfavaliacao = ' + VirgulaParaPonto(edtAvaliacao.Value, 0) + ',' +
                             ' casasindicador = ' + spnCasas.Text + ',' +
                             ' risco_baixo_pfo = ' + LogicoParaString(chkRiscoBaixoPFO.Checked) + ',' +
                             ' risco_medio_pfo = ' + LogicoParaString(chkRiscoMedioPFO.Checked) + ',' +
                             ' risco_alto_pfo = ' + LogicoParaString(chkRiscoAltoPFO.Checked) + ',' +
                             ' risco_severo_pfo = ' + LogicoParaString(chkRiscoSeveroPFO.Checked) + ',' +
                             ' risco_baixo_pfr = ' + LogicoParaString(chkRiscoBaixoPFR.Checked) + ',' +
                             ' risco_medio_pfr = ' + LogicoParaString(chkRiscoMedioPFR.Checked) + ',' +
                             ' risco_alto_pfr = ' + LogicoParaString(chkRiscoAltoPFR.Checked) + ',' +
                             ' risco_severo_pfr = ' + LogicoParaString(chkRiscoSeveroPFR.Checked) + ',' +
                             ' risco_baixo_opo = ' + LogicoParaString(chkRiscoBaixoOPO.Checked) + ',' +
                             ' risco_medio_opo = ' + LogicoParaString(chkRiscoMedioOPO.Checked) + ',' +
                             ' risco_alto_opo = ' + LogicoParaString(chkRiscoAltoOPO.Checked) + ',' +
                             ' risco_severo_opo = ' + LogicoParaString(chkRiscoSeveroOPO.Checked) + ',' +
                             ' risco_baixo_ame = ' + LogicoParaString(chkRiscoBaixoAME.Checked) + ',' +
                             ' risco_medio_ame = ' + LogicoParaString(chkRiscoMedioAME.Checked) + ',' +
                             ' risco_alto_ame = ' + LogicoParaString(chkRiscoAltoAME.Checked) + ',' +
                             ' risco_severo_ame = ' + LogicoParaString(chkRiscoSeveroAME.Checked) + ',' +
                             ' email_pmc = ' + spnEmailPMC.Text + ',' +
                             ' email_risco = ' + spnEmailRisco.Text + ',' +
                             ' aviso_pmc = ' + spnAvisoPMC.Text + ',' +
                             ' nao_enviar_email_pmc = ' + LogicoParaString(chkEmailPMC.Checked) + ',' +
                             ' notamaxhab = ' + VirgulaParaPonto(spnNota.Value, 0) + ',' +
                             ' notapendencia = ' + VirgulaParaPonto(spnNotaPendencia.Value, 0) + ',' +
                             ' periodohab = ' + QuotedStr(dblPeriodoHab.KeyValue) + ',' +
                             ' primeiraavaliacao = ' + VirgulaParaPonto(spnPrimeiraAvaliacao.Value, 0) + ',' +
                             ' data_filtro_pmc = ' + ArrumaDataSQL(dtPMC.Date) + ',' +
                             ' riscos_cores = ' + sOpcaoCoresRisco + ',' +
                             ' dias_indicadores = ' + spnDiaAtuIndicador.Text + ',' +
                             ' enviogestor = ' + LogicoParaString(chkEnvioGestor.Checked);
            Execute;
         end;

         Auditoria('PARÂMETROS', 'Conf: ' + VirgulaParaPonto(edtConformidade.Value, 0) +
                   ' - Pont: ' + VirgulaParaPonto(edtPontualidade.Value, 0) +
                   ' - Aval: ' + VirgulaParaPonto(edtAvaliacao.Value, 0),
                   cOperacao,'');

         AtualizarDados();
         HabilitarCampos(False, False, Self, -1);
         Application.MessageBox('Parâmetros gravados com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;

      Botoes(True);
      TryFocus(btnAlterar);
   end;
end;

procedure TFormCadParametros.btnInserirEmailCalibClick(Sender: TObject);
begin
   if ValidarDadosEmailCalib() then begin
      Executar(' INSERT INTO parametros_email_aviso(' +
              ' par_codigo, par_tipo, par_colaborador)' +
              ' VALUES (' +
              BuscarNovoCodigo('parametros_email_aviso', 'par_codigo') + ',' +
              QuotedStr('C') + ',' +
              IntToStr(dblColCalibracao.KeyValue) +
              ')');

      AtualizarDados();
   end;
end;

procedure TFormCadParametros.btnInserirEmailManutClick(Sender: TObject);
begin
   if ValidarDadosEmailManut() then begin
      Executar(' INSERT INTO parametros_email_aviso(' +
              ' par_codigo, par_tipo, par_colaborador)' +
              ' VALUES (' +
              BuscarNovoCodigo('parametros_email_aviso', 'par_codigo') + ',' +
              QuotedStr('M') + ',' +
              IntToStr(dblColManutencao.KeyValue) +
              ')');

      AtualizarDados();
   end;
end;

procedure TFormCadParametros.btnLimpaDataPMCClick(Sender: TObject);
begin
   dtPMC.Clear;
end;

procedure TFormCadParametros.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadParametros.dbgContextosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadParametros.FormShow(Sender: TObject);
begin
   pctParametros.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, -1);
   TryFocus(btnAlterar);

   pnlBaixoOp1a.Color := RGB(35,142,35);
   pnlMedioOp1a.Color := RGB(255,255,0);
   pnlAltoOp1a.Color  := RGB(255,165,0);
   pnlSeveroOp1a.Color:= RGB(255,0,0);

   pnlBaixoOp1b.Color := RGB(35,142,35);
   pnlMedioOp1b.Color := RGB(255,255,0);
   pnlAltoOp1b.Color  := RGB(255,165,0);
   pnlSeveroOp1b.Color:= RGB(255,0,0);


   pnlBaixoOp2a.Color := RGB(0,0,128);
   pnlMedioOp2a.Color := RGB(135,206,250);
   pnlAltoOp2a.Color  := RGB(0,255,0);
   pnlSeveroOp2a.Color:= RGB(35,142,35);

   pnlBaixoOp2b.Color := RGB(240,230,140);
   pnlMedioOp2b.Color := RGB(255,255,0);
   pnlAltoOp2b.Color  := RGB(255,165,0);
   pnlSeveroOp2b.Color:= RGB(255,0,0);

//   pctParametros.Pages[1].TabVisible:= False;
end;

procedure TFormCadParametros.PreencherCampos;
begin
   with cdsParametros do begin
      edtAvaliacao.Value      := FieldByName('pesoiqfavaliacao').AsFloat;
      edtPontualidade.Value   := FieldByName('pesoiqfpontualidade').AsFloat;
      edtConformidade.Value   := FieldByName('pesoiqfconformidade').AsFloat;
      spnCasas.Value          := FieldByName('casasindicador').AsFloat;
      chkRiscoBaixoPFO.Checked := StringParaLogico(FieldByName('risco_baixo_pfo').AsString);
      chkRiscoMedioPFO.Checked := StringParaLogico(FieldByName('risco_medio_pfo').AsString);
      chkRiscoAltoPFO.Checked  := StringParaLogico(FieldByName('risco_alto_pfo').AsString);
      chkRiscoSeveroPFO.Checked:= StringParaLogico(FieldByName('risco_severo_pfo').AsString);
      chkRiscoBaixoPFR.Checked := StringParaLogico(FieldByName('risco_baixo_pfr').AsString);
      chkRiscoMedioPFR.Checked := StringParaLogico(FieldByName('risco_medio_pfr').AsString);
      chkRiscoAltoPFR.Checked  := StringParaLogico(FieldByName('risco_alto_pfr').AsString);
      chkRiscoSeveroPFR.Checked:= StringParaLogico(FieldByName('risco_severo_pfr').AsString);
      chkRiscoBaixoOPO.Checked := StringParaLogico(FieldByName('risco_baixo_opo').AsString);
      chkRiscoMedioOPO.Checked := StringParaLogico(FieldByName('risco_medio_opo').AsString);
      chkRiscoAltoOPO.Checked  := StringParaLogico(FieldByName('risco_alto_opo').AsString);
      chkRiscoSeveroOPO.Checked:= StringParaLogico(FieldByName('risco_severo_opo').AsString);
      chkRiscoBaixoAME.Checked := StringParaLogico(FieldByName('risco_baixo_ame').AsString);
      chkRiscoMedioAME.Checked := StringParaLogico(FieldByName('risco_medio_ame').AsString);
      chkRiscoAltoAME.Checked  := StringParaLogico(FieldByName('risco_alto_ame').AsString);
      chkRiscoSeveroAME.Checked:= StringParaLogico(FieldByName('risco_severo_ame').AsString);
      spnEmailPMC.Value         := FieldByName('email_pmc').AsInteger;
      spnEmailRisco.Value       := FieldByName('email_risco').AsInteger;
      spnAvisoPMC.Value         := FieldByName('aviso_pmc').AsInteger;
      chkEmailPMC.Checked       := StringParaLogico(FieldByName('nao_enviar_email_pmc').AsString);
      spnNota.Value             := FieldByName('notamaxhab').AsFloat;
      spnNotaPendencia.Value    := FieldByName('notapendencia').AsFloat;
      dblPeriodoHab.KeyValue    := FieldByName('periodohab').AsInteger;
      spnPrimeiraAvaliacao.Value:= FieldByName('primeiraavaliacao').AsFloat;
      dtPMC.Date                := FieldByName('data_filtro_pmc').AsDateTime;
      spnDiaAtuIndicador.Value  := FieldByName('dias_indicadores').AsFloat;
      chkEnvioGestor.Checked    := StringParaLogico(FieldByName('enviogestor').AsString);

      rbOpcao1.Checked:= FieldByName('riscos_cores').AsInteger = 0;
      rbOpcao2.Checked:= FieldByName('riscos_cores').AsInteger = 1;
   end;
end;

procedure TFormCadParametros.spnCasasChange(Sender: TObject);
var
   formato: string;
begin
  // ###,###,##0.000000
   formato:= '##0.' + Replic('0', Trunc(spnCasas.Value));
   lblExemplo.Caption:= FormatFloat(formato, StrToFloat(lblExemplo.Caption));
end;

function TFormCadParametros.ValidarDados: Boolean;
begin
   if edtAvaliacao.Value + edtPontualidade.Value + edtConformidade.Value <> 100 then begin
      Application.MessageBox('A soma dos valores deve dar 100%', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtAvaliacao);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormCadParametros.ValidarDadosEmailCalib: Boolean;
begin
   if (dblColCalibracao.KeyValue = null) or (dblColCalibracao.KeyValue = -1) then begin
      Result:= False;
      Exit;
   end;

   // Verifica se o colaborador já foi cadastrado para e-mail de Calibração
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM parametros_email_aviso' +
                    ' WHERE par_tipo = ' + QuotedStr('C') +
                    ' AND par_colaborador = ' + IntToStr(dblColCalibracao.KeyValue);
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Colaborador já cadastrado para receber e-mail de aviso de calibração', 'Aviso', MB_OK + MB_ICONWARNING);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;

function TFormCadParametros.ValidarDadosEmailManut: Boolean;
begin
   if (dblColManutencao.KeyValue = null) or (dblColManutencao.KeyValue = -1) then begin
      Result:= False;
      Exit;
   end;

   // Verifica se o colaborador já foi cadastrado para e-mail de Manutenção
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM parametros_email_aviso' +
                    ' WHERE par_tipo = ' + QuotedStr('M') +
                    ' AND par_colaborador = ' + IntToStr(dblColManutencao.KeyValue);
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Colaborador já cadastrado para receber e-mail de aviso de manutenção', 'Aviso', MB_OK + MB_ICONWARNING);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;

end.
