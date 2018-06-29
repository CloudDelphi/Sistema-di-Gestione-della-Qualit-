unit frm_ProgramarTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, rxToolEdit, DBCtrls, rxCurrEdit,
  DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids,
  DBGrids, IdMailBox, ComCtrls, JvgPage;

type
  TFormProgramarTreinamentos = class(TForm)
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    pctTreinamentos: TJvgPageControl;
    tsCadastro: TTabSheet;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    shp2: TShape;
    lbl13: TLabel;
    lbl15: TLabel;
    lbl32: TLabel;
    shp1: TShape;
    lblTituloColaboradores: TLabel;
    lblTituloLista: TLabel;
    dblTreinamentos: TDBLookupComboBox;
    dtDataPrevista: TDateEdit;
    cbbTipo: TComboBox;
    dbgListaColaboradores: TDBGrid;
    dbgIncluidos: TDBGrid;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    cdsIncluido: TClientDataSet;
    cdsIncluidoCodigo: TIntegerField;
    cdsIncluidoNome: TStringField;
    dsIncluido: TDataSource;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    dsTreinamentos: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    lbl7: TLabel;
    edtCodigoTre: TEdit;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgIncluidosDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgIncluidosDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgListaColaboradoresEndDrag(Sender, Target: TObject; X,
      Y: Integer);
    procedure dbgListaColaboradoresColEnter(Sender: TObject);
    function VerificarDados(): Boolean;
    procedure btnGravarClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure dbgIncluidosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgramarTreinamentos: TFormProgramarTreinamentos;

implementation

uses
   Funcoes, frm_dm;

{$R *.dfm}

procedure TFormProgramarTreinamentos.btnGravarClick(Sender: TObject);
begin
   try
      if ValidarDados() = True then begin
         cdsIncluido.First;

         while not cdsIncluido.Eof do begin
            // Verifica se já tem o treinamento gravado na mesma data
            with dm.cdsauxiliar do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) as Qtd' +
                             ' FROM colab_treinamentos' +
                             ' WHERE codi_col = ' + cdsIncluido.FieldByName('Codigo').AsString +
                             ' AND codi_tre = ' + QuotedStr(dblTreinamentos.KeyValue);
               Active:= True;
            end;

            if dm.cdsAuxiliar.FieldByName('Qtd').AsInteger = 0 then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO colab_treinamentos(' +
                                ' codi_col, codi_tre, dtpr_tre, dtre_tre, tipo_tre, ' +
                                ' tre_tempo, tre_custo) VALUES (' +
                                cdsIncluido.FieldByName('Codigo').AsString + ',' +
                                QuotedStr(dblTreinamentos.KeyValue) + ',' +
                                ArrumaDataSQL(dtDataPrevista.Date) + ',' +
                                QuotedStr(Copy(cbbTipo.Text, 1, 1)) +
                                ');';
                  Execute;
               end;
            end;

            cdsIncluido.Next;
         end;

         Application.MessageBox('Treinamentos gravados com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E:Exception do begin
         MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormProgramarTreinamentos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormProgramarTreinamentos.dbgIncluidosCellClick(Column: TColumn);
begin
   if cdsIncluido.RecordCount > 0 then begin
      cdsIncluido.Delete;
   end;
end;

procedure TFormProgramarTreinamentos.dbgIncluidosDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
   dbgListaColaboradores.EndDrag(True); // comanda o final da operacao
end;

procedure TFormProgramarTreinamentos.dbgIncluidosDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   // Preparando para receber os dados
   Accept:= Source is TDBGrid;
end;

procedure TFormProgramarTreinamentos.dbgListaColaboradoresColEnter(
  Sender: TObject);
begin
   // Ativando o arrastar
   dbgListaColaboradores.BeginDrag(False);
end;

procedure TFormProgramarTreinamentos.dbgListaColaboradoresEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
   if VerificarDados() then begin
      cdsIncluido.Append;
      cdsIncluido.FieldByName('Codigo').AsInteger:= dbgListaColaboradores.DataSource.DataSet.FieldByName('codi_col').AsInteger;
      cdsIncluido.FieldByName('Nome').AsString   := dbgListaColaboradores.DataSource.DataSet.FieldByName('nome_col').AsString;
      cdsIncluido.Post;
   end
   else begin
      Application.MessageBox('Colaborador já inserido na lista', 'Aviso', MB_OK + MB_ICONWARNING);
   end;
end;

procedure TFormProgramarTreinamentos.FormShow(Sender: TObject);
begin
   lblTituloColaboradores.Width:= 465;
   lblTituloLista.Width        := 465;

   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT codi_tre, desc_tre' +
                    ' FROM treinamentos' +
                    ' WHERE tre_status = 1' + // Ativos
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   with cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col' +
                    ' FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   cbbTipo.ItemIndex:= 0; // Mandatório

   // Abre o dataset pra receber os colaboradores incluídos
   cdsIncluido.CreateDataSet;
   cdsIncluido.Open;
   cdsIncluido.EmptyDataSet;
end;

function TFormProgramarTreinamentos.ValidarDados: Boolean;
begin
    if (dblTreinamentos.KeyValue = -1) or (dblTreinamentos.KeyValue = Null) then begin
      Application.MessageBox('Selecione um treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTreinamentos);
      Result:= False;
      Exit;
   end;

   if dtDataPrevista.Text <> '  /  /    ' then begin
      try
         StrToDate(dtDataPrevista.Text);
      except
         Application.MessageBox('Data prevista inválida', 'Aviso', MB_OK + MB_ICONWARNING);
         dtDataPrevista.SetFocus;
         Exit;
      end;
   end
   else begin
      Application.MessageBox('Digite a data de prevista do treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      Exit;
   end;

   if cdsIncluido.RecordCount = 0 then begin
      Application.MessageBox('Selecione pelo menos um colaborador', 'Aviso', MB_OK + MB_ICONWARNING);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormProgramarTreinamentos.VerificarDados: Boolean;
var
   lFlag: Boolean;
begin
   // Verifica se o colaborador já foi inserido na grid
   lFlag:= True;
   with cdsIncluido do begin
      First;
      while not Eof do begin
         if cdsColaboradores.FieldByName('codi_col').AsInteger = cdsIncluido.FieldByName('codigo').AsInteger then begin
            lFlag:= False;
         end;

         Next;
      end;
   end;

   Result:= lFlag;
end;

end.
