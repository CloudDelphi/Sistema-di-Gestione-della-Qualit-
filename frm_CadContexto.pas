unit frm_CadContexto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadContexto = class(TForm)
    pctContexto: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtContexto: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgContextos: TDBGrid;
    zqryContexto: TZQuery;
    dspContexto: TDataSetProvider;
    cdsContexto: TClientDataSet;
    dsContexto: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSContextos: TfrxDBDataset;
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
    lbl16: TLabel;
    mmoDescContexto: TMemo;
    cdsContextocon_codigo: TIntegerField;
    cdsContextocon_nome: TWideStringField;
    cdsContextocon_descricao: TWideMemoField;
    cdsImprimircon_codigo: TIntegerField;
    cdsImprimircon_nome: TWideStringField;
    cdsImprimircon_descricao: TWideMemoField;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
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
    procedure dbgContextosCellClick(Column: TColumn);
    procedure dbgContextosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctContextoChange(Sender: TObject);
    procedure mmoDescContextoKeyPress(Sender: TObject; var Key: Char);
    procedure mmoDescContextoExit(Sender: TObject);
    function ValidarDados(): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadContexto: TFormCadContexto;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_PDCA;

{$R *.dfm}

procedure TFormCadContexto.AtualizarDados;
begin
   cdsContexto.Active:= False;
   cdsContexto.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsContexto.Locate('con_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadContexto.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsContexto.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadContexto.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 40, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtContexto);
   Botoes(False);
end;

procedure TFormCadContexto.btnAnteriorClick(Sender: TObject);
begin
   cdsContexto.Prior;
   PreencherCampos;
end;

procedure TFormCadContexto.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadContexto.btnExcluirClick(Sender: TObject);
var
   sContexto: string;
begin
   if (Acesso(cUsuario, 40, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sContexto:= edtContexto.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM contextos' +
                          ' WHERE con_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('CONTEXTOS', sContexto,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadContexto.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO contextos (' +
                             ' con_codigo, con_nome, con_descricao)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(edtContexto.Text) + ',' +
                             QuotedStr(mmoDescContexto.Text) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE contextos SET' +
                             ' con_nome = ' + QuotedStr(edtContexto.Text) + ',' +
                             ' con_descricao = ' + QuotedStr(mmoDescContexto.Text) +
                             ' WHERE con_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         Auditoria('CONTEXTOS', edtContexto.Text,cOperacao,'');
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
end;

procedure TFormCadContexto.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadContexto.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadContexto.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 40, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('contextos', 'con_codigo  ');
   TryFocus(edtContexto);
end;

procedure TFormCadContexto.btnPrimeiroClick(Sender: TObject);
begin
   cdsContexto.First;
   PreencherCampos;
end;

procedure TFormCadContexto.btnProximoClick(Sender: TObject);
begin
   cdsContexto.Next;
   PreencherCampos;
end;

procedure TFormCadContexto.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadContexto.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadContexto.btnUltimoClick(Sender: TObject);
begin
   cdsContexto.Last;
   PreencherCampos;
end;

procedure TFormCadContexto.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadContexto.ControlarAbas;
begin
   if pctContexto.TabIndex = 0 then begin  // Cadastro
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

procedure TFormCadContexto.dbgContextosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadContexto.dbgContextosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctContexto.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadContexto.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsContexto.Locate('con_nome',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadContexto.FormShow(Sender: TObject);
begin
   pctContexto.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadContexto.mmoDescContextoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadContexto.mmoDescContextoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadContexto.pctContextoChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadContexto.PreencherCampos;
begin
   with cdsContexto do begin
      edtCodigo.Text       := FieldByName('con_codigo').AsString;
      edtContexto.Text   := FieldByName('con_nome').AsString;
      mmoDescContexto.Text:= FieldByName('con_descricao').AsString;
   end;
end;

function TFormCadContexto.ValidarDados: Boolean;
begin
   if AllTrim(edtContexto.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome do Contexto é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtContexto);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadContexto.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'con_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'con_nome'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT con_codigo, con_nome, con_descricao ' +
                    ' FROM contextos' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaContextos.fr3');
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
