unit frm_CadIndicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadIndicadores = class(TForm)
    pctIndicadores: TJvgPageControl;
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
    zqryIndicadores: TZQuery;
    dspIndicadores: TDataSetProvider;
    cdsIndicadores: TClientDataSet;
    dsIndicadores: TDataSource;
    frxReport1: TfrxReport;
    frxDBIndicadores: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl6: TLabel;
    dblProcesso: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl1: TLabel;
    edtDescricao: TEdit;
    cdsPeriodo: TClientDataSet;
    dsPeriodo: TDataSource;
    dspPeriodo: TDataSetProvider;
    zqryPeriodo: TZQuery;
    cdsPeriodocodi_com: TLargeintField;
    cdsPeriodovalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    lblPeriodo: TLabel;
    dblPeriodo: TDBLookupComboBox;
    zqryMeta: TZQuery;
    dspMeta: TDataSetProvider;
    cdsMeta: TClientDataSet;
    dsMeta: TDataSource;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    edtMeta: TCurrencyEdit;
    lbl11: TLabel;
    dblMeta: TDBLookupComboBox;
    lbl2: TLabel;
    lbl7: TLabel;
    edtCodigo: TEdit;
    cdsImprimircodi_ind: TLargeintField;
    cdsImprimirdesc_ind: TWideStringField;
    cdsImprimirmeta_ind: TFloatField;
    cdsImprimirproc_ind: TLargeintField;
    cdsImprimirperi_ind: TLargeintField;
    cdsImprimirDescPeriodo: TStringField;
    cdsImprimirDescTipoMeta: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    edtObjetivo: TEdit;
    Label3: TLabel;
    edtUnidade: TEdit;
    edtCaminho: TEdit;
    lbl4: TLabel;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    mmoMetodologia: TMemo;
    cdsImprimirind_unidade: TWideStringField;
    cdsImprimirind_objetivo: TWideStringField;
    cdsImprimirind_caminho_base: TMemoField;
    cdsImprimirind_metodologia: TMemoField;
    opd1: TOpenDialog;
    lbl3: TLabel;
    dblResponsavel: TDBLookupComboBox;
    zqryResp: TZQuery;
    dspResp: TDataSetProvider;
    cdsResp: TClientDataSet;
    dsResp: TDataSource;
    cdsRespcodi_fun: TLargeintField;
    cdsRespdesc_fun: TWideStringField;
    cdsImprimirtipo_ind: TIntegerField;
    dblCEA: TDBLookupComboBox;
    lblCEA: TLabel;
    zqryCEA: TZQuery;
    dspCEA: TDataSetProvider;
    cdsCEA: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsCEA: TDataSource;
    tsMetas: TTabSheet;
    lbl5: TLabel;
    dblTipoMeta: TDBLookupComboBox;
    lbl8: TLabel;
    edtValorMeta: TCurrencyEdit;
    lbl12: TLabel;
    edtUnidadeMeta: TEdit;
    dbgMetas: TDBGrid;
    lbl13: TLabel;
    lbl14: TLabel;
    spnAno: TRxSpinEdit;
    lbl15: TLabel;
    edtCodMeta: TEdit;
    edtDescMeta: TEdit;
    lbl16: TLabel;
    zqryMetas: TZQuery;
    dspMetas: TDataSetProvider;
    cdsMetas: TClientDataSet;
    cdsMetasmet_codigo: TIntegerField;
    IntegerField2: TIntegerField;
    WideStringField1: TWideStringField;
    IntegerField3: TIntegerField;
    FloatField1: TFloatField;
    WideStringField2: TWideStringField;
    dsMetas: TDataSource;
    cdsMetacodi_com: TLargeintField;
    cdsMetavalo_com: TWideStringField;
    cdsMetasano: TStringField;
    cdsMetasmes: TStringField;
    cdsMetasDescTipoMeta: TStringField;
    cbbPeriodo: TComboBox;
    pnlImpMetas: TPanel;
    pnl5: TPanel;
    btnSairImpMetas: TBitBtn;
    btnVideoMetas: TBitBtn;
    btnVideoImp: TBitBtn;
    pnl6: TPanel;
    rgOrdemMetas: TRadioGroup;
    frxDBMetas: TfrxDBDataset;
    zqryImpMetas: TZQuery;
    dspImpMetas: TDataSetProvider;
    cdsImpMetas: TClientDataSet;
    cdsImpMetasmet_codigo: TIntegerField;
    cdsImpMetasmet_codindicador: TIntegerField;
    cdsImpMetasmet_anomes: TWideStringField;
    cdsImpMetasmet_tipo: TIntegerField;
    cdsImpMetasmet_valor: TFloatField;
    cdsImpMetasmet_unidade: TWideStringField;
    cdsImpMetasDescIndicador: TStringField;
    cdsImpMetasMesAno: TStringField;
    rgPeriodo: TRadioGroup;
    cdsImprimirnome_pro: TWideStringField;
    cdsImprimirmeta_atual: TWideMemoField;
    cdsImprimirmes_atual: TWideStringField;
    cdsImprimirtipo_atual: TWideStringField;
    cdsImprimirMesAno: TStringField;
    btnPDCA: TBitBtn;
    lbl17: TLabel;
    edtPDCA: TEdit;
    sbVincularPDCA: TSpeedButton;
    sbDesvincularPDCA: TSpeedButton;
    lbl18: TLabel;
    dblStatus: TDBLookupComboBox;
    zqryStatus: TZQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    cds1: TLargeintField;
    cds2: TWideStringField;
    dsStatus: TDataSource;
    lbl19: TLabel;
    dblMonitoramento: TDBLookupComboBox;
    zqryMonitoramento: TZQuery;
    dspMonitoramento: TDataSetProvider;
    cdsMonitoramento: TClientDataSet;
    cds4: TLargeintField;
    cds5: TWideStringField;
    dsMonitoramento: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure AtualizarDadosAcessorios;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
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
    procedure pctIndicadoresChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoMetodologiaExit(Sender: TObject);
    procedure mmoMetodologiaKeyPress(Sender: TObject; var Key: Char);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure cbCampoCloseUp(Sender: TObject);
    procedure cdsMetasCalcFields(DataSet: TDataSet);
    procedure btnSairImpMetasClick(Sender: TObject);
    procedure GravarMesesMeta(AnoMesAtual: string);
    procedure btnVideoMetasClick(Sender: TObject);
    procedure btnVideoImpClick(Sender: TObject);
    procedure cdsImpMetasCalcFields(DataSet: TDataSet);
    procedure cdsImprimirCalcFields(DataSet: TDataSet);
    procedure btnPDCAClick(Sender: TObject);
    procedure sbVincularPDCAClick(Sender: TObject);
    procedure sbDesvincularPDCAClick(Sender: TObject);
    procedure AtualizarValores;

  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadIndicadores: TFormCadIndicadores;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_PDCA, frm_PesqPDCA;

{$R *.dfm}

procedure TFormCadIndicadores.AtualizarDados;
begin
   with cdsMonitoramento do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 20' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsPeriodo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 18' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsMeta do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 17' +
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

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsResp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsIndicadores do begin
      Active:= False;
      CommandText:= ' SELECT codi_ind, desc_ind, meta_ind, proc_ind, tipo_ind, peri_ind, ind_unidade, ind_objetivo,' +
                    ' ind_caminho_base, ind_metodologia, ind_responsavel, ind_cea, ind_pdca, P.nome_pro, ind_status,' +
                    ' ind_monitoramento, TC.valo_com as DescPeriodo' +
                    ' FROM indicadores I' +
                    ' INNER JOIN processos P ON P.codi_pro = I.proc_ind' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 18 AND TC.codi_com = peri_ind' +
                    ' ORDER BY desc_ind';
      Active:= True;
   end;

   with cdsStatus do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 15' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   if AllTrim(edtDescricao.Text) <> EmptyStr then begin
      cdsIndicadores.Locate('desc_ind', edtDescricao.Text,[])
   end;
end;

procedure TFormCadIndicadores.AtualizarDadosAcessorios;
begin
   edtCodMeta.Text := edtCodigo.Text;
   edtDescMeta.Text:= edtDescricao.Text;

   with cdsMetas do begin
      Active:= False;
      CommandText:= ' SELECT met_codigo, met_codindicador, met_anomes, met_tipo, met_valor,  met_unidade' +
                    ' FROM indicadores_metas' +
                    ' WHERE met_codindicador = ' + edtCodMeta.Text +
                    ' ORDER BY met_anomes DESC';
      Active:= True;
   end;

   if pctIndicadores.TabIndex = 1 then begin// Metas
      if cdsMetas.RecordCount <= 0 then begin
         btnAlterar.Enabled:= False;
         btnExcluir.Enabled:= False;
      end
      else begin
         btnAlterar.Enabled:= True;
         btnExcluir.Enabled:= True;
      end;
   end;
end;

procedure TFormCadIndicadores.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;
   btnPDCA.Enabled    := Flag;

   if cdsIndicadores.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadIndicadores.btnSairImpMetasClick(Sender: TObject);
begin
   pnlImpMetas.Visible:= False;
end;

procedure TFormCadIndicadores.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 13, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 2);
      Botoes(False);
      sbVisualizar.Enabled:= False;
      sbVincularPDCA.Enabled   := edtPDCA.Text = EmptyStr;
      sbDesvincularPDCA.Enabled:= not (edtPDCA.Text = EmptyStr);
      case pctIndicadores.TabIndex of
         0: begin
            TryFocus(edtDescricao);
         end;
         1: begin
            TryFocus(edtValorMeta);
         end;
      end;
   end;
end;

procedure TFormCadIndicadores.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 2);
   sbVincularPDCA.Enabled   := False;
   sbDesvincularPDCA.Enabled:= False;
end;

procedure TFormCadIndicadores.btnExcluirClick(Sender: TObject);
var
   sCodInd: string;
   sNomeInd: string;
   sCodMeta: string;
begin
   if (Acesso(cUsuario, 13, 'exclusao') = 1) then begin
      if Application.MessageBox(PChar('Confirma a exclusão do registro ?' + #13 +
         'Os valores lançados no indicador serão excluídos permanentemente.'), 'Aviso', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         case pctIndicadores.TabIndex of
            0: begin
               sCodInd := cdsIndicadores.FieldByName('codi_ind').AsString;
               sNomeInd:= cdsIndicadores.FieldByName('desc_ind').AsString;

               // Exclui as metas do Indicador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM indicadores_metas' +
                                ' WHERE met_codindicador = ' + sCodInd;
                  Execute;
               end;

               // Exclui os lançamentos do Indicador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM valor_indicador' +
                                ' WHERE codi_ind = ' + sCodInd;
                  Execute;
               end;

               // Exclui o Indicador
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM indicadores' +
                                ' WHERE codi_ind = ' + sCodInd;
                  Execute;
               end;

               Auditoria('CADASTRO DE INDICADORES', sNomeInd, 'E', '');
               LimparCampos(Self);
               AtualizarDados();
               PreencherCampos();
            end;
            1: begin
               sCodMeta := cdsMetasmet_codigo.AsString;
               sNomeInd:= cdsIndicadores.FieldByName('desc_ind').AsString;

               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM indicadores_metas' +
                                ' WHERE met_codigo = ' + sCodMeta;
                  Execute;
               end;

               Auditoria('CADASTRO DE INDICADORES - METAS', sNomeInd, 'E', '');
               AtualizarDadosAcessorios();
               LimparCampos(Self);
               PreencherCampos();
            end;
         end;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadIndicadores.GravarMesesMeta(AnoMesAtual: string);
var
   sMesAnterior: string;
   rValorMeta  : Real;
   sTipoMeta   : string;
   sUnidade    : string;
begin
   // Busca o último mês gravado
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT met_anomes, met_valor, met_tipo, met_unidade' +
                    ' FROM indicadores_metas ' +
                    ' WHERE met_codindicador = ' + QuotedStr(edtCodMeta.Text) +
                    ' ORDER BY met_anomes desc LIMIT 1';
      Active:= True;

      sMesAnterior:= FieldByName('met_anomes').AsString;
      rValorMeta  := FieldByName('met_valor').AsFloat;
      sTipoMeta   := FieldByName('met_tipo').AsString;
      sUnidade    := FieldByName('met_unidade').AsString;
   end;

   if sMesAnterior = '' then begin
      sMesAnterior:= AnoMesAtual;
   end
   else begin
      sMesAnterior:= SomarAnoMes(sMesAnterior, 1);
   end;

   while sMesAnterior < AnoMesAtual do begin
      BuscarNovoCodigo();
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO indicadores_metas ' +
                       ' (met_codigo, met_codindicador, met_anomes, met_tipo, ' +
                       ' met_valor, met_unidade)' +
                       ' VALUES(' +
                       sNovoCodigo + ',' +
                       QuotedStr(edtCodMeta.Text) + ',' +
                       QuotedStr(sMesAnterior) + ',' +
                       sTipoMeta + ',' +
                       VirgulaParaPonto(rValorMeta,2) + ',' +
                       QuotedStr(sUnidade) +
                       ')';
         Execute;
      end;

      sMesAnterior:= SomarAnoMes(sMesAnterior, 1);
   end;
end;

procedure TFormCadIndicadores.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      if pctIndicadores.TabIndex = 0 then begin // Cadastro
         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  CommandText:= ' INSERT INTO indicadores ' +
                                ' (codi_ind, desc_ind, meta_ind, proc_ind, tipo_ind, peri_ind, ' +
                                ' ind_unidade, ind_objetivo, ind_caminho_base, ind_metodologia, ' +
                                ' ind_responsavel, ind_cea, ind_pdca, ind_status, ind_monitoramento)' +
                                ' VALUES(' +
                                sNovoCodigo + ',' +
                                QuotedStr(edtDescricao.Text) + ',' +
                                VirgulaParaPonto(edtMeta.Value,2) + ',' +
                                IntToStr(dblProcesso.KeyValue) + ',' +
                                QuotedStr(dblMeta.KeyValue) + ',' +
                                IntToStr(dblPeriodo.KeyValue) + ',' +
                                QuotedStr(edtUnidade.Text) + ',' +
                                QuotedStr(edtObjetivo.Text) + ',' +
                                QuotedStr(edtCaminho.Text) + ',' +
                                QuotedStr(mmoMetodologia.Text) + ',' +
                                IntToStr(dblResponsavel.KeyValue) + ',' +
                                IntToStr(dblCEA.KeyValue) + ',' +
                                QuotedStr(edtPDCA.Text) + ',' +
                                IntToStr(dblStatus.KeyValue) + ',' +
                                IntToStr(dblMonitoramento.KeyValue) +
                                ')';
                  Execute;
               end
               else begin
                  CommandText:= ' UPDATE indicadores SET ' +
                                ' desc_ind = ' + QuotedStr(edtDescricao.Text) + ',' +
                                ' meta_ind = ' + VirgulaParaPonto(edtMeta.Value,2) + ',' +
                                ' proc_ind = ' + IntToStr(dblProcesso.KeyValue) + ',' +
                                ' tipo_ind = ' + QuotedStr(dblMeta.KeyValue) + ',' +
                                ' peri_ind = ' + IntToStr(dblPeriodo.KeyValue) + ',' +
                                ' ind_unidade = ' + QuotedStr(edtUnidade.Text) + ',' +
                                ' ind_objetivo = ' + QuotedStr(edtObjetivo.Text) + ',' +
                                ' ind_caminho_base = ' + QuotedStr(edtCaminho.Text) + ',' +
                                ' ind_metodologia = ' +  QuotedStr(mmoMetodologia.Text) + ',' +
                                ' ind_responsavel = ' +  IntToStr(dblResponsavel.KeyValue) + ',' +
                                ' ind_cea = ' + IntToStr(dblCEA.KeyValue) + ',' +
                                ' ind_pdca = ' + QuotedStr(edtPDCA.Text) + ',' +
                                ' ind_status = ' + IntToStr(dblStatus.KeyValue) + ',' +
                                ' ind_monitoramento = ' + IntToStr(dblMonitoramento.KeyValue) +
                                ' WHERE codi_ind = ' + cdsIndicadores.FieldByName('codi_ind').AsString;
                  Execute;
               end;

               AtualizarValores();
            end;

            Auditoria('CADASTRO DE INDICADORES', edtDescricao.Text, cOperacao,'');
            AtualizarDados();

            sbVincularPDCA.Enabled   := False;
            sbDesvincularPDCA.Enabled:= False;

//            HabilitarCampos(False, False, Self, 2);
//            Botoes(True);
//            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E:Exception do begin
               Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
            end;
         end;
      end;
      if pctIndicadores.TabIndex = 1 then begin // Metas
         try
            with cdsGravar do begin
               Active:= False;
               if cOperacao = 'I' then begin
                  GravarMesesMeta(AnoMes(IntToStr(cbbPeriodo.ItemIndex + 1), spnAno.Text)); // Grava os meses do intervalo do último mês gravado até o atual
                  // Grava o mês atual
                  BuscarNovoCodigo();
                  CommandText:= ' INSERT INTO indicadores_metas ' +
                                ' (met_codigo, met_codindicador, met_anomes, met_tipo, ' +
                                ' met_valor, met_unidade)' +
                                ' VALUES(' +
                                sNovoCodigo + ',' +
                                QuotedStr(edtCodMeta.Text) + ',' +
                                AnoMes(IntToStr(cbbPeriodo.ItemIndex + 1), spnAno.Text) + ',' +
                                IntToStr(dblTipoMeta.KeyValue) + ',' +
                                VirgulaParaPonto(edtValorMeta.Value,2) + ',' +
                                QuotedStr(edtUnidadeMeta.Text) +
                                ')';
                  Execute;
               end
               else begin
                  CommandText:= ' UPDATE indicadores_metas SET ' +
                                ' met_anomes = ' + AnoMes(IntToStr(cbbPeriodo.ItemIndex + 1), spnAno.Text) + ',' +
                                ' met_tipo = ' + IntToStr(dblTipoMeta.KeyValue) + ',' +
                                ' met_valor = ' + VirgulaParaPonto(edtValorMeta.Value,2) + ',' +
                                ' met_unidade = ' + QuotedStr(edtUnidadeMeta.Text) +
                                ' WHERE met_codigo = ' + cdsMetasmet_codigo.AsString +
                                ' AND met_codindicador = ' + QuotedStr(edtCodMeta.Text);
                  Execute;
               end;
            end;

            Auditoria('CADASTRO DE INDICADORES - METAS', edtDescricao.Text + '-' + AnoMes(IntToStr(cbbPeriodo.ItemIndex + 1), spnAno.Text) + '-' + VirgulaParaPonto(edtValorMeta.Value,2), cOperacao,'');
         except
            on E:Exception do begin
               Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
            end;
         end;
      end;
      PreencherCampos();
      AtualizarDadosAcessorios();

      HabilitarCampos(False, False, Self, 2);
      Botoes(True);
      Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
   end;
end;

procedure TFormCadIndicadores.AtualizarValores;
begin
   Executar(' UPDATE valor_indicador SET' +
            ' proc_vin = ' + IntToStr(dblProcesso.KeyValue) +
            ' WHERE codi_ind = ' + cdsIndicadores.FieldByName('codi_ind').AsString);
end;

procedure TFormCadIndicadores.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadIndicadores.btnImprimirClick(Sender: TObject);
begin
   if pctIndicadores.TabIndex = 0 then begin // Cadastro
      pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
      pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
      pnlImprimir.Visible := True;

      rgOrdemImpressao.ItemIndex:= 1;
   end;
   if pctIndicadores.TabIndex = 1 then begin // Metas
      pnlImpMetas.Top     := Self.Height div 2 - pnlImpMetas.Height div 2 - 20;
      pnlImpMetas.Left    := Self.Width div 2 - pnlImpMetas.Width div 2;
      pnlImpMetas.Visible := True;

      rgOrdemMetas.ItemIndex:= 1;
   end;
end;

procedure TFormCadIndicadores.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 13, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos(Self);
      HabilitarCampos(True, False, Self, 2);
      Botoes(False);
      BuscarNovoCodigo();
      sbVincularPDCA.Enabled   := True;
      sbDesvincularPDCA.Enabled:= False;
      case pctIndicadores.TabIndex of
         0: begin
//            cOperacao:= 'I';
//            LimparCampos(Self);
//            HabilitarCampos(True, True, Self, 2);
//            Botoes(False);
            dblStatus.KeyValue:= 1; // Ativo
            btnExcluir.Enabled       := False;
            btnAlterar.Enabled       := False;
            edtCodigo.Text           := sNovoCodigo;
            dblCEA.KeyValue          := 0;
            dblMonitoramento.KeyValue:= 0; // Não
            TryFocus(edtDescricao);
         end;
         1: begin
            cbbPeriodo.ItemIndex:= StrToInt(FormatDateTime('m', Date())) - 1;
            spnAno.Text:= FormatDateTime('yyyy', Date());
            TryFocus(cbbPeriodo);
         end;
      end;

   end;
end;

procedure TFormCadIndicadores.btnPDCAClick(Sender: TObject);
begin
   if edtPDCA.Text = EmptyStr then begin
      if Acesso(cUsuario, 44, 'acesso') = 1 then begin
         AbrirForm(TFormPDCA, FormPDCA, 3);
      end;
      AtualizarDados();
   end
   else begin
      if Acesso(cUsuario, 44, 'acesso') = 1 then begin
         FormPDCA:= TFormPDCA.Create(nil);
         FormPDCA.sCodigoPDCA:= edtPDCA.Text;
         FormPDCA.iTela:= 8;
         FormPDCA.ShowModal;
         FormPDCA.Release;
      end;
   end;
end;

procedure TFormCadIndicadores.btnPrimeiroClick(Sender: TObject);
begin
   cdsIndicadores.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIndicadores.btnAnteriorClick(Sender: TObject);
begin
   cdsIndicadores.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIndicadores.btnProximoClick(Sender: TObject);
begin
   cdsIndicadores.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIndicadores.btnUltimoClick(Sender: TObject);
begin
   cdsIndicadores.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadIndicadores.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadIndicadores.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadIndicadores.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadIndicadores.btnVideoImpClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadIndicadores.btnVideoMetasClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadIndicadores.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      case pctIndicadores.TabIndex of
         0: CommandText:= ' SELECT MAX(codi_ind) AS NovoCodigo FROM Indicadores';
         1: CommandText:= ' SELECT MAX(met_codigo) AS NovoCodigo FROM indicadores_metas';
      end;
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadIndicadores.cbCampoCloseUp(Sender: TObject);
begin
   TryFocus(edtValor);
end;

procedure TFormCadIndicadores.cdsImpMetasCalcFields(DataSet: TDataSet);
begin
   cdsImpMetas.FieldByName('MesAno').AsString:=
   MesExtenso(Copy(cdsImpMetas.FieldByName('met_anomes').AsString, 5,2), True) + '/' + Copy(cdsImpMetas.FieldByName('met_anomes').AsString, 1,4);
end;

procedure TFormCadIndicadores.cdsImprimirCalcFields(DataSet: TDataSet);
begin
   cdsImprimir.FieldByName('MesAno').AsString:= MesExtenso(Copy(cdsImprimir.FieldByName('mes_atual').AsString, 5,2), True) +
                                                '/' + Copy(cdsImprimir.FieldByName('mes_atual').AsString, 1,4);
end;

procedure TFormCadIndicadores.cdsMetasCalcFields(DataSet: TDataSet);
begin
   cdsMetasano.AsString:= Copy(cdsMetas.FieldByName('met_anomes').AsString,1,4);
   cdsMetasmes.AsString:= MesExtenso(Copy(cdsMetas.FieldByName('met_anomes').AsString,5,2), True);
end;

procedure TFormCadIndicadores.ControlarAbas;
begin
   if pctIndicadores.TabIndex = 0 then begin  // Cadastro
      Botoes(True);

      cdsIndicadores.Filtered:= False;
      cdsIndicadores.Locate('codi_ind', edtCodigo.Text, []);
      AtualizarDadosAcessorios();
      PreencherCampos();
   end
   else begin
      if pctIndicadores.TabIndex = 1 then begin // Metas
         Botoes(True);
         AtualizarDadosAcessorios();
      end;
      if pctIndicadores.TabIndex = 2 then begin // Pesquisa
         btnNovo.Enabled    := False;
         btnGravar.Enabled  := False;
         btnExcluir.Enabled := False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled := False;

         if pctIndicadores.TabIndex = 1 then begin
            edtValor.Enabled:= True;
            edtValor.Clear;
            TryFocus(edtValor);
         end;
      end;
   end;
end;

procedure TFormCadIndicadores.dbgRegistrosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadIndicadores.dbgRegistrosDblClick(Sender: TObject);
begin
   PreencherCampos();
   pctIndicadores.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadIndicadores.dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadIndicadores.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> EmptyStr then begin
      case cbCampo.ItemIndex of
         0: cdsIndicadores.Filter:= 'desc_ind LIKE ' + QuotedStr('%' + edtValor.Text + '%');
         1: cdsIndicadores.Filter:= 'codi_ind = ' + QuotedStr(edtValor.Text);
         2: cdsIndicadores.Filter:= 'nome_pro LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      end;

      cdsIndicadores.Filtered:= True;
   end
   else begin
      cdsIndicadores.Filtered:= False;
   end;
end;

procedure TFormCadIndicadores.FormShow(Sender: TObject);
begin
   pctIndicadores.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 2);
   pnlImprimir.Visible      := False;
   sbVincularPDCA.Enabled   := False;
   sbDesvincularPDCA.Enabled:= False;

   if not VerificarProjetoCEA() then begin
      dblCEA.Visible:= False;
      lblCEA.Visible:= False;
   end;
end;

procedure TFormCadIndicadores.mmoMetodologiaExit(Sender: TObject);
begin
   mmoMetodologia.Text:= AcertaUpper(mmoMetodologia.Text);
end;

procedure TFormCadIndicadores.mmoMetodologiaKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadIndicadores.pctIndicadoresChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadIndicadores.PreencherCampos;
begin
   with cdsIndicadores do begin
      edtCodigo.Text     := FieldByName('codi_ind').AsString;
      edtDescricao.Text  := FieldByName('desc_ind').AsString;
   end;

   if pctIndicadores.TabIndex = 0 then begin // Cadastro
      with cdsIndicadores do begin
         edtCodigo.Text     := FieldByName('codi_ind').AsString;
         edtDescricao.Text  := FieldByName('desc_ind').AsString;
         edtMeta.Text       := FieldByName('meta_ind').AsString;
         edtUnidade.Text    := FieldByName('ind_unidade').AsString;
         edtObjetivo.Text   := FieldByName('ind_objetivo').AsString;
         edtCaminho.Text    := FieldByName('ind_caminho_base').AsString;
         mmoMetodologia.Text:= FieldByName('ind_metodologia').AsString;
         edtPDCA.Text       := FieldByName('ind_pdca').AsString;

         // Falta definir como vai ficar esse campo
         if FieldByName('tipo_ind').AsString <> EmptyStr then begin
            dblMeta.KeyValue:= FieldByName('tipo_ind').AsString;
         end;

         if FieldByName('peri_ind').AsString <> EmptyStr then begin
            dblPeriodo.KeyValue:= FieldByName('peri_ind').AsString;
         end;

         if FieldByName('proc_ind').AsString <> EmptyStr then begin
            dblProcesso.KeyValue:= FieldByName('proc_ind').AsString;
         end;

         if FieldByName('ind_responsavel').AsString <> EmptyStr then begin
            dblResponsavel.KeyValue:= FieldByName('ind_responsavel').AsString;
         end
         else begin
            dblResponsavel.KeyValue:= -1;
         end;

         if FieldByName('ind_monitoramento').AsString <> EmptyStr then begin
            dblMonitoramento.KeyValue:= FieldByName('ind_monitoramento').AsString;
         end;

         if FieldByName('ind_cea').AsString <> EmptyStr then begin
            dblCEA.KeyValue:= FieldByName('ind_cea').AsString;
         end;

         if FieldByName('ind_status').AsString <> EmptyStr then begin
            dblStatus.KeyValue:= FieldByName('ind_status').AsString;
         end;

         ControlarBotaoVisualiza(Self);
      end;
   end;
   if pctIndicadores.TabIndex = 1 then begin // Metas
      with cdsMetas do begin
         if RecordCount > 0 then begin
            cbbPeriodo.ItemIndex:= StrToInt(Copy(FieldByName('met_anomes').AsString, 5,2)) - 1;
            spnAno.Text         := Copy(FieldByName('met_anomes').AsString, 1,4);
            edtValorMeta.Value  := FieldByName('met_valor').AsFloat;
            edtUnidadeMeta.Text := FieldByName('met_unidade').AsString;

            if FieldByName('met_tipo').AsString <> EmptyStr then begin
               dblTipoMeta.KeyValue:= FieldByName('met_tipo').AsString;
            end;
         end
         else begin
            cbbPeriodo.ItemIndex:= -1;
            spnAno.Text         := '';
            edtValorMeta.Value  := 0;
            edtUnidadeMeta.Text := '';
         end;
      end;
   end;
end;

procedure TFormCadIndicadores.sbVincularPDCAClick(Sender: TObject);
begin
   AbrirForm(TFormPesqPDCA, FormPesqPDCA);
end;

procedure TFormCadIndicadores.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadIndicadores.sbDesvincularPDCAClick(Sender: TObject);
begin
   edtPDCA.Clear;
   sbVincularPDCA.Enabled   := True;
   sbDesvincularPDCA.Enabled:= False;
end;

procedure TFormCadIndicadores.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

function TFormCadIndicadores.ValidarDados(): Boolean;
begin
   if pctIndicadores.TabIndex = 0 then begin
      if AllTrim(edtDescricao.Text) = EmptyStr then begin
         Application.MessageBox('Campo Descrição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtDescricao);
         Result:= False;
         Exit;
      end;

//      if dblMeta.KeyValue = -1 then begin
//         Application.MessageBox('Campo Meta é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
//         TryFocus(dblMeta);
//         Result:= False;
//         Exit;
//      end;

      if dblPeriodo.KeyValue = -1 then begin
         Application.MessageBox('Campo Periodicidade do Indicador obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblPeriodo);
         Result:= False;
         Exit;
      end;

      if dblProcesso.KeyValue = -1 then begin
         Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblProcesso);
         Result:= False;
         Exit;
      end;
   end;

   if pctIndicadores.TabIndex = 1 then begin
      if cbbPeriodo.ItemIndex < 0 then begin
         Application.MessageBox('Campo Mês é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(cbbPeriodo);
         Result:= False;
         Exit;
      end;

      if spnAno.Text = '' then begin
         Application.MessageBox('Campo Ano é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(spnAno);
         Result:= False;
         Exit;
      end;

      if dblTipoMeta.KeyValue = -1 then begin
         Application.MessageBox('Campo Tipo da Meta é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblTipoMeta);
         Result:= False;
         Exit;
      end;

      // Verifica se já existe o mês gravado
      if cOperacao = 'I' then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT count(*) as qtd' +
                          ' FROM indicadores_metas' +
                          ' WHERE met_anomes = ' + QuotedStr(AnoMes(IntToStr(cbbPeriodo.ItemIndex + 1), spnAno.Text)) +
                          ' AND met_codindicador = ' + QuotedStr(edtCodMeta.Text);
            Active:= True;

            if FieldByName('qtd').AsInteger > 0 then begin
               Application.MessageBox(PChar('O mês de ' + cbbPeriodo.Text + '/' + spnAno.Text + ' já foi gravado'), 'Aviso', MB_OK + MB_ICONWARNING);
               Result:= False;
               Exit;
            end;
         end;
      end;
   end;

   Result:= True;
end;

procedure TFormCadIndicadores.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sAnoMesIni, sAnoMesFim: string;
begin
   if pctIndicadores.TabIndex = 0 then begin // Cadastro
      if rgOrdemImpressao.ItemIndex = 0 then begin
         sCampoOrdem:= 'P.nome_pro, codi_ind';
      end
      else begin
         sCampoOrdem:= 'P.nome_pro, desc_ind';
      end;

      with cdsImprimir do begin
         Active:= False;
         CommandText:= ' SELECT I.codi_ind, I.desc_ind, I.meta_ind, I.proc_ind, I.tipo_ind, I.peri_ind,  ' +
                       ' I.ind_unidade, I.ind_objetivo, I.ind_caminho_base, I.ind_metodologia, P.nome_pro,' +
                       ' (SELECT met_valor || ' + QuotedStr(' ') + ' || met_unidade FROM indicadores_metas ' +
                       '  WHERE met_codindicador = I.codi_ind ORDER BY met_anomes desc limit 1 ) as meta_atual, ' +
                       ' (SELECT met_anomes FROM indicadores_metas ' +
                       '  WHERE met_codindicador = I.codi_ind ORDER BY met_anomes desc limit 1 ) as mes_atual, ' +
                       ' (SELECT TC.valo_com FROM indicadores_metas ' +
                       '    INNER JOIN tabela_combos TC ON TC.tipo_com = 17 AND TC.codi_com = met_tipo ' +
                       '    WHERE met_codindicador = I.codi_ind ORDER BY met_anomes desc limit 1 ) as tipo_atual ' +
                       ' FROM indicadores I' +
                       ' INNER JOIN processos P ON P.codi_pro = I.proc_ind' +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      Imprimir('rel_ListaIndicadores', frxReport1, tipoImp);
   end
   else begin // Metas
      if rgOrdemMetas.ItemIndex = 0 then begin
         sCampoOrdem:= 'met_codindicador, met_anomes';
      end
      else begin
         sCampoOrdem:= 'met_codindicador, met_anomes DESC';
      end;

      sAnoMesFim:= AnoMes(FormatDateTime('m',Date()),FormatDateTime('yyyy',Date()));
      case rgPeriodo.ItemIndex of
         0: begin // 3 meses
            sAnoMesIni:= SubtrairAnoMes(sAnoMesFim, 2);
         end;
         1: begin // 6 meses
            sAnoMesIni:= SubtrairAnoMes(sAnoMesFim, 5);
         end;
         2: begin // 12 meses
            sAnoMesIni:= SubtrairAnoMes(sAnoMesFim, 11);
         end;
         3: begin // 24 meses
            sAnoMesIni:= SubtrairAnoMes(sAnoMesFim, 23);
         end;
      end;

      with cdsImpMetas do begin
         Active:= False;
         CommandText:= ' SELECT met_codigo, met_codindicador, met_anomes, ' +
                       ' met_tipo, met_valor,  met_unidade' +
                       ' FROM indicadores_metas' +
                       ' WHERE met_anomes BETWEEN ' + QuotedStr(sAnoMesIni) + ' AND ' + QuotedStr(sAnoMesFim) +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImpMetas.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      Imprimir('rel_IndicadoresMetas', frxReport1, tipoImp);
   end;


end;

end.
