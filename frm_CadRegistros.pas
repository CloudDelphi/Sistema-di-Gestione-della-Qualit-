unit frm_CadRegistros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadRegistros = class(TForm)
    pctRegistros: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgRegistros: TDBGrid;
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
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryRegistro: TZQuery;
    dspRegistro: TDataSetProvider;
    cdsRegistro: TClientDataSet;
    dsRegistro: TDataSource;
    frxReport1: TfrxReport;
    frxDBRegistros: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl6: TLabel;
    edtRevisao: TEdit;
    dblProtecao: TDBLookupComboBox;
    lbl5: TLabel;
    edtNumero: TEdit;
    lbl1: TLabel;
    edtIdentificacao: TEdit;
    lbl4: TLabel;
    edtCaminho: TEdit;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    lbl7: TLabel;
    dblRecuperacao: TDBLookupComboBox;
    cdsTipo: TClientDataSet;
    dsTipo: TDataSource;
    dspTipo: TDataSetProvider;
    zqryTipo: TZQuery;
    cdsTipocodi_com: TLargeintField;
    cdsTipovalo_com: TWideStringField;
    opd1: TOpenDialog;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    dblRetencao: TDBLookupComboBox;
    lbl3: TLabel;
    dblDescarte: TDBLookupComboBox;
    lbl8: TLabel;
    cdsRegistrocodi_for: TLargeintField;
    cdsRegistronume_for: TWideStringField;
    cdsRegistrorevi_for: TWideStringField;
    cdsRegistroiden_for: TWideStringField;
    cdsRegistroarma_for: TLargeintField;
    cdsRegistroprot_for: TLargeintField;
    cdsRegistrorecu_for: TLargeintField;
    cdsRegistrodesc_for: TLargeintField;
    cdsRegistroarqu_for: TWideStringField;
    cdsRegistroqtde_for: TLargeintField;
    zqryRecuperar: TZQuery;
    dspRecuperar: TDataSetProvider;
    cdsRecuperar: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsRecuperar: TDataSource;
    zqryRetencao: TZQuery;
    dspRetencao: TDataSetProvider;
    cdsRetencao: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsRetencao: TDataSource;
    zqryDescarte: TZQuery;
    dspDescarte: TDataSetProvider;
    cdsDescarte: TClientDataSet;
    LargeintField3: TLargeintField;
    WideStringField3: TWideStringField;
    dsDescarte: TDataSource;
    cdsImprimirnume_for: TWideStringField;
    cdsImprimirrevi_for: TWideStringField;
    cdsImprimiriden_for: TWideStringField;
    cdsImprimirProtecao: TWideStringField;
    cdsImprimirRecuperar: TWideStringField;
    cdsImprimirDescartar: TWideStringField;
    cdsImprimirRetencao: TWideStringField;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    tsLocais: TTabSheet;
    dbgrdCurriculo: TDBGrid;
    btnInserirLocal: TBitBtn;
    btnExcluirTreinamento: TBitBtn;
    lbl11: TLabel;
    edtNumeroLocais: TEdit;
    lbl12: TLabel;
    edtRevLocais: TEdit;
    edtIdentLocais: TEdit;
    dblProcessos: TDBLookupComboBox;
    lbl13: TLabel;
    zqryLocais: TZQuery;
    dspLocais: TDataSetProvider;
    cdsLocais: TClientDataSet;
    cdsLocaisnome_pro: TWideStringField;
    dsLocais: TDataSource;
    lbl14: TLabel;
    cdsRegistrorete_for: TLargeintField;
    zqryProcImp: TZQuery;
    dspProcImp: TDataSetProvider;
    cdsProcImp: TClientDataSet;
    dsProcImp: TDataSource;
    lbl16: TLabel;
    dblTipoProtecao: TDBLookupComboBox;
    cdsLocaisfor_codprocesso: TLargeintField;
    cdsLocaisfor_codform: TLargeintField;
    cdsLocaisfor_tipo_protecao: TIntegerField;
    cdsLocaisProtecao: TStringField;
    cdsImprimirprocesso: TWideStringField;
    lbl17: TLabel;
    dblModoRecuperacao: TDBLookupComboBox;
    lbl18: TLabel;
    dblRetencaoMinima: TDBLookupComboBox;
    lbl19: TLabel;
    dblDisposicao: TDBLookupComboBox;
    cdsLocaisfor_disposicao: TIntegerField;
    cdsLocaisfor_retencao: TIntegerField;
    cdsLocaisfor_recuperacao: TIntegerField;
    cdsLocaisDisposicao: TStringField;
    cdsLocaisRetencao: TStringField;
    cdsLocaisRecuperacao: TStringField;
    pnlImprimir: TPanel;
    shp1: TShape;
    lbl15: TLabel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    chkDepto: TCheckBox;
    dblProcessoImp: TDBLookupComboBox;
    chkTodos: TCheckBox;
    cdsLocaisfor_codigo: TIntegerField;
    btnExcel: TBitBtn;
    zqryExcel: TZQuery;
    dspExcel: TDataSetProvider;
    cdsExcel: TClientDataSet;
    dsExcel: TDataSource;
    dbgExcel: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Codigo: Boolean; Flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
//    procedure BuscarNovoCodigo;
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRegistrosCellClick(Column: TColumn);
    procedure dbgRegistrosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctRegistrosChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure btnInserirLocalClick(Sender: TObject);
    procedure btnExcluirTreinamentoClick(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure chkDeptoClick(Sender: TObject);
    procedure dbgrdCurriculoCellClick(Column: TColumn);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadRegistros: TFormCadRegistros;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadRegistros.AtualizarDados;
begin
   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 1' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsRecuperar do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 2' +
                    ' ORDER BY valo_com';
      Active:= True;
   end;

   with cdsRetencao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 10' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsDescarte do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 3' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsRegistro do begin
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

   with cdsProcImp do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   if AllTrim(edtNumero.Text) <> EmptyStr then begin
      cdsRegistro.Locate('nume_for', edtNumero.Text,[])
   end;
end;

procedure TFormCadRegistros.AtualizarDadosAcessorios;
begin
   edtNumeroLocais.Text:= edtNumero.Text;
   edtRevLocais.Text   := edtRevisao.Text;
   edtIdentLocais.Text := edtIdentificacao.Text;

   if AllTrim(cdsRegistrocodi_for.AsString) <> EmptyStr then begin
      with cdsLocais do begin
         Active:= False;
         CommandText:= ' SELECT for_codigo, for_codProcesso, for_codForm, P.nome_pro,' +
                       ' for_disposicao, for_retencao, for_recuperacao, for_tipo_protecao' +
                       ' FROM formularios_locais F' +
                       ' INNER JOIN Processos P ON P.codi_pro = F.for_codProcesso ' +
                       ' WHERE for_codForm = ' + cdsRegistrocodi_for.AsString +
                       ' ORDER BY nome_pro';
         Active:= True;
      end;
   end;
end;

procedure TFormCadRegistros.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsRegistro.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadRegistros.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 9, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(False, True);

      case pctRegistros.TabIndex of
         0: begin
            TryFocus(edtNumero);
         end;
         1: begin
            TryFocus(dblProcessos);
         end;
      end;

      Botoes(False);
   end;
end;

procedure TFormCadRegistros.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadRegistros.btnExcelClick(Sender: TObject);
begin
   with cdsExcel do begin
      Active:= False;
      Active:= True;
   end;

   if cdsExcel.RecordCount <= 0 then begin
      Application.MessageBox('Não existem registros para exportar', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      ExpExcel(dbgExcel, cdsExcel, 'Registros da Qualidade');
   end;
end;

procedure TFormCadRegistros.btnExcluirClick(Sender: TObject);
var
   sCodReg, sCodLocais: string;
begin
   if (Acesso(cUsuario, 9, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodReg   := cdsRegistrocodi_for.AsString;
         sCodLocais:= cdsLocaisfor_codigo.AsString;
         case pctRegistros.TabIndex of
         0: begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM formularios' +
                                ' WHERE codi_for = ' + sCodReg;
                  Execute;
               end;
            end;
         1: begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM formularios_locais' +
                                ' WHERE for_codigo = ' + sCodLocais;
                  Execute;
               end;
            end;
         end;

         Auditoria('REGISTRO DA QUALIDADE',sCodReg,'E','');
         LimparCampos();
         AtualizarDados();
         AtualizarDadosAcessorios;
         PreencherCampos;
      end;
      Botoes(True);
      ControlarAbas();
   end;
end;

procedure TFormCadRegistros.btnExcluirTreinamentoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 9, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM formularios_locais' +
                          ' WHERE for_codForm = ' + cdsRegistrocodi_for.AsString +
                          ' AND for_codProcesso = ' + cdsLocaisfor_codProcesso.AsString ;
            Execute;
         end;

         Auditoria('REGISTROS DA QUALIDADE - LOCAIS', cdsRegistrocodi_for.AsString, 'E', '');
         AtualizarDadosAcessorios();
      end;
      Botoes(True);
   end;
end;

procedure TFormCadRegistros.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      case pctRegistros.TabIndex of
         0: begin // Cadastro
            try
               with cdsGravar do begin
                  Active:= False;
                  if cOperacao = 'I' then begin
                     CommandText:= ' INSERT INTO formularios (' +
                                   ' codi_for, nume_for, revi_for, iden_for, ' +
//                                   ' prot_for, recu_for, rete_for, desc_for, ' +
                                   ' arqu_for ' +
                                   ' )' +
                                   ' VALUES(' +
                                   sNovoCodigo + ',' +
                                   QuotedStr(edtNumero.Text) + ',' +
                                   QuotedStr(edtRevisao.Text) + ',' +
                                   QuotedStr(edtIdentificacao.Text) + ',' +
      //                             IntToStr(dblArmazenagem.KeyValue) + ',' +
//                                   IntToStr(dblProtecao.KeyValue) + ',' +
//                                   IntToStr(dblRecuperacao.KeyValue) + ',' +
//                                   IntToStr(dblRetencao.KeyValue) + ',' +
//                                   IntToStr(dblDescarte.KeyValue) + ',' +
                                   QuotedStr(edtCaminho.Text) +
                                   ')';
                     Execute;
                  end
                  else begin
                     CommandText:= ' UPDATE formularios SET' +
                                   ' nume_for = ' + QuotedStr(edtNumero.Text) + ',' +
                                   ' revi_for = ' + QuotedStr(edtRevisao.Text) + ',' +
                                   ' iden_for = ' + QuotedStr(edtIdentificacao.Text) + ',' +
      //                             ' arma_for = ' + IntToStr(dblArmazenagem.KeyValue) + ',' +
//                                   ' prot_for = ' + IntToStr(dblProtecao.KeyValue) + ',' +
//                                   ' recu_for = ' + IntToStr(dblRecuperacao.KeyValue) + ',' +
//                                   ' rete_for = ' + IntToStr(dblRetencao.KeyValue) + ',' +
//                                   ' desc_for = ' + IntToStr(dblDescarte.KeyValue) + ',' +
                                   ' arqu_for = ' + QuotedStr(edtCaminho.Text) +
                                   ' WHERE codi_for = ' + cdsRegistrocodi_for.Asstring;
                     Execute;
                  end;
               end;

               Auditoria('REGISTROS DA QUALIDADE', edtNumero.Text, cOperacao,'');
               AtualizarDados();
               AtualizarDadosAcessorios();

               HabilitarCampos(False, False);
               Botoes(True);
               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
            except
               on E:Exception do begin
                  MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
               end;
            end;
         end;
         1: begin // Locais
            with cdsGravar do begin
               try
                  Active:= False;
                  if cOperacao = 'I' then begin
                     with dm.cdsAuxiliar do begin
                        Active:= False;
                        CommandText:= ' SELECT COUNT(*) AS QTD' +
                                      ' FROM formularios_locais' +
                                      ' WHERE for_codForm = ' + cdsRegistrocodi_for.AsString +
                                      ' AND for_codProcesso = ' + IntToStr(dblProcessos.KeyValue) +
                                      ' AND for_tipo_protecao = ' + IntToStr(dblTipoProtecao.KeyValue);
                        Active:= True;

                        if FieldByName('QTD').AsInteger > 0 then begin
                           Application.MessageBox('Local de Armazenamento já cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
                           Exit;
                        end;
                     end;

                     CommandText:= ' INSERT INTO formularios_locais (for_codigo, for_codProcesso, for_codForm,' +
                                   ' for_disposicao, for_retencao, for_recuperacao, for_tipo_protecao)' +
                                   ' VALUES(' +
                                   sNovoCodigo + ',' +
                                   IntToStr(dblProcessos.KeyValue) + ',' +
                                   cdsRegistro.FieldByName('codi_for').AsString + ',' +
                                   IntToStr(dblDisposicao.KeyValue) + ',' +
                                   IntToStr(dblRetencaoMinima.KeyValue) + ',' +
                                   IntToStr(dblModoRecuperacao.KeyValue) + ',' +
                                   IntToStr(dblTipoProtecao.KeyValue) +
                                   ')';
                  end
                  else begin
                     CommandText:= ' UPDATE formularios_locais SET' +
                                   ' for_disposicao = ' + IntToStr(dblDisposicao.KeyValue) + ',' +
                                   ' for_retencao = ' + IntToStr(dblRetencaoMinima.KeyValue) + ',' +
                                   ' for_recuperacao = ' + IntToStr(dblModoRecuperacao.KeyValue) + ',' +
                                   ' for_tipo_protecao = ' + IntToStr(dblTipoProtecao.KeyValue) + ',' +
                                   ' for_codProcesso = ' + IntToStr(dblProcessos.KeyValue) +
                                   ' WHERE for_codigo = ' + cdsLocaisfor_codigo.AsString;
                  end;
                  Execute;
                  Auditoria('REGISTROS DA QUALIDADE - LOCAIS', edtIdentificacao.Text + ' - ' + dblProcessos.Text, cOperacao, '');

                  HabilitarCampos(False, False);
                  Botoes(True);
                  AtualizarDadosAcessorios();
                  Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
               except
                  on E: Exception do begin
                     MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
         //            Application.MessageBox(PChar('Erro ao gravar o registro!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
                  end;
               end;
            end;
         end;
      end;
   end;
end;

procedure TFormCadRegistros.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRegistros.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgOrdemImpressao.ItemIndex:= 1;
   chkDepto.Checked:= False;
   chkTodos.Checked:= True;
end;

procedure TFormCadRegistros.btnInserirLocalClick(Sender: TObject);
begin
   if (dblProcessos.KeyValue = -1) or (dblProcessos.KeyValue = Null) then begin
      Application.MessageBox('Campo Local de Armazenagem é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcessos);
      Exit;
   end;

   if (dblModoRecuperacao.KeyValue = -1) OR (dblModoRecuperacao.KeyValue = Null) then begin
      Application.MessageBox('Campo Modo de Recuperação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblModoRecuperacao);
      Exit;
   end;

   if (dblRetencaoMinima.KeyValue = -1) OR (dblRetencaoMinima.KeyValue = Null) then begin
      Application.MessageBox('Campo Retenção Mínima é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblRetencaoMinima);
      Exit;
   end;

   if (dblDisposicao.KeyValue = -1) OR (dblDisposicao.KeyValue = Null) then begin
      Application.MessageBox('Campo Disposição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblDisposicao);
      Exit;
   end;

   if (dblTipoProtecao.KeyValue = -1) OR (dblTipoProtecao.KeyValue = Null) then begin
      Application.MessageBox('Campo Tipo de Proteção é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTipoProtecao);
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM formularios_locais' +
                    ' WHERE for_codForm = ' + cdsRegistrocodi_for.AsString +
                    ' AND for_codProcesso = ' + IntToStr(dblProcessos.KeyValue) +
                    ' AND for_tipo_protecao = ' + IntToStr(dblTipoProtecao.KeyValue);
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Local de Armazenamento já cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   with cdsLocais do begin
      try
         Active:= False;
         CommandText:= ' INSERT INTO formularios_locais (for_codProcesso, for_codForm,' +
                       ' for_disposicao, for_retencao, for_recuperacao, for_tipo_protecao)' +
                       ' VALUES(' +
                       IntToStr(dblProcessos.KeyValue) + ',' +
                       cdsRegistrocodi_for.AsString + ',' +
                       IntToStr(dblDisposicao.KeyValue) + ',' +
                       IntToStr(dblRetencaoMinima.KeyValue) + ',' +
                       IntToStr(dblModoRecuperacao.KeyValue) + ',' +
                       IntToStr(dblTipoProtecao.KeyValue) +
                       ')';
         Execute;
         Auditoria('REGISTROS DA QUALIDADE - LOCAIS', edtIdentificacao.Text + ' - ' + dblProcessos.Text, 'I', '');
      except
         on E: Exception do begin
            MostrarErro('Erro ao gravar o registro', E.Message, Self.Name);
//            Application.MessageBox(PChar('Erro ao gravar o registro!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
         end;
      end;
   end;

   AtualizarDadosAcessorios();
end;

procedure TFormCadRegistros.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 9, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos();
      HabilitarCampos(True, True);
      Botoes(False);
      case pctRegistros.TabIndex of
         0: begin
            btnExcluir.Enabled := False;
            btnAlterar.Enabled := False;
            sNovoCodigo:= BuscarNovoCodigo('formularios', 'codi_for');
            TryFocus(edtNumero);
         end;
         1: begin
            sNovoCodigo:= BuscarNovoCodigo('formularios_locais', 'for_codigo');
            TryFocus(dblProcessos);
         end;
      end;
   end;
end;

procedure TFormCadRegistros.btnPrimeiroClick(Sender: TObject);
begin
   cdsRegistro.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRegistros.btnAnteriorClick(Sender: TObject);
begin
   cdsRegistro.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRegistros.btnProximoClick(Sender: TObject);
begin
   cdsRegistro.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRegistros.btnUltimoClick(Sender: TObject);
begin
   cdsRegistro.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRegistros.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRegistros.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRegistros.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

//procedure TFormCadRegistros.BuscarNovoCodigo;
//begin
//   with dm.cdsAuxiliar do begin
//      Active:= False;
//      CommandText:= ' SELECT MAX(codi_for) AS NovoCodigo FROM Formularios';
//      Active:= True;
//
//      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
//         sNovoCodigo:= '1';
//      end
//      else begin
//         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
//      end;
//   end;
//end;

procedure TFormCadRegistros.chkDeptoClick(Sender: TObject);
begin
   if chkDepto.Checked then begin
      chkTodos.Enabled      := True;
   end
   else begin
      chkTodos.Enabled       := False;
      dblProcessoImp.KeyValue:= -1;
   end;

   chkTodos.Checked      := True;
   dblProcessoImp.Enabled:= False;
end;

procedure TFormCadRegistros.chkTodosClick(Sender: TObject);
begin
   dblProcessoImp.Enabled:= not chkTodos.Checked;
end;

procedure TFormCadRegistros.ControlarAbas;
begin
   if (pctRegistros.TabIndex = 0) OR (pctRegistros.TabIndex = 1) then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
      HabilitarCampos(False, False);

      if pctRegistros.TabIndex = 1 then begin // Locais
         if cdsLocais.RecordCount <= 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end
         else begin
            btnAlterar.Enabled:= True;
            btnExcluir.Enabled:= True;
         end;
      end;
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;

      if pctRegistros.TabIndex = 2 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;

   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadRegistros.dbgrdCurriculoCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadRegistros.dbgRegistrosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadRegistros.dbgRegistrosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctRegistros.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadRegistros.dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos();
end;

procedure TFormCadRegistros.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsRegistro.Locate('nume_for', edtValor.Text, [loPartialKey]);
      1: cdsRegistro.Locate('iden_for', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadRegistros.FormShow(Sender: TObject);
begin
   pctRegistros.TabIndex:= 0;
   AtualizarDados();
   AtualizarDadosAcessorios();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
end;

procedure TFormCadRegistros.HabilitarCampos(Codigo, Flag: Boolean);
begin
   case pctRegistros.TabIndex of
      0: begin
         edtNumero.Enabled       := Flag;
         edtRevisao.Enabled      := Flag;
         edtIdentificacao.Enabled:= Flag;
      //   dblArmazenagem.Enabled  := Flag;
         dblProtecao.Enabled     := Flag;
         dblRecuperacao.Enabled  := Flag;
         dblRetencao.Enabled     := Flag;
         dblDescarte.Enabled     := Flag;
         edtCaminho.Enabled      := Flag;


         sbArquivo.Enabled   := Flag;
         if AllTrim(edtCaminho.Text) <> EmptyStr then begin
            sbVisualizar.Enabled:= True;
         end
         else begin
            sbVisualizar.Enabled:= False;
         end;

         pctRegistros.Pages[1].TabVisible:= not Flag;
         pctRegistros.Pages[2].TabVisible:= not Flag;
      end;
      1: begin
         dblProcessos.Enabled      := Flag;
         dblTipoProtecao.Enabled   := Flag;
         dblModoRecuperacao.Enabled:= Flag;
         dblRetencaoMinima.Enabled := Flag;
         dblDisposicao.Enabled     := Flag;
      end;
   end;
end;

procedure TFormCadRegistros.LimparCampos;
begin
   case pctRegistros.TabIndex of
      0: begin
         edtNumero.Clear;
         edtRevisao.Clear;
         edtIdentificacao.Clear;
      //   dblArmazenagem.KeyValue:= -1;
//         dblProtecao.KeyValue:= -1;
//         dblRecuperacao.KeyValue:= -1;
//         dblRetencao.KeyValue:= -1;
//         dblDescarte.KeyValue:= -1;
         edtCaminho.Clear;
      end;
      1: begin
         dblProcessos.KeyValue:= -1;
         dblTipoProtecao.KeyValue:= -1;
         dblModoRecuperacao.KeyValue:= -1;
         dblRetencaoMinima.KeyValue:= -1;
         dblDisposicao.KeyValue:= -1;
      end;
   end;
end;

procedure TFormCadRegistros.pctRegistrosChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadRegistros.PreencherCampos;
begin
//   case pctRegistros.TabIndex of
//      0: begin
         with cdsRegistro do begin
            edtNumero.Text       := FieldByName('nume_for').AsString;
            edtRevisao.Text      := FieldByName('revi_for').AsString;
            edtIdentificacao.Text:= FieldByName('iden_for').AsString;
            edtCaminho.Text      := FieldByName('arqu_for').AsString;

      //      if FieldByName('arma_for').AsString <> EmptyStr then begin
      //         dblArmazenagem.KeyValue:= FieldByName('arma_for').AsString;
      //      end;

//            if FieldByName('prot_for').AsString <> EmptyStr then begin
//               dblProtecao.KeyValue:= FieldByName('prot_for').AsString;
//            end;
//
//            if FieldByName('recu_for').AsString <> EmptyStr then begin
//               dblRecuperacao.KeyValue:= FieldByName('recu_for').AsString;
//            end;
//
//            if FieldByName('rete_for').AsString <> EmptyStr then begin
//               dblRetencao.KeyValue:= FieldByName('rete_for').AsString;
//            end;
//
//            if FieldByName('desc_for').AsString <> EmptyStr then begin
//               dblDescarte.KeyValue:= FieldByName('desc_for').AsString;
//            end;
         end;
//      end;
//      1: begin
         with cdsLocais do begin
            if FieldByName('for_codprocesso').AsString <> EmptyStr then begin
               dblProcessos.KeyValue:= FieldByName('for_codprocesso').AsString;
            end;

            if FieldByName('for_tipo_protecao').AsString <> EmptyStr then begin
               dblTipoProtecao.KeyValue:= FieldByName('for_tipo_protecao').AsString;
            end;

            if FieldByName('for_recuperacao').AsString <> EmptyStr then begin
               dblModoRecuperacao.KeyValue:= FieldByName('for_recuperacao').AsString;
            end;

            if FieldByName('for_retencao').AsString <> EmptyStr then begin
               dblRetencaoMinima.KeyValue:= FieldByName('for_retencao').AsString;
            end;

            if FieldByName('for_disposicao').AsString <> EmptyStr then begin
               dblDisposicao.KeyValue:= FieldByName('for_disposicao').AsString;
            end;
         end;
//      end;
//   end;
end;

procedure TFormCadRegistros.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtCaminho.Text:= OPD1.FileName;
end;

procedure TFormCadRegistros.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtCaminho.Text, Self.Name);
end;

function TFormCadRegistros.ValidarDados(): Boolean;
begin
   case pctRegistros.TabIndex of
      0: begin
         if AllTrim(edtNumero.Text) = EmptyStr then begin
            Application.MessageBox('Campo Número é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtNumero);
            Result:= False;
            Exit;
         end;

         if AllTrim(edtRevisao.Text) = EmptyStr then begin
            Application.MessageBox('Campo Revisão é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtRevisao);
            Result:= False;
            Exit;
         end;

         if AllTrim(edtIdentificacao.Text) = EmptyStr then begin
            Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(edtIdentificacao);
            Result:= False;
            Exit;
         end;

      //   if dblArmazenagem.KeyValue = -1 then begin
      //      Application.MessageBox('Campo Meio de Armazenagem é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      //      TryFocus(dblArmazenagem);
      //      Result:= False;
      //      Exit;
      //   end;

      //   if dblProtecao.KeyValue = -1 then begin
      //      Application.MessageBox('Campo Tipo de Proteção é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      //      TryFocus(dblProtecao);
      //      Result:= False;
      //      Exit;
      //   end;

      //   if dblRecuperacao.KeyValue = -1 then begin
      //      Application.MessageBox('Campo Modo de Recuperação obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      //      TryFocus(dblRecuperacao);
      //      Result:= False;
      //      Exit;
      //   end;
      //
      //   if dblRetencao.KeyValue = -1 then begin
      //      Application.MessageBox('Campo Retenção Minima é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      //      TryFocus(dblRetencao);
      //      Result:= False;
      //      Exit;
      //   end;
      //
      //   if dblDescarte.KeyValue = -1 then begin
      //      Application.MessageBox('Campo Disposição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      //      TryFocus(dblDescarte);
      //      Result:= False;
      //      Exit;
      //   end;

      end;
      1: begin
         if (dblProcessos.KeyValue = -1) or (dblProcessos.KeyValue = Null) then begin
            Application.MessageBox('Campo Local de Armazenagem é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblProcessos);
            Result:= False;
            Exit;
         end;

         if (dblTipoProtecao.KeyValue = -1) OR (dblTipoProtecao.KeyValue = Null) then begin
            Application.MessageBox('Campo Tipo de Proteção é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblTipoProtecao);
            Result:= False;
            Exit;
         end;

         if (dblModoRecuperacao.KeyValue = -1) OR (dblModoRecuperacao.KeyValue = Null) then begin
            Application.MessageBox('Campo Modo de Recuperação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblModoRecuperacao);
            Result:= False;
            Exit;
         end;

         if (dblRetencaoMinima.KeyValue = -1) OR (dblRetencaoMinima.KeyValue = Null) then begin
            Application.MessageBox('Campo Retenção Mínima é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblRetencaoMinima);
            Result:= False;
            Exit;
         end;

         if (dblDisposicao.KeyValue = -1) OR (dblDisposicao.KeyValue = Null) then begin
            Application.MessageBox('Campo Disposição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblDisposicao);
            Result:= False;
            Exit;
         end;
      end;
   end;

   Result:= True;
end;

procedure TFormCadRegistros.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if ((dblProcessoImp.KeyValue = -1) or (dblProcessoImp.KeyValue = Null))
      and chkDepto.Checked and not chkTodos.Checked then begin
      Application.MessageBox('Selecione um processo', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcessoImp);
      Exit;
   end;

   if rgOrdemImpressao.ItemIndex = 0 then begin
      if chkDepto.Checked = True then begin
         sCampoOrdem:= 'p.nome_pro, nume_for';
      end
      else begin
         sCampoOrdem:= 'nume_for';
      end;
   end
   else begin
      if chkDepto.Checked = True then begin
         sCampoOrdem:= 'p.nome_pro, iden_for';
      end
      else begin
         sCampoOrdem:= 'iden_for';
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      if chkDepto.Checked = True then begin
         CommandText:= ' SELECT F.nume_for, F.revi_for, F.iden_for, P.nome_pro as processo, ' +
                       ' TC.valo_com as Protecao, TC2.valo_com as Recuperar,' +
                       ' TC3.valo_com as Descartar, TC4.valo_com as Retencao' +
                       ' FROM formularios F' +
                       ' LEFT JOIN formularios_locais FL ON FL.for_codForm = F.codi_for' +
                       ' LEFT JOIN Processos P ON FL.for_codProcesso = codi_pro' +
                       ' INNER JOIN tabela_combos TC ON FL.for_tipo_protecao = TC.codi_com and TC.tipo_com = 1' +
                       ' INNER JOIN tabela_combos TC2 ON FL.for_recuperacao = TC2.codi_com and TC2.tipo_com = 2' +
                       ' INNER JOIN tabela_combos TC3 ON FL.for_disposicao = TC3.codi_com and TC3.tipo_com = 3' +
                       ' INNER JOIN tabela_combos TC4 ON FL.for_retencao = TC4.codi_com and TC4.tipo_com = 10' +
                       ' WHERE 1 = 1';
         if chkTodos.Checked = False then begin
            CommandText:= CommandText + ' AND for_codprocesso = ' + IntToStr(dblProcessoImp.KeyValue);
         end;
         CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
      end
      else begin
         CommandText:= ' SELECT f.nume_for, f.revi_for, f.iden_for, f.nume_for as processo, ' + // p.nome_pro as processo,
                       ' tc.valo_com as Protecao, tc2.valo_com as Recuperar,' +
                       ' tc3.valo_com as Descartar, tc4.valo_com as Retencao' +
                       ' FROM formularios f' +
                       ' LEFT JOIN formularios_locais FL ON FL.for_codForm = F.codi_for' +
//                       ' INNER JOIN Processos p ON arma_for = codi_pro' +
//                       ' LEFT JOIN tabela_combos tc ON FL.for_tipo_protecao = tc.codi_com and tc.tipo_com = 1' +

                       ' LEFT JOIN tabela_combos TC ON FL.for_tipo_protecao = TC.codi_com and TC.tipo_com = 1' +
                       ' LEFT JOIN tabela_combos TC2 ON FL.for_recuperacao = TC2.codi_com and TC2.tipo_com = 2' +
                       ' LEFT JOIN tabela_combos TC3 ON FL.for_disposicao = TC3.codi_com and TC3.tipo_com = 3' +
                       ' LEFT JOIN tabela_combos TC4 ON FL.for_retencao = TC4.codi_com and TC4.tipo_com = 10' +

//                       ' INNER JOIN tabela_combos tc2 ON f.recu_for = tc2.codi_com and tc2.tipo_com = 2' +
//                       ' INNER JOIN tabela_combos tc3 ON f.desc_for = tc3.codi_com and tc3.tipo_com = 3' +
//                       ' INNER JOIN tabela_combos tc4 ON f.rete_for = tc4.codi_com and tc4.tipo_com = 10' +
                       ' ORDER BY ' + sCampoOrdem;
      end;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      if chkDepto.Checked = True then begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaRegistrosDepto.fr3');
      end
      else begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaRegistros.fr3');
      end;

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
