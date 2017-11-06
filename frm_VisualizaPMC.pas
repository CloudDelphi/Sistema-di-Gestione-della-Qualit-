unit frm_VisualizaPMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormVisualizaPMC = class(TForm)
    dbgPMC: TDBGrid;
    Panel1: TPanel;
    lblCodigo: TLabel;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    btnImprimir: TBitBtn;
    zqryPMC: TZQuery;
    dspPMC: TDataSetProvider;
    cdsPMC: TClientDataSet;
    cdsPMCDescTipo: TStringField;
    cdsPMCDescOrig: TStringField;
    cdsPMCNomeEmit: TStringField;
    dsPMC: TDataSource;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    cdsColaboradorescodi_col: TLargeintField;
    CdsColaboradoresconc_col: TWideStringField;
    cdsColaboradoreseduc_col: TLargeintField;
    CdsColaboradoresesco_col: TWideStringField;
    cdsColaboradoresexpe_col: TLargeintField;
    cdsColaboradoresfunc_col: TLargeintField;
    CdsColaboradoresnome_col: TWideStringField;
    cdsColaboradoresproc_col: TLargeintField;
    cdsColaboradoresobs_col: TMemoField;
    cdsColaboradoresDescExpe: TStringField;
    cdsColaboradoresDescFunc: TStringField;
    CdsColaboradorescol_status1: TWideStringField;
    dsColaboradores: TDataSource;
    cdsPMCcaus_pmc: TWideMemoField;
    cdsPMCcodi_pmc: TLargeintField;
    cdsPMCdata_pmc: TDateTimeField;
    cdsPMCefic_pmc: TLargeintField;
    cdsPMCemit_pmc: TLargeintField;
    cdsPMCimed_pmc: TWideMemoField;
    cdsPMCncon_pmc: TWideMemoField;
    cdsPMCorig_pmc: TLargeintField;
    cdsPMCprcs_pmc: TLargeintField;
    cdsPMCproc_pmc: TLargeintField;
    cdsPMCrequ_pmc: TWideStringField;
    cdsPMCresp_pmc: TLargeintField;
    cdsPMCtipo_pmc: TLargeintField;
    cdsPMCvefi_pmc: TWideMemoField;
    cdsPMCnume_pmc: TWideStringField;
    cdsPMCpmc_datafecha: TDateTimeField;
    cdsPMCpmc_substituto: TWideStringField;
    cdsPMCultprazo: TDateTimeField;
    grp2: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl1: TLabel;
    cdsPMCprocesso: TWideStringField;
    btnPMC: TBitBtn;
    cdsPMCpmc_preveficacia: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure dbgPMCDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cdsPMCCalcFields(DataSet: TDataSet);
    procedure AtualizarDados();
    procedure btnPMCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoProcesso: string;
  end;

var
  FormVisualizaPMC: TFormVisualizaPMC;

implementation

uses frm_dm, frm_Tartaruga, Funcoes, frm_Inicial, frm_CadPMCFecha,
  frm_CadPMCAbre;

{$R *.dfm}

procedure TFormVisualizaPMC.AtualizarDados;
var
   sDataFiltroPMC: string;
   sWhere: string;
begin
   // Busca a data de filtro de PMC em parâmetros
   sDataFiltroPMC:= BuscarDataFiltroPMC('S');
   if (sDataFiltroPMC = '') or (sDataFiltroPMC = null) then begin
      sWhere:= '';
   end
   else begin
      sWhere:= ' AND data_pmc >= ' + ArrumaDataSQL(BuscarDataFiltroPMC());
   end;

   with cdsPMC do begin
      Active:= False;
      CommandText:= ' SELECT codi_pmc, data_pmc,' +
                    ' efic_pmc, emit_pmc, ncon_pmc,'+
                    ' orig_pmc, proc_pmc, resp_pmc, tipo_pmc,'+
                    ' prcs_pmc, imed_pmc, caus_pmc, vefi_pmc,'+
                    ' requ_pmc, nume_pmc, pmc_dataFecha, pmc_substituto, ' +
                    ' PR.nome_pro as Processo, pmc_preveficacia,' +
                    ' (SELECT MAX(aco_prazo) FROM pmc_acoes WHERE codi_pmc = P.codi_pmc) as ultprazo' +
                    ' FROM pmc P' +
                    ' INNER JOIN processos PR ON PR.codi_pro = P.prcs_pmc' +
                    ' WHERE prcs_pmc = ' + QuotedStr(Alltrim(sCodigoProcesso)) + sWhere +
                    ' ORDER BY data_pmc';
      Active:= True;
   end;
end;

procedure TFormVisualizaPMC.btnPMCClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      AbrirForm(TFormCadPMCAbre, FormCadPMCAbre);
   end;
end;

procedure TFormVisualizaPMC.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormVisualizaPMC.btnVisualizarClick(Sender: TObject);
begin
   if cdsPMC.RecordCount = 0 then begin
      Application.MessageBox('Não existem PMC para esse processo', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= cdsPMC.FieldByName('codi_pmc').AsString;
      FormCadPMCFecha.iTela:= 1;
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
   end;
end;

procedure TFormVisualizaPMC.cdsPMCCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT valo_com FROM tabela_combos'+
                    ' WHERE tipo_com = 4'+
                    ' And codi_com = ' + QuotedStr(cdsPMC.FieldByName('tipo_pmc').AsString);
      Active:= True;
      cdsPMC.FieldByName('DescTipo').AsString:= dm.cdsAuxiliar.FieldByName('valo_com').AsString
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT valo_com FROM tabela_combos'+
                    ' WHERE tipo_com = 5'+
                    ' And codi_com = ' + QuotedStr(cdsPMC.FieldByName('orig_pmc').AsString);
      Active:= True;
      cdsPMC.FieldByName('DescOrig').AsString:= dm.cdsAuxiliar.FieldByName('valo_com').AsString
   end;

//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT nome_col FROM colaboradores'+
//                    ' WHERE codi_col = ' + QuotedStr(cdsPMC.FieldByName('resp_pmc').AsString);
//      Active:= True;
//      cdsPMC.FieldByName('NomeResp').AsString:= dm.cdsAuxiliar.FieldByName('nome_col').AsString
//   end;
end;

procedure TFormVisualizaPMC.dbgPMCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if cdsPMC.FieldByName('efic_pmc').AsInteger = 1 then begin // Não Eficaz
      if cdsPMC.FieldByName('pmc_substituto').AsString = EmptyStr then begin
         dbgPMC.Canvas.Font.Color:= clRed;
      end;
   end;
   if cdsPMC.FieldByName('efic_pmc').AsInteger = 2 then begin // Aguardando Efiácia
      dbgPMC.Canvas.Font.Color:= clBlue;
      if gDSelected in State then begin
         dbgPMC.Canvas.Font.Color:= clWhite;
      end;
   end;

   // Atualiza a grid com as mudanças
   dbgPMC.DefaultDrawDataCell(Rect, dbgPMC.columns[datacol].field, State);
end;

procedure TFormVisualizaPMC.FormShow(Sender: TObject);
begin
   AtualizarDados();

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro from processos' +
                    ' WHERE codi_pro = ' + QuotedStr(sCodigoProcesso);
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;
end;

end.
