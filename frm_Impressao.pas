unit frm_Impressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormImpressao = class(TForm)
    rgOrdemImpressao: TRadioGroup;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormImpressao: TFormImpressao;

implementation

uses frm_CadImpactosAmb;

{$R *.dfm}

procedure TFormImpressao.btnSairImpClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormImpressao.btnVideoClick(Sender: TObject);
begin
   FormCadImpactos.Impressao('V');
end;

end.
