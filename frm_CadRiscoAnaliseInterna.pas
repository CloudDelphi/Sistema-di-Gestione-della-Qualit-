unit frm_CadRiscoAnaliseInterna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadRiscoAnaliseInterna = class(TForm)
    pctAnaliseInt: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    edtCodigo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgAnaliseInt: TDBGrid;
    zqryVarInt: TZQuery;
    dspVarInt: TDataSetProvider;
    cdsVarInt: TClientDataSet;
    dsVarInt: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSAnaliseInterna: TfrxDBDataset;
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
    mmoTexto: TMemo;
    cdsVarIntvar_codigo: TIntegerField;
    cdsVarIntvar_codfator: TIntegerField;
    cdsVarIntvar_descricao: TWideStringField;
    lbl2: TLabel;
    dblVariavelInt: TDBLookupComboBox;
    rgTipo: TRadioGroup;
    zqryAnaliseInt: TZQuery;
    dspAnaliseInt: TDataSetProvider;
    cdsAnaliseInt: TClientDataSet;
    dsAnaliseInt: TDataSource;
    zqryFatoresImp: TZQuery;
    dspFatoresImp: TDataSetProvider;
    cdsFatoresImp: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsFatoresImp: TDataSource;
    lbl4: TLabel;
    dblProcesso: TDBLookupComboBox;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    cdsAnaliseIntint_codigo: TIntegerField;
    cdsAnaliseIntint_codfator: TIntegerField;
    cdsAnaliseIntint_codvariavel: TIntegerField;
    cdsAnaliseIntint_tipo: TIntegerField;
    cdsAnaliseIntint_processo: TIntegerField;
    cdsImprimirint_codigo: TIntegerField;
    cdsImprimirint_codfator: TIntegerField;
    cdsImprimirint_codvariavel: TIntegerField;
    cdsImprimirint_tipo: TIntegerField;
    cdsImprimirfator: TWideStringField;
    cdsImprimirvar_descricao: TWideStringField;
    cdsImprimirint_processo: TIntegerField;
    cdsImprimirprocesso: TWideStringField;
    lbl5: TLabel;
    lbl6: TLabel;
    dblProbabilidade: TDBLookupComboBox;
    dblConsequencia: TDBLookupComboBox;
    pnlRisco: TPanel;
    zqryProbabilidade: TZQuery;
    dspProbabilidade: TDataSetProvider;
    cdsProbabilidade: TClientDataSet;
    dsProbabilidade: TDataSource;
    zqryConsequencia: TZQuery;
    dspConsequencia: TDataSetProvider;
    cdsConsequencia: TClientDataSet;
    dsConsequencia: TDataSource;
    cdsAnaliseIntint_probabilidade: TIntegerField;
    cdsAnaliseIntint_consequencia: TIntegerField;
    cdsAnaliseIntint_texto: TWideMemoField;
    cdsImprimirint_texto: TWideMemoField;
    zqryProcessoImp: TZQuery;
    dspProcessoImp: TDataSetProvider;
    cdsProcessoImp: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsProcessoImp: TDataSource;
    pnlImprimir: TPanel;
    lbl3: TLabel;
    lbl7: TLabel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgTipoImp: TRadioGroup;
    dblFatorImp: TDBLookupComboBox;
    chkTodosFator: TCheckBox;
    dblProcessoImp: TDBLookupComboBox;
    chkTodosProcesso: TCheckBox;
    rgOrdemImpressao: TRadioGroup;
    tsHistorico: TTabSheet;
    lbl8: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtCodigoHist: TEdit;
    dblFatorHist: TDBLookupComboBox;
    dblVariavelHist: TDBLookupComboBox;
    dblProcessoHist: TDBLookupComboBox;
    lbl14: TLabel;
    dbgHistorico: TDBGrid;
    zqryHistorico: TZQuery;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    dsHistorico: TDataSource;
    cdsHistoricohis_codigo: TIntegerField;
    cdsHistoricohis_codanalise: TIntegerField;
    cdsHistoricohis_data: TDateTimeField;
    cdsHistoricohis_probabilidade: TIntegerField;
    cdsHistoricoprobabilidade: TWideStringField;
    cdsHistoricohis_consequencia: TIntegerField;
    cdsHistoricoconsequencia: TWideStringField;
    cdsHistoricohis_texto: TWideMemoField;
    pnlTexto: TPanel;
    pnl4: TPanel;
    btnSairTexto: TBitBtn;
    mmoTextoConsulta: TMemo;
    pnl5: TPanel;
    lbl15: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    edtDataHist: TEdit;
    edtProbHist: TEdit;
    edtConsHist: TEdit;
    cdsHistoricohis_usuario: TWideStringField;
    pnlFiltroProcesso: TPanel;
    lbl20: TLabel;
    chkFiltroProc: TCheckBox;
    dblFiltroProcesso: TDBLookupComboBox;
    zqryProcessoFiltro: TZQuery;
    dspProcessoFiltro: TDataSetProvider;
    cdsProcessoFiltro: TClientDataSet;
    cds2: TLargeintField;
    cds3: TWideStringField;
    dsProcessoFiltro: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure Botoes(Flag: Boolean);
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
    procedure dbgAnaliseIntCellClick(Column: TColumn);
    procedure dbgAnaliseIntDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtHabilidadeExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctAnaliseIntChange(Sender: TObject);
    procedure dblFatorCloseUp(Sender: TObject);
    procedure chkTodosFatorClick(Sender: TObject);
    procedure dblProbabilidadeCloseUp(Sender: TObject);
    procedure pnlRiscoClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure cdsAnaliseIntint_textoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure chkTodosProcessoClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure cdsHistoricohis_textoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnSairTextoClick(Sender: TObject);
    procedure dbgHistoricoDblClick(Sender: TObject);
    procedure GravarHistorico();
    procedure rgTipoClick(Sender: TObject);
    procedure FiltrarProcesso();
    procedure chkFiltroProcClick(Sender: TObject);
    procedure dblFiltroProcessoCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
    iTela: Integer;
    sCodigoPMC: string;
  end;

var
  FormCadRiscoAnaliseInterna: TFormCadRiscoAnaliseInterna;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_CadPMCVinculo;

{$R *.dfm}

procedure TFormCadRiscoAnaliseInterna.AtualizarDados;
begin
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsProcessoFiltro do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsFatoresExt do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 23' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsFatoresImp do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 23' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsProcessoImp do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsProbabilidade do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 24' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsConsequencia do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 25' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsAnaliseInt do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsAnaliseInt.Locate('int_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadRiscoAnaliseInterna.AtualizarDadosAcessorios;
begin
   if edtCodigo.Text <> EmptyStr then begin
      with cdsHistorico do begin
         Active:= False;
         CommandText:= ' SELECT his_codigo, his_codanalise, his_data, his_probabilidade, TC.valo_com as probabilidade,' +
                       ' his_consequencia, TC1.valo_com as consequencia, his_texto, his_usuario' +
                       ' FROM risco_analiseint_hist' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 24 AND TC.codi_com = his_probabilidade' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 25 AND TC1.codi_com = his_consequencia' +
                       ' WHERE his_codanalise = ' + edtCodigo.Text +
                       ' ORDER BY his_data DESC';
         Active:= True;
      end;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsAnaliseInt.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 37, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1, 2);
   TryFocus(dblFator);
   Botoes(False);
end;

procedure TFormCadRiscoAnaliseInterna.btnAnteriorClick(Sender: TObject);
begin
   cdsAnaliseInt.Prior;
   PreencherCampos;
end;

procedure TFormCadRiscoAnaliseInterna.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;

procedure TFormCadRiscoAnaliseInterna.btnExcluirClick(Sender: TObject);
var
   sTexto: string;
begin
   if (Acesso(cUsuario, 37, 'exclusao') = 1) then begin
      if pctAnaliseInt.TabIndex = 0 then begin // Cadastro
         if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sTexto:= Copy(mmoTexto.Text,1,200);

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM risco_analiseint' +
                             ' WHERE int_codigo = ' + QuotedStr(edtCodigo.Text);
               Execute;
            end;

            Auditoria('RISCOS - ANÁLISE INTERNA',sTexto,'E','');
            LimparCampos;
            AtualizarDados;
            PreencherCampos;
            Botoes(True);
         end;
      end;
      if pctAnaliseInt.TabIndex = 1 then begin // Histórico
         if Application.MessageBox('Confirma a exclusão do histórico ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sTexto:= cdsHistorico.FieldByName('his_data').AsString + '-' +
                     cdsHistorico.FieldByName('his_usuario').AsString + '-' +
                     Copy(cdsHistorico.FieldByName('his_texto').AsString,1,155);

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM risco_analiseint_hist' +
                             ' WHERE his_codigo = ' + cdsHistorico.FieldByName('his_codigo').AsString;
               Execute;
            end;

            Auditoria('RISCOS - ANÁLISE INTERNA - HISTÓRICO' ,sTexto, 'E', '');
            AtualizarDadosAcessorios();
         end;
      end;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.btnGravarClick(Sender: TObject);
begin
   try
      if ValidarDados() then begin
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO risco_analiseint (' +
                             ' int_codigo, int_codfator, int_codvariavel, int_tipo, int_texto, ' +
                             ' int_processo, int_probabilidade, int_consequencia)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(dblFator.KeyValue) + ',' +
                             QuotedStr(dblVariavelInt.KeyValue) + ',' +
                             IntToStr(rgTipo.ItemIndex) + ',' +
                             QuotedStr(mmoTexto.Text) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             QuotedStr(dblProbabilidade.KeyValue) + ',' +
                             QuotedStr(dblConsequencia.KeyValue) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE risco_analiseint SET' +
                             ' int_codfator = ' + QuotedStr(dblFator.KeyValue) + ',' +
                             ' int_codvariavel = ' + QuotedStr(dblVariavelInt.KeyValue) + ',' +
                             ' int_tipo = ' + IntToStr(rgTipo.ItemIndex) + ',' +
                             ' int_texto = ' + QuotedStr(mmoTexto.Text) + ',' +
                             ' int_processo = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' int_probabilidade = ' + QuotedStr(dblProbabilidade.KeyValue) + ',' +
                             ' int_consequencia = ' + QuotedStr(dblConsequencia.KeyValue) +
                             ' WHERE int_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         Auditoria('RISCOS - ANÁLISE INTERNA',Copy(mmoTexto.Text,1,200),cOperacao,'');
         AtualizarDados();

         Botoes(True);
         TryFocus(btnNovo);

         HabilitarCampos(False, False, Self, 1, 2);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

         if iTela = 1 then begin // Vinculo PMC/Risco
            with dm.cdsGravar do begin
               Active:= False;
               CommandText:= ' UPDATE pmc SET' +
                             ' pmc_codrisco = ' + QuotedStr(edtCodigo.Text) + ',' +
                             ' pmc_tiporisco = 1 ' + // Interna (tabela_combos)
                             ' WHERE codi_pmc = ' + sCodigoPMC;
               Execute;
            end;

            FormCadPMCVinculo.AtualizarDados();
         end;

         GravarHistorico();
      end;

   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRiscoAnaliseInterna.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.Enabled:= True;
   rgTipoImp.Enabled       := True;
   chkTodosFator.Enabled   := True;
   chkTodosProcesso.Enabled:= True;

   rgOrdemImpressao.ItemIndex:= 1;
   rgTipoImp.ItemIndex       := 2;
   chkTodosFator.Checked     := True;
   chkTodosProcesso.Checked  := True;
end;

procedure TFormCadRiscoAnaliseInterna.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 37, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True, Self, 1, 2);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('risco_analiseint', 'int_codigo');
   TryFocus(dblProcesso);
end;

procedure TFormCadRiscoAnaliseInterna.btnPrimeiroClick(Sender: TObject);
begin
   cdsAnaliseInt.First;
   PreencherCampos;
end;

procedure TFormCadRiscoAnaliseInterna.btnProximoClick(Sender: TObject);
begin
   cdsAnaliseInt.Next;
   PreencherCampos;
end;

procedure TFormCadRiscoAnaliseInterna.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRiscoAnaliseInterna.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRiscoAnaliseInterna.btnSairTextoClick(Sender: TObject);
begin
   pnlTexto.Visible:= False;
end;

procedure TFormCadRiscoAnaliseInterna.btnUltimoClick(Sender: TObject);
begin
   cdsAnaliseInt.Last;
   PreencherCampos;
end;

procedure TFormCadRiscoAnaliseInterna.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRiscoAnaliseInterna.cdsAnaliseIntint_textoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAnaliseInt.FieldByName('int_texto').AsString, 1, 70);
end;

procedure TFormCadRiscoAnaliseInterna.cdsHistoricohis_textoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsHistorico.FieldByName('his_texto').AsString, 1,50);
end;

procedure TFormCadRiscoAnaliseInterna.chkFiltroProcClick(Sender: TObject);
begin
   dblFiltroProcesso.Enabled:= not chkFiltroProc.Checked;
   FiltrarProcesso();
end;

procedure TFormCadRiscoAnaliseInterna.chkTodosFatorClick(Sender: TObject);
begin
   dblFatorImp.Enabled:= not chkTodosFator.Checked;
end;

procedure TFormCadRiscoAnaliseInterna.chkTodosProcessoClick(Sender: TObject);
begin
   dblProcessoImp.Enabled:= not chkTodosProcesso.Checked;
end;

procedure TFormCadRiscoAnaliseInterna.ControlarAbas;
begin
   case pctAnaliseInt.TabIndex of
      0: begin
         Botoes(True);

      end;
      1: begin
         AtualizarDadosAcessorios();
         edtCodigoHist.Text      := edtCodigo.Text;
         dblProcessoHist.KeyValue:= dblProcesso.KeyValue;
         dblFatorHist.KeyValue   := dblFator.KeyValue;
         dblVariavelHist.KeyValue:= dblVariavelInt.KeyValue;

         btnNovo.Enabled:= False;
         btnGravar.Enabled:= False;
         btnExcluir.Enabled:= True;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled:= False;
      end;
      2: begin
         btnNovo.Enabled:= False;
         btnGravar.Enabled:= False;
         btnExcluir.Enabled:= False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled:= False;

         edtValor.Enabled:= True;
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.dbgAnaliseIntCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadRiscoAnaliseInterna.dbgAnaliseIntDblClick(Sender: TObject);
var
   sCodigo: string;
begin
   sCodigo:= cdsAnaliseInt.FieldByName('int_codigo').AsString;
   pctAnaliseInt.TabIndex:= 0;
   cdsAnaliseInt.Filtered:= False;

   if sCodigo <> EmptyStr then begin
      cdsAnaliseInt.Locate('int_codigo', sCodigo, []);
   end;
   PreencherCampos();
   ControlarAbas();
end;

procedure TFormCadRiscoAnaliseInterna.dbgHistoricoDblClick(Sender: TObject);
begin
   AbrePanel(pnlTexto, Self);
   edtDataHist.Text     := cdsHistorico.FieldByName('his_data').AsString;
   edtProbHist.Text     := cdsHistorico.FieldByName('probabilidade').AsString;
   edtConsHist.Text     := cdsHistorico.FieldByName('consequencia').AsString;
   mmoTextoConsulta.Text:= cdsHistorico.FieldByName('his_texto').AsString;
end;

procedure TFormCadRiscoAnaliseInterna.dblFatorCloseUp(Sender: TObject);
begin
   with cdsVarInt do begin
      Active:= False;
      CommandText:= ' SELECT var_codigo, var_codfator, var_descricao' +
                    ' FROM risco_variaveis_int' +
                    ' WHERE var_codfator = ' + QuotedStr(dblFator.KeyValue) +
                    ' ORDER BY var_descricao';
      Active:= True;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.dblFiltroProcessoCloseUp(Sender: TObject);
begin
   FiltrarProcesso();
end;

procedure TFormCadRiscoAnaliseInterna.dblProbabilidadeCloseUp(Sender: TObject);
begin
   ColorirRisco(pnlRisco, dblConsequencia.KeyValue, dblProbabilidade.KeyValue, rgTipo.ItemIndex);
end;

procedure TFormCadRiscoAnaliseInterna.edtHabilidadeExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadRiscoAnaliseInterna.edtValorChange(Sender: TObject);
begin
   FiltrarProcesso();
end;
procedure TFormCadRiscoAnaliseInterna.FiltrarProcesso;
var
   sFiltro: string;
begin
   case cbbCampo.ItemIndex of
      0: sFiltro:= 'int_texto LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   if chkFiltroProc.Checked = False then begin
      if (dblFiltroProcesso.KeyValue <> null) and (dblFiltroProcesso.KeyValue <> -1) then begin
         if sFiltro <> EmptyStr then begin
            sFiltro:= sFiltro + ' AND ';
         end;

         sFiltro:= sFiltro + 'int_processo = ' + IntToStr(dblFiltroProcesso.KeyValue);
      end;
   end;

   if sFiltro <> EmptyStr then begin
      cdsAnaliseInt.Filter:= sFiltro;
      cdsAnaliseInt.Filtered:= True;
   end
   else begin
      cdsAnaliseInt.Filtered:= False;
   end;

end;

procedure TFormCadRiscoAnaliseInterna.FormShow(Sender: TObject);
begin
   pctAnaliseInt.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);

   if iTela = 1 then begin // Vínculo de PMC/Risco
      btnNovoClick(Self);
      dblProcesso.KeyValue     := -1;
      dblFator.KeyValue        := -1;
      dblVariavelInt.KeyValue  := -1;
      dblProbabilidade.KeyValue:= -1;
      dblConsequencia.KeyValue := -1;

      ColorirRisco(pnlRisco, dblConsequencia.KeyValue, dblProbabilidade.KeyValue, rgTipo.ItemIndex);
   end;
end;

procedure TFormCadRiscoAnaliseInterna.GravarHistorico;
begin
   try
      Executar(' INSERT INTO risco_analiseint_hist' +
               ' (his_codigo, his_codanalise, his_usuario, his_data, his_probabilidade,' +
               ' his_consequencia, his_texto)' +
               ' VALUES (' +
               BuscarNovoCodigo('risco_analiseint_hist','his_codigo') + ',' +
               edtCodigo.Text + ',' +
               QuotedStr(cUsuario) + ',' +
               ArrumaDataSQL(Date()) + ',' +
               IntToStr(dblProbabilidade.KeyValue) + ',' +
               IntToStr(dblConsequencia.KeyValue) + ',' +
               QuotedStr(mmoTexto.Text) +
               ')');

      AtualizarDadosAcessorios();
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados de histórico. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.LimparCampos;
begin
   edtCodigo.Clear;
   mmoTexto.Clear;
end;

procedure TFormCadRiscoAnaliseInterna.pctAnaliseIntChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadRiscoAnaliseInterna.pnlRiscoClick(Sender: TObject);
var
   sDescricaoRisco: string;
begin
   sDescricaoRisco:= BuscarDescricaoRisco(pnlRisco.Brush.Color, rgTipo.ItemIndex, 'I');

   if pnlRisco.Caption <> '' then begin
      Application.MessageBox(PChar(sDescricaoRisco), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
   end;

end;

procedure TFormCadRiscoAnaliseInterna.PreencherCampos;
begin
   with cdsAnaliseInt do begin
      edtCodigo.Text           := FieldByName('int_codigo').AsString;
      dblFator.KeyValue        := FieldByName('int_codfator').AsInteger;
      dblFatorCloseUp(Self);
      dblVariavelInt.KeyValue  := FieldByName('int_codvariavel').AsInteger;
      mmoTexto.Text            := FieldByName('int_texto').AsString;
      dblProcesso.KeyValue     := FieldByName('int_processo').AsInteger;
      dblProbabilidade.KeyValue:= FieldByName('int_probabilidade').AsInteger;
      dblConsequencia.KeyValue := FieldByName('int_consequencia').AsInteger;
      dblProbabilidadeCloseUp(Self);
      rgTipo.ItemIndex         := FieldByName('int_tipo').AsInteger;
   end;
end;

procedure TFormCadRiscoAnaliseInterna.rgTipoClick(Sender: TObject);
begin
   ColorirRisco(pnlRisco, dblConsequencia.KeyValue, dblProbabilidade.KeyValue, rgTipo.ItemIndex);
end;

function TFormCadRiscoAnaliseInterna.ValidarDados(): Boolean;
begin
   if ((dblProcesso.KeyValue = -1) or (dblProcesso.KeyValue = Null)) then begin
      Application.MessageBox('Selecione o Processo', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if ((dblFator.KeyValue = -1) or (dblFator.KeyValue = Null)) then begin
      Application.MessageBox('Selecione o Fator', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblFator);
      Result:= False;
      Exit;
   end;

   if ((dblVariavelInt.KeyValue = -1) or (dblVariavelInt.KeyValue = Null)) then begin
      Application.MessageBox('Selecione a Variável Externa', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblVariavelInt);
      Result:= False;
      Exit;
   end;

   if Alltrim(mmoTexto.Text) = EmptyStr then begin
      Application.MessageBox('Digite a análise', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoTexto);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadRiscoAnaliseInterna.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sTipo: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'processo, fator, int_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'processo, fator, int_texto'
   end;

   case rgTipoImp.ItemIndex of
      0: begin
         sTipo:= ' AND int_tipo = 0 ';
      end;
      1: begin
         sTipo:= ' AND int_tipo = 1 ';
      end;
      2: begin
         sTipo:= ' ';
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT int_codigo, int_codfator, int_codvariavel, int_tipo, int_texto,' +
                    ' TC.valo_com as Fator, R.var_descricao, P.nome_pro as processo, int_processo' +
                    ' FROM risco_analiseint' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = int_codfator and TC.tipo_com = 23' +
                    ' INNER JOIN risco_variaveis_int R ON R.var_codigo = int_codvariavel' +
                    ' INNER JOIN processos P ON P.codi_pro = int_processo ' +
                    ' WHERE 1 = 1' +
                    sTipo;
      if chkTodosFator.Checked = False then begin
         CommandText:= CommandText + ' AND int_codfator = ' + IntToStr(dblFatorImp.KeyValue);
      end;
      if chkTodosProcesso.Checked = False then begin
         CommandText:= CommandText + ' AND int_processo = ' + IntToStr(dblProcessoImp.KeyValue);
      end;
      CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_risco_AnaliseInterna.fr3');
      if tipoImp = 'I' then begin
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

end.
