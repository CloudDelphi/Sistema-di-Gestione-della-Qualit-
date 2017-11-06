unit frm_CadProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, JvExExtCtrls, JvExtComponent, JvPanel, jpeg,
  dxGDIPlusClasses;

type
  TFormCadProcessos = class(TForm)
    pctProcessos: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgClientes: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
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
    zqryClassificacao: TZQuery;
    dspClassificacao: TDataSetProvider;
    cdsClassificacao: TClientDataSet;
    dsClassificacao: TDataSource;
    zqryGestor: TZQuery;
    dspGestor: TDataSetProvider;
    cdsGestor: TClientDataSet;
    dsGestor: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cdsClassificacaocodi_com: TLargeintField;
    cdsClassificacaovalo_com: TWideStringField;
    frxReport1: TfrxReport;
    frxDBDSProcessos: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl2: TLabel;
    lbl8: TLabel;
    lbl3: TLabel;
    lbl6: TLabel;
    dblClassificacao: TDBLookupComboBox;
    edtNomeProcesso: TEdit;
    mmoEntradas: TMemo;
    mmoSaidas: TMemo;
    dblGestor: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    mmoRequisitos: TMemo;
    lbl1: TLabel;
    cdsProcessosclas_pro: TLargeintField;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosfunc_pro: TLargeintField;
    cdsProcessosgest_pro: TLargeintField;
    cdsProcessosinfr_pro: TMemoField;
    cdsProcessosnome_pro: TWideStringField;
    cdsImprimirclas_pro: TLargeintField;
    cdsImprimircodi_pro: TLargeintField;
    cdsImprimirentr_pro: TMemoField;
    cdsImprimirfunc_pro: TLargeintField;
    cdsImprimirgest_pro: TLargeintField;
    cdsImprimirinfr_pro: TMemoField;
    cdsImprimirnome_pro: TWideStringField;
    cdsImprimirrequ_pro: TMemoField;
    cdsImprimirsaid_pro: TMemoField;
    cdsGestorcodi_col: TLargeintField;
    cdsGestornome_col: TWideStringField;
    cdsProcessosDescClassificacao: TStringField;
    cdsProcessosDescGestor: TStringField;
    cdsImprimirDescClassificacao: TStringField;
    cdsImprimirnome_col: TWideStringField;
    cdsProcessosentr_pro: TWideMemoField;
    cdsProcessosrequ_pro: TWideMemoField;
    cdsProcessossaid_pro: TWideMemoField;
    tsES: TTabSheet;
    img1: TImage;
    lbl12: TLabel;
    dblProcessosAnt: TDBLookupComboBox;
    dbgProcessosAntecedentes: TDBGrid;
    dblProcessosSub: TDBLookupComboBox;
    lbl5: TLabel;
    zqryProcessoAnt: TZQuery;
    dspProcessoAnt: TDataSetProvider;
    cdsProcessoAnt: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField1: TWideStringField;
    dsProcessoAnt: TDataSource;
    zqryProcessoSub: TZQuery;
    dspProcessoSub: TDataSetProvider;
    cdsProcessoSub: TClientDataSet;
    LargeintField6: TLargeintField;
    WideStringField2: TWideStringField;
    dsProcessoSub: TDataSource;
    dbgProcessosSubsequentes: TDBGrid;
    img2: TImage;
    jvpnlProcesso: TJvPanel;
    btnInserirAnt: TBitBtn;
    btnExcluirAnt: TBitBtn;
    zqryProcessoAntLista: TZQuery;
    dspProcessoAntLista: TDataSetProvider;
    cdsProcessoAntLista: TClientDataSet;
    dsProcessoAntLista: TDataSource;
    zqryProcessoSubLista: TZQuery;
    dspProcessoSubLista: TDataSetProvider;
    cdsProcessoSubLista: TClientDataSet;
    dsProcessoSubLista: TDataSource;
    cdsProcessoAntListaant_codigo: TIntegerField;
    cdsProcessoAntListapro_codigo: TIntegerField;
    cdsProcessoAntListanome_pro: TWideStringField;
    cdsProcessoSubListasub_codigo: TIntegerField;
    cdsProcessoSubListapro_codigo: TIntegerField;
    cdsProcessoSubListanome_pro: TWideStringField;
    btnInserirSub: TBitBtn;
    btnExcluirSub: TBitBtn;
    cdsProcessospro_exibelista: TWideStringField;
    lbl7: TLabel;
    edtNomeAbrev: TEdit;
    cdsProcessospro_nome_abreviado: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure BuscarNovoCodigo;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgClientesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctProcessosChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure mmoEntradasKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoEntradasExit(Sender: TObject);
    procedure mmoSaidasExit(Sender: TObject);
    procedure mmoRequisitosExit(Sender: TObject);
    procedure btnInserirAntClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure btnExcluirAntClick(Sender: TObject);
    procedure btnInserirSubClick(Sender: TObject);
    procedure btnExcluirSubClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadProcessos: TFormCadProcessos;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadProcessos.AtualizarDados;
begin
   with cdsClassificacao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 9' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsGestor do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col FROM colaboradores '+
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      CommandText:= ' SELECT clas_pro, codi_pro, entr_pro, func_pro, gest_pro, ' +
                    ' infr_pro, nome_pro, requ_pro, said_pro, pro_exibelista, ' +
                    ' pro_nome_abreviado' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsProcessoAnt do begin
      Active:= False;
      Active:= True;
   end;

   with cdsProcessoSub do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(cdsProcessoscodi_pro.AsString) <> EmptyStr then begin
      cdsProcessos.Locate('nome_pro', edtNomeProcesso.Text,[])
   end;
end;

procedure TFormCadProcessos.AtualizarDadosAcessorios;
begin
   with cdsProcessoAntLista do begin
      Active:= False;
      CommandText:= ' SELECT ant_codigo, pro_codigo, P.nome_pro' +
                    ' FROM processos_antecedentes' +
                    ' INNER JOIN processos P ON P.codi_pro = ant_codigo' +
                    ' WHERE pro_codigo = ' + cdsProcessos.FieldByName('codi_pro').AsString +
                    ' ORDER BY nome_pro';
      Active:= True;

      btnExcluirAnt.Enabled:= RecordCount > 0;
   end;

   with cdsProcessoSubLista do begin
      Active:= False;
      CommandText:= ' SELECT sub_codigo, pro_codigo, P.nome_pro' +
                    ' FROM processos_subsequentes' +
                    ' INNER JOIN processos P ON P.codi_pro = sub_codigo' +
                    ' WHERE pro_codigo = ' + cdsProcessos.FieldByName('codi_pro').AsString +
                    ' ORDER BY nome_pro';
      Active:= True;

      btnExcluirSub.Enabled:= RecordCount > 0;
   end;
end;

procedure TFormCadProcessos.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsProcessos.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadProcessos.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 2, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtNomeProcesso);
      Botoes(False);
   end;
end;

procedure TFormCadProcessos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadProcessos.btnExcluirAntClick(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' DELETE FROM processos_antecedentes' +
                    ' WHERE ant_codigo = ' + cdsProcessoAntLista.FieldByName('ant_codigo').AsString +
                    ' AND pro_codigo = ' + cdsProcessos.FieldByName('codi_pro').AsString;
      Execute;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnExcluirClick(Sender: TObject);
var
   sCodProcesso: string;
   sDescProcesso: string;
begin
   if (Acesso(cUsuario, 2, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodProcesso:= cdsProcessoscodi_pro.AsString;
         sDescProcesso:= cdsProcessosnome_pro.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM processos' +
                          ' WHERE codi_pro = ' + sCodProcesso;
            Execute;
         end;

         Auditoria('CADASTRO DE PROCESSOS',sDescProcesso,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadProcessos.btnExcluirSubClick(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' DELETE FROM processos_subsequentes' +
                    ' WHERE sub_codigo = ' + cdsProcessoSubLista.FieldByName('sub_codigo').AsString +
                    ' AND pro_codigo = ' + cdsProcessos.FieldByName('codi_pro').AsString;
      Execute;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO processos (' +
                             ' codi_pro, nome_pro, clas_pro, entr_pro, said_pro, ' +
                             ' requ_pro, pro_exibelista, pro_nome_abreviado ';
                          if dblGestor.KeyValue <> -1 then begin
                             CommandText:= CommandText + ', gest_pro ';
                          end;

                             CommandText:= CommandText + ' )' +
                             ' VALUES(' +
                             sNovoCodigo + ',' +
                             QuotedStr(edtNomeProcesso.Text) + ',' +
                             QuotedStr(dblClassificacao.KeyValue) + ',' +
                             QuotedStr(mmoEntradas.Text) + ',' +
                             QuotedStr(mmoSaidas.Text) + ',' +
                             QuotedStr(mmoRequisitos.Text) + ',' +
                             QuotedStr('S') + ',' +
                             QuotedStr(edtNomeAbrev.Text);
                          if dblGestor.KeyValue <> -1 then begin
                             CommandText:= CommandText + ',' + QuotedStr(dblGestor.KeyValue);
                          end;
                             CommandText:= CommandText + ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE processos SET' +
                             ' nome_pro = ' + QuotedStr(edtNomeProcesso.Text) + ',' +
                             ' clas_pro = ' + QuotedStr(dblClassificacao.KeyValue) + ',' +
                             ' entr_pro = ' + QuotedStr(mmoEntradas.Text) + ',' +
                             ' said_pro = ' + QuotedStr(mmoSaidas.Text) + ',' +
                             ' requ_pro = ' + QuotedStr(mmoRequisitos.Text) + ',' +
                             ' pro_nome_abreviado = ' + QuotedStr(edtNomeAbrev.Text);
                          if dblGestor.KeyValue <> -1 then begin
                             CommandText:= CommandText + ',' + ' gest_pro = ' + QuotedStr(dblGestor.KeyValue);
                          end;
                             CommandText:= CommandText + ' WHERE codi_pro = ' + cdsProcessoscodi_pro.Asstring;
               Execute;
            end;
         end;

         Auditoria('CADASTRO DE PROCESSOS',edtNomeProcesso.Text,cOperacao,'');
         AtualizarDados();

         HabilitarCampos(False, False);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadProcessos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadProcessos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
end;

procedure TFormCadProcessos.btnInserirAntClick(Sender: TObject);
begin
   // Verifica se a habilidade já foi cadastrada
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM processos_antecedentes' +
                    ' WHERE ant_codigo = ' + IntToStr(dblProcessosAnt.KeyValue) +
                    ' AND pro_codigo = ' + cdsProcessos.FieldByName('codi_pro').AsString;
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox(PChar('Processo ' + dblProcessosAnt.Text + ' já cadastrado'), 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   // Verifica se a processo é o mesmo atual
   if IntToStr(dblProcessosAnt.KeyValue) = cdsProcessos.FieldByName('codi_pro').AsString then begin
      Application.MessageBox(PChar('Não é possível cadastrar o mesmo processo como Antecedente ou Subsequente'), 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' INSERT INTO processos_antecedentes(' +
                    ' ant_codigo, pro_codigo)' +
                    ' VALUES (' +
                    IntToStr(dblProcessosAnt.KeyValue) + ',' +
                    cdsProcessos.FieldByName('codi_pro').AsString +
                    ')';
      Execute;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnInserirSubClick(Sender: TObject);
begin
   // Verifica se a processo já foi cadastrado
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM processos_subsequentes' +
                    ' WHERE sub_codigo = ' + IntToStr(dblProcessosSub.KeyValue) +
                    ' AND pro_codigo = ' + cdsProcessos.FieldByName('codi_pro').AsString;
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox(PChar('Processo ' + dblProcessosSub.Text + ' já cadastrado'), 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   // Verifica se a processo é o mesmo atual
   if IntToStr(dblProcessosSub.KeyValue) = cdsProcessos.FieldByName('codi_pro').AsString then begin
      Application.MessageBox(PChar('Não é possível cadastrar o mesmo processo como Antecedente ou Subsequente'), 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' INSERT INTO processos_subsequentes(' +
                    ' sub_codigo, pro_codigo)' +
                    ' VALUES (' +
                    IntToStr(dblProcessosSub.KeyValue) + ',' +
                    cdsProcessos.FieldByName('codi_pro').AsString +
                    ')';
      Execute;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 2, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      TryFocus(edtNomeProcesso);
   end;
end;

procedure TFormCadProcessos.btnPrimeiroClick(Sender: TObject);
begin
   cdsProcessos.First;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnAnteriorClick(Sender: TObject);
begin
   cdsProcessos.Prior;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnProximoClick(Sender: TObject);
begin
   cdsProcessos.Next;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnUltimoClick(Sender: TObject);
begin
   cdsProcessos.Last;
   PreencherCampos;
   AtualizarDadosAcessorios();
end;

procedure TFormCadProcessos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadProcessos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadProcessos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadProcessos.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_pro) AS NovoCodigo FROM processos' +
                    ' WHERE codi_pro < 90';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadProcessos.ControlarAbas;
begin
   case pctProcessos.TabIndex of
      0: begin  // Cadastro
         Botoes(True);
         PreencherCampos();
      end;
      1: begin
         AtualizarDadosAcessorios();
         btnNovo.Enabled    := False;
         btnGravar.Enabled  := False;
         btnExcluir.Enabled := False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled := False;
      end;
      2: begin // Pesquisa
         btnNovo.Enabled    := False;
         btnGravar.Enabled  := False;
         btnExcluir.Enabled := False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled := False;

         if pctProcessos.TabIndex = 1 then begin
            edtValor.Clear;
            TryFocus(edtValor);
         end;
      end;
   end;
end;

procedure TFormCadProcessos.dbgClientesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadProcessos.dbgClientesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctProcessos.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadProcessos.dbgClientesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadProcessos.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsProcessos.Locate('nome_pro', edtValor.Text, [loPartialKey]);
//      0: cdsLaaia.Filter:= 'LAI_ATIVIDADE LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

//   cdsLaaia.Filtered:= True;
end;

procedure TFormCadProcessos.FormShow(Sender: TObject);
begin
   dblClassificacao.Hint:= 'POC - Processo Orientado ao Cliente' + #13 +
                           'PAP - Processo de Apoio ' + #13 +
                           'PCH - Processo Chave ';
   dblClassificacao.ShowHint:= True;

   pctProcessos.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
end;

procedure TFormCadProcessos.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtNomeProcesso.Enabled := Flag;
   dblClassificacao.Enabled:= Flag;
   dblGestor.Enabled       := Flag;
   mmoEntradas.Enabled     := Flag;
   mmoSaidas.Enabled       := Flag;
   mmoRequisitos.Enabled   := Flag;
   edtNomeAbrev.Enabled    := Flag;

   pctProcessos.Pages[1].TabVisible:= not Flag;
end;

procedure TFormCadProcessos.LimparCampos;
begin
   edtNomeProcesso.Clear;
   dblClassificacao.KeyValue:= -1;
   dblGestor.KeyValue:= -1;
   mmoEntradas.Clear;
   mmoSaidas.Clear;
   mmoRequisitos.Clear;
   edtNomeAbrev.Clear;
end;

procedure TFormCadProcessos.mmoSaidasExit(Sender: TObject);
begin
   mmoSaidas.Text:= AcertaUpper(mmoSaidas.Text);
end;

procedure TFormCadProcessos.mmoEntradasExit(Sender: TObject);
begin
   mmoEntradas.Text:= AcertaUpper(mmoEntradas.Text);
end;

procedure TFormCadProcessos.mmoEntradasKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadProcessos.mmoRequisitosExit(Sender: TObject);
begin
   mmoRequisitos.Text:= AcertaUpper(mmoRequisitos.Text);
end;

procedure TFormCadProcessos.pctProcessosChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadProcessos.PreencherCampos;
begin
   with cdsProcessos do begin
      edtNomeProcesso.Text:= FieldByName('nome_pro').AsString;
      mmoEntradas.Text    := FieldByName('entr_pro').AsString;
      mmoSaidas.Text      := FieldByName('said_pro').AsString;
      mmoRequisitos.Text  := FieldByName('requ_pro').AsString;
      edtNomeAbrev.Text   := FieldByName('pro_nome_abreviado').AsString;

      if FieldByName('clas_pro').AsString <> EmptyStr then begin
         dblClassificacao.KeyValue:= FieldByName('clas_pro').AsString;
      end;
      if FieldByName('gest_pro').AsString <> EmptyStr then begin
         dblGestor.KeyValue:= FieldByName('gest_pro').AsString;
      end
      else begin
         dblGestor.KeyValue:= -1;
      end;

      jvpnlProcesso.Caption:= FieldByName('nome_pro').AsString;
   end;
end;

function TFormCadProcessos.ValidarDados(): Boolean;
begin
   if AllTrim(edtNomeProcesso.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome do Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtNomeProcesso);
      Result:= False;
      Exit;
   end;

   if dblClassificacao.KeyValue = -1 then begin
      Application.MessageBox('Campo Classificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblClassificacao);
      Result:= False;
      Exit;
   end;

   if AllTrim(mmoEntradas.Text) = EmptyStr then begin
      Application.MessageBox('Campo Entradas é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoEntradas);
      Result:= False;
      Exit;
   end;

   if AllTrim(mmoSaidas.Text) = EmptyStr then begin
      Application.MessageBox('Campo Saídas é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoSaidas);
      Result:= False;
      Exit;
   end;

   if AllTrim(mmoRequisitos.Text) = EmptyStr then begin
      Application.MessageBox('Campo Requisitos é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoRequisitos);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadProcessos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'nome_pro';
   end
   else begin
      sCampoOrdem:= 'nome_col';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT clas_pro, codi_pro, entr_pro, func_pro, gest_pro, ' +
                    ' infr_pro, nome_pro, requ_pro, said_pro, C.nome_col' +
                    ' FROM processos P' +
                    ' LEFT JOIN colaboradores C ON C.codi_col = P.gest_pro' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaProcessos.fr3');
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
