unit frm_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient, Provider, DB, SqlExpr,
  Enter;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Panel1: TPanel;
    btnSair: TBitBtn;
    btnOk: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    teclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

uses frm_dm, Funcoes, frmSplash, frm_Inicial, frm_MsgErro,
  AtualizaBanco;

{$R *.dfm}

procedure TFormLogin.btnOkClick(Sender: TObject);
begin
   LoginOk:= True;
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_usu, senh_usu FROM usuarios'+
                    ' WHERE nome_usu = ' + QuotedStr(edtUsuario.Text) +
                    ' AND senh_usu = ' + QuotedStr(edtSenha.Text) ;
      Active:= True;
   end;

   if dm.cdsAuxiliar.RecordCount > 0 then begin
      cUsuario:= edtUsuario.Text;
      FormInicial.statPrincipal.Panels[1].Text:= 'USUÁRIO: ' + cUsuario;
      FormInicial.VerificarPendencias();
      Self.Close;
   end
   else begin
      Application.MessageBox('Usuário ou Senha não cadastrada. Acesso negado','Acesso negado',MB_OK+MB_ICONWARNING);
      LoginOk:= False;
      edtUsuario.SetFocus;
   end;
end;

procedure TFormLogin.btnSairClick(Sender: TObject);
begin
   dm.Conexao.Connected:= False;
   Application.Terminate;
end;

procedure TFormLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if Not (key in ['a'..'z', 'A'..'Z','0'..'9',#8,#13]) then begin
      key := #0;
   end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
   FreeAndNil(T_Splash);

//   if not FileExists(ExtractFilePath(Application.ExeName) + '\Destra.Ini') then begin
//      GravaIni('localhost');
//   end;

//   try
//      with dm.Conexao do begin
//         Connected:= False;
//         HostName := Decript(LeIni('IP'));
//         User     := Decript(LeIni('User'));
//         Password := Decript(LeIni('Senha'));
//         Database := Decript(LeIni('Database'));
//         Port     := StrToInt(Decript(LeIni('Porta')));
//         Connected:= True;
//      end;
//
////      with dm.Conexao do begin
////         Connected:= False;
////         HostName := LeConfig('IP');
////         User     := LeConfig('User');
////         Password := LeConfig('Senha');
////         Database := LeConfig('Database');
////         Connected:= True;
////      end;
//   except
//      on E: Exception do begin
//         FormMsgErro:= TFormMsgErro.Create(nil);
//         FormMsgErro.sErro       := 'Erro ao conectar o banco de dados. Verifique no arquivo Destra.ini se as configurações de IP e Senha estão corretas.';
//         FormMsgErro.sErroDelphi := E.Message;
//         FormMsgErro.ShowModal;
//         FormMsgErro.Release;
////         MostrarErro('Erro ao conectar o banco de dados. Verifique no arquivo Destra.ini se as configurações de IP e Senha estão corretas.',E.Message);
////         Application.MessageBox(PChar('Erro ao conectar o banco de dados. Verifique' + #13 + E.Message), 'Erro', MB_OK + MB_ICONSTOP);
//         Application.Terminate;
//      end;
//   end;

   teclaEnter             := TMREnter.Create(Self);
   teclaEnter.FocusEnabled:= True;
   teclaEnter.FocusColor  := clInfoBk;
end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
   TryFocus(edtUsuario);
end;

end.
