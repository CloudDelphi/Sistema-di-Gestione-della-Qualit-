unit frm_CadRNCAbre;

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
  TFormCadRNCAbre = class(TForm)
    pctAbreRNC: TJvgPageControl;
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
    zqryRNC: TZQuery;
    dspRNC: TDataSetProvider;
    cdsRNC: TClientDataSet;
    dsRNC: TDataSource;
    frxReport1: TfrxReport;
    frxDBRNC: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    dblMotivo: TDBLookupComboBox;
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
    cdsMotivo: TClientDataSet;
    dsMotivo: TDataSource;
    dspMotivo: TDataSetProvider;
    zqryMotivo: TZQuery;
    cdsMotivocodi_com: TLargeintField;
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
    lbl8: TLabel;
    dblProcede: TDBLookupComboBox;
    dlgOpen1: TOpenDialog;
    pnlEmail: TPanel;
    pnl5: TPanel;
    btnSairEmail: TBitBtn;
    pnl6: TPanel;
    btnGravarEmail: TBitBtn;
    lbl15: TLabel;
    edtEmail: TEdit;
    lbl17: TLabel;
    lblNomeCol: TLabel;
    cdsFornforn_codigo: TIntegerField;
    cdsFornforn_nome: TWideStringField;
    tsDocumentos: TTabSheet;
    lbl40: TLabel;
    sbAbrirDoc: TSpeedButton;
    sbVisualizarDoc: TSpeedButton;
    lbl41: TLabel;
    dbgDoc: TDBGrid;
    edtDescricaoDoc: TEdit;
    edtCaminhoDoc: TEdit;
    lbl7: TLabel;
    edtIdentificacaoDoc: TEdit;
    lbl14: TLabel;
    dblRelacionamento: TDBLookupComboBox;
    lbl18: TLabel;
    edtDepartamento: TEdit;
    lbl19: TLabel;
    edtCodigoCli: TEdit;
    lbl20: TLabel;
    edtRepresentante: TEdit;
    edtSetor: TEdit;
    lbl21: TLabel;
    lbl22: TLabel;
    edtConsumidor: TEdit;
    zqryRelacionamento: TZQuery;
    dspRelacionamento: TDataSetProvider;
    cdsRelacionamento: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsRelacionamento: TDataSource;
    zqryDocs: TZQuery;
    dspDocs: TDataSetProvider;
    cdsDocs: TClientDataSet;
    dsDocs: TDataSource;
    cdsDocsrnc_codigo: TIntegerField;
    cdsDocsdoc_codigo: TIntegerField;
    cdsDocsdoc_descricao: TWideMemoField;
    cdsDocsdoc_caminho: TWideMemoField;
    cdsImprimirrnc_codigo: TIntegerField;
    cdsImprimirrnc_identificacao: TWideStringField;
    cdsImprimirrnc_data: TDateTimeField;
    cdsImprimirrnc_emitido: TIntegerField;
    cdsImprimirrnc_motivo: TIntegerField;
    cdsImprimirrnc_processo: TIntegerField;
    cdsImprimirrnc_setor: TWideStringField;
    cdsImprimirrnc_origem: TIntegerField;
    cdsImprimirrnc_cliente: TIntegerField;
    cdsImprimirrnc_fornecedor: TIntegerField;
    cdsImprimirrnc_consumidor: TWideStringField;
    cdsImprimirrnc_nconformidade: TWideMemoField;
    cdsImprimirrnc_procede: TIntegerField;
    cdsImprimirrnc_responsavel: TIntegerField;
    cdsImprimirrnc_departamento: TWideStringField;
    cdsImprimirrnc_relacionamento: TIntegerField;
    cdsImprimirrnc_representante: TWideStringField;
    cdsImprimiremitido: TWideStringField;
    cdsImprimirmotivo: TWideStringField;
    cdsImprimircli_nome: TWideStringField;
    cdsImprimirforn_nome: TWideStringField;
    cdsImprimirorigem: TWideStringField;
    cdsImprimirresponsavel: TWideStringField;
    edtCodigoRNC: TEdit;
    lbl23: TLabel;
    edtOrdemProd: TEdit;

    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
//    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
//    procedure LimparCampos;
//    procedure BuscarNovoCodigo;
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
    procedure pctAbreRNCChange(Sender: TObject);
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
    procedure btnSairEmailClick(Sender: TObject);
    procedure btnGravarEmailClick(Sender: TObject);
    procedure PrepararEmail();
    procedure PreencherDadosRisco();
    procedure PreencherDadosIndicadores();
    procedure edtCodigoCliChange(Sender: TObject);
    procedure dblClienteCloseUp(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure cdsDocsdoc_descricaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sbAbrirDocClick(Sender: TObject);
    procedure dbgDocCellClick(Column: TColumn);
    procedure sbVisualizarDocClick(Sender: TObject);
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
  FormCadRNCAbre: TFormCadRNCAbre;

implementation

uses frm_Inicial, Funcoes, frm_Laaia, frm_CadPMCFecha,
  frm_dm, frm_CadRiscoVisualizacao, frm_CadRiscoAnaliseRisco,
  frm_ValoresIndicador;

{$R *.dfm}

procedure TFormCadRNCAbre.AtualizarDados;
begin
   with cdsMotivo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 32' +
                    ' ORDER BY valo_com';
      Active:= True;
   end;

   with cdsOrigem do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 33' +
                    ' ORDER BY valo_com';
      Active:= True;
   end;

   with cdsRelacionamento do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 34' +
                    ' ORDER BY valo_com';
      Active:= True;
   end;

   with cdsProcede do begin
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

   with cdsRNC do begin
      Active:= False;
      CommandText:= ' SELECT rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, rnc_motivo,' +
                    ' rnc_processo, rnc_setor, rnc_origem, rnc_cliente, rnc_fornecedor,' +
                    ' rnc_consumidor, rnc_nconformidade, rnc_procede, rnc_responsavel,' +
                    ' rnc_departamento, rnc_relacionamento, rnc_representante,' +
                    ' C.nome_col as Emitido, TC.valo_com as Motivo, rnc_ordemprod' +
                    ' FROM rnc R' +
                    ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_emitido' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = R.rnc_motivo' +
                    ' ORDER BY rnc_identificacao';

      Active:= True;
   end;

   if AllTrim(edtIdentificacao.Text) <> EmptyStr then begin
      cdsRNC.Locate('rnc_identificacao', edtIdentificacao.Text,[])
   end;
end;

procedure TFormCadRNCAbre.AtualizarDadosAcessorios;
begin
   edtIdentificacaoDoc.Text:= edtIdentificacao.Text;

   with cdsDocs do begin
      Active:= False;
      CommandText:= ' SELECT rnc_codigo, doc_codigo, doc_descricao, doc_caminho' +
                    ' FROM rnc_documentos' +
                    ' WHERE rnc_codigo = ' + QuotedStr(cdsRNC.FieldByName('rnc_codigo').AsString) +
                    ' ORDER BY doc_descricao';
      Active:= True;
   end;

   if pctAbreRNC.TabIndex = 1 then begin
      btnAlterar.Enabled := cdsDocs.RecordCount > 0;
      btnExcluir.Enabled := cdsDocs.RecordCount > 0;
   end;
end;

procedure TFormCadRNCAbre.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;
   sbAbrirDoc.Enabled := not Flag;

   if cdsRNC.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadRNCAbre.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 53, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      case pctAbreRNC.TabIndex of
         0: begin
            HabilitarCampos(True, False, Self, 1);
            edtIdentificacao.Enabled:= False;
            TryFocus(dtData);
         end;
         1: begin
            HabilitarCampos(True, False, Self, -1);
            TryFocus(edtDescricaoDoc);
         end;
      end;
      Botoes(False);
   end;
end;

procedure TFormCadRNCAbre.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;

procedure TFormCadRNCAbre.btnExcluirClick(Sender: TObject);
var
   sCodRNC, rIdentRNC: string;
begin
   if (Acesso(cUsuario, 53, 'exclusao') = 1) then begin
      sCodRNC  := cdsRNC.FieldByName('rnc_codigo').AsString;
      rIdentRNC:= cdsRNC.FieldByName('rnc_identificacao').AsString;

      if pctAbreRNC.TabIndex = 0 then begin // Cadastro
         if Application.MessageBox(PChar('Confirma a exclusão do registro ?' + #13 + 'Serão exclídos todos os cadastros de documentos do RNC.'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM rnc_documentos' +
                             ' WHERE rnc_codigo = ' + sCodRNC;
               Execute;

               Active:= False;
               CommandText:= ' DELETE FROM rnc' +
                             ' WHERE rnc_codigo = ' + sCodRNC;
               Execute;
            end;

            Auditoria('RNC', rIdentRNC, 'E', '');
            LimparCampos(Self);
            AtualizarDados();
            AtualizarDadosAcessorios();
            PreencherCampos();
         end;
         Botoes(True);
      end
      else begin // Documentos
         if Application.MessageBox('Confirma a exclusão do documento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM rnc_documentos' +
                             ' WHERE rnc_codigo = ' + sCodRNC +
                             ' AND doc_codigo = ' + cdsDocs.FieldByName('doc_codigo').AsString;
               Execute;
            end;

            Auditoria('RNC - DOCUMENTOS', rIdentRNC, 'E', '');
            AtualizarDadosAcessorios();
            PreencherCampos();
         end;
      end;
   end;
end;

procedure TFormCadRNCAbre.btnGravarClick(Sender: TObject);
var
   sCodigoRNC: string;
begin
   if ValidarDados() then begin
      try
         case pctAbreRNC.TabIndex of
            0: begin
               with cdsGravar do begin
                  sCodigoRNC:= BuscarNovoCodigo('rnc', 'rnc_codigo');

                  Active:= False;
                  if cOperacao = 'I' then begin
                     CommandText:= ' INSERT INTO rnc (' +
                                   ' rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, rnc_motivo,' +
                                   ' rnc_processo, rnc_setor, rnc_origem, rnc_cliente, rnc_fornecedor,' +
                                   ' rnc_consumidor, rnc_nconformidade, rnc_procede, rnc_responsavel,' +
                                   ' rnc_departamento, rnc_relacionamento, rnc_representante, rnc_status, ' +
                                   ' rnc_ordemprod)' +
                                   ' VALUES(' +
                                   sCodigoRNC + ',' +
                                   QuotedStr(edtIdentificacao.Text) + ',' +
                                   ArrumaDataSQL(dtData.Date) + ',' +
                                   IntToStr(dblEmitido.KeyValue) + ',' +
                                   IntToStr(dblMotivo.KeyValue) + ',' +
                                   IntToStr(dblProcesso.KeyValue) + ',' +
                                   QuotedStr(edtSetor.Text) + ',' +
                                   IntToStr(dblOrigem.KeyValue) + ',' +
                                   Nulo(dblCliente.KeyValue, 'I') + ',' +
                                   Nulo(dblFornecedor.KeyValue, 'I') + ',' +
                                   QuotedStr(edtConsumidor.Text) + ',' +
                                   QuotedStr(mmoNaoConformidade.Text) + ',' +
                                   IntToStr(dblProcede.KeyValue) + ',' +
                                   IntToStr(dblResponsavel.KeyValue) + ',' +
                                   QuotedStr(edtDepartamento.Text) + ',' +
                                   IntToStr(dblRelacionamento.KeyValue) + ',' +
                                   QuotedStr(edtRepresentante.Text) + ',' +
                                   '1' + ',' +// Aberto
                                   QuotedStr(edtOrdemProd.Text) +
                                   ')';
                     Execute;

                     GravarHistoricoRNC(sCodigoRNC, 'CADASTRO DO RNC');
                  end
                  else begin
                     CommandText:= ' UPDATE rnc SET' +
                                   ' rnc_identificacao = ' + QuotedStr(edtIdentificacao.Text) + ',' +
                                   ' rnc_data = ' + ArrumaDataSQL(dtData.Date) + ',' +
                                   ' rnc_emitido = ' + IntToStr(dblEmitido.KeyValue) + ',' +
                                   ' rnc_motivo = ' + IntToStr(dblMotivo.KeyValue) + ',' +
                                   ' rnc_processo = ' + IntToStr(dblProcesso.KeyValue) + ',' +
                                   ' rnc_setor = ' + QuotedStr(edtSetor.Text) + ',' +
                                   ' rnc_origem = ' + IntToStr(dblOrigem.KeyValue) + ',' +
                                   ' rnc_cliente = ' + Nulo(dblCliente.KeyValue, 'I') + ',' +
                                   ' rnc_fornecedor = ' + Nulo(dblFornecedor.KeyValue, 'I') + ',' +
                                   ' rnc_consumidor = ' + QuotedStr(edtConsumidor.Text) + ',' +
                                   ' rnc_nconformidade = ' + QuotedStr(mmoNaoConformidade.Text) + ',' +
                                   ' rnc_procede = ' + IntToStr(dblProcede.KeyValue) + ',' +
                                   ' rnc_responsavel = ' + IntToStr(dblResponsavel.KeyValue) + ',' +
                                   ' rnc_departamento = ' + QuotedStr(edtDepartamento.Text) + ',' +
                                   ' rnc_relacionamento = ' + IntToStr(dblRelacionamento.KeyValue) + ',' +
                                   ' rnc_representante = ' + QuotedStr(edtRepresentante.Text) + ',' +
                                   ' rnc_ordemprod = ' + QuotedStr(edtOrdemProd.Text) +
                                   ' WHERE rnc_codigo = ' + cdsRNC.FieldByName('rnc_codigo').Asstring;
                     Execute;
                  end;
               end;

               Auditoria('RNC', edtIdentificacao.Text, cOperacao,'');
               AtualizarDados();
               AtualizarDadosAcessorios();

               HabilitarCampos(False, False, Self, 1, 2);
               Botoes(True);
               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

               if Application.MessageBox('Deseja enviar um e-mail ao responsável avisando do RNC ?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
                  PrepararEmail();
               end;

//               if not (FormLaaia = nil) then begin
//                  FormLaaia.edtPMC.Text:= edtIdentificacao.Text;
//               end;
//
//               if not (FormCadPMCFecha = nil) then begin
//                  FormCadPMCFecha.edtPMCSubs.Text:= edtIdentificacao.Text;
//               end;
//
//               if not (FormCadRiscoVisualizacao = nil) then begin
//                  FormCadRiscoVisualizacao.edtPMC.Text:= edtIdentificacao.Text;
//                  FormCadRiscoVisualizacao.btnDesvincular.Enabled:= True;
//               end;
//
//               if iTela = 2 then begin // Análise de Riscos
//                  if FormCadRiscoVisualizacao.sTipoIntExt = 'INTERNA' then begin
//                     with dm.cdsGravar do begin
//                        Active:= False;
//                        CommandText:= ' UPDATE risco_analiseint SET' +
//                                      ' int_pmc = ' + QuotedStr(edtIdentificacao.Text) +
//                                      ' WHERE int_codigo = ' + IntToStr(FormCadRiscoVisualizacao.iCodigo);
//                        Execute;
//                     end;
//                  end
//                  else begin
//                     with dm.cdsGravar do begin
//                        Active:= False;
//                        CommandText:= ' UPDATE risco_macro SET' +
//                                      ' mac_pmc = ' + QuotedStr(edtIdentificacao.Text) +
//                                      ' WHERE mac_codigo = ' + IntToStr(FormCadRiscoVisualizacao.iCodigo);
//                        Execute;
//                     end;
//                  end;
//
//                  FormAnaliseRisco.AtualizarDados();
//               end;
            end;
            1: begin // Documentos
               with cdsGravar do begin
                  Active:= False;
                  if cOperacao = 'I' then begin
                     CommandText:= ' INSERT INTO rnc_documentos' +
                                   ' (rnc_codigo, doc_codigo, doc_descricao, doc_caminho)' +
                                   ' VALUES (' +
                                   edtCodigoRNC.Text + ',' +
                                   BuscarNovoCodigo('rnc_documentos', 'doc_codigo') + ',' +
                                   QuotedStr(edtDescricaoDoc.Text) + ',' +
                                   QuotedStr(edtCaminhoDoc.Text) +
                                   ')';
                     Execute;
                  end
                  else begin
                     CommandText:= ' UPDATE rnc_documentos SET' +
                                   ' doc_descricao = ' + QuotedStr(edtDescricaoDoc.Text) + ',' +
                                   ' doc_caminho = ' + QuotedStr(edtCaminhoDoc.Text) +
                                   ' WHERE rnc_codigo = ' + edtCodigoRNC.Text +
                                   ' AND doc_codigo = ' + cdsDocs.FieldByName('doc_codigo').AsString;
                     Execute;
                  end;
               end;

               if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
                  sbVisualizarDoc.Enabled:= True;
               end
               else begin
                  sbVisualizarDoc.Enabled:= False;
               end;

               Auditoria('RNC - DOCUMENTOS', edtIdentificacao.Text + '-' + edtDescricaoDoc.Text, cOperacao,'');
               AtualizarDadosAcessorios();

               HabilitarCampos(False, False, Self, 1, 2);
               Botoes(True);
               Application.MessageBox('Documento gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      except
         on E:Exception do begin
            MostrarErro('Erro ao gravar registro. Verifique', E.Message, Self.Name);
         end;
      end;
   end;
end;

procedure TFormCadRNCAbre.btnGravarEmailClick(Sender: TObject);
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

procedure TFormCadRNCAbre.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRNCAbre.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadRNCAbre.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 53, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;

      case pctAbreRNC.TabIndex of
         0: begin // Cadastro
            LimparCampos(Self);
            edtCodigoRNC.Text:= BuscarNovoCodigo('rnc', 'rnc_codigo');
            BuscarNovoCodigoPMC();
            dtData.Date:= Date();
            dblCliente.KeyValue:= 999999;
            dblFornecedor.KeyValue:= 999999;
            HabilitarCampos(True, False, Self, 1, 2);
            TryFocus(edtIdentificacao);
         end;
         1: begin // Documentos
            edtDescricaoDoc.Clear;
            edtCaminhoDoc.Clear;
            HabilitarCampos(True, False, Self, 2);
            TryFocus(edtDescricaoDoc);
         end;
      end;
   end;
end;

procedure TFormCadRNCAbre.btnPrimeiroClick(Sender: TObject);
begin
   cdsRNC.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRNCAbre.btnAnteriorClick(Sender: TObject);
begin
   cdsRNC.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRNCAbre.btnProximoClick(Sender: TObject);
begin
   cdsRNC.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRNCAbre.btnUltimoClick(Sender: TObject);
begin
   cdsRNC.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRNCAbre.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRNCAbre.btnSairEmailClick(Sender: TObject);
begin
   pnlEmail.Visible:= False;
end;

procedure TFormCadRNCAbre.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRNCAbre.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;


procedure TFormCadRNCAbre.ControlarAbas;
begin
   case pctAbreRNC.TabIndex of
      0: begin // Cadastro
         Botoes(True);
         cdsRNC.Filtered:= False;
         AjustaBarraGrid(dbgRegistros);

         if sCodigo <> EmptyStr then begin
            cdsRNC.Locate('rnc_codigo', sCodigo, []);
         end;
      end;
      1: begin // Documentos
         if cdsDocs.Active = True then begin
            Botoes(True);
            if cdsDocs.RecordCount = 0 then begin
               btnAlterar.Enabled := False;
               btnExcluir.Enabled := False;
            end;
         end
         else begin
            btnNovo.Enabled    := False;
            btnAlterar.Enabled := False;
            btnExcluir.Enabled := False;
            btnGravar.Enabled  := False;
            btnCancelar.Enabled:= False;
         end;

         btnImprimir.Enabled:= False;
      end;
      2: begin // Pesquisa
         btnNovo.Enabled    := False;
         btnAlterar.Enabled := False;
         btnExcluir.Enabled := False;
         btnGravar.Enabled  := False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;


         edtValor.Enabled:= True;
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadRNCAbre.dbgDocCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadRNCAbre.dbgRegistrosCellClick(Column: TColumn);
begin
   PreencherCampos();
   sCodigo:= cdsRNC.FieldByName('rnc_codigo').AsString;
   AtualizarDadosAcessorios();
end;

procedure TFormCadRNCAbre.dbgRegistrosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctAbreRNC.TabIndex:= 0;
   sCodigo:= cdsRNC.FieldByName('rnc_codigo').AsString;
   AtualizarDadosAcessorios();
   ControlarAbas;
end;

procedure TFormCadRNCAbre.dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadRNCAbre.dblClienteCloseUp(Sender: TObject);
begin
   try
      if dblCliente.KeyValue <> 999999 then begin
         edtCodigoCli.Text:= dblCliente.KeyValue;
      end
      else begin
         edtCodigoCli.Text:= '';
      end;
   except
   end;
end;

procedure TFormCadRNCAbre.edtCodigoCliChange(Sender: TObject);
begin
   try
      if edtCodigoCli.Text <> EmptyStr then begin
         dblCliente.KeyValue:= StrToInt(edtCodigoCli.Text);
      end
      else begin
         dblCliente.KeyValue:= 999999;
      end;
   except
   end;
end;

procedure TFormCadRNCAbre.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsRNC.Filter:= 'rnc_identificacao LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   cdsRNC.Filtered:= True;
end;

procedure TFormCadRNCAbre.FormShow(Sender: TObject);
begin
   if LiberarClienteForn() = True then begin
      edtCodigoCli.Tag := 30;
      dblCliente.Tag   := 30;
      dblFornecedor.Tag:= 30;
      edtCodigoCli.Enabled := False;
      dblCliente.Enabled   := False;
      dblFornecedor.Enabled:= False;
   end
   else begin
      edtCodigoCli.Tag := 0;
      dblCliente.Tag   := 0;
      dblFornecedor.Tag:= 0;
   end;

   pctAbreRNC.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   if edtCodigoRNC.Text <> EmptyStr then begin
      AtualizarDadosAcessorios();
   end;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   pnlEmail.Visible   := False;

   if iTela = 2 then begin // Análise de Riscos
      btnNovoClick(Self);
      PreencherDadosRisco();
   end;

   if iTela = 3 then begin // Indicadores
      btnNovoClick(Self);
      PreencherDadosIndicadores();
   end;
end;

procedure TFormCadRNCAbre.PreencherDadosIndicadores;
begin
   dblProcesso.KeyValue   := FormValorIndicadores.cdsIndicadores.FieldByName('proc_ind').AsInteger;
   dblOrigem.KeyValue     := 4; // Indicador
   mmoNaoConformidade.Lines.Add('INDICADOR: ' + FormValorIndicadores.dblIndicadores.Text);
   dblMotivo.KeyValue:= -1; // Sem valor padrão
end;

procedure TFormCadRNCAbre.PreencherDadosRisco;
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
      dblMotivo.KeyValue:= 2; // Melhoria
   end
   else begin
      dblMotivo.KeyValue:= 1; // Preventiva
   end;
end;

//procedure TFormCadRNCAbre.LimparCampos;
//begin
//   edtIdentificacao.Clear;
//   dtData.Clear;
//   dblEmitido.KeyValue:= -1;
//   dblMotivo.KeyValue:= -1;
//   dblProcesso.KeyValue:= -1;
//   edtSetor.Clear;
//   dblOrigem.KeyValue:= -1;
//   mmoNaoConformidade.Clear;
//   dblProcesso.KeyValue:= -1;
//   dblProcede.KeyValue:= -1;
//   dblResponsavel.KeyValue:= -1;
//   dblCliente.KeyValue:= -1;
//   dblFornecedor.KeyValue:= -1;
//end;

procedure TFormCadRNCAbre.mmoNaoConformidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadRNCAbre.pctAbreRNCChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadRNCAbre.PreencherCampos;
begin
//   case pctAbreRNC.TabIndex of
//      0: begin
         with cdsRNC do begin
            edtCodigoRNC.Text      := FieldByName('rnc_codigo').AsString;
            edtIdentificacao.Text  := FieldByName('rnc_identificacao').AsString;
            dtData.Date            := FieldByName('rnc_data').AsDateTime;
            edtSetor.Text          := FieldByName('rnc_setor').AsString;
            if FieldByName('rnc_cliente').AsInteger = 999999 then begin
               edtCodigoCli.Text:= '';
            end
            else begin
               edtCodigoCli.Text:= FieldByName('rnc_cliente').AsString;
            end;
            dblCliente.KeyValue    := FieldByName('rnc_cliente').AsInteger;
            dblFornecedor.KeyValue := FieldByName('rnc_fornecedor').AsString;
            edtConsumidor.Text     := FieldByName('rnc_consumidor').AsString;
            mmoNaoConformidade.Text:= FieldByName('rnc_nconformidade').AsString;
            edtDepartamento.Text   := FieldByName('rnc_departamento').AsString;
            edtRepresentante.Text  := FieldByName('rnc_representante').AsString;
            edtOrdemProd.Text      := FieldByName('rnc_ordemprod').AsString;

            if FieldByName('rnc_emitido').AsString <> EmptyStr then begin
               dblEmitido.KeyValue:= FieldByName('rnc_emitido').AsString;
            end;

            if FieldByName('rnc_motivo').AsString <> EmptyStr then begin
               dblMotivo.KeyValue:= FieldByName('rnc_motivo').AsString;
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

            if FieldByName('rnc_relacionamento').AsString <> EmptyStr then begin
               dblRelacionamento.KeyValue:= FieldByName('rnc_relacionamento').AsString;
            end;
         end;
//      end;
//      1: begin
         edtDescricaoDoc.Text:= cdsDocs.FieldByName('doc_descricao').AsString;
         edtCaminhoDoc.Text  := cdsDocs.FieldByName('doc_caminho').AsString;

         if AllTrim(edtCaminhoDoc.Text) <> EmptyStr then begin
            sbVisualizarDoc.Enabled:= True;
         end
         else begin
            sbVisualizarDoc.Enabled:= False;
         end;
//      end;
//   end;
end;

procedure TFormCadRNCAbre.PrepararEmail;
begin
   if VerificarConexaoInternet(True) then begin
      // Verifica se existem as configurações de e-mail cadastradas.
//      if VerificarConfigEmail() then begin
         sTextoEmail:= 'Foi aberto um RNC com as informações abaixo: <br><br>' +
                  '<b>RNC:</b> ' + edtIdentificacao.Text + '<br>' +
                  '<b>Data RNC:</b> ' + dtData.Text + '<br>' +
                  '<b>Registro de Não Conformidade:</b> ' + mmoNaoConformidade.Text +
                  '<br><br>'+
                  'Acesse o sistema Destra Manager para maiores detalhes.';


         if AllTrim(cdsResponsavelcol_email.AsString) = EmptyStr then begin
            if Application.MessageBox(PChar('O colaborador ' + dblResponsavel.Text + ' não tem e-mail cadastrado no Cadastro de Colaboradores.' + #13#10 + 'Deseja cadastrar o e-mail antes de enviar ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
               edtEmail.Enabled:= True;
               AbrePanel(pnlEmail, Self);

               lblNomeCol.Caption:= dblResponsavel.Text;
               TryFocus(edtEmail);
            end;
         end
         else begin
            EnviarEmail(sTextoEmail, 'Novo RNC', cdsResponsavelcol_email.AsString, 'sistema');
         end;
//      end;
   end;
end;

procedure TFormCadRNCAbre.sbAbrirDocClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminhoDoc.Text:= OPD1.FileName;
end;

procedure TFormCadRNCAbre.sbVisualizarDocClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminhoDoc.Text, Self.Name);
end;

procedure TFormCadRNCAbre.BuscarNovoCodigoPMC;
var
   Aux: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT max(rnc_identificacao) as UltCodigo from rnc ' +
                    ' WHERE rnc_identificacao like ' + QuotedStr('RNC%');
      Active:= True;

     if FieldByName('UltCodigo').AsString = EmptyStr then begin
        edtIdentificacao.Text:= 'RNC0001';
     end
     else begin
        try
           Aux:= StrToInt(Copy(FieldByName('UltCodigo').AsString,4,4));
           Aux:= Aux + 1;
           edtIdentificacao.Text:= 'RNC' + StrZero(Aux,4);
        except
           edtIdentificacao.Text:= 'RNC0001';
        end;
     end;

   end;
end;

procedure TFormCadRNCAbre.cbCampoCloseUp(Sender: TObject);
begin
   TryFocus(edtValor);
end;

procedure TFormCadRNCAbre.cdsDocsdoc_descricaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsDocs.FieldByName('doc_descricao').AsString,1,300);
end;

function TFormCadRNCAbre.ValidarDados(): Boolean;
begin
   case pctAbreRNC.TabIndex of
      0: begin
         if cOperacao = 'I' then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) AS Qtd' +
                             ' FROM rnc' +
                             ' WHERE rnc_identificacao = ' + QuotedStr(edtIdentificacao.Text);
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

         if dblMotivo.KeyValue = -1 then begin
            Application.MessageBox('Campo Motivo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblMotivo);
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
      end;
      1: begin
         if AllTrim(edtDescricaoDoc.Text) = EmptyStr then begin
            Application.MessageBox('Campo Descrição do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtDescricaoDoc);
            Result:= False;
            Exit;
         end;

         if AllTrim(edtCaminhoDoc.Text) = EmptyStr then begin
            Application.MessageBox('Campo Caminho do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtCaminhoDoc);
            Result:= False;
            Exit;
         end;
      end;
   end;

   Result:= True;
end;

procedure TFormCadRNCAbre.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'rnc_identificacao';
   end
   else begin
      sCampoOrdem:= 'rnc_data';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, rnc_motivo,' +
                    ' rnc_processo, rnc_setor, rnc_origem, TC1.valo_com as Origem, rnc_cliente, ' +
                    ' CL.cli_nome, rnc_fornecedor, F.forn_nome, rnc_consumidor, rnc_nconformidade, ' +
                    ' rnc_procede, rnc_responsavel, C1.nome_col as Responsavel, ' +
                    ' rnc_departamento, rnc_relacionamento, rnc_representante,' +
                    ' C.nome_col as Emitido, TC.valo_com as Motivo' +
                    ' FROM rnc R' +
                    ' INNER JOIN colaboradores C ON C.codi_col = R.rnc_emitido' +
                    ' INNER JOIN colaboradores C1 ON C1.codi_col = R.rnc_responsavel' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 32 AND TC.codi_com = R.rnc_motivo' +
                    ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 33 AND TC1.codi_com = R.rnc_origem' +
                    ' LEFT JOIN clientes CL on CL.cli_codigo = R.rnc_cliente' +
                    ' LEFT JOIN fornecedores F on F.forn_codigo = R.rnc_fornecedor' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaRNCAbertura.fr3');

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

end.
