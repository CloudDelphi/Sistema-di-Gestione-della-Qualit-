unit frm_AlteraSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormAlteraSenha = class(TForm)
    pnl11: TPanel;
    sbSairMatriz: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    edtUsuario: TEdit;
    edtSenhaAtual: TEdit;
    lbl3: TLabel;
    edtNovaSenha: TEdit;
    lbl4: TLabel;
    edtConfSenha: TEdit;
    btnOk: TBitBtn;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    dsGravar: TDataSource;
    procedure sbSairMatrizClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    sSenhaAtual: string;
  public
    { Public declarations }
  end;

var
  FormAlteraSenha: TFormAlteraSenha;

implementation

uses
   frm_Inicial, Funcoes, frm_dm, frm_MsgErro;

{$R *.dfm}

procedure TFormAlteraSenha.btnOkClick(Sender: TObject);
begin
   if edtSenhaAtual.Text <> sSenhaAtual then begin
      Application.MessageBox('Senha atual incorreta', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtSenhaAtual);
      Exit;
   end;

   if edtNovaSenha.Text = EmptyStr then begin
      Application.MessageBox('Digite a nova senha', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtNovaSenha);
      Exit;
   end;

   if edtNovaSenha.Text = sSenhaAtual then begin
      Application.MessageBox('Nova senha não pode ser igual à senha atual', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtNovaSenha);
      Exit;
   end;

   if edtNovaSenha.Text <> edtConfSenha.Text then begin
      Application.MessageBox('Nova senha diferente da confirmação da senha', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtNovaSenha);
      Exit;
   end;

   try
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' UPDATE usuarios SET' +
                       ' senh_usu = ' + QuotedStr(edtNovaSenha.Text) +
                       ' WHERE nome_usu = ' + QuotedStr(cUsuario);
         Execute;
      end;

      Application.MessageBox('Senha alterada com sucesso', 'Aviso', MB_OK + MB_ICONINFORMATION);
      Self.Close;
   except
      on E: Exception do begin
         FormMsgErro:= TFormMsgErro.Create(nil);
         FormMsgErro.sErro      := 'Erro ao gravar nova senha.';
         FormMsgErro.sErroDelphi:= E.Message;
         FormMsgErro.ShowModal;
      end;
   end;
end;

procedure TFormAlteraSenha.FormShow(Sender: TObject);
begin
   edtUsuario.Text:= cUsuario;
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT senh_usu' +
                    ' FROM usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;

      sSenhaAtual:= FieldByName('senh_usu').AsString;
   end;

   TryFocus(edtSenhaAtual);
end;

procedure TFormAlteraSenha.sbSairMatrizClick(Sender: TObject);
begin
   Self.Close;
end;

end.
