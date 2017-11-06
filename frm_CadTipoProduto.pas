unit frm_CadTipoProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadTipoProduto = class(TForm)
    pctHabilidades: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtTipo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgHabilidades: TDBGrid;
    zqryTipoProd: TZQuery;
    dspTipoProd: TDataSetProvider;
    cdsTipoProd: TClientDataSet;
    dsTipoProd: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBTipoProd: TfrxDBDataset;
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
    frxReport1: TfrxReport;
    cdsTipoProdtipo_codigo: TIntegerField;
    cdsTipoProdtipo_nomeTipo: TWideStringField;
    cdsImprimirtipo_codigo: TIntegerField;
    cdsImprimirtipo_nomeTipo: TWideStringField;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
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
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure dbgHabilidadesDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtTipoExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctHabilidadesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadTipoProduto: TFormCadTipoProduto;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadTipoProduto.AtualizarDados;
begin
   cdsTipoProd.Active:= False;
   cdsTipoProd.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsTipoProd.Locate('tipo_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadTipoProduto.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsTipoProd.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadTipoProduto.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 28, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtTipo);
      Botoes(False);
   end;
end;

procedure TFormCadTipoProduto.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadTipoProduto.btnExcluirClick(Sender: TObject);
var
   sTipo: string;
begin
   if (Acesso(cUsuario, 28, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sTipo:= edtTipo.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM forn_tipo_produto' +
                          ' WHERE tipo_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('CADASTRO DE TIPO DE PRODUTO', sTipo, 'E', '');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadTipoProduto.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO forn_tipo_produto (' +
                          ' tipo_codigo, tipo_nomeTipo)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtTipo.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE forn_tipo_produto SET' +
                          ' tipo_nomeTipo = ' + QuotedStr(edtTipo.Text) +
                          ' WHERE tipo_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('CADASTRO DE TIPO DE PRODUTO',edtTipo.Text,cOperacao,'');
      AtualizarDados;

      HabilitarCampos(False, False);
      Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);

   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;

   Botoes(True);
   TryFocus(btnNovo);
end;

procedure TFormCadTipoProduto.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadTipoProduto.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadTipoProduto.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 28, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      TryFocus(edtTipo);
   end;
end;

procedure TFormCadTipoProduto.btnPrimeiroClick(Sender: TObject);
begin
   cdsTipoProd.First;
   PreencherCampos;
end;

procedure TFormCadTipoProduto.btnAnteriorClick(Sender: TObject);
begin
   cdsTipoProd.Prior;
   PreencherCampos;
end;

procedure TFormCadTipoProduto.btnProximoClick(Sender: TObject);
begin
   cdsTipoProd.Next;
   PreencherCampos;
end;

procedure TFormCadTipoProduto.btnUltimoClick(Sender: TObject);
begin
   cdsTipoProd.Last;
   PreencherCampos;
end;

procedure TFormCadTipoProduto.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadTipoProduto.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadTipoProduto.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadTipoProduto.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(tipo_codigo) AS NovoCodigo FROM forn_tipo_produto';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadTipoProduto.ControlarAbas;
begin
   if pctHabilidades.TabIndex = 0 then begin  // Cadastro
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

procedure TFormCadTipoProduto.dbgHabilidadesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadTipoProduto.dbgHabilidadesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctHabilidades.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadTipoProduto.edtTipoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadTipoProduto.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsTipoProd.Locate('tipo_nomeTipo',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadTipoProduto.FormShow(Sender: TObject);
begin
   pctHabilidades.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadTipoProduto.HabilitarCampos(Flag: Boolean; Codigo: Boolean);
begin
   edtCodigo.Enabled     := False;
   edtTipo.Enabled:= Flag;

   pctHabilidades.Pages[1].TabVisible:= not Flag;

   dbgHabilidades.Enabled:= not Flag;
end;

procedure TFormCadTipoProduto.LimparCampos;
begin
   edtCodigo.Clear;
   edtTipo.Clear;
end;

procedure TFormCadTipoProduto.pctHabilidadesChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadTipoProduto.PreencherCampos;
begin
   with cdsTipoProd do begin
      edtCodigo.Text:= FieldByName('tipo_codigo').AsString;
      edtTipo.Text  := FieldByName('tipo_nomeTipo').AsString;
   end;
end;

procedure TFormCadTipoProduto.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'tipo_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'tipo_nomeTipo'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT tipo_codigo, tipo_nomeTipo ' +
                    ' FROM forn_tipo_produto' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaTipoProduto.fr3');
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
