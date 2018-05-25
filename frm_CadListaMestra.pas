unit frm_CadListaMestra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadListaMestra = class(TForm)
    pctListaMestra: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgListaMestra: TDBGrid;
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
    zqryResponsavel: TZQuery;
    dspResponsavel: TDataSetProvider;
    cdsResponsavel: TClientDataSet;
    dsResponsavel: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryListaMestra: TZQuery;
    dspListaMestra: TDataSetProvider;
    cdsListaMestra: TClientDataSet;
    dsListaMestra: TDataSource;
    frxReport1: TfrxReport;
    frxDBListaMestra: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    edtRevisao: TEdit;
    dblTipo: TDBLookupComboBox;
    lbl5: TLabel;
    edtIdentificacao: TEdit;
    lbl1: TLabel;
    edtDescricao: TEdit;
    lbl3: TLabel;
    edtAtualizacao: TEdit;
    lbl4: TLabel;
    edtCaminho: TEdit;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    lbl7: TLabel;
    dblResponsavel: TDBLookupComboBox;
    cdsListaMestracodi_lis: TLargeintField;
    cdsListaMestraiden_lis: TWideStringField;
    cdsListaMestradesc_lis: TWideStringField;
    cdsListaMestrarevi_lis: TWideStringField;
    cdsListaMestratipo_lis: TLargeintField;
    cdsListaMestraatua_lis: TWideStringField;
    cdsListaMestraresp_lis: TLargeintField;
    cdsResponsavelcodi_fun: TLargeintField;
    cdsResponsaveldesc_fun: TWideStringField;
    lbl8: TLabel;
    cdsListaMestraapro_lis: TWideStringField;
    lblAprovado: TLabel;
    shpAprovado: TShape;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    dspTipo: TDataSetProvider;
    zqryTipo: TZQuery;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    opd1: TOpenDialog;
    cdsImprimircodi_lis: TLargeintField;
    cdsImprimiriden_lis: TWideStringField;
    cdsImprimirdesc_lis: TWideStringField;
    cdsImprimirrevi_lis: TWideStringField;
    cdsImprimirtipo_lis: TLargeintField;
    cdsImprimiratua_lis: TWideStringField;
    cdsImprimirarqu_lis: TMemoField;
    cdsImprimirproc_lis: TLargeintField;
    cdsImprimirresp_lis: TLargeintField;
    cdsImprimirdata_lis: TDateTimeField;
    cdsImprimirapro_lis: TWideStringField;
    cdsImprimirdtap_lis: TDateTimeField;
    cdsImprimirquem_lis: TLargeintField;
    cdsImprimirqtde_lis: TLargeintField;
    cdsImprimirarma_lis: TWideStringField;
    cdsImprimirprocesso: TWideStringField;
    cdsImprimirlis_qtd: TLargeintField;
    tsLocais: TTabSheet;
    lbl11: TLabel;
    edtIdenLocais: TEdit;
    edtRevisaoLocais: TEdit;
    lbl12: TLabel;
    lbl13: TLabel;
    edtDescLocais: TEdit;
    dblProcessos: TDBLookupComboBox;
    spnQtd: TRxSpinEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    dbgCurriculo: TDBGrid;
    btnInserirLocal: TBitBtn;
    btnExcluirTreinamento: TBitBtn;
    zqryLocais: TZQuery;
    dspLocais: TDataSetProvider;
    cdsLocais: TClientDataSet;
    cdsLocaislis_codiProcesso: TLargeintField;
    cdsLocaislis_codiDocumento: TLargeintField;
    cdsLocaislis_qtd: TLargeintField;
    cdsLocaisnome_pro: TWideStringField;
    dsLocais: TDataSource;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cdsListaMestratipo: TStringField;
    Label1: TLabel;
    dblTreinamento: TDBLookupComboBox;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    cdsListaMestralis_treinamento: TIntegerField;
    cdsListaMestraarqu_lis: TWideMemoField;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    rgTipoDoc: TRadioGroup;
    cdsImprimirlis_treinamento: TIntegerField;
    cdsImprimirtipo: TWideMemoField;
    btnTreinamento: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    btnExcel: TBitBtn;
    zqryExcel: TZQuery;
    dspExcel: TDataSetProvider;
    cdsExcel: TClientDataSet;
    dsExcel: TDataSource;
    dbgExcel: TDBGrid;
    rgPesqTipo: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgListaMestraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgListaMestraCellClick(Column: TColumn);
    procedure dbgListaMestraDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctListaMestraChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure dblTipoCloseUp(Sender: TObject);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure btnInserirLocalClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure btnExcluirTreinamentoClick(Sender: TObject);
    procedure GravarTreinamento();
    procedure btnTreinamentoClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure rgPesqTipoClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
  public
    { Public declarations }
  end;

var
  FormCadListaMestra: TFormCadListaMestra;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadListaMestra.AtualizarDados;
begin
   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 16' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsTreinamentos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsResponsavel do begin
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

   with cdsListaMestra do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtIdentificacao.Text) <> EmptyStr then begin
      cdsListaMestra.Locate('iden_lis', edtIdentificacao.Text,[])
   end;
end;

procedure TFormCadListaMestra.AtualizarDadosAcessorios;
begin
   edtIdenLocais.Text   := edtIdentificacao.Text;
   edtRevisaoLocais.Text:= edtRevisao.Text;
   edtDescLocais.Text   := edtDescricao.Text;

   if AllTrim(cdsListaMestracodi_lis.AsString) <> EmptyStr then begin
      with cdsLocais do begin
         Active:= False;
         CommandText:= ' SELECT lis_codiProcesso, lis_codiDocumento, lis_qtd, P.nome_pro' +
                       ' FROM lista_mestra_proc L' +
                       ' INNER JOIN Processos P ON P.codi_pro = L.lis_codiProcesso' +
                       ' WHERE lis_codiDocumento = ' + cdsListaMestra.FieldByName('codi_lis').AsString +
                       ' ORDER BY nome_pro';
         Active:= True;
      end;
   end;
end;

procedure TFormCadListaMestra.Botoes(flag: Boolean);
begin
   btnNovo.Enabled       := Flag;
   btnAlterar.Enabled    := Flag;
   btnExcluir.Enabled    := Flag;
   btnGravar.Enabled     := not Flag;
   btnCancelar.Enabled   := not Flag;
   btnImprimir.Enabled   := Flag;
   btnTreinamento.Enabled:= Flag;

   if cdsListaMestra.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadListaMestra.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 7, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtIdentificacao);
      Botoes(False);
   end;
end;

procedure TFormCadListaMestra.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadListaMestra.btnExcelClick(Sender: TObject);
begin
   with cdsExcel do begin
      Active:= False;
//      case rgPesqTipo.ItemIndex of
//         0: begin
//            CommandText:= CommandText + ' ORDER BY iden_lis';
//         end;
//         1: begin
//            CommandText:= CommandText +
//                          ' WHERE lm.tipo_lis = 0' +
//                          ' ORDER BY iden_lis';
//         end;
//         2: begin
//            CommandText:= CommandText +
//                          ' WHERE lm.tipo_lis = 1' +
//                          ' ORDER BY iden_lis';
//         end;
//      end;
      Active:= True;
   end;

   if cdsExcel.RecordCount <= 0 then begin
      Application.MessageBox('Não existem registros para exportar', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      ExpExcel(dbgExcel, cdsExcel, 'Lista Mestra de Documentos');
   end;
end;

procedure TFormCadListaMestra.btnExcluirClick(Sender: TObject);
var
   sCodLista: string;
   sIdenLista: string;
begin
   if (Acesso(cUsuario, 7, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodLista := cdsListaMestra.FieldByName('codi_lis').AsString;
         sIdenLista:= cdsListaMestra.FieldByName('iden_lis').AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM lista_mestra' +
                          ' WHERE codi_lis = ' + sCodLista;
            Execute;
         end;

         Auditoria('LISTA MESTRA',sIdenLista,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;

      Botoes(True);
   end;
end;

procedure TFormCadListaMestra.btnExcluirTreinamentoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 7, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM lista_mestra_proc' +
                          ' WHERE lis_codiDocumento = ' + cdsListaMestracodi_lis.AsString +
                          ' AND lis_codiProcesso = ' + cdsLocaislis_codiProcesso.AsString ;
            Execute;
         end;

         Auditoria('LISTA MESTRA - LOCAIS', cdsListaMestraiden_lis.AsString, 'E', '');
         AtualizarDadosAcessorios();
      end;
      ControlarAbas();
   end;
end;

procedure TFormCadListaMestra.btnGravarClick(Sender: TObject);
var
   sCodTreinamento: string;
begin
   if ValidarDados() then begin
      try
         if (dblTreinamento.KeyValue = -1) or (dblTreinamento.KeyValue = null) then begin
            sCodTreinamento:= QuotedStr('-1');
         end
         else begin
            sCodTreinamento:= IntToStr(dblTreinamento.KeyValue);
         end;


         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO lista_mestra (' +
                             ' codi_lis, iden_lis, desc_lis, revi_lis, tipo_lis, ' +
                             ' atua_lis, arqu_lis, resp_lis, apro_lis, lis_treinamento, ' +
                             ' data_lis' +
                             ' )' +
                             ' VALUES(' +
                             BuscarNovoCodigo('lista_mestra', 'codi_lis') + ',' +
                             QuotedStr(edtIdentificacao.Text) + ',' +
                             QuotedStr(edtDescricao.Text) + ',' +
                             QuotedStr(edtRevisao.Text) + ',' +
                             IntToStr(dblTipo.KeyValue) + ',' +
                             QuotedStr(edtAtualizacao.Text) + ',' +
                             QuotedStr(edtCaminho.Text) + ',' +
                             IntToStr(dblResponsavel.KeyValue) + ',' +
                             QuotedStr('N') + ',' +
                             sCodTreinamento + ',' +
                             ArrumaDataSQL(Date()) +
                             ')';
               Execute;

               GravarTreinamento();
            end
            else begin
               CommandText:= ' UPDATE lista_mestra SET' +
                             ' iden_lis = ' + QuotedStr(edtIdentificacao.Text) + ',' +
                             ' desc_lis = ' + QuotedStr(edtDescricao.Text) + ',' +
                             ' revi_lis = ' + QuotedStr(edtRevisao.Text) + ',' +
                             ' tipo_lis = ' + IntToStr(dblTipo.KeyValue) + ',' +
                             ' atua_lis = ' + QuotedStr(edtAtualizacao.Text) + ',' +
                             ' arqu_lis = ' + QuotedStr(edtCaminho.Text) + ',' +
                             ' resp_lis = ' + IntToStr(dblResponsavel.KeyValue) + ',' +
                             ' apro_lis = ' + QuotedStr('N') + ',' +
                             ' lis_treinamento = ' + sCodTreinamento +
                             ' WHERE codi_lis = ' + cdsListaMestracodi_lis.Asstring;
               Execute;
            end;
         end;

         Auditoria('LISTA MESTRA', edtIdentificacao.Text, cOperacao,'');
         AtualizarDados();
         PreencherCampos();

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

procedure TFormCadListaMestra.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadListaMestra.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormCadListaMestra.btnInserirLocalClick(Sender: TObject);
begin
   if (dblProcessos.KeyValue = -1) or (dblProcessos.KeyValue = null) then begin
      Application.MessageBox('Selecione um processo para inserir', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM lista_mestra_proc' +
                    ' WHERE lis_codiDocumento = ' + cdsListaMestra.FieldByName('codi_lis').AsString +
                    ' AND lis_codiProcesso = ' + IntToStr(dblProcessos.KeyValue) ;
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Processo já cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   with cdsLocais do begin
      try
         Active:= False;
         CommandText:= ' INSERT INTO lista_mestra_proc (lis_codiProcesso, lis_codiDocumento, lis_qtd, lis_novo)' +
                       ' VALUES(' +
                       IntToStr(dblProcessos.KeyValue) + ',' +
                       cdsListaMestra.FieldByName('codi_lis').AsString + ',' +
                       VirgulaParaPonto(spnQtd.Value,0) + ',' +
                       QuotedStr('S') +
                       ')';
         Execute;
         Auditoria('LISTA MESTRA - LOCAIS', edtIdentificacao.Text + ' - ' + dblProcessos.Text, 'I', '');
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro ao gravar o registro!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
         end;
      end;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadListaMestra.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 7, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      lblAprovado.Caption:= 'NÃO';
      shpAprovado.Brush.Color:= clRed;
      LimparCampos();
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      TryFocus(edtIdentificacao);
   end;
end;

procedure TFormCadListaMestra.btnPrimeiroClick(Sender: TObject);
begin
   cdsListaMestra.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadListaMestra.btnAnteriorClick(Sender: TObject);
begin
   cdsListaMestra.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadListaMestra.btnProximoClick(Sender: TObject);
begin
   cdsListaMestra.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadListaMestra.btnUltimoClick(Sender: TObject);
begin
   cdsListaMestra.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadListaMestra.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadListaMestra.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadListaMestra.btnTreinamentoClick(Sender: TObject);
begin
   // Verifica se já existe o treinamento com a mesma descrição
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) as qtd' +
                    ' FROM treinamentos' +
                    ' WHERE desc_tre = ' + QuotedStr(edtDescricao.Text);
      Active:= True;

      if FieldByName('qtd').AsInteger = 0 then begin
         if Application.MessageBox(PChar('Confirma cadastro de treinamento para ' + edtDescricao.Text),
            'Aviso', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            Executar(' INSERT INTO treinamentos (codi_tre, desc_tre) VALUES(' +
                       BuscarNovoCodigo('treinamentos', 'codi_tre') + ',' +
                       QuotedStr(edtDescricao.Text) +
                       ')');
         end;

      end
      else begin
         Application.MessageBox(PChar('Já existe um treinamento com a descrição ' + edtDescricao.Text + #13#10 + 'Verifique'), 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure TFormCadListaMestra.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadListaMestra.ControlarAbas;
begin
   if pctListaMestra.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin // Pesquisa
//      cdsListaMestra.Filtered:= False;
      rgPesqTipo.ItemIndex   := 0;

      btnNovo.Enabled       := False;
      btnGravar.Enabled     := False;
      btnExcluir.Enabled    := False;
      btnCancelar.Enabled   := False;
      btnImprimir.Enabled   := False;
      btnAlterar.Enabled    := False;
      btnTreinamento.Enabled:= False;

      if pctListaMestra.TabIndex = 2 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadListaMestra.dbgListaMestraCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadListaMestra.dbgListaMestraDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctListaMestra.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadListaMestra.dbgListaMestraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadListaMestra.dblTipoCloseUp(Sender: TObject);
begin
   case dblTipo.KeyValue of
    0: begin // Interno
         edtAtualizacao.Text:= 'N/A';
         edtAtualizacao.ReadOnly:= True;
         TryFocus(dblResponsavel);
       end;
    1: begin // Externo
         edtAtualizacao.Clear;
         edtAtualizacao.ReadOnly:= False;
         TryFocus(edtAtualizacao);
       end;
   end;
end;

procedure TFormCadListaMestra.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsListaMestra.Locate('iden_lis', edtValor.Text, [loPartialKey]);
      1: cdsListaMestra.Locate('desc_lis', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadListaMestra.FormShow(Sender: TObject);
begin
   pctListaMestra.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;

   rgTipoDoc.ItemIndex       := 2;
   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadListaMestra.GravarTreinamento;
begin
   if Application.MessageBox('Deseja gravar o documento como treinamento no Cadastro de Treinamentos?', 'Aviso', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      try
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' INSERT INTO treinamentos (codi_tre, desc_tre)' +
                          ' VALUES (' +
                          BuscarNovoCodigo('treinamentos', 'codi_tre') + ',' +
                          QuotedStr(edtIdentificacao.Text + ' - ' + edtDescricao.Text) +
                          ')';
            Execute
         end;
      except
         on E:Exception do begin
            MostrarErro('Erro ao gravar documento como treinamento', E.Message, Self.Name);
         end;
      end;
   end;
end;

procedure TFormCadListaMestra.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtIdentificacao.Enabled:= Flag;
   edtRevisao.Enabled      := Flag;
   edtDescricao.Enabled    := Flag;
   edtAtualizacao.Enabled  := Flag;
   edtCaminho.Enabled      := Flag;
   dblTipo.Enabled         := Flag;
   dblResponsavel.Enabled  := Flag;
   dblTreinamento.Enabled  := Flag;

   sbArquivo.Enabled   := Flag;
   if AllTrim(edtCaminho.Text) <> EmptyStr then begin
      sbVisualizar.Enabled:= True;
   end
   else begin
      sbVisualizar.Enabled:= False;
   end;

   pctListaMestra.Pages[1].TabVisible:= not Flag;
end;

procedure TFormCadListaMestra.LimparCampos;
begin
   edtIdentificacao.Clear;
   edtRevisao.Clear;
   edtDescricao.Clear;
   edtAtualizacao.Clear;
   edtCaminho.Clear;
   dblTipo.KeyValue:= -1;
   dblResponsavel.KeyValue:= -1;
   dblTreinamento.KeyValue:= -1;
end;

procedure TFormCadListaMestra.pctListaMestraChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadListaMestra.PreencherCampos;
begin
   with cdsListaMestra do begin
      edtIdentificacao.Text:= FieldByName('iden_lis').AsString;
      edtRevisao.Text      := FieldByName('revi_lis').AsString;
      edtDescricao.Text    := FieldByName('desc_lis').AsString;
      edtAtualizacao.Text  := FieldByName('atua_lis').AsString;
      edtCaminho.Text      := FieldByName('arqu_lis').AsString;

      if FieldByName('tipo_lis').AsString <> EmptyStr then begin
         dblTipo.KeyValue:= FieldByName('tipo_lis').AsString;
      end;

      if FieldByName('resp_lis').AsString <> EmptyStr then begin
         dblResponsavel.KeyValue:= FieldByName('resp_lis').AsString;
      end;

      if FieldByName('lis_treinamento').AsString <> EmptyStr then begin
         dblTreinamento.KeyValue:= FieldByName('lis_treinamento').AsString;
      end
      else begin
         dblTreinamento.KeyValue:= -1;
      end;

      if cdsListaMestra.FieldByName('apro_lis').AsString = 'S' then begin
         lblAprovado.Caption:= 'SIM';
         shpAprovado.Brush.Color:= clGreen;
      end
      else begin
         lblAprovado.Caption:= 'NÃO';
         shpAprovado.Brush.Color:= clRed;
      end;

      if AllTrim(edtCaminho.Text) <> EmptyStr then begin
         sbVisualizar.Enabled:= True;
      end
      else begin
         sbVisualizar.Enabled:= False;
      end;
   end;
end;

procedure TFormCadListaMestra.rgPesqTipoClick(Sender: TObject);
begin
   case rgPesqTipo.ItemIndex of
      0: begin
         cdsListaMestra.Filtered:= False;
      end;
      1: begin
         cdsListaMestra.Filter:= 'tipo_lis = 0'; // Interno
         cdsListaMestra.Filtered:= True;
      end;
      2: begin
         cdsListaMestra.Filter:= 'tipo_lis = 1'; // Enterno
         cdsListaMestra.Filtered:= True;
      end;
   end;

   AjustaBarraGrid(dbgListaMestra);
end;

procedure TFormCadListaMestra.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadListaMestra.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

function TFormCadListaMestra.ValidarDados(): Boolean;
begin
   if AllTrim(edtIdentificacao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdentificacao);
      Result:= False;
      Exit;
   end;

   if AllTrim(edtRevisao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Revisão é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtRevisao);
      Result:= False;
      Exit;
   end;

   if AllTrim(edtDescricao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Descrição Resumida dp Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtDescricao);
      Result:= False;
      Exit;
   end;

   if dblTipo.KeyValue = -1 then begin
      Application.MessageBox('Campo Tipo do Documento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTipo);
      Result:= False;
      Exit;
   end;

   if dblResponsavel.KeyValue = -1 then begin
      Application.MessageBox('Campo Responsável pela Aprovação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblResponsavel);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadListaMestra.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'iden_lis';
   end
   else begin
      sCampoOrdem:= 'desc_lis';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT lm.*, p.nome_pro as processo, lmp.lis_qtd,' +
                    ' CASE WHEN lm.tipo_lis = 0 THEN ' + QuotedStr('INTERNO') +
                         ' ELSE ' + QuotedStr('EXTERNO') + ' END as tipo' +
                    ' FROM lista_mestra lm' +
                    ' LEFT JOIN lista_mestra_proc lmp ON lmp.lis_codiDocumento = lm.codi_lis' +
                    ' LEFT JOIN Processos P ON P.codi_pro = lmp.lis_codiProcesso';
      if rgTipoDoc.ItemIndex < 2 then begin
         CommandText:= CommandText + ' WHERE tipo_lis = ' + IntToStr(rgTipoDoc.ItemIndex);
      end;
      CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaMestraGeral2.fr3');

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
