unit frm_DefCadClasse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadDefClasse = class(TForm)
    pctClasse: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtClasse: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    zqryClasse: TZQuery;
    dspClasse: TDataSetProvider;
    cdsClasse: TClientDataSet;
    dsClasse: TDataSource;
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
    frxDBDSClasseDefeito: TfrxDBDataset;
    cdsClassecla_codigo: TIntegerField;
    cdsClassecla_descricao: TWideStringField;
    cdsImprimircla_codigo: TIntegerField;
    cdsImprimircla_descricao: TWideStringField;
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
    procedure edtClasseExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctClasseChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadDefClasse: TFormCadDefClasse;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadDefClasse.AtualizarDados;
begin
   cdsClasse.Active:= False;
   cdsClasse.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsClasse.Locate('cla_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadDefClasse.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsClasse.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadDefClasse.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 3, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtClasse);
   Botoes(False);
end;

procedure TFormCadDefClasse.btnAnteriorClick(Sender: TObject);
begin
   cdsClasse.Prior;
   PreencherCampos;
end;

procedure TFormCadDefClasse.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadDefClasse.btnExcluirClick(Sender: TObject);
var
   sTreinamento: string;
begin
   if (Acesso(cUsuario, 3, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sTreinamento:= edtClasse.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM defeitos_classe' +
                          ' WHERE cla_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('CLASSE DEFEITOS',sTreinamento,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadDefClasse.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO defeitos_classe (' +
                          ' cla_codigo, cla_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtClasse.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE defeitos_classe SET' +
                          ' cla_descricao = ' + QuotedStr(edtClasse.Text) +
                          ' WHERE cla_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('CLASSE DEFEITOS',edtClasse.Text,cOperacao,'');
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

procedure TFormCadDefClasse.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadDefClasse.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadDefClasse.btnNovoClick(Sender: TObject);
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
   edtCodigo.Text:= BuscarNovoCodigo('defeitos_classe', 'cla_codigo');
   TryFocus(edtClasse);
end;

procedure TFormCadDefClasse.btnPrimeiroClick(Sender: TObject);
begin
   cdsClasse.First;
   PreencherCampos;
end;

procedure TFormCadDefClasse.btnProximoClick(Sender: TObject);
begin
   cdsClasse.Next;
   PreencherCampos;
end;

procedure TFormCadDefClasse.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadDefClasse.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadDefClasse.btnUltimoClick(Sender: TObject);
begin
   cdsClasse.Last;
   PreencherCampos;
end;

procedure TFormCadDefClasse.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadDefClasse.ControlarAbas;
begin
   if pctClasse.TabIndex = 0 then begin  // Cadastro
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

procedure TFormCadDefClasse.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadDefClasse.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctClasse.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadDefClasse.edtClasseExit(Sender: TObject);
begin
//   TryFocus(btnGravar);
end;

procedure TFormCadDefClasse.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsClasse.Locate('cla_descricao',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadDefClasse.FormShow(Sender: TObject);
begin
   pctClasse.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadDefClasse.pctClasseChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadDefClasse.PreencherCampos;
begin
   with cdsClasse do begin
      edtCodigo.Text     := FieldByName('cla_codigo').AsString;
      edtClasse.Text:= FieldByName('cla_descricao').AsString;
   end;
end;

procedure TFormCadDefClasse.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'cla_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'cla_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT cla_codigo, cla_descricao ' +
                    ' FROM defeitos_classe' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaClasseDefeito.fr3');
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
