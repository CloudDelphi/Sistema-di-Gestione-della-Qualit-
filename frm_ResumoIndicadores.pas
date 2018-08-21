unit frm_ResumoIndicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls,
  Mask, frxClass, frxDBSet, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  DBCtrls, Grids, DBGrids;

type
  TFormResumoInd = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    dspResumo: TDataSetProvider;
    cdsResumo: TClientDataSet;
    edtMesIni: TMaskEdit;
    edtMesFim: TMaskEdit;
    lbl3: TLabel;
    frxdbResumoIndicador: TfrxDBDataset;
    zqryResumo: TZQuery;
    cdsResumonome_pro1: TWideStringField;
    cdsResumodesc_ind1: TWideStringField;
    cdsResumovalo_vin: TFloatField;
    frxReport1: TfrxReport;
    cdsResumometaconcatenada: TWideMemoField;
    cdsResumomesano: TWideMemoField;
    cdsResumomedia: TFloatField;
    lbl4: TLabel;
    dblProcessos: TDBLookupComboBox;
    chkTodosProcessos: TCheckBox;
    lbl5: TLabel;
    dblIndicador: TDBLookupComboBox;
    chkTodosInd: TCheckBox;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cdsIndicadores: TClientDataSet;
    dsIndicadores: TDataSource;
    dspIndicadores: TDataSetProvider;
    zqryIndicadores: TZQuery;
    dbgResumo: TDBGrid;
    dsResumo: TDataSource;
    btnSair: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnExcel: TBitBtn;
    procedure btnImpressoraClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure Impressao(sTipoImp: string);
    procedure FormShow(Sender: TObject);
    procedure chkTodosProcessosClick(Sender: TObject);
    procedure chkTodosIndClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormResumoInd: TFormResumoInd;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormResumoInd.chkTodosIndClick(Sender: TObject);
begin
   dblIndicador.Enabled:= not chkTodosInd.Checked;
end;

procedure TFormResumoInd.chkTodosProcessosClick(Sender: TObject);
begin
   dblProcessos.Enabled:= not chkTodosProcessos.Checked;
end;

procedure TFormResumoInd.FormShow(Sender: TObject);
begin
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   cdsIndicadores.Active:= False;
   cdsIndicadores.Active:= True;

   edtMesIni.Text:= '01/' + FormatDateTime('yyyy',Date());
   edtMesFim.Text:= '12/' + FormatDateTime('yyyy',Date());
end;

procedure TFormResumoInd.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormResumoInd.btnExcelClick(Sender: TObject);
begin
   Impressao('E');
end;

procedure TFormResumoInd.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormResumoInd.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormResumoInd.Impressao(sTipoImp: string);
   var
   sMesIni, sMesFim: string;
   sMedia: string;
begin
   sMesIni:= Copy(edtMesIni.Text,4,4) + Copy(edtMesIni.Text,1,2);
   sMesFim:= Copy(edtMesFim.Text,4,4) + Copy(edtMesFim.Text,1,2);

   with cdsResumo do begin
      Active:= False;
      CommandText:= ' SELECT P.nome_pro, I.desc_ind, valo_vin, TC.valo_com ||  ' + QuotedStr(' ') + ' || IM.met_valor as MetaConcatenada, ' +
                    ' SUBSTR(cast(peri_vin as varchar),5,2) || ' + QuotedStr('/') + ' || SUBSTR(cast(peri_vin as varchar),1,4) AS MesAno, ' +
                    '(SELECT AVG(valo_vin)' +
                    '    FROM valor_indicador' +
                    '    WHERE peri_vin between ' + QuotedStr(sMesIni) + ' AND ' + QuotedStr(sMesFim) +
                    '    AND codi_ind = V.codi_ind' +
                    '    GROUP BY V.codi_ind) as Media' +
                    ' FROM valor_indicador V' +
                    ' INNER JOIN processos P ON P.codi_pro = V.proc_vin ' +
                    ' INNER JOIN indicadores I ON I.codi_ind = V.codi_ind ' +
                    ' INNER JOIN indicadores_metas IM ON IM.met_codindicador = V.codi_ind AND CAST(IM.met_anomes as integer) = peri_vin' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = IM.met_tipo AND TC.tipo_com = 17' +
                    ' WHERE peri_vin between ' + QuotedStr(sMesIni) + ' AND ' + QuotedStr(sMesFim);
                  if (chkTodosProcessos.Checked = False) and (ValidarDBLookup(dblProcessos)) then begin
                    CommandText:= CommandText +  ' AND P.codi_pro = ' + IntToStr(dblProcessos.KeyValue);
                  end;
                  if (chkTodosInd.Checked = False) and (ValidarDBLookup(dblIndicador)) then begin
                    CommandText:= CommandText +  ' AND V.codi_ind = ' + IntToStr(dblIndicador.KeyValue);
                  end;

      CommandText:= CommandText + ' ORDER BY nome_pro, V.codi_ind, sequ_vin';
      Active:= True;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ResumoIndicadores.fr3');
      if sTipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         if sTipoImp = 'V' then begin
            ShowReport;
         end
         else begin
            ExpExcel(dbgResumo, cdsResumo, 'Resumo dos Indicadores', Self);
         end;
      end;
   end;
end;

end.
