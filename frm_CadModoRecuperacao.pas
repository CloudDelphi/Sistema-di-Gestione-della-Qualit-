unit frm_CadModoRecuperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadModoRecuperacao = class(TForm)
    pctTreinamentos: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtModoRecup: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    zqryModoRecup: TZQuery;
    dspModoRecup: TDataSetProvider;
    cdsModoRecup: TClientDataSet;
    dsModoRecup: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSModoRecup: TfrxDBDataset;
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
    cdsModoRecuptipo_com: TLargeintField;
    cdsModoRecupdesc_com: TWideStringField;
    cdsModoRecupcodi_com: TLargeintField;
    cdsModoRecupvalo_com: TWideStringField;
    cdsModoRecuporde_com: TLargeintField;
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
    procedure edtModoRecupExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctTreinamentosChange(Sender: TObject);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadModoRecuperacao: TFormCadModoRecuperacao;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadModoRecuperacao.AtualizarDados;
begin
   cdsModoRecup.Active:= False;
   cdsModoRecup.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsModoRecup.Locate('codi_com', edtCodigo.Text,[])
   end;
end;

procedure TFormCadModoRecuperacao.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsModoRecup.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadModoRecuperacao.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 9, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False);
   TryFocus(edtModoRecup);
   Botoes(False);
end;

procedure TFormCadModoRecuperacao.btnAnteriorClick(Sender: TObject);
begin
   cdsModoRecup.Prior;
   PreencherCampos;
end;

procedure TFormCadModoRecuperacao.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadModoRecuperacao.btnExcluirClick(Sender: TObject);
var
   sTreinamento: string;
begin
   if (Acesso(cUsuario, 9, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sTreinamento:= edtModoRecup.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM tabela_combos' +
                          ' WHERE codi_com = ' + QuotedStr(edtCodigo.Text) +
                          ' AND tipo_com = 2';
            Execute;
         end;

         Auditoria('MODO DE RECUPERAÇÃO DE DOCUMENTOS',edtModoRecup.Text,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadModoRecuperacao.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO tabela_combos (' +
                          ' tipo_com, desc_com, codi_com, valo_com, orde_com)' +
                          ' VALUES(' +
                          '2, ' +
                          QuotedStr('RECUPERAR - FORMULARIOS') + ',' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtModoRecup.Text) + ',' +
                          QuotedStr(edtCodigo.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE tabela_combos SET' +
                          ' valo_com = ' + QuotedStr(edtModoRecup.Text) +
                          ' WHERE codi_com = ' + QuotedStr(edtCodigo.Text) +
                          ' AND tipo_com = 2';
         end;
         Execute;
      end;

      Auditoria('MODO DE RECUPERAÇÃO DE DOCUMENTOS',edtModoRecup.Text,cOperacao,'');
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

procedure TFormCadModoRecuperacao.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadModoRecuperacao.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadModoRecuperacao.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 9, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   BuscarNovoCodigo();
   TryFocus(edtModoRecup);
end;

procedure TFormCadModoRecuperacao.btnPrimeiroClick(Sender: TObject);
begin
   cdsModoRecup.First;
   PreencherCampos;
end;

procedure TFormCadModoRecuperacao.btnProximoClick(Sender: TObject);
begin
   cdsModoRecup.Next;
   PreencherCampos;
end;

procedure TFormCadModoRecuperacao.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadModoRecuperacao.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadModoRecuperacao.btnUltimoClick(Sender: TObject);
begin
   cdsModoRecup.Last;
   PreencherCampos;
end;

procedure TFormCadModoRecuperacao.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadModoRecuperacao.BuscarNovoCodigo;
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_com) AS NovoCodigo FROM tabela_combos' +
                    ' WHERE tipo_com = 2';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadModoRecuperacao.ControlarAbas;
begin
   if pctTreinamentos.TabIndex = 0 then begin  // Cadastro
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

procedure TFormCadModoRecuperacao.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadModoRecuperacao.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctTreinamentos.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadModoRecuperacao.edtModoRecupExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadModoRecuperacao.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsModoRecup.Locate('valo_com',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadModoRecuperacao.FormShow(Sender: TObject);
begin
   pctTreinamentos.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadModoRecuperacao.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtCodigo.Enabled   := False;
   edtModoRecup.Enabled:= Flag;

   pctTreinamentos.Pages[1].TabVisible:= not Flag;

   dbgTreinamentos.Enabled:= not Flag;
end;

procedure TFormCadModoRecuperacao.LimparCampos;
begin
   edtCodigo.Clear;
   edtModoRecup.Clear;
end;

procedure TFormCadModoRecuperacao.pctTreinamentosChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadModoRecuperacao.PreencherCampos;
begin
   with cdsModoRecup do begin
      edtCodigo.Text   := FieldByName('codi_com').AsString;
      edtModoRecup.Text:= FieldByName('valo_com').AsString;
   end;
end;

procedure TFormCadModoRecuperacao.Impressao(tipoImp: string);
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
                    ' WHERE tipo_com = 2' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaModoRecup.fr3');
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
