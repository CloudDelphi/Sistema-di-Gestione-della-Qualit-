unit frm_MsgErro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, dxGDIPlusClasses, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze,
  OleCtrls, SHDocVw;

type
  TFormMsgErro = class(TForm)
    pnl1: TPanel;
    btnSair: TBitBtn;
    pnlErro: TPanel;
    lblErro2: TLabel;
    pnl2: TPanel;
    lblErro: TLabel;
    img1: TImage;
    shp1: TShape;
    lbl1: TLabel;
    img2: TImage;
    wb1: TWebBrowser;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure EnviarEmail;
  private
    { Private declarations }
  public
    { Public declarations }
    sErro: string;
    sErroDelphi: string;
    sNomeEmpresa: string;
    sFormulario: string;
  end;

var
  FormMsgErro: TFormMsgErro;

implementation

uses Funcoes;

{$R *.dfm}

procedure TFormMsgErro.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormMsgErro.FormShow(Sender: TObject);
var
   sTexto: string;
   sData: string;
   Componente: TWinControl;
   sNomeComponente: string;
begin
   lblErro.Width:= 490;
   lblErro2.Width:= 520;
   lblErro.Caption:= sErro;
   lblErro2.Caption:= sErroDelphi;

   sData     := DateTimeToStr(Date());
   Componente:= Screen.ActiveControl;

   if Componente = nil then begin
      sNomeComponente:= '';
   end
   else begin
      sNomeComponente:= Componente.Name;
   end;

   sTexto:= '<b>Empresa:</b> ' + sNomeEmpresa + #13 + #13 + '<br>' +
            '<b>Formulário:</b> ' + sFormulario + #13 + '<br>' +
            '<b>Componente:</b> ' + sNomeComponente + #13 + '<br>' +
            '<b>Data/Hora:</b> ' + sData + ' - ' + TimeToStr(Time()) + #13 +'<br>' +
            '<b>Descricao:</b> ' + lblErro.Caption + #13 + '<br>' +
            '<b>Erro:</b> ' + lblErro2.Caption;

   if VerificarConexaoInternet(False) then begin
//      EnviarEmail(sTexto, 'Erro Destra Manager', 'erro@destraconsultoria.com.br', 'destra');
      wb1.Navigate('www.destraconsultoria.com.br/enviar.php?texto=' + sTexto + '&para=erro@destraconsultoria.com.br&assunto=Erro Sistema');
   end;
end;

end.
