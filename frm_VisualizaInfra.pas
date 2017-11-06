unit frm_VisualizaInfra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormVisualizaInfra = class(TForm)
    lblCodigo: TLabel;
    Panel1: TPanel;
    dbgInfra: TDBGrid;
    zqryInfra: TZQuery;
    dspInfra: TDataSetProvider;
    cdsInfra: TClientDataSet;
    cdsInfraDescTipo: TStringField;
    cdsInfraDescProc: TStringField;
    cdsInfracodi_inf: TLargeintField;
    CdsInfradesc_inf1: TWideStringField;
    CdsInfraiden_inf1: TWideStringField;
    cdsInfraproc_inf: TLargeintField;
    cdsInfraqtde_inf: TLargeintField;
    cdsInfraseto_inf: TLargeintField;
    cdsInfratipo_inf: TLargeintField;
    dsInfra: TDataSource;
    cdsInframanu_inf: TIntegerField;
    btnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cdsInfraCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoProcesso: string;
  end;

var
  FormVisualizaInfra: TFormVisualizaInfra;

implementation

uses frm_dm, frm_Inicial;

{$R *.dfm}

procedure TFormVisualizaInfra.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormVisualizaInfra.cdsInfraCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select nome_pro from processos'+
                    ' Where codi_pro = ' + QuotedStr(cdsInfra.FieldByName('proc_inf').AsString);
      Active:= True;
      cdsInfra.FieldByName('DescProc').AsString:= dm.cdsAuxiliar.FieldByName('nome_pro').AsString
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select valo_com from tabela_combos'+
                    ' Where tipo_com = 8'+
                    ' And codi_com = ' + QuotedStr(cdsInfra.FieldByName('tipo_inf').AsString);
      Active:= True;
      cdsInfra.FieldByName('DescTipo').AsString:= dm.cdsAuxiliar.FieldByName('valo_com').AsString
   end;
end;

procedure TFormVisualizaInfra.FormShow(Sender: TObject);
begin
   with cdsInfra do begin
      Active:= False;
      CommandText:= ' SELECT * '+
                    ' FROM infraestrutura' +
                    ' WHERE proc_inf = ' + QuotedStr(sCodigoProcesso);
      Active:= True;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro from processos' +
                    ' WHERE codi_pro = ' + QuotedStr(sCodigoProcesso);
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;
end;

end.
