unit frm_CadAuditoriaAutoCabec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, Mask, rxToolEdit;

type
  TFormCadAuditoriaAutoCabec = class(TForm)
    zqryCabec: TZQuery;
    dspCabec: TDataSetProvider;
    cdsCabec: TClientDataSet;
    dsCabec: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    lbl1: TLabel;
    lbl16: TLabel;
    edtData: TEdit;
    mmoEscopo: TMemo;
    lbl2: TLabel;
    edtNomeEmpresa: TEdit;
    lbl34: TLabel;
    dtPeriodoIni: TDateEdit;
    dtPeriodoFim: TDateEdit;
    lbl3: TLabel;
    lbl5: TLabel;
    dtPrograma: TDateEdit;
    lbl4: TLabel;
    edtAuditor: TEdit;
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgContextosCellClick(Column: TColumn);
    procedure dbgContextosDblClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
    dDataAuditoria: TDate;
  end;

var
  FormCadAuditoriaAutoCabec: TFormCadAuditoriaAutoCabec;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_PDCA, frm_AuditoriaAuto;

{$R *.dfm}

procedure TFormCadAuditoriaAutoCabec.AtualizarDados;
var
   aDadosEmpresa: TStringList;
begin
   aDadosEmpresa:= TStringList.Create;
   aDadosEmpresa:= BuscarNomeEmpresa();

   edtNomeEmpresa.Text:= aDadosEmpresa[0];
   mmoEscopo.Text     := aDadosEmpresa[1];

   with cdsCabec do begin
      Active:= False;
      CommandText:= ' SELECT aud_data, aud_auditor, aud_periodo_ini, ' +
                    ' aud_periodo_fim, aud_data_programa' +
                    ' FROM auditoria_auto_cabec' +
                    ' WHERE aud_data = ' + ArrumaDataSQL(dDataAuditoria);
      Active:= True;

      if RecordCount = 0 then begin
         cOperacao:= 'I';
         edtData.Text:= DateToStr(dDataAuditoria);
      end
      else begin
         cOperacao:= 'A';
         PreencherCampos();
      end;
   end;
end;

procedure TFormCadAuditoriaAutoCabec.FormShow(Sender: TObject);
begin
   AtualizarDados();
end;

procedure TFormCadAuditoriaAutoCabec.btnCancelarClick(Sender: TObject);
begin
   FormAuditoriaAuto.iContinua:= 0;
   Self.Close;
end;

procedure TFormCadAuditoriaAutoCabec.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO auditoria_auto_cabec (' +
                             ' aud_data, aud_auditor, aud_periodo_ini, aud_periodo_fim, aud_data_programa)' +
                             ' VALUES(' +
                             ArrumaDataSQL(dDataAuditoria) + ',' +
                             QuotedStr(edtAuditor.Text) + ',' +
                             ArrumaDataSQL(dtPeriodoIni.Date) + ',' +
                             ArrumaDataSQL(dtPeriodoFim.Date) + ',' +
                             ArrumaDataSQL(dtPrograma.Date) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE auditoria_auto_cabec SET' +
                             ' aud_auditor = ' + QuotedStr(edtAuditor.Text) + ',' +
                             ' aud_periodo_ini = ' + ArrumaDataSQL(dtPeriodoIni.Date) + ',' +
                             ' aud_periodo_fim = ' + ArrumaDataSQL(dtPeriodoFim.Date) + ',' +
                             ' aud_data_programa = ' + ArrumaDataSQL(dtPrograma.Date) +
                             ' WHERE aud_data = ' + ArrumaDataSQL(dDataAuditoria);
            end;
            Execute;
         end;
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;

   FormAuditoriaAuto.iContinua:= 1;
   Self.Close;
end;

procedure TFormCadAuditoriaAutoCabec.dbgContextosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadAuditoriaAutoCabec.dbgContextosDblClick(Sender: TObject);
begin
   PreencherCampos;
end;

procedure TFormCadAuditoriaAutoCabec.PreencherCampos;
begin
   with cdsCabec do begin
      edtData.Text       := FieldByName('aud_data').AsString;
      edtNomeEmpresa.Text:= FieldByName('nome_emp').AsString;
      mmoEscopo.Text     := FieldByName('emp_escopo').AsString;
      edtAuditor.Text    := FieldByName('aud_auditor').AsString;
      dtPeriodoIni.Date  := FieldByName('aud_periodo_ini').AsDateTime;
      dtPeriodoFim.Date  := FieldByName('aud_periodo_fim').AsDateTime;
      dtPrograma.Date    := FieldByName('aud_data_programa').AsDateTime;
   end;
end;

function TFormCadAuditoriaAutoCabec.ValidarDados: Boolean;
begin
   if dtPeriodoIni.Text <> '  /  /    ' then begin
      try
         StrToDate(dtPeriodoIni.Text);
      except
         Application.MessageBox('Digite uma data válida - Período Inicial', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dtPeriodoIni);
         Result:= False;
         Exit;
      end;
   end;
   
   if dtPeriodoFim.Text <> '  /  /    ' then begin
      try
         StrToDate(dtPeriodoFim.Text);
      except
         Application.MessageBox('Digite uma data válida - Período Final', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dtPeriodoFim);
         Result:= False;
         Exit;
      end;
   end;
   
   if dtPrograma.Text <> '  /  /    ' then begin
      try
         StrToDate(dtPrograma.Text);
      except
         Application.MessageBox('Digite uma data válida - Programa de Auditoria', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dtPrograma);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;

end.
