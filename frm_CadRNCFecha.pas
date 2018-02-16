unit frm_CadRNCFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, jpeg;

type
  TFormCadRNCFecha = class(TForm)
    pctFechaRNC: TJvgPageControl;
    pnl1: TPanel;
    btnGravar: TBitBtn;
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
    zqryRNC: TZQuery;
    dspRNC: TDataSetProvider;
    cdsRNC: TClientDataSet;
    dsRNC: TDataSource;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    dblTipo: TDBLookupComboBox;
    lbl5: TLabel;
    edtIdentificacao: TEdit;
    lbl1: TLabel;
    cdsMotivo: TClientDataSet;
    dsMotivo: TDataSource;
    dspMotivo: TDataSetProvider;
    zqryMotivo: TZQuery;
    lrgntfldMotivocodi_com: TLargeintField;
    cdsMotivovalo_com: TWideStringField;
    opd1: TOpenDialog;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    lbl16: TLabel;
    dblProcesso: TDBLookupComboBox;
    dblResponsavel: TDBLookupComboBox;
    lbl3: TLabel;
    dblProcede: TDBLookupComboBox;
    lbl8: TLabel;
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
    dtData: TDateEdit;
    dblEmitido: TDBLookupComboBox;
    lbl7: TLabel;
    edtReqNorma: TEdit;
    lbl11: TLabel;
    dblOrigem: TDBLookupComboBox;
    mmoNaoConformidade: TMemo;
    lbl4: TLabel;
    cdsEmitidocodi_col: TLargeintField;
    cdsEmitidonome_col: TWideStringField;
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsResponsavel: TDataSource;
    lbl12: TLabel;
    mmoDisposicao: TMemo;
    lbl17: TLabel;
    dblStatus: TDBLookupComboBox;
    frxReport1: TfrxReport;
    frxDBRNCFecha: TfrxDBDataset;
    lbl23: TLabel;
    dblClientes: TDBLookupComboBox;
    lbl24: TLabel;
    dblForn: TDBLookupComboBox;
    zqryClientes: TZQuery;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientescli_codigo: TIntegerField;
    cdsClientescli_nome: TWideStringField;
    dsClientes: TDataSource;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    cdsResponsavelcol_email: TWideStringField;
    cdsEmitidocol_email: TWideStringField;
    sbVisualizarNC: TSpeedButton;
    pnlTexto: TPanel;
    pnl12: TPanel;
    btnFechar: TBitBtn;
    pnlEmail: TPanel;
    lbl29: TLabel;
    lbl30: TLabel;
    lblNomeCol: TLabel;
    pnl11: TPanel;
    btnSairEmail: TBitBtn;
    btnGravarEmail: TBitBtn;
    pnl13: TPanel;
    edtEmail: TEdit;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    cdsFornforn_codigo: TIntegerField;
    cdsFornforn_nome: TWideStringField;
    btnPDCA: TBitBtn;
    sbVisualizarDisp: TSpeedButton;
    lbl9: TLabel;
    tsHistorico: TTabSheet;
    btnAceitar: TBitBtn;
    btnRecusar: TBitBtn;
    zqryStatus: TZQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsStatus: TDataSource;
    dbgRegistros: TDBGrid;
    lbl10: TLabel;
    lbl13: TLabel;
    edtIdentificacaoHist: TEdit;
    dtDataHist: TDateEdit;
    mmoTexto: TMemo;
    lblTituloTexto: TLabel;
    zqryHistorico: TZQuery;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dsHistorico: TDataSource;
    cdsHistoricohis_codigo: TIntegerField;
    cdsHistoricornc_codigo: TIntegerField;
    cdsHistoricohis_data: TDateTimeField;
    cdsHistoricohis_historico: TWideStringField;
    cdsHistoricohis_usuario: TWideStringField;
    cdsHistoricohis_disposicao: TWideMemoField;
    cdsImprimirrnc_codigo: TIntegerField;
    cdsImprimirrnc_identificacao: TWideStringField;
    cdsImprimirrnc_data: TDateTimeField;
    cdsImprimirrnc_emitido: TIntegerField;
    cdsImprimiremitido: TWideStringField;
    cdsImprimirrnc_motivo: TIntegerField;
    cdsImprimirmotivo: TWideStringField;
    cdsImprimirrnc_processo: TIntegerField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirrnc_setor: TWideStringField;
    cdsImprimirrnc_origem: TIntegerField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirrnc_cliente: TIntegerField;
    cdsImprimirrnc_fornecedor: TIntegerField;
    cdsImprimirrnc_consumidor: TWideStringField;
    cdsImprimirrnc_nconformidade: TWideMemoField;
    cdsImprimirrnc_procede: TIntegerField;
    cdsImprimirrnc_responsavel: TIntegerField;
    cdsImprimirresponsavel: TWideStringField;
    cdsImprimirrnc_departamento: TWideStringField;
    cdsImprimirrnc_relacionamento: TIntegerField;
    cdsImprimirrnc_representante: TWideStringField;
    cdsImprimirrnc_status: TIntegerField;
    cdsImprimirstatus: TWideStringField;
    cdsImprimirrnc_disposicao: TWideMemoField;
    cdsImprimirhis_codigo: TIntegerField;
    cdsImprimirrnc_codigo_1: TIntegerField;
    cdsImprimirhis_data: TDateTimeField;
    cdsImprimirhis_historico: TWideStringField;
    cdsImprimirhis_usuario: TWideStringField;
    cdsImprimirhis_disposicao: TWideMemoField;
    cdsImprimircliente: TWideStringField;
    cdsImprimirfornecedor: TWideStringField;
    cdsImprimirprocede: TWideStringField;
    lbl14: TLabel;
    edtOrdemProd: TEdit;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(Flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgAcoesPMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgAcoesPMCCellClick(Column: TColumn);
    procedure ControlarAbas;
    procedure pctFechaRNCChange(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoNaoConformidadeKeyPress(Sender: TObject; var Key: Char);
    procedure tsAcoesShow(Sender: TObject);
    procedure mmoDescricaoAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure mmoVerificacaoAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure sbVisualizarNCClick(Sender: TObject);
    procedure mmoNaoConformidadeBigKeyPress(Sender: TObject; var Key: Char);
    procedure PrepararEmail();
    procedure btnGravarEmailClick(Sender: TObject);
    procedure btnSairEmailClick(Sender: TObject);
    procedure InserirTexto(Titulo: string; Texto: string);
    procedure btnPDCAClick(Sender: TObject);
    procedure VerificarStatusRNC();
    procedure btnAceitarClick(Sender: TObject);
    procedure btnRecusarClick(Sender: TObject);
    procedure sbVisualizarDispClick(Sender: TObject);
    procedure AtualizarHistorico();
    procedure cdsHistoricohis_disposicaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    function PermitirAceiteRecusa(): Boolean;
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sNovoCodigoAcao: string;
    sNovoCodigoIshikawa: string;
    sEmailAcao: string;
  public
    { Public declarations }
    sCodigoRNC: string;
    iTela: Integer;
  end;

var
  FormCadRNCFecha: TFormCadRNCFecha;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_Tartaruga,
  frm_CadPMCConsulta, frm_CadPMCAbre, frm_VisualizaPMC, WebBrowser, frm_PDCA, frm_VisualizaRNC;

{$R *.dfm}

procedure TFormCadRNCFecha.AtualizarDados;
var
   sCampo: string;
begin
   with cdsStatus do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 35' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsMotivo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 32' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEmitido do begin
      Active:= False;
      Active:= True;
   end;

   with cdsResponsavel do begin
      Active:= False;
      Active:= True;
   end;

   with cdsOrigem do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 33' +
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

//   with cdsEficaz do begin
//      Active:= False;
//      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
//                    ' WHERE tipo_com = 21' +
//                    ' ORDER BY orde_com';
//      Active:= True;
//   end;

   with cdsClientes do begin
      Active:= False;
      Active:= True;
   end;

   with cdsForn do begin
      Active:= False;
      Active:= True;
   end;

   with cdsRNC do begin
      Active:= False;
      CommandText:= ' SELECT rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, rnc_motivo,' +
                    ' rnc_processo, rnc_setor, rnc_origem, rnc_cliente, ' +
                    ' rnc_fornecedor, rnc_consumidor, rnc_nconformidade, ' +
                    ' rnc_procede, rnc_responsavel, rnc_status, rnc_disposicao,' +
                    ' rnc_departamento, rnc_relacionamento, rnc_representante,' +
                    ' rnc_ordemprod' +
                    ' FROM rnc R' +
                    ' WHERE rnc_codigo = ' + sCodigoRNC;
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
end;

procedure TFormCadRNCFecha.AtualizarHistorico;
begin
   with cdsHistorico do begin
      Active:= False;
      CommandText:= ' SELECT his_codigo, rnc_codigo, his_data, his_historico, ' +
                    ' his_usuario, his_disposicao ' +
                    ' FROM rnc_historico ' +
                    ' WHERE rnc_codigo = ' + sCodigoRNC;
      Active:= True;
   end;
end;

procedure TFormCadRNCFecha.Botoes(Flag: Boolean);
begin
   btnAlterar.Enabled := Flag;

   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;
   btnPDCA.Enabled    := Flag;

   if iTela = 4 then begin // Análise de Riscos (Vìnculo de PMC)
      btnAlterar.Enabled := False;
      btnGravar.Enabled  := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
   end;
end;

function TFormCadRNCFecha.PermitirAceiteRecusa: Boolean;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT col_usuario from colaboradores' +
                    ' WHERE codi_col = ' + dblEmitido.KeyValue;
      Active:= True;

      if FieldByName('col_usuario').AsString = cUsuario then begin
         Result:= True;
      end
      else begin
         Result:= False;
      end;
   end;
end;

procedure TFormCadRNCFecha.btnAceitarClick(Sender: TObject);
begin
   // Regra para o Aceite/Recusa da disposição
   // Somente o emitente do RNC pode aceitar/recusar uma disposição
   // Solicitado pela PH-FIT (Karina) em conversa via Skype dia 23/05/2017
//   if Acesso(cUsuario, 57, 'acesso') = 1 then begin
   if PermitirAceiteRecusa() = True then begin
      AtualizarStatusRNC(sCodigoRNC, '3');
      GravarHistoricoRNC(sCodigoRNC, 'DISPOSIÇÃO ACEITA', mmoDisposicao.Text);

      AtualizarDados();
      AtualizarHistorico();
      PreencherCampos();
      btnAceitar.Enabled:= False;
      btnRecusar.Enabled:= False;
   end
   else begin
      Application.MessageBox(PChar('Não é possível aceitar/recusar a disposição. ' + #13 +
                                   'Verifique se o usuário ativo está cadastrado como Usuário Relacionado ' +
                                   'no cadastro de Colaboradores. Somente o emitente do RNC pode aceitar/recusar ' +
                                   'uma disposição.'), 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormCadRNCFecha.btnRecusarClick(Sender: TObject);
begin
   // Regra para o Aceite/Recusa da disposição
   // Somente o emitente do RNC pode aceitar/recusar uma disposição
   // Solicitado pela PH-FIT (Karina) em conversa via Skype dia 23/05/2017
//   if Acesso(cUsuario, 57, 'acesso') = 1 then begin
   if PermitirAceiteRecusa() = True then begin
      AtualizarStatusRNC(sCodigoRNC, '4');
      GravarHistoricoRNC(sCodigoRNC, 'DISPOSIÇÃO RECUSADA', mmoDisposicao.Text);

      AtualizarDados();
      AtualizarHistorico();
      PreencherCampos();
      btnAceitar.Enabled:= False;
      btnRecusar.Enabled:= False;
   end
   else begin
      Application.MessageBox(PChar('Não é possível aceitar/recusar a disposição. ' + #13 +
                                   'Verifique se o usuário ativo está cadastrado como Usuário Relacionado ' +
                                   'no cadastro de Colaboradores. Somente o emitente do RNC pode aceitar/recusar ' +
                                   'uma disposição.'), 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormCadRNCFecha.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';

   case pctFechaRNC.TabIndex of
      0: begin
         if (Acesso(cUsuario, 53, 'alteracao') = 1) then begin
            HabilitarCampos(True, False, Self, 1);
            TryFocus(mmoDisposicao);
            Botoes(False);
         end;
      end;
   end;
end;

procedure TFormCadRNCFecha.btnCancelarClick(Sender: TObject);
begin
   case pctFechaRNC.TabIndex of
      0: begin
         AtualizarDados();
         PreencherCampos();
         Botoes(True);
         HabilitarCampos(False, False, Self, 1);
      end;
   end;
end;

procedure TFormCadRNCFecha.btnFecharClick(Sender: TObject);
begin
   pnlTexto.Visible:= False;
end;

procedure TFormCadRNCFecha.btnGravarClick(Sender: TObject);
begin
   case pctFechaRNC.TabIndex of
      0: begin // Cadastro
         if ValidarDados() then begin
            try
               VerificarStatusRNC();

               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE rnc SET' +
                                ' rnc_disposicao = ' + QuotedStr(mmoDisposicao.Text) + ',' +
                                ' rnc_status = ' + IntToStr(dblStatus.KeyValue) +
                                ' WHERE rnc_codigo = ' + sCodigoRNC;
                  Execute;
               end;

               Auditoria('RNC FECHAMENTO', edtIdentificacao.Text, cOperacao,'');
               AtualizarDados();
               HabilitarCampos(False, False, Self, 1);
               Botoes(True);
               PreencherCampos();

               GravarHistoricoRNC(sCodigoRNC, 'RNC RESPONDIDO', mmoDisposicao.Text);
               AtualizarHistorico();

               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

               if Application.MessageBox('Deseja enviar um e-mail ao emitente avisando as alterações do RNC ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
                  PrepararEmail();
               end;
            except
               on E:Exception do begin
                  MostrarErro('Erro ao gravar dados. Verifique', E.Message, Self.Name);
               end;
            end;
         end;
      end;
   end;
end;

procedure TFormCadRNCFecha.btnGravarEmailClick(Sender: TObject);
begin
   if pnlEmail.Tag = 1 then begin // E-mail Emitente
      Executar(' UPDATE colaboradores' +
              ' SET col_email = ' + QuotedStr(edtEmail.Text) +
              ' WHERE codi_col = ' + dblEmitido.KeyValue
              );

      pnlEmail.Visible:= False;

      cdsEmitido.Edit;
      cdsEmitidocol_email.AsString:= edtEmail.Text;
      PrepararEmail();
   end;
end;

procedure TFormCadRNCFecha.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRNCFecha.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormCadRNCFecha.btnPDCAClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      AbrirForm(TFormPDCA, FormPDCA, 4);
   end;
end;

procedure TFormCadRNCFecha.btnPrimeiroClick(Sender: TObject);
begin
   cdsRNC.First;
   PreencherCampos();
end;

procedure TFormCadRNCFecha.btnAnteriorClick(Sender: TObject);
begin
   cdsRNC.Prior;
   PreencherCampos();
end;

procedure TFormCadRNCFecha.btnProximoClick(Sender: TObject);
begin
   cdsRNC.Next;
   PreencherCampos();
end;

procedure TFormCadRNCFecha.btnUltimoClick(Sender: TObject);
begin
   cdsRNC.Last;
   PreencherCampos();
end;

procedure TFormCadRNCFecha.btnSairClick(Sender: TObject);
begin
   if not (FormVisualizaRNC = nil) then begin
      FormVisualizaRNC.AtualizarDados();
   end;
   Self.Close;
end;

procedure TFormCadRNCFecha.btnSairEmailClick(Sender: TObject);
begin
   pnlEmail.Visible:= False;
end;

procedure TFormCadRNCFecha.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRNCFecha.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRNCFecha.cdsHistoricohis_disposicaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsHistorico.FieldByName('his_disposicao').AsString, 1, 70);
end;

procedure TFormCadRNCFecha.ControlarAbas;
begin
   mmoTexto.Visible:=False;

   case pctFechaRNC.TabIndex of
      0: begin// Cadastro
         Botoes(True);
         btnImprimir.Visible:= True;
         PreencherCampos();
      end;
      1: begin // Histórico
         btnAlterar.Enabled := False;
         btnGravar.Enabled  := False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnPDCA.Enabled    := False;
      end;
   end;
end;

procedure TFormCadRNCFecha.dbgAcoesPMCCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadRNCFecha.dbgAcoesPMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadRNCFecha.FormShow(Sender: TObject);
begin
   pctFechaRNC.TabIndex:= 0;
   AtualizarDados();
   AtualizarHistorico();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   pnlTexto.Visible   := False;
   pnlEmail.Visible   := False;
end;

procedure TFormCadRNCFecha.mmoDescricaoAcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadRNCFecha.mmoNaoConformidadeBigKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= #0;
end;

procedure TFormCadRNCFecha.mmoNaoConformidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadRNCFecha.mmoVerificacaoAcaoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadRNCFecha.pctFechaRNCChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadRNCFecha.PreencherCampos;
begin
   case pctFechaRNC.TabIndex of
      0: begin
         with cdsRNC do begin
            edtIdentificacao.Text     := FieldByName('rnc_identificacao').AsString;
            dtData.Date               := FieldByName('rnc_data').AsDateTime;
            edtIdentificacaoHist.Text := FieldByName('rnc_identificacao').AsString;
            dtDataHist.Date           := FieldByName('rnc_data').AsDateTime;

            mmoNaoConformidade.Text   := FieldByName('rnc_nconformidade').AsString;
            mmoDisposicao.Text        := FieldByName('rnc_disposicao').AsString;
            edtOrdemProd.Text         := FieldByName('rnc_ordemprod').AsString;

            btnAceitar.Enabled        := mmoDisposicao.Text <> EmptyStr;
            btnRecusar.Enabled        := mmoDisposicao.Text <> EmptyStr;


            if FieldByName('rnc_status').AsInteger >= 3 then begin // Aceito ou Recusado
               btnAceitar.Enabled:= False;
               btnRecusar.Enabled:= False;
            end;


            if FieldByName('rnc_emitido').AsString <> EmptyStr then begin
               dblEmitido.KeyValue:= FieldByName('rnc_emitido').AsString;
            end;

            if FieldByName('rnc_motivo').AsString <> EmptyStr then begin
               dblTipo.KeyValue:= FieldByName('rnc_motivo').AsString;
            end;

            if FieldByName('rnc_processo').AsString <> EmptyStr then begin
               dblProcesso.KeyValue:= FieldByName('rnc_processo').AsString;
            end;

            if FieldByName('rnc_origem').AsString <> EmptyStr then begin
               dblOrigem.KeyValue:= FieldByName('rnc_origem').AsString;
            end;

            if FieldByName('rnc_responsavel').AsString <> EmptyStr then begin
               dblResponsavel.KeyValue:= FieldByName('rnc_responsavel').AsString;
            end;

            if FieldByName('rnc_procede').AsString <> EmptyStr then begin
               dblProcede.KeyValue:= FieldByName('rnc_procede').AsString;
            end;

            if FieldByName('rnc_status').AsString <> EmptyStr then begin
               dblStatus.KeyValue:= FieldByName('rnc_status').AsString;
            end;

            if FieldByName('rnc_cliente').AsString <> EmptyStr then begin
               dblClientes.KeyValue:= FieldByName('rnc_cliente').AsString;
            end;

            if FieldByName('rnc_fornecedor').AsString <> EmptyStr then begin
               dblForn.KeyValue:= FieldByName('rnc_fornecedor').AsString;
            end;
         end;

         ControlarBotaoVisualiza(Self);
      end;
   end;
end;

procedure TFormCadRNCFecha.PrepararEmail;
begin
   if VerificarConexaoInternet(True) then begin
      pnlEmail.Tag:= 1;

      sTextoEmail:= 'Foi aberto um RNC com as informações abaixo: <br><br>' +
                    '<b>RNC:</b> ' + edtIdentificacao.Text + '<br>' +
                    '<b>Data RNC:</b> ' + dtData.Text + '<br>' +
                    '<b>Registro de Não Conformidade:</b> ' + mmoNaoConformidade.Text +
                    '<br><br>'+
                    'Acesse o sistema Destra Manager para maiores detalhes.';

      if AllTrim(cdsEmitidocol_email.AsString) = EmptyStr then begin
         if Application.MessageBox(PChar('O colaborador ' + dblEmitido.Text + ' não tem e-mail cadastrado no Cadastro de Colaboradores.' + #13#10 + 'Deseja cadastrar o e-mail antes de enviar ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
            edtEmail.Enabled:= True;
            AbrePanel(pnlEmail, Self);
            lblNomeCol.Caption:= dblEmitido.Text;
            TryFocus(edtEmail);
         end;
      end
      else begin
         EnviarEmail(sTextoEmail, 'RNC Alterado', cdsEmitidocol_email.AsString, 'sistema');
      end;
   end;
end;

procedure TFormCadRNCFecha.sbVisualizarDispClick(Sender: TObject);
begin
   mmoTexto.Text   := mmoDisposicao.Text;
   pnlTexto.Left   := 7;
   pnlTexto.Top    := 155;
   lblTituloTexto.Caption:= 'Disposição';
   pnlTexto.Visible:= True;
end;

procedure TFormCadRNCFecha.sbVisualizarNCClick(Sender: TObject);
begin
   mmoTexto.Text   := mmoNaoConformidade.Text;
   pnlTexto.Left   := mmoNaoConformidade.Left - 1;
   pnlTexto.Top    := mmoNaoConformidade.Top - 1;
   lblTituloTexto.Caption:= '';
   pnlTexto.Visible:= True;
end;

procedure TFormCadRNCFecha.tsAcoesShow(Sender: TObject);
begin
   HabilitarCampos(False, False, Self, 1);
end;

function TFormCadRNCFecha.ValidarDados(): Boolean;
begin
   case pctFechaRNC.TabIndex of
      0: begin
         

         Result:= True;
      end;
   end;
end;

procedure TFormCadRNCFecha.VerificarStatusRNC;
begin
   if mmoDisposicao.Text = EmptyStr then begin
      dblStatus.KeyValue:= 1; // Aberto
   end
   else begin
      dblStatus.KeyValue:= 2; // Respondido
   end;
end;

procedure TFormCadRNCFecha.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   case pctFechaRNC.TabIndex of
      0: begin// Cadastro
         with cdsImprimir do begin
            Active:= False;
            CommandText:= ' SELECT R.rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, C.nome_col as Emitido, rnc_motivo,' +
                          ' TC1.valo_com as Motivo, rnc_processo, P.nome_pro as Processo, rnc_setor, rnc_origem, TC.valo_com as Origem,' +
                          ' rnc_cliente, CL.cli_nome as Cliente, rnc_fornecedor, F.forn_nome as Fornecedor, rnc_consumidor, rnc_nconformidade,' +
                          ' rnc_procede, TC3.valo_com as Procede, rnc_responsavel, C1.nome_col as Responsavel, rnc_departamento,' +
                          ' rnc_relacionamento, rnc_representante, rnc_status, TC2.valo_com as Status, rnc_disposicao, H.*' +
                          ' FROM rnc R' +
                          ' LEFT JOIN rnc_historico H ON H.rnc_codigo = R.rnc_codigo' +
                          ' INNER JOIN colaboradores C ON C.codi_col = rnc_emitido' +
                          ' INNER JOIN colaboradores C1 ON C1.codi_col = rnc_responsavel' +
                          ' INNER JOIN processos P ON P.codi_pro = rnc_processo' +
                          ' INNER JOIN tabela_combos TC ON TC.tipo_com = 33 AND TC.codi_com = rnc_origem' +
                          ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 32 AND TC1.codi_com = rnc_motivo' +
                          ' INNER JOIN tabela_combos TC2 ON TC2.tipo_com = 35 AND TC2.codi_com = rnc_status' +
                          ' INNER JOIN tabela_combos TC3 ON TC3.tipo_com = 14 AND TC3.codi_com = rnc_procede' +
                          ' INNER JOIN fornecedores F ON F.forn_codigo = rnc_fornecedor' +
                          ' INNER JOIN clientes CL ON CL.cli_codigo = rnc_cliente' +
                          ' WHERE R.rnc_codigo = ' + sCodigoRNC;
            Active:= True;
         end;

         if cdsImprimir.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;

         frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_RNC.fr3');
//         Auditoria('PMC',dm.cdsRNCnume_pmc.AsString,'R', '');
      end;
   end;

   with frxReport1 do begin
      if tipoImp = 'I' then begin
         PrepareReport;
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

procedure TFormCadRNCFecha.InserirTexto(Titulo: string; Texto: string);
begin
   mmoTexto.Clear;
   mmoTexto.Lines.Add(Titulo);
   mmoTexto.Lines.Add('');
   mmoTexto.Lines.Add(Texto);
end;

end.
