unit frm_AuditoriaInterna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  FMTBcd, DBClient, Provider, SqlExpr, JvExControls, JvStaticText, JvLabel,
  rxToolEdit, ImgList, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormAuditoriaInterna = class(TForm)
    pnl1: TPanel;
    dbgAuditoria: TDBGrid;
    dspAudInterna: TDataSetProvider;
    cdsAudInterna: TClientDataSet;
    dsAudInterna: TDataSource;
    JvLabel1: TJvLabel;
    JvLabel2: TJvLabel;
    bvl1: TBevel;
    bvl2: TBevel;
    JvLabel3: TJvLabel;
    bvl3: TBevel;
    JvLabel4: TJvLabel;
    JvLabel5: TJvLabel;
    bvl4: TBevel;
    bvl5: TBevel;
    JvLabel6: TJvLabel;
    bvl6: TBevel;
    JvLabel7: TJvLabel;
    JvLabel8: TJvLabel;
    bvl7: TBevel;
    bvl8: TBevel;
    JvLabel9: TJvLabel;
    bvl9: TBevel;
    JvLabel10: TJvLabel;
    JvLabel11: TJvLabel;
    bvl10: TBevel;
    bvl11: TBevel;
    JvLabel12: TJvLabel;
    bvl12: TBevel;
    JvLabel13: TJvLabel;
    JvLabel14: TJvLabel;
    bvl13: TBevel;
    bvl14: TBevel;
    JvLabel15: TJvLabel;
    bvl15: TBevel;
    JvLabel16: TJvLabel;
    JvLabel17: TJvLabel;
    bvl16: TBevel;
    bvl17: TBevel;
    JvLabel18: TJvLabel;
    bvl18: TBevel;
    JvLabel19: TJvLabel;
    JvLabel20: TJvLabel;
    bvl19: TBevel;
    bvl20: TBevel;
    JvLabel21: TJvLabel;
    bvl21: TBevel;
    JvLabel22: TJvLabel;
    JvLabel23: TJvLabel;
    bvl22: TBevel;
    bvl23: TBevel;
    JvLabel24: TJvLabel;
    bvl24: TBevel;
    JvLabel25: TJvLabel;
    JvLabel26: TJvLabel;
    bvl25: TBevel;
    bvl26: TBevel;
    JvLabel27: TJvLabel;
    bvl27: TBevel;
    JvLabel28: TJvLabel;
    JvLabel29: TJvLabel;
    bvl28: TBevel;
    bvl29: TBevel;
    JvLabel30: TJvLabel;
    bvl30: TBevel;
    JvLabel31: TJvLabel;
    JvLabel32: TJvLabel;
    bvl31: TBevel;
    bvl32: TBevel;
    JvLabel33: TJvLabel;
    bvl33: TBevel;
    JvLabel34: TJvLabel;
    JvLabel35: TJvLabel;
    bvl34: TBevel;
    bvl35: TBevel;
    JvLabel36: TJvLabel;
    bvl36: TBevel;
    JvLabel37: TJvLabel;
    JvLabel38: TJvLabel;
    bvl37: TBevel;
    bvl38: TBevel;
    JvLabel39: TJvLabel;
    bvl39: TBevel;
    ImageList: TImageList;
    lbl1: TLabel;
    lbl2: TLabel;
    mmoEscopo: TMemo;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    dsAux: TDataSource;
    dtChave: TDateEdit;
    btnPesquisa: TBitBtn;
    zqryAudInterna: TZQuery;
    zqryAux: TZQuery;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    cdsAudInternadata_aud: TDateTimeField;
    cdsAudInternaproc_aud: TLargeintField;
    cdsAudInternar41_aud: TSmallintField;
    cdsAudInternar422_aud: TSmallintField;
    cdsAudInternar423_aud: TSmallintField;
    cdsAudInternar424_aud: TSmallintField;
    cdsAudInternar51_aud: TSmallintField;
    cdsAudInternar52_aud: TSmallintField;
    cdsAudInternar53_aud: TSmallintField;
    cdsAudInternar541_aud: TSmallintField;
    cdsAudInternar542_aud: TSmallintField;
    cdsAudInternar551_aud: TSmallintField;
    cdsAudInternar552_aud: TSmallintField;
    cdsAudInternar553_aud: TSmallintField;
    cdsAudInternar56_aud: TSmallintField;
    cdsAudInternar61_aud: TSmallintField;
    cdsAudInternar621_aud: TSmallintField;
    cdsAudInternar622_aud: TSmallintField;
    cdsAudInternar63_aud: TSmallintField;
    cdsAudInternar64_aud: TSmallintField;
    cdsAudInternar71_aud: TSmallintField;
    cdsAudInternar721_aud: TSmallintField;
    cdsAudInternar722_aud: TSmallintField;
    cdsAudInternar723_aud: TSmallintField;
    cdsAudInternar73_aud: TSmallintField;
    cdsAudInternar74_aud: TSmallintField;
    cdsAudInternar751_aud: TSmallintField;
    cdsAudInternar752_aud: TSmallintField;
    cdsAudInternar753_aud: TSmallintField;
    cdsAudInternar754_aud: TSmallintField;
    cdsAudInternar755_aud: TSmallintField;
    cdsAudInternar76_aud: TSmallintField;
    cdsAudInternar821_aud: TSmallintField;
    cdsAudInternar822_aud: TSmallintField;
    cdsAudInternar823_aud: TSmallintField;
    cdsAudInternar824_aud: TSmallintField;
    cdsAudInternar83_aud: TSmallintField;
    cdsAudInternar84_aud: TSmallintField;
    cdsAudInternar851_aud: TSmallintField;
    cdsAudInternar852_aud: TSmallintField;
    cdsAudInternar853_aud: TSmallintField;
    cdsAudInternaNomeProcesso: TStringField;
    btnAgendar: TBitBtn;
    cdsAudInternaaud_codigo: TIntegerField;
    procedure dtChaveExit(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure mmoEscopoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAnoKeyPress(Sender: TObject; var Key: Char);
    procedure cdsAudInternaCalcFields(DataSet: TDataSet);
    procedure dbgAuditoriaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure dbgAuditoriaCellClick(Column: TColumn);
    procedure dbgAuditoriaColEnter(Sender: TObject);
    procedure cdsAudInternaAfterPost(DataSet: TDataSet);
    procedure AtualizaDados;
    procedure LimparCampos;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAgendarClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: string;
  public
    { Public declarations }
  end;

var
  FormAuditoriaInterna: TFormAuditoriaInterna;

implementation

uses frm_dm, Funcoes, frm_pesqPrgAudit, frm_Inicial,
  frm_AuditoriaAgenda;

{$R *.dfm}

procedure TFormAuditoriaInterna.AtualizaDados;
begin
   if dtChave.Text = '  /  /    ' then begin
      Exit;
   end
   else begin
      with cdsAudInterna do begin
         Active:= False;
   //      CommandText:= ' SELECT A.*, R.esco_aud, R.audi_aud, R.adtd_aud, R.hora_aud, R.dtpr_aud ' +
   //                    ' FROM auditoria_interna A' +
   //                    ' INNER JOIN auditoria_interna_rel R ON R.dtpr_aud = A.data_aud' +
   //                    ' WHERE A.data_aud = ' + ArrumaDataSQL(dtChave.Date);
         CommandText:= ' SELECT data_aud, proc_aud, r41_aud, r422_aud, r423_aud, r424_aud, r51_aud,' +
                       '     r52_aud, r53_aud, r541_aud, r542_aud, r551_aud, r552_aud, r553_aud,' +
                       '     r56_aud, r61_aud, r621_aud, r622_aud, r63_aud, r64_aud, r71_aud,' +
                       '     r721_aud, r722_aud, r723_aud, r73_aud, r74_aud, r751_aud, r752_aud,' +
                       '     r753_aud, r754_aud, r755_aud, r76_aud, r821_aud, r822_aud, r823_aud,' +
                       '     r824_aud, r83_aud, r84_aud, r851_aud, r852_aud, r853_aud, aud_codigo' +
                       ' FROM auditoria_interna A' +
//                          ' INNER JOIN processos P ON P.codi_pro = A.proc_aud' +
                       ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' ORDER BY proc_aud';
         Active:= True;

         if cdsAudInterna.RecordCount = 0 then begin
            PreencheAuditoria(dtChave.Date);

            Active:= False;
   //         CommandText:= ' SELECT A.*, R.esco_aud, R.audi_aud, R.adtd_aud, R.hora_aud, R.dtpr_aud ' +
   //                    ' FROM auditoria_interna A' +
   //                    ' INNER JOIN auditoria_interna_rel R ON R.dtpr_aud = A.data_aud' +
   //                    ' WHERE A.data_aud = ' + ArrumaDataSQL(dtChave.Date);
               CommandText:= ' SELECT data_aud, proc_aud, r41_aud, r422_aud, r423_aud, r424_aud, r51_aud,' +
                          '     r52_aud, r53_aud, r541_aud, r542_aud, r551_aud, r552_aud, r553_aud,' +
                          '     r56_aud, r61_aud, r621_aud, r622_aud, r63_aud, r64_aud, r71_aud,' +
                          '     r721_aud, r722_aud, r723_aud, r73_aud, r74_aud, r751_aud, r752_aud,' +
                          '     r753_aud, r754_aud, r755_aud, r76_aud, r821_aud, r822_aud, r823_aud,' +
                          '     r824_aud, r83_aud, r84_aud, r851_aud, r852_aud, r853_aud, aud_codigo' +
                          ' FROM auditoria_interna A' +
//                          ' INNER JOIN processos P ON P.codi_pro = A.proc_aud' +
                          ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date) +
                          ' ORDER BY P.nome_pro';
            Active:= True;
         end;
      end;

      with cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT *' +
                       ' FROM auditoria_interna_rel' +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
         Active:= True;
      end;

      mmoEscopo.Text      := cdsAux.FieldByName('esco_aud').AsString;
//      edtAuditores.Text   := cdsAux.FieldByName('audi_aud').AsString;
//      edtAuditados.Text   := cdsAux.FieldByName('adtd_aud').AsString;
//      edtHoraPrevista.Text:= cdsAux.FieldByName('hora_aud').AsString;
//      edtDataPrevista.Text:= cdsAux.FieldByName('data_aud').AsString;

      if cOperacao = 'I' then begin
         Botoes(False);
      end
      else begin
         Botoes(True);
      end;
   end;
end;

procedure TFormAuditoriaInterna.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnAgendar.Enabled := Flag;

//   if cdsAudInterna.RecordCount = 0 then begin
//      btnAlterar.Enabled:= False;
//      btnExcluir.Enabled:= False;
//   end;
end;

procedure TFormAuditoriaInterna.btnAgendarClick(Sender: TObject);
begin
   FormAuditoriaAgenda:= TFormAuditoriaAgenda.Create(nil);
   FormAuditoriaAgenda.sCodAuditoria:= cdsAudInternaaud_codigo.AsString;
   FormAuditoriaAgenda.ShowModal;
   FormAuditoriaAgenda.Release;
end;

procedure TFormAuditoriaInterna.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';
   Botoes(False);
   HabilitarCampos(True, True);
end;

procedure TFormAuditoriaInterna.btnCancelarClick(Sender: TObject);
begin
   AtualizaDados();
   HabilitarCampos(False, False);
   Botoes(True);
end;

procedure TFormAuditoriaInterna.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox(PChar('Será excluído o Programa e os dados do relatório de Auditoria. Confirma ?'),'Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then  begin
      try
         Auditoria('PROGRAMA DE AUDITORIA',dtChave.Text,'E', '');
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna' +
                          ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna_rel' +
                          ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna_rel_itens' +
                          ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;
         LimparCampos;
         Application.MessageBox('Registro excluído corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro ao excluir.' + #13 + E.Message), 'Erro', MB_OK + MB_ICONSTOP);
         end;
      end;
   end;
end;

procedure TFormAuditoriaInterna.btnGravarClick(Sender: TObject);
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' UPDATE auditoria_interna_rel SET' +
//                       ' audi_aud = ' + QuotedStr(edtAuditores.Text) + ',' +
//                       ' adtd_aud = ' + QuotedStr(edtAuditados.Text) + ',' +
//                       ' hora_aud = ' + QuotedStr(edtHoraPrevista.Text) + ',' +
//                       ' data_aud = ' + QuotedStr(edtDataPrevista.Text) + ',' +
                       ' esco_aud = ' + QuotedStr(mmoEscopo.Text) +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
         Execute;
      end;

      Botoes(True);
      HabilitarCampos(False, False);
      Auditoria('PROGRAMA DE AUDITORIA',DateToStr(dtChave.Date),'A', '');
      cOperacao:= '';
      Application.MessageBox('Dados gravados corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar os dados !' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormAuditoriaInterna.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos();
   Botoes(False);
   HabilitarCampos(True, True);
   TryFocus(dtChave);
end;

procedure TFormAuditoriaInterna.btnPesquisaClick(Sender: TObject);
begin
   FormPesqPrgAudit:= TFormPesqPrgAudit.Create(nil);
   FormPesqPrgAudit.codForm:= 1;
   FormPesqPrgAudit.ShowModal;
   FormPesqPrgAudit.Release;

//   if not assigned(FormPesqPrgAudit) then
//      Application.CreateForm(TFormPesqPrgAudit, FormPesqPrgAudit);
//   FormPesqPrgAudit.codForm:= 1;
//   FormPesqPrgAudit.Show;
end;

procedure TFormAuditoriaInterna.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormAuditoriaInterna.cdsAudInternaAfterPost(DataSet: TDataSet);
begin
   cdsAudInterna.ApplyUpdates(0);
end;

procedure TFormAuditoriaInterna.cdsAudInternaCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro FROM Processos' +
                    ' WHERE codi_pro = ' + cdsAudInternaproc_aud.AsString;
      Active:= True;

      cdsAudInternaNomeProcesso.AsString:= FieldByName('nome_pro').AsString;
   end;
end;

procedure TFormAuditoriaInterna.dbgAuditoriaCellClick(Column: TColumn);
begin
   // Atribui os valores dos outros campos para os labels
//   cdsAudInterna.Edit;

//   edAuditados.Text:= cdsAudInternaadtd_aud.AsString;
//   edAuditores.Text:= cdsAudInternaaudi_aud.AsString;
//   edData.Text     := cdsAudInternadata_aud.AsString;
//   edHorario.Text  := cdsAudInternahora_aud.AsString;

   if Column.Field = cdsAudInternar41_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar41_aud.AsInteger = 0 then
         cdsAudInternar41_aud.AsInteger:= 1
      else
         cdsAudInternar41_aud.AsInteger:= 0;   
   end;

   if Column.Field = cdsAudInternar422_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar422_aud.AsInteger = 0 then
         cdsAudInternar422_aud.AsInteger:= 1
      else
         cdsAudInternar422_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar423_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar423_aud.AsInteger = 0 then
         cdsAudInternar423_aud.AsInteger:= 1
      else
         cdsAudInternar423_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar424_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar424_aud.AsInteger = 0 then
         cdsAudInternar424_aud.AsInteger:= 1
      else
         cdsAudInternar424_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar51_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar51_aud.AsInteger = 0 then
         cdsAudInternar51_aud.AsInteger:= 1
      else
         cdsAudInternar51_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar52_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar52_aud.AsInteger = 0 then
         cdsAudInternar52_aud.AsInteger:= 1
      else
         cdsAudInternar52_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar53_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar53_aud.AsInteger = 0 then
         cdsAudInternar53_aud.AsInteger:= 1
      else
         cdsAudInternar53_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar541_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar541_aud.AsInteger = 0 then
         cdsAudInternar541_aud.AsInteger:= 1
      else
         cdsAudInternar541_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar542_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar542_aud.AsInteger = 0 then
         cdsAudInternar542_aud.AsInteger:= 1
      else
         cdsAudInternar542_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar551_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar551_aud.AsInteger = 0 then
         cdsAudInternar551_aud.AsInteger:= 1
      else
         cdsAudInternar551_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar552_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar552_aud.AsInteger = 0 then
         cdsAudInternar552_aud.AsInteger:= 1
      else
         cdsAudInternar552_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar553_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar553_aud.AsInteger = 0 then
         cdsAudInternar553_aud.AsInteger:= 1
      else
         cdsAudInternar553_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar56_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar56_aud.AsInteger = 0 then
         cdsAudInternar56_aud.AsInteger:= 1
      else
         cdsAudInternar56_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar61_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar61_aud.AsInteger = 0 then
         cdsAudInternar61_aud.AsInteger:= 1
      else
         cdsAudInternar61_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar621_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar621_aud.AsInteger = 0 then
         cdsAudInternar621_aud.AsInteger:= 1
      else
         cdsAudInternar621_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar622_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar622_aud.AsInteger = 0 then
         cdsAudInternar622_aud.AsInteger:= 1
      else
         cdsAudInternar622_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar63_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar63_aud.AsInteger = 0 then
         cdsAudInternar63_aud.AsInteger:= 1
      else
         cdsAudInternar63_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar64_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar64_aud.AsInteger = 0 then
         cdsAudInternar64_aud.AsInteger:= 1
      else
         cdsAudInternar64_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar71_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar71_aud.AsInteger = 0 then
         cdsAudInternar71_aud.AsInteger:= 1
      else
         cdsAudInternar71_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar721_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar721_aud.AsInteger = 0 then
         cdsAudInternar721_aud.AsInteger:= 1
      else
         cdsAudInternar721_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar722_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar722_aud.AsInteger = 0 then
         cdsAudInternar722_aud.AsInteger:= 1
      else
         cdsAudInternar722_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar723_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar723_aud.AsInteger = 0 then
         cdsAudInternar723_aud.AsInteger:= 1
      else
         cdsAudInternar723_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar73_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar73_aud.AsInteger = 0 then
         cdsAudInternar73_aud.AsInteger:= 1
      else
         cdsAudInternar73_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar74_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar74_aud.AsInteger = 0 then
         cdsAudInternar74_aud.AsInteger:= 1
      else
         cdsAudInternar74_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar751_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar751_aud.AsInteger = 0 then
         cdsAudInternar751_aud.AsInteger:= 1
      else
         cdsAudInternar751_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar752_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar752_aud.AsInteger = 0 then
         cdsAudInternar752_aud.AsInteger:= 1
      else
         cdsAudInternar752_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar753_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar753_aud.AsInteger = 0 then
         cdsAudInternar753_aud.AsInteger:= 1
      else
         cdsAudInternar753_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar754_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar754_aud.AsInteger = 0 then
         cdsAudInternar754_aud.AsInteger:= 1
      else
         cdsAudInternar754_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar755_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar755_aud.AsInteger = 0 then
         cdsAudInternar755_aud.AsInteger:= 1
      else
         cdsAudInternar755_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar76_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar76_aud.AsInteger = 0 then
         cdsAudInternar76_aud.AsInteger:= 1
      else
         cdsAudInternar76_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar821_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar821_aud.AsInteger = 0 then
         cdsAudInternar821_aud.AsInteger:= 1
      else
         cdsAudInternar821_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar822_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar822_aud.AsInteger = 0 then
         cdsAudInternar822_aud.AsInteger:= 1
      else
         cdsAudInternar822_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar823_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar823_aud.AsInteger = 0 then
         cdsAudInternar823_aud.AsInteger:= 1
      else
         cdsAudInternar823_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar824_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar824_aud.AsInteger = 0 then
         cdsAudInternar824_aud.AsInteger:= 1
      else
         cdsAudInternar824_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar83_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar83_aud.AsInteger = 0 then
         cdsAudInternar83_aud.AsInteger:= 1
      else
         cdsAudInternar83_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar84_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar84_aud.AsInteger = 0 then
         cdsAudInternar84_aud.AsInteger:= 1
      else
         cdsAudInternar84_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar851_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar851_aud.AsInteger = 0 then
         cdsAudInternar851_aud.AsInteger:= 1
      else
         cdsAudInternar851_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar852_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar852_aud.AsInteger = 0 then
         cdsAudInternar852_aud.AsInteger:= 1
      else
         cdsAudInternar852_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar853_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar853_aud.AsInteger = 0 then
         cdsAudInternar853_aud.AsInteger:= 1
      else
         cdsAudInternar853_aud.AsInteger:= 0;
   end;

   if Column.Field <> cdsAudInternaNomeProcesso then begin
      cdsAudInterna.Post;
   end;
//   Self.Refresh;
end;


procedure TFormAuditoriaInterna.dbgAuditoriaColEnter(Sender: TObject);
begin
   if dbgAuditoria.SelectedField <> cdsAudInternaNomeProcesso then
      dbgAuditoria.Options:= dbgAuditoria.Options - [dgEditing]
   else
      dbgAuditoria.Options:= dbgAuditoria.Options + [dgEditing];
end;

procedure TFormAuditoriaInterna.dbgAuditoriaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   // Pinta CheckBox
   if Column.Field = cdsAudInternar41_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar41_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar422_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar422_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar423_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar423_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar424_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar424_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar51_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar51_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar52_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar52_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar53_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar53_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar541_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar541_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar542_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar542_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar551_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar551_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar552_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar552_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar553_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar553_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar56_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar56_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar61_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar61_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar621_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar621_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar622_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar622_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar63_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar63_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar64_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar64_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar71_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar71_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar721_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar721_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar722_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar722_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar723_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar723_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar73_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar73_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar74_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar74_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar751_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar751_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar752_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar752_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar753_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar753_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar754_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar754_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar755_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar755_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar76_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar76_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar821_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar821_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar822_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar822_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar823_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar823_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar824_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar824_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar83_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar83_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar84_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar84_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar851_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar851_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar852_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar852_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar853_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar853_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;
end;

procedure TFormAuditoriaInterna.dtChaveExit(Sender: TObject);
begin
   AtualizaDados();
end;

procedure TFormAuditoriaInterna.edtAnoKeyPress(Sender: TObject; var Key: Char);
begin
//   if not Numero(Key) then begin
//      if Key in [] then begin
//         Key:= #0;
//      end;
//   end;
end;

procedure TFormAuditoriaInterna.FormShow(Sender: TObject);
begin
   with cdsAudInterna do begin
      Active:= False;
   end;

   HabilitarCampos(False, False);

//   dtChave.SetFocus;
end;

procedure TFormAuditoriaInterna.HabilitarCampos(Flag, Codigo: Boolean);
begin
   dtChave.Enabled        := Flag;
   mmoEscopo.Enabled      := Flag;
//   edtAuditados.Enabled   := Flag;
//   edtAuditores.Enabled   := Flag;
//   edtHoraPrevista.Enabled:= Flag;
//   edtDataPrevista.Enabled:= Flag;

   dbgAuditoria.Enabled:= Flag;
end;

procedure TFormAuditoriaInterna.LimparCampos;
begin
   dtChave.Clear;
   mmoEscopo.Clear;
//   edtAuditados.Clear;
//   edtAuditores.Clear;
//   edtHoraPrevista.Clear;
//   edtDataPrevista.Clear;
   cdsAudInterna.Active:= False;
end;

procedure TFormAuditoriaInterna.mmoEscopoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

end.
