unit frm_CadRiscoMacroAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadRiscoMacroAmbiente = class(TForm)
    pctMacro: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
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
    frxDBDSMacro: TfrxDBDataset;
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
    mmoTexto: TMemo;
    cdsVarExtvar_codigo: TIntegerField;
    cdsVarExtvar_codfator: TIntegerField;
    cdsVarExtvar_descricao: TWideStringField;
    lbl2: TLabel;
    dblVariavelExt: TDBLookupComboBox;
    rgTipo: TRadioGroup;
    zqryMacro: TZQuery;
    dspMacro: TDataSetProvider;
    cdsMacro: TClientDataSet;
    dsMacro: TDataSource;
    cdsMacromac_codigo: TIntegerField;
    cdsMacromac_codfator: TIntegerField;
    cdsMacromac_codvariavel: TIntegerField;
    cdsMacromac_tipo: TIntegerField;
    rgTipoImp: TRadioGroup;
    lbl3: TLabel;
    dblFatorImp: TDBLookupComboBox;
    chkTodosFator: TCheckBox;
    zqryFatoresImp: TZQuery;
    dspFatoresImp: TDataSetProvider;
    cdsFatoresImp: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsFatoresImp: TDataSource;
    cdsImprimirmac_codigo: TIntegerField;
    cdsImprimirmac_codfator: TIntegerField;
    cdsImprimirmac_codvariavel: TIntegerField;
    cdsImprimirmac_tipo: TIntegerField;
    cdsImprimirfator: TWideStringField;
    cdsImprimirvar_descricao: TWideStringField;
    lbl4: TLabel;
    dblProcesso: TDBLookupComboBox;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    cdsMacromac_processo: TIntegerField;
    lbl5: TLabel;
    dblProbabilidade: TDBLookupComboBox;
    lbl6: TLabel;
    dblConsequencia: TDBLookupComboBox;
    zqryProbabilidade: TZQuery;
    dspProbabilidade: TDataSetProvider;
    cdsProbabilidade: TClientDataSet;
    dsProbabilidade: TDataSource;
    zqryConsequencia: TZQuery;
    dspConsequencia: TDataSetProvider;
    cdsConsequencia: TClientDataSet;
    dsConsequencia: TDataSource;
    pnlRisco: TPanel;
    cdsMacromac_probabilidade: TIntegerField;
    cdsMacromac_consequencia: TIntegerField;
    cdsMacromac_texto: TWideMemoField;
    cdsImprimirmac_texto: TWideMemoField;
    lbl7: TLabel;
    dblProcessoImp: TDBLookupComboBox;
    chkTodosProcesso: TCheckBox;
    zqryProcessoImp: TZQuery;
    dspProcessoImp: TDataSetProvider;
    cdsProcessoImp: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsProcessoImp: TDataSource;
    cdsImprimirprocesso: TWideStringField;
    tsHistorico: TTabSheet;
    lbl8: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    edtCodigoHist: TEdit;
    dblFatorHist: TDBLookupComboBox;
    dblVariavelHist: TDBLookupComboBox;
    dblProcessoHist: TDBLookupComboBox;
    dbgHistorico: TDBGrid;
    zqryHistorico: TZQuery;
    dspHistorico: TDataSetProvider;
    cdsHistorico: TClientDataSet;
    cdsHistoricohis_codigo: TIntegerField;
    cdsHistoricohis_codanalise: TIntegerField;
    cdsHistoricohis_data: TDateTimeField;
    cdsHistoricohis_probabilidade: TIntegerField;
    cdsHistoricoprobabilidade: TWideStringField;
    cdsHistoricohis_consequencia: TIntegerField;
    cdsHistoricoconsequencia: TWideStringField;
    cdsHistoricohis_texto: TWideMemoField;
    cdsHistoricohis_usuario: TWideStringField;
    dsHistorico: TDataSource;
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
    pnlFiltroProcesso: TPanel;
    chkFiltroProc: TCheckBox;
    lbl20: TLabel;
    dblFiltroProcesso: TDBLookupComboBox;
    zqryProcessoFiltro: TZQuery;
    dspProcessoFiltro: TDataSetProvider;
    cdsProcessoFiltro: TClientDataSet;
    cds2: TLargeintField;
    cds3: TWideStringField;
    dsProcessoFiltro: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
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
    procedure dbgVarExtCellClick(Column: TColumn);
    procedure dbgVarExtDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtHabilidadeExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctMacroChange(Sender: TObject);
    procedure dblFatorCloseUp(Sender: TObject);
    procedure chkTodosFatorClick(Sender: TObject);
    procedure dblProbabilidadeCloseUp(Sender: TObject);
    procedure pnlRiscoClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure cdsMacromac_textoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure chkTodosProcessoClick(Sender: TObject);
    procedure GravarHistorico();
    procedure AtualizarDadosAcessorios();
    procedure cdsHistoricohis_textoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgHistoricoDblClick(Sender: TObject);
    procedure btnSairTextoClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure chkFiltroProcClick(Sender: TObject);
    procedure FiltrarProcesso();
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
  FormCadRiscoMacroAmbiente: TFormCadRiscoMacroAmbiente;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_CadPMCVinculo;

{$R *.dfm}

procedure TFormCadRiscoMacroAmbiente.AtualizarDados;
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
                    ' WHERE tipo_com = 22' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsFatoresImp do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 22' +
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

   with cdsMacro do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsMacro.Locate('mac_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadRiscoMacroAmbiente.AtualizarDadosAcessorios;
begin
   if edtCodigo.Text <> EmptyStr then begin
      with cdsHistorico do begin
         Active:= False;
         CommandText:= ' SELECT his_codigo, his_codanalise, his_data, his_probabilidade, TC.valo_com as probabilidade,' +
                       ' his_consequencia, TC1.valo_com as consequencia, his_texto, his_usuario' +
                       ' FROM risco_macro_hist' +
                       ' INNER JOIN tabela_combos TC ON TC.tipo_com = 24 AND TC.codi_com = his_probabilidade' +
                       ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 25 AND TC1.codi_com = his_consequencia' +
                       ' WHERE his_codanalise = ' + edtCodigo.Text +
                       ' ORDER BY his_data DESC';
         Active:= True;
      end;
   end;
end;

procedure TFormCadRiscoMacroAmbiente.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsMacro.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadRiscoMacroAmbiente.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 37, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1, 2);
   TryFocus(dblFator);
   Botoes(False);
end;

procedure TFormCadRiscoMacroAmbiente.btnAnteriorClick(Sender: TObject);
begin
   cdsMacro.Prior;
   PreencherCampos;
end;

procedure TFormCadRiscoMacroAmbiente.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;

procedure TFormCadRiscoMacroAmbiente.btnExcluirClick(Sender: TObject);
var
   sTexto: string;
begin
   if (Acesso(cUsuario, 37, 'exclusao') = 1) then begin
      if pctMacro.TabIndex = 0 then begin // Cadastro
         if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sTexto:= Copy(mmoTexto.Text,1,200);

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM risco_macro' +
                             ' WHERE mac_codigo = ' + QuotedStr(edtCodigo.Text);
               Execute;
            end;

            Auditoria('RISCOS - ANÁLISE DE MACROAMBIENTE',sTexto,'E','');
            LimparCampos(Self);
            AtualizarDados;
            PreencherCampos;
            Botoes(True);
         end;
      end;
      if pctMacro.TabIndex = 1 then begin // Histórico
         if Application.MessageBox('Confirma a exclusão do histórico ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            sTexto:= cdsHistorico.FieldByName('his_data').AsString + '-' +
                     cdsHistorico.FieldByName('his_usuario').AsString + '-' +
                     Copy(cdsHistorico.FieldByName('his_texto').AsString,1,155);

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM risco_macro_hist' +
                             ' WHERE his_codigo = ' + cdsHistorico.FieldByName('his_codigo').AsString;
               Execute;
            end;

            Auditoria('RISCOS - ANÁLISE DE MACROAMBIENTE - HISTÓRICO' ,sTexto, 'E', '');
            AtualizarDadosAcessorios();
         end;
      end;
   end;
end;

procedure TFormCadRiscoMacroAmbiente.btnGravarClick(Sender: TObject);
begin
   try
      if ValidarDados() then begin
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO risco_macro (' +
                             ' mac_codigo, mac_codfator, mac_codvariavel, mac_tipo, ' +
                             ' mac_texto, mac_processo, mac_probabilidade, mac_consequencia)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(dblFator.KeyValue) + ',' +
                             QuotedStr(dblVariavelExt.KeyValue) + ',' +
                             IntToStr(rgTipo.ItemIndex) + ',' +
                             QuotedStr(mmoTexto.Text) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             QuotedStr(dblProbabilidade.KeyValue) + ',' +
                             QuotedStr(dblConsequencia.KeyValue) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE risco_macro SET' +
                             ' mac_codfator = ' + QuotedStr(dblFator.KeyValue) + ',' +
                             ' mac_codvariavel = ' + QuotedStr(dblVariavelExt.KeyValue) + ',' +
                             ' mac_tipo = ' + IntToStr(rgTipo.ItemIndex) + ',' +
                             ' mac_texto = ' + QuotedStr(mmoTexto.Text) + ',' +
                             ' mac_processo = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' mac_probabilidade = ' + QuotedStr(dblProbabilidade.KeyValue) + ',' +
                             ' mac_consequencia = ' + QuotedStr(dblConsequencia.KeyValue) +
                             ' WHERE mac_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         Auditoria('RISCOS - ANÁLISE DE MACRO AMBIENTE',Copy(mmoTexto.Text,1,200),cOperacao,'');
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
                             ' pmc_tiporisco = 2 ' + // Externa (tabela_combos)
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

procedure TFormCadRiscoMacroAmbiente.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRiscoMacroAmbiente.btnImprimirClick(Sender: TObject);
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

procedure TFormCadRiscoMacroAmbiente.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 37, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1, 2);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('risco_macro', 'mac_codigo');
   TryFocus(dblProcesso);
   pnlRisco.Color:= clBtnFace;
   pnlRisco.Caption:= '';
end;

procedure TFormCadRiscoMacroAmbiente.btnPrimeiroClick(Sender: TObject);
begin
   cdsMacro.First;
   PreencherCampos;
end;

procedure TFormCadRiscoMacroAmbiente.btnProximoClick(Sender: TObject);
begin
   cdsMacro.Next;
   PreencherCampos;
end;

procedure TFormCadRiscoMacroAmbiente.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRiscoMacroAmbiente.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRiscoMacroAmbiente.btnSairTextoClick(Sender: TObject);
begin
   pnlTexto.Visible:= False;
end;

procedure TFormCadRiscoMacroAmbiente.btnUltimoClick(Sender: TObject);
begin
   cdsMacro.Last;
   PreencherCampos;
end;

procedure TFormCadRiscoMacroAmbiente.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRiscoMacroAmbiente.cdsHistoricohis_textoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsHistorico.FieldByName('his_texto').AsString, 1,50);
end;

procedure TFormCadRiscoMacroAmbiente.cdsMacromac_textoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsMacro.FieldByName('mac_texto').AsString, 1, 70);
end;

procedure TFormCadRiscoMacroAmbiente.chkFiltroProcClick(Sender: TObject);
begin
   dblFiltroProcesso.Enabled:= not chkFiltroProc.Checked;
   FiltrarProcesso();
end;

procedure TFormCadRiscoMacroAmbiente.chkTodosFatorClick(Sender: TObject);
begin
   dblFatorImp.Enabled:= not chkTodosFator.Checked;
end;

procedure TFormCadRiscoMacroAmbiente.chkTodosProcessoClick(Sender: TObject);
begin
   dblProcessoImp.Enabled:= not chkTodosProcesso.Checked;
end;

procedure TFormCadRiscoMacroAmbiente.ControlarAbas;
begin
   case pctMacro.TabIndex of
      0: begin
         Botoes(True);
      end;
      1: begin
         AtualizarDadosAcessorios();
         edtCodigoHist.Text      := edtCodigo.Text;
         dblProcessoHist.KeyValue:= dblProcesso.KeyValue;
         dblFatorHist.KeyValue   := dblFator.KeyValue;
         dblVariavelHist.KeyValue:= dblVariavelExt.KeyValue;

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

procedure TFormCadRiscoMacroAmbiente.dbgHistoricoDblClick(Sender: TObject);
begin
   AbrePanel(pnlTexto, Self);
   edtDataHist.Text     := cdsHistorico.FieldByName('his_data').AsString;
   edtProbHist.Text     := cdsHistorico.FieldByName('probabilidade').AsString;
   edtConsHist.Text     := cdsHistorico.FieldByName('consequencia').AsString;
   mmoTextoConsulta.Text:= cdsHistorico.FieldByName('his_texto').AsString;
end;

procedure TFormCadRiscoMacroAmbiente.dbgVarExtCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadRiscoMacroAmbiente.dbgVarExtDblClick(Sender: TObject);
var
   sCodigo: string;
begin
   sCodigo:= cdsMacro.FieldByName('mac_codigo').AsString;
   pctMacro.TabIndex:= 0;
   cdsMacro.Filtered:= False;

   if sCodigo <> EmptyStr then begin
      cdsMacro.Locate('mac_codigo', sCodigo, []);
   end;

   PreencherCampos();
   ControlarAbas();
end;

procedure TFormCadRiscoMacroAmbiente.dblFatorCloseUp(Sender: TObject);
begin
   with cdsVarExt do begin
      Active:= False;
      CommandText:= ' SELECT var_codigo, var_codfator, var_descricao' +
                    ' FROM risco_variaveis_ext' +
                    ' WHERE var_codfator = ' + QuotedStr(dblFator.KeyValue) +
                    ' ORDER BY var_descricao';
      Active:= True;
   end;
end;

procedure TFormCadRiscoMacroAmbiente.dblFiltroProcessoCloseUp(Sender: TObject);
begin
   FiltrarProcesso();
end;

procedure TFormCadRiscoMacroAmbiente.dblProbabilidadeCloseUp(Sender: TObject);
begin
   ColorirRisco(pnlRisco, dblConsequencia.KeyValue, dblProbabilidade.KeyValue, rgTipo.ItemIndex);
end;

procedure TFormCadRiscoMacroAmbiente.edtHabilidadeExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadRiscoMacroAmbiente.edtValorChange(Sender: TObject);
begin
   FiltrarProcesso();
end;

procedure TFormCadRiscoMacroAmbiente.FiltrarProcesso;
var
   sFiltro: string;
begin
   case cbbCampo.ItemIndex of
      0: sFiltro:= 'mac_texto LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   if chkFiltroProc.Checked = False then begin
      if (dblFiltroProcesso.KeyValue <> null) and (dblFiltroProcesso.KeyValue <> -1) then begin
         if sFiltro <> EmptyStr then begin
            sFiltro:= sFiltro + ' AND ';
         end;

         sFiltro:= sFiltro + 'mac_processo = ' + IntToStr(dblFiltroProcesso.KeyValue);
      end;
   end;

   if sFiltro <> EmptyStr then begin
      cdsMacro.Filter:= sFiltro;
      cdsMacro.Filtered:= True;
   end
   else begin
      cdsMacro.Filtered:= False;
   end;
end;

procedure TFormCadRiscoMacroAmbiente.FormShow(Sender: TObject);
begin
   pctMacro.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);

   if iTela = 1 then begin // Vínculo de PMC/Risco
      btnNovoClick(Self);
      dblProcesso.KeyValue     := -1;
      dblFator.KeyValue        := -1;
      dblVariavelExt.KeyValue  := -1;
      dblProbabilidade.KeyValue:= -1;
      dblConsequencia.KeyValue := -1;

      ColorirRisco(pnlRisco, dblConsequencia.KeyValue, dblProbabilidade.KeyValue, rgTipo.ItemIndex);
   end;
end;

procedure TFormCadRiscoMacroAmbiente.GravarHistorico;
begin
   try
      Executar(' INSERT INTO risco_macro_hist' +
               ' (his_codigo, his_codanalise, his_usuario, his_data, his_probabilidade,' +
               ' his_consequencia, his_texto)' +
               ' VALUES (' +
               BuscarNovoCodigo('risco_macro_hist','his_codigo') + ',' +
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

procedure TFormCadRiscoMacroAmbiente.pctMacroChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadRiscoMacroAmbiente.pnlRiscoClick(Sender: TObject);
var
   sDescricaoRisco: string;
begin
   sDescricaoRisco:= BuscarDescricaoRisco(pnlRisco.Brush.Color, rgTipo.ItemIndex, 'E');

   if pnlRisco.Caption <> '' then begin
      Application.MessageBox(PChar(sDescricaoRisco), 'Informação sobre o risco', MB_OK + MB_ICONINFORMATION);
   end;
end;

procedure TFormCadRiscoMacroAmbiente.PreencherCampos;
begin
   with cdsMacro do begin
      edtCodigo.Text           := FieldByName('mac_codigo').AsString;
      dblFator.KeyValue        := FieldByName('mac_codfator').AsInteger;
      dblFatorCloseUp(Self);
      dblVariavelExt.KeyValue  := FieldByName('mac_codvariavel').AsInteger;
      mmoTexto.Text            := FieldByName('mac_texto').AsString;
      dblProcesso.KeyValue     := FieldByName('mac_processo').AsInteger;
      dblProbabilidade.KeyValue:= FieldByName('mac_probabilidade').AsInteger;
      dblConsequencia.KeyValue := FieldByName('mac_consequencia').AsInteger;
      dblProbabilidadeCloseUp(Self);
      rgTipo.ItemIndex         := FieldByName('mac_tipo').AsInteger;
   end;
end;

procedure TFormCadRiscoMacroAmbiente.rgTipoClick(Sender: TObject);
begin
   ColorirRisco(pnlRisco, dblConsequencia.KeyValue, dblProbabilidade.KeyValue, rgTipo.ItemIndex);
end;

procedure TFormCadRiscoMacroAmbiente.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sTipo: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'processo, fator, mac_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'processo, fator, mac_texto'
   end;

   case rgTipoImp.ItemIndex of
      0: begin
         sTipo:= ' AND mac_tipo = 0 ';
      end;
      1: begin
         sTipo:= ' AND mac_tipo = 1 ';
      end;
      2: begin
         sTipo:= ' ';
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT mac_codigo, mac_codfator, mac_codvariavel, mac_tipo, mac_texto, ' +
                    ' TC.valo_com as Fator, R.var_descricao, P.nome_pro as processo' +
                    ' FROM risco_macro' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = mac_codfator and TC.tipo_com = 22' +
                    ' INNER JOIN risco_variaveis_ext R ON R.var_codigo = mac_codvariavel' +
                    ' INNER JOIN processos P ON P.codi_pro = mac_processo' +
                    ' WHERE 1 = 1' +
                    sTipo;
      if chkTodosFator.Checked = False then begin
         CommandText:= CommandText + ' AND mac_codfator = ' + IntToStr(dblFatorImp.KeyValue);
      end;
      if chkTodosProcesso.Checked = False then begin
         CommandText:= CommandText + ' AND mac_processo = ' + IntToStr(dblProcessoImp.KeyValue);
      end;
      CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_risco_macroambiente.fr3');
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

function TFormCadRiscoMacroAmbiente.ValidarDados: Boolean;
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

   if ((dblVariavelExt.KeyValue = -1) or (dblVariavelExt.KeyValue = Null)) then begin
      Application.MessageBox('Selecione a Variável Externa', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblVariavelExt);
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

end.
