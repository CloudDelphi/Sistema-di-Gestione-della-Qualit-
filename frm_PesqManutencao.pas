unit frm_PesqManutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormPesqManutencao = class(TForm)
    pnl1: TPanel;
    dbgManutencao: TDBGrid;
    lblProcesso: TLabel;
    btnSelecionar: TBitBtn;
    zqryManutencao: TZQuery;
    dspManutencao: TDataSetProvider;
    cdsManutencao: TClientDataSet;
    cdsManutencaoDescItem: TStringField;
    cdsManutencaoDescProcesso: TStringField;
    cdsManutencaocodi_inf: TLargeintField;
    cdsManutencaocodi_man: TLargeintField;
    cdsManutencaodata_man: TDateTimeField;
    cdsManutencaoonde_man: TLargeintField;
    cdsManutencaoquem_man: TLargeintField;
    cdsManutencaoproc_man: TLargeintField;
    CdsManutencaoefic_man: TWideStringField;
    cdsManutencaoIdentItem: TStringField;
    dsManutencao: TDataSource;
    cdsManutencaoanom_man: TWideMemoField;
    cdsManutencaocomo_man: TWideMemoField;
    cdsManutencaooque_man: TWideMemoField;
    cdsManutencaoquan_man: TWideMemoField;
    btnSair: TBitBtn;
    cdsManutencaoquando: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cdsManutencaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPesqManutencao: TFormPesqManutencao;

implementation

uses frm_dm, frm_ManutencaoFecha, frm_Inicial;

{$R *.dfm}

procedure TFormPesqManutencao.btnSelecionarClick(Sender: TObject);
begin
   FormManutencaoFecha.sCodMan:= cdsManutencao.FieldByName('codi_man').AsString;
   FormManutencaoFecha.edtIdentItem.Text:= cdsManutencao.FieldByName('IdentItem').AsString;
   FormManutencaoFecha.PreencherCampos();
   FormManutencaoFecha.AtualizarDados();
   FormManutencaoFecha.LimparCamposFilho();
//   FormManutencaoFecha.Botoes(True);
   btnSairClick(Self);
end;

procedure TFormPesqManutencao.cdsManutencaoCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT desc_inf, iden_inf from infraestrutura'+
                    ' WHERE codi_inf = ' + QuotedStr(cdsManutencao.FieldByName('codi_inf').AsString);
      Active:= True;
      cdsManutencao.FieldByName('DescItem').AsString:= dm.cdsAuxiliar.FieldByName('desc_inf').AsString;
      cdsManutencao.FieldByName('IdentItem').AsString:= dm.cdsAuxiliar.FieldByName('iden_inf').AsString;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro from processos'+
                    ' WHERE codi_pro = ' + QuotedStr(cdsManutencao.FieldByName('proc_man').AsString);
      Active:= True;
      cdsManutencao.FieldByName('DescProcesso').AsString:= dm.cdsAuxiliar.FieldByName('nome_pro').AsString;
   end;
end;

procedure TFormPesqManutencao.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPesqManutencao.FormShow(Sender: TObject);
begin
   with cdsManutencao do begin
      Active:= False;
      CommandText:= ' SELECT anom_man, codi_inf, codi_man, como_man, data_man, onde_man,' +
                    ' oque_man, quan_man, quem_man, proc_man, efic_man, TC.valo_com as Quando' +
                    ' FROM manutencao' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 19 and TC.codi_com = CAST(quan_man AS Integer)' +
                    ' WHERE proc_man = ' + FormManutencaoFecha.sCodProcesso;
//
      Active:= True;
   end;
end;

end.
