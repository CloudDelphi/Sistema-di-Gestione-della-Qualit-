unit frm_PrevEficacia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TFormPrevEficacia = class(TForm)
    lbl35: TLabel;
    dtVerEfic: TDateEdit;
    pnl15: TPanel;
    btnSairVerEfic: TBitBtn;
    btnGravarVerEfic: TBitBtn;
    procedure btnGravarVerEficClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrevEficacia: TFormPrevEficacia;

implementation

uses frm_dm, Funcoes, frm_PDCA;

{$R *.dfm}

procedure TFormPrevEficacia.btnGravarVerEficClick(Sender: TObject);
begin
   if Self.Tag = 1 then begin // PDCA
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' UPDATE pdca_lanc set' +
                       ' lan_dtprevista = ' + ArrumaDataSQL(dtVerEfic.Date) +
                       ' WHERE lan_codigo = ' + Self.HelpKeyword;
         Execute;
      end;
   end;

   Self.Close;
end;

end.
