unit frm_DadosColaboradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  Tt_DadosColaboradores = class(TForm)
    sbInsereHabilidades: TSpeedButton;
    sbInsereTreinamentos: TSpeedButton;
    dbg1: TDBGrid;
    dbg2: TDBGrid;
    esponsavelHabilidades: TDBLookupComboBox;
    esponsavelTreinamentos: TDBLookupComboBox;
    pnl1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbBbtnNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    lb1: TLabel;
    sb1: TSpeedButton;
    sb2: TSpeedButton;
    sb3: TSpeedButton;
    lbColaborador: TLabel;
    procedure sbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_DadosColaboradores: Tt_DadosColaboradores;

implementation

{$R *.dfm}

procedure Tt_DadosColaboradores.FormShow(Sender: TObject);
begin
   lbColaborador.Caption:= EmptyStr;
end;

procedure Tt_DadosColaboradores.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

end.
