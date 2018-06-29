unit frm_VisualizaAnaliseCritica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset, Mask,
  rxToolEdit, DBCtrls, frxClass, frxDBSet;

type
  TFormVisualizaAnalise = class(TForm)
    lblCodigo: TLabel;
    dbgAnalise: TDBGrid;
    pnlBotoes: TPanel;
    dspVisualizaAnalise: TDataSetProvider;
    cdsVisualizaAnalise: TClientDataSet;
    cds6: TStringField;
    dsVisualizaAnalise: TDataSource;
    cdsVisualizaAnaliseSaidas: TStringField;
    zqryVisualizaAnalise: TZQuery;
    pnlImpressao: TPanel;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    pnl2: TPanel;
    rgParecer: TRadioGroup;
    dblResponsavel: TDBLookupComboBox;
    edtDtInicial: TDateEdit;
    edtDtFinal: TDateEdit;
    chkResponsavel: TCheckBox;
    zqryImpressao: TZQuery;
    dspImpressao: TDataSetProvider;
    cdsImpressao: TClientDataSet;
    cdsImpressaoNomeResp: TStringField;
    dsImpressao: TDataSource;
    frxdbAnaliseCritica: TfrxDBDataset;
    btn1: TBitBtn;
    btnImprimirAnalise: TBitBtn;
    btnImprimir: TBitBtn;
    frxReport1: TfrxReport;
    cdsImpressaocodi_ana: TLargeintField;
    cdsImpressaoentr_ana: TWideMemoField;
    cdsImpressaocodi_aac: TLargeintField;
    cdsImpressaopare_aac: TWideStringField;
    cdsImpressaopraz_aac: TDateTimeField;
    cdsImpressaoproc_aac: TLargeintField;
    cdsImpressaoresp_aac: TLargeintField;
    cdsImpressaosaid_aac: TWideMemoField;
    f: TDateTimeField;
    cdsImpressaoresu_ana: TWideMemoField;
    cdsImpressaoresultados: TWideMemoField;
    cdsVisualizaAnalisepare_aac: TWideStringField;
    cdsVisualizaAnalisepraz_aac: TDateTimeField;
    cdsVisualizaAnalisecodi_aac: TLargeintField;
    cdsVisualizaAnalisecodi_ana: TLargeintField;
    cdsVisualizaAnalisesaid_aac: TWideMemoField;
    cdsVisualizaAnaliseresp_aac: TLargeintField;
    zqryExcel: TZQuery;
    dspExcel: TDataSetProvider;
    cdsExcel: TClientDataSet;
    cdsExcelpare_aac: TWideStringField;
    cdsExcelpraz_aac: TDateTimeField;
    cdsExcelsaid_aac: TWideMemoField;
    cdsExcelnome_col: TWideStringField;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    btnExcel: TBitBtn;
    procedure cdsVisualizaAnaliseCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure AtualizaSql;
    procedure chkResponsavelClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnImprimirAnaliseClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoProcesso: string;
  end;

var
   FormVisualizaAnalise: TFormVisualizaAnalise;

implementation

uses frm_dm, Funcoes, frm_Tartaruga, frm_Inicial, frm_CadAnaliseCritica;

{$R *.dfm}

procedure TFormVisualizaAnalise.AtualizaSql;
begin
   with cdsVisualizaAnalise do begin
      Active:= False;
      CommandText:= ' SELECT codi_aac, codi_ana, pare_aac,' +
                    ' praz_aac, resp_aac, said_aac, proc_aac'+
                    ' FROM analise_acoes' +
                    ' WHERE proc_aac = ' + QuotedStr(AllTrim(sCodigoProcesso)) +
                    '       and (pare_aac = ' + QuotedStr('NS') + ' OR pare_aac = ' + QuotedStr('SP') + ')' +
                    ' ORDER BY resp_aac';
      Active:= True;
   end;

   with cdsExcel do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormVisualizaAnalise.btn1Click(Sender: TObject);
begin
   pnlImpressao.Visible:= False;
end;

procedure TFormVisualizaAnalise.btnExcelClick(Sender: TObject);
begin
   ExpExcel(dbgAnalise, cdsExcel, 'Análise Crítica', Self);
end;

procedure TFormVisualizaAnalise.btnImprimirClick(Sender: TObject);
begin
   pnlImpressao.Top    := Self.Height div 2 - pnlImpressao.Height div 2 - 20;
   pnlImpressao.Left   := Self.Width div 2 - pnlImpressao.Width div 2;
   pnlImpressao.Visible:= True;
end;

procedure TFormVisualizaAnalise.btnImprimirAnaliseClick(Sender: TObject);
var
   sParecer: string;
begin
   if (dblResponsavel.KeyValue = Null) and (chkResponsavel.Checked = False) then begin
      Application.MessageBox('Selecione um responsável ou marque TODOS !', 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   case rgParecer.ItemIndex of
      0: sParecer:= 'Like ' + QuotedStr('%S%');
      1: sParecer:= '= ' + QuotedStr('S');
      2: sParecer:= '= ' + QuotedStr('SP');
      3: sParecer:= '= ' + QuotedStr('NS');
   end;

//   with cdsAnalise do begin
//      Active:= False;
//      Active:= True;
//   end;

   with cdsImpressao do begin
      Active:= False;
      CommandText:= ' SELECT A.codi_ana, A.entr_ana, A.resu_ana, ' +
                    ' C.codi_aac, C.pare_aac, C.praz_aac, C.proc_aac, C.resp_aac, C.said_aac,' +
                    ' C.dcad_aac, aac_resultados as Resultados' +
                    ' from analise A' +
                    ' INNER JOIN  analise_acoes C ON A.codi_ana = C.codi_ana' +
                    ' WHERE C.pare_aac ' + sParecer +
                    ' AND C.proc_aac = ' + sCodigoProcesso;
      if chkResponsavel.Checked = False then begin
         CommandText:= CommandText + ' AND C.resp_aac = ' + IntToStr(dblResponsavel.KeyValue);
      end;

      CommandText:= CommandText + ' AND C.dcad_aac BETWEEN ' + ArrumaDataSQL(edtDtInicial.Date) +
                                  ' AND ' + ArrumaDataSQL(edtDtFinal.Date) +
                                  ' ORDER BY A.entr_ana';
      Active:= True;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AnaliseCritica.fr3');
      ShowReport;
   end;
end;

procedure TFormVisualizaAnalise.btnSairClick(Sender: TObject);
begin
   FormTartaruga.VerificaPendencias;
   Self.Close;
end;

procedure TFormVisualizaAnalise.btnVisualizarClick(Sender: TObject);
begin
   FormCadAnaliseCritica:= TFormCadAnaliseCritica.Create(nil);
   FormCadAnaliseCritica.iTela:= 1;
   FormCadAnaliseCritica.iCodigoAcao:= cdsVisualizaAnalisecodi_aac.AsInteger;
   FormCadAnaliseCritica.iCodigoEntrada:= cdsVisualizaAnalisecodi_ana.AsInteger;
   FormCadAnaliseCritica.ShowModal;
   FormCadAnaliseCritica.Release;

//   t_CadAcoesAnalise:= Tt_CadAcoesAnalise.Create(nil);
//   t_CadAcoesAnalise.sAcao:= 'A';
//   t_CadAcoesAnalise.iTela:= 2;
//   t_CadAcoesAnalise.iCodigoAnalise:= cdsVisualizaAnalisecodi_aac.AsInteger;
//   t_CadAcoesAnalise.sCodigoProcesso:= sCodigoProcesso;
//   t_CadAcoesAnalise.ShowModal;
//   AtualizaSql();
//   t_CadAcoesAnalise.Release;
end;

procedure TFormVisualizaAnalise.cdsVisualizaAnaliseCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select nome_col from colaboradores'+
                    ' Where codi_col = ' + QuotedStr(cdsVisualizaAnalise.FieldByName('resp_aac').AsString);
      Active:= True;
      cdsVisualizaAnalise.FieldByName('NomeResp').AsString:= dm.cdsAuxiliar.FieldByName('nome_col').AsString
   end;

//   cdsVisualizaAnaliseSaidas.AsString:= Copy(cdsVisualizaAnalisesaid_aac.AsString,1,50);
   cdsVisualizaAnalise.FieldByName('Saidas').AsString:= Copy(cdsVisualizaAnalisesaid_aac.AsString,1,50);
end;

procedure TFormVisualizaAnalise.chkResponsavelClick(Sender: TObject);
begin
   dblResponsavel.Enabled:= not chkResponsavel.Checked;
end;

procedure TFormVisualizaAnalise.FormShow(Sender: TObject);
begin
//   sCodigoProcesso:= lblCodigo.Caption;
   AtualizaSql;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro FROM processos' +
                    ' WHERE codi_pro = ' + QuotedStr(AllTrim(sCodigoProcesso));
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;

   rgParecer.ItemIndex   := 0;
   edtDtInicial.Date     := Date();
   edtDtFinal.Date       := Date();
   chkResponsavel.Checked:= True;
   pnlImpressao.Visible  := False;
end;

end.
