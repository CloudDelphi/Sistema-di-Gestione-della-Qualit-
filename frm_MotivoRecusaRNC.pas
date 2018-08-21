unit frm_MotivoRecusaRNC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TFormMotivoRecusaRNC = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    lbl12: TLabel;
    mmoRecusa: TMemo;
    lbl2: TLabel;
    lbl5: TLabel;
    edtIdentificacao: TEdit;
    dtData: TDateEdit;
    lbl1: TLabel;
    mmoDisposicao: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure PrepararEmail();
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoRNC: string;
    sRespRNC  : string;
  end;

var
  FormMotivoRecusaRNC: TFormMotivoRecusaRNC;

implementation

uses
   frm_CadRNCFecha, Funcoes;

{$R *.dfm}

procedure TFormMotivoRecusaRNC.btnGravarClick(Sender: TObject);
begin
   if AllTrim(mmoRecusa.Text) <> '' then begin
      GravarHistoricoRNC(sCodigoRNC, 'DISPOSIÇÃO RECUSADA', mmoDisposicao.Text, mmoRecusa.Text);
      FormCadRNCFecha.iRecusaPreenchida:= 1;
      PrepararEmail();
      Self.Close;
   end
   else begin
      Application.MessageBox('Digite o motivo da recusa da disposição', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoRecusa);
   end;
end;

procedure TFormMotivoRecusaRNC.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormMotivoRecusaRNC.PrepararEmail;
var
   sTextoEmail: string;
begin
   if VerificarConexaoInternet(True) then begin
      sTextoEmail:= 'O RNC abaixo teve a disposição recusada: <br><br>' +
                    '<b>RNC:</b> ' + edtIdentificacao.Text + '<br>' +
                    '<b>Data RNC:</b> ' + dtData.Text + '<br>' +
                    '<b>Disposição:</b> ' + mmoDisposicao.Text + '<br>' +
                    '<b>Motivo da Recusa:</b> ' + mmoRecusa.Text +
                    '<br><br>'+
                    'Acesse o sistema Destra Manager para maiores detalhes.';

      if BuscarEmail(sRespRNC) = '' then begin
//         if Application.MessageBox(PChar('O colaborador ' + dblEmitido.Text + ' não tem e-mail cadastrado no Cadastro de Colaboradores.' + #13#10 + 'Deseja cadastrar o e-mail antes de enviar ?'), 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
//            edtEmail.Enabled:= True;
//            AbrePanel(pnlEmail, Self);
//            lblNomeCol.Caption:= dblEmitido.Text;
//            TryFocus(edtEmail);
//         end;
      end
      else begin
         EnviarEmail(sTextoEmail, 'RNC Alterado', BuscarEmail(sRespRNC), 'sistema', 'N');
      end;
   end;
end;

end.
