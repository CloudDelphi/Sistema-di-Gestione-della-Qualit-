unit frm_Perigos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet;

type
  TFormPerigos = class(TForm)
    pctLPAR: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl12: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtNumero: TEdit;
    edtAtividade: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgPerigos: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl11: TLabel;
    lbl17: TLabel;
    lblSignificativo: TLabel;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    lbl19: TLabel;
    dblProcesso: TDBLookupComboBox;
    lbl20: TLabel;
    zqryPerigos: TZQuery;
    dspPerigos: TDataSetProvider;
    cdsPerigos: TClientDataSet;
    dsPerigos: TDataSource;
    zqryResp: TZQuery;
    dspResp: TDataSetProvider;
    cdsResp: TClientDataSet;
    dsResp: TDataSource;
    zqryDanos: TZQuery;
    dspDanos: TDataSetProvider;
    cdsDanos: TClientDataSet;
    dsDanos: TDataSource;
    zqryTipoAtividade: TZQuery;
    dspTipoAtividade: TDataSetProvider;
    cdsTipoAtividade: TClientDataSet;
    dsTipoAtividade: TDataSource;
    cdsTipoAtividadecodi_com: TLargeintField;
    cdsTipoAtividadevalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    dtData: TDateEdit;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    edtGrau: TCurrencyEdit;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    tsLeis: TTabSheet;
    lbl8: TLabel;
    edtIdentLei: TEdit;
    edtDescLei: TEdit;
    lbl18: TLabel;
    dbgLeis: TDBGrid;
    btnAbrirLeis: TBitBtn;
    btnExcluirLei: TBitBtn;
    zqryLeis: TZQuery;
    dspLeis: TDataSetProvider;
    cdsLeis: TClientDataSet;
    dsLeis: TDataSource;
    btnInserirLei: TBitBtn;
    zqryLira: TZQuery;
    dspLira: TDataSetProvider;
    cdsLira: TClientDataSet;
    dsLira: TDataSource;
    cdsLiralir_codigo: TLargeintField;
    cdsLiralir_identificacao: TWideStringField;
    cdsLiralir_descricao: TWideStringField;
    cdsLeisDescRequisito: TStringField;
    lbl22: TLabel;
    edtNumPerigoLei: TEdit;
    lbl23: TLabel;
    edtAtividadeLei: TEdit;
    zqryEficaz: TZQuery;
    dspEficaz: TDataSetProvider;
    cdsEficaz: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsEficaz: TDataSource;
    frxReport1: TfrxReport;
    frxDBDSLPAR: TfrxDBDataset;
    cdsImprimirDescProbabilidade: TStringField;
    cdsImprimirGrauPerigo: TIntegerField;
    cdsImprimirSignificativo: TStringField;
    dblProcessoImp: TDBLookupComboBox;
    lbl24: TLabel;
    chkTodosProc: TCheckBox;
    frxDBLeis: TfrxDBDataset;
    tsImpactos: TTabSheet;
    lbl3: TLabel;
    dblRisco: TDBLookupComboBox;
    btnGravarImpacto: TBitBtn;
    btnExcluirImpacto: TBitBtn;
    dbgDanos: TDBGrid;
    lbl25: TLabel;
    edtNumRiscoDano: TEdit;
    edtAtividadeImp: TEdit;
    lbl26: TLabel;
    edtPerigo: TEdit;
    mmoControle: TMemo;
    lbl5: TLabel;
    dblTipoAtividade: TDBLookupComboBox;
    lbl13: TLabel;
    dblResponsavel: TDBLookupComboBox;
    grp1: TGroupBox;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    edtGrauReav: TCurrencyEdit;
    lbl21: TLabel;
    lblSignificativoReav: TLabel;
    mmoAdicionais: TMemo;
    lbl28: TLabel;
    dtDataReav: TDateEdit;
    lbl29: TLabel;
    lbl30: TLabel;
    dblRespReav: TDBLookupComboBox;
    cdsDanosdan_codigo: TIntegerField;
    cdsDanosdan_nome: TWideStringField;
    cdsDanosdan_descricao: TWideMemoField;
    cdsPerigoslis_numperigo: TIntegerField;
    cdsPerigoslis_atividade: TWideStringField;
    cdsPerigoslis_perigo: TWideStringField;
    cdsPerigoslis_tipo_atividade: TIntegerField;
    cdsPerigoslis_processo: TIntegerField;
    cdsPerigoslis_data: TDateTimeField;
    cdsPerigoslis_probabilidade: TIntegerField;
    cdsPerigoslis_gravidade: TIntegerField;
    cdsPerigoslis_responsavel: TIntegerField;
    cdsPerigoslis_controle: TWideMemoField;
    cdsPerigoslis_probabilidade_reav: TIntegerField;
    cdsPerigoslis_gravidade_reav: TIntegerField;
    cdsPerigoslis_data_reav: TDateTimeField;
    cdsPerigoslis_responsavel_reav: TIntegerField;
    cdsPerigoslis_controle_reav: TWideMemoField;
    edtProb: TEdit;
    edtGravidade: TEdit;
    cdsRespcodi_col: TLargeintField;
    cdsRespnome_col: TWideStringField;
    edtProbReav: TEdit;
    edtGravidadeReav: TEdit;
    zqryRespReav: TZQuery;
    dspRespReav: TDataSetProvider;
    cdsRespReav: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsRespReav: TDataSource;
    zqryDanosRiscos: TZQuery;
    dspDanosRiscos: TDataSetProvider;
    cdsDanosRiscos: TClientDataSet;
    dsDanosRiscos: TDataSource;
    cdsDanosRiscoslis_numdano: TIntegerField;
    cdsDanosRiscoslis_numperigo: TIntegerField;
    cdsDanosRiscosdan_nome: TWideStringField;
    cdsLeislis_numperigo: TIntegerField;
    cdsLeislir_identificacao: TWideStringField;
    cdsImprimirlis_numperigo: TIntegerField;
    cdsImprimirlis_atividade: TWideStringField;
    cdsImprimirlis_perigo: TWideStringField;
    cdsImprimirlis_tipo_atividade: TIntegerField;
    cdsImprimirlis_processo: TIntegerField;
    cdsImprimirlis_data: TDateTimeField;
    cdsImprimirlis_probabilidade: TIntegerField;
    cdsImprimirlis_gravidade: TIntegerField;
    cdsImprimirlis_responsavel: TIntegerField;
    cdsImprimirlis_controle: TWideMemoField;
    cdsImprimirlis_probabilidade_reav: TIntegerField;
    cdsImprimirlis_gravidade_reav: TIntegerField;
    cdsImprimirlis_data_reav: TDateTimeField;
    cdsImprimirlis_responsavel_reav: TIntegerField;
    cdsImprimirlis_controle_reav: TWideMemoField;
    cdsImprimirnome_pro: TWideStringField;
    cdsImprimirTipoAtividade: TStringField;
    cdsImprimirResponsavel: TStringField;
    cdsImprimirSignificativoReav: TStringField;
    cdsImprimirGrauPerigoReav: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
//    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure CalcularGrauRisco;
    procedure edtProbChange(Sender: TObject);
    procedure edtGravidadeChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgPerigosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPerigosCellClick(Column: TColumn);
    procedure dbgPerigosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctLPARChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtProbKeyPress(Sender: TObject; var Key: Char);
    function ValidarDados(): Boolean;
    function VerificarLeiGravada(): Boolean;
    function VerificarDanoGravado() : Boolean;
    procedure btnPMCClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure btnAbrirLeisClick(Sender: TObject);
    procedure tsLeisShow(Sender: TObject);
    procedure btnInserirLeiClick(Sender: TObject);
    procedure edtIdentLeiExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure cdsImprimirCalcFields(DataSet: TDataSet);
    procedure chkTodosProcClick(Sender: TObject);
    procedure btnExcluirLeiClick(Sender: TObject);
    procedure btnExcluirImpactoClick(Sender: TObject);
    procedure btnGravarImpactoClick(Sender: TObject);
    procedure mmoControleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    cOperacao: Char;
  public
    { Public declarations }
  end;

var
  FormPerigos: TFormPerigos;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_pesqLira,
  frm_CadPMCAbre;

{$R *.dfm}

procedure TFormPerigos.AtualizarDados;
begin
   cOperacao:= #0;

   with cdsPerigos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsResp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsRespReav do begin
      Active:= False;
      Active:= True;
   end;

   with cdsDanos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsTipoAtividade do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 30' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEficaz do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   if AllTrim(edtNumero.Text) <> EmptyStr then begin
      cdsPerigos.Locate('lis_numperigo',AllTrim(edtNumero.Text),[])
   end;
end;

procedure TFormPerigos.AtualizarDadosAcessorios;
begin
   if not (AllTrim(edtNumero.Text) = EmptyStr) then begin
      edtNumPerigoLei.Text:= edtNumero.Text;
      edtAtividadeLei.Text:= edtAtividade.Text;
      edtNumRiscoDano.Text:= edtNumero.Text;
      edtAtividadeImp.Text:= edtAtividade.Text;

      with cdsLeis do begin
         Active:= False;
         CommandText:= ' SELECT lis_numperigo, lir_identificacao' +
                       ' FROM lista_perigos_leis' +
                       ' WHERE lis_numperigo = ' + edtNumero.Text +
                       ' ORDER BY lir_identificacao';
         Active:= True;
      end;

      with cdsDanosRiscos do begin
         Active:= False;
         CommandText:= ' SELECT L.lis_numperigo, L.lis_numdano, D.dan_nome' +
                       ' FROM lista_perigos_danos L' +
                       ' INNER JOIN danos D ON D.dan_codigo = L.lis_numdano' +
                       ' WHERE lis_numperigo = ' + edtNumero.Text +
                       ' ORDER BY lis_numdano';
         Active:= True;
      end;
   end;
end;


procedure TFormPerigos.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsPerigos.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormPerigos.btnPMCClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      FormCadPMCAbre:= TFormCadPMCAbre.Create(nil);
      FormCadPMCAbre.ShowModal;
      FormCadPMCAbre.Release;
   end;
end;

procedure TFormPerigos.btnAbrirLeisClick(Sender: TObject);
begin
   AbrirForm(TFormPesqLira, FormPesqLira, 2);
end;

procedure TFormPerigos.btnGravarImpactoClick(Sender: TObject);
begin
   if VerificarDanoGravado() then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO lista_perigos_danos' +
                       ' (lis_numdano, lis_numperigo)' +
                       ' VALUES (' +
                       IntToStr(dblRisco.KeyValue) + ',' +
                       QuotedStr(edtNumRiscoDano.Text) +
                       ')';
         Execute;
      end;

      AtualizarDadosAcessorios();
      TryFocus(dblRisco);
   end;
end;

procedure TFormPerigos.btnExcluirImpactoClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM lista_perigos_danos' +
                       ' WHERE lis_numperigo = ' + cdsDanosRiscos.FieldByName('lis_numperigo').AsString +
                       ' AND lis_numdano = ' + cdsDanosRiscos.FieldByName('lis_numdano').AsString;
         Execute;
      end;

      Auditoria('LPAR - RISCOS/DANOS', cdsLeisDescRequisito.AsString, 'E', '');
      AtualizarDadosAcessorios();
   end;
end;

procedure TFormPerigos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormPerigos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
   chkTodosProc.Checked      := True;
   dblProcessoImp.Enabled    := False;
end;

procedure TFormPerigos.btnInserirLeiClick(Sender: TObject);
begin
   if VerificarLeiGravada() then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO lista_perigos_leis' +
                       ' (lir_identificacao, lis_numperigo)' +
                       ' VALUES (' +
                       QuotedStr(edtIdentLei.Text) + ',' +
                       edtNumPerigoLei.Text +
                       ')';
         Execute;
      end;

      AtualizarDadosAcessorios();
      TryFocus(edtIdentLei);
   end;
end;

procedure TFormPerigos.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 4, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 1,2,3);
      edtAtividade.SetFocus;
      Botoes(False);
      CalcularGrauRisco();
   end;
end;

procedure TFormPerigos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1,2,3);
end;

procedure TFormPerigos.btnExcluirClick(Sender: TObject);
var
   sLPAR: string;
begin
   if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sLPAR:= edtAtividade.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM Laaia' +
                          ' WHERE lai_numAspecto = ' + QuotedStr(edtNumero.Text);
            Execute;
         end;

         Auditoria('LPAR',sLPAR,'E','');
         LimparCampos(Self);
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormPerigos.btnExcluirLeiClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM lista_perigos_leis' +
                       ' WHERE lir_identificacao = ' + QuotedStr(cdsLeis.FieldByName('lir_identificacao').AsString) +
                       ' AND lis_numperigo = ' + cdsLeis.FieldByName('lis_numperigo').AsString;
         Execute;
      end;

      Auditoria('LPAR LEIS',cdsLeisDescRequisito.AsString, 'E', '');
      AtualizarDadosAcessorios();
   end;
end;

procedure TFormPerigos.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO lista_perigos(' +
                             ' lis_numperigo, lis_atividade, lis_perigo, lis_tipo_atividade,' +
                             ' lis_processo, lis_data, lis_probabilidade, lis_gravidade, lis_responsavel,' +
                             ' lis_controle, lis_probabilidade_reav, lis_gravidade_reav, lis_data_reav,' +
                             ' lis_responsavel_reav, lis_controle_reav ' +
                             ' )' +
                             ' VALUES(' +
                             QuotedStr(edtNumero.Text) + ',' +
                             QuotedStr(edtAtividade.Text) + ',' +
                             QuotedStr(edtPerigo.Text) + ',' +
                             QuotedStr(dblTipoAtividade.KeyValue) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             ArrumaDataSQL(dtData.Date) + ',' +
                             Nulo(edtProb.Text, 'I') + ',' +
                             Nulo(edtGravidade.Text, 'I') + ',' +
                             QuotedStr(dblResponsavel.KeyValue) + ',' +
                             QuotedStr(mmoControle.Text) + ',' +
                             Nulo(edtProbReav.Text, 'I') + ',' +
                             Nulo(edtGravidadeReav.Text, 'I') + ',' +
                             ArrumaDataSQL(dtDataReav.Date) + ',' +
                             QuotedStr(dblRespReav.KeyValue) + ',' +
                             QuotedStr(mmoAdicionais.Text) +
                             ')';
            end
            else begin
               CommandText:= ' UPDATE lista_perigos SET ' +
                             ' lis_atividade = ' + QuotedStr(edtAtividade.Text) + ',' +
                             ' lis_perigo = ' + QuotedStr(edtPerigo.Text) + ',' +
                             ' lis_tipo_atividade = ' + QuotedStr(dblTipoAtividade.KeyValue) + ',' +
                             ' lis_processo = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' lis_data = ' + ArrumaDataSQL(dtData.Date) + ',' +
                             ' lis_probabilidade = ' + Nulo(edtProb.Text, 'I') + ',' +
                             ' lis_gravidade = ' + Nulo(edtGravidade.Text, 'I') + ',' +
                             ' lis_responsavel = ' + QuotedStr(dblResponsavel.KeyValue) + ',' +
                             ' lis_controle = ' + QuotedStr(mmoControle.Text) + ',' +
                             ' lis_probabilidade_reav = ' + Nulo(edtProbReav.Text, 'I') + ',' +
                             ' lis_gravidade_reav = ' + Nulo(edtGravidadeReav.Text, 'I') + ',' +
                             ' lis_data_reav = ' + ArrumaDataSQL(dtDataReav.Date) + ',' +
                             ' lis_responsavel_reav = ' + QuotedStr(dblRespReav.KeyValue) + ',' +
                             ' lis_controle_reav = ' + QuotedStr(mmoAdicionais.Text) +
                             ' WHERE lis_numperigo = ' + QuotedStr(edtNumero.Text);
            end;
            Execute;
         end;

         Auditoria('LPAR', edtAtividade.Text, cOperacao, '');
         AtualizarDados();
         AtualizarDadosAcessorios();

         HabilitarCampos(False, False, Self, 1,2,3);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormPerigos.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 4, 'cadastro') = 1) then begin
      LimparCampos(Self);
      HabilitarCampos(True, True, Self, 1,2,3);
      lblSignificativo.Caption:= '';
      lblSignificativoReav.Caption:= '';
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      edtNumero.Text:= BuscarNovoCodigo('lista_perigos', 'lis_numperigo');
      edtAtividade.SetFocus;
      cOperacao:= 'I';
   end;
end;

procedure TFormPerigos.btnPrimeiroClick(Sender: TObject);
begin
   cdsPerigos.First;
   PreencherCampos;
end;

procedure TFormPerigos.btnAnteriorClick(Sender: TObject);
begin
   cdsPerigos.Prior;
   PreencherCampos;
end;

procedure TFormPerigos.btnProximoClick(Sender: TObject);
begin
   cdsPerigos.Next;
   PreencherCampos;
end;

procedure TFormPerigos.btnUltimoClick(Sender: TObject);
begin
   cdsPerigos.Last;
   PreencherCampos;
end;

procedure TFormPerigos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormPerigos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormPerigos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormPerigos.CalcularGrauRisco;
begin
   if (edtProb.Text <> '') and (edtGravidade.Text <> '') then begin
      edtGrau.Value:= StrToFloat(edtProb.Text) * StrToFloat(edtGravidade.Text);

      if edtGrau.Value <= 9 then begin
         lblSignificativo.Caption:= 'NÃO';
      end
      else begin
         lblSignificativo.Caption:= 'SIM';
      end;
   end;

   if (edtProbReav.Text <> '') and (edtGravidadeReav.Text <> '') then begin
      edtGrauReav.Value:= StrToFloat(edtProbReav.Text) * StrToFloat(edtGravidadeReav.Text);

      if edtGrauReav.Value <= 9 then begin
         lblSignificativoReav.Caption:= 'NÃO';
      end
      else begin
         lblSignificativoReav.Caption:= 'SIM';
      end;
   end;
end;

procedure TFormPerigos.cdsImprimirCalcFields(DataSet: TDataSet);
begin
   cdsImprimirGrauPerigo.AsInteger:= cdsImprimir.FieldByName('lis_probabilidade').AsInteger * cdsImprimir.FieldByName('lis_gravidade').AsInteger;
   cdsImprimirGrauPerigoReav.AsInteger:= cdsImprimir.FieldByName('lis_probabilidade_reav').AsInteger * cdsImprimir.FieldByName('lis_gravidade_reav').AsInteger;

   if cdsImprimirGrauPerigo.AsInteger <= 9 then begin
      cdsImprimirSignificativo.AsString:= 'NÃO';
   end
   else begin
      cdsImprimirSignificativo.AsString:= 'SIM';
   end;

   if cdsImprimirGrauPerigoReav.AsInteger <= 9 then begin
      cdsImprimirSignificativoReav.AsString:= 'NÃO';
   end
   else begin
      cdsImprimirSignificativoReav.AsString:= 'SIM';
   end;
end;

procedure TFormPerigos.chkTodosProcClick(Sender: TObject);
begin
   dblProcessoImp.Enabled:= not chkTodosProc.Checked;
end;

procedure TFormPerigos.ControlarAbas;
begin
      if pctLPAR.TabIndex = 0 then begin  // Cadastro
         Botoes(True);
      end
      else begin // Pesquisa
         if cdsPerigos.RecordCount > 0 then begin
            btnNovo.Enabled:= False;
            btnGravar.Enabled:= False;
            btnExcluir.Enabled:= False;
            btnCancelar.Enabled:= False;
            btnImprimir.Enabled:= False;
            btnAlterar.Enabled:= False;

            edtNumRiscoDano.Text := edtNumero.Text;
            edtAtividadeImp.Text := edtAtividade.Text;

            if pctLPAR.TabIndex = 3 then begin
               edtValor.Clear;
               TryFocus(edtValor);
            end;
         end
         else begin
            if pctLPAR.TabIndex <> 3 then begin
               Application.MessageBox('Não há nenhum perigo cadastrado. Riscos/Danos e ' +
                                      ' Leis só podem ser cadastrados para um perigo cadastrado anteriormente',
                                      'Aviso', MB_OK + MB_ICONWARNING);
               btnCancelarClick(Self);
               pctLPAR.TabIndex:= 0;
            end;
         end;

      end;

end;

procedure TFormPerigos.dbgPerigosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormPerigos.dbgPerigosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctLPAR.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormPerigos.dbgPerigosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormPerigos.edtGravidadeChange(Sender: TObject);
begin
   CalcularGrauRisco();
end;

procedure TFormPerigos.edtIdentLeiExit(Sender: TObject);
begin
   // Busca a descrição da lei
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT lir_descricao' +
                    ' FROM lira' +
                    ' WHERE lir_identificacao = ' + QuotedStr(AllTrim(edtIdentLei.Text));
      Active:= True;

      edtDescLei.Text:= FieldByName('lir_descricao').AsString;
   end;
end;

procedure TFormPerigos.edtProbChange(Sender: TObject);
begin
   CalcularGrauRisco();
end;

procedure TFormPerigos.edtProbKeyPress(Sender: TObject; var Key: Char);
begin
   if not(Key in ['1','3','9',#8,#13])  then begin
      Key:= #0;
   end;
end;

procedure TFormPerigos.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsPerigos.Locate('lis_atividade', edtValor.Text, [loPartialKey]);
//      0: cdsLaaia.Filter:= 'LAI_ATIVIDADE LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

//   cdsLaaia.Filtered:= True;
end;

procedure TFormPerigos.FormShow(Sender: TObject);
begin
   pctLPAR.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   AtualizarDadosAcessorios();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1,2,3);
   pnlImprimir.Visible:= False;

   edtProb.Hint:= 'Valores possíveis: ' + #13 +
                  '1, 3 ou 9';
   edtGravidade.Hint:= 'Valores possíveis: ' + #13 +
                       '1, 3 ou 9';
   mmoControle.Hint:= ' Considerar a seguinte hierarquia: ' + #13 +
                      ' a) Eliminação;' + #13 +
                      ' b) Substituição' + #13 +
                      ' c) Controles de Engenharia' + #13 +
                      ' d) Sinalização/Avisos ou controles administrativos' + #13 +
                      ' e) EPI';
end;

procedure TFormPerigos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Identificação
      sCampoOrdem:= 'lis_numperigo'
   end
   else begin // Descrição do Requisito
      sCampoOrdem:= 'lis_atividade'
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT lis_numperigo, lis_atividade, lis_perigo, lis_tipo_atividade, ' +
                    ' lis_processo, lis_data, lis_probabilidade, lis_gravidade,' +
                    ' lis_responsavel, lis_controle, lis_probabilidade_reav, lis_gravidade_reav, ' +
                    ' lis_data_reav, lis_responsavel_reav, lis_controle_reav, nome_pro' +
                    ' FROM lista_perigos L' +
                    ' INNER JOIN Processos P ON P.codi_pro = L.lis_processo';
      if chkTodosProc.Checked = False then begin
         CommandText:= CommandText + ' WHERE lis_processo = ' + IntToStr(dblProcessoImp.KeyValue);
      end;

      CommandText:= CommandText + ' ORDER BY nome_pro, ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_LPAR.fr3');
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

procedure TFormPerigos.mmoControleKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormPerigos.pctLPARChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormPerigos.PreencherCampos;
begin
   with cdsPerigos do begin
      edtNumero.Text    := FieldByName('lis_numperigo').AsString;
      edtAtividade.Text := FieldByName('lis_atividade').AsString;
      edtPerigo.Text    := FieldByName('lis_perigo').AsString;

      if FieldByName('lis_probabilidade').AsInteger > 0 then begin
         edtProb.Text   := FieldByName('lis_probabilidade').AsString;
      end
      else begin
         edtProb.Clear;
      end;

      if FieldByName('lis_gravidade').AsInteger > 0 then begin
         edtGravidade.Text   := FieldByName('lis_gravidade').AsString;
      end
      else begin
         edtGravidade.Clear;
      end;
      dtData.Date       := FieldByName('lis_data').AsDateTime;
      mmoControle.Text  := FieldByName('lis_controle').AsString;

      if FieldByName('lis_probabilidade_reav').AsInteger > 0 then begin
         edtProbReav.Text   := FieldByName('lis_probabilidade_reav').AsString;
      end
      else begin
         edtProbReav.Clear;
      end;

      if FieldByName('lis_gravidade_reav').AsInteger > 0 then begin
         edtGravidadeReav.Text   := FieldByName('lis_gravidade_reav').AsString;
      end
      else begin
         edtGravidadeReav.Clear;
      end;
      dtDataReav.Date       := FieldByName('lis_data_reav').AsDateTime;
      mmoAdicionais.Text    := FieldByName('lis_controle_reav').AsString;

      if FieldByName('lis_tipo_atividade').AsString <> EmptyStr then begin
         dblTipoAtividade.KeyValue:= FieldByName('lis_tipo_atividade').AsString;
      end;

      if FieldByName('lis_processo').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('lis_processo').AsString;
      end;

      if FieldByName('lis_responsavel').AsString <> EmptyStr then begin
         dblResponsavel.KeyValue:= FieldByName('lis_responsavel').AsString;
      end;

      if FieldByName('lis_responsavel').AsString <> EmptyStr then begin
         dblRespReav.KeyValue:= FieldByName('lis_responsavel').AsString;
      end;

      // Aba Impactos Ambientais e aba Leis
      if (pctLPAR.TabIndex = 1) or (pctLPAR.TabIndex = 2) then begin
         AtualizarDadosAcessorios();
      end;

   end;
end;

procedure TFormPerigos.tsLeisShow(Sender: TObject);
begin
   AtualizarDadosAcessorios();
end;

function TFormPerigos.ValidarDados(): Boolean;
begin
   if AllTrim(edtAtividade.Text) = EmptyStr then begin
      Application.MessageBox('Campo Atividades, Produtos ou Serviços é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtAtividade);
      Result:= False;
      Exit;
   end;

   if AllTrim(edtPerigo.Text) = EmptyStr then begin
      Application.MessageBox('Campo Perigo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtPerigo);
      Result:= False;
      Exit;
   end;

   if dblTipoAtividade.KeyValue = -1 then begin
      Application.MessageBox('Campo Tipo de Atividade é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTipoAtividade);
      Result:= False;
      Exit;
   end;

   if dblProcesso.KeyValue = -1 then begin
      Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if dtData.Text = '  /  /    ' then begin
      Application.MessageBox('Campo Data é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dtData);
      Result:= False;
      Exit;
   end;

   if edtProb.Text = '' then begin
      Application.MessageBox('Campo Probabilidade é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtProb);
      Result:= False;
      Exit;
   end;

   if edtGravidade.Text = '' then begin
      Application.MessageBox('Campo Gravidade é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtGravidade);
      Result:= False;
      Exit;
   end;

   if dblResponsavel.KeyValue = -1 then begin
      Application.MessageBox('Campo Responsável é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblResponsavel);
      Result:= False;
      Exit;
   end;

   if mmoControle.Text = '' then begin
      Application.MessageBox('Campo Controle Operacional é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoControle);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormPerigos.VerificarDanoGravado: Boolean;
begin
   // Verifica campo em branco
   if (dblRisco.KeyValue = -1) or (dblRisco.KeyValue = null) then begin
      Application.MessageBox('Campo Risco/Dano é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblRisco);
      Result:= False;
      Exit;
   end;

   // Verifica se o risco já foi gravado para o perigo
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as QtdeGravada' +
                    ' FROM lista_perigos_danos' +
                    ' WHERE lis_numdano = ' + IntToStr(dblRisco.KeyValue) +
                    ' AND lis_numperigo = ' + edtNumero.Text;
      Active:= True;

      if FieldByName('QtdeGravada').AsInteger > 0 then begin
         Application.MessageBox('Risco/Dano já cadastrado para esse perigo', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblRisco);
         Result:= False;
      end
      else begin
         Result:= True;
      end;
   end;
end;

function TFormPerigos.VerificarLeiGravada: Boolean;
begin
   // Verifica campo em branco
   if AllTrim(edtIdentLei.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdentLei);
      Result:= False;
      Exit;
   end;

   // Verifica se existe a identificação digitada
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as QtdeIdentLei' +
                    ' FROM lira' +
                    ' WHERE lir_identificacao = ' + QuotedStr(AllTrim(edtIdentLei.Text));
      Active:= True;

      if FieldByName('QtdeIdentLei').AsInteger = 0 then begin
         edtDescLei.Clear;
         Application.MessageBox('Lei não cadastrada, Verifique !', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtIdentLei);
         Result:= False;
         Exit;
      end;
   end;

   // Verifica se a lei já foi gravada para o perigo
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as QtdeGravada' +
                    ' FROM lista_perigos_leis' +
                    ' WHERE lir_identificacao = ' + QuotedStr(AllTrim(edtIdentLei.Text)) +
                    ' AND lis_numperigo = ' + edtNumPerigoLei.Text;
      Active:= True;

      if FieldByName('QtdeGravada').AsInteger > 0 then begin
         Application.MessageBox('Lei já cadastrada para esse perigo', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtIdentLei);
         Result:= False;
      end
      else begin
         Result:= True;
      end;
   end;
end;

end.
