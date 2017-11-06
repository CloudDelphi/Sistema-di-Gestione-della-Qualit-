unit frm_AuditoriaAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, rxToolEdit, Grids,
  DBGrids, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFormAuditoriaAgenda = class(TForm)
    pnl1: TPanel;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    lbllb1: TLabel;
    lbllb2: TLabel;
    lbllb3: TLabel;
    lbllb4: TLabel;
    edtAuditores: TEdit;
    lbl18: TLabel;
    dblProcesso: TDBLookupComboBox;
    dtData: TDateEdit;
    medtHoraIni: TMaskEdit;
    medtHoraFim: TMaskEdit;
    lbl1: TLabel;
    dbgForn: TDBGrid;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    zqryAgenda: TZQuery;
    dspAgenda: TDataSetProvider;
    cdsAgenda: TClientDataSet;
    dsAgenda: TDataSource;
    cdsAgendaaud_codigo: TIntegerField;
    cdsAgendaaud_cod_auditoria: TIntegerField;
    cdsAgendaaud_data: TDateField;
    cdsAgendaaud_horaini: TWideStringField;
    cdsAgendaaud_horafim: TWideStringField;
    cdsAgendaaud_auditores: TWideStringField;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    cdsAgendaHoraPrevista: TStringField;
    cdsAgendaaud_processo: TIntegerField;
    cdsAgendaNomeProcesso: TStringField;
    dblAuditado: TDBLookupComboBox;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    cdsAgendaaud_auditado: TIntegerField;
    cdsAgendaNomeAuditado: TStringField;
    procedure btnSairClick(Sender: TObject);
    procedure AtualizarDados;
    procedure btnNovoClick(Sender: TObject);
    procedure Botoes(flag: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure PreencherCampos();
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cdsAgendaCalcFields(DataSet: TDataSet);
    procedure dbgFornCellClick(Column: TColumn);
  private
    { Private declarations }
    cOperacao: string;
    sNovoCodigo: string;
  public
    { Public declarations }
    sCodAuditoria: string;
  end;

var
  FormAuditoriaAgenda: TFormAuditoriaAgenda;

implementation

uses Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormAuditoriaAgenda.AtualizarDados;
begin
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsColaboradores do begin
      Active:= False;
      Active:= True;
   end;

   with cdsAgenda do begin
      Active:= False;
      CommandText:= ' SELECT aud_codigo, aud_cod_auditoria, aud_data, aud_horaini, ' +
                    ' aud_horafim, aud_auditores, aud_auditado, aud_processo' +
                    ' FROM auditoria_interna_agenda' +
                    ' WHERE aud_cod_auditoria = ' + sCodAuditoria +
                    ' ORDER BY aud_data, aud_horaini';
      Active:= True;
   end;

   if AllTrim(cdsAgendaaud_codigo.AsString) <> EmptyStr then begin
      cdsAgenda.Locate('aud_codigo', cdsAgendaaud_codigo.AsString,[])
   end;
end;

procedure TFormAuditoriaAgenda.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
//   btnImprimir.Enabled:= Flag;

   if cdsAgenda.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormAuditoriaAgenda.btnAlterarClick(Sender: TObject);
begin
//   if (Acesso(cUsuario, 25, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 1);
      TryFocus(dtData);
      Botoes(False);
//   end;
end;

procedure TFormAuditoriaAgenda.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 0);
end;

procedure TFormAuditoriaAgenda.btnExcluirClick(Sender: TObject);
var
   sCodAud: string;
begin
//   if (Acesso(cUsuario, 25, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodAud := cdsAgendaaud_codigo.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna_agenda' +
                          ' WHERE aud_codigo = ' + QuotedStr(sCodAud);
            Execute;
         end;

//         Auditoria('CADASTRO DE FORNECEDORES', sNomeForn, 'E', '');
         LimparCampos(Self);
         AtualizarDados();
         PreencherCampos();
      end;
      Botoes(True);
//   end;
end;

procedure TFormAuditoriaAgenda.btnGravarClick(Sender: TObject);
begin
   sNovoCodigo:= BuscarNovoCodigo('auditoria_interna_agenda', 'aud_codigo');

   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO auditoria_interna_agenda(' +
                          ' aud_codigo, aud_cod_auditoria, aud_data, aud_horaini, ' +
                          ' aud_horafim, aud_auditores, aud_auditado, aud_processo)' +
                          ' VALUES(' +
                          sNovoCodigo + ',' +
                          sCodAuditoria + ',' +
                          ArrumaDataSQL(dtData.Date) + ',' +
                          QuotedStr(medtHoraIni.Text) + ',' +
                          QuotedStr(medtHoraFim.Text) + ',' +
                          QuotedStr(edtAuditores.Text) + ',' +
                          QuotedStr(dblAuditado.KeyValue) + ',' +
                          QuotedStr(dblProcesso.KeyValue) +
                          ' )';
            Execute;
         end
         else begin
            CommandText:= ' UPDATE auditoria_interna_agenda SET' +
                          ' aud_cod_auditoria = ' + sCodAuditoria + ',' +
                          ' aud_data = ' + ArrumaDataSQL(dtData.Date) + ',' +
                          ' aud_horaini = ' + QuotedStr(medtHoraIni.Text) + ',' +
                          ' aud_horafim = ' + QuotedStr(medtHoraFim.Text) + ',' +
                          ' aud_auditores = ' + QuotedStr(edtAuditores.Text) + ',' +
                          ' aud_auditado = ' + QuotedStr(dblAuditado.KeyValue) + ',' +
                          ' aud_processo = ' + QuotedStr(dblProcesso.KeyValue) +
                          ' WHERE aud_codigo = ' + cdsAgendaaud_codigo.AsString;
            Execute;
         end;

         Auditoria('AGENDA AUDITORIA INTERNA', dtData.Text, cOperacao,'');
         AtualizarDados();

         HabilitarCampos(False, False, Self, -1);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      end
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormAuditoriaAgenda.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos(Self);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   HabilitarCampos(True, False, Self, 0);
   TryFocus(dblProcesso);
end;

procedure TFormAuditoriaAgenda.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormAuditoriaAgenda.cdsAgendaCalcFields(DataSet: TDataSet);
begin
   cdsAgendaHoraPrevista.AsString:= cdsAgendaaud_horaini.AsString + ' - ' + cdsAgendaaud_horafim.AsString
end;

procedure TFormAuditoriaAgenda.dbgFornCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormAuditoriaAgenda.FormShow(Sender: TObject);
begin
   HabilitarCampos(False, False, Self, 0);
   AtualizarDados();
   Botoes(True);
end;

procedure TFormAuditoriaAgenda.PreencherCampos;
begin
   with cdsAgenda do begin
      dtData.Date      := FieldByName('aud_data').AsDateTime;
      medtHoraIni.Text := FieldByName('aud_horaini').AsString;
      medtHoraFim.Text := FieldByName('aud_horafim').AsString;
      edtAuditores.Text:= FieldByName('aud_auditores').AsString;

      if FieldByName('aud_processo').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('aud_processo').AsString;
      end;
      if FieldByName('aud_auditado').AsString <> EmptyStr then begin
         dblAuditado.KeyValue:= FieldByName('aud_auditado').AsString;
      end;
   end;
end;

end.
