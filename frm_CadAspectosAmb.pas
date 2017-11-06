unit frm_CadAspectosAmb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls;

type
  TFormCadAspectos = class(TForm)
    pctAspectos: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtAspecto: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgAspectos: TDBGrid;
    zqryAspectos: TZQuery;
    dspAspectos: TDataSetProvider;
    cdsAspectos: TClientDataSet;
    dsAspectos: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBDSAspectos: TfrxDBDataset;
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
    cdsImprimirasp_codigo: TLargeintField;
    cdsImprimirasp_descricao: TWideStringField;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    frxReport1: TfrxReport;
    btn1: TBitBtn;
    cdsAspectosasp_codigo: TLargeintField;
    cdsAspectosasp_descricao: TWideStringField;
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
    procedure edtAspectoExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadAspectos: TFormCadAspectos;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadAspectos.AtualizarDados;
begin
   cdsAspectos.Active:= False;
   cdsAspectos.Active:= True;
end;

procedure TFormCadAspectos.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsAspectos.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadAspectos.btn1Click(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadAspectos.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 6, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False);
   TryFocus(edtAspecto);
   Botoes(False);
end;

procedure TFormCadAspectos.btnAnteriorClick(Sender: TObject);
begin
   cdsAspectos.Prior;
   PreencherCampos;
end;

procedure TFormCadAspectos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadAspectos.btnExcluirClick(Sender: TObject);
var
   sAspecto: string;
begin
   if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sAspecto:= edtAspecto.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM aspectos_ambientais' +
                          ' WHERE asp_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('ASPECTOS AMBIENTAIS',sAspecto,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadAspectos.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO aspectos_ambientais (' +
                          ' asp_codigo, asp_descricao)' +
                          ' VALUES(' +
                          QuotedStr(edtCodigo.Text) + ',' +
                          QuotedStr(edtAspecto.Text) +
                          ');';
         end
         else begin
            CommandText:= ' UPDATE aspectos_ambientais SET' +
                          ' asp_descricao = ' + QuotedStr(edtAspecto.Text) +
                          ' WHERE asp_codigo = ' + QuotedStr(edtCodigo.Text);
         end;
         Execute;
      end;

      Auditoria('ASPECTOS AMBIENTAIS',edtAspecto.Text,cOperacao,'');
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

procedure TFormCadAspectos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadAspectos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadAspectos.btnNovoClick(Sender: TObject);
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
   TryFocus(edtAspecto);
end;

procedure TFormCadAspectos.btnPrimeiroClick(Sender: TObject);
begin
   cdsAspectos.First;
   PreencherCampos;
end;

procedure TFormCadAspectos.btnProximoClick(Sender: TObject);
begin
   cdsAspectos.Next;
   PreencherCampos;
end;

procedure TFormCadAspectos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadAspectos.btnUltimoClick(Sender: TObject);
begin
   cdsAspectos.Last;
   PreencherCampos;
end;

procedure TFormCadAspectos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadAspectos.BuscarNovoCodigo;
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(asp_codigo) AS NovoCodigo FROM aspectos_ambientais';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadAspectos.ControlarAbas;
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

procedure TFormCadAspectos.dbgAspectosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadAspectos.dbgAspectosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctAspectos.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadAspectos.edtAspectoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadAspectos.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsAspectos.Locate('asp_descricao', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadAspectos.FormShow(Sender: TObject);
begin
   pctAspectos.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadAspectos.HabilitarCampos(Flag: Boolean; Codigo: Boolean);
begin
   edtCodigo.Enabled := False;
   edtAspecto.Enabled:= Flag;

   pctAspectos.Pages[1].TabVisible:= not Flag;

   dbgAspectos.Enabled:= not Flag;
end;

procedure TFormCadAspectos.LimparCampos;
begin
   edtCodigo.Clear;
   edtAspecto.Clear;
end;

procedure TFormCadAspectos.PreencherCampos;
begin
   with cdsAspectos do begin
      edtCodigo.Text := FieldByName('asp_codigo').AsString;
      edtAspecto.Text:= FieldByName('asp_descricao').AsString;
   end;
end;

procedure TFormCadAspectos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Código
      sCampoOrdem:= 'asp_codigo'
   end
   else begin // Alfabética
      sCampoOrdem:= 'asp_descricao'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT asp_codigo, asp_descricao ' +
                    ' FROM aspectos_ambientais' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaAspectos.fr3');
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
