unit frm_EmailAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFormEmailAuto = class(TForm)
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEmailAuto: TFormEmailAuto;

implementation

uses
   Funcoes;

{$R *.dfm}

procedure TFormEmailAuto.FormCreate(Sender: TObject);
begin
//   SetWindowPos(Self.handle, HWND_TOPMOST, Self.Left, Self.Top, Self.Width, Self.Height, 0);
end;

procedure TFormEmailAuto.FormPaint(Sender: TObject);
begin
   EnviarEmailAutomatico();
end;

end.
