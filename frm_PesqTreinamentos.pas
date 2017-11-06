unit frm_PesqTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls, frxClass, frxDBSet,
  ComCtrls, JvgPage;

type
  TFormPesqTreinamentos = class(TForm)
    pnl1: TPanel;
    zqryColab: TZQuery;
    dspColab: TDataSetProvider;
    cdsColab: TClientDataSet;
    dsColab: TDataSource;
    btnSair: TBitBtn;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    dsTreinamentos: TDataSource;
    cdsColabnome_col: TWideStringField;
    cdsColabdtpr_tre: TDateTimeField;
    cdsColabdtre_tre: TDateTimeField;
    btnImprimir: TBitBtn;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    frxReport1: TfrxReport;
    frxDBTreinamentos: TfrxDBDataset;
    cdsImprimirnome_col: TWideStringField;
    cdsImprimirdtpr_tre: TDateTimeField;
    cdsImprimirdtre_tre: TDateTimeField;
    cdsImprimircodi_tre: TLargeintField;
    cdsImprimirdesc_tre: TWideStringField;
    pctTreinamentos: TJvgPageControl;
    tsTreinamento: TTabSheet;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    tsColaborador: TTabSheet;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl1: TLabel;
    dbgManutencao: TDBGrid;
    dblTreinamento: TDBLookupComboBox;
    rgOpcoesTre: TRadioGroup;
    lbl2: TLabel;
    dbgTreinamentos: TDBGrid;
    dblColaborador: TDBLookupComboBox;
    rgOpcoesCol: TRadioGroup;
    dsColaboradores: TDataSource;
    cdsColaboradores: TClientDataSet;
    dspColaboradores: TDataSetProvider;
    zqryColaboradores: TZQuery;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    zqryTrein: TZQuery;
    dspTrein: TDataSetProvider;
    cdsTrein: TClientDataSet;
    dsTrein: TDataSource;
    cdsTreindesc_tre: TWideStringField;
    cdsTreindtpr_tre: TDateTimeField;
    cdsTreindtre_tre: TDateTimeField;
    frxDBDSColab: TfrxDBDataset;
    zqryImprimirColab: TZQuery;
    dspImprimirColab: TDataSetProvider;
    cdsImprimirColab: TClientDataSet;
    cds2: TWideStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    cds3: TLargeintField;
    cds4: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dblTreinamentoCloseUp(Sender: TObject);
    procedure cdsColabdtpr_treGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsColabdtre_treGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure AtualizarDados();
    procedure rgOpcoesTreClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(sTipoImp: string);
    procedure cdsImprimirdtpr_treGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsImprimirdtre_treGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    sWhere: string;
  public
    { Public declarations }
  end;

var
  FormPesqTreinamentos: TFormPesqTreinamentos;

implementation

uses frm_dm, frm_CadIndicadores, Funcoes;

{$R *.dfm}

procedure TFormPesqTreinamentos.AtualizarDados;
begin
   if pctTreinamentos.TabIndex = 0 then begin // Por Treinamento
      if dblTreinamento.KeyValue <> null then begin
         rgOpcoesTre.Enabled:= True;
         sWhere:= 'CT.codi_tre = ' + IntToStr(dblTreinamento.KeyValue);

         case rgOpcoesTre.ItemIndex of
            0: begin // Somente previsto
               sWhere:= sWhere + ' AND CT.dtpr_tre notnull AND CT.dtpr_tre <> ' + QuotedStr('30/12/1899');
            end;
            1: begin // Somente realizado
               sWhere:= sWhere + ' AND CT.dtre_tre notnull AND CT.dtre_tre <> ' + QuotedStr('30/12/1899');
            end;
            2: begin // Todos

            end;
         end;

         with cdsColab do begin
            Active:= False;
            CommandText:= ' SELECT C.nome_col, CT.dtpr_tre, CT.dtre_tre' +
                          ' FROM colab_treinamentos CT' +
                          ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col' +
                          ' WHERE ' + sWhere +
                          ' ORDER BY C.nome_col ';
            Active:= True;

            if RecordCount > 0 then begin
               btnImprimir.Enabled:= True;
            end
            else begin
               btnImprimir.Enabled:= False;
            end;
         end;
      end;
   end
   else begin // Por Colaborador
      if dblColaborador.KeyValue <> null then begin
         rgOpcoesCol.Enabled:= True;
         sWhere:= 'CT.codi_col = ' + IntToStr(dblColaborador.KeyValue);

         case rgOpcoesCol.ItemIndex of
            0: begin // Somente previsto
               sWhere:= sWhere + ' AND dtpr_tre notnull AND dtpr_tre <> ' + QuotedStr('30/12/1899');
            end;
            1: begin // Somente realizado
               sWhere:= sWhere + ' AND dtre_tre notnull AND dtre_tre <> ' + QuotedStr('30/12/1899');
            end;
            2: begin // Todos

            end;
         end;

         with cdsTrein do begin
            Active:= False;
            CommandText:= ' SELECT T.desc_tre, CT.dtpr_tre, CT.dtre_tre' +
                          ' FROM colab_treinamentos CT' +
                          ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                          ' WHERE ' + sWhere +
                          ' ORDER BY desc_tre ';
            Active:= True;

            if RecordCount > 0 then begin
               btnImprimir.Enabled:= True;
            end
            else begin
               btnImprimir.Enabled:= False;
            end;
         end;
      end;
   end;
end;

procedure TFormPesqTreinamentos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormPesqTreinamentos.btnImprimirClick(Sender: TObject);
begin
   if pctTreinamentos.TabIndex = 0 then begin
      rgOrdemImpressao.Items[0]:= 'Nome do Colaborador';
   end
   else begin
      rgOrdemImpressao.Items[0]:= 'Treinamento';
   end;
   AbrePanel(pnlImprimir, Self);
end;

procedure TFormPesqTreinamentos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPesqTreinamentos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormPesqTreinamentos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormPesqTreinamentos.cdsColabdtpr_treGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (cdsColabdtpr_tre.AsString = '30/12/1899') or (cdsColabdtpr_tre.AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsColabdtpr_tre.AsDateTime);
   end;
end;

procedure TFormPesqTreinamentos.cdsColabdtre_treGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (cdsColabdtre_tre.AsString = '30/12/1899') or (cdsColabdtre_tre.AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsColabdtre_tre.AsDateTime);
   end;
end;

procedure TFormPesqTreinamentos.cdsImprimirdtpr_treGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (cdsImprimirdtpr_tre.AsString = '30/12/1899') or (cdsImprimirdtpr_tre.AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsImprimirdtpr_tre.AsDateTime);
   end;
end;

procedure TFormPesqTreinamentos.cdsImprimirdtre_treGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (cdsImprimirdtre_tre.AsString = '30/12/1899') or (cdsImprimirdtre_tre.AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsImprimirdtre_tre.AsDateTime);
   end;
end;

procedure TFormPesqTreinamentos.dblTreinamentoCloseUp(Sender: TObject);
begin
   AtualizarDados();
end;

procedure TFormPesqTreinamentos.FormShow(Sender: TObject);
begin
   rgOrdemImpressao.ItemIndex:= 0; // Colaborador
   pctTreinamentos.TabIndex  := 0; // Por Treinamento

   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT codi_tre, desc_tre, tre_conteudo, tre_status' +
                    ' FROM treinamentos' +
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   with cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' ORDER BY nome_col';
      Active:= True;
   end;
end;

procedure TFormPesqTreinamentos.Impressao(sTipoImp: string);
var
   sCampoOrdem: string;
begin
   if pctTreinamentos.TabIndex = 0 then begin // Por Treinamento
      case rgOrdemImpressao.ItemIndex of
         0: sCampoOrdem:= 'T.desc_tre, C.nome_col';
         1: sCampoOrdem:= 'T.desc_tre, CT.dtpr_tre';
         2: sCampoOrdem:= 'T.desc_tre, CT.dtre_tre';
      end;

      with cdsImprimir do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, CT.codi_tre, CT.dtpr_tre, CT.dtre_tre, T.desc_tre' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE ' + sWhere +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_TreinamentosPorTrein.fr3');

         if sTipoImp = 'I' then begin
         // Imprimir direto
            PrepareReport;
            PrintOptions.ShowDialog:= False;
            Print;
         end
         else begin
            ShowReport;
         end;
      end;
   end
   else begin // Por Colaborador
      case rgOrdemImpressao.ItemIndex of
         0: sCampoOrdem:= 'C.nome_col, T.desc_tre';
         1: sCampoOrdem:= 'C.nome_col, CT.dtpr_tre';
         2: sCampoOrdem:= 'C.nome_col, CT.dtre_tre';
      end;

      with cdsImprimirColab do begin
         Active:= False;
         CommandText:= ' SELECT C.nome_col, CT.codi_tre, CT.dtpr_tre, CT.dtre_tre, T.desc_tre' +
                       ' FROM colab_treinamentos CT' +
                       ' INNER JOIN colaboradores C ON C.codi_col = CT.codi_col' +
                       ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                       ' WHERE ' + sWhere +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimirColab.RecordCount = 0 then begin
         Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      with frxReport1 do begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_TreinamentosPorColab.fr3');

         if sTipoImp = 'I' then begin
         // Imprimir direto
            PrepareReport;
            PrintOptions.ShowDialog:= False;
            Print;
         end
         else begin
            ShowReport;
         end;
      end;
   end;
end;

procedure TFormPesqTreinamentos.rgOpcoesTreClick(Sender: TObject);
begin
   AtualizarDados();
end;

end.
