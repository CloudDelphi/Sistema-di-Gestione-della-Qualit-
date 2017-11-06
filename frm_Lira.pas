unit frm_Lira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI;

type
  TFormLira = class(TForm)
    pctLira: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    dblAmbito: TDBLookupComboBox;
    edtIdentificação: TEdit;
    edtDescricao: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgClientes: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    lbl11: TLabel;
    edtTema: TEdit;
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
    lbl20: TLabel;
    lbl21: TLabel;
    edtDocumento: TEdit;
    zqryAmbito: TZQuery;
    dspAmbito: TDataSetProvider;
    cdsAmbito: TClientDataSet;
    dsAmbito: TDataSource;
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
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dtVerificacao: TDateEdit;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryLira: TZQuery;
    dspLira: TDataSetProvider;
    cdsLira: TClientDataSet;
    dsLira: TDataSource;
    mmoSumario: TMemo;
    lbl8: TLabel;
    lbl3: TLabel;
    mmoEvidencia: TMemo;
    lbl6: TLabel;
    lbl14: TLabel;
    lbl7: TLabel;
    edtResponsavel: TEdit;
    cdsAmbitocodi_com: TLargeintField;
    cdsAmbitovalo_com: TWideStringField;
    dblFreq: TDBLookupComboBox;
    zqryFreq: TZQuery;
    dspFreq: TDataSetProvider;
    cdsFreq: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsFreq: TDataSource;
    edtOrgao: TEdit;
    dblAlteracao: TDBLookupComboBox;
    zqryAlteracao: TZQuery;
    dspAlteracao: TDataSetProvider;
    cdsAlteracao: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsAlteracao: TDataSource;
    frxReport1: TfrxReport;
    frxDBDSLira: TfrxDBDataset;
    cdsImprimirDescAmbito: TStringField;
    cdsImprimirDescAlteracao: TStringField;
    cdsImprimirDescFreq: TStringField;
    lbl12: TLabel;
    dblFreqEvid: TDBLookupComboBox;
    dtVerificacaoEvid: TDateEdit;
    lbl13: TLabel;
    lbl15: TLabel;
    dblAlteracaoEvid: TDBLookupComboBox;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    zqryFreqEvid: TZQuery;
    dspFreqEvid: TDataSetProvider;
    cdsFreqEvid: TClientDataSet;
    LargeintField3: TLargeintField;
    WideStringField3: TWideStringField;
    dsFreqEvid: TDataSource;
    zqryAlteracaoEvid: TZQuery;
    dspAlteracaoEvid: TDataSetProvider;
    cdsAlteracaoEvid: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsAlteracaoEvid: TDataSource;
    opd1: TOpenDialog;
    cdsImpactosimp_codigo: TLargeintField;
    cdsImpactosimp_descricao: TWideStringField;
    cdsLiralir_codigo: TLargeintField;
    cdsLiralir_identificacao: TWideStringField;
    cdsLiralir_descricao: TWideStringField;
    cdsLiralir_ambito: TWideStringField;
    cdsLiralir_tema: TWideStringField;
    cdsLiralir_orgao: TWideStringField;
    cdsLiralir_sumario: TWideMemoField;
    cdsLiralir_evidencia: TWideMemoField;
    cdsLiralir_documento: TWideMemoField;
    cdsLiralir_avaliacao: TLargeintField;
    cdsLiralir_dataverificacao: TDateField;
    cdsLiralir_alterada: TLargeintField;
    cdsLiralir_responsavel: TWideStringField;
    cdsLiralir_avaliacaoevid: TLargeintField;
    cdsLiralir_dataverificacaoevid: TDateField;
    cdsLiralir_alteradaevid: TLargeintField;
    cdsImprimirlir_identificacao: TWideStringField;
    cdsImprimirlir_descricao: TWideStringField;
    cdsImprimirlir_ambito: TWideStringField;
    cdsImprimirlir_tema: TWideStringField;
    cdsImprimirlir_orgao: TWideStringField;
    cdsImprimirlir_sumario: TWideMemoField;
    cdsImprimirlir_evidencia: TWideMemoField;
    cdsImprimirlir_documento: TWideMemoField;
    cdsImprimirlir_avaliacao: TLargeintField;
    cdsImprimirlir_dataverificacao: TDateField;
    cdsImprimirlir_alterada: TLargeintField;
    cdsImprimirlir_responsavel: TWideStringField;
    btnSairImp: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure BuscarNovoCodigo;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgClientesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctLiraChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure mmoSumarioKeyPress(Sender: TObject; var Key: Char);
    procedure mmoEvidenciaKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoSumarioExit(Sender: TObject);
    procedure mmoEvidenciaExit(Sender: TObject);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure sbLimpar1Click(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormLira: TFormLira;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormLira.AtualizarDados;
begin
   with cdsProcessos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsAmbito do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 12' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsFreq do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 13' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsAlteracao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsFreqEvid do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 13' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsAlteracaoEvid do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
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

   with cdsLira do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(cdsLiralir_codigo.AsString) <> EmptyStr then begin
      cdsLira.Locate('LIR_CODIGO',cdsLiralir_codigo.AsString,[])
   end;
end;

procedure TFormLira.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsLira.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormLira.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormLira.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 4, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtDescricao);
      Botoes(False);
   end;
end;

procedure TFormLira.btnAnteriorClick(Sender: TObject);
begin
   cdsLira.Prior;
   PreencherCampos;
end;

procedure TFormLira.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormLira.btnExcluirClick(Sender: TObject);
var
   sLira: string;
begin
   if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sLira:= cdsLiralir_codigo.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM Lira' +
                          ' WHERE lir_codigo = ' + sLira;
            Execute;
         end;

         Auditoria('LIRA',sLira,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormLira.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO Lira (' +
                             ' LIR_CODIGO, LIR_IDENTIFICACAO, LIR_DESCRICAO, LIR_AMBITO, LIR_TEMA,  ' +
                             ' LIR_ORGAO, LIR_SUMARIO, LIR_EVIDENCIA, LIR_DOCUMENTO, ' +
                             ' LIR_AVALIACAO, LIR_DATAVERIFICACAO, LIR_ALTERADA, ' +
                             ' LIR_AVALIACAOEVID, LIR_DATAVERIFICACAOEVID, LIR_ALTERADAEVID, LIR_RESPONSAVEL' +
                             ' )' +
                             ' VALUES(' +
                             sNovoCodigo + ',' +
                             QuotedStr(edtIdentificação.Text) + ',' +
                             QuotedStr(edtDescricao.Text) + ',' +
                             QuotedStr(dblAmbito.KeyValue) + ',' +
                             QuotedStr(edtTema.Text) + ',' +
                             QuotedStr(edtOrgao.Text) + ',' +
                             QuotedStr(mmoSumario.Text) + ',' +
                             QuotedStr(mmoEvidencia.Text) + ',' +
                             QuotedStr(edtDocumento.Text) + ',' +
                             QuotedStr(dblFreq.KeyValue) + ',' +
                             ArrumaDataSQL(dtVerificacao.Date) + ',' +
                             QuotedStr(dblAlteracao.KeyValue) + ',' +
                             QuotedStr(dblFreqEvid.KeyValue) + ',' +
                             ArrumaDataSQL(dtVerificacaoEvid.Date) + ',' +
                             QuotedStr(dblAlteracaoEvid.KeyValue) + ',' +
                             QuotedStr(edtResponsavel.Text) +
                             ')';
            end
            else begin
               CommandText:= ' UPDATE Lira SET' +
                             ' LIR_IDENTIFICACAO = ' + QuotedStr(edtIdentificação.Text) + ',' +
                             ' LIR_DESCRICAO = ' + QuotedStr(edtDescricao.Text) + ',' +
                             ' LIR_AMBITO = ' + QuotedStr(dblAmbito.KeyValue) + ',' +
                             ' LIR_TEMA = ' + QuotedStr(edtTema.Text) + ',' +
                             ' LIR_ORGAO = ' + QuotedStr(edtOrgao.Text) + ',' +
                             ' LIR_SUMARIO = ' + QuotedStr(mmoSumario.Text) + ',' +
                             ' LIR_EVIDENCIA = ' + QuotedStr(mmoEvidencia.Text) + ',' +
                             ' LIR_DOCUMENTO = ' + QuotedStr(edtDocumento.Text) + ',' +
                             ' LIR_AVALIACAO = ' + QuotedStr(dblFreq.KeyValue) + ',' +
                             ' LIR_DATAVERIFICACAO = ' + ArrumaDataSQL(dtVerificacao.Date) + ',' +
                             ' LIR_ALTERADA = ' + QuotedStr(dblAlteracao.KeyValue) + ',' +
                             ' LIR_AVALIACAOEVID = ' + QuotedStr(dblFreqEvid.KeyValue) + ',' +
                             ' LIR_DATAVERIFICACAOEVID = ' + ArrumaDataSQL(dtVerificacaoEvid.Date) + ',' +
                             ' LIR_ALTERADAEVID = ' + QuotedStr(dblAlteracaoEvid.KeyValue) + ',' +
                             ' LIR_RESPONSAVEL = ' + QuotedStr(edtResponsavel.Text) +
                             ' WHERE LIR_CODIGO = ' + cdsLiralir_codigo.Asstring;
            end;
            Execute;
         end;

         Auditoria('LIRA',edtIdentificação.Text + edtDescricao.Text,cOperacao,'');
         AtualizarDados();

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

procedure TFormLira.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormLira.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
end;

procedure TFormLira.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 4, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      TryFocus(edtIdentificação);
   end;
end;

procedure TFormLira.btnPrimeiroClick(Sender: TObject);
begin
   cdsLira.First;
   PreencherCampos;
end;

procedure TFormLira.btnProximoClick(Sender: TObject);
begin
   cdsLira.Next;
   PreencherCampos;
end;

procedure TFormLira.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormLira.btnUltimoClick(Sender: TObject);
begin
   cdsLira.Last;
   PreencherCampos;
end;

procedure TFormLira.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormLira.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(LIR_CODIGO) AS NovoCodigo FROM Lira';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormLira.ControlarAbas;
begin
   if pctLira.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
//      cdsLaaia.Filtered:= False;
   end
   else begin // Pesquisa
      btnNovo.Enabled:= False;
      btnGravar.Enabled:= False;
      btnExcluir.Enabled:= False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled:= False;

      if pctLira.TabIndex = 2 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;

//   edtValor.Clear;
//   TryFocus(edtValor);
end;

procedure TFormLira.dbgClientesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormLira.dbgClientesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctLira.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormLira.dbgClientesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormLira.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsLira.Locate('LIR_IDENTIFICACAO', edtValor.Text, [loPartialKey]);
      1: cdsLira.Locate('LIR_DESCRICAO', edtValor.Text, [loPartialKey]);
//      0: cdsLaaia.Filter:= 'LAI_ATIVIDADE LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

//   cdsLaaia.Filtered:= True;
end;

procedure TFormLira.FormShow(Sender: TObject);
begin
   pctLira.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
end;

procedure TFormLira.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtIdentificação.Enabled := Codigo;
   edtDescricao.Enabled     := Flag;
   dblAmbito.Enabled        := Flag;
   edtTema.Enabled          := Flag;
   edtOrgao.Enabled         := Flag;
   mmoSumario.Enabled       := Flag;
   mmoEvidencia.Enabled     := Flag;
//   edtDocumento.Enabled     := Flag;
   dblFreq.Enabled          := Flag;
   dtVerificacao.Enabled    := Flag;
   dblAlteracao.Enabled     := Flag;
   dblFreqEvid.Enabled      := Flag;
   dtVerificacaoEvid.Enabled:= Flag;
   dblAlteracaoEvid.Enabled := Flag;
   edtResponsavel.Enabled   := Flag;

   sbArquivo.Enabled:= Flag;

   if AllTrim(edtDocumento.Text) <> EmptyStr then begin
      sbVisualizar.Enabled:= True;
   end
   else begin
      sbVisualizar.Enabled:= False;
   end;

   pctLira.Pages[1].TabVisible:= not Flag;
end;

procedure TFormLira.LimparCampos;
begin
   edtIdentificação.Clear;
   edtDescricao.Clear;
   dblAmbito.KeyValue:= -1;
   edtTema.Clear;
   edtOrgao.Clear;
   mmoSumario.Clear;
   mmoEvidencia.Clear;
   edtDocumento.Clear;
   dblFreq.KeyValue:= -1;
   dtVerificacao.Clear;
   dblAlteracao.KeyValue:= 2; // NÃO
   edtResponsavel.Clear;
   dblFreqEvid.KeyValue:= -1;
   dtVerificacaoEvid.Clear;
   dblAlteracaoEvid.KeyValue:= 2; // NÃO
end;

procedure TFormLira.mmoEvidenciaExit(Sender: TObject);
begin
   mmoEvidencia.Text:= AcertaUpper(mmoEvidencia.Text);
end;

procedure TFormLira.mmoEvidenciaKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormLira.mmoSumarioExit(Sender: TObject);
begin
   mmoSumario.Text:= AcertaUpper(mmoSumario.Text);
end;

procedure TFormLira.mmoSumarioKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormLira.pctLiraChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormLira.PreencherCampos;
begin
   with cdsLira do begin
      edtIdentificação.Text := FieldByName('LIR_IDENTIFICACAO').AsString;
      edtDescricao.Text     := FieldByName('LIR_DESCRICAO').AsString;
      edtTema.Text          := FieldByName('LIR_TEMA').AsString;
      edtOrgao.Text         := FieldByName('LIR_ORGAO').AsString;
      mmoSumario.Text       := FieldByName('LIR_SUMARIO').AsString;
      mmoEvidencia.Text     := FieldByName('LIR_EVIDENCIA').AsString;
      edtDocumento.Text     := FieldByName('LIR_DOCUMENTO').AsString;
      dtVerificacao.Text    := FieldByName('LIR_DATAVERIFICACAO').AsString;
      dtVerificacaoEvid.Text:= FieldByName('LIR_DATAVERIFICACAOEVID').AsString;
      edtResponsavel.Text   := FieldByName('LIR_RESPONSAVEL').AsString;

      if FieldByName('LIR_AMBITO').AsString <> EmptyStr then begin
         dblAmbito.KeyValue:= FieldByName('LIR_AMBITO').AsString;
      end;
      if FieldByName('LIR_AVALIACAO').AsString <> EmptyStr then begin
         dblFreq.KeyValue:= FieldByName('LIR_AVALIACAO').AsString;
      end;
      if FieldByName('LIR_ALTERADA').AsString <> EmptyStr then begin
         dblAlteracao.KeyValue:= FieldByName('LIR_ALTERADA').AsString;
      end;
      if FieldByName('LIR_AVALIACAOEVID').AsString <> EmptyStr then begin
         dblFreqEvid.KeyValue:= FieldByName('LIR_AVALIACAOEVID').AsString;
      end;
      if FieldByName('LIR_ALTERADAEVID').AsString <> EmptyStr then begin
         dblAlteracaoEvid.KeyValue:= FieldByName('LIR_ALTERADAEVID').AsString;
      end;
   end;
end;

procedure TFormLira.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtDocumento.Text:= OPD1.FileName;
end;

procedure TFormLira.sbLimpar1Click(Sender: TObject);
begin
   edtDocumento.Clear;
   sbVisualizar.Enabled:= False;
end;

procedure TFormLira.sbVisualizarClick(Sender: TObject);
begin
   try
//      if not FileExists(edtDocumento.Text) then begin
//         Application.MessageBox('O documento não foi encontrado na pasta especificada', 'Aviso', MB_OK + MB_ICONWARNING);
//         Exit;
//      end;
//
//      ShellExecute(Application.Handle, nil, PChar(edtDocumento.Text), nil, nil, SW_SHOWMAXIMIZED);

      AbrirArquivo(edtDocumento.text, Self.Name);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

function TFormLira.ValidarDados(): Boolean;
begin
   if AllTrim(edtIdentificação.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdentificação);
      Result:= False;
      Exit;
   end;
   if AllTrim(edtDescricao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Descrição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtDescricao);
      Result:= False;
      Exit;
   end;
   if dblAmbito.KeyValue = -1 then begin
      Application.MessageBox('Campo Âmbito é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblAmbito);
      Result:= False;
      Exit;
   end;
   if dblFreq.KeyValue = -1 then begin
      Application.MessageBox('Campo Frequência de Avaliação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblFreq);
      Result:= False;
      Exit;
   end;
   if dblFreqEvid.KeyValue = -1 then begin
      Application.MessageBox('Campo Frequência de Avaliação de Evidência é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblFreqEvid);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormLira.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Identificação
      sCampoOrdem:= 'lir_identificacao'
   end
   else begin // Descrição do Requisito
      sCampoOrdem:= 'lir_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT lir_identificacao, lir_descricao, lir_ambito, lir_tema, lir_orgao,' +
                    ' lir_sumario, lir_evidencia, lir_documento, lir_avaliacao, lir_dataVerificacao, ' +
                    ' lir_alterada, lir_responsavel' +
                    ' FROM lira' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_lira.fr3');
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
