unit frm_pesqPrgAudit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, FMTBcd, DB, DBClient, Provider,
  SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  TFormPesqPrgAudit = class(TForm)
    pnl1: TPanel;
    dbgAuditoria: TDBGrid;
    dspAudInterna: TDataSetProvider;
    cdsAudInterna: TClientDataSet;
    dsAudInterna: TDataSource;
    zqryAudInterna: TZQuery;
    cdsAudInternadata_aud: TDateTimeField;
    btnSelecionar: TBitBtn;
    btnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codForm: Integer;
  end;

var
  FormPesqPrgAudit: TFormPesqPrgAudit;

implementation

uses frm_AuditoriaInterna, uAuditoriaRelatorio;

{$R *.dfm}

procedure TFormPesqPrgAudit.btnSelecionarClick(Sender: TObject);
begin
   if codForm = 1 then begin
      FormAuditoriaInterna.dtChave.Date:= cdsAudInternadata_aud.AsDateTime;
      FormAuditoriaInterna.AtualizaDados;
   end
   else begin
      FormRelatorioAuditoria.dtChave.Date:= cdsAudInternadata_aud.AsDateTime;
      FormRelatorioAuditoria.AtualizaDados();
   end;
   Self.Close;
end;

procedure TFormPesqPrgAudit.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPesqPrgAudit.FormShow(Sender: TObject);
begin
   with cdsAudInterna do begin
      Active:= False;
      CommandText:= ' SELECT distinct data_aud ' +
                    ' FROM auditoria_interna';
      Active:= True;
   end;
end;

end.
