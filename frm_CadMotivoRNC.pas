unit frm_CadMotivoRNC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadMotivoRNC = class(TForm)
    pctTreinamentos: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    edtMotivo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgTreinamentos: TDBGrid;
    zqryMotivo: TZQuery;
    dspMotivo: TDataSetProvider;
    cdsMotivo: TClientDataSet;
    dsMotivo: TDataSource;
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
    frxReport1: TfrxReport;
    cdsMotivotipo_com: TLargeintField;
    cdsMotivodesc_com: TWideStringField;
    cdsMotivocodi_com: TLargeintField;
    cdsMotivovalo_com: TWideStringField;
    cdsMotivoorde_com: TLargeintField;
    cdsImprimirtipo_com: TLargeintField;
    cdsImprimirdesc_com: TWideStringField;
    cdsImprimircodi_com: TLargeintField;
    cdsImprimirvalo_com: TWideStringField;
    cdsImprimirorde_com: TLargeintField;
    lbl18: TLabel;
    dblProcessos: TDBLookupComboBox;
    dbgProcessos: TDBGrid;
    btnInserirProcesso: TBitBtn;
    btnExcluirProcesso: TBitBtn;
    btnInserirTodos: TBitBtn;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    zqryProcMot: TZQuery;
    dspProcMot: TDataSetProvider;
    cdsProcMot: TClientDataSet;
    dsProcMot: TDataSource;
    cdsProcMotmot_motivo: TIntegerField;
    cdsProcMotmot_processo: TIntegerField;
    cdsProcMotnomeprocesso: TWideStringField;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure Botoes(Flag: Boolean);
    procedure BuscarNovoCodigo();
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AtualizarDados;
    procedure AtualizarDadosAcessorios;
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
    procedure edtMotivoExit(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctTreinamentosChange(Sender: TObject);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnInserirProcessoClick(Sender: TObject);
    procedure btnExcluirProcessoClick(Sender: TObject);
    procedure btnInserirTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormCadMotivoRNC: TFormCadMotivoRNC;

implementation

uses Funcoes, frm_Inicial, frm_dm, AtualizaBanco;

{$R *.dfm}

procedure TFormCadMotivoRNC.AtualizarDados;
begin
   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   cdsMotivo.Active:= False;
   cdsMotivo.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsMotivo.Locate('codi_com', edtCodigo.Text,[])
   end;
end;

procedure TFormCadMotivoRNC.AtualizarDadosAcessorios;
begin
   with cdsProcMot do begin
      Active:= False;
      CommandText:= ' SELECT mot_motivo, mot_processo, P.nome_pro as NomeProcesso' +
                    ' FROM motivos_processos M' +
                    ' INNER JOIN processos P ON P.codi_pro = M.mot_processo' +
                    ' WHERE mot_motivo = ' + edtCodigo.Text +
                    ' ORDER BY P.nome_pro';
      Active:= True;
   end;
end;

procedure TFormCadMotivoRNC.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   // Projeto TT440
   if BuscarParametroMotivoProc() = '1' then begin
      btnInserirProcesso.Enabled:= Flag;
      btnExcluirProcesso.Enabled:= Flag;
      btnInserirTodos.Enabled   := Flag;
   end
   else begin
      btnInserirProcesso.Enabled:= False;
      btnExcluirProcesso.Enabled:= False;
      btnInserirTodos.Enabled   := False;
   end;

   if cdsMotivo.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadMotivoRNC.btnAlterarClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 54, 'alteracao') = 1) then begin
      Exit;
   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False);
   TryFocus(edtMotivo);
   Botoes(False);
end;

procedure TFormCadMotivoRNC.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadMotivoRNC.btnExcluirClick(Sender: TObject);
var
   sTreinamento: string;
begin
   if (Acesso(cUsuario, 54, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sTreinamento:= edtMotivo.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM tabela_combos' +
                          ' WHERE codi_com = ' + QuotedStr(edtCodigo.Text) +
                          ' AND tipo_com = 32';
            Execute;
         end;

         Auditoria('MOTIVO DE RNC',edtMotivo.Text,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadMotivoRNC.btnExcluirProcessoClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM motivos_processos' +
                       ' WHERE mot_motivo = ' + QuotedStr(edtCodigo.Text) +
                       ' AND mot_processo = ' + cdsProcMot.FieldByName('mot_processo').AsString;
         Execute;
      end;
      AtualizarDadosAcessorios();
   end;
end;

procedure TFormCadMotivoRNC.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         if cOperacao = 'I' then begin
            GravarTabelaCombos(32, 'MOTIVOS - RNC', StrToInt(edtCodigo.Text), edtMotivo.Text, StrToInt(edtCodigo.Text));
         end
         else begin
            Active:= False;
            CommandText:= ' UPDATE tabela_combos SET' +
                          ' valo_com = ' + QuotedStr(edtMotivo.Text) +
                          ' WHERE codi_com = ' + QuotedStr(edtCodigo.Text) +
                          ' AND tipo_com = 32';
            Execute;
         end;

      end;

      Auditoria('MOTIVO DE RNC',edtMotivo.Text, cOperacao, '');
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

procedure TFormCadMotivoRNC.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadMotivoRNC.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadMotivoRNC.btnInserirProcessoClick(Sender: TObject);
begin
   // Verifica se já existe o processo para o motivo
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) qtd FROM motivos_processos' +
                    ' WHERE mot_motivo = ' + QuotedStr(edtCodigo.Text) +
                    '       AND mot_processo = ' + IntToStr(dblProcessos.KeyValue);
      Active:= True;
   end;

   if dm.cdsAuxiliar.FieldByName('qtd').AsInteger > 0 then begin
      Application.MessageBox('Este processo já foi cadastrado para esse motivo.','Aviso', MB_OK + MB_ICONWARNING);
      dblProcessos.SetFocus;
   end
   else begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO motivos_processos (mot_motivo, mot_processo)' +
                       ' VALUES(' +
                       QuotedStr(edtCodigo.Text) + ',' +
                       IntToStr(dblProcessos.KeyValue) +
                       ')';
         Execute;
      end;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.btnInserirTodosClick(Sender: TObject);
begin
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S');
      Active:= True;
      First;

      while not dm.cdsAux.Eof do begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT COUNT(*) qtd FROM motivos_processos' +
                          ' WHERE mot_motivo = ' + QuotedStr(edtCodigo.Text) +
                          '       AND mot_processo = ' + dm.cdsAux.FieldByName('codi_pro').AsString;
            Active:= True;
         end;
         if dm.cdsAuxiliar.FieldByName('qtd').AsInteger <= 0 then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO motivos_processos (mot_motivo, mot_processo)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             IntToStr(dm.cdsAux.FieldByName('codi_pro').AsInteger) +
                             ')';
               Execute;
            end;
         end;
         Next;
      end;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.btnNovoClick(Sender: TObject);
begin
   if not (Acesso(cUsuario, 54, 'cadastro') = 1) then begin
      Exit;
   end;

   cOperacao:= 'I';
   LimparCampos;
   HabilitarCampos(True, True);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   BuscarNovoCodigo();
   TryFocus(edtMotivo);
end;

procedure TFormCadMotivoRNC.btnPrimeiroClick(Sender: TObject);
begin
   cdsMotivo.First;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.btnAnteriorClick(Sender: TObject);
begin
   cdsMotivo.Prior;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.btnProximoClick(Sender: TObject);
begin
   cdsMotivo.Next;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.btnUltimoClick(Sender: TObject);
begin
   cdsMotivo.Last;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadMotivoRNC.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadMotivoRNC.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadMotivoRNC.BuscarNovoCodigo;
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_com) AS NovoCodigo FROM tabela_combos' +
                    ' WHERE tipo_com = 32';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         edtCodigo.Text:= '1';
      end
      else begin
         edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadMotivoRNC.ControlarAbas;
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

procedure TFormCadMotivoRNC.dbgTreinamentosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadMotivoRNC.dbgTreinamentosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctTreinamentos.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadMotivoRNC.edtMotivoExit(Sender: TObject);
begin
   TryFocus(btnGravar);
end;

procedure TFormCadMotivoRNC.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsMotivo.Locate('valo_com',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadMotivoRNC.FormShow(Sender: TObject);
begin
   pctTreinamentos.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
end;

procedure TFormCadMotivoRNC.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtCodigo.Enabled   := False;
   edtMotivo.Enabled   := Flag;
   dblProcessos.Enabled:= not Flag;

   pctTreinamentos.Pages[1].TabVisible:= not Flag;

   dbgTreinamentos.Enabled:= not Flag;
end;

procedure TFormCadMotivoRNC.LimparCampos;
begin
   edtCodigo.Clear;
   edtMotivo.Clear;
end;

procedure TFormCadMotivoRNC.pctTreinamentosChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadMotivoRNC.PreencherCampos;
begin
   with cdsMotivo do begin
      edtCodigo.Text   := FieldByName('codi_com').AsString;
      edtMotivo.Text:= FieldByName('valo_com').AsString;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadMotivoRNC.Impressao(tipoImp: string);
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
                    ' WHERE tipo_com = 32' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Imprimir('rel_listaTabelaCombos', frxReport1, tipoImp,
            'Titulo', 'LISTAGEM DE MOTIVOS DE RNC',
            'TituloDesc', 'Motivo de RNC');
end;

end.
