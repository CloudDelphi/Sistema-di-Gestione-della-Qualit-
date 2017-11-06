unit frm_Log;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, rxToolEdit, DBCtrls, FMTBcd,
  DBClient, Provider, DB, SqlExpr, Grids, DBGrids, frxClass, frxDBSet,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormLog = class(TForm)
    pnl1: TPanel;
    dblUsuario: TDBLookupComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtDataIni: TDateEdit;
    lbl3: TLabel;
    edtDataFim: TDateEdit;
    dspLog: TDataSetProvider;
    cdsLog: TClientDataSet;
    chkUsuarios: TCheckBox;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    dsUsuario: TDataSource;
    dbgLog: TDBGrid;
    dsLog: TDataSource;
    chkDatas: TCheckBox;
    dblDoc: TDBLookupComboBox;
    lbl6: TLabel;
    chkDoc: TCheckBox;
    dspListaMestra: TDataSetProvider;
    cdsListaMestra: TClientDataSet;
    dsListaMestra: TDataSource;
    frxdbLog: TfrxDBDataset;
    zqryLog: TZQuery;
    zqryUsuario: TZQuery;
    zqryListaMestra: TZQuery;
    cdsUsuarionome_usu: TWideStringField;
    cdsUsuarioproc_usu: TWideStringField;
    cdsUsuariosenh_usu: TWideStringField;
    cdsListaMestraapro_lis: TWideStringField;
    cdsListaMestraarma_lis: TWideStringField;
    cdsListaMestraatua_lis: TWideStringField;
    cdsListaMestracodi_lis: TLargeintField;
    cdsListaMestradata_lis: TDateTimeField;
    cdsListaMestradesc_lis: TWideStringField;
    cdsListaMestradtap_lis: TDateTimeField;
    cdsListaMestraiden_lis: TWideStringField;
    cdsListaMestraproc_lis: TLargeintField;
    cdsListaMestraqtde_lis: TLargeintField;
    cdsListaMestraquem_lis: TLargeintField;
    cdsListaMestraresp_lis: TLargeintField;
    cdsListaMestrarevi_lis: TWideStringField;
    cdsListaMestratipo_lis: TLargeintField;
    cdsLogcodi_aud: TLargeintField;
    cdsLogdata_aud: TDateTimeField;
    cdsLogdocu_aud: TWideStringField;
    cdsLogoper_aud: TWideStringField;
    cdsLogtabe_aud: TWideStringField;
    cdsLoguser_aud: TWideStringField;
    cdsLogrevisao: TWideStringField;
    cdsListaMestraarqu_lis: TMemoField;
    btn1: TBitBtn;
    btnPesquisar: TBitBtn;
    btn2: TBitBtn;
    frxReport1: TfrxReport;
    procedure chkDocClick(Sender: TObject);
    procedure chkDatasClick(Sender: TObject);
    procedure chkUsuariosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLog: TFormLog;

implementation

uses frm_dm, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormLog.btn2Click(Sender: TObject);
begin
   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_LogDocumentos.fr3');
//      Variables['VlMedia']:= StrToFloat(lbMedia.Caption);
      ShowReport;
   end;

   Auditoria('LOG DE DOCUMENTOS','','R', '');
end;

procedure TFormLog.btnPesquisarClick(Sender: TObject);
begin
   if (dblUsuario.KeyValue = Null) and (chkUsuarios.Checked = False) then begin
      Application.MessageBox('Escolha um usuário', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;
   if (dblDoc.KeyValue = Null) and (chkDoc.Checked = False) then begin
      Application.MessageBox('Escolha um documento', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with cdsLog do begin
      Active:= False;
      CommandText:= ' SELECT codi_aud, data_aud, docu_aud, oper_aud, tabe_aud, user_aud, revisao ' +
                    ' FROM auditoria' +
                    ' WHERE tabe_aud = ' + QuotedStr('LISTA_MESTRA') +
                    ' AND OPER_AUD = ' + QuotedStr('LIDA');
      if chkUsuarios.Checked = False then begin
         CommandText:= CommandText + ' AND user_aud = ' + QuotedStr(dblUsuario.KeyValue);
      end;
      if chkDatas.Checked = False then begin
         CommandText:= CommandText + ' AND data_aud between ' + ArrumaDataSQL(edtDataIni.Date) + QuotedStr(' 00:00:00') +
                                     ' AND ' + ArrumaDataSQL(edtDataFim.Date) + QuotedStr(' 23:59:59');
      end;
      if chkDoc.Checked = False then begin
         CommandText:= CommandText + ' AND docu_aud = ' + QuotedStr(dblDoc.KeyValue);
      end;
      CommandText:= CommandText + ' ORDER BY user_aud';
//      ShowMessage(CommandText);

      Active:= True;

      if cdsLog.RecordCount = 0 then begin
         Application.MessageBox('Não há dados para os critérios selecionados', 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure TFormLog.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormLog.chkDatasClick(Sender: TObject);
begin
   edtDataIni.Enabled:= not chkDatas.Checked;
   edtDataFim.Enabled:= not chkDatas.Checked;
end;

procedure TFormLog.chkDocClick(Sender: TObject);
begin
   dblDoc.Enabled:= not chkDoc.Checked;
end;

procedure TFormLog.chkUsuariosClick(Sender: TObject);
begin
   dblUsuario.Enabled:= not chkUsuarios.Checked;
end;

procedure TFormLog.FormShow(Sender: TObject);
begin
   with cdsLog do begin
      Active:= False;
      CommandText:= ' SELECT codi_aud, data_aud, docu_aud, oper_aud, tabe_aud, user_aud, revisao ' +
                    ' FROM auditoria' +
                    ' WHERE tabe_aud = ' + QuotedStr('LISTA_MESTRA') +
                    ' AND OPER_AUD = ' + QuotedStr('LIDA') +
                    ' ORDER BY user_aud';
      Active:= True;
   end;

   cdsUsuario.Active:= False;
   cdsUsuario.Active:= True;

   cdsListaMestra.Active:= False;
   cdsListaMestra.Active:= True;

   chkUsuarios.Checked:= True;
   chkDatas.Checked   := True;
   chkDoc.Checked     := True;

   edtDataIni.Date:= Date();
   edtDataFim.Date:= Date();
end;

end.
