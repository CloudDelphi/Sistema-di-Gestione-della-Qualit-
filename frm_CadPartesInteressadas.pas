unit frm_CadPartesInteressadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadPartesInteressadas = class(TForm)
    pctContexto: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtParte: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgContextos: TDBGrid;
    zqryPartes: TZQuery;
    dspPartes: TDataSetProvider;
    cdsPartes: TClientDataSet;
    dsPartes: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSPartes: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnl1: TPanel;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    frxReport1: TfrxReport;
    lbl16: TLabel;
    mmoDescParte: TMemo;
    cdsPartespar_codigo: TIntegerField;
    cdsPartespar_nome: TWideStringField;
    cdsPartespar_descricao: TWideMemoField;
    cdsImprimirpar_codigo: TIntegerField;
    cdsImprimirpar_nome: TWideStringField;
    cdsImprimirpar_descricao: TWideMemoField;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
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
    procedure mmoDescParteKeyPress(Sender: TObject; var Key: Char);
    procedure mmoDescParteExit(Sender: TObject);
    function ValidarDados(): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadPartesInteressadas: TFormCadPartesInteressadas;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadPartesInteressadas.AtualizarDados;
begin
   cdsPartes.Active:= False;
   cdsPartes.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsPartes.Locate('par_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadPartesInteressadas.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsPartes.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadPartesInteressadas.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 41, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtParte);
   Botoes(False);
end;

procedure TFormCadPartesInteressadas.btnAnteriorClick(Sender: TObject);
begin
   cdsPartes.Prior;
   PreencherCampos;
end;

procedure TFormCadPartesInteressadas.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadPartesInteressadas.btnExcluirClick(Sender: TObject);
var
   sContexto: string;
begin
   if (Acesso(cUsuario, 41, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sContexto:= edtParte.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM partes' +
                          ' WHERE par_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('PARTES INTERESSADAS', sContexto,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadPartesInteressadas.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO partes (' +
                             ' par_codigo, par_nome, par_descricao)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(edtParte.Text) + ',' +
                             QuotedStr(mmoDescParte.Text) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE partes SET' +
                             ' par_nome = ' + QuotedStr(edtParte.Text) + ',' +
                             ' par_descricao = ' + QuotedStr(mmoDescParte.Text) +
                             ' WHERE par_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         Auditoria('PARTES INTERESSADAS', edtParte.Text,cOperacao,'');
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

procedure TFormCadPartesInteressadas.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPartesInteressadas.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadPartesInteressadas.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 41, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('partes', 'par_codigo  ');
   TryFocus(edtParte);
end;

procedure TFormCadPartesInteressadas.btnPrimeiroClick(Sender: TObject);
begin
   cdsPartes.First;
   PreencherCampos;
end;

procedure TFormCadPartesInteressadas.btnProximoClick(Sender: TObject);
begin
   cdsPartes.Next;
   PreencherCampos;
end;

procedure TFormCadPartesInteressadas.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadPartesInteressadas.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPartesInteressadas.btnUltimoClick(Sender: TObject);
begin
   cdsPartes.Last;
   PreencherCampos;
end;

procedure TFormCadPartesInteressadas.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPartesInteressadas.ControlarAbas;
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

procedure TFormCadPartesInteressadas.dbgContextosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadPartesInteressadas.dbgContextosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctContexto.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadPartesInteressadas.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsPartes.Locate('par_nome', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadPartesInteressadas.FormShow(Sender: TObject);
begin
   pctContexto.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadPartesInteressadas.mmoDescParteExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadPartesInteressadas.mmoDescParteKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadPartesInteressadas.pctContextoChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadPartesInteressadas.PreencherCampos;
begin
   with cdsPartes do begin
      edtCodigo.Text   := FieldByName('par_codigo').AsString;
      edtParte.Text    := FieldByName('par_nome').AsString;
      mmoDescParte.Text:= FieldByName('par_descricao').AsString;
   end;
end;

function TFormCadPartesInteressadas.ValidarDados: Boolean;
begin
   if AllTrim(edtParte.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome da Parte Interessada é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtParte);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadPartesInteressadas.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'par_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'par_nome'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT par_codigo, par_nome, par_descricao ' +
                    ' FROM partes' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaPartesInteressadas.fr3');
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
