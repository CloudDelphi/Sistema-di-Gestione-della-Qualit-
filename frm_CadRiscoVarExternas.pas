unit frm_CadRiscoVarExternas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadRiscoVarExternas = class(TForm)
    pctVarExt: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgVarExt: TDBGrid;
    zqryVarExt: TZQuery;
    dspVarExt: TDataSetProvider;
    cdsVarExt: TClientDataSet;
    dsVarExt: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSVarExt: TfrxDBDataset;
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
    zqryFatoresExt: TZQuery;
    dspFatoresExt: TDataSetProvider;
    cdsFatoresExt: TClientDataSet;
    dsFatoresExt: TDataSource;
    cdsFatoresExtcodi_com: TLargeintField;
    cdsFatoresExtvalo_com: TWideStringField;
    mmoVariavelExt: TMemo;
    cdsImprimirvar_codigo: TIntegerField;
    cdsImprimirvar_codfator: TIntegerField;
    cdsImprimirvar_descricao: TWideStringField;
    cdsImprimirfator: TWideStringField;
    cdsVarExtvar_codigo: TIntegerField;
    cdsVarExtvar_codfator: TIntegerField;
    cdsVarExtvar_descricao: TWideStringField;
    cdsVarExtfator: TWideStringField;
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
    procedure dbgVarExtCellClick(Column: TColumn);
    procedure dbgVarExtDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtHabilidadeExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctVarExtChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadRiscoVarExternas: TFormCadRiscoVarExternas;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadRiscoVarExternas.AtualizarDados;
begin
   with cdsFatoresExt do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 22' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsVarExt do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsVarExt.Locate('var_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadRiscoVarExternas.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsVarExt.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadRiscoVarExternas.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 35, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(dblFator);
   Botoes(False);
end;

procedure TFormCadRiscoVarExternas.btnAnteriorClick(Sender: TObject);
begin
   cdsVarExt.Prior;
   PreencherCampos;
end;

procedure TFormCadRiscoVarExternas.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadRiscoVarExternas.btnExcluirClick(Sender: TObject);
var
   sVarExt: string;
begin
   if (Acesso(cUsuario, 35, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sVarExt:= Copy(mmoVariavelExt.Text,1,200);

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM risco_variaveis_ext' +
                          ' WHERE var_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('RISCOS - VARIÁVEIS EXTERNAS',sVarExt,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadRiscoVarExternas.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO risco_variaveis_ext (' +
                          ' var_codigo, var_codfator, var_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(dblFator.KeyValue) + ',' +
                          QuotedStr(mmoVariavelExt.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE risco_variaveis_ext SET' +
                          ' var_codfator = ' + QuotedStr(dblFator.KeyValue) + ',' +
                          ' var_descricao = ' + QuotedStr(mmoVariavelExt.Text) +
                          ' WHERE var_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('RISCOS - VARIÁVEIS EXTERNAS',Copy(mmoVariavelExt.Text,1,200),cOperacao,'');
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

procedure TFormCadRiscoVarExternas.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRiscoVarExternas.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadRiscoVarExternas.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 35, 'cadastro') = 1) then begin
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

procedure TFormCadRiscoVarExternas.btnPrimeiroClick(Sender: TObject);
begin
   cdsVarExt.First;
   PreencherCampos;
end;

procedure TFormCadRiscoVarExternas.btnProximoClick(Sender: TObject);
begin
   cdsVarExt.Next;
   PreencherCampos;
end;

procedure TFormCadRiscoVarExternas.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRiscoVarExternas.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRiscoVarExternas.btnUltimoClick(Sender: TObject);
begin
   cdsVarExt.Last;
   PreencherCampos;
end;

procedure TFormCadRiscoVarExternas.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRiscoVarExternas.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(var_codigo) AS NovoCodigo FROM risco_variaveis_ext';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadRiscoVarExternas.ControlarAbas;
begin
   if pctVarExt.TabIndex = 0 then begin  // Cadastro
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

procedure TFormCadRiscoVarExternas.dbgVarExtCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadRiscoVarExternas.dbgVarExtDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctVarExt.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadRiscoVarExternas.edtHabilidadeExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadRiscoVarExternas.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsVarExt.Locate('var_descricao',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadRiscoVarExternas.FormShow(Sender: TObject);
begin
   pctVarExt.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadRiscoVarExternas.LimparCampos;
begin
   edtCodigo.Clear;
   mmoVariavelExt.Clear;
end;

procedure TFormCadRiscoVarExternas.pctVarExtChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadRiscoVarExternas.PreencherCampos;
begin
   with cdsVarExt do begin
      edtCodigo.Text     := FieldByName('var_codigo').AsString;
      dblFator.KeyValue  := FieldByName('var_codfator').AsInteger;
      mmoVariavelExt.Text:= FieldByName('var_descricao').AsString;
   end;
end;

procedure TFormCadRiscoVarExternas.Impressao(tipoImp: string);
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
                    ' FROM risco_variaveis_ext R' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = R.var_codfator AND TC.tipo_com = 22' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_risco_var_ext.fr3');
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
