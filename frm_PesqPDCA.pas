unit frm_PesqPDCA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormPesqPDCA = class(TForm)
    pnl1: TPanel;
    dbgManutencao: TDBGrid;
    btnSelecionar: TBitBtn;
    zqryPDCA: TZQuery;
    dspPDCA: TDataSetProvider;
    cdsPDCA: TClientDataSet;
    dsPDCA: TDataSource;
    btnSair: TBitBtn;
    cdsPDCApdca_codigo: TIntegerField;
    cdsPDCApdca_identificacao: TWideStringField;
    cdsPDCApdca_data: TDateTimeField;
    cdsPDCApdca_descricao: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cdsPDCACalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesqPDCA: TFormPesqPDCA;

implementation

uses frm_dm, frm_CadIndicadores;

{$R *.dfm}

procedure TFormPesqPDCA.btnSelecionarClick(Sender: TObject);
begin
   FormCadIndicadores.edtPDCA.Text:= cdsPDCA.FieldByName('pdca_identificacao').AsString;
   btnSairClick(Self);
end;

procedure TFormPesqPDCA.cdsPDCACalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT desc_inf, iden_inf from infraestrutura'+
                    ' WHERE codi_inf = ' + QuotedStr(cdsPDCA.FieldByName('codi_inf').AsString);
      Active:= True;
      cdsPDCA.FieldByName('DescItem').AsString:= dm.cdsAuxiliar.FieldByName('desc_inf').AsString;
      cdsPDCA.FieldByName('IdentItem').AsString:= dm.cdsAuxiliar.FieldByName('iden_inf').AsString;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro from processos'+
                    ' WHERE codi_pro = ' + QuotedStr(cdsPDCA.FieldByName('proc_man').AsString);
      Active:= True;
      cdsPDCA.FieldByName('DescProcesso').AsString:= dm.cdsAuxiliar.FieldByName('nome_pro').AsString;
   end;
end;

procedure TFormPesqPDCA.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPesqPDCA.FormShow(Sender: TObject);
begin
   with cdsPDCA do begin
      Active:= False;
      CommandText:= ' SELECT pdca_codigo, pdca_identificacao, pdca_data, pdca_descricao' +
                    ' FROM pdca';
      Active:= True;
   end;
end;

end.
