unit frm_DefineAtributos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, DBCtrls, StdCtrls, ExtCtrls,
  Grids, DBGrids, Buttons, Mask, rxToolEdit, rxCurrEdit, Menus, JvExExtCtrls,
  JvExtComponent, JvPanel, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxClass, frxDBSet;

type
  Tt_DefineAtributos = class(TForm)
    dspColabHab: TDataSetProvider;
    cdsColabHab: TClientDataSet;
    dsColabHab: TDataSource;
    cdsColabHabDescHab: TStringField;
    dspColabTre: TDataSetProvider;
    cdsColabTre: TClientDataSet;
    dsColabTre: TDataSource;
    cdsColabTreDescTre: TStringField;
    sbInsereHabilidades: TSpeedButton;
    dbgHabilidades: TDBGrid;
    dblHabilidades: TDBLookupComboBox;
    pnl1: TPanel;
    sbSair: TSpeedButton;
    lbNomeColaborador: TLabel;
    edNota: TCurrencyEdit;
    lb1: TLabel;
    lb2: TLabel;
    sbInsereTreinamentos: TSpeedButton;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    dbg2: TDBGrid;
    dblTreinamentos: TDBLookupComboBox;
    pmOpcoes: TPopupMenu;
    Excluir1: TMenuItem;
    pmTreinamentos: TPopupMenu;
    MenuItem1: TMenuItem;
    dtRealizada: TDateEdit;
    dtPrevista: TDateEdit;
    zqryColabHab: TZQuery;
    zqryColabTre: TZQuery;
    cdsColabTrecodi_col: TLargeintField;
    cdsColabTrecodi_tre: TLargeintField;
    cdsColabTredtpr_tre: TDateTimeField;
    cdsColabTredtre_tre: TDateTimeField;
    cdsColabHabcodi_col: TLargeintField;
    cdsColabHabcodi_hab: TLargeintField;
    cdsColabHabnota_hab: TFloatField;
    cbTipoTreinamento: TComboBox;
    lbl1: TLabel;
    cdsColabTretipo_tre: TWideStringField;
    edtAno: TEdit;
    lbl2: TLabel;
    cdsColabHabhab_ano: TWideStringField;
    sbImprimir: TSpeedButton;
    zqryReport: TZQuery;
    dspReport: TDataSetProvider;
    cdsReport: TClientDataSet;
    CdsReportnume_pmc1: TWideStringField;
    cdsReportdata_pmc: TDateTimeField;
    cdsReportncon_pmc: TMemoField;
    CdsReportOrigem1: TWideStringField;
    CdsReportTipo1: TWideStringField;
    CdsReportEficaz1: TWideStringField;
    CdsReportnome_pro1: TWideStringField;
    frxdbListaMestra: TfrxDBDataset;
    sb1: TSpeedButton;
    pnlAvalHab: TPanel;
    lbl3: TLabel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnGravar: TBitBtn;
    pnl3: TPanel;
    edtAvaliador: TEdit;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    procedure cdsColabTreAfterPost(DataSet: TDataSet);
    procedure sbInsereTreinamentosClick(Sender: TObject);
    procedure cdsColabTreCalcFields(DataSet: TDataSet);
    procedure cdsColabHabCalcFields(DataSet: TDataSet);
    procedure cdsColabHabAfterPost(DataSet: TDataSet);
    procedure sbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbInsereHabilidadesClick(Sender: TObject);
    procedure LimpaCampos;
    procedure dbg2CellClick(Column: TColumn);
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure Excluir1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure AtualizarDados();
    procedure sbImprimirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
  private
    { Private declarations }
    iCodColab: Integer;
  public
    { Public declarations }
  end;

var
  t_DefineAtributos: Tt_DefineAtributos;

implementation

uses frm_dm, frm_Principal, Funcoes, frm_Inicial;

{$R *.dfm}

procedure Tt_DefineAtributos.AtualizarDados;
begin
   with cdsColabHab do begin
      Active:= False;
      CommandText:= ' SELECT * FROM Colab_Habilidades C' +
                    ' WHERE codi_col = ' + AllTrim(IntToStr(iCodColab)) +
                    ' AND (SELECT MAX(HAB_ANO) FROM colab_habilidades CH where CH.codi_hab = C.codi_hab' +
                    '         and codi_col = ' + AllTrim(IntToStr(iCodColab)) + ') = hab_ano ';
//                     ' AND hab_ano = ' + FormatDateTime('yyyy', Date());
      Active:= True;
   end;

   with cdsColabTre do begin
      Active:= False;
      CommandText:= ' SELECT * FROM Colab_Treinamentos' +
                    ' WHERE codi_col = ' + AllTrim(IntToStr(iCodColab));
      Active:= True;
   end;
end;

procedure Tt_DefineAtributos.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' UPDATE Colaboradores SET' +
                       ' col_avaliador = ' + QuotedStr(edtAvaliador.Text) +
                       ' WHERE codi_col = ' + IntToStr(iCodColab);
         Execute;
      end;

      Application.MessageBox('Avaliador gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

      pnlAvalHab.Visible:= False;
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar o avaliador!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure Tt_DefineAtributos.btnSairImpClick(Sender: TObject);
begin
   pnlAvalHab.Visible:= False;
end;

procedure Tt_DefineAtributos.cdsColabHabAfterPost(DataSet: TDataSet);
begin
   cdsColabHab.ApplyUpdates(0);
end;

procedure Tt_DefineAtributos.cdsColabHabCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' Select desc_hab from habilidades'+
                    ' Where codi_hab = ' + QuotedStr(cdsColabHabcodi_hab.AsString);
      Active:= True;
      cdsColabHabDescHab.AsString:= dm.cdsAuxiliar.FieldByName('desc_hab').AsString
   end;
end;

procedure Tt_DefineAtributos.cdsColabTreAfterPost(DataSet: TDataSet);
begin
   cdsColabTre.ApplyUpdates(0);
end;

procedure Tt_DefineAtributos.cdsColabTreCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do
   begin
      Active:= False;
      CommandText:= ' Select desc_tre from treinamentos'+
                    ' Where codi_tre = ' + '''' + cdsColabTrecodi_tre.AsString + '''';
      Active:= True;
      cdsColabTreDescTre.AsString:= dm.cdsAuxiliar.FieldByName('desc_tre').AsString
   end;
end;

procedure Tt_DefineAtributos.dbgHabilidadesCellClick(Column: TColumn);
begin
   dblHabilidades.KeyValue:= cdsColabHabcodi_hab.AsInteger;
   edNota.Text:= cdsColabHabnota_hab.AsString;
   edtAno.Text:= cdsColabHabhab_ano.AsString;
   sbInsereHabilidades.Caption:= 'ALTERAR';
end;

procedure Tt_DefineAtributos.dbg2CellClick(Column: TColumn);
begin
   dblTreinamentos.KeyValue:= cdsColabTrecodi_tre.AsInteger;
   DtPrevista.Date         := cdsColabTredtpr_tre.AsDateTime;
   DtRealizada.Date        := cdsColabTredtre_tre.AsDateTime;
   cbTipoTreinamento.Text  := cdsColabTretipo_tre.AsString;
   sbInsereTreinamentos.Caption:= 'ALTERAR';
   cdsColabTre.Edit;
end;

procedure Tt_DefineAtributos.Excluir1Click(Sender: TObject);
begin
   cdsColabHab.Delete;
   cdsColabHab.ApplyUpdates(0);
end;

procedure Tt_DefineAtributos.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_DefineAtributos.FormShow(Sender: TObject);
begin
   iCodColab:= dm.cdsColaboradorescodi_col.AsInteger;

   dm.cdsHabilidades.Active:= False;
   dm.cdsHabilidades.Active:= True;

   dm.cdsTreinamentos.Active:= False;
   dm.cdsTreinamentos.Active:= True;

   AtualizarDados();
end;

procedure Tt_DefineAtributos.LimpaCampos;
begin
   DtPrevista.Clear;
   DtRealizada.Clear;
   dblTreinamentos.KeyValue:= -1;
   sbInsereTreinamentos.Caption:= 'INSERIR';
end;

procedure Tt_DefineAtributos.MenuItem1Click(Sender: TObject);
begin
   cdsColabTre.Delete;
   cdsColabTre.ApplyUpdates(0);
   LimpaCampos;
end;

procedure Tt_DefineAtributos.sb1Click(Sender: TObject);
begin
   pnlAvalHab.Top     := Self.Height div 2 - pnlAvalHab.Height div 2 - 20;
   pnlAvalHab.Left    := Self.Width div 2 - pnlAvalHab.Width div 2;
   pnlAvalHab.Visible := True;

   with cdsGravar do begin
      Active:= False;
      CommandText:= ' SELECT col_avaliador FROM Colaboradores' +
                    ' WHERE codi_col = ' + IntToStr(iCodColab);
      Active:= True;

      if (Alltrim(FieldByName('col_avaliador').AsString)) <> EmptyStr then begin
         edtAvaliador.Text:= FieldByName('col_avaliador').AsString;
      end
      else begin
         edtAvaliador.Clear;
      end;
   end;
end;

procedure Tt_DefineAtributos.sbImprimirClick(Sender: TObject);
begin
//   with cdsReport do begin
//      Active:= False;
//      Active:= True;
//   end;
//
//   dm.rvRaveProject.Close;
//   dm.RvdsConexao.DataSet:= cdsReport;
//   dm.rvRaveProject.ProjectFile:= ExtractFilePath(Application.ExeName) + '\Relatórios\rHabilidades.rav';
//   dm.rvRaveProject.Open;
//   dm.rvRaveProject.Execute;
//   Auditoria('Relatório de Habilidades','','R', '');
end;

procedure Tt_DefineAtributos.sbInsereHabilidadesClick(Sender: TObject);
begin
   if sbInsereHabilidades.Caption = 'INSERIR' then begin
      // Verifica se já existe a habilidade para o colaborador
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) qtd FROM Colab_Habilidades' +
                       ' WHERE codi_col = ' + Trim(IntToStr(iCodColab)) +
                       '       AND codi_hab = ' + IntToStr(dblHabilidades.KeyValue) +
                       '       AND hab_ano = ' + AllTrim(edtAno.Text);
         Active:= True;
      end;

      if dm.cdsAuxiliar.FieldByName('qtd').AsInteger > 0 then begin
         Application.MessageBox('Esta habilidade já foi cadastrada neste ano. Verifique !','Aviso', MB_OK + MB_ICONWARNING);
         dblHabilidades.SetFocus;
      end
      else begin
         with cdsColabHab do begin
            Active:= False;
            CommandText:= ' INSERT INTO colab_habilidades' +
                          ' (codi_col, Codi_Hab, Nota_Hab, Hab_ano)' +
                          ' VALUES(' +
                          IntToStr(iCodColab) + ',' +
                          IntToStr(dblHabilidades.KeyValue) + ',' +
                          VirgulaParaPonto(edNota.Value,2) + ',' +
                          Alltrim(edtAno.Text) +
                          ')';
            Execute;
         end;
//         with cdsColabHab do begin
//            Active:= True;
//            Append;
//            FieldByName('Codi_Col').AsInteger:= iCodColab;
//            FieldByName('Codi_Hab').AsString := dblHabilidades.KeyValue;
//            FieldByName('Nota_Hab').AsFloat  := edNota.Value;
//            FieldByName('Hab_ano').AsString  := edtAno.Text;
//            Post;
//         end;
      end;
   end
   else begin
      with cdsColabHab do begin
         Active:= False;
         CommandText:= ' UPDATE colab_habilidades SET' +
                       ' Nota_Hab = ' + VirgulaParaPonto(edNota.Value,2) +
                       ' WHERE codi_col = ' + IntToStr(iCodColab) +
                       ' and codi_hab = ' + IntToStr(dblHabilidades.KeyValue) +
                       ' and hab_ano = ' + AllTrim(edtAno.Text);
         Execute;
//         Active:= True;
//         Edit;
//         FieldByName('Codi_Col').AsInteger:= iCodColab;
//         FieldByName('Codi_Hab').AsString := dblHabilidades.KeyValue;
//         FieldByName('Nota_Hab').AsFloat  := edNota.Value;
//         FieldByName('Hab_ano').AsString  := edtAno.Text;
//         Post;
         sbInsereHabilidades.Caption:= 'INSERIR';
      end;
   end;

   AtualizarDados();
end;

procedure Tt_DefineAtributos.sbInsereTreinamentosClick(Sender: TObject);
var
   sDataPrevista, sDataRealizada: string;
begin
   sDataPrevista:= ArrumaDataSQL(dtPrevista.Date);
   if sDataPrevista = '''1899-12-30''' then begin
      sDataPrevista:= '0000-00-00'
   end;

   sDataRealizada:= ArrumaDataSQL(dtRealizada.Date);
   if sDataRealizada = '''1899-12-30''' then begin
      sDataRealizada:= '0000-00-00'
   end;


   if sbInsereTreinamentos.Caption = 'INSERIR' then begin
      // Verifica se já existe o treinamento para o colaborador
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) qtd FROM Colab_Treinamentos' +
                       ' WHERE codi_col = ' + Trim(IntToStr(iCodColab)) +
                       '       AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue);
         Active:= True;
      end;

      if dm.cdsAuxiliar.FieldByName('qtd').AsInteger > 0 then begin
         Application.MessageBox('Este treinamento já foi cadastrado. Verifique !','Aviso', MB_OK + MB_ICONWARNING);
         dblTreinamentos.SetFocus;
      end
      else begin
         with cdsColabTre do begin
            Active:= False;
            CommandText:= ' INSERT INTO colab_treinamentos' +
                          ' (codi_col, codi_tre, dtpr_tre, dtre_tre, tipo_tre)' +
                          ' VALUES(' +
                          IntToStr(iCodColab) + ',' +
                          IntToStr(dblTreinamentos.KeyValue) + ',' +
                          sDataPrevista + ',' +
                          sDataRealizada + ',' +
                          QuotedStr(cbTipoTreinamento.Text) +
                          ')';
            Execute;
         end;
      end;
   end
   else begin
      with cdsColabTre do begin
         Active:= False;
         CommandText:= ' UPDATE colab_treinamentos SET' +
                       ' dtpr_tre = ' + sDataPrevista + ',' +
                       ' dtre_tre = ' + sDataRealizada + ',' +
                       ' tipo_tre = ' + QuotedStr(cbTipoTreinamento.Text) +
                       ' WHERE codi_col = ' + IntToStr(iCodColab) +
                       ' and codi_tre = ' + IntToStr(dblTreinamentos.KeyValue);
         Execute;
      end;
   end;

   AtualizarDados();

   LimpaCampos;
   sbInsereTreinamentos.Caption:= 'INSERIR';
end;

procedure Tt_DefineAtributos.sbSairClick(Sender: TObject);
begin
  Close;
end;


end.
