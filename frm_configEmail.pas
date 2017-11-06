unit frm_configEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, IdSMTP, IdMessage, IdSSLOpenSSL,
  IdMessageClient, IdExplicitTLSClientServerBase, IdSMTPBase,
  IdText, IdBaseComponent, IdComponent, IdSASL, IdIOHandler, IdIOHandlerSocket;

type
  TFormConfigEmail = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    Label2: TLabel;
    edtSMTP: TEdit;
    edtPorta: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtEmailRemetente: TEdit;
    Label5: TLabel;
    edtSenha: TEdit;
    chkAutenticacao: TCheckBox;
    zqryConfigEmail: TZQuery;
    dspConfigEmail: TDataSetProvider;
    cdsConfigEmail: TClientDataSet;
    dsConfigEmail: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    cdsConfigEmailsmtp: TWideStringField;
    cdsConfigEmailporta: TWideStringField;
    cdsConfigEmailemail: TWideStringField;
    cdsConfigEmailsenha: TWideStringField;
    cdsConfigEmailautenticacao: TLargeintField;
    cdsConfigEmailremetente: TWideStringField;
    btnTestar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados();
    procedure PreencherCampos();
    procedure Botoes(Flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormConfigEmail: TFormConfigEmail;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormConfigEmail.AtualizarDados;
begin
   with cdsConfigEmail do begin
      Active:= False;
      CommandText:= ' SELECT smtp, porta, email, senha, autenticacao, remetente' +
                    ' FROM config_email';
      Active:= True;
   end;
end;

procedure TFormConfigEmail.Botoes(Flag: Boolean);
begin
   btnAlterar.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
end;

procedure TFormConfigEmail.btnTestarClick(Sender: TObject);
var
   IdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
   Screen.Cursor:= crHourGlass;
   // Busca os dados da configuração de e-mail
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT smtp, porta, email, senha, autenticacao, remetente' +
                    ' FROM config_email';
      Active:= True;
   end;

   with dm.SMTP do begin
      Host     := dm.cdsAuxiliar.FieldByName('smtp').AsString;
      Username := dm.cdsAuxiliar.FieldByName('email').AsString;
      Password := dm.cdsAuxiliar.FieldByName('senha').AsString;
      Port     := dm.cdsAuxiliar.FieldByName('porta').AsInteger;

      if dm.cdsAuxiliar.FieldByName('autenticacao').AsInteger = 1 then begin
         AuthType  := satDefault
      end
      else begin
         AuthType  := satNone;
      end;

      try
         IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
         IOHandler := IdSSL;
//         UseTLS := utUseImplicitTLS;
         UseTLS := utUseExplicitTLS;
      except
         on E: Exception do begin
            IOHandler := TIdIOHandler.MakeDefaultIOHandler(nil);
            UseTLS := utNoTLSSupport;
         end;
       end;
      if Assigned(IdSSL) then begin
        IdSSL.SSLOptions.Method := sslvSSLv3;
        IdSSL.SSLOptions.Mode := sslmClient;
      end;

      ConnectTimeout:= 5000;
      ReadTimeout   := 5000;
   end;

   with dm.Msg do begin
      ContentType := 'text/html'; // Envia no formato HTML
      CharSet     := 'ISO-8859-1'; // Envia com acentuação

      // Informações "de quem está enviando"
      From.Name         := 'Destra Manager';
      From.Address      := dm.cdsAuxiliar.FieldByName('email').AsString;
      From.DisplayName  := 'Teste Destra Manager';

      // Informações "Para quem está enviando"
      Subject                   := 'Teste Destra Manager';
      Sender.Address            := dm.cdsAuxiliar.FieldByName('email').AsString;
      Sender.Name               := 'Destra Manager';
      Recipients.EMailAddresses := dm.cdsAuxiliar.FieldByName('email').AsString;
//      ReplyTo                   := 'daniel@destraconsultoria.com.br';

      // Informações da mensagem
      Body.Text := ' Teste e-mail Destra Manager' + #13 + #13 +
                   ' A configuração de e-mail foi feita corretamente.';

      // Prioridade da mensagem
      Priority := mpHighest;

      // Insira os anexos caso possua
      MessageParts.Clear;
   end;

   try
      // Conecte ao Servidor
         if not dm.SMTP.Connected then begin
            dm.SMTP.Connect();
            dm.SMTP.Send(dm.Msg);
//            dm.SMTP.Disconnect;
         end;

         Application.MessageBox('Configuração correta !', 'Informação', MB_OK + MB_ICONINFORMATION);
         dm.SMTP.Disconnect();
   except
      on E: Exception do begin
//         Application.MessageBox(PChar('Erro na configuração !' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONINFORMATION);
         if (Pos(UpperCase('Credentials Rejected'), UpperCase(E.Message)) > 0) then begin
            MostrarErro('Erro ao enviar E-Mail! Login ou Senha inválidos',E.Message,Self.Name);
//            Application.MessageBox('Erro ao enviar E-Mail! Login ou Senha inválidos', 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('Host not found'), UpperCase(E.Message)) > 0) then begin
            MostrarErro(PChar('Erro ao enviar e-mail. O Servidor "' + dm.SMTP.Host + '" não foi encontrado'),E.Message,Self.Name);
//            Application.MessageBox(PChar('Erro ao enviar e-mail. O Servidor "' + dm.SMTP.Host + '" não foi encontrado'), 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('Connection timed out'), UpperCase(E.Message)) > 0) then begin
            MostrarErro(PChar('Erro ao enviar e-mail. O servidor "' + dm.SMTP.Host +
            '" demorou a responder, verifique se a porta para conexão está correta!'),E.Message,Self.Name);
//            Application.MessageBox(PChar('Erro ao enviar e-mail. O servidor "' + dm.SMTP.Host +
//            '" demorou a responder, verifique se a porta para conexão está correta!'), 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('read timeout'), UpperCase(E.Message)) > 0) then begin
            MostrarErro(PChar('Erro ao enviar e-mail. O servidor "' + dm.SMTP.Host +
            '" demorou a responder, talvez o mesmo requeira uma Conexão SSL segura!'),E.Message,Self.Name);
//            Application.MessageBox(PChar('Erro ao enviar e-mail. O servidor "' + dm.SMTP.Host +
//            '" demorou a responder, talvez o mesmo requeira uma Conexão SSL segura!'), 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('connection closed'), UpperCase(E.Message)) > 0) then begin
            MostrarErro('Erro ao enviar e-mail. A conexão com o servidor de e-mail foi fechada. Envio cancelado',E.Message,Self.Name);
//            Application.MessageBox('Erro ao enviar e-mail. Envio cancelado', 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('Incorrect authentication data'), UpperCase(E.Message)) > 0) then begin
            MostrarErro('Erro ao enviar e-mail. Verifique o Nome da Conta e Senha',E.Message,Self.Name);
//            Application.MessageBox('Erro ao enviar e-mail. Verifique o Nome da Conta e Senha', 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('Invalid HELO'), UpperCase(E.Message)) > 0) then begin
            MostrarErro('Erro ao enviar e-mail. Verifique se o campo "Meu servidor requer autenticação" está marcado corretamente',E.Message,Self.Name);
//            Application.MessageBox('Erro ao enviar e-mail. Verifique se o campo "Meu servidor requer autenticação" está marcado corretamente', 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else if (Pos(UpperCase('Authentication Failed'), UpperCase(E.Message)) > 0) then begin
            MostrarErro('Erro ao enviar e-mail. Verifique se o e-mail e senha está correto',E.Message,Self.Name);
//            Application.MessageBox('Erro ao enviar e-mail. Verifique se o e-mail e senha está correto', 'Aviso', MB_OK + MB_ICONWARNING);
         end
         else begin
            MostrarErro('Erro ao enviar e-mail. O erro não pode ser identificado' ,E.Message,Self.Name);
//            Application.MessageBox('Erro ao enviar e-mail', 'Aviso', MB_OK + MB_ICONWARNING);
         end;
      end;
   end;
   Screen.Cursor:= crDefault;
end;

procedure TFormConfigEmail.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 29, 'alteracao') = 1) then begin
      Botoes(False);
      HabilitarCampos(True);
      TryFocus(edtSMTP);
   end;
end;

procedure TFormConfigEmail.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
   HabilitarCampos(False);
end;

procedure TFormConfigEmail.btnGravarClick(Sender: TObject);
var
   sAutenticacao: string;
begin
   if Acesso(cUsuario, 1, 'cadastro') = 1 then begin
      try
         if chkAutenticacao.Checked = True then begin
            sAutenticacao:= '1';
         end
         else begin
            sAutenticacao:= '0';
         end;

         with cdsConfigEmail do begin
            Active:= False;
            CommandText:= ' SELECT * from config_email';
            Active:= True;

            if RecordCount > 0 then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE config_email SET' +
                                ' smtp = ' + QuotedStr(edtSMTP.Text) + ',' +
                                ' porta = ' + QuotedStr(edtPorta.Text) + ',' +
                                ' email = ' + QuotedStr(edtEmailRemetente.Text) + ',' +
                                ' senha = ' + QuotedStr(edtSenha.Text) + ',' +
                                ' autenticacao = ' + QuotedStr(sAutenticacao) + ',' +
                                ' remetente = ' + QuotedStr(edtEmailRemetente.Text);
                  Execute;
               end;
            end
            else begin
               with cdsConfigEmail do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO config_email (smtp, porta, email, senha, autenticacao, ' +
                                ' remetente)' +
                                ' VALUES(' +
                                QuotedStr(edtSMTP.Text) + ',' +
                                QuotedStr(edtPorta.Text) + ',' +
                                QuotedStr(edtEmailRemetente.Text) + ',' +
                                QuotedStr(edtSenha.Text) + ',' +
                                QuotedStr(sAutenticacao) + ',' +
                                QuotedStr(edtEmailRemetente.Text) +
                                ')';
                  Execute;
               end;
            end;
         end;

         HabilitarCampos(False);
         Botoes(True);

         Application.MessageBox('Configuração de e-mail cadastrada corretamente','Sucesso',MB_OK+MB_ICONINFORMATION);
      except
         on E: Exception do begin
            MostrarErro('Erro na gravação da configuração do e-mail', E.Message, Self.Name);
         end;
      end;
   end;
end;

procedure TFormConfigEmail.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormConfigEmail.FormShow(Sender: TObject);
begin
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False);
end;

procedure TFormConfigEmail.HabilitarCampos(Flag: Boolean);
begin
   edtEmailRemetente.Enabled:= Flag;
   edtSMTP.Enabled          := Flag;
   edtPorta.Enabled         := Flag;
//   edtNomeConta.Enabled     := Flag;
   edtSenha.Enabled         := Flag;
   chkAutenticacao.Enabled  := Flag;
end;

procedure TFormConfigEmail.PreencherCampos;
begin
   with cdsConfigEmail do begin
      edtEmailRemetente.Text  := FieldByName('Remetente').AsString;
      edtSMTP.Text            := FieldByName('SMTP').AsString;
      edtPorta.Text           := FieldByName('Porta').AsString;
//      edtNomeConta.Text       := FieldByName('Email').AsString;
      edtSenha.Text           := FieldByName('Senha').AsString;
      if FieldByName('Autenticacao').AsInteger = 0 then begin
         chkAutenticacao.Checked := False;
      end
      else begin
         chkAutenticacao.Checked := True;
      end;
   end;
end;

end.
