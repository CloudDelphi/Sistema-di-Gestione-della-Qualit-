unit frm_Sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, JvExControls, JvLinkLabel, ShellAPI,
  jpeg, LMDPNGImage, dxGDIPlusClasses;

type
  TFormSobre = class(TForm)
    pnl1: TPanel;
    mmoAjuda: TMemo;
    imgLogotipo: TImage;
    LinkLabel2: TLinkLabel;
    lbl1: TLabel;
    LinkLabel1: TLinkLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnSair: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
    procedure lbl2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbl3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

uses frm_Inicial;

{$R *.dfm}

procedure TFormSobre.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormSobre.FormShow(Sender: TObject);
begin
   mmoAjuda.Clear;
   mmoAjuda.Lines.Add('DESTRA MANAGER');
   mmoAjuda.Lines.Add('Versão ' + FormInicial.versao);
   mmoAjuda.Lines.Add('PostgreSQL');
   mmoAjuda.Lines.Add('');
   mmoAjuda.Lines.Add('Copyright 2009-' + FormatDateTime('yyyy',date()));
   mmoAjuda.Lines.Add('Todos os diretos reservados');
end;

procedure TFormSobre.lbl1Click(Sender: TObject);
begin
   ShellExecute(Application.Handle,PChar('open'),PChar('mailto:suporte@destraconsultoria.com.br'),PChar(0),nil,SW_NORMAL);
end;

procedure TFormSobre.lbl2Click(Sender: TObject);
begin
   ShellExecute(Application.Handle,PChar('open'),PChar('www.destraconsultoria.com.br'),PChar(0),nil,SW_NORMAL);
end;

procedure TFormSobre.lbl3Click(Sender: TObject);
begin
   ShellExecute(Application.Handle,PChar('open'),PChar('www.destramanager.com.br'),PChar(0),nil,SW_NORMAL);
end;

end.
