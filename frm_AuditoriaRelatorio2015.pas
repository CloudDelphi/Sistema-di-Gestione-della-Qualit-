unit frm_AuditoriaRelatorio2015;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  FMTBcd, DBClient, Provider, SqlExpr, rxToolEdit, frxClass, frxDBSet,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls, JvgPage;

type
  TFormRelatorioAuditoria2015 = class(TForm)
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
  FormRelatorioAuditoria2015: TFormRelatorioAuditoria2015;

implementation

uses Funcoes, frm_pesqPrgAudit, frm_Inicial, frm_pesqPrgAudit2015;

{$R *.dfm}

procedure TFormRelatorioAuditoria2015.AtualizaDados;
begin
   with cdsAuditoria do begin
      Active:= False;
      CommandText:= ' SELECT *' +
                    ' FROM auditoria_interna2015' +
                    ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date);
      Active:= True;

      if cdsAuditoria.RecordCount = 0 then begin
         PreencheAuditoria(dtChave.Date);

         Active:= False;
         CommandText:= ' SELECT *' +
                       ' FROM auditoria_interna2015' +
                       ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date);
         Active:= True;
      end;
   end;
   
   with cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT *' +
                    ' FROM auditoria_interna_rel2015' +
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
end;

procedure TFormRelatorioAuditoria2015.AtualizarEvidencias;
begin
   if not ((dblProcessos.KeyValue = Null) or (dblProcessos.KeyValue = -1)) then begin
      with cdsEvidencias do begin
         Active:= False;
         CommandText:= ' SELECT * FROM Auditoria_Interna_Rel_Itens2015' +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtPrograma.Date) +
                       ' AND proc_ite = ' + IntToStr(dblProcessos.KeyValue);
         Active:= True;
      end;
   end;
end;

procedure TFormRelatorioAuditoria2015.AtualizarRequisitos;
begin
   with cdsRequisito do begin
      Active:= False;
      CommandText:= ' SELECT aud_codigo, data_aud, proc_aud, r02_aud, r03_aud, r411_aud, r42_aud,' +
                    ' r43_aud, r441_aud, r442_aud, r511_aud, r512_aud, r521_aud, r522_aud,' +
                    ' r53_aud, r61_aud, r62_aud, r63_aud, r711_aud, r712_aud, r713_aud,' +
                    ' r714_aud, r7151_aud, r7152_aud, r716_aud, r72_aud, r73_aud, r74_aud,' +
                    ' r75_aud, r81_aud, r821_aud, r822_aud, r823_aud, r824_aud, r83_aud,' +
                    ' r84_aud, r851_aud, r852_aud, r853_aud, r854_aud, r855_aud, r856_aud,' +
                    ' r86_aud, r87_aud, r91_aud, r912_aud, r913_aud, r92_aud, r93_aud,' +
                    ' r101_aud, r102_aud, r103_aud' +
                    ' FROM auditoria_interna2015' +
                    ' WHERE proc_aud = ' + QuotedStr(AllTrim(dblProcessos.KeyValue)) +
                    ' AND data_aud = ' + ArrumaDataSQL(dtPrograma.Date);
      Active:= True;

      if cdsRequisito.FieldByName('r02_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('0.2    - Principios de Gestão');
      end;
      if cdsRequisito.FieldByName('r03_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('0.3    - Abordagem de Processos');
      end;
      if cdsRequisito.FieldByName('r411_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.1.1  - Organização e seu contexto');
      end;
      if cdsRequisito.FieldByName('r42_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.2    - Necessidades e expectativas das partes interessadas');
      end;
      if cdsRequisito.FieldByName('r43_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.3    - Determinação de escopo');
      end;
      if cdsRequisito.FieldByName('r441_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.4.1  - Processos do SGQ');
      end;
      if cdsRequisito.FieldByName('r442_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('4.4.2  - Extensão do SGQ');
      end;
      if cdsRequisito.FieldByName('r511_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.1.1  - Liderança e comprometimento');
      end;
      if cdsRequisito.FieldByName('r512_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.1.2  - Foco nos clientes');
      end;
      if cdsRequisito.FieldByName('r521_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.2.1  - Desenvolvimento da política da qualidade');
      end;
      if cdsRequisito.FieldByName('r522_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.2.2  - Comunicação da política da qualidade');
      end;
      if cdsRequisito.FieldByName('r53_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('5.3    - Papéis, responsabilidades e autoridades');
      end;
      if cdsRequisito.FieldByName('r61_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.1    - Abordagem de riscos e oportunidades');
      end;
      if cdsRequisito.FieldByName('r62_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.2    - Objetivos da qualidade e planejamento');
      end;
      if cdsRequisito.FieldByName('r63_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('6.3    - Planejamento de mudanças');
      end;
      if cdsRequisito.FieldByName('r711_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.1  - Apoio - Recursos');
      end;
      if cdsRequisito.FieldByName('r712_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.2  - Apoio - Pessoas');
      end;
      if cdsRequisito.FieldByName('r713_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.3  - Apoio - Infraestrutura');
      end;
      if cdsRequisito.FieldByName('r714_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.4  - Apoio - Ambiente para operações de processos');
      end;
      if cdsRequisito.FieldByName('r7151_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.5.1 - Recursos de monitoramento e medição');
      end;
      if cdsRequisito.FieldByName('r7152_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.5.2 - Rastreabilidade de medição');
      end;
      if cdsRequisito.FieldByName('r716_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.1.6  - Conhecimento organizacional');
      end;
      if cdsRequisito.FieldByName('r72_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.2    - Competência');
      end;
      if cdsRequisito.FieldByName('r73_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.3    - Conscientização');
      end;
      if cdsRequisito.FieldByName('r74_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.4    - Comunicação');
      end;
      if cdsRequisito.FieldByName('r75_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('7.5    - Informação documentada');
      end;
      if cdsRequisito.FieldByName('r81_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.1    - Planejamento e controle operacionais');
      end;
      if cdsRequisito.FieldByName('r821_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.1  - Requisitos de produtos e serviços - Comunicação');
      end;
      if cdsRequisito.FieldByName('r822_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.2  - Determinalção de requisitos de produtos e serviços');
      end;
      if cdsRequisito.FieldByName('r823_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.3  - Análise crítica requisitos de produtos e serviços');
      end;
      if cdsRequisito.FieldByName('r824_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.2.4  - Mudanças nos requisitos de produtos e serviços');
      end;
      if cdsRequisito.FieldByName('r83_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.3    - Projeto e desenvolvimento');
      end;
      if cdsRequisito.FieldByName('r84_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.4    - Controle de provedores externos');
      end;
      if cdsRequisito.FieldByName('r851_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.1  - Controle produção e provisão de serviços');
      end;
      if cdsRequisito.FieldByName('r852_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.2  - Identificação e rastreabilidade');
      end;
      if cdsRequisito.FieldByName('r853_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.3  - Propriedade cliente ou provedores externos');
      end;
      if cdsRequisito.FieldByName('r854_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.4  - Preservação');
      end;
      if cdsRequisito.FieldByName('r855_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.5  - Atividades pós-entrega');
      end;
      if cdsRequisito.FieldByName('r856_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.5.6  - Controle de mudanças');
      end;
      if cdsRequisito.FieldByName('r86_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.6    - Liberação de produtos e serviços');
      end;
      if cdsRequisito.FieldByName('r87_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('8.7    - Controle de saídas não conformes');
      end;
      if cdsRequisito.FieldByName('r91_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('9.1    - Monitoramento medição, análise e avaliação');
      end;
      if cdsRequisito.FieldByName('r912_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('9.1.2  - Satisfação do cliente');
      end;
      if cdsRequisito.FieldByName('r913_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('9.1.3  - Análise e avaliação');
      end;
      if cdsRequisito.FieldByName('r92_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('9.2    - Auditoria Interna');
      end;
      if cdsRequisito.FieldByName('r93_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('9.3    - Análise crítica da direção');
      end;
      if cdsRequisito.FieldByName('r101_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('10.1   - Melhorias');
      end;
      if cdsRequisito.FieldByName('r102_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('10.2   - Não Conformidade e ação corretiva');
      end;
      if cdsRequisito.FieldByName('r103_aud').AsInteger = 1 then begin
         cbRequisitos.Items.Add('10.3   - Melhoria contínua');
      end;
   end;
end;

procedure TFormRelatorioAuditoria2015.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnExcluir.Enabled := Flag;
   btnImprimir.Enabled:= Flag;
end;

procedure TFormRelatorioAuditoria2015.btnPesqProgClick(Sender: TObject);
begin
   FormPesqPrgAudit2015:= TFormPesqPrgAudit2015.Create(nil);
   FormPesqPrgAudit2015.codForm:= 2;
   FormPesqPrgAudit2015.ShowModal;
   FormPesqPrgAudit2015.Release;
end;

procedure TFormRelatorioAuditoria2015.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

function TFormRelatorioAuditoria2015.BuscaDescReq(NumReq: string): string;
var
   sRetorno: string;
begin
   if NumReq = '0.2' then begin
      sRetorno:= '0.2    - Principios de Gestão';
   end;
   if NumReq = '0.3' then begin
      sRetorno:= '0.3    - Abordagem de Processos';
   end;
   if NumReq = '4.1.1' then begin
      sRetorno:= '4.1.1  - Organização e seu contexto';
   end;
   if NumReq = '4.2' then begin
      sRetorno:= '4.2    - Necessidades e expectativas das partes interessadas';
   end;
   if NumReq = '4.3' then begin
      sRetorno:= '4.3    - Determinação de escopo';
   end;
   if NumReq = '4.4.1' then begin
      sRetorno:= '4.4.1  - Processos do SGQ';
   end;
   if NumReq = '4.4.2' then begin
      sRetorno:= '4.4.2  - Extensão do SGQ';
   end;
   if NumReq = '5.1.1' then begin
      sRetorno:= '5.1.1  - Liderança e comprometimento';
   end;
   if NumReq = '5.1.2' then begin
      sRetorno:= '5.1.2  - Foco nos clientes';
   end;
   if NumReq = '5.2.1' then begin
      sRetorno:= '5.2.1  - Desenvolvimento da política da qualidade';
   end;
   if NumReq = '5.2.2' then begin
      sRetorno:= '5.2.2  - Comunicação da política da qualidade';
   end;
   if NumReq = '5.3' then begin
      sRetorno:= '5.3    - Papéis, responsabilidades e autoridades';
   end;
   if NumReq = '6.1' then begin
      sRetorno:= '6.1    - Abordagem de riscos e oportunidades';
   end;
   if NumReq = '6.2' then begin
      sRetorno:= '6.2    - Objetivos da qualidade e planejamento';
   end;
   if NumReq = '6.3' then begin
      sRetorno:= '6.3    - Planejamento de mudanças';
   end;
   if NumReq = '7.1.1' then begin
      sRetorno:= '7.1.1  - Apoio - Recursos';
   end;
   if NumReq = '7.1.2' then begin
      sRetorno:= '7.1.2  - Apoio - Pessoas';
   end;
   if NumReq = '7.1.3' then begin
      sRetorno:= '7.1.3  - Apoio - Infraestrutura';
   end;
   if NumReq = '7.1.4' then begin
      sRetorno:= '7.1.4  - Apoio - Ambiente para operações de processos';
   end;
   if NumReq = '7.1.5.1' then begin
      sRetorno:= '7.1.5.1 - Recursos de monitoramento e medição';
   end;
   if NumReq = '7.1.5.2' then begin
      sRetorno:= '7.1.5.2 - Rastreabilidade de medição';
   end;
   if NumReq = '7.1.6' then begin
      sRetorno:= '7.1.6  - Conhecimento organizacional';
   end;
   if NumReq = '7.2' then begin
      sRetorno:= '7.2    - Competência';
   end;
   if NumReq = '7.3' then begin
      sRetorno:= '7.3    - Conscientização';
   end;
   if NumReq = '7.4' then begin
      sRetorno:= '7.4    - Comunicação';
   end;
   if NumReq = '7.5' then begin
      sRetorno:= '7.5    - Informação documentada';
   end;
   if NumReq = '8.1' then begin
      sRetorno:= '8.1    - Planejamento e controle operacionais';
   end;
   if NumReq = '8.2.1' then begin
      sRetorno:= '8.2.1  - Requisitos de produtos e serviços - Comunicação';
   end;
   if NumReq = '8.2.2' then begin
      sRetorno:= '8.2.2  - Determinalção de requisitos de produtos e serviços';
   end;
   if NumReq = '8.2.3' then begin
      sRetorno:= '8.2.3  - Análise crítica requisitos de produtos e serviços';
   end;
   if NumReq = '8.2.4' then begin
      sRetorno:= '8.2.4  - Mudanças nos requisitos de produtos e serviços';
   end;
   if NumReq = '8.3' then begin
      sRetorno:= '8.3    - Projeto e desenvolvimento';
   end;
   if NumReq = '8.4' then begin
      sRetorno:= '8.4    - Controle de provedores externos';
   end;
   if NumReq = '8.5.1' then begin
      sRetorno:= '8.5.1  - Controle produção e provisão de serviços';
   end;
   if NumReq = '8.5.2' then begin
      sRetorno:= '8.5.2  - Identificação e rastreabilidade';
   end;
   if NumReq = '8.5.3' then begin
      sRetorno:= '8.5.3  - Propriedade cliente ou provedores externos';
   end;
   if NumReq = '8.5.4' then begin
      sRetorno:= '8.5.4  - Preservação';
   end;
   if NumReq = '8.5.5' then begin
      sRetorno:= '8.5.5  - Atividades pós-entrega';
   end;
   if NumReq = '8.5.6' then begin
      sRetorno:= '8.5.6  - Controle de mudanças';
   end;
   if NumReq = '8.6' then begin
      sRetorno:= '8.6    - Liberação de produtos e serviços';
   end;
   if NumReq = '8.7' then begin
      sRetorno:= '8.7    - Controle de saídas não conformes';
   end;
   if NumReq = '9.1' then begin
      sRetorno:= '9.1    - Monitoramento medição, análise e avaliação';
   end;
   if NumReq = '9.1.2' then begin
      sRetorno:= '9.1.2  - Satisfação do cliente';
   end;
   if NumReq = '9.1.3' then begin
      sRetorno:= '9.1.3  - Análise e avaliação';
   end;
   if NumReq = '9.2' then begin
      sRetorno:= '9.2    - Auditoria Interna';
   end;
   if NumReq = '9.3' then begin
      sRetorno:= '9.3    - Análise crítica da direção';
   end;
   if NumReq = '10.1' then begin
      sRetorno:= '10.1   - Melhorias';
   end;
   if NumReq = '10.2' then begin
      sRetorno:= '10.2   - Não Conformidade e ação corretiva';
   end;
   if NumReq = '10.3' then begin
      sRetorno:= '10.3   - Melhoria contínua';
   end;

   Result:= sRetorno;
end;

procedure TFormRelatorioAuditoria2015.btnAlterarClick(Sender: TObject);
begin
   cOperação:= 'A';
   Botoes(False);
   HabilitarCampos(True, False);
end;

procedure TFormRelatorioAuditoria2015.btnCancelarClick(Sender: TObject);
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

procedure TFormRelatorioAuditoria2015.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      with cdsAux do begin
         Active:= False;
         CommandText:= ' DELETE FROM Auditoria_Interna_Rel_Itens2015' +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' AND proc_ite = ' + IntToStr(dblProcessos.KeyValue) +
                       ' AND requ_ite = ' + QuotedStr(cdsEvidenciasrequ_ite.AsString);
         Execute;
      end;

      AtualizarEvidencias();
   end;
end;

procedure TFormRelatorioAuditoria2015.btnGravarClick(Sender: TObject);
begin
   if pctAuditoriaRel.TabIndex = 0 then begin
      try
         with cdsAuditoria do begin
            Active:= False;
            // Somente atualiza, pois o registro foi gravado no programa de auditoria
            CommandText:= ' UPDATE auditoria_interna_rel2015' +
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
                  CommandText:= ' INSERT INTO auditoria_interna_rel_itens2015 ' +
                                ' (ite_codigo, dtpr_aud, proc_ite, requ_ite, cont_ite, tipo_ite) ' +
                                ' VALUES (' +
                                BuscarNovoCodigo('auditoria_interna_rel_itens2015', 'ite_codigo') + ',' +
                                ArrumaDataSQL(dtPrograma.Date) + ',' +
                                IntToStr(dblProcessos.KeyValue) + ',' +
                                QuotedStr(Alltrim(Copy(cbRequisitos.Text,1,7))) + ',' +
                                QuotedStr(AllTrim(mmoConstatacoes.Text)) + ',' +
                                IntToStr(rgParecer.ItemIndex) +
                                ')';
               end
               else begin
                  CommandText:= ' UPDATE auditoria_interna_rel_itens2015 SET' +
                                ' requ_ite = ' + QuotedStr(Alltrim(Copy(cbRequisitos.Text,1,7))) + ',' +
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

procedure TFormRelatorioAuditoria2015.btnImprimirClick(Sender: TObject);
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
                       ' FROM auditoria_interna_rel2015 R' +
                       ' LEFT JOIN auditoria_interna_rel_itens2015 I ON I.dtpr_aud = R.dtpr_aud' +
                       ' WHERE R.dtpr_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' ORDER BY I.proc_ite, tipo_ite';
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
                       ' FROM requisitos2015 Q' +
                       ' LEFT JOIN auditoria_interna_rel_itens2015 R ' +
                       '    ON Q.req_codigo = SUBSTR(R.requ_ite,1,7) ' +
                       '    AND R.tipo_ite = 1 AND R.dtpr_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' GROUP BY Q.req_codigo' +
                       ' ORDER BY Q.req_codigo';
         Active:= True;
      end;

      Imprimir('rel_AuditoriaInterna', frxReport1, 'V');
   end;
end;

procedure TFormRelatorioAuditoria2015.btnNovoClick(Sender: TObject);
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

procedure TFormRelatorioAuditoria2015.cdsEvidenciasCalcFields(DataSet: TDataSet);
begin
   case cdsEvidenciastipo_ite.AsInteger of
      0: cdsEvidenciasDescTipo.AsString:= 'CONFORMIDADE';
      1: cdsEvidenciasDescTipo.AsString:= 'NÃO CONFORMIDADE';
      2: cdsEvidenciasDescTipo.AsString:= 'OBSERVAÇÃO';
      3: cdsEvidenciasDescTipo.AsString:= 'OPORTUNIDADE DE MELHORIA';
   end;

   cdsEvidenciasDescEvidencias.AsString:= Copy(cdsEvidenciascont_ite.AsString,1,100);
end;

procedure TFormRelatorioAuditoria2015.cdsImpressaoCalcFields(DataSet: TDataSet);
begin
   case cdsImpressao.FieldByName('tipo_ite').AsInteger of
      0: cdsImpressao.FieldByName('TipoItem').AsString:= 'Conformidades';
      1: cdsImpressao.FieldByName('TipoItem').AsString:= 'Não Conformidades';
      2: cdsImpressao.FieldByName('TipoItem').AsString:= 'Observações';
      3: cdsImpressao.FieldByName('TipoItem').AsString:= 'Oportunidades de Melhoria';
   end;
end;

procedure TFormRelatorioAuditoria2015.ControlarAbas;
begin
   if pctAuditoriaRel.TabIndex = 0 then begin  // Dados Gerais
      Botoes(True);
      btnNovo.Visible:= False;
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

procedure TFormRelatorioAuditoria2015.dbgItemProcessoCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormRelatorioAuditoria2015.dblProcessosCloseUp(Sender: TObject);
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

procedure TFormRelatorioAuditoria2015.dtChaveExit(Sender: TObject);
begin
   with cdsAuditoria do begin
      Active:= False;
      CommandText:= ' SELECT * FROM auditoria_interna_rel2015' +
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

procedure TFormRelatorioAuditoria2015.FormShow(Sender: TObject);
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

procedure TFormRelatorioAuditoria2015.HabilitarCampos(Flag, Codigo: Boolean);
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

procedure TFormRelatorioAuditoria2015.LimparCampos;
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

procedure TFormRelatorioAuditoria2015.mmoEscopoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormRelatorioAuditoria2015.pctAuditoriaRelChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormRelatorioAuditoria2015.PreencherCampos;
begin
   cbRequisitos.Text   := BuscaDescReq(cdsEvidenciasrequ_ite.AsString);
   mmoConstatacoes.Text:= cdsEvidencias.FieldByName('cont_ite').AsString;
   rgParecer.ItemIndex := cdsEvidencias.FieldByName('tipo_ite').AsInteger;
end;

function TFormRelatorioAuditoria2015.ValidarCampos: Boolean;
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
