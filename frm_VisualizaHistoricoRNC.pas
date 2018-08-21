unit frm_VisualizaHistoricoRNC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TFormVisualizaHistoricoRNC = class(TForm)
    pnl1: TPanel;
    btnSair: TBitBtn;
    lbl12: TLabel;
    mmoRecusa: TMemo;
    lbl2: TLabel;
    dtData: TDateEdit;
    lbl1: TLabel;
    mmoDisposicao: TMemo;
    lbl7: TLabel;
    edtHistorico: TEdit;
    edtUsuario: TEdit;
    lbl3: TLabel;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoRNC: string;
  end;

var
  FormVisualizaHistoricoRNC: TFormVisualizaHistoricoRNC;

implementation

uses
   frm_CadRNCFecha, Funcoes;

{$R *.dfm}

procedure TFormVisualizaHistoricoRNC.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

end.
