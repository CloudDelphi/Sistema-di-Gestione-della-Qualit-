unit frm_CadTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadTreinamentos = class(TForm)
    pctTreinamentos: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtTreinamento: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSTreinamentos: TfrxDBDataset;
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
    zqryAuxiliar: TZQuery;
    dspAuxiliar: TDataSetProvider;
    cdsAuxiliar: TClientDataSet;
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
    cdsImprimircodi_tre: TLargeintField;
    cdsImprimirdesc_tre: TWideStringField;
    lbl16: TLabel;
    mmoConteudo: TMemo;
    cdsImprimirtre_conteudo: TWideMemoField;
    grp1: TGroupBox;
    chkConteudo: TCheckBox;
    lbl19: TLabel;
    dblStatus: TDBLookupComboBox;
    zqryStatus: TZQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    lrgntfld1: TLargeintField;
    WideStringField1: TWideStringField;
    dsStatus: TDataSource;
    cdsImprimirtre_status: TIntegerField;
    cdsImprimirstatus: TWideStringField;
    chkEficacia: TCheckBox;
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
    procedure dbgTreinamentosCellClick(Column: TColumn);
    procedure dbgTreinamentosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctTreinamentosChange(Sender: TObject);
    procedure mmoConteudoKeyPress(Sender: TObject; var Key: Char);
    procedure mmoConteudoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadTreinamentos: TFormCadTreinamentos;

implementation

uses
  Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadTreinamentos.AtualizarDados;
begin
   with cdsStatus do begin
      Active := False;
      CommandText := ' SELECT codi_com, valo_com FROM tabela_combos' +
                     ' WHERE tipo_com = 15' +
                     ' ORDER BY orde_com';
      Active := True;
   end;

   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT codi_tre, desc_tre, tre_conteudo, tre_status,' +
                    ' tre_eficacia' +
                    ' FROM treinamentos' +
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsTreinamentos.Locate('codi_tre', edtCodigo.Text, [])
   end;
end;

procedure TFormCadTreinamentos.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled := not Flag;
   btnCancelar.Enabled := not Flag;
   btnImprimir.Enabled := Flag;

   if cdsTreinamentos.RecordCount = 0 then begin
      btnAlterar.Enabled := False;
      btnExcluir.Enabled := False;
   end;
end;

procedure TFormCadTreinamentos.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 3, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao := 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtTreinamento);
   Botoes(False);
end;

procedure TFormCadTreinamentos.btnAnteriorClick(Sender: TObject);
begin
  cdsTreinamentos.Prior;
  PreencherCampos;
end;

procedure TFormCadTreinamentos.btnCancelarClick(Sender: TObject);
begin
  LimparCampos(Self);
  PreencherCampos;
  Botoes(True);
  HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadTreinamentos.btnExcluirClick(Sender: TObject);
var
  sTreinamento: string;
begin
  if (Acesso(cUsuario, 3, 'exclusao') = 1) then
  begin
    if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      sTreinamento := edtTreinamento.Text;

      with cdsGravar do
      begin
        Active := False;
        CommandText := ' DELETE FROM treinamentos' + ' WHERE codi_tre = ' + QuotedStr(edtCodigo.Text);
        Execute;
      end;

      Auditoria('TREINAMENTOS', sTreinamento, 'E', '');
      LimparCampos(Self);
      AtualizarDados;
      PreencherCampos;
    end;
    Botoes(True);
  end;
end;

procedure TFormCadTreinamentos.btnGravarClick(Sender: TObject);
begin
  try
    with cdsGravar do
    begin
      Active := False;
      if cOperacao = 'I' then
      begin
        CommandText := ' INSERT INTO treinamentos (' + ' codi_tre, desc_tre, tre_conteudo, tre_status, tre_eficacia)' + ' VALUES(' + QuotedStr(edtCodigo.Text) + ',' + QuotedStr(edtTreinamento.Text) + ',' + QuotedStr(mmoConteudo.Text) + ',' + IntToStr(dblStatus.KeyValue) + ',' + LogicoParaString(chkEficacia.Checked) + ');';
      end
      else
      begin
        CommandText := ' UPDATE treinamentos SET' + ' desc_tre = ' + QuotedStr(edtTreinamento.Text) + ',' + ' tre_conteudo = ' + QuotedStr(mmoConteudo.Text) + ',' + ' tre_status = ' + IntToStr(dblStatus.KeyValue) + ',' + ' tre_eficacia = ' + LogicoParaString(chkEficacia.Checked) + ' WHERE codi_tre = ' + QuotedStr(edtCodigo.Text);
      end;
      Execute;
    end;

    Auditoria('TREINAMENTOS', edtTreinamento.Text, cOperacao, '');
    AtualizarDados;

    HabilitarCampos(False, False, Self, 1);
    Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message), 'Erro', MB_OK + MB_ICONERROR);
    end;
  end;

  Botoes(True);
  TryFocus(btnNovo);
end;

procedure TFormCadTreinamentos.btnImpressoraClick(Sender: TObject);
begin
  Impressao('I');
end;

procedure TFormCadTreinamentos.btnImprimirClick(Sender: TObject);
begin
  pnlImprimir.Top := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
  pnlImprimir.Left := Self.Width div 2 - pnlImprimir.Width div 2;
  pnlImprimir.Visible := True;

  rgOrdemImpressao.ItemIndex := 1;
end;

procedure TFormCadTreinamentos.btnNovoClick(Sender: TObject);
begin
  if not (Acesso(cUsuario, 3, 'cadastro') = 1) then
  begin
    Exit;
  end;

  cOperacao := 'I';
  LimparCampos(Self);
  HabilitarCampos(True, True, Self, 1);
  Botoes(False);
  btnExcluir.Enabled := False;
  btnAlterar.Enabled := False;
  dblStatus.KeyValue := 1;
  edtCodigo.Text := BuscarNovoCodigo('treinamentos', 'codi_tre');
  TryFocus(edtTreinamento);
end;

procedure TFormCadTreinamentos.btnPrimeiroClick(Sender: TObject);
begin
  cdsTreinamentos.First;
  PreencherCampos;
end;

procedure TFormCadTreinamentos.btnProximoClick(Sender: TObject);
begin
  cdsTreinamentos.Next;
  PreencherCampos;
end;

procedure TFormCadTreinamentos.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormCadTreinamentos.btnSairImpClick(Sender: TObject);
begin
  pnlImprimir.Visible := False;
end;

procedure TFormCadTreinamentos.btnUltimoClick(Sender: TObject);
begin
  cdsTreinamentos.Last;
  PreencherCampos;
end;

procedure TFormCadTreinamentos.btnVideoClick(Sender: TObject);
begin
  Impressao('V');
end;

procedure TFormCadTreinamentos.ControlarAbas;
begin
  if pctTreinamentos.TabIndex = 0 then
  begin  // Cadastro
    Botoes(True);
    PreencherCampos();
  end
  else
  begin // Pesquisa
    btnNovo.Enabled := False;
    btnGravar.Enabled := False;
    btnExcluir.Enabled := False;
    btnCancelar.Enabled := False;
    btnImprimir.Enabled := False;
    btnAlterar.Enabled := False;

//      if pctAspectos.TabIndex = 1 then begin
    edtValor.Clear;
    edtValor.SetFocus;
//      end;
  end;
end;

procedure TFormCadTreinamentos.dbgTreinamentosCellClick(Column: TColumn);
begin
  PreencherCampos;
end;

procedure TFormCadTreinamentos.dbgTreinamentosDblClick(Sender: TObject);
begin
  PreencherCampos;
  pctTreinamentos.TabIndex := 0;
  ControlarAbas;
end;

procedure TFormCadTreinamentos.edtValorChange(Sender: TObject);
begin
  case cbbCampo.ItemIndex of
    0:
      cdsTreinamentos.Locate('desc_tre', edtValor.Text, [loPartialKey]);
  end;
end;

procedure TFormCadTreinamentos.FormShow(Sender: TObject);
begin
  pctTreinamentos.TabIndex := 0;
  AtualizarDados;
  PreencherCampos;
  Botoes(True);
  HabilitarCampos(False, False, Self, 1);
  pnlImprimir.Visible := False;
  TryFocus(btnNovo);
  chkConteudo.Checked := False;
end;

procedure TFormCadTreinamentos.mmoConteudoExit(Sender: TObject);
begin
  TryFocus(btnGravar);
end;

procedure TFormCadTreinamentos.mmoConteudoKeyPress(Sender: TObject; var Key: Char);
begin
  Key := AcertaUpperLetra(Key);
end;

procedure TFormCadTreinamentos.pctTreinamentosChange(Sender: TObject);
begin
  ControlarAbas();
end;

procedure TFormCadTreinamentos.PreencherCampos;
begin
  with cdsTreinamentos do
  begin
    edtCodigo.Text := FieldByName('codi_tre').AsString;
    edtTreinamento.Text := FieldByName('desc_tre').AsString;
    mmoConteudo.Text := FieldByName('tre_conteudo').AsString;
    dblStatus.KeyValue := FieldByName('tre_status').AsInteger;
    chkEficacia.Checked := StringParaLogico(FieldByName('tre_eficacia').AsString);
  end;
end;

procedure TFormCadTreinamentos.Impressao(tipoImp: string);
var
  sCampoOrdem: string;
begin
  if rgOrdemImpressao.ItemIndex = 0 then
  begin // Código
    sCampoOrdem := 'codi_tre'
  end
  else
  begin // Alfabética
    sCampoOrdem := 'desc_tre'
  end;

  with cdsImprimir do
  begin
    Active := False;
    CommandText := ' SELECT codi_tre, desc_tre, tre_conteudo, tre_status, ' + ' TC.valo_com as Status' + ' FROM treinamentos' + ' INNER JOIN tabela_combos TC ON TC.tipo_com = 15 AND TC.codi_com = tre_status' + ' ORDER BY ' + sCampoOrdem;
    Active := True;
  end;

  if cdsImprimir.RecordCount = 0 then
  begin
    Application.MessageBox('Não há registros para imprimir', 'Aviso', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  with frxReport1 do
  begin
    if chkConteudo.Checked then
    begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaTreinamentosC.fr3');
    end
    else
    begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaTreinamentos.fr3');
    end;
    if tipoImp = 'I' then
    begin
      // Imprimir direto
      PrepareReport;
//            PrintOptions.Printer:= 'CutePDF Writer';
      PrintOptions.ShowDialog := False;
      Print;
    end
    else
    begin
      ShowReport;
    end;
  end;
end;

end.

