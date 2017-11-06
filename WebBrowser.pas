unit WebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, StdCtrls, Buttons;

type
  TFormWebBrowser = class(TForm)
    wb1: TWebBrowser;
    pnl37: TPanel;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    url: string;
  end;

var
  FormWebBrowser: TFormWebBrowser;


implementation

{$R *.dfm}

procedure TFormWebBrowser.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormWebBrowser.FormShow(Sender: TObject);
begin
   wb1.navigate(url);
end;

end.
