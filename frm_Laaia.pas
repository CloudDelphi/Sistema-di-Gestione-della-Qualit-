unit frm_Laaia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet;

type
  TFormLaaia = class(TForm)
    pctLaaia: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl12: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    dblAspectos: TDBLookupComboBox;
    edtNumero: TEdit;
    edtAtividade: TEdit;
    dblCondicao: TDBLookupComboBox;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgLaaia: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl11: TLabel;
    edtControle: TEdit;
    lbl13: TLabel;
    lblProb: TLabel;
    lbl15: TLabel;
    lblImp: TLabel;
    lbl17: TLabel;
    lblSignificativo: TLabel;
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
    lbl19: TLabel;
    dblProcesso: TDBLookupComboBox;
    lbl20: TLabel;
    lbl21: TLabel;
    edtAprovado: TEdit;
    zqryLaaia: TZQuery;
    dspLaaia: TDataSetProvider;
    cdsLaaia: TClientDataSet;
    dsLaaia: TDataSource;
    cdsLaaialai_numAspecto: TLargeintField;
    cdsLaaialai_atividade: TWideStringField;
    cdsLaaialai_aspecto: TLargeintField;
    cdsLaaialai_condicao: TLargeintField;
    cdsLaaialai_processo: TLargeintField;
    cdsLaaialai_frequencia: TLargeintField;
    cdsLaaialai_gravidade: TLargeintField;
    cdsLaaialai_controle: TWideStringField;
    cdsLaaialai_atualizacao: TDateField;
    cdsLaaialai_aprovado: TWideStringField;
    zqryAspectos: TZQuery;
    dspAspectos: TDataSetProvider;
    cdsAspectos: TClientDataSet;
    dsAspectos: TDataSource;
    zqryImpactos: TZQuery;
    dspImpactos: TDataSetProvider;
    cdsImpactos: TClientDataSet;
    dsImpactos: TDataSource;
    zqryCondicao: TZQuery;
    dspCondicao: TDataSetProvider;
    cdsCondicao: TClientDataSet;
    dsCondicao: TDataSource;
    cdsCondicaocodi_com: TLargeintField;
    cdsCondicaovalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    dtAtualizacao: TDateEdit;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    edtGrau: TCurrencyEdit;
    edtGravidade: TCurrencyEdit;
    edtProb: TCurrencyEdit;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    cdsLaaiaDescAspecto: TStringField;
    cdsLaaiaDescImpacto: TStringField;
    cdsLaaialai_eficaz: TWideStringField;
    lbl14: TLabel;
    lbl16: TLabel;
    edtPMC: TEdit;
    btnPMC: TBitBtn;
    tsLeis: TTabSheet;
    lbl8: TLabel;
    edtIdentLei: TEdit;
    edtDescLei: TEdit;
    lbl18: TLabel;
    dbgLeis: TDBGrid;
    btn1: TBitBtn;
    btnExcluirLei: TBitBtn;
    zqryLeis: TZQuery;
    dspLeis: TDataSetProvider;
    cdsLeis: TClientDataSet;
    dsLeis: TDataSource;
    btnInserirLei: TBitBtn;
    cdsLeislai_numAspecto: TLargeintField;
    cdsLeislir_identificacao: TWideStringField;
    zqryLira: TZQuery;
    dspLira: TDataSetProvider;
    cdsLira: TClientDataSet;
    dsLira: TDataSource;
    cdsLiralir_codigo: TLargeintField;
    cdsLiralir_identificacao: TWideStringField;
    cdsLiralir_descricao: TWideStringField;
    cdsLeisDescRequisito: TStringField;
    lbl22: TLabel;
    edtNumAspectoLei: TEdit;
    lbl23: TLabel;
    edtAtividadeLei: TEdit;
    dblEficaz: TDBLookupComboBox;
    zqryEficaz: TZQuery;
    dspEficaz: TDataSetProvider;
    cdsEficaz: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsEficaz: TDataSource;
    frxReport1: TfrxReport;
    frxDBDSLaaia: TfrxDBDataset;
    cdsImprimirlai_atividade: TWideStringField;
    cdsImprimirlai_aspecto: TLargeintField;
    cdsImprimirlai_impacto: TLargeintField;
    cdsImprimirlai_condicao: TLargeintField;
    cdsImprimirlai_processo: TLargeintField;
    cdsImprimirlai_frequencia: TLargeintField;
    cdsImprimirlai_gravidade: TLargeintField;
    cdsImprimirlai_controle: TWideStringField;
    cdsImprimirlai_atualizacao: TDateField;
    cdsImprimirlai_aprovado: TWideStringField;
    cdsImprimirlai_eficaz: TWideStringField;
    cdsImprimirDescProcesso: TStringField;
    cdsImprimirDescAspecto: TStringField;
    cdsImprimirDescImpacto: TStringField;
    cdsImprimirDescCondicao: TStringField;
    cdsImprimirDescProbabilidade: TStringField;
    cdsImprimirDescReal: TStringField;
    cdsImprimirGrauImpacto: TIntegerField;
    cdsImprimirSignificativo: TStringField;
    dblProcessoImp: TDBLookupComboBox;
    lbl24: TLabel;
    chkTodosProc: TCheckBox;
    cdsImprimirnome_pro: TWideStringField;
    frxDBLeis: TfrxDBDataset;
    cdsLaaialai_pmc: TWideStringField;
    tsImpactos: TTabSheet;
    lbl3: TLabel;
    dblImpactos: TDBLookupComboBox;
    btnGravarImpacto: TBitBtn;
    btnExcluirImpacto: TBitBtn;
    dbgLaaiaImpactos: TDBGrid;
    lbl25: TLabel;
    edtNumAspectoImp: TEdit;
    edtAtividadeImp: TEdit;
    lbl26: TLabel;
    zqryLaaiaImpactos: TZQuery;
    dspLaaiaImpactos: TDataSetProvider;
    cdsLaaiaImpactos: TClientDataSet;
    dsLaaiaImpactos: TDataSource;
    cdsLaaiaImpactoslai_numAspecto: TLargeintField;
    cdsLaaiaImpactoslai_codImpacto: TLargeintField;
    cdsLaaiaImpactosDescImpacto: TStringField;
    cdsAspectosasp_codigo: TLargeintField;
    cdsImpactosimp_codigo: TLargeintField;
    cdsImpactosimp_descricao: TWideStringField;
    cdsAspectosasp_descricao: TWideStringField;
    cdsImprimirimp_descricao: TWideStringField;
    cdsImprimirlai_numaspecto: TLargeintField;
    btnExcel: TBitBtn;
    cdsLaaialai_impacto: TLargeintField;
    zqryExcel: TZQuery;
    dspExcel: TDataSetProvider;
    dsExcel: TDataSource;
    cdsExcel: TClientDataSet;
    dbgExcel: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure BuscarNovoCodigo;
    procedure btnSairImpClick(Sender: TObject);
    procedure CalcularImpacto;
    procedure dblCondicaoCloseUp(Sender: TObject);
    procedure CalcularGrauImpacto;
    procedure edtProbChange(Sender: TObject);
    procedure edtGravidadeChange(Sender: TObject);
    procedure dblCondicaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgLaaiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgLaaiaCellClick(Column: TColumn);
    procedure dbgLaaiaDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctLaaiaChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtProbKeyPress(Sender: TObject; var Key: Char);
    procedure edtGravidadeKeyPress(Sender: TObject; var Key: Char);
    function ValidarDados(): Boolean;
    function VerificarLeiGravada(): Boolean;
    function VerificarImpactoGravado() : Boolean;
    procedure btnPMCClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure btn1Click(Sender: TObject);
    procedure tsLeisShow(Sender: TObject);
    procedure btnInserirLeiClick(Sender: TObject);
    procedure edtIdentLeiExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure cdsImprimirCalcFields(DataSet: TDataSet);
    procedure chkTodosProcClick(Sender: TObject);
    procedure btnExcluirLeiClick(Sender: TObject);
    procedure btnExcluirImpactoClick(Sender: TObject);
    procedure btnGravarImpactoClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure cdsExcelCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    cOperacao: Char;
  public
    { Public declarations }
  end;

var
  FormLaaia: TFormLaaia;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_pesqLira,
  frm_CadPMCAbre;

{$R *.dfm}

procedure TFormLaaia.AtualizarDados;
var
   index: string;
begin
   cOperacao:= #0;

   with cdsLaaia do begin
      Active:= False;
      CommandText:= ' SELECT lai_numAspecto, lai_atividade, lai_aspecto, ' +
                    ' lai_condicao, lai_processo, lai_frequencia,' +
                    ' lai_gravidade, lai_controle, lai_pmc, lai_atualizacao, ' +
                    ' lai_aprovado, lai_eficaz, lai_impacto' +
                    ' FROM Laaia' +
                    ' ORDER BY lai_numAspecto';
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsAspectos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsImpactos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsCondicao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 11' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEficaz do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   if AllTrim(edtNumero.Text) <> EmptyStr then begin
      cdsLaaia.Locate('lai_numaspecto',AllTrim(edtNumero.Text),[])
   end;
end;

procedure TFormLaaia.AtualizarDadosAcessorios;
begin
   if not (AllTrim(edtNumero.Text) = EmptyStr) then begin
      edtNumAspectoLei.Text:= edtNumero.Text;
      edtAtividadeLei.Text := edtAtividade.Text;
      edtNumAspectoImp.Text:= edtNumero.Text;
      edtAtividadeImp.Text := edtAtividade.Text;

      with cdsLeis do begin
         Active:= False;
         CommandText:= ' SELECT lai_numAspecto, lir_identificacao' +
                       ' FROM laaia_lei' +
                       ' WHERE lai_numAspecto = ' + edtNumero.Text +
                       ' ORDER BY lir_identificacao';
         Active:= True;
      end;

      with cdsLaaiaImpactos do begin
         Active:= False;
         CommandText:= ' SELECT lai_numAspecto, lai_codImpacto' +
                       ' FROM laaia_impactos' +
                       ' WHERE lai_numAspecto = ' + edtNumero.Text +
                       ' ORDER BY lai_codImpacto';
         Active:= True;
      end;
   end;
end;

procedure TFormLaaia.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;
   btnExcel.Enabled   := Flag;

   if cdsLaaia.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormLaaia.btnPMCClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      FormCadPMCAbre:= TFormCadPMCAbre.Create(nil);
      FormCadPMCAbre.ShowModal;
      FormCadPMCAbre.Release;
   end;
end;

procedure TFormLaaia.btn1Click(Sender: TObject);
begin
   FormPesqLira:= TFormPesqLira.Create(nil);
   FormPesqLira.ShowModal;
   FormPesqLira.Release;
end;

procedure TFormLaaia.btnGravarImpactoClick(Sender: TObject);
begin
   if VerificarImpactoGravado() then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO Laaia_Impactos' +
                       ' (lai_numAspecto, lai_codImpacto)' +
                       ' VALUES (' +
                       QuotedStr(edtNumAspectoImp.Text) + ',' +
                       IntToStr(dblImpactos.KeyValue) +
                       ')';
         Execute;
      end;

      AtualizarDadosAcessorios();
      TryFocus(dblImpactos);
   end;
end;

procedure TFormLaaia.btnExcluirImpactoClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM Laaia_Impactos' +
                       ' WHERE lai_codImpacto = ' + QuotedStr(cdsLaaiaImpactoslai_codImpacto.AsString) +
                       ' AND lai_numAspecto = ' + cdsLaaiaImpactoslai_numAspecto.AsString;
         Execute;
      end;

      Auditoria('LAAIA IMPACTOS',cdsLeisDescRequisito.AsString, 'E', '');
      AtualizarDadosAcessorios();
   end;
end;

procedure TFormLaaia.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormLaaia.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
   chkTodosProc.Checked      := True;
   dblProcessoImp.Enabled    := False;
end;

procedure TFormLaaia.btnInserirLeiClick(Sender: TObject);
begin
   if VerificarLeiGravada() then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO Laaia_Lei' +
                       ' (lir_identificacao, lai_numAspecto)' +
                       ' VALUES (' +
                       QuotedStr(edtIdentLei.Text) + ',' +
                       edtNumAspectoLei.Text +
                       ')';
         Execute;
      end;

      AtualizarDadosAcessorios();
      TryFocus(edtIdentLei);
   end;
end;

procedure TFormLaaia.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 4, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      edtAtividade.SetFocus;
      Botoes(False);
      CalcularGrauImpacto();
   end;
end;

procedure TFormLaaia.btnAnteriorClick(Sender: TObject);
begin
   cdsLaaia.Prior;
   PreencherCampos;
end;

procedure TFormLaaia.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormLaaia.btnExcelClick(Sender: TObject);
begin
   with cdsExcel do begin
      Active:= False;
      Active:= True;
   end;

   if cdsExcel.RecordCount <= 0 then begin
      Application.MessageBox('Não existem registros para exportar', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      ExpExcel(dbgExcel, cdsExcel, 'L.A.A.I.A.', Self);
   end;
end;

procedure TFormLaaia.btnExcluirClick(Sender: TObject);
var
   sLaaia: string;
begin
   if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sLaaia:= edtAtividade.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM Laaia' +
                          ' WHERE lai_numAspecto = ' + QuotedStr(edtNumero.Text);
            Execute;
         end;

         Auditoria('LAAIA',sLaaia,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormLaaia.btnExcluirLeiClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM Laaia_Lei' +
                       ' WHERE lir_identificacao = ' + QuotedStr(cdsLeislir_identificacao.AsString) +
                       ' AND lai_numAspecto = ' + cdsLeislai_numAspecto.AsString;
         Execute;
      end;

      Auditoria('LAAIA LEIS',cdsLeisDescRequisito.AsString, 'E', '');
      AtualizarDadosAcessorios();
   end;
end;

procedure TFormLaaia.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO Laaia (' +
                             ' LAI_NUMASPECTO, LAI_ATIVIDADE, LAI_ASPECTO, LAI_CONDICAO, ' +
                             ' LAI_PROCESSO, LAI_FREQUENCIA, LAI_GRAVIDADE, LAI_CONTROLE, LAI_PMC, ' +
                             ' LAI_ATUALIZACAO, LAI_APROVADO' + //, LAI_EFICAZ' +
                             ' )' +
                             ' VALUES(' +
                             QuotedStr(edtNumero.Text) + ',' +
                             QuotedStr(edtAtividade.Text) + ',' +
                             QuotedStr(dblAspectos.KeyValue) + ',' +
//                             QuotedStr(dblImpactos.KeyValue) + ',' +
                             QuotedStr(dblCondicao.KeyValue) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             QuotedStr(edtProb.Text) + ',' +
                             QuotedStr(edtGravidade.Text) + ',' +
                             QuotedStr(edtControle.Text) + ',' +
                             QuotedStr(edtPMC.Text) + ',' +
                             ArrumaDataSQL(dtAtualizacao.Date) + ',' +
                             QuotedStr(edtAprovado.Text) +
//                             QuotedStr(dblEficaz.KeyValue) +
                             ')';
            end
            else begin
               CommandText:= ' UPDATE Laaia SET' +
                             ' LAI_ATIVIDADE = ' + QuotedStr(edtAtividade.Text) + ',' +
                             ' LAI_ASPECTO = ' + QuotedStr(dblAspectos.KeyValue) + ',' +
//                             ' LAI_IMPACTO = ' + QuotedStr(dblImpactos.KeyValue) + ',' +
                             ' LAI_CONDICAO = ' + QuotedStr(dblCondicao.KeyValue) + ',' +
                             ' LAI_PROCESSO = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' LAI_FREQUENCIA = ' + QuotedStr(edtProb.Text) + ',' +
                             ' LAI_GRAVIDADE = ' + QuotedStr(edtGravidade.Text) + ',' +
                             ' LAI_CONTROLE = ' + QuotedStr(edtControle.Text) + ',' +
                             ' LAI_PMC = ' + QuotedStr(edtPMC.Text) + ',' +
                             ' LAI_ATUALIZACAO = ' + ArrumaDataSQL(dtAtualizacao.Date) + ',' +
                             ' LAI_APROVADO = ' + QuotedStr(edtAprovado.Text) +
//                             ' LAI_EFICAZ = ' + QuotedStr(dblEficaz.KeyValue) +
                             ' WHERE LAI_NUMASPECTO = ' + QuotedStr(edtNumero.Text);
            end;
            Execute;
         end;

         Auditoria('LAAIA',edtAtividade.Text,cOperacao,'');
         AtualizarDados();
         AtualizarDadosAcessorios();

         HabilitarCampos(False, False);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormLaaia.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 4, 'cadastro') = 1) then begin
      LimparCampos;
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      CalcularGrauImpacto();
      edtAtividade.SetFocus;
      cOperacao:= 'I';
   end;
end;

procedure TFormLaaia.btnPrimeiroClick(Sender: TObject);
begin
   cdsLaaia.First;
   PreencherCampos;
end;

procedure TFormLaaia.btnProximoClick(Sender: TObject);
begin
   cdsLaaia.Next;
   PreencherCampos;
end;

procedure TFormLaaia.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormLaaia.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormLaaia.btnUltimoClick(Sender: TObject);
begin
   cdsLaaia.Last;
   PreencherCampos;
end;

procedure TFormLaaia.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormLaaia.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(LAI_NUMASPECTO) AS NovoCodigo FROM Laaia';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtNumero.Text:= '1';
      end
      else begin
         edtNumero.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormLaaia.CalcularGrauImpacto;
begin
   edtGrau.Value:= edtProb.Value * edtGravidade.Value;

   if edtGrau.Value <= 9 then begin
      lblSignificativo.Caption:= 'NÃO';
//      if cOperacao <> #0 then begin
//         edtControle.Enabled:= False;
//         btnPMC.Enabled     := True;
//      end;
   end
   else begin
      lblSignificativo.Caption:= 'SIM';
//      if cOperacao <> #0 then begin
//         edtControle.Enabled:= True;
//         btnPMC.Enabled     := False;
//      end;
   end;
end;

procedure TFormLaaia.CalcularImpacto;
begin
   if dblCondicao.KeyValue <> Null then begin
      if (dblCondicao.KeyValue = 1) or (dblCondicao.KeyValue = 2) then begin
      // Normal ou Anormal
         lblProb.Caption:= 'FREQUÊNCIA';
         lblImp.Caption := 'REAL';
      end;
      if (dblCondicao.KeyValue = 3) then begin
      // Emergencial
         lblProb.Caption:= 'PROBABILIDADE';
         lblImp.Caption := 'POTENCIAL';
      end;
   end
   else begin
      lblProb.Caption:= '';
      lblImp.Caption := '';
   end;
end;

procedure TFormLaaia.cdsExcelCalcFields(DataSet: TDataSet);
begin
//   if (cdsExcel.FieldByName('lai_condicao').AsInteger = 1) OR (cdsExcel.FieldByName('lai_condicao').AsInteger = 2) then begin
//      cdsExcelDescProbabilidade.AsString:= 'FREQUÊNCIA';
//      cdsExcelDescReal.AsString         := 'REAL';
//   end;
//   if cdsExcellai_condicao.AsInteger = 3 then begin
//      cdsExcelDescProbabilidade.AsString:= 'PROBABILIDADE';
//      cdsExcelDescReal.AsString         := 'POTENCIAL';
//   end;
//   cdsExcelGrauImpacto.AsInteger:= cdsExcellai_frequencia.AsInteger * cdsExcellai_gravidade.AsInteger;
//
//   if cdsExcelGrauImpacto.AsInteger <= 9 then begin
//      cdsExcelSignificativo.AsString:= 'NÃO';
//   end
//   else begin
//      cdsExcelSignificativo.AsString:= 'SIM';
//   end;
end;

procedure TFormLaaia.cdsImprimirCalcFields(DataSet: TDataSet);
begin
   if (cdsImprimirlai_condicao.AsInteger = 1) OR (cdsImprimirlai_condicao.AsInteger = 2) then begin
      cdsImprimirDescProbabilidade.AsString:= 'FREQUÊNCIA';
      cdsImprimirDescReal.AsString         := 'REAL';
   end;
   if cdsImprimirlai_condicao.AsInteger = 3 then begin
      cdsImprimirDescProbabilidade.AsString:= 'PROBABILIDADE';
      cdsImprimirDescReal.AsString         := 'POTENCIAL';
   end;

   cdsImprimirGrauImpacto.AsInteger:= cdsImprimirlai_frequencia.AsInteger * cdsImprimirlai_gravidade.AsInteger;

   if cdsImprimirGrauImpacto.AsInteger <= 9 then begin
      cdsImprimirSignificativo.AsString:= 'NÃO';
   end
   else begin
      cdsImprimirSignificativo.AsString:= 'SIM';
   end;
end;

procedure TFormLaaia.chkTodosProcClick(Sender: TObject);
begin
   dblProcessoImp.Enabled:= not chkTodosProc.Checked;
end;

procedure TFormLaaia.ControlarAbas;
begin
   if pctLaaia.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
//      cdsLaaia.Filtered:= False;
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;
      btnExcel.Enabled   := False;

      edtNumAspectoImp.Text:= edtNumero.Text;
      edtAtividadeImp.Text := edtAtividade.Text;

      if pctLaaia.TabIndex = 3 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;

//   edtValor.Clear;
//   TryFocus(edtValor);
end;

procedure TFormLaaia.dbgLaaiaCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormLaaia.dbgLaaiaDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctLaaia.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormLaaia.dbgLaaiaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormLaaia.dblCondicaoCloseUp(Sender: TObject);
begin
   CalcularImpacto();
end;

procedure TFormLaaia.dblCondicaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   CalcularImpacto();
end;

procedure TFormLaaia.edtGravidadeChange(Sender: TObject);
begin
   CalcularGrauImpacto();
end;

procedure TFormLaaia.edtGravidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if not(Key in ['1','3','9',#8,#13])  then begin
      Key:= #0;
   end;
end;

procedure TFormLaaia.edtIdentLeiExit(Sender: TObject);
begin
   // Busca a descrição da lei
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT lir_descricao' +
                    ' FROM Lira' +
                    ' WHERE lir_identificacao = ' + QuotedStr(AllTrim(edtIdentLei.Text));
      Active:= True;

      edtDescLei.Text:= FieldByName('lir_descricao').AsString;
   end;
end;

procedure TFormLaaia.edtProbChange(Sender: TObject);
begin
   CalcularGrauImpacto();
end;

procedure TFormLaaia.edtProbKeyPress(Sender: TObject; var Key: Char);
begin
   if not(Key in ['1','3','9',#8,#13])  then begin
      Key:= #0;
   end;
end;

procedure TFormLaaia.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsLaaia.Locate('LAI_ATIVIDADE', edtValor.Text, [loPartialKey]);
//      0: cdsLaaia.Filter:= 'LAI_ATIVIDADE LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

//   cdsLaaia.Filtered:= True;
end;

procedure TFormLaaia.FormShow(Sender: TObject);
begin
   pctLaaia.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   AtualizarDadosAcessorios();
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;

   edtProb.Hint:= 'Valores possíveis: ' + #13 +
                  '1, 3 ou 9';
   edtGravidade.Hint:= 'Valores possíveis: ' + #13 +
                       '1, 3 ou 9';
end;

procedure TFormLaaia.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtNumero.Enabled    := False;
   edtAtividade.Enabled := Flag;
   dblAspectos.Enabled  := Flag;
//   dblImpactos.Enabled  := Flag;
   dblCondicao.Enabled  := Flag;
   dblProcesso.Enabled  := Flag;
   edtProb.Enabled      := Flag;
   edtGravidade.Enabled := Flag;
   edtGrau.Enabled      := False;
   edtControle.Enabled  := Flag;
   dtAtualizacao.Enabled:= Flag;
   edtAprovado.Enabled  := Flag;
   dblEficaz.Enabled    := Flag;

   btnPMC.Enabled       := Flag;

   pctLaaia.Pages[1].TabVisible:= not Flag;
end;

procedure TFormLaaia.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Identificação
      sCampoOrdem:= 'lai_numAspecto'
   end
   else begin // Descrição do Requisito
      sCampoOrdem:= 'lai_atividade'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT IA.imp_descricao, L.lai_numAspecto, lai_atividade, ' +
                    ' lai_aspecto, lai_impacto, lai_condicao, lai_processo, lai_frequencia,' +
                    ' lai_gravidade, lai_controle, lai_atualizacao, lai_aprovado, lai_eficaz, nome_pro' +
                    ' FROM Laaia L' +
                    ' LEFT JOIN laaia_impactos I ON I.lai_numaspecto = L.lai_numAspecto' +
                    ' LEFT JOIN impactos_ambientais IA ON IA.imp_codigo = I.lai_codimpacto' +
                    ' INNER JOIN Processos P ON P.codi_pro = L.lai_processo';
      if chkTodosProc.Checked = False then begin
         CommandText:= CommandText + ' WHERE lai_processo = ' + IntToStr(dblProcessoImp.KeyValue);
      end;

      CommandText:= CommandText + ' ORDER BY nome_pro, ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_laaia.fr3');
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

procedure TFormLaaia.LimparCampos;
begin
   edtNumero.Clear;
   edtAtividade.Clear;
   dblAspectos.KeyValue:= -1;
//   dblImpactos.KeyValue:= -1;
   dblCondicao.KeyValue:= -1;
   dblProcesso.KeyValue:= -1;
   edtProb.Clear;
   edtGravidade.Clear;
   edtGrau.Clear;
   edtControle.Clear;
   edtPMC.Clear;
   dtAtualizacao.Clear;
   edtAprovado.Clear;
   dblProcesso.KeyValue:= 1;

   lblProb.Caption          := '';
   lblImp.Caption           := '';
   lblSignificativo.Caption := '';

   cOperacao:= #0;
end;

procedure TFormLaaia.pctLaaiaChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormLaaia.PreencherCampos;
begin
   with cdsLaaia do begin
      edtNumero.Text    := FieldByName('LAI_NUMASPECTO').AsString;
      edtAtividade.Text := FieldByName('LAI_ATIVIDADE').AsString;
      edtProb.Value     := FieldByName('LAI_FREQUENCIA').AsInteger;
      edtGravidade.Value:= FieldByName('LAI_GRAVIDADE').AsInteger;
      edtControle.Text  := FieldByName('LAI_CONTROLE').AsString;
      edtPMC.Text       := FieldByName('LAI_PMC').AsString;
      dtAtualizacao.Date:= FieldByName('LAI_ATUALIZACAO').AsDateTime;
      edtAprovado.Text  := FieldByName('LAI_APROVADO').AsString;

      if FieldByName('LAI_ASPECTO').AsString <> EmptyStr then begin
         dblAspectos.KeyValue:= FieldByName('LAI_ASPECTO').AsString;
      end;
//      if FieldByName('LAI_IMPACTO').AsString <> EmptyStr then begin
//         dblImpactos.KeyValue:= FieldByName('LAI_IMPACTO').AsString;
//      end;
      if FieldByName('LAI_CONDICAO').AsString <> EmptyStr then begin
         dblCondicao.KeyValue:= FieldByName('LAI_CONDICAO').AsString;
         CalcularImpacto();
      end;
      if FieldByName('LAI_PROCESSO').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('LAI_PROCESSO').AsString;
      end;
      if FieldByName('LAI_EFICAZ').AsString <> EmptyStr then begin
         dblEficaz.KeyValue:= FieldByName('LAI_EFICAZ').AsString;
      end;

      // Aba Impactos Ambientais e aba Leis
      if (pctLaaia.TabIndex = 1) or (pctLaaia.TabIndex = 2) then begin
         AtualizarDadosAcessorios();
      end;

   end;
end;

procedure TFormLaaia.tsLeisShow(Sender: TObject);
begin
   AtualizarDadosAcessorios();
end;

function TFormLaaia.ValidarDados(): Boolean;
begin
   if AllTrim(edtAtividade.Text) = EmptyStr then begin
      Application.MessageBox('Campo Atividades, Produtos ou Serviços é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtAtividade);
      Result:= False;
      Exit;
   end;
   if dblAspectos.KeyValue = -1 then begin
      Application.MessageBox('Campo Aspectos Ambientais é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblAspectos);
      Result:= False;
      Exit;
   end;
//   if dblImpactos.KeyValue = -1 then begin
//      Application.MessageBox('Campo Impactos Ambientais é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
//      TryFocus(dblImpactos);
//      Result:= False;
//      Exit;
//   end;
   if dblCondicao.KeyValue = -1 then begin
      Application.MessageBox('Campo Condição de Operação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblCondicao);
      Result:= False;
      Exit;
   end;
   if dblProcesso.KeyValue = -1 then begin
      Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;


   Result:= True;
end;

function TFormLaaia.VerificarImpactoGravado: Boolean;
begin
   // Verifica campo em branco
   if (dblImpactos.KeyValue = -1) or (dblImpactos.KeyValue = null) then begin
      Application.MessageBox('Campo Impacto Ambiental é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblImpactos);
      Result:= False;
      Exit;
   end;

   // Verifica se a lei já foi gravada para o aspecto
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as QtdeGravada' +
                    ' FROM Laaia_Impactos' +
                    ' WHERE lai_codImpacto = ' + IntToStr(dblImpactos.KeyValue) +
                    ' AND lai_numAspecto = ' + edtNumAspectoLei.Text;
      Active:= True;

      if FieldByName('QtdeGravada').AsInteger > 0 then begin
         Application.MessageBox('Impacto já cadastrado para esse aspecto', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblImpactos);
         Result:= False;
      end
      else begin
         Result:= True;
      end;
   end;
end;

function TFormLaaia.VerificarLeiGravada: Boolean;
begin
   // Verifica campo em branco
   if AllTrim(edtIdentLei.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdentLei);
      Result:= False;
      Exit;
   end;

   // Verifica se existe a identificação digitada
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as QtdeIdentLei' +
                    ' FROM Lira' +
                    ' WHERE lir_identificacao = ' + QuotedStr(AllTrim(edtIdentLei.Text));
      Active:= True;

      if FieldByName('QtdeIdentLei').AsInteger = 0 then begin
         edtDescLei.Clear;
         Application.MessageBox('Lei não cadastrada, Verifique !', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtIdentLei);
         Result:= False;
         Exit;
      end;
   end;

   // Verifica se a lei já foi gravada para o aspecto
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as QtdeGravada' +
                    ' FROM Laaia_Lei' +
                    ' WHERE lir_identificacao = ' + QuotedStr(AllTrim(edtIdentLei.Text)) +
                    ' AND lai_numAspecto = ' + edtNumAspectoLei.Text;
      Active:= True;

      if FieldByName('QtdeGravada').AsInteger > 0 then begin
         Application.MessageBox('Lei já cadastrada para esse aspecto', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtIdentLei);
         Result:= False;
      end
      else begin
         Result:= True;
      end;
   end;
end;

end.
