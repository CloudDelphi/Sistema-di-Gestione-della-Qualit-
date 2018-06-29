unit frm_VisualizaPDCA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ComCtrls, Gauges, JvProgressBar, JvExComCtrls, LMDControl, LMDCustomControl,
  LMDBiProgressBar;

type
  TFormVisualizaPDCA = class(TForm)
    dbgPDCA: TDBGrid;
    Panel1: TPanel;
    lblCodigo: TLabel;
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
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    zqryPDCA: TZQuery;
    dspPDCA: TDataSetProvider;
    cdsPDCA: TClientDataSet;
    dsPDCA: TDataSource;
    cdsPDCApdca_codigo: TIntegerField;
    cdsPDCApdca_identificacao: TWideStringField;
    cdsPDCApdca_data: TDateTimeField;
    cdsPDCApdca_descricao: TWideStringField;
    cdsPDCApdca_origem: TIntegerField;
    cdsPDCApdca_processo: TIntegerField;
    cdsPDCApdca_emitido: TIntegerField;
    cdsPDCAultprazo: TDateTimeField;
    cdsPDCAdescorigem: TWideStringField;
    cdsPDCAlancfinalizado: TLargeintField;
    cdsPDCAtotallanc: TLargeintField;
    cdsPDCApercentual: TFloatField;
    btnSair: TBitBtn;
    btnVisualizar: TBitBtn;
    btnImprimir: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure AtualizarDados();
    procedure dbgPDCADrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsPDCACalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoProcesso: string;
  end;

var
  FormVisualizaPDCA: TFormVisualizaPDCA;

implementation

uses frm_dm, frm_Tartaruga, Funcoes, frm_Inicial, frm_CadPMCFecha, frm_PDCA;

{$R *.dfm}

procedure TFormVisualizaPDCA.AtualizarDados;
begin
   with cdsPDCA do begin
      Active:= False;
      CommandText:= ' SELECT pdca_codigo, pdca_identificacao, pdca_data, pdca_descricao, pdca_origem,' +
                    '        pdca_processo, pdca_emitido,' +
                    '        (SELECT MAX(lan_quando) FROM pdca_lanc WHERE pdca_codigo = P.pdca_codigo) as ultprazo,' +
                    '        TC.valo_com as DescOrigem, ' +
                    ' (SELECT Count(*) as LancFinalizado FROM pdca_lanc WHERE pdca_codigo = P.pdca_codigo and lan_dtfinalizado is not null), ' +
                    ' (SELECT Count(*) as TotalLanc FROM pdca_lanc WHERE pdca_codigo = P.pdca_codigo) ' +
                    ' FROM pdca P' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 27 and TC.codi_com = P.pdca_origem' +
                    ' WHERE pdca_processo = ' + QuotedStr(Alltrim(sCodigoProcesso)) +
                    ' Order By pdca_identificacao';
      Active:= True;
   end;
end;

procedure TFormVisualizaPDCA.btnSairClick(Sender: TObject);
begin
   FormTartaruga.VerificaPendencias;
   Self.Close;
end;

procedure TFormVisualizaPDCA.btnVisualizarClick(Sender: TObject);
begin
   if cdsPDCA.RecordCount = 0 then begin
      Application.MessageBox('Não existe PDCA para esse processo', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      if Acesso(cUsuario, 44, 'acesso') = 1 then begin
         FormPDCA:= TFormPDCA.Create(nil);
         FormPDCA.sCodigoPDCA:= cdsPDCA.FieldByName('pdca_codigo').AsString;
         FormPDCA.iTela:= 1;
         FormPDCA.ShowModal;
         FormPDCA.Release;
         AtualizarDados();
      end;
   end;
end;

procedure TFormVisualizaPDCA.cdsPDCACalcFields(DataSet: TDataSet);
begin
   cdsPDCA.FieldByName('percentual').AsFloat:= cdsPDCA.FieldByName('lancfinalizado').AsFloat / cdsPDCA.FieldByName('totallanc').AsFloat * 100;
end;

procedure TFormVisualizaPDCA.dbgPDCADrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   NovoGauge: TGauge;
   NovoProgressBar: TProgressBar; //Declare a Unit " ComCtrls " na seção Uses
   NovoProgressBarLMD: TLMDBiProgressBar;
begin
   if Column.Field.FieldName = 'percentual' then begin
      NovoProgressBarLMD:= TLMDBiProgressBar.Create(dbgPDCA);

      with NovoProgressBarLMD do begin
         DarkValue:= cdsPDCA.FieldByName('percentual').AsInteger;
         if cdsPDCA.FieldByName('totallanc').AsInteger = 0 then begin
            Caption:= '0%';
         end
         else begin
            Caption:= FloatToStr(RoundNExtend(cdsPDCA.FieldByName('percentual').AsFloat, 2)) + '%';
         end;
         Smooth:= True;
         Parent:= Self;
         Width := Rect.Right - Rect.Left + 1;
         Height:= Rect.Bottom - Rect.Top + 1;
         PaintTo(dbgPDCA.Canvas.Handle, Rect.Left, Rect.Top);

         FreeAndNil(NovoProgressBarLMD);
      end;
   end;

//   if Column.Field.FieldName = 'gauge' then begin
//      NovoProgressBar:= TProgressBar.Create(dbgPDCA);
//
//      with NovoProgressBar do begin
//         Position:= 60;
//
//         Smooth:= True;
//         Parent:= Self;
//         Width := Rect.Right - Rect.Left + 1;
//         Height:= Rect.Bottom - Rect.Top + 1;
//         PaintTo(dbgPDCA.Canvas.Handle, Rect.Left, Rect.Top);
//
//         FreeAndNil(NovoProgressBar);
//      end;
//   end;

//   if Column.Field.FieldName = 'gauge' then begin
//      NovoGauge:= TGauge.Create(dbgPDCA);
//
//      with NovoGauge do begin
//         Progress:= 60;
//
//         Parent:= Self;
//         Width := Rect.Right - Rect.Left + 1;
//         Height:= Rect.Bottom - Rect.Top + 1;
//         PaintTo(dbgPDCA.Canvas.Handle, Rect.Left, Rect.Top);
//
//         FreeAndNil(NovoGauge);
//      end;
//   end;
end;

procedure TFormVisualizaPDCA.FormShow(Sender: TObject);
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
