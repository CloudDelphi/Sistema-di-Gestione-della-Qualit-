unit frm_DefCadDefeitos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadDefDefeitos = class(TForm)
    pctDefeito: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    zqryDefeitos: TZQuery;
    dspDefeitos: TDataSetProvider;
    cdsDefeitos: TClientDataSet;
    dsDefeitos: TDataSource;
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
    frxDBDSDefeito: TfrxDBDataset;
    Label1: TLabel;
    edtDefeito: TEdit;
    dblClasse: TDBLookupComboBox;
    cdsDefeitosdef_codigo: TIntegerField;
    cdsDefeitosdef_descricao: TWideStringField;
    cdsDefeitosdef_classe: TIntegerField;
    zqryClasse: TZQuery;
    dspClasse: TDataSetProvider;
    cdsClasse: TClientDataSet;
    cdsClassecla_codigo: TIntegerField;
    cdsClassecla_descricao: TWideStringField;
    dsClasse: TDataSource;
    cdsDefeitoscla_descricao: TWideStringField;
    cdsImprimirdef_codigo: TIntegerField;
    cdsImprimirdef_descricao: TWideStringField;
    cdsImprimirdef_classe: TIntegerField;
    cdsImprimircla_descricao: TWideStringField;
    grp1: TGroupBox;
    chkClasse: TCheckBox;
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
    procedure dbgTreinamentosCellClick(Column: TColumn);
    procedure dbgTreinamentosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtTreinamentoExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctDefeitoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadDefDefeitos: TFormCadDefDefeitos;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadDefDefeitos.AtualizarDados;
begin
   cdsClasse.Active:= False;
   cdsClasse.Active:= True;

   cdsDefeitos.Active:= False;
   cdsDefeitos.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsDefeitos.Locate('def_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadDefDefeitos.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsDefeitos.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadDefDefeitos.btnAlterarClick(Sender: TObject);
begin
//   if not (Acesso(cUsuario, 3, 'alteracao') = 1) then begin
//      Exit;
//   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtDefeito);
   Botoes(False);
end;

procedure TFormCadDefDefeitos.btnAnteriorClick(Sender: TObject);
begin
   cdsDefeitos.Prior;
   PreencherCampos;
end;

procedure TFormCadDefDefeitos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadDefDefeitos.btnExcluirClick(Sender: TObject);
var
   sDefeito: string;
begin
   if (Acesso(cUsuario, 3, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sDefeito:= edtDefeito.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM defeitos' +
                          ' WHERE def_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('DEFEITOS', sDefeito,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadDefDefeitos.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO defeitos (' +
                          ' def_codigo, def_descricao, def_classe)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtDefeito.Text) + ',' +
                          IntToStr(dblClasse.KeyValue) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE defeitos  SET' +
                          ' def_descricao = ' + QuotedStr(edtDefeito.Text) + ',' +
                          ' def_classe = ' + IntToStr(dblClasse.KeyValue) +
                          ' WHERE def_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('DEFEITOS',edtDefeito.Text,cOperacao,'');
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

procedure TFormCadDefDefeitos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadDefDefeitos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadDefDefeitos.btnNovoClick(Sender: TObject);
begin
//   if not (Acesso(cUsuario, 3, 'cadastro') = 1) then begin
//      Exit;
//   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('defeitos', 'def_codigo');
   TryFocus(dblClasse);
end;

procedure TFormCadDefDefeitos.btnPrimeiroClick(Sender: TObject);
begin
   cdsDefeitos.First;
   PreencherCampos;
end;

procedure TFormCadDefDefeitos.btnProximoClick(Sender: TObject);
begin
   cdsDefeitos.Next;
   PreencherCampos;
end;

procedure TFormCadDefDefeitos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadDefDefeitos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadDefDefeitos.btnUltimoClick(Sender: TObject);
begin
   cdsDefeitos.Last;
   PreencherCampos;
end;

procedure TFormCadDefDefeitos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadDefDefeitos.ControlarAbas;
begin
   if pctDefeito.TabIndex = 0 then begin  // Cadastro
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

procedure TFormCadDefDefeitos.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadDefDefeitos.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctDefeito.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadDefDefeitos.edtTreinamentoExit(Sender: TObject);
begin
//   TryFocus(btnGravar);
end;

procedure TFormCadDefDefeitos.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsDefeitos.Locate('def_descricao',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadDefDefeitos.FormShow(Sender: TObject);
begin
   pctDefeito.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);

   rgOrdemImpressao.ItemIndex:= 1;
   chkClasse.Checked:= True;
end;

procedure TFormCadDefDefeitos.LimparCampos;
begin
   edtCodigo.Clear;
   edtDefeito.Clear;
end;

procedure TFormCadDefDefeitos.pctDefeitoChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadDefDefeitos.PreencherCampos;
begin
   with cdsDefeitos do begin
      edtCodigo.Text     := FieldByName('def_codigo').AsString;
      edtDefeito.Text:= FieldByName('def_descricao').AsString;

      if FieldByName('def_classe').AsString <> EmptyStr then begin
         dblClasse.KeyValue:= FieldByName('def_classe').AsString;
      end;
   end;
end;

procedure TFormCadDefDefeitos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if chkClasse.Checked then begin
      if rgOrdemImpressao.ItemIndex = 0 then begin // Código
         sCampoOrdem:= 'cla_descricao, def_codigo'
      end
      else begin // Alfabética
         sCampoOrdem:= 'cla_descricao, def_descricao'
      end;
   end
   else begin
      if rgOrdemImpressao.ItemIndex = 0 then begin // Código
         sCampoOrdem:= 'def_codigo'
      end
      else begin // Alfabética
         sCampoOrdem:= 'def_descricao'
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT D.def_codigo, D.def_descricao, D.def_classe, C.cla_descricao' +
                    ' FROM defeitos D' +
                    ' INNER JOIN defeitos_classe C ON C.cla_codigo = D.def_classe' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      if chkClasse.Checked then begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaDefeitosAgrupa.fr3');
      end
      else begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaDefeitos.fr3');
      end;
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
