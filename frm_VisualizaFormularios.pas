unit frm_VisualizaFormularios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, ShellAPI, DB, DBClient,
  Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormVisualizaFormularios = class(TForm)
    Panel1: TPanel;
    dbgForm: TDBGrid;
    lblCodigo: TLabel;
    zqryFormularios: TZQuery;
    dspFormularios: TDataSetProvider;
    cdsFormularios: TClientDataSet;
    dsFormularios: TDataSource;
    zqryProtecao: TZQuery;
    dspProtecao: TDataSetProvider;
    cdsProtecao: TClientDataSet;
    cdsProtecaocodi_com: TLargeintField;
    cdsProtecaovalo_com: TWideStringField;
    dsProtecao: TDataSource;
    btnExcel: TBitBtn;
    btnSair: TBitBtn;
    btnVisualizar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cdsFormulariosCalcFields(DataSet: TDataSet);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    sCodigo: string;
  public
    { Public declarations }
  end;

var
  FormVisualizaFormularios: TFormVisualizaFormularios;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormVisualizaFormularios.btnExcelClick(Sender: TObject);
begin
   if cdsFormularios.RecordCount <= 0 then begin
      Application.MessageBox('Não existem Formulários para esse processo', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      ExpExcel(dbgForm, cdsFormularios, 'Formulários', Self);
   end;
end;

procedure TFormVisualizaFormularios.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormVisualizaFormularios.btnVisualizarClick(Sender: TObject);
begin
   if cdsFormularios.RecordCount <= 0 then begin
      Application.MessageBox('Não existem Formulários para esse processo', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      AbrirArquivo(cdsFormularios.FieldByName('arqu_for').AsString, Self.Name);
   end;
end;

procedure TFormVisualizaFormularios.cdsFormulariosCalcFields(DataSet: TDataSet);
begin
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT for_codprocesso, for_codform, for_disposicao, for_retencao, for_recuperacao,' +
//                    ' for_tipo_protecao, for_codigo, TC.valo_com as disposicao,' +
//                    ' TC1.valo_com as retencao, TC2.valo_com as recuperacao, TC3.valo_com as tipo_protecao' +
//                    ' FROM formularios_locais' +
//                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 3 AND TC.codi_com = for_disposicao' +
//                    ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 10 AND TC1.codi_com = for_retencao' +
//                    ' INNER JOIN tabela_combos TC2 ON TC2.tipo_com = 2 AND TC2.codi_com = for_recuperacao' +
//                    ' INNER JOIN tabela_combos TC3 ON TC3.tipo_com = 1 AND TC3.codi_com = for_tipo_protecao' +
//                    ' WHERE for_codprocesso = ' + QuotedStr(Alltrim(sCodigo));
//      Active:= True;
//
//      cdsFormularios.FieldByName('DescDisposicao').AsString:= FieldByName('disposicao').AsString;
//      cdsFormularios.FieldByName('DescRetencao').AsString:= FieldByName('retencao').AsString;
//      cdsFormularios.FieldByName('DescRecuperacao').AsString:= FieldByName('recuperacao').AsString;
//      cdsFormularios.FieldByName('DescProtecaoNovo').AsString:= FieldByName('tipo_protecao').AsString;
//   end;
end;

procedure TFormVisualizaFormularios.FormShow(Sender: TObject);
begin
   sCodigo:= lblCodigo.Caption;

   with cdsProtecao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 1' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsFormularios do begin
      Active:= False;
      CommandText:= ' SELECT DISTINCT nume_for, revi_for, iden_for, arqu_for,' +
                    ' TC.valo_com as tipo_protecao' +
                    ' FROM formularios F' +
                    ' INNER JOIN formularios_locais FL ON FL.for_codForm = F.codi_for' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 1 AND TC.codi_com = FL.for_tipo_protecao' +
                    ' WHERE for_codProcesso = ' + QuotedStr(Alltrim(sCodigo)) +
                    ' ORDER BY nume_for';
      Active:= True;
   end;


   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro from processos' +
                    ' WHERE codi_pro = ' + QuotedStr(Alltrim(sCodigo));
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;
end;

end.
