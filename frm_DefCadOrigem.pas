unit frm_DefCadOrigem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadDefOrigem = class(TForm)
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
    zqryOrigem: TZQuery;
    dspOrigem: TDataSetProvider;
    cdsOrigem: TClientDataSet;
    dsOrigem: TDataSource;
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
    frxDBDSOrigemDefeito: TfrxDBDataset;
    Label1: TLabel;
    edtOrigem: TEdit;
    cdsOrigemori_codigo: TIntegerField;
    cdsOrigemori_descricao: TWideStringField;
    cdsImprimirori_codigo: TIntegerField;
    cdsImprimirori_descricao: TWideStringField;
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
  FormCadDefOrigem: TFormCadDefOrigem;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadDefOrigem.AtualizarDados;
begin
   cdsOrigem.Active:= False;
   cdsOrigem.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsOrigem.Locate('ori_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadDefOrigem.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsOrigem.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadDefOrigem.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 3, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtOrigem);
   Botoes(False);
end;

procedure TFormCadDefOrigem.btnAnteriorClick(Sender: TObject);
begin
   cdsOrigem.Prior;
   PreencherCampos;
end;

procedure TFormCadDefOrigem.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadDefOrigem.btnExcluirClick(Sender: TObject);
var
   sDefeito: string;
begin
   if (Acesso(cUsuario, 3, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sDefeito:= edtOrigem.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM defeitos_origem' +
                          ' WHERE ori_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('ORIGEM DEFEITOS', sDefeito,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadDefOrigem.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO defeitos_origem (' +
                          ' ori_codigo, ori_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtOrigem.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE defeitos_origem  SET' +
                          ' ori_descricao = ' + QuotedStr(edtOrigem.Text) +
                          ' WHERE ori_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('ORIGEM DEFEITOS', edtOrigem.Text, cOperacao, '');
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

procedure TFormCadDefOrigem.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadDefOrigem.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadDefOrigem.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 3, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('defeitos_origem', 'ori_codigo');
   TryFocus(edtOrigem);
end;

procedure TFormCadDefOrigem.btnPrimeiroClick(Sender: TObject);
begin
   cdsOrigem.First;
   PreencherCampos;
end;

procedure TFormCadDefOrigem.btnProximoClick(Sender: TObject);
begin
   cdsOrigem.Next;
   PreencherCampos;
end;

procedure TFormCadDefOrigem.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadDefOrigem.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadDefOrigem.btnUltimoClick(Sender: TObject);
begin
   cdsOrigem.Last;
   PreencherCampos;
end;

procedure TFormCadDefOrigem.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadDefOrigem.ControlarAbas;
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

procedure TFormCadDefOrigem.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadDefOrigem.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctOrigem.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadDefOrigem.edtTreinamentoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadDefOrigem.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsOrigem.Locate('ori_descricao',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadDefOrigem.FormShow(Sender: TObject);
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

procedure TFormCadDefOrigem.pctOrigemChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadDefOrigem.PreencherCampos;
begin
   with cdsOrigem do begin
      edtCodigo.Text     := FieldByName('ori_codigo').AsString;
      edtOrigem.Text:= FieldByName('ori_descricao').AsString;
   end;
end;

procedure TFormCadDefOrigem.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'ori_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'ori_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT ori_codigo, ori_descricao' +
                    ' FROM defeitos_origem' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaOrigemDefeitos.fr3');
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
