unit uAtivaSistema;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, uAncestral, StdCtrls, RXCtrls, jpeg, ExtCtrls, Buttons, ActnList;

type
   TFormAtivaSistema = class(TfrmAncestral)
      Panel1: TPanel;
      Label1: TLabel;
      edtCodigo: TEdit;
      edtRegistrar: TEdit;
      lblRegistrar: TLabel;
      btnRegistrar: TBitBtn;
    pnl1: TPanel;
    btnSair: TBitBtn;
      procedure btnSairClick(Sender: TObject);
      procedure btnRegistrarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FormAtivaSistema: TFormAtivaSistema;

implementation

uses Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormAtivaSistema.btnSairClick(Sender: TObject);
begin
   inherited;
   Close; // Application.Terminate;
end;

procedure TFormAtivaSistema.btnRegistrarClick(Sender: TObject);
var
   DataLimite: String;
begin
   inherited;

   if edtRegistrar.Text = EmptyStr then begin
      // edtRegistrar.Text := GeraChave(edtCodigo.Text, True)
      Application.MessageBox('Informe a Chave de Ativação fornecida!', 'Atenção', MB_OK + MB_ICONWARNING);
      TryFocus(edtRegistrar);
      Exit;
   end
   else begin
      try
         if VerificaChave(edtRegistrar.Text) then begin
            DataLimite := DateToStr(RetDataChave(edtRegistrar.Text));
            // GravarRegistro('\Software\SystemEnvironment','Preventiva',Cript(RetNumSerieHD(True) + RetWinPath) + Cript('31/12/2999'));
//            GravarRegistro('\Software\SystemEnvironment', 'Preventiva',
//              Cript(RetNumSerieHD(True) + RetWinPath) + Cript(DataLimite));
//            GravarRegistro(frm_Principal.pathReg, 'Chave', Cript(RetNumSerieHD(True) + RetWinPath) + Cript(DataLimite));
            GravarRegistroNovo(Cript(RetNumSerieHD(True) + RetWinPath) + Cript(DataLimite));

            if DataLimite = '31/12/2999' then begin
               Application.MessageBox(PChar('PARABÉNS!' + #13 + #13 +
                 'O sistema ' + frm_Inicial.nomeSistema + ' foi registrado com sucesso neste computador.'),
                 'Confirmação', MB_OK + MB_ICONINFORMATION)
            end
            else begin
               Application.MessageBox
                 (PChar('PARABÉNS!' + #13 + #13 +
                 'O sistema ' + frm_Inicial.nomeSistema + ' foi registrado com sucesso neste computador.'
                 + #13 + 'A licença adquirida permite sua utilização até ' +
                 DataLimite + '.'), 'Confirmação', MB_OK + MB_ICONINFORMATION);
            end;
            ModalResult := mrOk;
            Application.Terminate;
//            formPrincipal.FormShow(Self);
         end;
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro na tentativa de Ativação!' + #13 + E.Message ),'Erro ao registrar', mb_ok + mb_iconerror);
         end;
      end;
   end;
end;

procedure TFormAtivaSistema.FormShow(Sender: TObject);
begin
   inherited;
   edtCodigo.Text := GeraChave(RetNumSerieHD(True));
end;

initialization

RegisterClasses([TFormAtivaSistema]);

end.
