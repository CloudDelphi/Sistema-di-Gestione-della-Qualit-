unit frm_pesqLira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormPesqLira = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    lbl9: TLabel;
    edtValor: TEdit;
    lbl10: TLabel;
    cbCampo: TComboBox;
    dbgClientes: TDBGrid;
    zqryLira: TZQuery;
    dspLira: TDataSetProvider;
    cdsLira: TClientDataSet;
    cdsLiralir_codigo: TLargeintField;
    cdsLiralir_identificacao: TWideStringField;
    cdsLiralir_descricao: TWideStringField;
    dsLira: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure edtValorChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure Selecionar();
    procedure dbgClientesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iTela: Integer;
  end;

var
  FormPesqLira: TFormPesqLira;

implementation

uses frm_Laaia, frm_Perigos;

{$R *.dfm}

procedure TFormPesqLira.AtualizarDados;
begin
   with cdsLira do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormPesqLira.btnGravarClick(Sender: TObject);
begin
   Selecionar();
end;

procedure TFormPesqLira.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPesqLira.dbgClientesDblClick(Sender: TObject);
begin
   Selecionar();
end;

procedure TFormPesqLira.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsLira.Locate('lir_identificacao', edtValor.Text, [loPartialKey]);
      1: cdsLira.Locate('lir_descricao', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormPesqLira.FormShow(Sender: TObject);
begin
   AtualizarDados();
   iTela:= Self.Tag;
end;

procedure TFormPesqLira.Selecionar;
begin
   if FormLaaia <> nil then begin
      FormLaaia.edtIdentLei.Text:= cdsLira.FieldByName('lir_identificacao').AsString;
      FormLaaia.edtDescLei.Text := cdsLira.FieldByName('lir_descricao').AsString;
   end;
//   if iTela = 2 then begin
   if FormPerigos <> nil then begin
      FormPerigos.edtIdentLei.Text:= cdsLira.FieldByName('lir_identificacao').AsString;
      FormPerigos.edtDescLei.Text := cdsLira.FieldByName('lir_descricao').AsString;
   end;
   Self.Close;
end;

end.
