unit frm_CadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadProdutos = class(TForm)
    pctOrigem: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    edtCodigo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    zqryProdutos: TZQuery;
    dspProdutos: TDataSetProvider;
    cdsProdutos: TClientDataSet;
    dsProdutos: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
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
    frxDBDSProdutos: TfrxDBDataset;
    Label1: TLabel;
    edtProduto: TEdit;
    cdsProdutospro_codigo: TIntegerField;
    cdsProdutospro_descricao: TWideStringField;
    cdsImprimirpro_codigo: TIntegerField;
    cdsImprimirpro_descricao: TWideStringField;
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
    procedure edtTreinamentoExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctOrigemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadProdutos: TFormCadProdutos;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadProdutos.AtualizarDados;
begin
   cdsProdutos.Active:= False;
   cdsProdutos.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsProdutos.Locate('pro_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadProdutos.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsProdutos.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadProdutos.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 29, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtProduto);
   Botoes(False);
end;

procedure TFormCadProdutos.btnAnteriorClick(Sender: TObject);
begin
   cdsProdutos.Prior;
   PreencherCampos;
end;

procedure TFormCadProdutos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadProdutos.btnExcluirClick(Sender: TObject);
var
   sDefeito: string;
begin
   if (Acesso(cUsuario, 29, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sDefeito:= edtProduto.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM produtos' +
                          ' WHERE pro_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('PRODUTOS', sDefeito,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadProdutos.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO produtos (' +
                          ' pro_codigo, pro_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtProduto.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE produtos  SET' +
                          ' pro_descricao = ' + QuotedStr(edtProduto.Text) +
                          ' WHERE pro_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('PRODUTOS', edtProduto.Text, cOperacao, '');
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

procedure TFormCadProdutos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadProdutos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadProdutos.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 29, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('produtos', 'pro_codigo');
   TryFocus(edtProduto);
end;

procedure TFormCadProdutos.btnPrimeiroClick(Sender: TObject);
begin
   cdsProdutos.First;
   PreencherCampos;
end;

procedure TFormCadProdutos.btnProximoClick(Sender: TObject);
begin
   cdsProdutos.Next;
   PreencherCampos;
end;

procedure TFormCadProdutos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadProdutos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadProdutos.btnUltimoClick(Sender: TObject);
begin
   cdsProdutos.Last;
   PreencherCampos;
end;

procedure TFormCadProdutos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadProdutos.ControlarAbas;
begin
   if pctOrigem.TabIndex = 0 then begin  // Cadastro
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

//      if pctAspectos.TabIndex = 1 then begin
         edtValor.Clear;
         edtValor.SetFocus;
//      end;
   end;
end;

procedure TFormCadProdutos.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadProdutos.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctOrigem.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadProdutos.edtTreinamentoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadProdutos.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsProdutos.Locate('pro_descricao',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadProdutos.FormShow(Sender: TObject);
begin
   pctOrigem.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadProdutos.pctOrigemChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadProdutos.PreencherCampos;
begin
   with cdsProdutos do begin
      edtCodigo.Text     := FieldByName('pro_codigo').AsString;
      edtProduto.Text:= FieldByName('pro_descricao').AsString;
   end;
end;

procedure TFormCadProdutos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'pro_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'pro_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT pro_codigo, pro_descricao' +
                    ' FROM produtos' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaProdutos.fr3');
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
