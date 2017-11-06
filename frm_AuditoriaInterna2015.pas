unit frm_AuditoriaInterna2015;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  FMTBcd, DBClient, Provider, SqlExpr, JvExControls, JvStaticText, JvLabel,
  rxToolEdit, ImgList, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormAuditoriaInterna2015 = class(TForm)
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
    cdsAudInternaNomeProcesso: TStringField;
    btnAgendar: TBitBtn;
    cdsAudInternaaud_codigo: TIntegerField;
    bvl40: TBevel;
    bvl41: TBevel;
    bvl42: TBevel;
    bvl43: TBevel;
    bvl44: TBevel;
    bvl45: TBevel;
    bvl46: TBevel;
    bvl47: TBevel;
    bvl48: TBevel;
    bvl49: TBevel;
    JvLabel40: TJvLabel;
    JvLabel41: TJvLabel;
    JvLabel42: TJvLabel;
    JvLabel43: TJvLabel;
    JvLabel44: TJvLabel;
    JvLabel45: TJvLabel;
    JvLabel46: TJvLabel;
    JvLabel47: TJvLabel;
    JvLabel48: TJvLabel;
    JvLabel49: TJvLabel;
    cdsAudInternadata_aud: TDateTimeField;
    cdsAudInternaproc_aud: TLargeintField;
    cdsAudInternar02_aud: TSmallintField;
    cdsAudInternar03_aud: TSmallintField;
    cdsAudInternar411_aud: TSmallintField;
    cdsAudInternar42_aud: TSmallintField;
    cdsAudInternar43_aud: TSmallintField;
    cdsAudInternar441_aud: TSmallintField;
    cdsAudInternar442_aud: TSmallintField;
    cdsAudInternar511_aud: TSmallintField;
    cdsAudInternar512_aud: TSmallintField;
    cdsAudInternar521_aud: TSmallintField;
    cdsAudInternar522_aud: TSmallintField;
    cdsAudInternar53_aud: TSmallintField;
    cdsAudInternar61_aud: TSmallintField;
    cdsAudInternar62_aud: TSmallintField;
    cdsAudInternar63_aud: TSmallintField;
    cdsAudInternar711_aud: TSmallintField;
    cdsAudInternar712_aud: TSmallintField;
    cdsAudInternar713_aud: TSmallintField;
    cdsAudInternar714_aud: TSmallintField;
    cdsAudInternar7151_aud: TSmallintField;
    cdsAudInternar7152_aud: TSmallintField;
    cdsAudInternar716_aud: TSmallintField;
    cdsAudInternar72_aud: TSmallintField;
    cdsAudInternar73_aud: TSmallintField;
    cdsAudInternar74_aud: TSmallintField;
    cdsAudInternar75_aud: TSmallintField;
    cdsAudInternar81_aud: TSmallintField;
    cdsAudInternar821_aud: TSmallintField;
    cdsAudInternar822_aud: TSmallintField;
    cdsAudInternar823_aud: TSmallintField;
    cdsAudInternar824_aud: TSmallintField;
    cdsAudInternar83_aud: TSmallintField;
    cdsAudInternar84_aud: TSmallintField;
    cdsAudInternar851_aud: TSmallintField;
    cdsAudInternar852_aud: TSmallintField;
    cdsAudInternar853_aud: TSmallintField;
    cdsAudInternar854_aud: TSmallintField;
    cdsAudInternar855_aud: TSmallintField;
    cdsAudInternar856_aud: TSmallintField;
    cdsAudInternar86_aud: TSmallintField;
    cdsAudInternar87_aud: TSmallintField;
    cdsAudInternar91_aud: TSmallintField;
    cdsAudInternar912_aud: TSmallintField;
    cdsAudInternar913_aud: TSmallintField;
    cdsAudInternar92_aud: TSmallintField;
    cdsAudInternar93_aud: TSmallintField;
    cdsAudInternar101_aud: TSmallintField;
    cdsAudInternar102_aud: TSmallintField;
    cdsAudInternar103_aud: TSmallintField;
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
  FormAuditoriaInterna2015: TFormAuditoriaInterna2015;

implementation

uses frm_dm, Funcoes, frm_pesqPrgAudit2015, frm_Inicial, frm_AuditoriaAgenda2015;

{$R *.dfm}

procedure TFormAuditoriaInterna2015.AtualizaDados;
begin
   if dtChave.Text = '  /  /    ' then begin
      Exit;
   end
   else begin
      with cdsAudInterna do begin
         Active:= False;
         CommandText:= ' SELECT aud_codigo, data_aud, proc_aud, r02_aud, r03_aud, r411_aud, r42_aud,' +
                       ' r43_aud, r441_aud, r442_aud, r511_aud, r512_aud, r521_aud, r522_aud,' +
                       ' r53_aud, r61_aud, r62_aud, r63_aud, r711_aud, r712_aud, r713_aud,' +
                       ' r714_aud, r7151_aud, r7152_aud, r716_aud, r72_aud, r73_aud, r74_aud,' +
                       ' r75_aud, r81_aud, r821_aud, r822_aud, r823_aud, r824_aud, r83_aud,' +
                       ' r84_aud, r851_aud, r852_aud, r853_aud, r854_aud, r855_aud, r856_aud,' +
                       ' r86_aud, r87_aud, r91_aud, r912_aud, r913_aud, r92_aud, r93_aud,' +
                       ' r101_aud, r102_aud, r103_aud' +
                       ' FROM auditoria_interna2015' +
                       ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date) +
                       ' ORDER BY proc_aud';
         Active:= True;

         if cdsAudInterna.RecordCount = 0 then begin
            PreencheAuditoria2015(dtChave.Date);

            Active:= False;
            CommandText:= ' SELECT aud_codigo, data_aud, proc_aud, r02_aud, r03_aud, r411_aud, r42_aud,' +
                          ' r43_aud, r441_aud, r442_aud, r511_aud, r512_aud, r521_aud, r522_aud,' +
                          ' r53_aud, r61_aud, r62_aud, r63_aud, r711_aud, r712_aud, r713_aud,' +
                          ' r714_aud, r7151_aud, r7152_aud, r716_aud, r72_aud, r73_aud, r74_aud,' +
                          ' r75_aud, r81_aud, r821_aud, r822_aud, r823_aud, r824_aud, r83_aud,' +
                          ' r84_aud, r851_aud, r852_aud, r853_aud, r854_aud, r855_aud, r856_aud,' +
                          ' r86_aud, r87_aud, r91_aud, r912_aud, r913_aud, r92_aud, r93_aud,' +
                          ' r101_aud, r102_aud, r103_aud' +
                          ' FROM auditoria_interna2015' +
                          ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date) +
                          ' ORDER BY proc_aud';
            Active:= True;
         end;
      end;

      with cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT *' +
                       ' FROM auditoria_interna_rel2015' +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
         Active:= True;
      end;

      mmoEscopo.Text      := cdsAux.FieldByName('esco_aud').AsString;

      if cOperacao = 'I' then begin
         Botoes(False);
      end
      else begin
         Botoes(True);
      end;
   end;
end;

procedure TFormAuditoriaInterna2015.Botoes(flag: Boolean);
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

procedure TFormAuditoriaInterna2015.btnAgendarClick(Sender: TObject);
begin
   FormAuditoriaAgenda2015:= TFormAuditoriaAgenda2015.Create(nil);
   FormAuditoriaAgenda2015.sCodAuditoria:= cdsAudInternaaud_codigo.AsString;
   FormAuditoriaAgenda2015.ShowModal;
   FormAuditoriaAgenda2015.Release;
end;

procedure TFormAuditoriaInterna2015.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';
   Botoes(False);
   HabilitarCampos(True, True);
end;

procedure TFormAuditoriaInterna2015.btnCancelarClick(Sender: TObject);
begin
   AtualizaDados();
   HabilitarCampos(False, False);
   Botoes(True);
end;

procedure TFormAuditoriaInterna2015.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox(PChar('Será excluído o Programa e os dados do relatório de Auditoria. Confirma ?'),'Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then  begin
      try
         Auditoria('PROGRAMA DE AUDITORIA',dtChave.Text,'E', '');
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna2015' +
                          ' WHERE data_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna_rel2015' +
                          ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM auditoria_interna_rel_itens2015' +
                          ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
            Execute;
         end;
         LimparCampos();
         Application.MessageBox('Registro excluído corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro ao excluir.' + #13 + E.Message), 'Erro', MB_OK + MB_ICONSTOP);
         end;
      end;
   end;
end;

procedure TFormAuditoriaInterna2015.btnGravarClick(Sender: TObject);
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' UPDATE auditoria_interna_rel2015 SET' +
                       ' esco_aud = ' + QuotedStr(mmoEscopo.Text) +
                       ' WHERE dtpr_aud = ' + ArrumaDataSQL(dtChave.Date);
         Execute;
      end;

      Botoes(True);
      HabilitarCampos(False, False);
      Auditoria('PROGRAMA DE AUDITORIA ISO 9001:2015',DateToStr(dtChave.Date),'A', '');
      cOperacao:= '';
      Application.MessageBox('Dados gravados corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar os dados !' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormAuditoriaInterna2015.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos();
   Botoes(False);
   HabilitarCampos(True, True);
   TryFocus(dtChave);
end;

procedure TFormAuditoriaInterna2015.btnPesquisaClick(Sender: TObject);
begin
   FormPesqPrgAudit2015:= TFormPesqPrgAudit2015.Create(nil);
   FormPesqPrgAudit2015.codForm:= 1;
   FormPesqPrgAudit2015.ShowModal;
   FormPesqPrgAudit2015.Release;
end;

procedure TFormAuditoriaInterna2015.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormAuditoriaInterna2015.cdsAudInternaAfterPost(DataSet: TDataSet);
begin
   cdsAudInterna.ApplyUpdates(0);
end;

procedure TFormAuditoriaInterna2015.cdsAudInternaCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro FROM processos' +
                    ' WHERE codi_pro = ' + cdsAudInternaproc_aud.AsString;
      Active:= True;

      cdsAudInternaNomeProcesso.AsString:= FieldByName('nome_pro').AsString;
   end;
end;

procedure TFormAuditoriaInterna2015.dbgAuditoriaCellClick(Column: TColumn);
begin
   // Atribui os valores dos outros campos para os labels
//   cdsAudInterna.Edit;

   if Column.Field = cdsAudInternar02_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar02_aud.AsInteger = 0 then
         cdsAudInternar02_aud.AsInteger:= 1
      else
         cdsAudInternar02_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar03_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar03_aud.AsInteger = 0 then
         cdsAudInternar03_aud.AsInteger:= 1
      else
         cdsAudInternar03_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar411_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar411_aud.AsInteger = 0 then
         cdsAudInternar411_aud.AsInteger:= 1
      else
         cdsAudInternar411_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar42_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar42_aud.AsInteger = 0 then
         cdsAudInternar42_aud.AsInteger:= 1
      else
         cdsAudInternar42_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar43_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar43_aud.AsInteger = 0 then
         cdsAudInternar43_aud.AsInteger:= 1
      else
         cdsAudInternar43_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar441_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar441_aud.AsInteger = 0 then
         cdsAudInternar441_aud.AsInteger:= 1
      else
         cdsAudInternar441_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar442_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar442_aud.AsInteger = 0 then
         cdsAudInternar442_aud.AsInteger:= 1
      else
         cdsAudInternar442_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar511_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar511_aud.AsInteger = 0 then
         cdsAudInternar511_aud.AsInteger:= 1
      else
         cdsAudInternar511_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar512_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar512_aud.AsInteger = 0 then
         cdsAudInternar512_aud.AsInteger:= 1
      else
         cdsAudInternar512_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar521_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar521_aud.AsInteger = 0 then
         cdsAudInternar521_aud.AsInteger:= 1
      else
         cdsAudInternar521_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar522_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar522_aud.AsInteger = 0 then
         cdsAudInternar522_aud.AsInteger:= 1
      else
         cdsAudInternar522_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar53_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar53_aud.AsInteger = 0 then
         cdsAudInternar53_aud.AsInteger:= 1
      else
         cdsAudInternar53_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar61_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar61_aud.AsInteger = 0 then
         cdsAudInternar61_aud.AsInteger:= 1
      else
         cdsAudInternar61_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar62_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar62_aud.AsInteger = 0 then
         cdsAudInternar62_aud.AsInteger:= 1
      else
         cdsAudInternar62_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar63_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar63_aud.AsInteger = 0 then
         cdsAudInternar63_aud.AsInteger:= 1
      else
         cdsAudInternar63_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar711_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar711_aud.AsInteger = 0 then
         cdsAudInternar711_aud.AsInteger:= 1
      else
         cdsAudInternar711_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar712_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar712_aud.AsInteger = 0 then
         cdsAudInternar712_aud.AsInteger:= 1
      else
         cdsAudInternar712_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar713_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar713_aud.AsInteger = 0 then
         cdsAudInternar713_aud.AsInteger:= 1
      else
         cdsAudInternar713_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar714_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar714_aud.AsInteger = 0 then
         cdsAudInternar714_aud.AsInteger:= 1
      else
         cdsAudInternar714_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar7151_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar7151_aud.AsInteger = 0 then
         cdsAudInternar7151_aud.AsInteger:= 1
      else
         cdsAudInternar7151_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar7152_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar7152_aud.AsInteger = 0 then
         cdsAudInternar7152_aud.AsInteger:= 1
      else
         cdsAudInternar7152_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar716_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar716_aud.AsInteger = 0 then
         cdsAudInternar716_aud.AsInteger:= 1
      else
         cdsAudInternar716_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar72_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar72_aud.AsInteger = 0 then
         cdsAudInternar72_aud.AsInteger:= 1
      else
         cdsAudInternar72_aud.AsInteger:= 0;
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

   if Column.Field = cdsAudInternar75_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar75_aud.AsInteger = 0 then
         cdsAudInternar75_aud.AsInteger:= 1
      else
         cdsAudInternar75_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar81_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar81_aud.AsInteger = 0 then
         cdsAudInternar81_aud.AsInteger:= 1
      else
         cdsAudInternar81_aud.AsInteger:= 0;
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

   if Column.Field = cdsAudInternar854_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar854_aud.AsInteger = 0 then
         cdsAudInternar854_aud.AsInteger:= 1
      else
         cdsAudInternar854_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar855_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar855_aud.AsInteger = 0 then
         cdsAudInternar855_aud.AsInteger:= 1
      else
         cdsAudInternar855_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar856_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar856_aud.AsInteger = 0 then
         cdsAudInternar856_aud.AsInteger:= 1
      else
         cdsAudInternar856_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar86_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar86_aud.AsInteger = 0 then
         cdsAudInternar86_aud.AsInteger:= 1
      else
         cdsAudInternar86_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar87_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar87_aud.AsInteger = 0 then
         cdsAudInternar87_aud.AsInteger:= 1
      else
         cdsAudInternar87_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar91_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar91_aud.AsInteger = 0 then
         cdsAudInternar91_aud.AsInteger:= 1
      else
         cdsAudInternar91_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar912_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar912_aud.AsInteger = 0 then
         cdsAudInternar912_aud.AsInteger:= 1
      else
         cdsAudInternar912_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar913_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar913_aud.AsInteger = 0 then
         cdsAudInternar913_aud.AsInteger:= 1
      else
         cdsAudInternar913_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar92_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar92_aud.AsInteger = 0 then
         cdsAudInternar92_aud.AsInteger:= 1
      else
         cdsAudInternar92_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar93_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar93_aud.AsInteger = 0 then
         cdsAudInternar93_aud.AsInteger:= 1
      else
         cdsAudInternar93_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar101_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar101_aud.AsInteger = 0 then
         cdsAudInternar101_aud.AsInteger:= 1
      else
         cdsAudInternar101_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar102_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar102_aud.AsInteger = 0 then
         cdsAudInternar102_aud.AsInteger:= 1
      else
         cdsAudInternar102_aud.AsInteger:= 0;
   end;

   if Column.Field = cdsAudInternar103_aud then begin
      cdsAudInterna.Edit;
      if cdsAudInternar103_aud.AsInteger = 0 then
         cdsAudInternar103_aud.AsInteger:= 1
      else
         cdsAudInternar103_aud.AsInteger:= 0;
   end;

   if Column.Field <> cdsAudInternaNomeProcesso then begin
      cdsAudInterna.Post;
   end;
//   Self.Refresh;
end;


procedure TFormAuditoriaInterna2015.dbgAuditoriaColEnter(Sender: TObject);
begin
   if dbgAuditoria.SelectedField <> cdsAudInternaNomeProcesso then
      dbgAuditoria.Options:= dbgAuditoria.Options - [dgEditing]
   else
      dbgAuditoria.Options:= dbgAuditoria.Options + [dgEditing];
end;

procedure TFormAuditoriaInterna2015.dbgAuditoriaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   // Pinta CheckBox
   if Column.Field = cdsAudInternar02_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar02_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar03_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar03_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar411_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar411_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar42_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar42_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar43_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar43_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar441_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar441_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar442_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar442_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar511_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar511_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar512_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar512_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar521_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar521_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar522_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar522_aud.AsInteger = 0 then
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

   if Column.Field = cdsAudInternar61_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar61_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar62_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar62_aud.AsInteger = 0 then
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

   if Column.Field = cdsAudInternar711_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar711_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar712_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar712_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar713_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar713_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar714_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar714_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar7151_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar7151_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar7152_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar7152_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar716_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar716_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar72_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar72_aud.AsInteger = 0 then
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

   if Column.Field = cdsAudInternar75_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar75_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar81_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar81_aud.AsInteger = 0 then
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

   if Column.Field = cdsAudInternar854_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar854_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar855_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar855_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar856_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar856_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar86_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar86_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar87_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar87_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar91_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar91_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar912_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar912_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar913_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar913_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar92_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar92_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar93_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar93_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar101_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar101_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar102_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar102_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;

   if Column.Field = cdsAudInternar103_aud then begin
      dbgAuditoria.Canvas.FillRect(Rect);

      if cdsAudInternar103_aud.AsInteger = 0 then
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAuditoria.Canvas,Rect.Left+3,Rect.Top+1,2);
   end;
end;

procedure TFormAuditoriaInterna2015.dtChaveExit(Sender: TObject);
begin
   AtualizaDados();
end;

procedure TFormAuditoriaInterna2015.edtAnoKeyPress(Sender: TObject; var Key: Char);
begin
//   if not Numero(Key) then begin
//      if Key in [] then begin
//         Key:= #0;
//      end;
//   end;
end;

procedure TFormAuditoriaInterna2015.FormShow(Sender: TObject);
begin
   with cdsAudInterna do begin
      Active:= False;
   end;

   HabilitarCampos(False, False);

//   dtChave.SetFocus;
end;

procedure TFormAuditoriaInterna2015.HabilitarCampos(Flag, Codigo: Boolean);
begin
   dtChave.Enabled     := Flag;
   mmoEscopo.Enabled   := Flag;
   dbgAuditoria.Enabled:= Flag;
end;

procedure TFormAuditoriaInterna2015.LimparCampos;
begin
   dtChave.Clear;
   mmoEscopo.Clear;
   cdsAudInterna.Active:= False;
end;

procedure TFormAuditoriaInterna2015.mmoEscopoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

end.
