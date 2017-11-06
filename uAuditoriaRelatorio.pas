unit uAuditoriaRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  FMTBcd, DBClient, Provider, SqlExpr, rxToolEdit, frxClass, frxDBSet,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, JvgPage;

type
  TFormRelatorioAuditoria = class(TForm)
    pnl1: TPanel;
    pctAuditoriaRel: TJvgPageControl;
    tsCadastro: TTabSheet;
    tsAcoes: TTabSheet;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl11: TLabel;
    lbl5: TLabel;
    edtNorma: TEdit;
    edtAuditores: TEdit;
    mmoEscopo: TMemo;
    mmoResumo: TMemo;
    dtChave: TDateEdit;
    edtDataAuditoria: TEdit;
    btnPesqProg: TBitBtn;
    dblRepresentante: TDBLookupComboBox;
    dspAuditoria: TDataSetProvider;
    cdsAuditoria: TClientDataSet;
    dsAuditoria: TDataSource;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    dsAux: TDataSource;
    dspEvidencias: TDataSetProvider;
    cdsEvidencias: TClientDataSet;
    cdsEvidenciasDescTipo: TStringField;
    cdsEvidenciasDescEvidencias: TStringField;
    dsEvidencias: TDataSource;
    dspImpressao: TDataSetProvider;
    cdsImpressao: TClientDataSet;
    cdsImpressaoNomeProcesso: TStringField;
    cdsImpressaoNomeRepresentante: TStringField;
    dsImpressao: TDataSource;
    frxDBEmpresa1: TfrxDBDataset;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    CdsEmpresabair_emp1: TWideStringField;
    CdsEmpresacepe_emp1: TWideStringField;
    CdsEmpresacida_emp1: TWideStringField;
    CdsEmpresacnpj_emp1: TWideStringField;
    CdsEmpresaende_emp1: TWideStringField;
    CdsEmpresaesta_emp1: TWideStringField;
    CdsEmpresafax_emp1: TWideStringField;
    CdsEmpresafone_emp1: TWideStringField;
    CdsEmpresaiest_emp1: TWideStringField;
    CdsEmpresaimun_emp1: TWideStringField;
    CdsEmpresamail_emp1: TWideStringField;
    CdsEmpresanome_emp1: TWideStringField;
    CdsEmpresapais_emp1: TWideStringField;
    CdsEmpresasite_emp1: TWideStringField;
    dsEmpresa: TDataSource;
    dspRequisitos: TDataSetProvider;
    cdsRequisitos: TClientDataSet;
    dsRequisitos: TDataSource;
    frxDBRequisitos: TfrxDBDataset;
    frxDBAudInterna1: TfrxDBDataset;
    zqryRequisitos: TZQuery;
    zqryEmpresa: TZQuery;
    zqryEvidencias: TZQuery;
    zqryAux: TZQuery;
    zqryAuditoria: TZQuery;
    zqryImpressao: TZQuery;
    lbl8: TLabel;
    lbl1: TLabel;
    dbgItemProcesso: TDBGrid;
    dblProcessos: TDBLookupComboBox;
    lbl9: TLabel;
    cbRequisitos: TComboBox;
    mmoConstatacoes: TMemo;
    rgParecer: TRadioGroup;
    zqryRepresentante: TZQuery;
    dspRepresentante: TDataSetProvider;
    cdsRepresentante: TClientDataSet;
    dsRepresentante: TDataSource;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    lbl10: TLabel;
    dtPrograma: TDateEdit;
    zqryRequisito: TZQuery;
    dspRequisito: TDataSetProvider;
    cdsRequisito: TClientDataSet;
    cdsRequisitodata_aud: TDateTimeField;
    cdsRequisitoproc_aud: TLargeintField;
    cdsRequisitor41_aud: TSmallintField;
    cdsRequisitor422_aud: TSmallintField;
    cdsRequisitor423_aud: TSmallintField;
    cdsRequisitor424_aud: TSmallintField;
    cdsRequisitor51_aud: TSmallintField;
    cdsRequisitor52_aud: TSmallintField;
    cdsRequisitor53_aud: TSmallintField;
    cdsRequisitor541_aud: TSmallintField;
    cdsRequisitor542_aud: TSmallintField;
    cdsRequisitor551_aud: TSmallintField;
    cdsRequisitor552_aud: TSmallintField;
    cdsRequisitor553_aud: TSmallintField;
    cdsRequisitor56_aud: TSmallintField;
    cdsRequisitor61_aud: TSmallintField;
    cdsRequisitor621_aud: TSmallintField;
    cdsRequisitor622_aud: TSmallintField;
    cdsRequisitor63_aud: TSmallintField;
    cdsRequisitor64_aud: TSmallintField;
    cdsRequisitor71_aud: TSmallintField;
    cdsRequisitor721_aud: TSmallintField;
    cdsRequisitor722_aud: TSmallintField;
    cdsRequisitor723_aud: TSmallintField;
    cdsRequisitor73_aud: TSmallintField;
    cdsRequisitor74_aud: TSmallintField;
    cdsRequisitor751_aud: TSmallintField;
    cdsRequisitor752_aud: TSmallintField;
    cdsRequisitor753_aud: TSmallintField;
    cdsRequisitor754_aud: TSmallintField;
    cdsRequisitor755_aud: TSmallintField;
    cdsRequisitor76_aud: TSmallintField;
    cdsRequisitor821_aud: TSmallintField;
    cdsRequisitor822_aud: TSmallintField;
    cdsRequisitor823_aud: TSmallintField;
    cdsRequisitor824_aud: TSmallintField;
    cdsRequisitor83_aud: TSmallintField;
    cdsRequisitor84_aud: TSmallintField;
    cdsRequisitor851_aud: TSmallintField;
    cdsRequisitor852_aud: TSmallintField;
    cdsRequisitor853_aud: TSmallintField;
    dsRequisito: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    dsGravar: TDataSource;
    frxReport1: TfrxReport;
    cdsEvidenciasdtpr_aud: TDateTimeField;
    cdsEvidenciasproc_ite: TIntegerField;
    cdsEvidenciasrequ_ite: TWideStringField;
    cdsEvidenciascont_ite: TWideMemoField;
    cdsEvidenciastipo_ite: TIntegerField;
    cdsImpressaodtpr_aud: TDateTimeField;
    cdsImpressaoaudi_aud: TWideStringField;
    cdsImpressaoadtd_aud: TWideStringField;
    cdsImpressaodata_aud: TWideStringField;
    cdsImpressaohora_aud: TWideStringField;
    cdsImpressaoesco_aud: TWideMemoField;
    cdsImpressaoresu_aud: TWideMemoField;
    cdsImpressaonorm_aud: TWideStringField;
    cdsImpressaorepr_aud: TLargeintField;
    cdsImpressaoproc_ite: TIntegerField;
    cdsImpressaorequ_ite: TWideStringField;
    cdsImpressaocont_ite: TWideMemoField;
    cdsImpressaotipo_ite: TIntegerField;
    cdsRepresentantecodi_col: TLargeintField;
    cdsRepresentantenome_col: TWideStringField;
    cdsEmpresalogo_emp: TWideStringField;
    cdsImpressaoTipoItem: TStringField;
    cdsEvidenciasite_codigo: TIntegerField;
    cdsRequisitosreq_codigo: TWideMemoField;
    cdsRequisitosnaoconforme: TLargeintField;
    cdsRequisitosconforme: TWideMemoField;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    procedure cdsImpressaoCalcFields(DataSet: TDataSet);
    procedure cdsEvidenciasCalcFields(DataSet: TDataSet);
    procedure dblProcessosCloseUp(Sender: TObject);
    procedure mmoEscopoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnPesqProgClick(Sender: TObject);
    procedure dtChaveExit(Sender: TObject);
    procedure AtualizaDados;
    procedure LimparCampos;
    procedure Botoes(Flag: Boolean);
    function BuscaDescReq(NumReq: string): string;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure ControlarAbas();
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure pctAuditoriaRelChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AtualizarEvidencias();
    procedure AtualizarRequisitos();
    procedure dbgItemProcessoCellClick(Column: TColumn);
    procedure PreencherCampos();
    function ValidarCampos(): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoProcesso: string;
    cOperação: string;
  end;

var
  FormRelatorioAuditoria: TFormRelatorioAuditoria;

implementation

uses Funcoes, frm_pesqPrgAudit, frm_Inicial;

{$R *.dfm}

procedure TFormRelatorioAuditoria.AtualizaDados;
begin
   with cdsAuditoria do begin
      Active:= False;
//      CommandText:= ' SELECT A.*, R.esco_aud, R.audi_aud, R.adtd_aud, R.hora_aud, R.dtpr_aud ' +
//                    ' FROM auditoria_interna A' +
//                    ' INNER JOIN auditoria_interna_rel R ON R.dtpr_aud = A.data_aud' +
//                    ' WHERE A.data_aud = ' + ArrumaDataSQL(dtChave.Date);
      CommandText:= ' SELECT *' +
                    ' FROM auditoria_interna' +
                    ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date);
      Active:= True;

      if cdsAuditoria.RecordCount = 0 then begin
         PreencheAuditoria(dtChave.Date);

         Active:= False;
//         CommandText:= ' SELECT A.*, R.esco_aud, R.audi_aud, R.adtd_aud, R.hora_aud, R.dtpr_aud ' +
//                    ' FROM auditoria_interna A' +
//                    ' INNER JOIN auditoria_interna_rel R ON R.dtpr_aud = A.data_aud' +
//                    ' WHERE A.data_aud = ' + ArrumaDataSQL(dtChave.Date);
         CommandText:= ' SELECT *' +
                       ' FROM auditoria_interna' +
                       ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date);
         Active:= True;
      end;
   end;
   
   with cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT *' +
                    ' FROM auditoria_interna_rel' +
                    ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
      Active:= True;
   end;

   edtDataAuditoria.Text    := cdsAux.FieldByName('data_aud').AsString;
   edtNorma.Text            := cdsAux.FieldByName('norm_aud').AsString;
   edtAuditores.Text        := cdsAux.FieldByName('audi_aud').AsString;
   mmoEscopo.Text           := cdsAux.FieldByName('esco_aud').AsString;
   mmoResumo.Text           := cdsAux.FieldByName('resu_aud').AsString;
   dblRepresentante.KeyValue:= cdsAux.FieldByName('repr_aud').AsInteger;

   // Limpa os dados da grid de evidências
   cdsEvidencias.Active:= False;
   dblProcessos.KeyValue:= -1;

   Botoes(True);

   dblProcessos.Enabled:= True;
//   edtAuditados.Text   := cdsAux.FieldByName('adtd_aud').AsString;
//   edtHoraPrevista.Text:= cdsAux.FieldByName('hora_aud').AsString;
//   edtDataPrevista.Text:= cdsAux.FieldByName('data_aud').AsString;
end;

procedure TFormRelatorioAuditoria.AtualizarEvidencias;
begin
   if not ((dblProcessos.KeyValue = Null) or (dblProcessos.KeyValue = -1)) then begin
      with cdsEvidencias do begin
         Active:= False;
         CommandText:= ' SELECT * FROM Auditoria_Interna_Rel_Itens' +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtPrograma.Date) +
                       ' AND proc_ite = ' + IntToStr(dblProcessos.KeyValue);
         Active:= True;
      end;
   end;
end;

procedure TFormRelatorioAuditoria.AtualizarRequisitos;
begin
   with cdsRequisito do begin
      Active:= False;
      CommandText:= ' SELECT data_aud, proc_aud, r41_aud, r422_aud, r423_aud, r424_aud, ' +
                    ' r51_aud, r52_aud, r53_aud, r541_aud, r542_aud, r551_aud, r552_aud, ' +
                    ' r553_aud, r56_aud, r61_aud, r621_aud, r622_aud, r63_aud, r64_aud, ' +
                    ' r71_aud, r721_aud, r722_aud, r723_aud, r73_aud, r74_aud, r751_aud, ' +
                    ' r752_aud, r753_aud, r754_aud, r755_aud, r76_aud, r821_aud, r822_aud, ' +
                    ' r823_aud, r824_aud, r83_aud, r84_aud, r851_aud, r852_aud, r853_aud ' +
                    ' FROM auditoria_interna' +
                    ' WHERE proc_aud = ' + QuotedStr(AllTrim(dblProcessos.KeyValue)) +
                    ' AND data_aud = ' + ArrumaDataSQL(dtPrograma.Date);
      Active:= True;

      if cdsRequisito.FieldByName('r41_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.1   - REQUISITOS GERAIS');
      end;
      if cdsRequisito.FieldByName('r422_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.2.2 - Manual da Qualidade');
      end;
      if cdsRequisito.FieldByName('r423_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.2.3 - Controle de Documentos');
      end;
      if cdsRequisito.FieldByName('r424_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.2.4 - Controle de Registros');
      end;
      if cdsRequisito.FieldByName('r51_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.1   - Comprometimento da Direção');
      end;
      if cdsRequisito.FieldByName('r52_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.2   - Foco no Cliente');
      end;
      if cdsRequisito.FieldByName('r53_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.3   - Política da Qualidade');
      end;
      if cdsRequisito.FieldByName('r541_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.4.1 - Objetivos da Qualidade');
      end;
      if cdsRequisito.FieldByName('r542_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.4.2 - Planejamento do Sistema de Gestão da Qualidade');
      end;
      if cdsRequisito.FieldByName('r551_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.5.1 - Responsabilidade e Autoridade');
      end;
      if cdsRequisito.FieldByName('r552_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.5.2 - Representante da Direção');
      end;
      if cdsRequisito.FieldByName('r553_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.5.3 - Comunicação Interna');
      end;
      if cdsRequisito.FieldByName('r56_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.6   - Análise Crítica pela Direção');
      end;
      if cdsRequisito.FieldByName('r61_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.1   - Provisão de Recursos');
      end;
      if cdsRequisito.FieldByName('r621_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.2.1 - Recursos Humanos - Generalidades ');
      end;
      if cdsRequisito.FieldByName('r622_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.2.2 - Competência, Conscientização e Treinamento');
      end;
      if cdsRequisito.FieldByName('r63_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.3   - Infra-Estrutura');
      end;
      if cdsRequisito.FieldByName('r64_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.4   - Ambiente de Trabalho');
      end;
      if cdsRequisito.FieldByName('r71_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1   - Planejamento da Realização do Produto');
      end;
      if cdsRequisito.FieldByName('r721_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.2.1 - Determinação dos Requisitos relac. ao Produto');
      end;
      if cdsRequisito.FieldByName('r722_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.2.2 - Análise Crítica dos Requisitos relac. ao Produto');
      end;
      if cdsRequisito.FieldByName('r723_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.2.3 - Comunicação com o Cliente');
      end;
      if cdsRequisito.FieldByName('r73_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.3   - Projeto e Desenvolvimento');
      end;
      if cdsRequisito.FieldByName('r74_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.4   - Aquisição');
      end;
      if cdsRequisito.FieldByName('r751_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.5.1 - Controle de Produção e Fornecimento de Serviço');
      end;
      if cdsRequisito.FieldByName('r752_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.5.2 - Validação dos Processos de Prod. e Forn. Serv.');
      end;
      if cdsRequisito.FieldByName('r753_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.5.3 - Identificação e Rastreabilidade');
      end;
      if cdsRequisito.FieldByName('r754_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.5.4 - Propriedade do Cliente');
      end;
      if cdsRequisito.FieldByName('r755_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.5.5 - Preservação do Produto');
      end;
      if cdsRequisito.FieldByName('r76_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.6   - Controle de Dispositivos de Medição e Monitoração');
      end;
      if cdsRequisito.FieldByName('r821_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.1 - Satisfação dos Clientes');
      end;
      if cdsRequisito.FieldByName('r822_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.2 - Auditoria Interna');
      end;
      if cdsRequisito.FieldByName('r823_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.3 - Medição e Monitoramento de Processos');
      end;
      if cdsRequisito.FieldByName('r824_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.4 - Medição e Monitoramento de Produto');
      end;
      if cdsRequisito.FieldByName('r83_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.3   - Controle de produto não-conforme');
      end;
      if cdsRequisito.FieldByName('r84_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.4   - Análise de Dados');
      end;
      if cdsRequisito.FieldByName('r851_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.1 - Melhoria Contínua');
      end;
      if cdsRequisito.FieldByName('r852_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.2 - Ação Corretiva');
      end;
      if cdsRequisito.FieldByName('r853_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.3 - Ação Preventiva');
      end;

   end;
end;

procedure TFormRelatorioAuditoria.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnExcluir.Enabled := Flag;
   btnImprimir.Enabled:= Flag;
end;

procedure TFormRelatorioAuditoria.btnPesqProgClick(Sender: TObject);
begin
   FormPesqPrgAudit:= TFormPesqPrgAudit.Create(nil);
   FormPesqPrgAudit.codForm:= 2;
   FormPesqPrgAudit.ShowModal;
   FormPesqPrgAudit.Release;
end;

procedure TFormRelatorioAuditoria.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

function TFormRelatorioAuditoria.BuscaDescReq(NumReq: string): string;
var
   sRetorno: string;
begin
   if NumReq = '4.1' then begin
      sRetorno:= '4.1 - REQUISITOS GERAIS';
   end;
   if NumReq = '4.2.2' then begin
      sRetorno:= '4.2.2 - Manual da Qualidade';
   end;
   if NumReq = '4.2.3' then begin
      sRetorno:= '4.2.3 - Controle de Documentos';
   end;
   if NumReq = '4.2.4' then begin
      sRetorno:= '4.2.4 - Controle de Registros';
   end;
   if NumReq = '5.1' then begin
      sRetorno:= '5.1 - Comprometimento da Direção';
   end;
   if NumReq = '5.2' then begin
      sRetorno:= '5.2 - Foco no Cliente';
   end;
   if NumReq = '5.3' then begin
      sRetorno:= '5.3 - Política da Qualidade';
   end;
   if NumReq = '5.4.1' then begin
      sRetorno:= '5.4.1 - Objetivos da Qualidade';
   end;
   if NumReq = '5.4.2' then begin
      sRetorno:= '5.4.2 - Planejamento do Sistema de Gestão da Qualidade';
   end;
   if NumReq = '5.5.1' then begin
      sRetorno:= '5.5.1 - Responsabilidade e Autoridade';
   end;
   if NumReq = '5.5.2' then begin
      sRetorno:= '5.5.2 - Representante da Direção';
   end;
   if NumReq = '5.5.3' then begin
      sRetorno:= '5.5.3 - Comunicação Interna';
   end;
   if NumReq = '5.6' then begin
      sRetorno:= '5.6 - Análise Crítica pela Direção';
   end;
   if NumReq = '6.1' then begin
      sRetorno:= '6.1 - Provisão de Recursos';
   end;
   if NumReq = '6.2.1' then begin
      sRetorno:= '6.2.1 - Recursos Humanos - Generalidades ';
   end;
   if NumReq = '6.2.2' then begin
      sRetorno:= '6.2.2 - Competência, Conscientização e Treinamento';
   end;
   if NumReq = '6.3' then begin
      sRetorno:= '6.3 - Infra-Estrutura';
   end;
   if NumReq = '6.4' then begin
      sRetorno:= '6.4 - Ambiente de Trabalho';
   end;
   if NumReq = '7.1' then begin
      sRetorno:= '7.1 - Planejamento da Realização do Produto';
   end;
   if NumReq = '7.2.1' then begin
      sRetorno:= '7.2.1 - Determinação dos Requisitos relac. ao Produto';
   end;
   if NumReq = '7.2.2' then begin
      sRetorno:= '7.2.2 - Análise Crítica dos Requisitos relac. ao Produto';
   end;
   if NumReq = '7.2.3' then begin
      sRetorno:= '7.2.3 - Comunicação com o Cliente';
   end;
   if NumReq = '7.3' then begin
      sRetorno:= '7.3 - Projeto e Desenvolvimento';
   end;
   if NumReq = '7.4' then begin
      sRetorno:= '7.4 - Aquisição';
   end;
   if NumReq = '7.5.1' then begin
      sRetorno:= '7.5.1 - Controle de Produção e Fornecimento de Serviço';
   end;
   if NumReq = '7.5.2' then begin
      sRetorno:= '7.5.2 - Validação dos Processos de Prod. e Forn. Serv.';
   end;
   if NumReq = '7.5.3' then begin
      sRetorno:= '7.5.3 - Identificação e Rastreabilidade';
   end;
   if NumReq = '7.5.4' then begin
      sRetorno:= '7.5.4 - Propriedade do Cliente';
   end;
   if NumReq = '7.5.5' then begin
      sRetorno:= '7.5.5 - Preservação do Produto';
   end;
   if NumReq = '7.6' then begin
      sRetorno:= '7.6 - Controle de Dispositivos de Medição e Monitoração';
   end;
   if NumReq = '8.2.1' then begin
      sRetorno:= '8.2.1 - Satisfação dos Clientes';
   end;
   if NumReq = '8.2.2' then begin
      sRetorno:= '8.2.2 - Auditoria Interna';
   end;
   if NumReq = '8.2.3' then begin
      sRetorno:= '8.2.3 - Medição e Monitoramento de Processos';
   end;
   if NumReq = '8.2.4' then begin
      sRetorno:= '8.2.4 - Medição e Monitoramento de Produto';
   end;
   if NumReq = '8.3' then begin
      sRetorno:= '8.3 - Controle de produto não-conforme';
   end;
   if NumReq = '8.4' then begin
      sRetorno:= '8.4 - Análise de Dados';
   end;
   if NumReq = '8.5.1' then begin
      sRetorno:= '8.5.1 - Melhoria Contínua';
   end;
   if NumReq = '8.5.2' then begin
      sRetorno:= '8.5.2 - Ação Corretiva';
   end;
   if NumReq = '8.5.3' then begin
      sRetorno:= '8.5.3 - Ação Preventiva';
   end;

   Result:= sRetorno;
end;

procedure TFormRelatorioAuditoria.btnAlterarClick(Sender: TObject);
begin
   cOperação:= 'A';
   Botoes(False);
   HabilitarCampos(True, False);
end;

procedure TFormRelatorioAuditoria.btnCancelarClick(Sender: TObject);
begin
   if pctAuditoriaRel.TabIndex = 0 then begin
   //   LimparCampos();
      btnPesqProg.SetFocus;
      Botoes(True);
      HabilitarCampos(False, False);
   end
   else begin
      HabilitarCampos(False, False);
      LimparCampos();
      Botoes(True);
   end;
end;

procedure TFormRelatorioAuditoria.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      with cdsAux do begin
         Active:= False;
         CommandText:= ' DELETE FROM Auditoria_Interna_Rel_Itens' +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' AND proc_ite = ' + IntToStr(dblProcessos.KeyValue) +
                       ' AND requ_ite = ' + QuotedStr(cdsEvidenciasrequ_ite.AsString);
         Execute;
      end;

      AtualizarEvidencias();
   end;
end;

procedure TFormRelatorioAuditoria.btnGravarClick(Sender: TObject);
begin
   if pctAuditoriaRel.TabIndex = 0 then begin
      try
         with cdsAuditoria do begin
            Active:= False;
            // Somente atualiza, pois o registro foi gravado no programa de auditoria
            CommandText:= ' UPDATE auditoria_interna_rel' +
                          ' SET ' +
                          ' data_aud = ' + QuotedStr(edtDataAuditoria.Text) + ',' +
                          ' norm_aud = ' + QuotedStr(edtNorma.Text) + ',' +
                          ' audi_aud = ' + QuotedStr(edtAuditores.Text) + ',' +
                          ' esco_aud = ' + QuotedStr(mmoEscopo.Text) + ',' +
                          ' resu_aud = ' + QuotedStr(mmoResumo.Text) + ',' +
                          ' repr_aud = ' + IntToStr(dblRepresentante.KeyValue) +
                          ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;

         HabilitarCampos(False, False);
         Botoes(True);

         Application.MessageBox('Relatório gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end
   else begin
      if ValidarCampos() then begin
         try
            with cdsGravar do begin
               Active:= False;
               if cOperação = 'I' then begin
                  CommandText:= ' INSERT INTO auditoria_interna_rel_itens ' +
                                ' (ite_codigo, dtpr_aud, proc_ite, requ_ite, cont_ite, tipo_ite) ' +
                                ' VALUES (' +
                                BuscarNovoCodigo('auditoria_interna_rel_itens', 'ite_codigo') + ',' +
                                ArrumaDataSQL(dtPrograma.Date) + ',' +
                                IntToStr(dblProcessos.KeyValue) + ',' +
                                QuotedStr(Alltrim(Copy(cbRequisitos.Text,1,5))) + ',' +
                                QuotedStr(AllTrim(mmoConstatacoes.Text)) + ',' +
                                IntToStr(rgParecer.ItemIndex) +
                                ')';
               end
               else begin
                  CommandText:= ' UPDATE auditoria_interna_rel_itens SET' +
                                ' requ_ite = ' + QuotedStr(Alltrim(Copy(cbRequisitos.Text,1,5))) + ',' +
                                ' cont_ite = ' + QuotedStr(AllTrim(mmoConstatacoes.Text)) + ',' +
                                ' tipo_ite = ' + IntToStr(rgParecer.ItemIndex) +
                                ' WHERE ite_codigo = ' + cdsEvidenciasite_codigo.AsString;
               end;
               Execute;
            end;

            AtualizarEvidencias();
            HabilitarCampos(False, False);
            LimparCampos();
            Botoes(True);
            Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
            end;
         end;
      end;
   end;
end;

procedure TFormRelatorioAuditoria.btnImprimirClick(Sender: TObject);
begin
   if dtChave.Text = '  /  /    ' then begin
      Application.MessageBox('Selecione um programa de auditoria para imprimir', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(btnPesqProg);
   end
   else begin
      with cdsImpressao do begin
         Active:= False;
         CommandText:= ' SELECT R.dtpr_aud, R.audi_aud, R.adtd_aud, R.data_aud, ' +
                       ' R.hora_aud, R.esco_aud, R.resu_aud, R.norm_aud, R.repr_aud,' +
                       ' I.proc_ite, I.requ_ite, I.cont_ite, I.tipo_ite' +
                       ' FROM auditoria_interna_rel R' +
                       ' LEFT JOIN auditoria_interna_rel_itens I ON I.dtpr_aud = R.dtpr_aud' +
                       ' WHERE R.dtpr_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' ORDER BY I.requ_ite, tipo_ite';
         Active:= True;
      end;

      with cdsEmpresa do begin
         Active:= False;
         Active:= True;
      end;

      with cdsRequisitos do begin
         Active:= False;
         CommandText:= ' SELECT Q.req_codigo || ' + QuotedStr(' - ') + ' || Q.req_descricao as req_codigo, ' +
                       ' COUNT(tipo_ite) as NaoConforme,' +
                       ' CASE WHEN Count(tipo_ite) = 0 THEN ' + QuotedStr('SIM') +
                       '      ELSE ' + QuotedStr('NÃO') +
                       ' END as Conforme ' +
                       ' FROM requisitos Q' +
                       ' LEFT JOIN auditoria_interna_rel_itens R ' +
                       '    ON Q.req_codigo = SUBSTR(R.requ_ite,1,3) ' +
                       '    AND R.tipo_ite = 1 AND R.dtpr_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' GROUP BY Q.req_codigo' +
                       ' ORDER BY Q.req_codigo';
         Active:= True;
      end;

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AuditoriaInterna.fr3');
         ShowReport;
      end;
   end;
end;

procedure TFormRelatorioAuditoria.btnNovoClick(Sender: TObject);
begin
   if (dblProcessos.KeyValue = -1) or (dblProcessos.KeyValue = Null) then begin
      Application.MessageBox('Selecione um processo !', 'Aviso', MB_OK + MB_ICONWARNING);
      dblProcessos.DropDown;
      Exit;
   end;

   cOperação:= 'I';
   LimparCampos();
   HabilitarCampos(True, True);
   dblProcessosCloseUp(Self);
   TryFocus(cbRequisitos);

   Botoes(False);
end;

procedure TFormRelatorioAuditoria.cdsEvidenciasCalcFields(DataSet: TDataSet);
begin
   case cdsEvidenciastipo_ite.AsInteger of
      0: cdsEvidenciasDescTipo.AsString:= 'CONFORMIDADE';
      1: cdsEvidenciasDescTipo.AsString:= 'NÃO CONFORMIDADE';
      2: cdsEvidenciasDescTipo.AsString:= 'OBSERVAÇÃO';
      3: cdsEvidenciasDescTipo.AsString:= 'OPORTUNIDADE DE MELHORIA';
   end;

   cdsEvidenciasDescEvidencias.AsString:= Copy(cdsEvidenciascont_ite.AsString,1,100);
end;

procedure TFormRelatorioAuditoria.cdsImpressaoCalcFields(DataSet: TDataSet);
begin
   case cdsImpressao.FieldByName('tipo_ite').AsInteger of
      0: cdsImpressao.FieldByName('TipoItem').AsString:= 'Conformidades';
      1: cdsImpressao.FieldByName('TipoItem').AsString:= 'Não Conformidades';
      2: cdsImpressao.FieldByName('TipoItem').AsString:= 'Observações';
      3: cdsImpressao.FieldByName('TipoItem').AsString:= 'Oportunidades de Melhoria';
   end;

//   with cdsAux do begin
//      Active:= False;
//      CommandText:= ' SELECT nome_pro FROM Processos' +
//                    ' WHERE codi_pro = ' + cdsImpressaoproc_ite.AsString;
//      Active:= True;
//
//      cdsImpressaoNomeProcesso.AsString:= FieldByName('nome_pro').AsString;
//   end;

//   with cdsAux do begin
//      Active:= False;
//      CommandText:= ' SELECT nome_col FROM Colaboradores' +
//                    ' WHERE codi_col = ' + cdsImpressaorepr_aud.AsString;
//      Active:= True;
//
//      cdsImpressaoNomeRepresentante.AsString:= FieldByName('nome_col').AsString;
//   end;
end;

procedure TFormRelatorioAuditoria.ControlarAbas;
begin
   if pctAuditoriaRel.TabIndex = 0 then begin  // Dados Gerais
      Botoes(True);
      btnNovo.Visible:= False;
//      PreencherCampos();
//      AtualizarDadosAcessorios();

//      btnImprimir.Enabled:= False;
   end
   else begin // Registro de Evidências
      if dtChave.Text = '  /  /    ' then begin
         Application.MessageBox('Selecione um programa de auditoria para lançar as evidências', 'Aviso', MB_OK + MB_ICONWARNING);
         pctAuditoriaRel.TabIndex:= 0;
         TryFocus(btnPesqProg);
      end;

      btnNovo.Visible:= True;
      dtPrograma.Date:= dtChave.Date;
      HabilitarCampos(False, False);
      Botoes(True);

      AtualizarEvidencias();
   end;
end;

procedure TFormRelatorioAuditoria.dbgItemProcessoCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormRelatorioAuditoria.dblProcessosCloseUp(Sender: TObject);
begin
      if dblProcessos.KeyValue <= 0 then begin

   end
   else begin
      if AllTrim(dtPrograma.Text) <> EmptyStr then begin
         AtualizarRequisitos();
         AtualizarEvidencias();
      end;
   end;
end;

procedure TFormRelatorioAuditoria.dtChaveExit(Sender: TObject);
begin
   with cdsAuditoria do begin
      Active:= False;
      CommandText:= ' SELECT * FROM auditoria_interna_rel' +
                    ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
      Active:= True;
   end;

   edtDataAuditoria.Text:= cdsAuditoria.FieldByName('data_aud').AsString;
   edtNorma.Text        := cdsAuditoria.FieldByName('norm_aud').AsString;
   edtAuditores.Text    := cdsAuditoria.FieldByName('audi_aud').AsString;
   mmoEscopo.Text       := cdsAuditoria.FieldByName('esco_aud').AsString;
   mmoResumo.Text       := cdsAuditoria.FieldByName('resu_aud').AsString;

   dblProcessos.Enabled:= True;
end;

procedure TFormRelatorioAuditoria.FormShow(Sender: TObject);
begin
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsRepresentante do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' ORDER BY nome_col';

      Active:= True;
   end;

   pctAuditoriaRel.TabIndex:= 0;

   Botoes(True);
   HabilitarCampos(False, False);
   ControlarAbas();
   dblProcessos.Enabled:= False;
   btnAlterar.Enabled:= False;
   btnExcluir.Enabled:= False;
end;

procedure TFormRelatorioAuditoria.HabilitarCampos(Flag, Codigo: Boolean);
begin
   case pctAuditoriaRel.TabIndex of
      0: begin
         edtDataAuditoria.Enabled:= Flag;
         edtNorma.Enabled        := Flag;
         edtAuditores.Enabled    := Flag;
         dblRepresentante.Enabled:= Flag;
         mmoEscopo.Enabled       := Flag;
         mmoResumo.Enabled       := Flag;

         pctAuditoriaRel.Pages[1].TabVisible:= not Flag;
      end;
      1: begin
         dblProcessos.Enabled   := True;
         cbRequisitos.Enabled   := Codigo;
         mmoConstatacoes.Enabled:= Flag;
         rgParecer.Enabled      := Flag;
      end;
   end;
end;

procedure TFormRelatorioAuditoria.LimparCampos;
begin
   if pctAuditoriaRel.TabIndex = 0 then begin
      dtChave.Clear;
      edtNorma.Clear;
      edtAuditores.Clear;
      edtDataAuditoria.Clear;
      mmoEscopo.Clear;
      mmoResumo.Clear;
   end
   else begin
      cbRequisitos.ItemIndex:= -1;
      cbRequisitos.Clear;
      mmoConstatacoes.Clear;
      rgParecer.ItemIndex   := -1;
   end;
end;

procedure TFormRelatorioAuditoria.mmoEscopoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormRelatorioAuditoria.pctAuditoriaRelChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormRelatorioAuditoria.PreencherCampos;
begin
   cbRequisitos.Text   := BuscaDescReq(cdsEvidenciasrequ_ite.AsString);
   mmoConstatacoes.Text:= cdsEvidencias.FieldByName('cont_ite').AsString;
   rgParecer.ItemIndex := cdsEvidencias.FieldByName('tipo_ite').AsInteger;
end;

function TFormRelatorioAuditoria.ValidarCampos: Boolean;
begin
   if pctAuditoriaRel.TabIndex = 1 then begin // Evidências
      if cbRequisitos.Text = EmptyStr then begin
         Application.MessageBox('O campo Requisito é obrigatório !','Aviso',MB_OK+MB_ICONWARNING);
         Result:= False;
         TryFocus(cbRequisitos);
         Exit;
      end;

      if mmoConstatacoes.Text = EmptyStr then begin
         Application.MessageBox('O campo Constatações e Evidências é obrigatório !','Aviso',MB_OK+MB_ICONWARNING);
         Result:= False;
         TryFocus(mmoConstatacoes);
         Exit;
      end;

      if rgParecer.ItemIndex < 0 then begin
         Application.MessageBox('O campo Parecer é obrigatório !','Aviso',MB_OK+MB_ICONWARNING);
         Result:= False;
         TryFocus(rgParecer);
         Exit;
      end;
   end;
end;

end.
