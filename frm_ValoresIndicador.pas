unit frm_ValoresIndicador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, TeEngine,
  Series, TeeProcs, Chart, DBChart, Mask, rxToolEdit, rxCurrEdit,
  FMTBcd, DBClient, Provider, DB, SqlExpr, JvFullColorSpaces, JvFullColorCtrls,
  JvExControls, JvChart, frxClass, frxDBSet, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DateUtils ;

type
  TFormValorIndicadores = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    dbgIndicadores: TDBGrid;
    edtAno: TEdit;
    Label2: TLabel;
    dblIndicadores: TDBLookupComboBox;
    cbPeriodo: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    lblCodigo: TLabel;
    Image1: TImage;
    Image2: TImage;
    mmoObs: TMemo;
    Label6: TLabel;
    tmrGeral: TTimer;
    lbMedia: TLabel;
    Label7: TLabel;
    lbUltimoMes: TLabel;
    lbVrUltimoMes: TLabel;
    Shape1: TShape;
    Label11: TLabel;
    cbMesIni: TComboBox;
    edAnoIni: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    cbMesFim: TComboBox;
    edAnoFim: TEdit;
    Label13: TLabel;
    btnPesquisaMeses: TSpeedButton;
    btnLimparFiltro: TSpeedButton;
    tmrMedia: TTimer;
    sbCalc: TSpeedButton;
    edtValor: TCurrencyEdit;
    dspReport: TDataSetProvider;
    cdsReport: TClientDataSet;
    dspValorIndicadores: TDataSetProvider;
    dsValorIndicadores: TDataSource;
    cdsValorIndicadores: TClientDataSet;
    cdsValorIndicadoresextMes: TStringField;
    cdsValorIndicadoresano: TStringField;
    cdsValorIndicadoresperiodo: TStringField;
    cdsValorIndicadoresValor: TFloatField;
    cdsValorIndicadoresValorGrafico: TFloatField;
//    frxdbValorIndicador: TfrxDBDataset;
    mmo1: TMemo;
    cdsValorIndicadoresanomes: TStringField;
    cdsValorIndicadoresdescInd: TStringField;
    zqryReport: TZQuery;
    zqryValorIndicadores: TZQuery;
    cdsValorIndicadorescodi_ind: TLargeintField;
    cdsValorIndicadorescodi_vin: TLargeintField;
    cdsValorIndicadoresperi_vin: TLargeintField;
    cdsValorIndicadoresproc_vin: TLargeintField;
    cdsValorIndicadoresvalo_vin: TFloatField;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    btnImprimir: TBitBtn;
    lbl1: TLabel;
    pnlValorUltimoMes: TPanel;
    pnlUltimoMes: TPanel;
    pnl1: TPanel;
    pnlValorMedia: TPanel;
    cdsReportValor: TFloatField;
    zqryIndicadores: TZQuery;
    dspIndicadores: TDataSetProvider;
    cdsIndicadores: TClientDataSet;
    dsIndicadores: TDataSource;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    frxReport1: TfrxReport;
    frxDBValorIndicador: TfrxDBDataset;
    cdsReportmes: TWideMemoField;
    cdsReportano: TWideMemoField;
    cdsReportmesextenso: TWideMemoField;
    cdsReportdesc_ind: TWideStringField;
    cdsReportind_objetivo: TWideStringField;
    cdsReportobs: TWideMemoField;
    cdsValorIndicadoresobse_vin: TWideMemoField;
    lbl35: TLabel;
    sbVisualizar: TSpeedButton;
    cdsValorIndicadoresvin_arquivo: TWideStringField;
    opd1: TOpenDialog;
    btnGraficos: TBitBtn;
    mmoMetodologia: TMemo;
    lbl2: TLabel;
    cdsValorIndicadoresind_metodologia: TWideMemoField;
    cdsValorIndicadoresmet_anomes: TWideStringField;
    pnlRel: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    rgOrientacao: TRadioGroup;
    sbVisualizarNC: TSpeedButton;
    pnlMonitoramento: TPanel;
    pnl12: TPanel;
    btnFechar: TBitBtn;
    mmoMonitoramento: TMemo;
    cdsValorIndicadoresMetaConcatenada: TStringField;
    cdsValorIndicadoresmet_unidade: TWideStringField;
    cdsReportmet_valor: TFloatField;
    cdsReportmet_unidade: TWideStringField;
    cdsValorIndicadoresmet_tipo: TIntegerField;
    lbl3: TLabel;
    edtPeriodo: TEdit;
    btnPMC: TBitBtn;
    btnEmail: TBitBtn;
    pnlEmail: TPanel;
    pnl3: TPanel;
    sb1: TSpeedButton;
    pnl4: TPanel;
    btnEnviarEmail: TBitBtn;
    lbl4: TLabel;
    lblGestor: TLabel;
    lbl6: TLabel;
    mmoTextoEmail: TMemo;
    cdsValorIndicadoresgest_pro: TLargeintField;
    cdsValorIndicadoresgestor: TWideStringField;
    cdsValorIndicadoresemail_gestor: TWideStringField;
    pnlCadEmail: TPanel;
    lbl15: TLabel;
    lbl17: TLabel;
    lblNomeGestor: TLabel;
    pnl7: TPanel;
    btnSairEmail: TBitBtn;
    btnGravarEmail: TBitBtn;
    pnl8: TPanel;
    edtEmail: TEdit;
    lbl5: TLabel;
    lbl7: TLabel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairRel: TBitBtn;
    sbVisualizarMetodologia: TSpeedButton;
    zqryDadosIndicador: TZQuery;
    dspDadosIndicador: TDataSetProvider;
    cdsDadosIndicador: TClientDataSet;
    dsDadosIndicador: TDataSource;
    edtArquivo: TEdit;
    cdsIndicadorestipo_ind: TIntegerField;
    cdsIndicadoresmeta_ind: TFloatField;
    cdsIndicadoresmetaatual: TFloatField;
    cdsIndicadoresmetaconcatenada: TStringField;
    cdsValorIndicadoresmet_valor: TFloatField;
    cdsReportmetaconcatenada: TWideMemoField;
    chkMonitoramento: TCheckBox;
    procedure cdsValorIndicadoresAfterPost(DataSet: TDataSet);
    procedure cdsValorIndicadoresCalcFields(DataSet: TDataSet);
    procedure sbCalcClick(Sender: TObject);
    procedure sbAtualizaRelogiosClick(Sender: TObject);
    procedure tmrMediaTimer(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure btnPesquisaMesesClick(Sender: TObject);
    procedure tmrGeralTimer(Sender: TObject);
    procedure dblIndicadoresCloseUp(Sender: TObject);
    procedure dbgIndicadoresCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure LimparCampos;
    procedure Velocimetro;
    function CalculaMedia(codIndicador: Integer): Real;
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure RvCustomConnection1GetRow(Connection: TRvCustomConnection);
    procedure AtualizarDados();
    function NovoCodigo(): Integer;
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
//    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure Botoes(flag: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure cdsReportCalcFields(DataSet: TDataSet);
    procedure cdsIndicadoresCalcFields(DataSet: TDataSet);
    procedure PreencherDados();
    procedure sbVisualizarClick(Sender: TObject);
    procedure btnGraficosClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Imprimir(Tipo: string);
    procedure sbSairRelClick(Sender: TObject);
    procedure sbVisualizarNCClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure dbgIndicadoresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPMCClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnSairEmailClick(Sender: TObject);
    procedure btnGravarEmailClick(Sender: TObject);
    procedure sbVisualizarMetodologiaClick(Sender: TObject);
    procedure BuscarIndicadores();
    procedure chkMonitoramentoClick(Sender: TObject);
  private
    { Private declarations }
    cont, cont1: Real;
    sImagem: string;
    cOperacao: string;
    sEmailGestor: string;
  public
    { Public declarations }
    iProcesso: Integer;
    iDataAntiga: Integer;
    Formato: string;
  end;

var
  FormValorIndicadores: TFormValorIndicadores;

implementation

uses frm_dm, Funcoes, frm_Tartaruga, frm_Inicial,
  frm_ValoresIndicadorGrafico, frm_CadPMCAbre;

{$R *.dfm}

procedure TFormValorIndicadores.dbgIndicadoresCellClick(Column: TColumn);
begin
   PreencherDados();
end;

procedure TFormValorIndicadores.dbgIndicadoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   // Label Média
   case cdsValorIndicadoresmet_tipo.AsInteger of
      1: begin // Igual a
         if cdsValorIndicadoresvalo_vin.AsFloat <> cdsValorIndicadoresmet_valor.AsFloat then begin
            dbgIndicadores.Canvas.Font.Color:= clRed;
         end
         else begin
            dbgIndicadores.Canvas.Font.Color:= clBlack;
         end;
      end;
      2: begin // Maior que
         if cdsValorIndicadoresvalo_vin.AsFloat <= cdsValorIndicadoresmet_valor.AsFloat then begin
            dbgIndicadores.Canvas.Font.Color:= clRed;
         end
         else begin
            dbgIndicadores.Canvas.Font.Color:= clBlack;
         end;
      end;
      3: begin // Menor que
         if cdsValorIndicadoresvalo_vin.AsFloat >= cdsValorIndicadoresmet_valor.AsFloat then begin
            dbgIndicadores.Canvas.Font.Color:= clRed;
         end
         else begin
            dbgIndicadores.Canvas.Font.Color:= clBlack;
         end;
      end;
      4: begin // Maior Igual que
         if cdsValorIndicadoresvalo_vin.AsFloat < cdsValorIndicadoresmet_valor.AsFloat then begin
            dbgIndicadores.Canvas.Font.Color:= clRed;
         end
         else begin
            dbgIndicadores.Canvas.Font.Color:= clBlack;
         end;
      end;
      5: begin // Menor Igual que
         if cdsValorIndicadoresvalo_vin.AsFloat > cdsValorIndicadoresmet_valor.AsFloat then begin
            dbgIndicadores.Canvas.Font.Color:= clRed;
         end
         else begin
            dbgIndicadores.Canvas.Font.Color:= clBlack;
         end;
      end;
   end;
   dbgIndicadores.DefaultDrawDataCell(Rect, dbgIndicadores.columns[datacol].field, State);
end;

procedure TFormValorIndicadores.btnGravarEmailClick(Sender: TObject);
begin
   Executar(' UPDATE colaboradores' +
           ' SET col_email = ' + QuotedStr(edtEmail.Text) +
           ' WHERE codi_col = ' + QuotedStr(cdsValorIndicadores.FieldByName('gest_pro').AsString)
           );

   sEmailGestor:= edtEmail.Text;
   pnlCadEmail.Visible:= False;
end;

procedure TFormValorIndicadores.dblIndicadoresCloseUp(Sender: TObject);
begin
   if (dblIndicadores.KeyValue <> -1) AND (dblIndicadores.KeyValue <> null) then begin
      Botoes(True);
   end;
   edtPeriodo.Text    := 'INDICADOR ' + cdsIndicadores.FieldByName('Periodo').AsString;

   with cdsDadosIndicador do begin
      Active:= False;
      CommandText:= ' SELECT ind_metodologia, ind_caminho_base' +
                    ' FROM indicadores' +
                    ' WHERE codi_ind = ' + QuotedStr(IntToStr(StrToInt(dblIndicadores.KeyValue)));
      Active:= True;

      mmoMetodologia.Text:= FieldByName('ind_metodologia').AsString;
      edtArquivo.Text    := FieldByName('ind_caminho_base').AsString;
   end;

   with cdsValorIndicadores do begin
      Active:= False;
      CommandText:= ' SELECT V.codi_ind, V.codi_vin, V.obse_vin, V.peri_vin, ' +
                    ' V.proc_vin, V.valo_vin, V.vin_arquivo, ind_metodologia, ' +
                    ' CAST(M.met_valor as numeric(18,6)) as met_valor, ' +
                    ' M.met_anomes, M.met_unidade, M.met_tipo, ' +
                    ' P.gest_pro, C.nome_col as gestor, C.col_email as email_gestor' +
//                    ' TC.valo_com || ' + QuotedStr(' ') + ' || M.met_valor as MetaConcatenada' +
                    ' FROM valor_indicador V' +
                    ' INNER JOIN indicadores I ON I.codi_ind = V.codi_ind' +
                    ' LEFT JOIN indicadores_metas M ON M.met_codindicador = V.codi_ind' +
                    '            AND M.met_anomes = CAST(V.peri_vin as character varying)' +
                    ' INNER JOIN processos P ON P.codi_pro = V.proc_vin ' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = P.gest_pro ' +
                    ' WHERE V.codi_ind = ' + QuotedStr(IntToStr(StrToInt(dblIndicadores.KeyValue))) +
                    ' AND V.peri_vin BETWEEN ' + QuotedStr(FormatDateTime('yyyy', Date()) + '01') +
                    ' AND ' + QuotedStr(FormatDateTime('yyyy', Date()) + '12') +
                    ' ORDER BY V.peri_vin';
      Active:= True;
      LimparCampos();

      mmoTextoEmail.Text:= 'O INDICADOR ' + dblIndicadores.Text + ' FOI ATUALIZADO';
      sEmailGestor:= FieldByName('email_gestor').AsString;

      if cdsValorIndicadores.IsEmpty then begin
         Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                    'Imagens\0.bmp');
         pnlValorMedia.Caption:= '00,00';
         Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                    'Imagens\0.bmp');
         pnlValorUltimoMes.Caption:= '00,00';

         btnAlterar.Enabled:= False;
         btnExcluir.Enabled:= False;
      end
      else begin
         Velocimetro;
         PreencherDados();
      end;
   end;
end;

procedure TFormValorIndicadores.edtValorExit(Sender: TObject);
begin
   if edtValor.Text = EmptyStr then begin
//      Application.MessageBox('Os valores abaixo de 0,00 ou acima de 100,00' +
//        #13#10 + 'devem ser transformados em porcentagem.', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Application.MessageBox('Digite um valor válido', 'Aviso', MB_OK + MB_ICONINFORMATION);
      edtValor.SetFocus;
      Exit;
   end;

//   if (StrToFloat(edMedia.Text) < 0) or (StrToFloat(edMedia.Text) > 100)  then begin
//      Application.MessageBox('Os valores abaixo de 0,00 ou acima de 100,00' +
//        #13#10 + 'devem ser transformados em porcentagem.', 'Aviso', MB_OK + MB_ICONINFORMATION);
//      edMedia.SetFocus;
//   end;
end;

procedure TFormValorIndicadores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FormTartaruga.VerificaPendencias;
end;

procedure TFormValorIndicadores.FormShow(Sender: TObject);
begin
   // Hint do campo Valor da média do Indicador
//   edtValor.ShowHint:= True;
//   edtValor.Hint:= 'Os valores abaixo de 0,00 ou acima de 100,00' + #13 +
//                  'devem ser transformados em porcentagem.';

   Self.Caption:= 'Indicadores - Processo: ' + lblCodigo.Caption;

   // Carrega a lista de indicadores do processo
   BuscarIndicadores();

   cdsValorIndicadores.Active:= False;

   tmrGeral.Enabled:= False;
   tmrMedia.Enabled:= False;
   cont:= 1;
   cont1:= 1;

   pnlValorMedia.Caption:= '00,00';
//   lbMedia.Left   := 89;
//   lbMedia.Top    := 596;
//   lbMedia.Width  := 66;
//   lbMedia.Alignment:= taCenter;

   pnlValorUltimoMes.Caption:= '00,00';
//   lbVrUltimoMes.Left   := 322;
//   lbVrUltimoMes.Top    := 596;
//   lbVrUltimoMes.Width  := 66;
//   lbVrUltimoMes.Alignment:= taCenter;

//   lbUltimoMes.Caption:= EmptyStr;
//   lbUltimoMes.Left   := 329;
//   lbUltimoMes.Top    := 596;
//   lbUltimoMes.Width  := 54;
//   lbUltimoMes.Alignment:= taCenter;

//   Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Imagens\0.bmp');

   cbMesIni.ItemIndex:= -1;
   cbMesFim.ItemIndex:= -1;
   edAnoIni.Clear;
   edAnoFim.Clear;

   dblIndicadores.KeyValue:= -1;

   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnExcluir.Enabled := False;
   btnGravar.Enabled  := False;
   btnCancelar.Enabled:= False;
   btnImprimir.Enabled:= False;
   btnGraficos.Enabled:= False;
   btnPMC.Enabled     := False;
   btnEmail.Enabled   := False;

   HabilitarCampos(False, False, Self, -1);

   cbMesIni.ItemIndex:= 0;
   cbMesFim.ItemIndex:= 11;
   edAnoIni.Text:= FormatDateTime('yyyy', IncYear(Now, -1));
   edAnoFim.Text:= FormatDateTime('yyyy', IncYear(Now, -1));

   // Busca a configuração de casas decimais em parametros
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT casasindicador' +
                    ' FROM parametros';
      Active:= True;

      Formato:= '##0.' + Replic('0', FieldByName('casasindicador').AsInteger);
   end;
   cdsValorIndicadoresvalo_vin.DisplayFormat:= Formato;

   sEmailGestor:= '';

//   TryFocus(dblIndicadores);
end;

procedure TFormValorIndicadores.Imprimir(Tipo: string);
var
  DataInicial, DataFinal: Integer;
begin
   if not((cbMesIni.ItemIndex < 0) or (cbMesFim.ItemIndex < 0)
                     or (edAnoIni.Text = EmptyStr) or (edAnoFim.Text = EmptyStr)) then begin
      DataInicial:= (StrToInt(edAnoIni.Text) * 100) + cbMesIni.ItemIndex + 1;
      DataFinal  := (StrToInt(edAnoFim.Text) * 100) + cbMesFim.ItemIndex + 1;
   end;

   with cdsReport do begin
      Active:= False;
      CommandText:= ' SELECT i.desc_ind, M.met_valor, M.met_unidade, ' +
                    ' CASE SUBSTRING(cast(v.peri_vin as varchar),5,2) ' +
                    '    when ' + QuotedStr('01') + ' then ' + QuotedStr('JANEIRO') +
                    '    when ' + QuotedStr('02') + ' then ' + QuotedStr('FEVEREIRO') +
                    '    when ' + QuotedStr('03') + ' then ' + QuotedStr('MARÇO') +
                    '    when ' + QuotedStr('04') + ' then ' + QuotedStr('ABRIL') +
                    '    when ' + QuotedStr('05') + ' then ' + QuotedStr('MAIO') +
                    '    when ' + QuotedStr('06') + ' then ' + QuotedStr('JUNHO') +
                    '    when ' + QuotedStr('07') + ' then ' + QuotedStr('JULHO') +
                    '    when ' + QuotedStr('08') + ' then ' + QuotedStr('AGOSTO') +
                    '    when ' + QuotedStr('09') + ' then ' + QuotedStr('SETEMBRO') +
                    '    when ' + QuotedStr('10') + ' then ' + QuotedStr('OUTUBRO') +
                    '    when ' + QuotedStr('11') + ' then ' + QuotedStr('NOVEMBRO') +
                    ' ELSE  ' + QuotedStr('DEZEMBRO') +
                    ' END as MesExtenso, ' +
                    ' SUBSTRING(cast(v.peri_vin as varchar),5,2) as Mes, '+
                    ' SUBSTRING(cast(v.peri_vin as varchar),1,4) as Ano, v.valo_vin as Valor, ' +
                    ' v.obse_vin as Obs, i.ind_objetivo, ' +
                    ' TC.valo_com || ' + QuotedStr(' ') + ' || M.met_valor || ' + QuotedStr(' ') + ' || M.met_unidade as MetaConcatenada' +
                    ' FROM valor_indicador v ' +
                    ' INNER JOIN Indicadores i ON v.codi_ind = i.codi_ind ' +
                    ' LEFT JOIN indicadores_metas M ON M.met_codindicador = V.codi_ind' +
                    '            AND M.met_anomes = CAST(V.peri_vin as character varying)' +
                    ' LEFT JOIN Tabela_Combos TC ON TC.tipo_com = 17 AND TC.codi_com = M.met_tipo ' +
                    ' WHERE v.codi_ind = ' + IntToStr(dblIndicadores.KeyValue);
                    if not((cbMesIni.ItemIndex < 0) or (cbMesFim.ItemIndex < 0)
                     or (edAnoIni.Text = EmptyStr) or (edAnoFim.Text = EmptyStr)) then begin
                       CommandText:= CommandText + ' AND peri_vin BETWEEN ' + IntToStr(DataInicial) + ' AND ' + IntToStr(DataFinal);
                    end
                    else begin
                       CommandText:= CommandText + ' AND peri_vin BETWEEN ' + FormatDateTime('yyyy', Date()) + '01 ' +
                                                   ' AND ' + FormatDateTime('yyyy', Date()) + '12';
                    end;
//                    '       AND v.proc_vin = ' + IntToStr(iProcesso) +
                    CommandText:= CommandText + ' ORDER BY peri_vin';

      Active:= True;
   end;

   with frxReport1 do begin
      if rgOrientacao.ItemIndex = 0 then begin // Retrato
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ValorIndicadoresRetrato.fr3');
      end
      else begin // Paisagen
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ValorIndicadores.fr3');
      end;
      Variables['VlMedia']:= StrToFloat(pnlValorMedia.Caption);

      if tipo = 'I' then begin
      //       Imprimir direto
         PrepareReport;
         PrintOptions.ShowDialog:= True;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;

   Auditoria('VALORES_INDICADOR','','R', '');
end;

procedure TFormValorIndicadores.LimparCampos;
begin
   //dblIndicadores.KeyValue:= 0;
   edtAno.Clear;
   edtValor.Clear;
   cbPeriodo.ItemIndex:= -1;
   mmoObs.Clear;
//   edtArquivo.Clear;
end;

procedure TFormValorIndicadores.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

function TFormValorIndicadores.NovoCodigo: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_vin) AS NovoCodigo' +
                    ' FROM valor_indicador';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= 1;
      end
      else begin
         Result:= FieldByName('NovoCodigo').AsInteger + 1;
      end;
   end;
end;

procedure TFormValorIndicadores.PreencherDados;
begin
   dblIndicadores.KeyValue:= cdsValorIndicadores.FieldByName('codi_ind').AsInteger;
   edtValor.Text          := cdsValorIndicadores.FieldByName('valo_vin').AsString;
   edtAno.Text            := Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
   cbPeriodo.ItemIndex    := StrToInt(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2)) - 1;
   mmoObs.Text            := cdsValorIndicadores.FieldByName('obse_vin').AsString;
   mmoMonitoramento.Text  := cdsValorIndicadores.FieldByName('obse_vin').AsString;
   iDataAntiga            := cdsValorIndicadoresperi_vin.AsInteger;
//   edtArquivo.Text        := cdsValorIndicadores.FieldByName('vin_arquivo').AsString;
//   mmoMetodologia.Text    := cdsValorIndicadores.FieldByName('ind_metodologia').AsString;

   if AllTrim(edtArquivo.Text) <> EmptyStr then begin
      sbVisualizar.Enabled:= True;
   end
   else begin
      sbVisualizar.Enabled:= False;
   end;
end;

//procedure TFormValorIndicadores.RvCustomConnection1GetRow(
//  Connection: TRvCustomConnection);
//begin
//   WriteChartData(Connection, dbcht1);
//   WriteChartData(Connection, image1);
//   WriteState();
//end;

procedure TFormValorIndicadores.sb1Click(Sender: TObject);
begin
   pnlEmail.Visible:= False;
end;

procedure TFormValorIndicadores.sbAtualizaRelogiosClick(Sender: TObject);
begin
   dblIndicadoresCloseUp(Self);
end;

procedure TFormValorIndicadores.sbCalcClick(Sender: TObject);
begin
   WinExec('calc.exe', sw_show);
end;

procedure TFormValorIndicadores.sbSairRelClick(Sender: TObject);
begin
   pnlRel.Visible:= False;
end;

procedure TFormValorIndicadores.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtArquivo.Text, Self.Name);
end;

procedure TFormValorIndicadores.sbVisualizarMetodologiaClick(Sender: TObject);
begin
   pnlMonitoramento.Top  := 57;
   pnlMonitoramento.Left := 20;
   pnlMonitoramento.Width:= 526;
   mmoMonitoramento.Text:= mmoMetodologia.Text;
   pnlMonitoramento.Visible := True;
end;

procedure TFormValorIndicadores.sbVisualizarNCClick(Sender: TObject);
begin
   pnlMonitoramento.Top := 212;
   pnlMonitoramento.Left:= 527;
   pnlMonitoramento.Width:= 258;
   mmoMonitoramento.Text:= mmoObs.Text;
   pnlMonitoramento.Visible := True;
end;

procedure TFormValorIndicadores.tmrGeralTimer(Sender: TObject);
begin
   try
      if (cont > CalculaMedia(StrToInt(dblIndicadores.KeyValue))) or (cont > 100) then begin
         tmrGeral.Enabled:= False;

         // Label Média
         case cdsIndicadorestipo_ind.AsInteger of
            1: begin // Igual a
               if StrToFloat(pnlValorMedia.Caption) <> cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorMedia.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorMedia.Font.Color:= clBlack;
               end;
            end;
            2: begin // Maior que
               if StrToFloat(pnlValorMedia.Caption) <= cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorMedia.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorMedia.Font.Color:= clBlack;
               end;
            end;
            3: begin // Menor que
               if StrToFloat(pnlValorMedia.Caption) >= cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorMedia.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorMedia.Font.Color:= clBlack;
               end;
            end;
            4: begin // Maior Igual que
               if StrToFloat(pnlValorMedia.Caption) < cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorMedia.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorMedia.Font.Color:= clBlack;
               end;
            end;
            5: begin // Menor Igual que
               if StrToFloat(pnlValorMedia.Caption) > cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorMedia.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorMedia.Font.Color:= clBlack;
               end;
            end;
         end;

         pnlValorMedia.Caption:= FormatFloat('00.00####',CalculaMedia(StrToInt(dblIndicadores.KeyValue)));
         cont:= 1;
         Exit;
      end;
      Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                 'Imagens\' + FloatToStr(cont) + '.bmp');


      sImagem:= ExtractFilePath(Application.ExeName) + 'Imagens\' + FloatToStr(cont) + '.bmp';

//      lbMedia.Caption:= FormatFloat('00.00',cont);
      pnlValorMedia.Caption:= FormatFloat('00.000000',cont);
      if lbMedia.Caption = '100,00' then begin
         lbMedia.Left := 83
      end
      else begin
         lbMedia.Left := 89;
      end;
      lbMedia.Top  := 596;
      lbMedia.Width:= 66;
      cont:= cont + 1;
   except
      on E:Exception do begin
         tmrGeral.Enabled:= False;
         Application.MessageBox(PChar('Erro no processamento:' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormValorIndicadores.tmrMediaTimer(Sender: TObject);
begin
   if not cdsValorIndicadores.Active then begin
      cdsValorIndicadores.Active:= True;
   end;
      
   cdsValorIndicadores.Last;
   lbUltimoMes.Caption:= AcertaUpper(cdsValorIndicadoresextMes.AsString);
   pnlUltimoMes.Caption:= AcertaUpper(cdsValorIndicadoresextMes.AsString);
   lbUltimoMes.Width:= 56;
   try
      if (cont1 > cdsValorIndicadoresvalo_vin.AsInteger) or (cont1 > 100) then begin
//         if cont1 > 100 then begin
//            lbVrUltimoMes.Caption:= '100,00';
//            lbVrUltimoMes.Font.Color:= clBlack;
//         end;

//         if cdsValorIndicadoresvalo_vin.AsFloat < 100 then begin
//            lbVrUltimoMes.Left:= 330
//         end
//         else begin
//            lbVrUltimoMes.Left:= 323;
//         end;

//         lbVrUltimoMes.Caption    := FormatFloat('00.000000',cdsValorIndicadoresvalo_vin.AsFloat);
         pnlValorUltimoMes.Caption:= FormatFloat('00.00####',cdsValorIndicadoresvalo_vin.AsFloat);

         Cont1:= 1;
         tmrMedia.Enabled:= False;

         // Label último mês
         case cdsIndicadorestipo_ind.AsInteger of
            1: begin // Igual a
               if StrToFloat(pnlValorUltimoMes.Caption) <> cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorUltimoMes.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorUltimoMes.Font.Color:= clBlack;
               end;
            end;
            2: begin // Maior que
               if StrToFloat(pnlValorUltimoMes.Caption) <= cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorUltimoMes.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorUltimoMes.Font.Color:= clBlack;
               end;
            end;
            3: begin // Menor que
               if StrToFloat(pnlValorUltimoMes.Caption) >= cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorUltimoMes.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorUltimoMes.Font.Color:= clBlack;
               end;
            end;
            4: begin // Maior Igual que
               if StrToFloat(pnlValorUltimoMes.Caption) < cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorUltimoMes.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorUltimoMes.Font.Color:= clBlack;
               end;
            end;
            5: begin // Menor Igual que
               if StrToFloat(pnlValorUltimoMes.Caption) > cdsIndicadoresmeta_ind.AsFloat then begin
                  lbVrUltimoMes.Font.Color:= clRed;
                  pnlValorUltimoMes.Font.Color:= clRed;
               end
               else begin
                  lbVrUltimoMes.Font.Color:= clBlack;
                  pnlValorUltimoMes.Font.Color:= clBlack;
               end;
            end;
         end;

         Exit;
      end;
      Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                 'Imagens\' + FloatToStr(cont1) + '.bmp');
//      if StrToFloat(lbVrUltimoMes.Caption) < dm.cdsIndicadoresmeta_ind.AsFloat then begin
//         lbVrUltimoMes.Font.Color:= clRed
//      end
//      else begin
//         lbVrUltimoMes.Font.Color:= clBlack;
//      end;

      if cont1 <= 100 then begin
         lbVrUltimoMes.Caption:= FormatFloat('00.00',cont1);
         pnlValorUltimoMes.Caption:= FormatFloat('00.000000',cont1);
      end;

//      lbVrUltimoMes.Left := 323;
//      lbVrUltimoMes.Top  := 596;
      lbVrUltimoMes.Width:= 66;
      cont1:= cont1 + 1;
   except
      on E:Exception do begin
         tmrMedia.Enabled:= False;
         Application.MessageBox(PChar('Erro no processamento:' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

function TFormValorIndicadores.ValidaCampos: Boolean;
begin
   Result:= True;

   if cOperacao = 'I' then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) as Qtd' +
                       ' FROM valor_indicador' +
                       ' WHERE codi_ind = ' + IntToStr(dblIndicadores.KeyValue) +
                       ' AND peri_vin = ' + IntToStr((StrToInt(edtAno.Text) * 100) + cbPeriodo.ItemIndex + 1);
         Active:= True;

         if FieldByName('Qtd').AsInteger > 0 then begin
            Application.MessageBox('Já foi lançado valor para este mês', 'Aviso', MB_OK + MB_ICONWARNING);
            Result:= False;
         end;
      end;
   end;

   if cbPeriodo.ItemIndex < 0 then begin
      Application.MessageBox('O período deve ser informado', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(cbPeriodo);
      Result:= False;
      Exit;
   end;

   if edtAno.Text = EmptyStr then begin
      Application.MessageBox('O ano deve ser informado', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtAno);
      Result:= False;
      Exit;
   end;

   if edtValor.Text = EmptyStr then begin
      Application.MessageBox('O valor deve ser informado', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtValor);
      Result:= False;
      Exit;
   end;

   if mmoObs.Text = EmptyStr then begin
      Application.MessageBox('O monitoramento do processo deve ser informado', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoObs);
      Result:= False;
      Exit;
   end;
   
end;

procedure TFormValorIndicadores.Velocimetro;
begin
   tmrGeral.Enabled:= True;
   tmrMedia.Enabled:= True;
end;

procedure TFormValorIndicadores.AtualizarDados;
begin
   dblIndicadoresCloseUp(Self);
//   with cdsValorIndicadores do begin
//      Active:= False;
//      CommandText:= 'SELECT codi_vin, codi_ind,' +
//                    ' peri_vin, valo_vin, proc_vin, obse_vin, sequ_vin, vin_arquivo' +
//                    ' FROM valor_indicador'+
//                    ' WHERE codi_ind = ' + QuotedStr(IntToStr(StrToInt(dblIndicadores.KeyValue))) +
////                    '       AND proc_vin = ' + IntToStr(iProcesso) +
//                    ' ORDER BY peri_vin';
//      Active:= True;
//   end;
end;

procedure TFormValorIndicadores.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := flag;
   btnAlterar.Enabled := flag;
   btnExcluir.Enabled := flag;
   btnGravar.Enabled  := not flag;
   btnCancelar.Enabled:= not flag;
   btnImprimir.Enabled:= flag;
   btnGraficos.Enabled:= flag;
   btnPMC.Enabled     := flag;
   btnEmail.Enabled   := flag;
end;

procedure TFormValorIndicadores.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';
   HabilitarCampos(True, True, Self, -1);
   Botoes(False);
end;

procedure TFormValorIndicadores.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
//   LimparCampos();
   HabilitarCampos(False, False, Self, -1);
end;

procedure TFormValorIndicadores.btnEmailClick(Sender: TObject);
begin
   if VerificarConexaoInternet(True) = False then begin
      Exit;
   end;

   if AllTrim(sEmailGestor) = EmptyStr then begin
      pnlCadEmail.Top    := Self.Height div 2 - pnlCadEmail.Height div 2 - 20;
      pnlCadEmail.Left   := Self.Width div 2 - pnlCadEmail.Width div 2;
      pnlCadEmail.Visible:= True;

      edtEmail.Enabled:= True;
      TryFocus(edtEmail);
   end
   else begin
      pnlEmail.Top    := Self.Height div 2 - pnlEmail.Height div 2 - 20;
      pnlEmail.Left   := Self.Width div 2 - pnlEmail.Width div 2;
      pnlEmail.Visible:= True;

      lblGestor.Caption:= cdsValorIndicadores.FieldByName('gestor').AsString;
      mmoTextoEmail.Enabled:= True;
      TryFocus(mmoTextoEmail);
   end;
end;

procedure TFormValorIndicadores.btnEnviarEmailClick(Sender: TObject);
var
   i: Integer;
begin
   sTextoEmail:= '';
   for i := 0 to mmoTextoEmail.Lines.Count -1 do begin
      sTextoEmail:= sTextoEmail + '<br>' + mmoTextoEmail.Lines[i];
   end;

   EnviarEmail(sTextoEmail, 'Atualização de Indicador', sEmailGestor, 'sistema');
   pnlEmail.Visible:= False;
end;

procedure TFormValorIndicadores.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma exclusão da indicador selecionado ?','Confirmação', MB_YESNO + MB_ICONQUESTION) = idYes then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM valor_indicador' +
                       ' WHERE codi_vin = ' + cdsValorIndicadores.FieldByName('codi_vin').AsString;
         Execute;
      end;

      dblIndicadoresCloseUp(Self);
      Auditoria('VALOR INDICADORES',cdsValorIndicadores.FieldByName('codi_vin').AsString + '-' + cbPeriodo.Text + '/' + edtAno.Text,'E', '');
   end;
end;

procedure TFormValorIndicadores.btnFecharClick(Sender: TObject);
begin
   pnlMonitoramento.Visible:= False;
end;

procedure TFormValorIndicadores.btnGraficosClick(Sender: TObject);
begin
   if cdsValorIndicadores.RecordCount > 0 then begin
      FormValoresIndicadoresGrafico:= TFormValoresIndicadoresGrafico.Create(nil);
      FormValoresIndicadoresGrafico.ShowModal;
      FormValoresIndicadoresGrafico.Release;
   end
   else begin
      Application.MessageBox('Não há registros para visualizar o gráfico','Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormValorIndicadores.btnGravarClick(Sender: TObject);
var
   iCodIndicador: Integer;
   sTeste: string;
begin
   iCodIndicador:= dblIndicadores.KeyValue;
   if cOperacao = 'I' then begin
      try
         if ValidaCampos then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO valor_indicador' +
                             ' (codi_vin, codi_ind, peri_vin, valo_vin, proc_vin, obse_vin, ' +
                             ' vin_arquivo)' +
                             ' VALUES(' +
                             IntToStr(NovoCodigo()) + ',' +
                             IntToStr(dblIndicadores.KeyValue) + ',' +
                             IntToStr((StrToInt(edtAno.Text) * 100) + cbPeriodo.ItemIndex + 1) + ',' +
                             VirgulaParaPonto(edtValor.Value,2) + ',' +
                             IntToStr(iProcesso) + ',' +
                             QuotedStr(mmoObs.Text) + ',' +
                             QuotedStr(edtArquivo.Text) +
                             ')';
               Execute;
            end;

            Auditoria('VALOR INDICADORES',IntToStr(dblIndicadores.KeyValue) + '-' + cbPeriodo.Text + '/' + edtAno.Text,'I', '');
            LimparCampos();
            AcertarSeqIndicadores();
            //cdsValorIndicadores.Refresh;
            AtualizarDados();
            btnNovoClick(Self);
            HabilitarCampos(False, False, Self, -1);
            Botoes(True);
//            btnLimparFiltroClick(Self);
            Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;
      except on E: Exception do
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end; // try
   end// if caption
   else begin
      try
         if ValidaCampos then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' UPDATE valor_indicador SET peri_vin = ' + IntToStr((StrToInt(edtAno.Text) * 100) + cbPeriodo.ItemIndex + 1) +
                             ' ,valo_vin = ' + VirgulaParaPonto(StrToFloat(edtValor.Text),6) +
//                             ' ,proc_vin = ' + IntToStr(iProcesso) +
                             ' ,obse_vin = ' + QuotedStr(mmoObs.Text) +
                             ' ,vin_arquivo = ' + QuotedStr(edtArquivo.Text) +
                             ' WHERE codi_ind = ' + IntToStr(dblIndicadores.KeyValue) +
//                             ' AND proc_vin = ' + IntToStr(iProcesso) +
                             ' AND peri_vin = ' + IntToStr(iDataAntiga);
               Execute;
            end;

            Auditoria('VALOR INDICADORES',IntToStr(iCodIndicador) + '-' + cbPeriodo.Text + '/' + edtAno.Text,'A', '');
            LimparCampos();
            AcertarSeqIndicadores();
//            sbGravar.Caption:= 'Gravar';
//            cdsValorIndicadores.Refresh;
            AtualizarDados();
            btnNovoClick(Self);

            HabilitarCampos(False, False, Self, -1);
            Botoes(True);
//            btnLimparFiltroClick(Self);
            Application.MessageBox('Registro alterado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;
      except
         Application.MessageBox('Não foi possível realizar a alteração','Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

procedure TFormValorIndicadores.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlRel, Self);
   rgOrientacao.ItemIndex:= 0;
end;

procedure TFormValorIndicadores.btnLimparFiltroClick(Sender: TObject);
begin
   cbMesIni.ItemIndex:= -1;
   cbMesFim.ItemIndex:= -1;
   edAnoIni.Clear;
   edAnoFim.Clear;
//   AtualizarDados();
   dblIndicadoresCloseUp(Self);
end;

procedure TFormValorIndicadores.btnNovoClick(Sender: TObject);
begin
   cbPeriodo.ItemIndex:= -1;
   edtAno.Text:= FormatDateTime('yyyy',Date());
   edtValor.Clear;
   mmoObs.Clear;
   cOperacao:= 'I';
   HabilitarCampos(True, True, Self, -1);
   Botoes(False);
   TryFocus(cbPeriodo);
end;

procedure TFormValorIndicadores.btnPesquisaMesesClick(Sender: TObject);
var
  DataInicial, DataFinal: Integer;
begin
   if (cbMesIni.ItemIndex < 0) or (cbMesFim.ItemIndex < 0)
      or (edAnoIni.Text = EmptyStr) or (edAnoFim.Text = EmptyStr) then begin
      Application.MessageBox('Escolha um período para aplicar o filtro.','Aviso',MB_OK + MB_ICONWARNING);
      Exit;
   end;

   DataInicial:= (StrToInt(edAnoIni.Text) * 100) + cbMesIni.ItemIndex + 1;
   DataFinal  := (StrToInt(edAnoFim.Text) * 100) + cbMesFim.ItemIndex + 1;
   with cdsValorIndicadores do begin
      Active:= False;
      CommandText:= ' SELECT V.codi_ind, V.codi_vin, V.obse_vin, V.peri_vin, ' +
                    ' V.proc_vin, V.valo_vin, V.sequ_vin, V.vin_arquivo, ind_metodologia, ' +
                    ' M.met_valor, M.met_anomes, M.met_unidade, M.met_tipo,' +
                    ' P.gest_pro, C.nome_col as gestor, C.col_email as email_gestor' +
                    ' FROM valor_indicador V' +
                    ' INNER JOIN indicadores I ON I.codi_ind = V.codi_ind' +
                    ' LEFT JOIN indicadores_metas M ON M.met_codindicador = V.codi_ind' +
                    '            AND M.met_anomes = CAST(V.peri_vin as character varying)' +
                    ' INNER JOIN processos P ON P.codi_pro = V.proc_vin' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = P.gest_pro ' +
                    ' WHERE V.codi_ind = ' + QuotedStr(IntToStr(StrToInt(dblIndicadores.KeyValue))) +
                    ' AND V.peri_vin BETWEEN ' + IntToStr(DataInicial) + ' AND ' + IntToStr(DataFinal) +
                    ' ORDER BY V.peri_vin';
      Active:= True;
   end;
   Botoes(True);
   Velocimetro;
end;

procedure TFormValorIndicadores.btnPMCClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      FormCadPMCAbre:= TFormCadPMCAbre.Create(nil);
      FormCadPMCAbre.iTela:= 3; // Indicadores
      FormCadPMCAbre.ShowModal;
      FormCadPMCAbre.Release;
   end;
end;

procedure TFormValorIndicadores.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormValorIndicadores.btnSairEmailClick(Sender: TObject);
begin
   pnlCadEmail.Visible:= False;
end;

procedure TFormValorIndicadores.btnVideoClick(Sender: TObject);
begin
   Imprimir('V');
end;

procedure TFormValorIndicadores.BuscarIndicadores;
var
   sValorMonitoramento: string;
begin
   if chkMonitoramento.Checked = True then begin
      sValorMonitoramento:= '1';
   end
   else begin
      sValorMonitoramento:= '0';
   end;


   // Busca somente os indicadores cadastrados para o processo ativo
   with cdsIndicadores do begin
      Active:= False;
      CommandText:= ' SELECT codi_ind, desc_ind, meta_ind, proc_ind, tipo_ind, peri_ind ,' +
                    ' ind_unidade, ind_objetivo,' +
                    ' (SELECT met_valor FROM indicadores_metas ' +
                    '  WHERE met_codindicador = codi_ind ORDER BY met_anomes desc LIMIT 1) AS MetaAtual,' +
                    ' TC.valo_com as Periodo' +
                    ' FROM indicadores' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 18 AND TC.codi_com = peri_ind' +
                    ' WHERE ind_status = 1' + // Ativos
                    ' AND ind_monitoramento = ' + sValorMonitoramento +// Não
                    ' AND proc_ind = ' + FormTartaruga.lblCodigo.Caption +
                    ' ORDER BY desc_ind' ;
      Active:= True;
   end;
end;

procedure TFormValorIndicadores.btnImpressoraClick(Sender: TObject);
begin
   Imprimir('I');
end;

function TFormValorIndicadores.CalculaMedia(CodIndicador: Integer): Real;
var
   DataInicial, DataFinal: Integer;
begin
   if not cdsValorIndicadores.IsEmpty then begin
      cdsValorIndicadores.First;
      DataInicial:= StrToInt(Copy(cdsValorIndicadoresperi_vin.AsString,1,4) +
                    Copy(cdsValorIndicadoresperi_vin.AsString,5,2));
      cdsValorIndicadores.Last;
      DataFinal  := StrToInt(Copy(cdsValorIndicadoresperi_vin.AsString,1,4) +
                   Copy(cdsValorIndicadoresperi_vin.AsString,5,2));
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= 'SELECT AVG(valo_vin) Media' +
                       ' FROM valor_indicador' +
                       ' WHERE codi_ind = ' + QuotedStr(IntToStr(CodIndicador)) +
//                       '       AND proc_vin = ' + IntToStr(iProcesso) +
                       ' AND peri_vin BETWEEN ' + IntToStr(DataInicial) + ' AND ' + IntToStr(DataFinal);
         Active:= True;

         Result:= FieldByName('Media').AsFloat;
      end;
   end
   else begin
      Result:= 0;
   end;
end;

procedure TFormValorIndicadores.cdsIndicadoresCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 17' +
                    ' and codi_com = ' + cdsIndicadores.FieldByName('tipo_ind').AsString +
                    ' ORDER BY orde_com';
      Active:= True;
   end;
//   cdsIndicadoresMetaConcatenada.AsString:= cdsIndicadorestipo_ind.AsString + ' ' + cdsIndicadoresmeta_ind.AsString;
   cdsIndicadoresMetaConcatenada.AsString:= dm.cdsAuxiliar.FieldByName('valo_com').AsString + ' ' + cdsIndicadoresmetaatual.AsString;
end;

procedure TFormValorIndicadores.cdsReportCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 17' +
                    ' and codi_com = ' + cdsIndicadorestipo_ind.AsString +
                    ' ORDER BY orde_com';
      Active:= True;
   end;
   cdsReportMetaConcatenada.AsString:= dm.cdsAuxiliar.FieldByName('valo_com').AsString + ' ' +
                                       cdsReportmet_valor.AsString + ' ' + cdsReportmet_unidade.AsString;
end;

procedure TFormValorIndicadores.cdsValorIndicadoresAfterPost(DataSet: TDataSet);
begin
   cdsValorIndicadores.ApplyUpdates(0);
end;

procedure TFormValorIndicadores.cdsValorIndicadoresCalcFields(DataSet: TDataSet);
begin
   cdsValorIndicadores.FieldByName('extMes').AsString:=
                     MesExtenso(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2), True);
   cdsValorIndicadores.FieldByName('ano').AsString:=
                     Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
   cdsValorIndicadores.FieldByName('periodo').AsString:=
                     MesExtenso(Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,5,2), True) +
                     '/' + Copy(cdsValorIndicadores.FieldByName('peri_vin').AsString,1,4);
//   cdsValorIndicadoresValor.AsString:= FormatFloat('########0.000000',cdsValorIndicadoresvalo_vin.AsFloat);
   cdsValorIndicadoresValorGrafico.AsFloat:= cdsValorIndicadoresvalo_vin.AsFloat;
   cdsValorIndicadoresanomes.AsString:= cdsValorIndicadoresperi_vin.AsString;

   if cdsValorIndicadores.FieldByName('met_tipo').AsString <> EmptyStr then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                       ' WHERE tipo_com = 17' +
                       ' and codi_com = ' + cdsValorIndicadoresmet_tipo.AsString +
                       ' ORDER BY orde_com';
         Active:= True;
      end;
      cdsValorIndicadoresMetaConcatenada.AsString:= dm.cdsAuxiliar.FieldByName('valo_com').AsString + ' ' + cdsValorIndicadoresmet_valor.AsString;
   end
   else begin
      cdsValorIndicadoresMetaConcatenada.AsString:= 'META NÃO CADASTRADA';
   end;
end;

procedure TFormValorIndicadores.chkMonitoramentoClick(Sender: TObject);
begin
   BuscarIndicadores();
   Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                    'Imagens\0.bmp');
   pnlValorMedia.Caption:= '00,00';
   Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +
                              'Imagens\0.bmp');
   pnlValorUltimoMes.Caption:= '00,00';

   btnAlterar.Enabled:= False;
   btnExcluir.Enabled:= False;

   LimparCampos();
   cdsValorIndicadores.Active:= False;
   mmoMetodologia.Clear;
   edtPeriodo.Clear;

   TryFocus(dblIndicadores);
end;

end.
