unit frm_cartaAtualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ExtCtrls, StdCtrls, Buttons;

type
  TFormCarta = class(TForm)
    wbAtualizacao: TWebBrowser;
    pnl1: TPanel;
    chkMostrar: TCheckBox;
    btn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkMostrarClick(Sender: TObject);
  private
    { Private declarations }
    sMostraCarta: string;
  public
    { Public declarations }
    iTela: Integer;
  end;

var
  FormCarta: TFormCarta;

implementation

uses frm_dm;

{$R *.dfm}

procedure TFormCarta.btn1Click(Sender: TObject);
begin
   if iTela = 2 then begin // Início do sistema
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' UPDATE parametros SET mostra_carta = ' + QuotedStr(sMostraCarta);
         Execute;
      end;
   end;
   Self.Close;
end;

procedure TFormCarta.chkMostrarClick(Sender: TObject);
begin
   if chkMostrar.Checked then begin
      sMostraCarta:= 'N';
   end
   else begin
      sMostraCarta:= 'S';
   end;
end;

procedure TFormCarta.FormCreate(Sender: TObject);
begin
   wbAtualizacao.Navigate(ExtractFilePath(Application.ExeName) + 'carta_2.10.html');
end;

procedure TFormCarta.FormShow(Sender: TObject);
begin
   if iTela = 1 then begin // Menu ajuda
      chkMostrar.Visible:= False;
   end
   else begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT mostra_carta FROM parametros';
         Active:= True;

         if FieldByName('mostra_carta').AsString = 'N' then begin
            chkMostrar.Checked:= True;
            sMostraCarta:= 'N';
         end
         else begin
            chkMostrar.Checked:= False;
            sMostraCarta:= 'S';
         end;
      end;
   end;
end;

end.
