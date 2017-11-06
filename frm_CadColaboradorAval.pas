unit frm_CadColaboradorAval;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, RXSpin, Grids, DBGrids,
  DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormCadAvaliador = class(TForm)
    lbl23: TLabel;
    edtCodigoCol: TEdit;
    lbl22: TLabel;
    edtNomeCol: TEdit;
    dbgAvaliadores: TDBGrid;
    lbl1: TLabel;
    spnAno: TRxSpinEdit;
    lbl5: TLabel;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    dsColaboradores: TDataSource;
    dblAvaliador: TDBLookupComboBox;
    zqryAvaliadores: TZQuery;
    dspAvaliadores: TDataSetProvider;
    cdsAvaliadores: TClientDataSet;
    dsAvaliadores: TDataSource;
    cdsAvaliadoresava_codigo: TIntegerField;
    cdsAvaliadoresava_ano: TIntegerField;
    cdsAvaliadoresava_codavaliador: TIntegerField;
    cdsAvaliadoresnome_col: TWideStringField;
    cdsAvaliadoresava_codcolaborador: TIntegerField;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados();
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure PreencherCampos();
    function BuscarNovoCodigo():string;
    function ValidarCampos():Boolean;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgAvaliadoresCellClick(Column: TColumn);
    procedure dbgAvaliadoresKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    cOperacao: string;
  public
    { Public declarations }
    iTela: Integer;
  end;

var
  FormCadAvaliador: TFormCadAvaliador;

implementation

uses frm_CadColaborador, Funcoes, frm_dm, frm_VisualizaMatriz;

{$R *.dfm}

procedure TFormCadAvaliador.AtualizarDados;
begin
   if iTela = 1 then begin //Cadastro de Colaboradores
      edtCodigoCol.Text:= FormCadColaboradores.edtCodigoHab.Text;
      edtNomeCol.Text  := FormCadColaboradores.edtNomeHab.Text;
   end;
   if iTela = 2 then begin //Matriz de Competências
      edtCodigoCol.Text:= FormVisualizaMatriz.dblColaborador.KeyValue;
      edtNomeCol.Text  := FormVisualizaMatriz.dblColaborador.Text;
   end;

   with cdsColaboradores do begin
      Active:= False;
      Active:= True;
   end;

   with cdsAvaliadores do begin
      Active:= False;
      CommandText:= ' SELECT ava_codigo, ava_codcolaborador, ava_ano, ava_codavaliador, C.nome_col' +
                    ' FROM colab_avaliador A' +
                    ' INNER JOIN colaboradores C ON C.codi_col = A.ava_codavaliador' +
                    ' WHERE ava_codcolaborador = ' + QuotedStr(edtCodigoCol.Text) +
                    ' ORDER BY ava_ano desc';
      Active:= True;
   end;

   if cdsAvaliadores.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadAvaliador.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
//   btnImprimir.Enabled:= Flag;
end;

procedure TFormCadAvaliador.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   Botoes(False);
   TryFocus(spnAno);
end;

procedure TFormCadAvaliador.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   PreencherCampos();
end;

procedure TFormCadAvaliador.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do avaliador ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM colab_avaliador' +
                       ' WHERE ava_codigo = ' + cdsAvaliadoresava_codigo.AsString;
         Execute;
      end;

      Auditoria('CADASTRO DE AVALIADORES', spnAno.Text + '-' + dblAvaliador.Text, 'E','');
      AtualizarDados();
      PreencherCampos();
   end;
end;

procedure TFormCadAvaliador.btnGravarClick(Sender: TObject);
begin
   try
      if ValidarCampos() then begin
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO colab_avaliador(' +
                             ' ava_codigo, ava_codcolaborador, ava_ano, ava_codavaliador' +
                             ' )' +
                             ' VALUES(' +
                             BuscarNovoCodigo() + ',' +
                             QuotedStr(edtCodigoCol.Text) + ',' +
                             QuotedStr(spnAno.Text) + ',' +
                             QuotedStr(dblAvaliador.KeyValue) +
                             ')';
               Execute;

            end
            else begin
               CommandText:= ' UPDATE colab_avaliador SET' +
                             ' ava_ano = ' + QuotedStr(spnAno.Text) + ',' +
                             ' ava_codavaliador = ' + QuotedStr(dblAvaliador.KeyValue) +
                             ' WHERE ava_codigo = ' + cdsAvaliadoresava_codigo.Asstring;
               Execute;
            end;
         end;

         Auditoria('CADASTRO DE AVALIADORES', spnAno.Text + '-' + dblAvaliador.Text, cOperacao,'');
         AtualizarDados();
         PreencherCampos();
         HabilitarCampos(False, False, Self, 1);
         Botoes(True);

         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormCadAvaliador.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos(Self);
   spnAno.Text:= FormatDateTime('yyyy',Date());
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   HabilitarCampos(True, False, Self, 1);
   TryFocus(dblAvaliador);
end;

procedure TFormCadAvaliador.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

function TFormCadAvaliador.BuscarNovoCodigo: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(ava_codigo) AS NovoCodigo FROM colab_avaliador';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= '1';
      end
      else begin
         Result:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadAvaliador.dbgAvaliadoresCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadAvaliador.dbgAvaliadoresKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos();
end;

procedure TFormCadAvaliador.FormShow(Sender: TObject);
begin
   iTela:= Self.Tag;
   Botoes(True);
   AtualizarDados();
   PreencherCampos();
   HabilitarCampos(False, False, Self, 1);
//   spnAno.Text:= FormatDateTime('yyyy',Date());
end;

procedure TFormCadAvaliador.PreencherCampos;
begin
   with cdsAvaliadores do begin
      spnAno.Text          := FieldByName('ava_ano').AsString;
      dblAvaliador.KeyValue:= FieldByName('ava_codavaliador').AsString;
   end;
end;

function TFormCadAvaliador.ValidarCampos: Boolean;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as Qtd' +
                    ' FROM colab_avaliador' +
                    ' WHERE ava_codcolaborador = ' + QuotedStr(edtCodigoCol.Text) +
                    ' AND ava_ano = ' + QuotedStr(spnAno.Text);
      Active:= True;

      if (FieldByName('Qtd').AsInteger > 0) and (cOperacao = 'I') then begin
         Application.MessageBox(PChar('Já existe um avaliador cadastrado para o ano ' + spnAno.Text), 'Aviso', MB_OK + MB_ICONWARNING);
         Result:= False;
         Exit;
      end
      else begin
         Result:= True;
      end;
   end;

   if dblAvaliador.KeyValue = -1 then begin
      Application.MessageBox('Campo Avaliador é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblAvaliador);
      Result:= False;
      Exit;
   end;
end;

end.
