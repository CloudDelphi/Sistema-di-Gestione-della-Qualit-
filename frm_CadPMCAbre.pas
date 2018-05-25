unit frm_CadPMCAbre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze;

type
  TFormCadPMCAbre = class(TForm)
    pctAbrePMC: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgRegistros: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryPMC: TZQuery;
    dspPMC: TDataSetProvider;
    cdsPMC: TClientDataSet;
    dsPMC: TDataSource;
    frxReport1: TfrxReport;
    frxDBPMC: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    dblTipo: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl5: TLabel;
    edtIdentificacao: TEdit;
    lbl1: TLabel;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    dspTipo: TDataSetProvider;
    zqryTipo: TZQuery;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    opd1: TOpenDialog;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    lbl16: TLabel;
    dblProcesso: TDBLookupComboBox;
    dblResponsavel: TDBLookupComboBox;
    lbl3: TLabel;
    zqryEmitido: TZQuery;
    dspEmitido: TDataSetProvider;
    cdsEmitido: TClientDataSet;
    dsEmitido: TDataSource;
    zqryProcede: TZQuery;
    dspProcede: TDataSetProvider;
    cdsProcede: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsProcede: TDataSource;
    zqryOrigem: TZQuery;
    dspOrigem: TDataSetProvider;
    cdsOrigem: TClientDataSet;
    LargeintField3: TLargeintField;
    WideStringField3: TWideStringField;
    dsOrigem: TDataSource;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    dtData: TDateEdit;
    dblEmitido: TDBLookupComboBox;
    lbl7: TLabel;
    edtReqNorma: TEdit;
    lbl11: TLabel;
    dblOrigem: TDBLookupComboBox;
    mmoNaoConformidade: TMemo;
    lbl4: TLabel;
    cdsPMCcodi_pmc: TLargeintField;
    cdsPMCdata_pmc: TDateTimeField;
    cdsPMCemit_pmc: TLargeintField;
    cdsPMCtipo_pmc: TLargeintField;
    cdsPMCproc_pmc: TLargeintField;
    cdsPMCresp_pmc: TLargeintField;
    cdsPMCefic_pmc: TLargeintField;
    cdsPMCprcs_pmc: TLargeintField;
    cdsPMCrequ_pmc: TWideStringField;
    cdsPMCnume_pmc: TWideStringField;
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsResponsavel: TDataSource;
    cdsPMCDescTipo: TStringField;
    cdsPMCDescResp: TStringField;
    cdsImprimirnume_pmc: TWideStringField;
    cdsImprimirdata_pmc: TDateTimeField;
    cdsImprimirOrigem: TWideStringField;
    cdsImprimirTipo: TWideStringField;
    cdsImprimirEficaz: TWideStringField;
    cdsImprimirnome_pro: TWideStringField;
    cdsResponsavelcol_email: TWideStringField;
    lbl12: TLabel;
    dblCliente: TDBLookupComboBox;
    lbl13: TLabel;
    dblFornecedor: TDBLookupComboBox;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    zqryClientes: TZQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    cdsClientescli_codigo: TIntegerField;
    cdsClientescli_nome: TWideStringField;
    cdsPMCpmc_cliente: TIntegerField;
    lbl8: TLabel;
    dblProcede: TDBLookupComboBox;
    lbl14: TLabel;
    edtCaminho: TEdit;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    dlgOpen1: TOpenDialog;
    cdsPMCncon_pmc: TWideMemoField;
    pnlEmail: TPanel;
    pnl5: TPanel;
    btnSairEmail: TBitBtn;
    pnl6: TPanel;
    btnGravarEmail: TBitBtn;
    lbl15: TLabel;
    edtEmail: TEdit;
    lbl17: TLabel;
    lblNomeCol: TLabel;
    cdsPMCorig_pmc: TLargeintField;
    cdsImprimirncon_pmc: TWideMemoField;
    cdsImprimirvefi_pmc: TWideMemoField;
    cdsPMCpmc_arq_evidencia: TWideMemoField;
    lblCEA: TLabel;
    dblCEA: TDBLookupComboBox;
    zqryCEA: TZQuery;
    dspCEA: TDataSetProvider;
    cdsCEA: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsCEA: TDataSource;
    cdsPMCpmc_cea: TIntegerField;
    cdsFornforn_codigo: TIntegerField;
    cdsFornforn_nome: TWideStringField;
    cdsPMCpmc_fornecedor: TIntegerField;
    cdsImprimircli_nome: TWideStringField;
    cdsImprimirforn_nome: TWideStringField;
    cdsImprimirresponsavel: TWideStringField;
    cdsImprimirpmc_datafecha: TDateTimeField;
    edtCusto: TCurrencyEdit;
    lbl24: TLabel;
    cdsPMCpmc_custo: TFloatField;
    cdsImprimirpmc_custo: TFloatField;

    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure BuscarNovoCodigo;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRegistrosCellClick(Column: TColumn);
    procedure dbgRegistrosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctAbrePMCChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoNaoConformidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BuscarNovoCodigoPMC();
    procedure cbCampoCloseUp(Sender: TObject);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure btnSairEmailClick(Sender: TObject);
    procedure btnGravarEmailClick(Sender: TObject);
    procedure PrepararEmail();
    procedure PreencherDadosRisco();
    procedure PreencherDadosIndicadores();
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sCodigo: string;
  public
    { Public declarations }
    iTela: Integer;
  end;

var
  FormCadPMCAbre: TFormCadPMCAbre;

implementation

uses frm_Inicial, Funcoes, frm_Laaia, frm_CadPMCFecha,
  frm_dm, frm_CadRiscoVisualizacao, frm_CadRiscoAnaliseRisco,
  frm_ValoresIndicador;

{$R *.dfm}

procedure TFormCadPMCAbre.AtualizarDados;
begin
   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 4' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsOrigem do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 5' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsProcede do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsCEA do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEmitido do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsResponsavel do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsForn do begin
      Active:= False;
      Active:= True;
   end;

   with cdsClientes do begin
      Active:= False;
      Active:= True;
   end;

   with cdsPMC do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtIdentificacao.Text) <> EmptyStr then begin
      cdsPMC.Locate('nume_pmc', edtIdentificacao.Text,[])
   end;
end;

procedure TFormCadPMCAbre.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsPMC.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadPMCAbre.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 10, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 1);
      TryFocus(edtIdentificacao);
      Botoes(False);
   end;
end;

procedure TFormCadPMCAbre.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadPMCAbre.btnExcluirClick(Sender: TObject);
var
   sCodPMC, sIdentPMC: string;
begin
   if (Acesso(cUsuario, 10, 'exclusao') = 1) then begin
      if Application.MessageBox('Todas as ações deste PMC serão excluídas junto com o PMC. Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodPMC  := cdsPMC.FieldByName('codi_pmc').AsString;
         sIdentPMC:= cdsPMC.FieldByName('nume_pmc').AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM pmc' +
                          ' WHERE codi_pmc = ' + sCodPMC;
            Execute;
         end;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM pmc_acoes' +
                          ' WHERE codi_pmc = ' + sCodPMC;
            Execute;
         end;

         Auditoria('PMC', sIdentPMC, 'E', '');
         LimparCampos();
         AtualizarDados();
         PreencherCampos();
      end;
      Botoes(True);
   end;
end;

procedure TFormCadPMCAbre.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO pmc (' +
                             ' codi_pmc, nume_pmc, data_pmc, emit_pmc, tipo_pmc, prcs_pmc, ' +
                             ' requ_pmc, orig_pmc, ncon_pmc, efic_pmc, proc_pmc, resp_pmc, ' +
                             ' pmc_cliente, pmc_fornecedor, pmc_arq_evidencia, pmc_cea, ' +
                             ' pmc_custo, pmc_fase)' +
                             ' VALUES(' +
                             sNovoCodigo + ',' +
                             QuotedStr(edtIdentificacao.Text) + ',' +
                             ArrumaDataSQL(dtData.Date) + ',' +
                             IntToStr(dblEmitido.KeyValue) + ',' +
                             IntToStr(dblTipo.KeyValue) + ',' +
                             IntToStr(dblProcesso.KeyValue) + ',' +
                             QuotedStr(edtReqNorma.Text) + ',' +
                             IntToStr(dblOrigem.KeyValue) + ',' +
                             QuotedStr(mmoNaoConformidade.Text) + ',' +
                             '2' + ',' + // Eficaz -> 1 = Não, 0 = Sim, 2 = Aguardando Eficácia
                             IntToStr(dblProcede.KeyValue) + ',' +
                             IntToStr(dblResponsavel.KeyValue) + ',' +
                             Nulo(dblCliente.KeyValue, 'I') + ',' +
                             Nulo(dblFornecedor.KeyValue, 'I') + ',' +
                             QuotedStr(edtCaminho.Text) + ',' +
                             IntToStr(dblCEA.KeyValue) + ',' +
                             VirgulaParaPonto(edtCusto.Value, 2) + ',' +
                             '1' + // Fase Ação de Contenção Imediata
                             ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE pmc SET' +
                             ' nume_pmc = ' + QuotedStr(edtIdentificacao.Text) + ',' +
                             ' data_pmc = ' + ArrumaDataSQL(dtData.Date) + ',' +
                             ' emit_pmc = ' + IntToStr(dblEmitido.KeyValue) + ',' +
                             ' tipo_pmc = ' + IntToStr(dblTipo.KeyValue) + ',' +
                             ' prcs_pmc = ' + IntToStr(dblProcesso.KeyValue) + ',' +
                             ' requ_pmc = ' + QuotedStr(edtReqNorma.Text) + ',' +
                             ' orig_pmc = ' + IntToStr(dblOrigem.KeyValue) + ',' +
                             ' ncon_pmc = ' + QuotedStr(mmoNaoConformidade.Text) + ',' +
                             ' proc_pmc = ' + IntToStr(dblProcede.KeyValue) + ',' +
                             ' resp_pmc = ' + IntToStr(dblResponsavel.KeyValue) + ',' +
                             ' pmc_cliente = ' + Nulo(dblCliente.KeyValue, 'I') + ',' +
                             ' pmc_fornecedor = ' + Nulo(dblFornecedor.KeyValue, 'I') + ',' +
                             ' pmc_arq_evidencia = ' + QuotedStr(edtCaminho.Text) + ',' +
                             ' pmc_custo = ' + VirgulaParaPonto(edtCusto.Value, 2) + ',' +
                             ' pmc_cea = ' + IntToStr(dblCEA.KeyValue) +
                             ' WHERE codi_pmc = ' + cdsPMCcodi_pmc.Asstring;
               Execute;
            end;
         end;

         Auditoria('PMC', edtIdentificacao.Text, cOperacao,'');
         AtualizarDados();

         HabilitarCampos(False, False, Self, 1);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

         if Application.MessageBox('Deseja enviar um e-mail ao responsável avisando do PMC ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
            PrepararEmail();
         end;

         if not (FormLaaia = nil) then begin
            FormLaaia.edtPMC.Text:= edtIdentificacao.Text;
         end;

         if not (FormCadPMCFecha = nil) then begin
            FormCadPMCFecha.edtPMCSubs.Text:= edtIdentificacao.Text;
         end;

         if not (FormCadRiscoVisualizacao = nil) then begin
            FormCadRiscoVisualizacao.edtPMC.Text:= edtIdentificacao.Text;
            FormCadRiscoVisualizacao.btnDesvincular.Enabled:= True;
         end;

         if iTela = 2 then begin // Análise de Riscos
            if FormCadRiscoVisualizacao.sTipoIntExt = 'INTERNA' then begin
               with dm.cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE risco_analiseint SET' +
                                ' int_pmc = ' + QuotedStr(edtIdentificacao.Text) +
                                ' WHERE int_codigo = ' + IntToStr(FormCadRiscoVisualizacao.iCodigo);
                  Execute;
               end;
            end
            else begin
               with dm.cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE risco_macro SET' +
                                ' mac_pmc = ' + QuotedStr(edtIdentificacao.Text) +
                                ' WHERE mac_codigo = ' + IntToStr(FormCadRiscoVisualizacao.iCodigo);
                  Execute;
               end;
            end;

            FormAnaliseRisco.AtualizarDados();
         end;
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadPMCAbre.btnGravarEmailClick(Sender: TObject);
begin
   Executar(' UPDATE colaboradores' +
           ' SET col_email = ' + QuotedStr(edtEmail.Text) +
           ' WHERE codi_col = ' + QuotedStr(dblResponsavel.KeyValue)
           );

   pnlEmail.Visible:= False;

   cdsResponsavel.Edit;
   cdsResponsavelcol_email.AsString:= edtEmail.Text;
   PrepararEmail();
end;

procedure TFormCadPMCAbre.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPMCAbre.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadPMCAbre.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 10, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos();
      HabilitarCampos(True, True, Self, 1);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      BuscarNovoCodigoPMC();
      dtData.Date:= Date();
      dblCEA.KeyValue:= 1; // Não
      dblCliente.KeyValue:= 999999;
      dblFornecedor.KeyValue:= 999999;
      TryFocus(edtIdentificacao);
   end;
end;

procedure TFormCadPMCAbre.btnPrimeiroClick(Sender: TObject);
begin
   cdsPMC.First;
   PreencherCampos();
end;

procedure TFormCadPMCAbre.btnAnteriorClick(Sender: TObject);
begin
   cdsPMC.Prior;
   PreencherCampos();
end;

procedure TFormCadPMCAbre.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadPMCAbre.btnProximoClick(Sender: TObject);
begin
   cdsPMC.Next;
   PreencherCampos();
end;

procedure TFormCadPMCAbre.btnUltimoClick(Sender: TObject);
begin
   cdsPMC.Last;
   PreencherCampos();
end;

procedure TFormCadPMCAbre.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadPMCAbre.btnSairEmailClick(Sender: TObject);
begin
   pnlEmail.Visible:= False;
end;

procedure TFormCadPMCAbre.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPMCAbre.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPMCAbre.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
//   try
//      if not (UpperCase(Copy(edtCaminho.Text, 1, 4)) = 'HTTP') then begin
//         if not FileExists(edtCaminho.Text) then begin
//            Application.MessageBox('O documento não foi encontrado na pasta especificada', 'Aviso', MB_OK + MB_ICONWARNING);
//            Exit;
//         end;
//      end;
//
//      ShellExecute(Application.Handle, nil, PChar(edtCaminho.Text), nil, nil, SW_SHOWMAXIMIZED);
//   except
//      on E: Exception do begin
//         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
//      end;
//   end;
end;

procedure TFormCadPMCAbre.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_pmc) AS NovoCodigo FROM Pmc';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadPMCAbre.ControlarAbas;
begin
   if pctAbrePMC.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      cdsPMC.Filtered:= False;
      AjustaBarraGrid(dbgRegistros);
//      PreencherCampos();
      if sCodigo <> EmptyStr then begin
         cdsPMC.Locate('codi_pmc', sCodigo, []);
      end;
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;

      if pctAbrePMC.TabIndex = 1 then begin
         edtValor.Enabled:= True;
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadPMCAbre.dbgRegistrosCellClick(Column: TColumn);
begin
   PreencherCampos();
//   sCodigo:= cdsPMC.FieldByName('codi_pmc').AsString;
end;

procedure TFormCadPMCAbre.dbgRegistrosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctAbrePMC.TabIndex:= 0;
//   sCodigo:= cdsPMC.FieldByName('codi_pmc').AsString;
   ControlarAbas;
end;

procedure TFormCadPMCAbre.dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadPMCAbre.edtValorChange(Sender: TObject);
begin
//   case cbCampo.ItemIndex of
//      0: cdsPMC.Locate('nume_pmc', edtValor.Text, [loPartialKey]);
//   end;

   case cbCampo.ItemIndex of
      0: cdsPMC.Filter:= 'nume_pmc LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   cdsPMC.Filtered:= True;
end;

procedure TFormCadPMCAbre.FormShow(Sender: TObject);
begin
   if LiberarClienteForn() = True then begin
      dblCliente.Tag:= 30;
      dblFornecedor.Tag:= 30;
      dblCliente.Enabled:= False;
      dblFornecedor.Enabled:= False;
   end
   else begin
      dblCliente.Tag:= 0;
      dblFornecedor.Tag:= 0;
   end;

   pctAbrePMC.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   pnlEmail.Visible   := False;

   if not VerificarProjetoCEA() then begin
      dblCEA.Visible:= False;
      lblCEA.Visible:= False;
   end;

   if iTela = 2 then begin // Análise de Riscos
      btnNovoClick(Self);
      PreencherDadosRisco();
   end;

   if iTela = 3 then begin // Indicadores
      btnNovoClick(Self);
      PreencherDadosIndicadores();
   end;
end;

procedure TFormCadPMCAbre.PreencherDadosIndicadores;
begin
   dblProcesso.KeyValue   := FormValorIndicadores.cdsIndicadores.FieldByName('proc_ind').AsInteger;
   dblOrigem.KeyValue     := 4; // Indicador
   mmoNaoConformidade.Lines.Add('INDICADOR: ' + FormValorIndicadores.dblIndicadores.Text);
   dblTipo.KeyValue:= -1; // Sem valor padrão
end;

procedure TFormCadPMCAbre.PreencherDadosRisco;
var
   sTipo: string;
begin
   sTipo:= FormCadRiscoVisualizacao.lblTipo.Caption;

   dblProcesso.KeyValue   := FormCadRiscoVisualizacao.iCodProcesso;
   dblOrigem.KeyValue     := 7; // Análise de Riscos
   mmoNaoConformidade.Lines.Add('FATOR: ' + FormCadRiscoVisualizacao.edtFator.Text);
   mmoNaoConformidade.Lines.Add('VARIÁVEL: ' + FormCadRiscoVisualizacao.edtVariavel.Text);
   mmoNaoConformidade.Lines.Add('');
   mmoNaoConformidade.Lines.Add(sTipo + ': ' + FormCadRiscoVisualizacao.mmoTexto.Text);
   mmoNaoConformidade.Lines.Add('RISCO: ' + FormCadRiscoVisualizacao.sTipoRisco);
   if (sTipo = 'OPORTUNIDADE') or (sTipo = 'PONTO FORTE') then begin
      dblTipo.KeyValue:= 2; // Melhoria
   end
   else begin
      dblTipo.KeyValue:= 1; // Preventiva
   end;
end;

procedure TFormCadPMCAbre.LimparCampos;
begin
   edtIdentificacao.Clear;
   dtData.Clear;
   dblEmitido.KeyValue:= -1;
   dblTipo.KeyValue:= -1;
   dblProcesso.KeyValue:= -1;
   edtReqNorma.Clear;
   dblOrigem.KeyValue:= -1;
   mmoNaoConformidade.Clear;
   dblProcesso.KeyValue:= -1;
   dblProcede.KeyValue:= -1;
   dblResponsavel.KeyValue:= -1;
   dblCliente.KeyValue:= -1;
   dblFornecedor.KeyValue:= -1;
   edtCaminho.Clear;
   edtCusto.Clear;
end;

procedure TFormCadPMCAbre.mmoNaoConformidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadPMCAbre.pctAbrePMCChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadPMCAbre.PreencherCampos;
begin
   with cdsPMC do begin
      edtIdentificacao.Text  := FieldByName('nume_pmc').AsString;
      dtData.Date            := FieldByName('data_pmc').AsDateTime;
      edtReqNorma.Text       := FieldByName('requ_pmc').AsString;
      mmoNaoConformidade.Text:= FieldByName('ncon_pmc').AsString;
      edtCaminho.Text        := FieldByName('pmc_arq_evidencia').AsString;
      edtCusto.Value         := FieldByName('pmc_custo').AsFloat;

      dblCliente.KeyValue    := FieldByName('pmc_cliente').AsInteger;
      dblFornecedor.KeyValue := FieldByName('pmc_fornecedor').AsString;

      if FieldByName('emit_pmc').AsString <> EmptyStr then begin
         dblEmitido.KeyValue:= FieldByName('emit_pmc').AsString;
      end;

      if FieldByName('tipo_pmc').AsString <> EmptyStr then begin
         dblTipo.KeyValue:= FieldByName('tipo_pmc').AsString;
      end;

      if FieldByName('prcs_pmc').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('prcs_pmc').AsString;
      end;

      if FieldByName('orig_pmc').AsString <> EmptyStr then begin
         dblOrigem.KeyValue:= FieldByName('orig_pmc').AsString;
      end;

      if FieldByName('prcs_pmc').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('prcs_pmc').AsString;
      end;

      if FieldByName('resp_pmc').AsString <> EmptyStr then begin
         dblResponsavel.KeyValue:= FieldByName('resp_pmc').AsString;
      end;

      if FieldByName('proc_pmc').AsString <> EmptyStr then begin
         dblProcede.KeyValue:= FieldByName('proc_pmc').AsString;
      end;

      if FieldByName('pmc_cea').AsString <> EmptyStr then begin
         dblCEA.KeyValue:= FieldByName('pmc_cea').AsString;
      end;
   end;

   sCodigo:= cdsPMC.FieldByName('codi_pmc').AsString;

   ControlarBotaoVisualiza(Self);
end;

procedure TFormCadPMCAbre.PrepararEmail;
var
   i: Integer;
   sTextoNC: string;
begin
   if VerificarConexaoInternet(True) then begin
      // Busca <Enter> na não conformidade para ajustar o envio de e-mail
      for i:= 1 to Length(mmoNaoConformidade.Text) do begin
         sTextoNC:= sTextoNC + mmoNaoConformidade.Text[i];

         if mmoNaoConformidade.Text[i] = #13 then begin
            sTextoNC:= sTextoNC + '<br>'
         end;
      end;

      // Verifica se existem as configurações de e-mail cadastradas.
//      if VerificarConfigEmail() then begin
         sTextoEmail:= 'Foi aberto um PMC com as informações abaixo: <br><br>' +
                  '<b>PMC:</b> ' + edtIdentificacao.Text + '<br>' +
                  '<b>Data PMC:</b> ' + dtData.Text + '<br>' +
                  '<b>Não Conformidade:</b> ' + sTextoNC + //mmoNaoConformidade.Text +
                  '<br><br>'+
                  'Acesse o sistema Destra Manager para maiores detalhes.';

         if AllTrim(cdsResponsavelcol_email.AsString) = EmptyStr then begin
            if Application.MessageBox(PChar('O colaborador ' + dblResponsavel.Text + ' não tem e-mail cadastrado no Cadastro de Colaboradores.' + #13#10 + 'Deseja cadastrar o e-mail antes de enviar ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
               edtEmail.Enabled:= True;
               pnlEmail.Top     := Self.Height div 2 - pnlEmail.Height div 2 - 20;
               pnlEmail.Left    := Self.Width div 2 - pnlEmail.Width div 2;
               pnlEmail.Visible := True;

               lblNomeCol.Caption:= dblResponsavel.Text;
               TryFocus(edtEmail);
            end;
         end
         else begin
            EnviarEmail(sTextoEmail, 'Novo PMC', cdsResponsavelcol_email.AsString, 'sistema');
         end;
//      end;
   end;
end;

procedure TFormCadPMCAbre.BuscarNovoCodigoPMC;
var
   Aux: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT max(nume_pmc) as UltCodigo from pmc ' +
                    ' WHERE nume_pmc like ' + QuotedStr('PMC%');
      Active:= True;

     if FieldByName('UltCodigo').AsString = EmptyStr then begin
        edtIdentificacao.Text:= 'PMC0001';
     end
     else begin
        try
           Aux:= StrToInt(Copy(FieldByName('UltCodigo').AsString,4,4));
           Aux:= Aux + 1;
           edtIdentificacao.Text:= 'PMC' + StrZero(Aux,4);
        except
           edtIdentificacao.Text:= 'PMC0001';
        end;
     end;

   end;
end;

procedure TFormCadPMCAbre.cbCampoCloseUp(Sender: TObject);
begin
   TryFocus(edtValor);
end;

function TFormCadPMCAbre.ValidarDados(): Boolean;
begin
   if cOperacao = 'I' then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) AS Qtd' +
                       ' FROM pmc' +
                       ' WHERE nume_pmc = ' + QuotedStr(edtIdentificacao.Text);
         Active:= True;

         if FieldByName('Qtd').AsInteger > 0 then begin
            Application.MessageBox(PChar('Identificação ' + edtIdentificacao.Text + ' já está cadastrada'), 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtIdentificacao);
            Result:= False;
            Exit;
         end;
      end;
   end;

   if AllTrim(edtIdentificacao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdentificacao);
      Result:= False;
      Exit;
   end;

   if AllTrim(dtData.Text) = EmptyStr then begin
      Application.MessageBox('Campo Data é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dtData);
      Result:= False;
      Exit;
   end;

   if dblEmitido.KeyValue = -1 then begin
      Application.MessageBox('Campo Emitido Por é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblEmitido);
      Result:= False;
      Exit;
   end;

   if dblTipo.KeyValue = -1 then begin
      Application.MessageBox('Campo Tipo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTipo);
      Result:= False;
      Exit;
   end;

   if dblProcesso.KeyValue = -1 then begin
      Application.MessageBox('Campo Processo obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if dblOrigem.KeyValue = -1 then begin
      Application.MessageBox('Campo Origem é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblOrigem);
      Result:= False;
      Exit;
   end;

   if mmoNaoConformidade.Text = EmptyStr then begin
      Application.MessageBox('Campo Não Conformidade é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoNaoConformidade);
      Result:= False;
      Exit;
   end;

   if dblProcede.KeyValue = -1 then begin
      Application.MessageBox('Campo Procede ? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcede);
      Result:= False;
      Exit;
   end;

   if dblResponsavel.KeyValue = -1 then begin
      Application.MessageBox('Campo Responsável é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblResponsavel);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadPMCAbre.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'nume_pmc';
   end
   else begin
      sCampoOrdem:= 'data_pmc';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT p.nume_pmc, p.data_pmc, p.ncon_pmc, tc2.valo_com as Origem, ' +
                    ' tc.valo_com as Tipo, tc3.valo_com as Eficaz,' +
                    ' pr.nome_pro, p.vefi_pmc, CL.cli_nome, F.forn_nome, ' +
                    ' C.nome_col as Responsavel, P.pmc_dataFecha, pmc_custo' +
                    ' FROM pmc p' +
                    ' INNER JOIN processos pr ON p.prcs_pmc = pr.codi_pro' +
                    ' INNER JOIN tabela_combos tc ON tc.tipo_com = 4 and tc.codi_com = p.tipo_pmc' +
                    ' INNER JOIN tabela_combos tc2 ON tc2.tipo_com = 5 and tc2.codi_com = p.orig_pmc ' +
                    ' INNER JOIN tabela_combos tc3 ON tc3.tipo_com = 21 and tc3.codi_com = p.efic_pmc ' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = P.resp_pmc' +
                    ' LEFT JOIN clientes CL ON CL.cli_codigo = P.pmc_cliente' +
                    ' LEFT JOIN fornecedores F ON F.forn_codigo = P.pmc_fornecedor' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaPMCAbertura.fr3');

      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
//            PrintOptions.Printer:= 'CutePDF Writer';
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

end.
