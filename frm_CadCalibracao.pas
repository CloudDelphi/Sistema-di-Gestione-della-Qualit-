unit frm_CadCalibracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadCalibracao = class(TForm)
    pctCalibracao: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgCalibracao: TDBGrid;
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
    zqryCalibracao: TZQuery;
    dspCalibracao: TDataSetProvider;
    cdsCalibracao: TClientDataSet;
    dsCalibracao: TDataSource;
    frxReport1: TfrxReport;
    frxDBCalibracao: TfrxDBDataset;
    tsCadastro: TTabSheet;
    opd1: TOpenDialog;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    zqryFreq: TZQuery;
    dspFreq: TDataSetProvider;
    cdsFreq: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsFreq: TDataSource;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    edtCapacidade: TEdit;
    edtCriterio: TEdit;
    edtCertificado: TEdit;
    dtCalibracao: TDateEdit;
    dtProxima: TDateEdit;
    edtIdent: TEdit;
    edtResolucao: TEdit;
    edtLocalizacao: TEdit;
    edtFaixa: TEdit;
    edtCaminho: TEdit;
    dblEquipamentos: TDBLookupComboBox;
    dblFreq: TDBLookupComboBox;
    edtCodigo: TEdit;
    lbl16: TLabel;
    cdsImprimircali_capacidade: TWideStringField;
    cdsImprimircali_codigo: TLargeintField;
    cdsImprimircali_criterio: TWideStringField;
    cdsImprimircali_dataCalibracao: TDateTimeField;
    cdsImprimircali_erro: TWideStringField;
    cdsImprimircali_faixa: TWideStringField;
    cdsImprimircali_frequencia: TWideStringField;
    cdsImprimircali_localizacao: TWideStringField;
    cdsImprimircali_numero: TWideStringField;
    cdsImprimircali_padroes: TMemoField;
    cdsImprimircali_parecer: TWideStringField;
    cdsImprimircali_proxCalibracao: TDateTimeField;
    cdsImprimircali_resolucao: TWideStringField;
    cdsImprimircali_certificado: TWideStringField;
    cdsImprimircali_processo: TLargeintField;
    cdsImprimircali_arquivo: TWideStringField;
    cdsImprimircodi_inf: TLargeintField;
    cdsImprimirdesc_inf: TWideStringField;
    cdsImprimirDescProcesso: TStringField;
    cdsImprimirDescEquip: TStringField;
    zqryEquip: TZQuery;
    dspEquip: TDataSetProvider;
    cdsEquip: TClientDataSet;
    dsEquip: TDataSource;
    cdsEquipcodi_inf: TLargeintField;
    cdsEquipiden_inf: TWideStringField;
    cdsEquipdesc_inf: TWideStringField;
    lbl17: TLabel;
    edtErro: TEdit;
    lbl18: TLabel;
    edtIncerteza: TEdit;
    lbl19: TLabel;
    edtErroTotal: TEdit;
    lbl20: TLabel;
    dblAprovado: TDBLookupComboBox;
    zqryAprovado: TZQuery;
    dspAprovado: TDataSetProvider;
    cdsAprovado: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsAprovado: TDataSource;
    cdsImprimircali_incerteza: TWideStringField;
    cdsImprimircali_erroTotal: TWideStringField;
    cdsImprimircali_aprovado: TIntegerField;
    cdsImprimircali_equip: TLargeintField;
    lbl21: TLabel;
    mmoObs: TMemo;
    cdsCalibracaocali_capacidade: TWideStringField;
    cdsCalibracaocali_codigo: TLargeintField;
    cdsCalibracaocali_criterio: TWideStringField;
    cdsCalibracaocali_datacalibracao: TDateTimeField;
    cdsCalibracaocali_equip: TLargeintField;
    cdsCalibracaocali_erro: TWideStringField;
    cdsCalibracaocali_faixa: TWideStringField;
    cdsCalibracaocali_frequencia: TWideStringField;
    cdsCalibracaocali_localizacao: TWideStringField;
    cdsCalibracaocali_numero: TWideStringField;
    cdsCalibracaocali_padroes: TWideMemoField;
    cdsCalibracaocali_parecer: TWideStringField;
    cdsCalibracaocali_proxcalibracao: TDateTimeField;
    cdsCalibracaocali_resolucao: TWideStringField;
    cdsCalibracaocali_certificado: TWideStringField;
    cdsCalibracaocali_processo: TLargeintField;
    cdsCalibracaocali_arquivo: TWideStringField;
    cdsCalibracaocali_incerteza: TWideStringField;
    cdsCalibracaocali_errototal: TWideStringField;
    cdsCalibracaocali_aprovado: TIntegerField;
    cdsCalibracaocodi_inf: TLargeintField;
    cdsCalibracaodesc_inf: TWideStringField;
    cdsCalibracaocali_obs: TWideMemoField;
    edtUnidade: TEdit;
    lbl22: TLabel;
    cdsCalibracaocali_unidade: TWideStringField;
    tsDocumentos: TTabSheet;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    edtIdentExe: TEdit;
    edtCodigoDoc: TEdit;
    pnl5: TPanel;
    lbl26: TLabel;
    lbl27: TLabel;
    pnl6: TPanel;
    dbgDocumentos: TDBGrid;
    zqryColab: TZQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    dsColab: TDataSource;
    cdsColabcodi_col: TLargeintField;
    cdsColabnome_col: TWideStringField;
    edtEquipamentoExe: TEdit;
    edtProcessoExe: TEdit;
    dsDocumentos: TDataSource;
    cdsDocumentos: TClientDataSet;
    dspDocumentos: TDataSetProvider;
    zqryDocumentos: TZQuery;
    cdsEquipinf_capacidade: TWideStringField;
    cdsEquipinf_resolucao: TWideStringField;
    cdsEquipinf_unidade: TWideStringField;
    edtCaminhoDoc: TEdit;
    sbArquivoDoc: TSpeedButton;
    sbVisualizarDoc: TSpeedButton;
    lbl28: TLabel;
    edtDocumento: TEdit;
    cdsDocumentosdoc_codigo: TIntegerField;
    cdsDocumentoscal_codigo: TIntegerField;
    cdsDocumentosdoc_descricao: TWideMemoField;
    cdsDocumentosdoc_caminho: TWideMemoField;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl30: TLabel;
    dblEquipamentosPesq: TDBLookupComboBox;
    lbl15: TLabel;
    dblProcessos: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
//    procedure BuscarNovoCodigo;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgCalibracaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgCalibracaoCellClick(Column: TColumn);
    procedure dbgCalibracaoDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctCalibracaoChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure dblProcessosCloseUp(Sender: TObject);
    procedure dblEquipamentosCloseUp(Sender: TObject);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure dtCalibracaoExit(Sender: TObject);
    procedure CalcularProximaCalibracao();
    procedure dblFreqCloseUp(Sender: TObject);
    procedure CalcularErroTotal();
    procedure edtErroExit(Sender: TObject);
    procedure edtIncertezaExit(Sender: TObject);
    procedure edtCriterioExit(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure dbgDocumentosCellClick(Column: TColumn);
    procedure sbArquivoDocClick(Sender: TObject);
    procedure sbVisualizarDocClick(Sender: TObject);
    procedure cdsDocumentosdoc_descricaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure AtualizarPesquisa();
    procedure dblEquipamentosPesqCloseUp(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
//    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadCalibracao: TFormCadCalibracao;

implementation

uses frm_dm, frm_Inicial, frm_Laaia, Funcoes;

{$R *.dfm}

procedure TFormCadCalibracao.AtualizarDados;
begin
   with cdsFreq do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 19' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsAprovado do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 20' +
                    ' ORDER BY orde_com';
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

//   with cdsEquip do begin
//      Active:= False;
//      Active:= True;
//   end;

   with cdsColab do begin
      Active:= False;
      Active:= True;
   end;

//   with cdsCalibracao do begin
//      Active:= False;
//      Active:= True;
//   end;

//   if AllTrim(edtIdentificacao.Text) <> EmptyStr then begin
//      cdsCalibracao.Locate('nume_pmc', edtIdentificacao.Text,[])
//   end;
end;

procedure TFormCadCalibracao.AtualizarDadosAcessorios;
begin
   if edtCodigoDoc.Text <> EmptyStr then begin
      with cdsDocumentos do begin
         Active:= False;
         CommandText:= ' SELECT doc_codigo, cal_codigo, doc_descricao, doc_caminho' +
                       ' FROM calibracao_documentos' +
                       ' WHERE cal_codigo = ' + QuotedStr(edtCodigoDoc.Text) +
                       ' ORDER BY doc_descricao';
         Active:= True;
      end;
   end;
end;

procedure TFormCadCalibracao.AtualizarPesquisa;
begin
   with cdsCalibracao do begin
         Active:= False;
         CommandText:= ' SELECT cali_capacidade, cali_codigo, cali_criterio, ' +
                       ' cali_dataCalibracao, cali_equip, cali_erro, cali_faixa, ' +
                       ' cali_frequencia, cali_localizacao, cali_numero, cali_padroes, ' +
                       ' cali_parecer, cali_proxCalibracao, cali_resolucao, cali_certificado, ' +
                       ' cali_processo, cali_arquivo, cali_erro, cali_incerteza, cali_erroTotal, cali_aprovado, ' +
                       ' I.codi_inf, I.desc_inf, cali_obs, cali_unidade' +
                       ' FROM calibracao C ' +
                       ' INNER JOIN infraestrutura I on I.codi_inf = C.cali_equip '+
                       ' WHERE cali_processo = ' + IntToStr(dblProcessos.KeyValue);
         if (dblEquipamentosPesq.KeyValue <> -1) and (dblEquipamentosPesq.KeyValue <> null) then begin
            CommandText:= CommandText + ' AND cali_equip = ' + IntToStr(dblEquipamentosPesq.KeyValue);
         end;
                       CommandText:= CommandText + ' ORDER BY cali_codigo';
         Active:= True;
      end;
end;

procedure TFormCadCalibracao.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

//   if cdsCalibracao.RecordCount = 0 then begin
//      btnAlterar.Enabled:= False;
//      btnExcluir.Enabled:= False;
//   end;
end;

procedure TFormCadCalibracao.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 23, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 2);
      Botoes(False);
      if pctCalibracao.TabIndex = 0 then begin // Cadastro
         TryFocus(dblEquipamentos);
      end;

      if pctCalibracao.TabIndex = 1 then begin // Documentos
         TryFocus(edtDocumento);
      end;
   end;
end;

procedure TFormCadCalibracao.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;


procedure TFormCadCalibracao.btnExcluirClick(Sender: TObject);
var
   sCodCali : string;
   sDescEqui: string;
   sDescDoc : string;
begin
   if (Acesso(cUsuario, 23, 'exclusao') = 1) then begin
      if pctCalibracao.TabIndex = 0 then begin // Cadastro
         if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sCodCali := cdsCalibracaocali_codigo.AsString;
            sDescEqui:= dblEquipamentos.Text;

            // Apaga os documentos da calibração
            Executar(' DELETE FROM calibracao_documentos' +
                     ' WHERE cal_codigo = ' + sCodCali);

            Executar(' DELETE FROM calibracao' +
                     ' WHERE cali_codigo = ' + sCodCali);

            Auditoria('TABELA DE CALIBRAÇÃO', sDescEqui, 'E', '');
            LimparCampos(Self);
            dblProcessosCloseUp(Self);
            PreencherCampos();
         end;
         Botoes(True);
      end;

      if pctCalibracao.TabIndex = 1 then begin // Documentos
         if Application.MessageBox('Confirma a exclusão do documento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sDescDoc:= edtDocumento.Text;

            Executar(' DELETE FROM calibracao_documentos' +
                     ' WHERE doc_codigo = ' + cdsDocumentos.FieldByName('doc_codigo').AsString);
            AtualizarDadosAcessorios();

            Auditoria('TABELA DE CALIBRAÇÃO - DOCUMENTOS', sDescDoc, 'E', '');
            LimparCampos(Self);
            PreencherCampos();
         end;
      end;
   end;
end;

procedure TFormCadCalibracao.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      if pctCalibracao.TabIndex = 0 then begin // Cadastro
         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' INSERT INTO calibracao' +
                                   ' (cali_codigo, cali_numero, cali_equip, cali_resolucao, cali_localizacao, ' +
                                   ' cali_frequencia, cali_faixa, cali_capacidade, cali_criterio, cali_certificado, ' +
                                   ' cali_dataCalibracao, cali_proxCalibracao, cali_processo, cali_arquivo, ' +
                                   ' cali_erro, cali_incerteza, cali_erroTotal, cali_aprovado, cali_obs, ' +
                                   ' cali_unidade' +
                                   ')' +
                                   ' VALUES(' +
                                   QuotedStr(edtCodigo.Text) + ',' +
                                   QuotedStr(edtIdent.Text) + ',' +
                                   QuotedStr(dblEquipamentos.KeyValue) + ',' +
                                   QuotedStr(edtResolucao.Text) + ',' +
                                   QuotedStr(edtLocalizacao.Text) + ',' +
                                   QuotedStr(dblFreq.KeyValue) + ',' +
                                   QuotedStr(edtFaixa.Text) + ',' +
                                   QuotedStr(edtCapacidade.Text) + ',' +
                                   QuotedStr(edtCriterio.Text) + ',' +
                                   QuotedStr(edtCertificado.Text) + ',' +
                                   ArrumaDataSQL(dtCalibracao.Date) + ',' +
                                   ArrumaDataSQL(dtProxima.Date) + ',' +
                                   IntToStr(dblProcessos.KeyValue) + ',' +
                                   QuotedStr(edtCaminho.Text) + ',' +
                                   QuotedStr(edtErro.Text) + ',' +
                                   QuotedStr(edtIncerteza.Text) + ',' +
                                   QuotedStr(edtErroTotal.Text) + ',' +
                                   QuotedStr(dblAprovado.KeyValue) + ',' +
                                   QuotedStr(mmoObs.Text) + ',' +
                                   QuotedStr(edtUnidade.Text) +
                                   ')';
                     Execute;
                  end;
               end
               else begin
                  with cdsGravar do begin
                     Active:= False;
                     CommandText:= ' UPDATE calibracao SET ' +
                                   ' cali_numero = ' + QuotedStr(edtIdent.Text) + ',' +
                                   ' cali_equip = ' + QuotedStr(dblEquipamentos.KeyValue) + ',' +
                                   ' cali_resolucao = ' + QuotedStr(edtResolucao.Text) + ',' +
                                   ' cali_localizacao = ' + QuotedStr(edtLocalizacao.Text) + ',' +
                                   ' cali_frequencia = ' + QuotedStr(dblFreq.KeyValue) + ',' +
                                   ' cali_faixa = ' + QuotedStr(edtFaixa.Text) + ',' +
                                   ' cali_capacidade = ' + QuotedStr(edtCapacidade.Text) + ',' +
                                   ' cali_criterio = ' + QuotedStr(edtCriterio.Text) + ',' +
                                   ' cali_certificado = ' + QuotedStr(edtCertificado.Text) + ',' +
                                   ' cali_dataCalibracao = ' + ArrumaDataSQL(dtCalibracao.Date) + ',' +
                                   ' cali_proxCalibracao = ' + ArrumaDataSQL(dtProxima.Date) + ',' +
                                   ' cali_processo = ' + IntToStr(dblProcessos.KeyValue) + ',' +
                                   ' cali_arquivo = ' + QuotedStr(edtCaminho.Text) + ',' +
                                   ' cali_erro = ' + QuotedStr(edtErro.Text) + ',' +
                                   ' cali_incerteza = ' + QuotedStr(edtIncerteza.Text) + ',' +
                                   ' cali_erroTotal = ' + QuotedStr(edtErroTotal.Text) + ',' +
                                   ' cali_aprovado = ' + QuotedStr(dblAprovado.KeyValue) + ',' +
                                   ' cali_obs = ' + QuotedStr(mmoObs.Text) + ',' +
                                   ' cali_unidade = ' + QuotedStr(edtUnidade.Text) +
                                   ' WHERE cali_codigo = ' + cdsCalibracao.FieldByName('cali_codigo').AsString;
                     Execute;
                  end;
               end;
            end;

            Auditoria('TABELA DE CALIBRAÇÃO', dblEquipamentos.Text, cOperacao,'');
            dblProcessosCloseUp(Self);

            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E:Exception do begin
               Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
            end;
         end;
      end
      else begin // Documentos
         if cOperacao = 'I' then begin
            Executar(' INSERT INTO calibracao_documentos' +
            ' (doc_codigo, cal_codigo, doc_descricao, doc_caminho) ' +
            ' VALUES( ' +
            BuscarNovoCodigo('calibracao_documentos', 'doc_codigo') + ',' +
            QuotedStr(edtCodigoDoc.Text) + ',' +
            QuotedStr(edtDocumento.Text) + ',' +
            QuotedStr(edtCaminhoDoc.Text) +
            ')');
         end
         else begin
            Executar(' UPDATE calibracao_documentos SET' +
                     ' doc_descricao = ' + QuotedStr(edtDocumento.Text) + ',' +
                     ' doc_caminho = ' + QuotedStr(edtCaminhoDoc.Text) +
                     ' WHERE cal_codigo = ' + edtCodigo.Text +
                     ' AND doc_codigo = ' + cdsDocumentos.FieldByName('doc_codigo').AsString);
         end;

         Auditoria('TABELA DE CALIBRAÇÃO - DOCUMENTOS', edtDocumento.Text, cOperacao,'');
         AtualizarDadosAcessorios();
      end;

      HabilitarCampos(False, False, Self, 1, 2);
      Botoes(True);
   end;
end;

procedure TFormCadCalibracao.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadCalibracao.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadCalibracao.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos(Self);

   if (Acesso(cUsuario, 23, 'cadastro') = 1) then begin
      if pctCalibracao.TabIndex = 0 then begin // Cadastro
         HabilitarCampos(True, True, Self, 1, 2);
         edtCodigo.Text:= BuscarNovoCodigo('calibracao', 'cali_codigo');
         TryFocus(dblEquipamentos);
      end;

      if pctCalibracao.TabIndex = 1 then begin // Documentos
         HabilitarCampos(True, False, Self );
         TryFocus(edtDocumento);
      end;

      Botoes(False);
      btnExcluir.Enabled:= False;
      btnAlterar.Enabled:= False;
   end;
end;

procedure TFormCadCalibracao.btnPrimeiroClick(Sender: TObject);
begin
   cdsCalibracao.First;
   PreencherCampos();
   ControlarAbas();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadCalibracao.btnAnteriorClick(Sender: TObject);
begin
   cdsCalibracao.Prior;
   PreencherCampos();
   ControlarAbas();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadCalibracao.btnProximoClick(Sender: TObject);
begin
   cdsCalibracao.Next;
   PreencherCampos();
   ControlarAbas();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadCalibracao.btnUltimoClick(Sender: TObject);
begin
   cdsCalibracao.Last;
   PreencherCampos();
   ControlarAbas();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadCalibracao.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadCalibracao.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadCalibracao.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

//procedure TFormCadCalibracao.BuscarNovoCodigo;
//begin
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT MAX(cali_codigo) AS NovoCodigo FROM calibracao';
//      Active:= True;
//
//      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
//         sNovoCodigo:= '1';
//      end
//      else begin
//         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
//      end;
//   end;
//end;

procedure TFormCadCalibracao.CalcularErroTotal;
begin
   try
      edtErroTotal.Text:= FloatToStr(StrToFloat(edtErro.Text) + StrToFloat(edtIncerteza.Text));

      if StrToFloat(edtErroTotal.Text) <= StrToFloat(edtCriterio.Text) then begin
         dblAprovado.KeyValue:= 1;
      end
      else begin
         dblAprovado.KeyValue:= 0;
      end;
   except

   end;
end;

procedure TFormCadCalibracao.CalcularProximaCalibracao;
begin
   dtProxima.Date:= dtCalibracao.Date + dblFreq.KeyValue;
end;

procedure TFormCadCalibracao.cdsDocumentosdoc_descricaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsDocumentos.FieldByName('doc_descricao').AsString, 1, 50);
end;

procedure TFormCadCalibracao.ControlarAbas;
begin
   if pctCalibracao.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin
      if (dblProcessos.KeyValue = -1) OR (dblProcessos.KeyValue = Null) then begin
         Application.MessageBox('Selecione um processo', 'Confirmação', MB_OK + MB_ICONWARNING);
//         pctCalibracao.TabIndex:= 0;
         TryFocus(dblProcessos);
         Exit;
      end;

      if pctCalibracao.TabIndex = 1 then begin // Documentos
         edtProcessoExe.Text   := dblProcessos.Text;
         edtCodigoDoc.Text     := edtCodigo.Text;
         edtEquipamentoExe.Text:= dblEquipamentos.Text;
         edtIdentExe.Text      := edtIdent.Text;

         AtualizarDadosAcessorios();
      end;

      if pctCalibracao.TabIndex = 2 then begin // Pesquisa
         btnNovo.Enabled    := False;
         btnGravar.Enabled  := False;
         btnExcluir.Enabled := False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled := False;

         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadCalibracao.dbgCalibracaoCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadCalibracao.dbgCalibracaoDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctCalibracao.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadCalibracao.dbgCalibracaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadCalibracao.dbgDocumentosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadCalibracao.dblEquipamentosCloseUp(Sender: TObject);
begin
   edtIdent.Text     := cdsEquip.FieldByName('iden_inf').AsString;
   edtUnidade.Text   := cdsEquip.FieldByName('inf_unidade').AsString;
   edtCapacidade.Text:= cdsEquip.FieldByName('inf_capacidade').AsString;
   edtResolucao.Text := cdsEquip.FieldByName('inf_resolucao').AsString;
end;

procedure TFormCadCalibracao.dblEquipamentosPesqCloseUp(Sender: TObject);
begin
   AtualizarPesquisa();
end;

procedure TFormCadCalibracao.dblFreqCloseUp(Sender: TObject);
begin
   if dtCalibracao.Text <> '  /  /    ' then begin
      CalcularProximaCalibracao();
   end;
end;

procedure TFormCadCalibracao.dblProcessosCloseUp(Sender: TObject);
begin
   if dblProcessos.KeyValue <> Null then begin
      if dblProcessos.KeyValue <> Null then begin
         with cdsEquip do begin
            Active:= False;
            CommandText:= ' SELECT codi_inf, iden_inf, desc_inf, ' +
                          ' inf_capacidade, inf_resolucao, inf_unidade' +
                          ' FROM infraestrutura '+
                          ' WHERE proc_inf = ' + QuotedStr(IntToStr(dblProcessos.KeyValue)) +
//                          ' AND manu_inf = 0 ' + // SIM
                          ' AND tipo_inf = 5 ' + // Instrumentos de medição
                          ' ORDER BY desc_inf';
            Active:= True;
         end;
      end;

      dblEquipamentosPesq.KeyValue:= -1;
      AtualizarPesquisa();

      if AllTrim(edtCodigo.Text) <> EmptyStr then begin
         cdsCalibracao.Locate('cali_codigo', edtCodigo.Text,[])
      end;

      PreencherCampos();
      Botoes(True);
      pnlNavegacao.Enabled:= True;
   end;
end;

procedure TFormCadCalibracao.dtCalibracaoExit(Sender: TObject);
begin
   CalcularProximaCalibracao();
end;

procedure TFormCadCalibracao.edtCriterioExit(Sender: TObject);
begin
   CalcularErroTotal();
end;

procedure TFormCadCalibracao.edtErroExit(Sender: TObject);
begin
   CalcularErroTotal();
end;

procedure TFormCadCalibracao.edtIncertezaExit(Sender: TObject);
begin
   CalcularErroTotal();
end;

procedure TFormCadCalibracao.edtValorChange(Sender: TObject);
begin
   if not cdsCalibracao.IsEmpty then begin
      case cbCampo.ItemIndex of
         0: cdsCalibracao.Locate('cali_numero', edtValor.Text, [loPartialKey]);
      end;
   end;
end;

procedure TFormCadCalibracao.FormShow(Sender: TObject);
begin
   pctCalibracao.TabIndex:= 0;
   AtualizarDados();
//   PreencherCampos();
//   Botoes(True);

   btnNovo.Enabled     := False;
   btnAlterar.Enabled  := False;
   btnExcluir.Enabled  := False;
   btnGravar.Enabled   := False;
   btnCancelar.Enabled := False;
   btnImprimir.Enabled := False;
   pnlNavegacao.Enabled:= False;

   HabilitarCampos(False, False, Self, 2);
   pnlImprimir.Visible:= False;

//   pctCalibracao.Pages[1].TabVisible:= False;
end;

procedure TFormCadCalibracao.pctCalibracaoChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadCalibracao.PreencherCampos;
begin
   with cdsCalibracao do begin
      edtCodigo.Text     := FieldByName('cali_codigo').AsString;
      edtIdent.Text      := FieldByName('cali_numero').AsString;
      edtUnidade.Text    := FieldByName('cali_unidade').AsString;
      edtResolucao.Text  := FieldByName('cali_resolucao').AsString;
      edtLocalizacao.Text:= FieldByName('cali_localizacao').AsString;
      edtFaixa.Text      := FieldByName('cali_faixa').AsString;
      edtCapacidade.Text := FieldByName('cali_capacidade').AsString;
      edtCriterio.Text   := FieldByName('cali_criterio').AsString;
      edtCertificado.Text:= FieldByName('cali_certificado').AsString;
      dtCalibracao.Date  := FieldByName('cali_dataCalibracao').AsDateTime;
      dtProxima.Date     := FieldByName('cali_proxCalibracao').AsDateTime;
      edtCaminho.Text    := FieldByName('cali_arquivo').AsString;
      edtErro.Text       := FieldByName('cali_erro').AsString;
      edtErroTotal.Text  := FieldByName('cali_erroTotal').AsString;
      edtIncerteza.Text  := FieldByName('cali_incerteza').AsString;
      mmoObs.Text        := FieldByName('cali_obs').AsString;

      if FieldByName('cali_equip').AsString <> EmptyStr then begin
         dblEquipamentos.KeyValue:= FieldByName('cali_equip').AsString;
      end;

      if FieldByName('cali_frequencia').AsString <> EmptyStr then begin
         dblFreq.KeyValue:= FieldByName('cali_frequencia').AsString;
      end;

      if FieldByName('cali_aprovado').AsString <> EmptyStr then begin
         dblAprovado.KeyValue:= FieldByName('cali_aprovado').AsString;
      end;

      if AllTrim(edtCaminho.Text) <> EmptyStr then begin
         sbVisualizar.Enabled:= True;
      end
      else begin
         sbVisualizar.Enabled:= False;
      end;

      // Documentos
      edtDocumento.Text := cdsDocumentos.FieldByName('doc_descricao').AsString;
      edtCaminhoDoc.Text:= cdsDocumentos.FieldByName('doc_caminho').AsString;

      if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
         sbVisualizarDoc.Enabled:= True;
      end
      else begin
         sbVisualizarDoc.Enabled:= False;
      end;
   end;
end;

procedure TFormCadCalibracao.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadCalibracao.sbArquivoDocClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminhoDoc.Text:= OPD1.FileName;
end;

procedure TFormCadCalibracao.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

procedure TFormCadCalibracao.sbVisualizarDocClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminhoDoc.Text, Self.Name);
end;

function TFormCadCalibracao.ValidarDados(): Boolean;
begin
   if pctCalibracao.TabIndex = 0 then begin  // Cadastro
      if (dblEquipamentos.KeyValue = -1) or (dblEquipamentos.KeyValue = Null) then begin
         Result:= False;
         Application.MessageBox('Campo Equipamento/Instrumento é obrigatório !','Aviso',MB_OK+MB_ICONERROR);
         dblEquipamentos.SetFocus;
         Exit;
      end;

      if dtCalibracao.Text = '  /  /    ' then begin
         Result:= False;
         Application.MessageBox('Campo Data da Calibração é obrigatório !','Aviso',MB_OK+MB_ICONERROR);
         dtCalibracao.SetFocus;
         Exit;
      end;
   end;

   if pctCalibracao.TabIndex = 1 then begin  // Documentos
      if AllTrim(edtDocumento.Text) = EmptyStr then begin
         Result:= False;
         Application.MessageBox('Campo Documento é obrigatório !','Aviso',MB_OK+MB_ICONERROR);
         edtDocumento.SetFocus;
         Exit;
      end;

      if AllTrim(edtCaminhoDoc.Text) = EmptyStr then begin
         Application.MessageBox('Campo Caminho do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtCaminhoDoc);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;

procedure TFormCadCalibracao.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   case rgOrdemImpressao.ItemIndex of
      0: sCampoOrdem:= 'cali_numero';
      1: sCampoOrdem:= 'desc_inf';
      2: sCampoOrdem:= 'cali_proxCalibracao';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT cali_capacidade, cali_codigo, cali_criterio,' +
                    ' cali_dataCalibracao, cali_equip, cali_erro, cali_faixa,' +
                    ' cali_frequencia, cali_localizacao, cali_numero, cali_padroes,' +
                    ' cali_parecer, cali_proxCalibracao, cali_resolucao, cali_certificado,' +
                    ' cali_processo, cali_arquivo, cali_incerteza, cali_erroTotal, cali_aprovado, ' +
                    ' I.codi_inf, I.desc_inf' +
                    ' FROM calibracao C' +
                    ' INNER JOIN infraestrutura I on I.codi_inf = C.cali_equip ' +
                    ' WHERE cali_processo = ' + QuotedStr(IntToStr(dblProcessos.KeyValue)) +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Calibracao.fr3');

      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

end.
