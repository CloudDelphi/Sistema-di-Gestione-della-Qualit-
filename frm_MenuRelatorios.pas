unit frm_MenuRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, frxClass, frxDBSet, DB,
  DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls;

type
  TFormMenuRelatorio = class(TForm)
    Panel1: TPanel;
    sbSair: TSpeedButton;
    sbCadEmpresa: TSpeedButton;
    sbCadColaboradores: TSpeedButton;
    sbCadFuncoes: TSpeedButton;
    sbCadHabilidades: TSpeedButton;
    sbCadTreinamentos: TSpeedButton;
    BbtnListaMestra: TSpeedButton;
    sbAprovacao: TSpeedButton;
    sbCadProcesso: TSpeedButton;
    sbPMC: TSpeedButton;
    tvMenuOpcoes: TTreeView;
    frxReport: TfrxReport;
    frxdbRel: TfrxDBDataset;
    zqryImpressao: TZQuery;
    dspImpressao: TDataSetProvider;
    cdsImpressao: TClientDataSet;
    dsImpressao: TDataSource;
    zqryHab: TZQuery;
    dspHab: TDataSetProvider;
    cdsHab: TClientDataSet;
    dsHab: TDataSource;
    frxDBHab: TfrxDBDataset;
    zqryAvalHab: TZQuery;
    dspAvalHab: TDataSetProvider;
    cdsAvalHab: TClientDataSet;
    dsAvalHab: TDataSource;
    frxDBAvalHab: TfrxDBDataset;
    cdsHabcodi_col: TLargeintField;
    cdsHabcodi_hab: TLargeintField;
    cdsHabnota_hab: TFloatField;
    cdsHabhab_ano: TWideStringField;
    cdsHabdesc_hab: TWideStringField;
    cdsAvalHabnome_col: TWideStringField;
    cdsAvalHabdesc_fun: TWideStringField;
    cdsAvalHabTotPontos: TFloatField;
    cdsAvalHabcodi_col: TLargeintField;
    cdsAvalHabcodi_hab: TLargeintField;
    cdsAvalHabnota_hab: TFloatField;
    cdsAvalHabhab_ano: TWideStringField;
    cdsAvalHabdesc_hab: TWideStringField;
    pnlAvalHab: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    edtPeriodo: TEdit;
    lbl1: TLabel;
    lbl5: TLabel;
    dblColaborador: TDBLookupComboBox;
    zqryColab: TZQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    dsColab: TDataSource;
    cdsColabcodi_col: TLargeintField;
    cdsColabnome_col: TWideStringField;
    chkTodosColab: TCheckBox;
    cdsAvalHabTotalHab: TLargeintField;
    cdsAvalHabcol_avaliador: TWideStringField;
    procedure sbSairClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tvMenuOpcoesDblClick(Sender: TObject);
    procedure ImprimeAvalHab(tipo: string);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure chkTodosColabClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenuRelatorio: TFormMenuRelatorio;

implementation

uses frm_Principal, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormMenuRelatorio.btnImpressoraClick(Sender: TObject);
begin
   ImprimeAvalHab('I');
end;

procedure TFormMenuRelatorio.btnSairImpClick(Sender: TObject);
begin
   pnlAvalHab.Visible:= False;
end;

procedure TFormMenuRelatorio.btnVideoClick(Sender: TObject);
begin
   ImprimeAvalHab('V');
end;

procedure TFormMenuRelatorio.chkTodosColabClick(Sender: TObject);
begin
   dblColaborador.Enabled:= not chkTodosColab.Checked;
end;

procedure TFormMenuRelatorio.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure TFormMenuRelatorio.ImprimeAvalHab(tipo: string);
begin
   with cdsAvalHab do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, C.col_avaliador, F.desc_fun, CH.codi_col, CH.hab_ano, ' +
                       ' (SELECT SUM(CH2.nota_hab) FROM colab_habilidades CH2 ' +
                       '     WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + edtPeriodo.Text + ') AS TotPontos,' +
                       ' (SELECT COUNT(*) FROM colab_habilidades CH2' +
                       '      WHERE CH2.codi_col = CH.codi_col AND CH2.hab_ano = ' + edtPeriodo.Text + ') AS TotalHab, ' +
                       ' CH.codi_col, CH.codi_hab, CH.nota_hab, CH.hab_ano, H.desc_hab' +
                       ' FROM colab_habilidades CH' +
                       ' INNER JOIN Colaboradores C ON C.Codi_col = CH.Codi_col' +
                       ' INNER JOIN Funcoes F ON F.codi_fun = C.func_col' +
                       ' INNER JOIN habilidades H on H.codi_hab = CH.codi_hab' +
                       ' WHERE CH.hab_ano = ' + edtPeriodo.Text;

         if chkTodosColab.Checked = False then begin
            CommandText:= CommandText + ' AND CH.codi_col = ' + FloatToStr(dblColaborador.KeyValue);
         end;
         CommandText:= CommandText + ' ORDER BY C.nome_col';
         Active:= True;
   end;

   with frxReport do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AvalHabilidades.fr3');
      if tipo = 'I' then begin
//       Imprimir direto
         PrepareReport;
//            PrintOptions.Printer:= 'CutePDF Writer';
         PrintOptions.ShowDialog:= True;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

procedure TFormMenuRelatorio.sbSairClick(Sender: TObject);
begin
   Self.Close;
   t_Principal.dbimage1.Visible:= True;
end;

procedure TFormMenuRelatorio.tvMenuOpcoesDblClick(Sender: TObject);
begin
   if tvMenuOpcoes.Selected.Text = 'Pendências da Matriz de Competências' then begin
      with cdsImpressao do begin
         Active:= False;
         CommandText:= ' SELECT C.codi_col, C.nome_col, F.desc_fun, ' +
                       ' (select orde_com from tabela_combos' +
                       ' where tipo_com = 7 and codi_com = expe_fun) >' +
                       ' (select orde_com from tabela_combos' +
                       ' where tipo_com = 7 and codi_com = expe_col) as Experiencia, ' +
                       ' TC.orde_com <= TF.orde_com as Educacao,' +
                       ' expe_fun, educ_fun, expe_col, educ_col,' +
                       ' (SELECT Count(*) FROM colab_treinamentos CT' +
                       '     WHERE CT.codi_col = C.codi_col' +
                       '     and (CT.dtpr_tre < now() and CT.dtre_tre = "0000-00-00 00:00:00")) as PendTreinam,' +
                       ' (SELECT Count(*) FROM colab_habilidades CH' +
                       ' WHERE CH.codi_col = C.codi_col' +
                       ' and CH.nota_hab < 3 and CH.hab_ano = ' + FormatDateTime('yyyy', Date()) + ') as PendHab' +
                       ' FROM Funcoes F' +
                       ' INNER JOIN Colaboradores C on codi_fun = func_col' +
                       ' INNER JOIN Tabela_Combos TC ON TC.codi_com = C.educ_col and TC.tipo_com = 6' +
                       ' INNER JOIN Tabela_Combos TF ON TF.codi_com = F.educ_fun and TF.tipo_com = 6' +
                       ' ORDER BY C.nome_col';

         Active:= True;
      end;

      with frxReport do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_PendenciasMatriz.fr3');
         ShowReport;
      end;

   end;

   if tvMenuOpcoes.Selected.Text = 'Avaliação de Habilidades' then begin
      pnlAvalHab.Top     := Self.Height div 2 - pnlAvalHab.Height div 2 - 20;
      pnlAvalHab.Left    := Self.Width div 2 - pnlAvalHab.Width div 2;
      pnlAvalHab.Visible := True;

      edtPeriodo.Text:= FormatDateTime('YYYY',Date());

      cdsColab.Active:= True;
   end;
end;

end.
