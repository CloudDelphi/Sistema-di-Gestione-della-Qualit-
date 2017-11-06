unit frm_CadImpactosAmb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadImpactos = class(TForm)
    pctAspectos: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtImpacto: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgAspectos: TDBGrid;
    zqryImpacto: TZQuery;
    dspImpacto: TDataSetProvider;
    cdsImpacto: TClientDataSet;
    dsImpacto: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSImpactos: TfrxDBDataset;
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
    cdsImprimirimp_codigo: TLargeintField;
    cdsImprimirimp_descricao: TWideStringField;
    btn1: TBitBtn;
    cdsImpactoimp_codigo: TLargeintField;
    cdsImpactoimp_descricao: TWideStringField;
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
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure FormShow(Sender: TObject);
    procedure dbgAspectosCellClick(Column: TColumn);
    procedure dbgAspectosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtImpactoExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadImpactos: TFormCadImpactos;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_Impressao;

{$R *.dfm}

procedure TFormCadImpactos.AtualizarDados;
begin
   cdsImpacto.Active:= False;
   cdsImpacto.Active:= True;
end;

procedure TFormCadImpactos.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsImpacto.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadImpactos.btn1Click(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadImpactos.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 6, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False);
   TryFocus(edtImpacto);
   Botoes(False);
end;

procedure TFormCadImpactos.btnAnteriorClick(Sender: TObject);
begin
   cdsImpacto.Prior;
   PreencherCampos;
end;

procedure TFormCadImpactos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadImpactos.btnExcluirClick(Sender: TObject);
var
   sAspecto: string;
begin
   if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sAspecto:= edtImpacto.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM impactos_ambientais' +
                          ' WHERE imp_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('IMPACTOS AMBIENTAIS',sAspecto,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadImpactos.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO impactos_ambientais (' +
                          ' imp_codigo, imp_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtImpacto.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE impactos_ambientais SET' +
                          ' imp_descricao = ' + QuotedStr(edtImpacto.Text) +
                          ' WHERE imp_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('IMPACTOS AMBIENTAIS',edtImpacto.Text,cOperacao,'');
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

procedure TFormCadImpactos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadImpactos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadImpactos.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 6, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   BuscarNovoCodigo();
   TryFocus(edtImpacto);
end;

procedure TFormCadImpactos.btnPrimeiroClick(Sender: TObject);
begin
   cdsImpacto.First;
   PreencherCampos;
end;

procedure TFormCadImpactos.btnProximoClick(Sender: TObject);
begin
   cdsImpacto.Next;
   PreencherCampos;
end;

procedure TFormCadImpactos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadImpactos.btnUltimoClick(Sender: TObject);
begin
   cdsImpacto.Last;
   PreencherCampos;
end;

procedure TFormCadImpactos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadImpactos.BuscarNovoCodigo;
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(imp_codigo) AS NovoCodigo FROM impactos_ambientais';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadImpactos.ControlarAbas;
begin
   if pctAspectos.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
//      cdsAspectos.Filtered:= False;
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

procedure TFormCadImpactos.dbgAspectosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadImpactos.dbgAspectosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctAspectos.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadImpactos.edtImpactoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadImpactos.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsImpacto.Locate('imp_descricao', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadImpactos.FormShow(Sender: TObject);
begin
   pctAspectos.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadImpactos.HabilitarCampos(Flag: Boolean; Codigo: Boolean);
begin
   edtCodigo.Enabled := False;
   edtImpacto.Enabled:= Flag;

   pctAspectos.Pages[1].TabVisible:= not Flag;

   dbgAspectos.Enabled:= not Flag;
end;

procedure TFormCadImpactos.LimparCampos;
begin
   edtCodigo.Clear;
   edtImpacto.Clear;
end;

procedure TFormCadImpactos.PreencherCampos;
begin
   with cdsImpacto do begin
      edtCodigo.Text := FieldByName('imp_codigo').AsString;
      edtImpacto.Text:= FieldByName('imp_descricao').AsString;
   end;
end;

procedure TFormCadImpactos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'imp_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'imp_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT imp_codigo, imp_descricao ' +
                    ' FROM impactos_ambientais' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaImpactos.fr3');
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
