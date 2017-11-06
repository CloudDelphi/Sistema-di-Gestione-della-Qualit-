unit frm_pesqPrgAudit2015;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, FMTBcd, DB, DBClient, Provider,
  SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset, StdCtrls;

type
  TFormPesqPrgAudit2015 = class(TForm)
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
  FormPesqPrgAudit2015: TFormPesqPrgAudit2015;

implementation

uses frm_AuditoriaInterna2015, uAuditoriaRelatorio, frm_AuditoriaRelatorio2015;

{$R *.dfm}

procedure TFormPesqPrgAudit2015.btnSelecionarClick(Sender: TObject);
begin
   if codForm = 1 then begin
      FormAuditoriaInterna2015.dtChave.Date:= cdsAudInternadata_aud.AsDateTime;
      FormAuditoriaInterna2015.AtualizaDados;
   end
   else begin
      FormRelatorioAuditoria2015.dtChave.Date  := cdsAudInternadata_aud.AsDateTime;
      FormRelatorioAuditoria2015.AtualizaDados();
   end;
   Self.Close;
end;

procedure TFormPesqPrgAudit2015.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPesqPrgAudit2015.FormShow(Sender: TObject);
begin
   with cdsAudInterna do begin
      Active:= False;
      CommandText:= ' SELECT distinct data_aud ' +
                    ' FROM auditoria_interna2015';
      Active:= True;
   end;
end;

end.
