unit frm_CadContextoAnalise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormContextoAnalise = class(TForm)
    pctContexto: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    edtCodigo: TEdit;
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
    frxDBDSAnaliseContextos: TfrxDBDataset;
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
    lbl16: TLabel;
    mmoRequisito: TMemo;
    cdsContextocon_codigo: TIntegerField;
    cdsContextocon_nome: TWideStringField;
    cdsContextocon_descricao: TWideMemoField;
    zqryAnalise: TZQuery;
    dspAnalise: TDataSetProvider;
    cdsAnalise: TClientDataSet;
    dsAnalise: TDataSource;
    zqryPartes: TZQuery;
    dspPartes: TDataSetProvider;
    cdsPartes: TClientDataSet;
    cdsPartespar_codigo: TIntegerField;
    cdsPartespar_nome: TWideStringField;
    cdsPartespar_descricao: TWideMemoField;
    dsPartes: TDataSource;
    dblContexto: TDBLookupComboBox;
    lbl2: TLabel;
    lbl3: TLabel;
    dblParte: TDBLookupComboBox;
    lbl4: TLabel;
    mmoMonitoramento: TMemo;
    cdsAnaliseana_codigo: TIntegerField;
    cdsAnaliseana_contexto: TIntegerField;
    cdsAnaliseana_parte: TIntegerField;
    cdsAnaliseana_requisito: TWideMemoField;
    cdsAnaliseana_monitoramento: TWideMemoField;
    cdsAnalisecon_nome: TWideStringField;
    cdsAnalisepar_nome: TWideStringField;
    cdsImprimirana_codigo: TIntegerField;
    cdsImprimirana_contexto: TIntegerField;
    cdsImprimirana_parte: TIntegerField;
    cdsImprimirana_requisito: TWideMemoField;
    cdsImprimirana_monitoramento: TWideMemoField;
    cdsImprimircon_nome: TWideStringField;
    cdsImprimirpar_nome: TWideStringField;
    btnPDCA: TBitBtn;
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
    procedure mmoRequisitoKeyPress(Sender: TObject; var Key: Char);
    procedure mmoRequisitoExit(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnPDCAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormContextoAnalise: TFormContextoAnalise;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_PDCA;

{$R *.dfm}

procedure TFormContextoAnalise.AtualizarDados;
begin
   cdsContexto.Active:= False;
   cdsContexto.Active:= True;

   cdsPartes.Active:= False;
   cdsPartes.Active:= True;

   cdsAnalise.Active:= False;
   cdsAnalise.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsAnalise.Locate('ana_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormContextoAnalise.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsAnalise.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormContextoAnalise.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 42, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   TryFocus(dblContexto);
   Botoes(False);
end;

procedure TFormContextoAnalise.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormContextoAnalise.btnExcluirClick(Sender: TObject);
var
   sContexto: string;
begin
   if (Acesso(cUsuario, 42, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sContexto:= 'Código: ' + edtCodigo.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM contexto_analise' +
                          ' WHERE ana_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('ANÁLISE DE CONTEXTO', sContexto, 'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormContextoAnalise.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO contexto_analise (' +
                             ' ana_codigo, ana_contexto, ana_parte, ana_requisito, ana_monitoramento)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             IntToStr(dblContexto.KeyValue) + ',' +
                             IntToStr(dblParte.KeyValue) + ',' +
                             QuotedStr(mmoRequisito.Text) + ',' +
                             QuotedStr(mmoMonitoramento.Text) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE contexto_analise SET' +
                             ' ana_contexto = ' + IntToStr(dblContexto.KeyValue) + ',' +
                             ' ana_parte = ' + IntToStr(dblParte.KeyValue) + ',' +
                             ' ana_requisito = ' + QuotedStr(mmoRequisito.Text) + ',' +
                             ' ana_monitoramento = ' + QuotedStr(mmoMonitoramento.Text) +
                             ' WHERE ana_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         Auditoria('ANÁLISE DE CONTEXTO', 'Código: ' + edtCodigo.Text, cOperacao,'');
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

procedure TFormContextoAnalise.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormContextoAnalise.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormContextoAnalise.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 42, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos(Self);
   HabilitarCampos(True, True, Self, 1);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   edtCodigo.Text:= BuscarNovoCodigo('contexto_analise', 'ana_codigo  ');
   TryFocus(dblContexto);
end;

procedure TFormContextoAnalise.btnPDCAClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      FormPDCA:= TFormPDCA.Create(nil);
      FormPDCA.iTela:= 2; // Análise de Contextos
      FormPDCA.ShowModal;
      FormPDCA.Release;
   end;
end;

procedure TFormContextoAnalise.btnPrimeiroClick(Sender: TObject);
begin
   cdsAnalise.First;
   PreencherCampos;
end;

procedure TFormContextoAnalise.btnAnteriorClick(Sender: TObject);
begin
   cdsAnalise.Prior;
   PreencherCampos;
end;

procedure TFormContextoAnalise.btnProximoClick(Sender: TObject);
begin
   cdsAnalise.Next;
   PreencherCampos;
end;

procedure TFormContextoAnalise.btnUltimoClick(Sender: TObject);
begin
   cdsAnalise.Last;
   PreencherCampos;
end;

procedure TFormContextoAnalise.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormContextoAnalise.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormContextoAnalise.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormContextoAnalise.ControlarAbas;
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

procedure TFormContextoAnalise.dbgContextosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormContextoAnalise.dbgContextosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctContexto.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormContextoAnalise.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsAnalise.Locate('con_nome',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormContextoAnalise.FormShow(Sender: TObject);
begin
   pctContexto.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormContextoAnalise.mmoRequisitoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormContextoAnalise.mmoRequisitoKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormContextoAnalise.pctContextoChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormContextoAnalise.PreencherCampos;
begin
   with cdsAnalise do begin
      edtCodigo.Text       := FieldByName('ana_codigo').AsString;
      dblContexto.KeyValue := FieldByName('ana_contexto').AsString;
      dblParte.KeyValue    := FieldByName('ana_parte').AsString;
      mmoRequisito.Text    := FieldByName('ana_requisito').AsString;
      mmoMonitoramento.Text:= FieldByName('ana_monitoramento').AsString;
   end;
end;

function TFormContextoAnalise.ValidarDados: Boolean;
begin
   if AllTrim(dblContexto.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome do Contexto é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblContexto);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormContextoAnalise.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   case rgOrdemImpressao.ItemIndex of
      0: begin // Código
         sCampoOrdem:= 'ana_codigo'
      end;
      1: begin // Contexto
         sCampoOrdem:= 'con_nome'
      end;
      2: begin // Parte Interessada
         sCampoOrdem:= 'par_nome'
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT ana_codigo, ana_contexto, ana_parte, ana_requisito, ana_monitoramento,' +
                    ' C.con_nome, P.par_nome' +
                    ' FROM contexto_analise A' +
                    ' INNER JOIN contextos C ON C.con_codigo = A.ana_contexto' +
                    ' INNER JOIN partes P ON P.par_codigo = A.ana_parte' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Imprimir('rel_AnaliseContexto', frxReport1, tipoImp);
end;

end.
