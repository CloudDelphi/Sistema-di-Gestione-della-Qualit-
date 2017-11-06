unit frm_CadRiscoVarInternas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadRiscoVarInternas = class(TForm)
    pctVarInt: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgVarInt: TDBGrid;
    zqryVarInt: TZQuery;
    dspVarInt: TDataSetProvider;
    cdsVarInt: TClientDataSet;
    dsVarInt: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSVarInt: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    frxReport1: TfrxReport;
    lbl16: TLabel;
    dblFator: TDBLookupComboBox;
    zqryFatoresInt: TZQuery;
    dspFatoresInt: TDataSetProvider;
    cdsFatoresInt: TClientDataSet;
    dsFatoresInt: TDataSource;
    cdsFatoresIntcodi_com: TLargeintField;
    cdsFatoresIntvalo_com: TWideStringField;
    mmoVariavelInt: TMemo;
    cdsImprimirvar_codigo: TIntegerField;
    cdsImprimirvar_codfator: TIntegerField;
    cdsImprimirvar_descricao: TWideStringField;
    cdsImprimirfator: TWideStringField;
    cdsVarIntvar_codigo: TIntegerField;
    cdsVarIntvar_codfator: TIntegerField;
    cdsVarIntvar_descricao: TWideStringField;
    cdsVarIntfator: TWideStringField;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure Botoes(Flag: Boolean);
    procedure BuscarNovoCodigo();
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure FormShow(Sender: TObject);
    procedure dbgVarIntCellClick(Column: TColumn);
    procedure dbgVarIntDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtHabilidadeExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctVarIntChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadRiscoVarInternas: TFormCadRiscoVarInternas;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadRiscoVarInternas.AtualizarDados;
begin
   with cdsFatoresInt do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 23' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsVarInt do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsVarInt.Locate('var_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadRiscoVarInternas.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsVarInt.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadRiscoVarInternas.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 36, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(dblFator);
   Botoes(False);
end;

procedure TFormCadRiscoVarInternas.btnAnteriorClick(Sender: TObject);
begin
   cdsVarInt.Prior;
   PreencherCampos;
end;

procedure TFormCadRiscoVarInternas.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadRiscoVarInternas.btnExcluirClick(Sender: TObject);
var
   sVarInt: string;
begin
   if (Acesso(cUsuario, 36, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sVarInt:= Copy(mmoVariavelInt.Text,1,200);

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM risco_variaveis_int' +
                          ' WHERE var_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('RISCOS - VARIÁVEIS INTERNAS',sVarInt,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadRiscoVarInternas.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO risco_variaveis_int (' +
                          ' var_codigo, var_codfator, var_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(dblFator.KeyValue) + ',' +
                          QuotedStr(mmoVariavelInt.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE risco_variaveis_int SET' +
                          ' var_codfator = ' + QuotedStr(dblFator.KeyValue) + ',' +
                          ' var_descricao = ' + QuotedStr(mmoVariavelInt.Text) +
                          ' WHERE var_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('RISCOS - VARIÁVEIS INTERNAS',Copy(mmoVariavelInt.Text,1,200),cOperacao,'');
      AtualizarDados;

      HabilitarCampos(False, False, Self, 1);
      Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;

   Botoes(True);
   TryFocus(btnNovo);
end;

procedure TFormCadRiscoVarInternas.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRiscoVarInternas.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadRiscoVarInternas.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 36, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   BuscarNovoCodigo();
   TryFocus(dblFator);
end;

procedure TFormCadRiscoVarInternas.btnPrimeiroClick(Sender: TObject);
begin
   cdsVarInt.First;
   PreencherCampos;
end;

procedure TFormCadRiscoVarInternas.btnProximoClick(Sender: TObject);
begin
   cdsVarInt.Next;
   PreencherCampos;
end;

procedure TFormCadRiscoVarInternas.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRiscoVarInternas.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRiscoVarInternas.btnUltimoClick(Sender: TObject);
begin
   cdsVarInt.Last;
   PreencherCampos;
end;

procedure TFormCadRiscoVarInternas.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRiscoVarInternas.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(var_codigo) AS NovoCodigo FROM risco_variaveis_int';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadRiscoVarInternas.ControlarAbas;
begin
   if pctVarInt.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin // Pesquisa
      btnNovo.Enabled:= False;
      btnGravar.Enabled:= False;
      btnExcluir.Enabled:= False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled:= False;

      edtValor.Enabled:= True;
      edtValor.Clear;
      edtValor.SetFocus;
   end;
end;

procedure TFormCadRiscoVarInternas.dbgVarIntCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadRiscoVarInternas.dbgVarIntDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctVarInt.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadRiscoVarInternas.edtHabilidadeExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadRiscoVarInternas.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsVarInt.Locate('var_descricao',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadRiscoVarInternas.FormShow(Sender: TObject);
begin
   pctVarInt.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadRiscoVarInternas.LimparCampos;
begin
   edtCodigo.Clear;
   mmoVariavelInt.Clear;
end;

procedure TFormCadRiscoVarInternas.pctVarIntChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadRiscoVarInternas.PreencherCampos;
begin
   with cdsVarInt do begin
      edtCodigo.Text     := FieldByName('var_codigo').AsString;
      dblFator.KeyValue  := FieldByName('var_codfator').AsInteger;
      mmoVariavelInt.Text:= FieldByName('var_descricao').AsString;
   end;
end;

procedure TFormCadRiscoVarInternas.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'fator, var_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'fator, var_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT var_codigo, var_codfator, TC.valo_com as Fator, var_descricao' +
                    ' FROM risco_variaveis_int R' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = R.var_codfator AND TC.tipo_com = 23' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_risco_var_int.fr3');
      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
//            PrintOptions.Printer:= 'CutePDF Writer';
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

end.
