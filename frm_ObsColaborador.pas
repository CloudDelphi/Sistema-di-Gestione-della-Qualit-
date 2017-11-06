unit frm_ObsColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormObsColaborador = class(TForm)
    pnl1: TPanel;
    btnSair: TBitBtn;
    lbl5: TLabel;
    edtCodigo: TEdit;
    lbl2: TLabel;
    edtNome: TEdit;
    mmoObs: TMemo;
    lbl8: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoCol: string;
  end;

var
  FormObsColaborador: TFormObsColaborador;

implementation

uses
   frm_dm;

{$R *.dfm}

procedure TFormObsColaborador.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormObsColaborador.FormShow(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col, obs_col' +
                    ' FROM colaboradores' +
                    ' WHERE codi_col = ' + sCodigoCol;
      Active:= True;

      edtCodigo.Text:= FieldByName('codi_col').AsString;
      edtNome.Text  := FieldByName('nome_col').AsString;
      mmoObs.Text   := FieldByName('obs_col').AsString;
   end;
end;

end.
