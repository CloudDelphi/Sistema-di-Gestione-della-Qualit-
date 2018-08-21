unit frm_CadOrigemPMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadOrigemPMC = class(TForm)
    pctOrigem: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtOrigem: TEdit;
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
    frxDBDSTabelaCombos: TfrxDBDataset;
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
    cdsOrigemtipo_com: TLargeintField;
    cdsOrigemdesc_com: TWideStringField;
    cdsOrigemcodi_com: TLargeintField;
    cdsOrigemvalo_com: TWideStringField;
    cdsOrigemorde_com: TLargeintField;
    cdsImprimirtipo_com: TLargeintField;
    cdsImprimirdesc_com: TWideStringField;
    cdsImprimircodi_com: TLargeintField;
    cdsImprimirvalo_com: TWideStringField;
    cdsImprimirorde_com: TLargeintField;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
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
    procedure dbgTreinamentosCellClick(Column: TColumn);
    procedure dbgTreinamentosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtOrigemExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctOrigemChange(Sender: TObject);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadOrigemPMC: TFormCadOrigemPMC;

implementation

uses Funcoes, frm_Inicial, frm_dm, AtualizaBanco;

{$R *.dfm}

procedure TFormCadOrigemPMC.AtualizarDados;
begin
   cdsOrigem.Active:= False;
   cdsOrigem.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsOrigem.Locate('codi_com', edtCodigo.Text,[])
   end;
end;

procedure TFormCadOrigemPMC.Botoes(Flag: Boolean);
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

procedure TFormCadOrigemPMC.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 59, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False);
   TryFocus(edtOrigem);
   Botoes(False);
end;

procedure TFormCadOrigemPMC.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadOrigemPMC.btnExcluirClick(Sender: TObject);
var
   sTreinamento: string;
begin
   if (Acesso(cUsuario, 59, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sTreinamento:= edtOrigem.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM tabela_combos' +
                          ' WHERE codi_com = ' + QuotedStr(edtCodigo.Text) +
                          ' AND tipo_com = 5';
            Execute;
         end;

         Auditoria('ORIGEM DE PMC', edtOrigem.Text,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadOrigemPMC.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         if cOperacao = 'I' then begin
            GravarTabelaCombos(5, 'ORIGEM - ABERTURA PMC', StrToInt(edtCodigo.Text), edtOrigem.Text, StrToInt(edtCodigo.Text));
         end
         else begin
            Active:= False;
            CommandText:= ' UPDATE tabela_combos SET' +
                          ' valo_com = ' + QuotedStr(edtOrigem.Text) +
                          ' WHERE codi_com = ' + QuotedStr(edtCodigo.Text) +
                          ' AND tipo_com = 5';
            Execute;
         end;

      end;

      Auditoria('ORIGEM DE PMC', edtOrigem.Text, cOperacao, '');
      AtualizarDados();

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

procedure TFormCadOrigemPMC.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadOrigemPMC.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadOrigemPMC.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 59, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   BuscarNovoCodigo();
   TryFocus(edtOrigem);
end;

procedure TFormCadOrigemPMC.btnPrimeiroClick(Sender: TObject);
begin
   cdsOrigem.First;
   PreencherCampos;
end;

procedure TFormCadOrigemPMC.btnProximoClick(Sender: TObject);
begin
   cdsOrigem.Next;
   PreencherCampos;
end;

procedure TFormCadOrigemPMC.btnAnteriorClick(Sender: TObject);
begin
   cdsOrigem.Prior;
   PreencherCampos;
end;

procedure TFormCadOrigemPMC.btnUltimoClick(Sender: TObject);
begin
   cdsOrigem.Last;
   PreencherCampos;
end;

procedure TFormCadOrigemPMC.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadOrigemPMC.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadOrigemPMC.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadOrigemPMC.BuscarNovoCodigo;
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_com) AS NovoCodigo FROM tabela_combos' +
                    ' WHERE tipo_com = 5';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadOrigemPMC.ControlarAbas;
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

procedure TFormCadOrigemPMC.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadOrigemPMC.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctOrigem.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadOrigemPMC.edtOrigemExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadOrigemPMC.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsOrigem.Locate('valo_com',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadOrigemPMC.FormShow(Sender: TObject);
begin
   pctOrigem.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadOrigemPMC.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtCodigo.Enabled   := False;
   edtOrigem.Enabled:= Flag;

   pctOrigem.Pages[1].TabVisible:= not Flag;

   dbgTreinamentos.Enabled:= not Flag;
end;

procedure TFormCadOrigemPMC.LimparCampos;
begin
   edtCodigo.Clear;
   edtOrigem.Clear;
end;

procedure TFormCadOrigemPMC.pctOrigemChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadOrigemPMC.PreencherCampos;
begin
   with cdsOrigem do begin
      edtCodigo.Text:= FieldByName('codi_com').AsString;
      edtOrigem.Text:= FieldByName('valo_com').AsString;
   end;
end;

procedure TFormCadOrigemPMC.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'codi_com'
   end
   else begin // Alfabética
      sCampoOrdem:= 'valo_com'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT tipo_com, desc_com, codi_com, valo_com, orde_com' +
                    ' FROM tabela_combos' +
                    ' WHERE tipo_com = 5' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaTabelaCombos.fr3');
      Variables['Titulo']    := QuotedStr('LISTAGEM DE ORIGENS DE PMC');
      Variables['TituloDesc']:= QuotedStr('Origem de PMC');

      if tipoImp = 'I' then begin
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
