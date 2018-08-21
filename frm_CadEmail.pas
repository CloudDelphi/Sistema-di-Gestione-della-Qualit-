unit frm_CadEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormCadEmail = class(TForm)
    lbl17: TLabel;
    lblNomeCol: TLabel;
    lbl15: TLabel;
    edtEmail: TEdit;
    pnl5: TPanel;
    btnSairEmail: TBitBtn;
    btnGravarEmail: TBitBtn;
    procedure btnGravarEmailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodColab: string;
  end;

var
  FormCadEmail: TFormCadEmail;

implementation

uses
   Funcoes, frm_CadPMCAbre;

{$R *.dfm}

procedure TFormCadEmail.btnGravarEmailClick(Sender: TObject);
begin
   Executar(' UPDATE colaboradores' +
           ' SET col_email = ' + QuotedStr(edtEmail.Text) +
           ' WHERE codi_col = ' + QuotedStr(sCodColab)
           );

   Self.Hide;
   FormCadPMCAbre.PrepararEmail();
   Self.Close;
end;

end.
