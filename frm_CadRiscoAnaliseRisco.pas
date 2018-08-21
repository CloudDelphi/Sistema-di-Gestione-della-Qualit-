unit frm_CadRiscoAnaliseRisco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls, frxClass, frxDBSet;

type
  TFormAnaliseRisco = class(TForm)
    pnl1: TPanel;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    pnlFiltro: TPanel;
    dbgRiscos: TDBGrid;
    zqryAnalise: TZQuery;
    dspAnalise: TDataSetProvider;
    cdsAnalise: TClientDataSet;
    dsAnalise: TDataSource;
    grpProcesso: TGroupBox;
    rgPMC: TRadioGroup;
    rgTipo: TRadioGroup;
    dblProcesso: TDBLookupComboBox;
    chkTodosProcesso: TCheckBox;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    cdsAnalisemac_codigo: TIntegerField;
    cdsAnalisevariavel: TWideStringField;
    cdsAnalisemac_processo: TIntegerField;
    cdsAnaliseprocesso: TWideStringField;
    cdsAnalisetipovar: TWideStringField;
    cdsAnalisefator: TWideStringField;
    cdsAnalisepmc: TWideStringField;
    cdsAnalisetipo: TWideStringField;
    btnGraficos: TBitBtn;
    grp1: TGroupBox;
    chkAmeaca: TCheckBox;
    chkPFraco: TCheckBox;
    chkOportunidade: TCheckBox;
    chkPForte: TCheckBox;
    cdsAnaliseGrauRisco: TIntegerField;
    cdsAnalisemac_probabilidade: TIntegerField;
    cdsAnalisemac_consequencia: TIntegerField;
    grpLegenda: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cdsAnaliseGrauRiscoDesc: TStringField;
    pnlBaixo: TPanel;
    pnlMedio: TPanel;
    pnlAlto: TPanel;
    pnlSevero: TPanel;
    pnlNenhum: TPanel;
    cdsAnalisemac_tipo: TIntegerField;
    btnSelecionar: TBitBtn;
    cdsAnalisemac_texto: TWideMemoField;
    btnPDCA: TBitBtn;
    cdsAnalisemac_pdca: TWideStringField;
    cdsAnaliseprobabilidade: TWideStringField;
    cdsAnaliseconsequencia: TWideStringField;
    pnlImprimir: TPanel;
    pnl8: TPanel;
    btnSairImp: TBitBtn;
    btnVideoCalibracao: TBitBtn;
    btnImpCalibracao: TBitBtn;
    pnl10: TPanel;
    frxDBRiscos: TfrxDBDataset;
    grp2: TGroupBox;
    chkProcesso: TCheckBox;
    grpLegenda1: TGroupBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    pnlBaixo1: TPanel;
    pnlMedio1: TPanel;
    pnlAlto1: TPanel;
    pnlSevero1: TPanel;
    pnl6: TPanel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsAnalisetipovarGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnalisetipoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgRiscosDblClick(Sender: TObject);
    procedure MostrarDetalhe();
    procedure FormCreate(Sender: TObject);
    procedure chkTodosProcessoClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure FiltrarDados();
    procedure rgPMCClick(Sender: TObject);
    procedure dblProcessoCloseUp(Sender: TObject);
    procedure btnGraficosClick(Sender: TObject);
    procedure chkAmeacaClick(Sender: TObject);
    procedure cdsAnaliseCalcFields(DataSet: TDataSet);
    procedure dbgRiscosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pnlBaixoClick(Sender: TObject);
    procedure pnlMedioClick(Sender: TObject);
    procedure pnlAltoClick(Sender: TObject);
    procedure pnlSeveroClick(Sender: TObject);
    procedure pnlNenhumClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cdsAnalisemac_textoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnPDCAClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnVideoCalibracaoClick(Sender: TObject);
    procedure Impressao(sTipoImp: string);
    procedure btnImpCalibracaoClick(Sender: TObject);
  private
    { Private declarations }
    sParCores: string;
  public
    { Public declarations }
    sCodProcesso: string;
    iTela: Integer;
    procedure AtualizarDados();
  end;

var
  FormAnaliseRisco: TFormAnaliseRisco;

implementation

uses frm_CadRiscoVisualizacao, frm_CadRiscoGrafico, frm_CadRiscoGrafico2D,
  Funcoes, frm_CadPMCVinculo, frm_PDCA, frm_Inicial, frm_dm, frm_Tartaruga;

{$R *.dfm}

procedure TFormAnaliseRisco.AtualizarDados;
begin
   with cdsAnalise do begin
      Active:= False;
//      if chkTodosProcesso.Checked = False then begin
//         CommandText:= CommandText + ' WHERE ';
//      end;
      if iTela = 2 then begin // Tartaruga
         CommandText:= ' SELECT R.mac_codigo, V.var_descricao as Variavel, R.mac_texto, R.mac_processo, P.nome_pro as processo,' +
                       ' CAST('+ QuotedStr('EXTERNA') + ' as Character(8)) as tipovar, TC.valo_com as Fator, mac_pmc as pmc,' +
                       ' R.mac_tipo as mac_tipo, ' +
                       ' CASE WHEN R.mac_tipo = 0 THEN CAST(' + QuotedStr('AMEAÇA') + ' as Character(12)) ELSE CAST(' + QuotedStr('OPORTUNIDADE') + ' as Character(12)) END as tipo,' +
                       ' R.mac_probabilidade, R.mac_consequencia, R.mac_pdca, TC1.valo_com as probabilidade, TC2.valo_com as consequencia' +
                       ' FROM risco_macro R' +
                       ' INNER JOIN processos P ON P.codi_pro = R.mac_processo' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 22 AND TC.codi_com = R.mac_codfator' +
                       ' INNER JOIN risco_variaveis_ext V ON V.var_codigo = R.mac_codvariavel' +
                       ' LEFT JOIN tabela_combos TC1 ON TC1.tipo_com = 24 AND TC1.codi_com = R.mac_probabilidade' +
                       ' LEFT JOIN tabela_combos TC2 ON TC2.tipo_com = 25 AND TC2.codi_com = R.mac_consequencia' +
                       ' WHERE R.mac_processo = ' + sCodProcesso +
                       ' union' +
                       ' SELECT R.int_codigo, V.var_descricao as Variavel, R.int_texto, R.int_processo, P.nome_pro as processo,' +
                       ' CAST('+ QuotedStr('INTERNA') + ' as Character(8)) as tipovar, TC.valo_com as Fator, int_pmc as pmc,' +
                       ' R.int_tipo as mac_tipo, ' +
                       ' CASE WHEN R.int_tipo = 0 THEN CAST(' + QuotedStr('PONTO FRACO') + ' as Character(12)) ELSE CAST(' + QuotedStr('PONTO FORTE') + ' as Character(12)) END as tipo,' +
                       ' R.int_probabilidade, R.int_consequencia, R.int_pdca, TC1.valo_com as probabilidade, TC2.valo_com as consequencia' +
                       ' FROM risco_analiseint r' +
                       ' INNER JOIN processos P ON P.codi_pro = R.int_processo' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 23 AND TC.codi_com = R.int_codfator' +
                       ' INNER JOIN risco_variaveis_int V ON V.var_codigo = R.int_codvariavel' +
                       ' LEFT JOIN tabela_combos TC1 ON TC1.tipo_com = 24 AND TC1.codi_com = R.int_probabilidade' +
                       ' LEFT JOIN tabela_combos TC2 ON TC2.tipo_com = 25 AND TC2.codi_com = R.int_consequencia' +
                       ' WHERE R.int_processo = ' + sCodProcesso;
         chkTodosProcesso.Enabled:= False;
      end;
      Active:= True;
   end;
end;

procedure TFormAnaliseRisco.btnGraficosClick(Sender: TObject);
begin
   if cdsAnalise.RecordCount > 0 then begin
      FormRiscoGrafico:= TFormRiscoGrafico.Create(nil);
      FormRiscoGrafico.ShowModal;
      FormRiscoGrafico.Release;
   end;
end;

procedure TFormAnaliseRisco.btnVideoCalibracaoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormAnaliseRisco.btnImpCalibracaoClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormAnaliseRisco.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormAnaliseRisco.btnPDCAClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      AbrirForm(TFormPDCA, FormPDCA, 5);
   end;
end;

procedure TFormAnaliseRisco.btnSairClick(Sender: TObject);
begin
//   if Assigned(FormTartaruga) then begin
//      FormTartaruga.VerificaPendencias();
//   end;
   Self.Close;
end;

procedure TFormAnaliseRisco.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormAnaliseRisco.btnSelecionarClick(Sender: TObject);
begin
   with FormCadPMCVinculo do begin
      sCodigoRisco:= cdsAnalise.FieldByName('mac_codigo').AsString;
      sTipoRisco  := cdsAnalise.FieldByName('tipovar').AsString;
      Self.Close;
   end;
end;

procedure TFormAnaliseRisco.cdsAnaliseCalcFields(DataSet: TDataSet);
begin
   case cdsAnalisemac_consequencia.AsInteger of
      1: begin // Insignificante (Trivial)
         cdsAnaliseGrauRisco.AsInteger:= 1;
         cdsAnaliseGrauRiscoDesc.AsString:= 'BAIXO';
//         pnlRisco.Color:= RGB(35,142,35);
//         pnlRisco.Caption:= 'BAIXO';
//         pnlRisco.Hint:= sHintBaixo;
      end;
      2: begin // Baixo (Minor)
         if cdsAnalisemac_probabilidade.AsInteger = 5 then begin
            cdsAnaliseGrauRisco.AsInteger:= 1;
            cdsAnaliseGrauRiscoDesc.AsString:= 'BAIXO';
//            pnlRisco.Color:= RGB(35,142,35);
//            pnlRisco.Caption:= 'BAIXO';
//            pnlRisco.Hint:= sHintBaixo;
         end
         else if cdsAnalisemac_probabilidade.AsInteger = 1 then begin
            cdsAnaliseGrauRisco.AsInteger:= 3;
            cdsAnaliseGrauRiscoDesc.AsString:= 'ALTO';
//            pnlRisco.Color:= RGB(255,165,0);
//            pnlRisco.Caption:= 'ALTO';
//            pnlRisco.Hint:= sHintAlto;
         end
         else if (cdsAnalisemac_probabilidade.AsInteger <= 4) and (cdsAnalisemac_probabilidade.AsInteger > 1) then begin
            cdsAnaliseGrauRisco.AsInteger:= 2;
            cdsAnaliseGrauRiscoDesc.AsString:= 'MÉDIO';
//            pnlRisco.Color:= RGB(255,255,0);
//            pnlRisco.Caption:= 'MÉDIO';
//            pnlRisco.Hint:= sHintMedio;
         end;
      end;
      3: begin // Moderado (Moderate)
         if cdsAnalisemac_probabilidade.AsInteger <= 2 then begin
            cdsAnaliseGrauRisco.AsInteger:= 3;
            cdsAnaliseGrauRiscoDesc.AsString:= 'ALTO';
//            pnlRisco.Color:= RGB(255,165,0);
//            pnlRisco.Caption:= 'ALTO';
//            pnlRisco.Hint:= sHintAlto;
         end
         else if cdsAnalisemac_probabilidade.AsInteger >= 3 then begin
            cdsAnaliseGrauRisco.AsInteger:= 2;
            cdsAnaliseGrauRiscoDesc.AsString:= 'MÉDIO';
//            pnlRisco.Color:= RGB(255,255,0);
//            pnlRisco.Caption:= 'MÉDIO';
//            pnlRisco.Hint:= sHintMedio;
         end;
      end;
      4: begin // Grave (Major)
         if cdsAnalisemac_probabilidade.AsInteger = 1 then begin
            cdsAnaliseGrauRisco.AsInteger:= 4;
            cdsAnaliseGrauRiscoDesc.AsString:= 'SEVERO';
//            pnlRisco.Color:= RGB(255,0,0);
//            pnlRisco.Caption:= 'SEVERO';
//            pnlRisco.Hint:= sHintSevero;
         end
         else if (cdsAnalisemac_probabilidade.AsInteger >= 2) and (cdsAnalisemac_probabilidade.AsInteger <= 4) then begin
            cdsAnaliseGrauRisco.AsInteger:= 3;
            cdsAnaliseGrauRiscoDesc.AsString:= 'ALTO';
//            pnlRisco.Color:= RGB(255,165,0);
//            pnlRisco.Caption:= 'ALTO';
//            pnlRisco.Hint:= sHintAlto;
         end
         else if cdsAnalisemac_probabilidade.AsInteger = 5 then begin
            cdsAnaliseGrauRisco.AsInteger:= 2;
            cdsAnaliseGrauRiscoDesc.AsString:= 'MÉDIO';
//            pnlRisco.Color:= RGB(255,255,0);
//            pnlRisco.Caption:= 'MÉDIO';
//            pnlRisco.Hint:= sHintMedio;
         end;
      end;
      5: begin // Severo (Severe)
         if (cdsAnalisemac_probabilidade.AsInteger >= 1) and (cdsAnalisemac_probabilidade.AsInteger <= 3) then begin
            cdsAnaliseGrauRisco.AsInteger:= 4;
            cdsAnaliseGrauRiscoDesc.AsString:= 'SEVERO';
//            pnlRisco.Color:= RGB(255,0,0);
//            pnlRisco.Caption:= 'SEVERO';
//            pnlRisco.Hint:= sHintSevero;
         end
         else if cdsAnalisemac_probabilidade.AsInteger >= 4 then begin
            cdsAnaliseGrauRisco.AsInteger:= 3;
            cdsAnaliseGrauRiscoDesc.AsString:= 'ALTO';
//            pnlRisco.Color:= RGB(255,165,0);
//            pnlRisco.Caption:= 'ALTO';
//            pnlRisco.Hint:= sHintAlto;
         end;
      end;
      else begin
         cdsAnaliseGrauRisco.AsInteger:= 0;
         cdsAnaliseGrauRiscoDesc.AsString:= '';
//         pnlRisco.Color:= clBtnFace;
//         pnlRisco.Caption:= '';
//         pnlRisco.Hint:= '';
      end;
   end;
end;

procedure TFormAnaliseRisco.cdsAnalisemac_textoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAnalise.FieldByName('mac_texto').AsString, 1, 70);
end;

procedure TFormAnaliseRisco.dbgRiscosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (Column.Field.FieldName = 'GrauRiscoDesc') then begin
      if sParCores = '0' then begin
         case cdsAnaliseGrauRisco.AsInteger of
            0: begin // Nenhum
               dbgRiscos.Canvas.Font.Color:= clRed;
               dbgRiscos.Canvas.Font.Color:= RGB(255,255,255);
            end;
            1: begin // Baixo
               dbgRiscos.Canvas.Brush.Color:= RGB(35,142,35);
               dbgRiscos.Canvas.Font.Color:= RGB(0,0,0);
            end;
            2: begin // Médio
               dbgRiscos.Canvas.Brush.Color:= RGB(255,255,0);
               dbgRiscos.Canvas.Font.Color:= RGB(0,0,0);
            end;
            3: begin // Alto
               dbgRiscos.Canvas.Brush.Color:= RGB(255,165,0);
               dbgRiscos.Canvas.Font.Color:= RGB(0,0,0);
            end;
            4: begin // Severo
               dbgRiscos.Canvas.Brush.Color:= RGB(255,0,0);
               dbgRiscos.Canvas.Font.Color:= RGB(0,0,0);
            end;
         end;
      end
      else begin
         dbgRiscos.Canvas.Font.Color:= RGB(0,0,0);
         case cdsAnaliseGrauRisco.AsInteger of
            0: begin // Nenhum
               //dbgRiscos.Canvas.Font.Color:= clRed;
               dbgRiscos.Canvas.Font.Color:= RGB(255,255,255);
            end;
            1: begin // Baixo
               if (cdsAnalise.FieldByName('tipo').AsString = 'OPORTUNIDADE') OR
                  (cdsAnalise.FieldByName('tipo').AsString = 'PONTO FORTE') then begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(0,0,128);
                  dbgRiscos.Canvas.Font.Color:= RGB(255,255,255);
               end
               else begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(240,230,140);
               end;
            end;
            2: begin // Médio
               if (cdsAnalise.FieldByName('tipo').AsString = 'OPORTUNIDADE') OR
                  (cdsAnalise.FieldByName('tipo').AsString = 'PONTO FORTE') then begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(135,206,250);
               end
               else begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(255,255,0);
               end;
            end;
            3: begin // Alto
               if (cdsAnalise.FieldByName('tipo').AsString = 'OPORTUNIDADE') OR
                  (cdsAnalise.FieldByName('tipo').AsString = 'PONTO FORTE') then begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(0,255,0);
               end
               else begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(255,165,0);
               end;
            end;
            4: begin // Severo
               if (cdsAnalise.FieldByName('tipo').AsString = 'OPORTUNIDADE') OR
                  (cdsAnalise.FieldByName('tipo').AsString = 'PONTO FORTE') then begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(35,142,35);
               end
               else begin
                  dbgRiscos.Canvas.Brush.Color:= RGB(255,0,0);
               end;
            end;
         end;
      end;
   end;


   dbgRiscos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormAnaliseRisco.cdsAnalisetipoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAnalisetipo.AsString, 1, 15);
end;

procedure TFormAnaliseRisco.cdsAnalisetipovarGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAnalisetipovar.AsString, 1, 8);
end;

procedure TFormAnaliseRisco.chkAmeacaClick(Sender: TObject);
begin
   FiltrarDados();
end;

procedure TFormAnaliseRisco.chkTodosProcessoClick(Sender: TObject);
begin
   dblProcesso.Enabled:= not chkTodosProcesso.Checked;
   FiltrarDados();
end;

procedure TFormAnaliseRisco.dbgRiscosDblClick(Sender: TObject);
begin
   if iTela <> 3 then begin // Vínculo PMC/Risco
      MostrarDetalhe();
   end;
end;

procedure TFormAnaliseRisco.dblProcessoCloseUp(Sender: TObject);
begin
   FiltrarDados();
end;

procedure TFormAnaliseRisco.FiltrarDados;
var
   sFiltro, sFiltro1, sFiltro2, sFiltroProc, sFiltroTipo: string;
   sFiltroAmeaca, sFiltroOport, sFiltroPForte, sFiltroPFraco: string;
begin
   case rgTipo.ItemIndex of
      0: sFiltro1:= 'tipovar = ' + QuotedStr('INTERNA');
      1: sFiltro1:= 'tipovar = ' + QuotedStr('EXTERNA');
      2: sFiltro1:= '';
   end;

   case rgPMC.ItemIndex of
      0: sFiltro2:= '(pmc IS NOT NULL AND pmc <> ' + QuotedStr('') + ')';
      1: sFiltro2:= '(pmc IS NULL OR pmc = ' + QuotedStr('') + ')';
      2: sFiltro2:= '';
   end;

   if sFiltro1 = '' then begin
      if sFiltro2 = '' then begin
         sFiltro:= '';
      end
      else begin
         sFiltro:= sFiltro2;
      end;
   end
   else begin
      if sFiltro2 = '' then begin
         sFiltro:= sFiltro1;
      end
      else begin
         sFiltro:= sFiltro1 + ' and ' + sFiltro2;
      end;
   end;

   if sFiltro = '' then begin
      sFiltroProc:= ' processo = ' + QuotedStr(dblProcesso.Text);
   end
   else begin
      sFiltroProc:= ' and processo = ' + QuotedStr(dblProcesso.Text);
   end;

   if (chkTodosProcesso.Checked = False) and (dblProcesso.Text <> EmptyStr) then begin
      sFiltro:= sFiltro + sFiltroProc;
   end;

   // Filtro por Tipo
   if chkAmeaca.Checked = False then begin
      sFiltroAmeaca:= ' tipo <> ' + QuotedStr('AMEAÇA');
   end
   else begin
      sFiltroAmeaca:= '';
   end;

   if chkOportunidade.Checked = False then begin
      sFiltroOport:= ' tipo <> ' + QuotedStr('OPORTUNIDADE');
   end
   else begin
      sFiltroOport:= '';
   end;

   if chkPFraco.Checked = False then begin
      sFiltroPFraco:= ' tipo <> ' + QuotedStr('PONTO FRACO');
   end
   else begin
      sFiltroPFraco:= '';
   end;

   if chkPForte.Checked = False then begin
      sFiltroPForte:= ' tipo <> ' + QuotedStr('PONTO FORTE');
   end
   else begin
      sFiltroPForte:= '';
   end;

   if sFiltroAmeaca = '' then begin
      if sFiltroOport = '' then begin
         if sFiltroPFraco = '' then begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= '';
            end
            else begin
               sFiltroTipo:= sFiltroPForte;
            end;
         end
         else begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroPFraco;
            end
            else begin
               sFiltroTipo:= sFiltroPFraco + ' and ' + sFiltroPForte;
            end;
         end;
      end
      else begin
         if sFiltroPFraco = '' then begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroOport;
            end
            else begin
               sFiltroTipo:= sFiltroOport + ' and ' + sFiltroPForte;
            end;
         end
         else begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroOport + ' and ' + sFiltroPFraco;
            end
            else begin
               sFiltroTipo:= sFiltroOport + ' and ' + sFiltroPFraco + ' and ' + sFiltroPForte;
            end;
         end;
      end;
   end
   else begin
      if sFiltroOport = '' then begin
         if sFiltroPFraco = '' then begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroAmeaca;
            end
            else begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroPForte;
            end;
         end
         else begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroPFraco;
            end
            else begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroPFraco + ' and ' + sFiltroPForte;
            end;
         end;
      end
      else begin
         if sFiltroPFraco = '' then begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroOport;
            end
            else begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroOport + ' and ' + sFiltroPForte;
            end;
         end
         else begin
            if sFiltroPForte = '' then begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroOport + ' and ' + sFiltroPFraco;
            end
            else begin
               sFiltroTipo:= sFiltroAmeaca + ' and ' + sFiltroOport + ' and ' + sFiltroPFraco + ' and ' + sFiltroPForte;
            end;
         end;
      end;
   end;

   if sFiltro = '' then begin
      sFiltro:= sFiltroTipo;
   end
   else begin
      if sFiltroTipo = '' then begin
         sFiltro:= sFiltro;
      end
      else begin
         sFiltro:= sFiltro + ' and ' + sFiltroTipo;
      end;
   end;

   cdsAnalise.Filter  := sFiltro;
   cdsAnalise.Filtered:= True;
end;

procedure TFormAnaliseRisco.FormCreate(Sender: TObject);
begin
//   rgPMC.ItemIndex := 2; // Todos
//   rgTipo.ItemIndex:= 2; // Todos
   chkTodosProcesso.Checked:= True;
   dblProcesso.Enabled:= False;
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;
end;

procedure TFormAnaliseRisco.FormShow(Sender: TObject);
begin
   sParCores:= BuscarParametroCoresRisco();
   AtualizarDados();
   pnlNenhum.Color:= RGB(255,255,255);

   if sParCores = '0' then begin
      pnlBaixo.Color := RGB(35,142,35);
      pnlMedio.Color := RGB(255,255,0);
      pnlAlto.Color  := RGB(255,165,0);
      pnlSevero.Color:= RGB(255,0,0);

      grpLegenda.Caption:= 'Legenda Grau do Risco';
      grpLegenda1.Visible:= False;
   end
   else begin
      pnlBaixo.Color := RGB(0,0,128);
      pnlMedio.Color := RGB(135,206,250);
      pnlAlto.Color  := RGB(0,255,0);
      pnlSevero.Color:= RGB(35,142,35);

      pnlBaixo1.Color := RGB(240,230,140);
      pnlMedio1.Color := RGB(255,255,0);
      pnlAlto1.Color  := RGB(255,165,0);
      pnlSevero1.Color:= RGB(255,0,0);

      grpLegenda.Caption := 'Legenda Grau do Risco (Pontos Fortes e Oportunidades)';
      grpLegenda1.Caption:= 'Legenda Grau do Risco (Pontos Fracos e Ameaças)';
      grpLegenda1.Visible:= True;
   end;

   if iTela = 3 then begin // Vínculo de PMC/Risco
      btnGraficos.Visible  := False;
      btnSelecionar.Visible:= True;
   end;
end;

procedure TFormAnaliseRisco.Impressao(sTipoImp: string);
var
   sOrdem: string;
begin
   if Acesso(cUsuario, 62, 'acesso') = 1 then begin
      if cdsAnalise.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir', 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      if chkProcesso.Checked then begin
         Imprimir('rel_AnaliseRiscosAgrupa', dm.frxReport1, sTipoImp);
      end
      else begin
         Imprimir('rel_AnaliseRiscos', dm.frxReport1, sTipoImp);
      end;
   end;

end;

procedure TFormAnaliseRisco.MostrarDetalhe;
begin
   with cdsAnalise do begin
      with FormCadRiscoVisualizacao do begin
         FormCadRiscoVisualizacao:= TFormCadRiscoVisualizacao.Create(nil);
         edtPMC.Text     := FieldByName('pmc').AsString;
         edtPDCA.Text    := FieldByName('mac_pdca').AsString;
         lblTipo.Caption := FieldByName('tipo').AsString;
         edtProcesso.Text:= FieldByName('processo').AsString;
         edtFator.Text   := FieldByName('fator').AsString;
         edtVariavel.Text:= FieldByName('variavel').AsString;
         mmoTexto.Text   := FieldByName('mac_texto').AsString;
         iCodProcesso    := FieldByName('mac_processo').AsInteger;
         iCodigo         := FieldByName('mac_codigo').AsInteger;
         sTipoIntExt     := FieldByName('tipovar').AsString;
         sTipoRisco      := FieldByName('GrauRiscoDesc').AsString;

         if FieldByName('tipovar').AsString = 'INTERNO' then begin
            lblVariavel.Caption:= 'Variável Interna';
         end
         else begin
            lblVariavel.Caption:= 'Variável Externa';
         end;

         ShowModal;
         Release;
         FormCadRiscoVisualizacao:= nil;
      end;
   end;
end;

procedure TFormAnaliseRisco.pnlAltoClick(Sender: TObject);
var
   sDescricaoRisco: string;
begin
   sDescricaoRisco:= BuscarDescricaoRisco(pnlAlto.Brush.Color, cdsAnalise.FieldByName('mac_tipo').AsInteger,
                                         Copy(cdsAnalise.FieldByName('tipovar').AsString,1,1));
   Application.MessageBox(PChar(sDescricaoRisco), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
end;

procedure TFormAnaliseRisco.pnlBaixoClick(Sender: TObject);
var
   sDescricaoRisco: string;
begin
   sDescricaoRisco:= BuscarDescricaoRisco(pnlBaixo.Brush.Color, cdsAnalise.FieldByName('mac_tipo').AsInteger,
                                         Copy(cdsAnalise.FieldByName('tipovar').AsString,1,1));
   Application.MessageBox(PChar(sDescricaoRisco), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
end;

procedure TFormAnaliseRisco.pnlMedioClick(Sender: TObject);
var
   sDescricaoRisco: string;
begin
   sDescricaoRisco:= BuscarDescricaoRisco(pnlMedio.Brush.Color, cdsAnalise.FieldByName('mac_tipo').AsInteger,
                                         Copy(cdsAnalise.FieldByName('tipovar').AsString,1,1));
   Application.MessageBox(PChar(sDescricaoRisco), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
end;

procedure TFormAnaliseRisco.pnlNenhumClick(Sender: TObject);
begin
   Application.MessageBox(PChar('O Risco não teve sua análise concluída no cadastro.' + #13 +
                          'Acesse o menu Cadastros -> Análise de Riscos e faça a análise Interna ou do Macroambiente.'), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
end;

procedure TFormAnaliseRisco.pnlSeveroClick(Sender: TObject);
var
   sDescricaoRisco: string;
begin
   sDescricaoRisco:= BuscarDescricaoRisco(pnlSevero.Brush.Color, cdsAnalise.FieldByName('mac_tipo').AsInteger,
                                         Copy(cdsAnalise.FieldByName('tipovar').AsString,1,1));
   Application.MessageBox(PChar(sDescricaoRisco), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
end;

procedure TFormAnaliseRisco.rgPMCClick(Sender: TObject);
begin
   FiltrarDados();
end;

procedure TFormAnaliseRisco.rgTipoClick(Sender: TObject);
begin
   FiltrarDados();
end;

end.
