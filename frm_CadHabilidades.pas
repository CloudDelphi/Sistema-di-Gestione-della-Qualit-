unit frm_CadHabilidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadHabilidades = class(TForm)
    pctHabilidades: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtHabilidade: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgHabilidades: TDBGrid;
    zqryHabilidades: TZQuery;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    dsHabilidades: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSHabilidades: TfrxDBDataset;
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
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    frxReport1: TfrxReport;
    cdsHabilidadescodi_hab: TIntegerField;
    cdsHabilidadesdesc_hab: TWideStringField;
    cdsImprimircodi_hab: TIntegerField;
    cdsImprimirdesc_hab: TWideStringField;
    lbl16: TLabel;
    mmoEspecificação: TMemo;
    cdsHabilidadeshab_especificacao: TWideMemoField;
    cdsImprimirhab_especificacao: TWideMemoField;
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
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure dbgHabilidadesDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctHabilidadesChange(Sender: TObject);
    procedure mmoEspecificaçãoKeyPress(Sender: TObject; var Key: Char);
    procedure mmoEspecificaçãoExit(Sender: TObject);
    function ValidarDados(): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadHabilidades: TFormCadHabilidades;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadHabilidades.AtualizarDados;
begin
   cdsHabilidades.Active:= False;
   cdsHabilidades.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsHabilidades.Locate('codi_hab', edtCodigo.Text,[])
   end;
end;

procedure TFormCadHabilidades.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsHabilidades.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadHabilidades.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 4, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(edtHabilidade);
   Botoes(False);
end;

procedure TFormCadHabilidades.btnAnteriorClick(Sender: TObject);
begin
   cdsHabilidades.Prior;
   PreencherCampos;
end;

procedure TFormCadHabilidades.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadHabilidades.btnExcluirClick(Sender: TObject);
var
   sHabilidade: string;
begin
   if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sHabilidade:= edtHabilidade.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM habilidades' +
                          ' WHERE codi_hab = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('HABILIDADES',sHabilidade,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadHabilidades.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO habilidades (' +
                             ' codi_hab, desc_hab, hab_especificacao)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(edtHabilidade.Text) + ',' +
                             QuotedStr(mmoEspecificação.Text) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE habilidades SET' +
                             ' desc_hab = ' + QuotedStr(edtHabilidade.Text) + ',' +
                             ' hab_especificacao = ' + QuotedStr(mmoEspecificação.Text) +
                             ' WHERE codi_hab = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         Auditoria('HABILIDADES', edtHabilidade.Text,cOperacao,'');
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

procedure TFormCadHabilidades.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadHabilidades.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadHabilidades.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 4, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('habilidades', 'codi_hab');
   TryFocus(edtHabilidade);
end;

procedure TFormCadHabilidades.btnPrimeiroClick(Sender: TObject);
begin
   cdsHabilidades.First;
   PreencherCampos;
end;

procedure TFormCadHabilidades.btnProximoClick(Sender: TObject);
begin
   cdsHabilidades.Next;
   PreencherCampos;
end;

procedure TFormCadHabilidades.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadHabilidades.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadHabilidades.btnUltimoClick(Sender: TObject);
begin
   cdsHabilidades.Last;
   PreencherCampos;
end;

procedure TFormCadHabilidades.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadHabilidades.ControlarAbas;
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

procedure TFormCadHabilidades.dbgHabilidadesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadHabilidades.dbgHabilidadesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctHabilidades.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadHabilidades.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsHabilidades.Locate('desc_hab',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadHabilidades.FormShow(Sender: TObject);
begin
   pctHabilidades.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadHabilidades.mmoEspecificaçãoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadHabilidades.mmoEspecificaçãoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadHabilidades.pctHabilidadesChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadHabilidades.PreencherCampos;
begin
   with cdsHabilidades do begin
      edtCodigo.Text       := FieldByName('codi_hab').AsString;
      edtHabilidade.Text   := FieldByName('desc_hab').AsString;
      mmoEspecificação.Text:= FieldByName('hab_especificacao').AsString;
   end;
end;

function TFormCadHabilidades.ValidarDados: Boolean;
begin
   if AllTrim(edtHabilidade.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome da Habilidade é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtHabilidade);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadHabilidades.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'codi_hab'
   end
   else begin // Alfabética
      sCampoOrdem:= 'desc_hab'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT codi_hab, desc_hab, hab_especificacao ' +
                    ' FROM habilidades' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaHabilidades.fr3');
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
