unit frmSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, jpeg, Buttons, ShellAPI, FMTBcd, DBClient,
  Provider, DB, SqlExpr, WideStrings, JvExExtCtrls, JvExtComponent, JvPanel,
  LMDPNGImage;

type
  Tt_Splash = class(TForm)
    Panel1: TPanel;
    img1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Splash: Tt_Splash;

implementation

uses Funcoes, frm_dm, frm_Login;

{$R *.DFM}

procedure Tt_Splash.FormCreate(Sender: TObject);
begin
//   ShowMessage('11');
end;

procedure Tt_Splash.FormShow(Sender: TObject);
begin
//   ShowMessage('12');
end;

end.
