unit frm_CadManutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, Spin;

type
  TFormCadManutencao = class(TForm)
    pnl1: TPanel;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryManut: TZQuery;
    dspManut: TDataSetProvider;
    cdsManut: TClientDataSet;
    dsManut: TDataSource;
    frxReport1: TfrxReport;
    frxDBManut: TfrxDBDataset;
    zqryItens: TZQuery;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    btnSair: TBitBtn;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnNovo: TBitBtn;
    pgcManut: TPageControl;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl11: TLabel;
    lbl14: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    tsItens: TTabSheet;
    tsPesquisa: TTabSheet;
    lbl2: TLabel;
    edtIdentItens: TEdit;
    lbl3: TLabel;
    edtDescItens: TEdit;
    lbl1: TLabel;
    edtEquipItens: TEdit;
    btnInserirItem: TBitBtn;
    btnExcluirItem: TBitBtn;
    dbgItens: TDBGrid;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgManut: TDBGrid;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    pnl3: TPanel;
    rgTipoImpressao: TRadioGroup;
    dblEquip: TDBLookupComboBox;
    lbl5: TLabel;
    dblIdentModelo: TDBLookupComboBox;
    zqryEquip: TZQuery;
    dspEquip: TDataSetProvider;
    cdsEquip: TClientDataSet;
    dsEquip: TDataSource;
    dtInicio: TDateEdit;
    lbl34: TLabel;
    dtFim: TDateEdit;
    lbl6: TLabel;
    lbllb3: TLabel;
    medtHoraIni: TMaskEdit;
    lbl7: TLabel;
    medtHoraFim: TMaskEdit;
    dblProcesso: TDBLookupComboBox;
    lbl8: TLabel;
    zqryModeloManut: TZQuery;
    dspModeloManut: TDataSetProvider;
    cdsModeloManut: TClientDataSet;
    dsModeloManut: TDataSource;
    zqryProcesso: TZQuery;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    lbl12: TLabel;
    edtCodItens: TEdit;
    ImageList: TImageList;
    cdsImprimirman_codigo: TIntegerField;
    cdsImprimirman_modelo: TIntegerField;
    cdsImprimirman_processo: TIntegerField;
    cdsImprimirman_datainicio: TDateTimeField;
    cdsImprimirman_datafim: TDateTimeField;
    cdsImprimirman_horainicio: TWideStringField;
    cdsImprimirman_horafim: TWideStringField;
    cdsImprimirman_equipamento: TIntegerField;
    cdsImprimirman_identificacao: TWideStringField;
    cdsImprimirman_descricao: TWideStringField;
    cdsImprimirequip: TWideStringField;
    cdsImprimirite_descricao: TWideStringField;
    cdsImprimirprocesso: TWideStringField;
    pnlObs: TPanel;
    pnl5: TPanel;
    btnSairObs: TBitBtn;
    pnl6: TPanel;
    mmoObs: TMemo;
    btnGravarObs: TBitBtn;
    lbl13: TLabel;
    lblDescItem: TLabel;
    cdsImprimirite_obs: TWideMemoField;
    cdsImprimirverificado: TWideMemoField;
    lbl15: TLabel;
    edtItem: TEdit;
    tsExecutores: TTabSheet;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    edtModeloExe: TEdit;
    edtDescExe: TEdit;
    edtEquipExe: TEdit;
    edtCodExe: TEdit;
    lbl20: TLabel;
    btnInserirExe: TBitBtn;
    btnExcluirExe: TBitBtn;
    dbgExecutores: TDBGrid;
    dblExecutor: TDBLookupComboBox;
    zqryExecutor: TZQuery;
    dspExecutor: TDataSetProvider;
    cdsExecutor: TClientDataSet;
    dsExecutor: TDataSource;
    zqryManExecutores: TZQuery;
    dspManExecutores: TDataSetProvider;
    cdsManExecutores: TClientDataSet;
    dsManExecutores: TDataSource;
    lbl21: TLabel;
    dblTipoManut: TDBLookupComboBox;
    zqryTipoManut: TZQuery;
    dspTipoManut: TDataSetProvider;
    cdsTipoManut: TClientDataSet;
    dsTipoManut: TDataSource;
    rgTipoManut: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure AtualizarDadosAcessorios;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgManutKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgManutCellClick(Column: TColumn);
    procedure dbgManutDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoOQueKeyPress(Sender: TObject; var Key: Char);
    procedure pgcManutChange(Sender: TObject);
    procedure dblIdentModeloCloseUp(Sender: TObject);
    procedure InserirItensManutencao();
    procedure dbgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnInserirItemClick(Sender: TObject);
    function ValidarDadosItem(): Boolean;
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnSairObsClick(Sender: TObject);
    procedure dbgItensCellClick(Column: TColumn);
    procedure btnGravarObsClick(Sender: TObject);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirExeClick(Sender: TObject);
    function ValidarExecutores(): Boolean;
    procedure btnExcluirExeClick(Sender: TObject);
    procedure rgTipoImpressaoClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadManutencao: TFormCadManutencao;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadManutencao.AtualizarDados;
begin
   with cdsManut do begin
      Active:= False;
      CommandText:= ' SELECT M.man_codigo, M.man_modelo, M.man_processo, M.man_datainicio, M.man_datafim,' +
                    ' M.man_horainicio, M.man_horafim, M.man_equipamento, ' +
                    ' MM.man_identificacao, MM.man_descricao, ' +
                    ' CAST(I.iden_inf || ' + QuotedStr(' - ') + ' || I.desc_inf as character varying(100)) as Equip,' +
                    ' man_tipo' +
                    ' FROM manut M' +
                    ' INNER JOIN manut_modelo MM ON MM.man_codigo = M.man_modelo' +
                    ' INNER JOIN infraestrutura I ON I.codi_inf = M.man_equipamento' +
                    ' ORDER BY M.man_codigo DESC';
      Active:= True;
   end;

   with cdsTipoManut do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 36' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsModeloManut do begin
      Active:= False;
      CommandText:= ' SELECT man_codigo, man_identificacao, man_descricao' +
                    ' FROM manut_modelo' +
                    ' ORDER BY man_identificacao';
      Active:= True;
   end;

   with cdsProcesso do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro, nome_pro ' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   with cdsEquip do begin
      Active:= False;
      CommandText:= ' SELECT codi_inf, desc_inf, iden_inf, ' +
                    ' CAST(iden_inf || ' + QuotedStr(' - ') + ' || desc_inf as character varying(100)) as Equip' +
                    ' FROM infraestrutura' +
                    ' ORDER BY iden_inf';
      Active:= True;
   end;

   with cdsExecutor do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsManut.Locate('man_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadManutencao.AtualizarDadosAcessorios;
begin
   if cdsManut.RecordCount > 0 then begin
      edtCodItens.Text  := cdsManut.FieldByName('man_codigo').AsString;
      edtIdentItens.Text:= cdsManut.FieldByName('man_identificacao').AsString;
      edtDescItens.Text := cdsManut.FieldByName('man_descricao').AsString;
      edtEquipItens.Text:= cdsManut.FieldByName('equip').AsString;

      edtCodExe.Text   := cdsManut.FieldByName('man_codigo').AsString;
      edtModeloExe.Text:= cdsManut.FieldByName('man_identificacao').AsString;
      edtDescExe.Text  := cdsManut.FieldByName('man_descricao').AsString;
      edtEquipExe.Text := cdsManut.FieldByName('equip').AsString;

      with cdsItens do begin
         Active:= False;
         CommandText:= ' SELECT ite_codigo, man_codigo, ite_descricao, ' +
                       ' ite_verificado, ite_obs' +
                       ' FROM manut_itens' +
                       ' WHERE man_codigo = ' + cdsManut.FieldByName('man_codigo').AsString +
                       ' ORDER BY ite_descricao';
         Active:= True;
      end;

      with cdsManExecutores do begin
         Active:= False;
         CommandText:= ' SELECT M.exe_codigo, M.man_codigo, ' +
                       ' M.exe_executor, C.nome_col as Executor' +
                       ' FROM manut_executores M' +
                       ' INNER JOIN colaboradores C ON C.codi_col = M.exe_executor' +
                       ' WHERE man_codigo = ' + cdsManut.FieldByName('man_codigo').AsString +
                       ' ORDER BY C.nome_col';
         Active:= True;
      end;
   end;
end;

procedure TFormCadManutencao.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsManut.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadManutencao.btnInserirExeClick(Sender: TObject);
begin
   if ValidarExecutores() then begin
      Executar(' INSERT INTO manut_executores(' +
               ' exe_codigo, man_codigo, exe_executor)' +
               ' VALUES (' +
               BuscarNovoCodigo('manut_executores', 'exe_codigo') + ',' +
               QuotedStr(edtCodigo.Text) + ',' +
               IntToStr(dblExecutor.KeyValue) +
               ')');

      AtualizarDadosAcessorios();
   end;
end;

procedure TFormCadManutencao.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 15, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 1, 2);
      Botoes(False);
   end;
end;

procedure TFormCadManutencao.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;

procedure TFormCadManutencao.btnExcluirClick(Sender: TObject);
var
   sCodMan  : string;
   sIdentMan: string;
   sEquip   : string;
begin
   if (Acesso(cUsuario, 15, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodMan  := cdsManut.FieldByName('man_codigo').AsString;
         sIdentMan:= dblIdentModelo.Text;
         sEquip   := dblEquip.Text;

         // Exclui os itens da manutenção excluída
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM manut_itens' +
                          ' WHERE man_codigo = ' + sCodMan;
            Execute;
         end;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM manut' +
                          ' WHERE man_codigo = ' + sCodMan;
            Execute;
         end;

         Auditoria('CADASTRO DE MANUTENÇÃO - EXECUÇÃO', 'Cod ' + sCodMan + '-' +
                   sIdentMan + '-' + sEquip, 'E','');
         LimparCampos(Self);
         AtualizarDados();
         PreencherCampos();
      end;
      Botoes(True);
   end;
end;

procedure TFormCadManutencao.btnExcluirExeClick(Sender: TObject);
begin
   Executar(' DELETE FROM manut_executores' +
            ' WHERE exe_codigo = ' + cdsManExecutores.FieldByName('exe_codigo').AsString);

   AtualizarDadosAcessorios();
end;

procedure TFormCadManutencao.btnExcluirItemClick(Sender: TObject);
begin
   Executar(' DELETE FROM manut_itens' +
            ' WHERE ite_codigo = ' + cdsItens.FieldByName('ite_codigo').AsString);

   AtualizarDadosAcessorios();
end;

procedure TFormCadManutencao.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO manut' +
                             ' (man_codigo, man_modelo, man_processo, man_datainicio, man_datafim,' +
                             ' man_horainicio, man_horafim, man_equipamento, man_email_enviado,' +
                             ' man_tipo)' +
                             ' VALUES(' +
                             BuscarNovoCodigo('manut', 'man_codigo') + ',' +
                             QuotedStr(dblIdentModelo.KeyValue) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             ArrumaDataSQL(dtInicio.Date) + ',' +
                             ArrumaDataSQL(dtFim.Date) + ',' +
                             QuotedStr(medtHoraIni.Text) + ',' +
                             QuotedStr(medtHoraFim.Text) + ',' +
                             QuotedStr(dblEquip.KeyValue) + ',' +
                             QuotedStr('N') + ',' +
                             QuotedStr(dblTipoManut.KeyValue) +
                             ')';
               Execute;

               InserirItensManutencao();
            end
            else begin
               CommandText:= ' UPDATE manut SET' +
                             ' man_modelo = ' + QuotedStr(dblIdentModelo.KeyValue) + ',' +
                             ' man_processo = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' man_datainicio = ' + ArrumaDataSQL(dtInicio.Date) + ',' +
                             ' man_datafim = ' + ArrumaDataSQL(dtFim.Date) + ',' +
                             ' man_horainicio = ' + QuotedStr(medtHoraIni.Text) + ',' +
                             ' man_horafim = ' + QuotedStr(medtHoraFim.Text) + ',' +
                             ' man_equipamento = ' + QuotedStr(dblEquip.KeyValue) + ',' +
                             ' man_email_enviado = ' + QuotedStr('N') + ',' +
                             ' man_tipo = ' + QuotedStr(dblTipoManut.KeyValue) +
                             ' WHERE man_codigo = ' + cdsManut.FieldByName('man_codigo').AsString;
               Execute;
            end;
         end;

         Auditoria('CADASTRO DE MANUTENÇÃO - EXECUÇÃO', 'Cod ' + edtCodigo.Text + '-' +
                   dblIdentModelo.Text + '-' + dblEquip.Text, cOperacao,'');
         AtualizarDados();

         HabilitarCampos(False, False, Self, 1, 2);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
         end;
      end;
   end;
end;

procedure TFormCadManutencao.btnGravarObsClick(Sender: TObject);
begin
   Executar(' UPDATE manut_itens SET' +
            ' ite_obs = ' + QuotedStr(mmoObs.Text) +
            ' WHERE ite_codigo = ' + cdsItens.FieldByName('ite_codigo').AsString);

   AtualizarDadosAcessorios();
   pnlObs.Visible:= False;
end;

procedure TFormCadManutencao.InserirItensManutencao;
begin
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT ite_codigo, man_codigo, ite_descricao' +
                    ' FROM manut_modelo_itens' +
                    ' WHERE man_codigo = ' + QuotedStr(dblIdentModelo.KeyValue);
      Active:= True;

      First;
      while not Eof do begin
         Executar(' INSERT INTO manut_itens(' +
                 ' ite_codigo, man_codigo, ite_descricao, ite_verificado) VALUES(' +
                 BuscarNovoCodigo('manut_itens', 'ite_codigo') + ',' +
                 QuotedStr(edtCodigo.Text) + ',' +
                 QuotedStr(FieldByName('ite_descricao').AsString) + ',' +
                 '0' + // Não verificado por padrão
                 ')');
         Next;
      end;
   end;
end;

procedure TFormCadManutencao.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadManutencao.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgTipoImpressao.ItemIndex:= 0; // Ficha em Branco
   rgTipoManut.ItemIndex    := 2; // Todas
   rgTipoManut.Enabled:= False;
end;

procedure TFormCadManutencao.btnInserirItemClick(Sender: TObject);
begin
   if ValidarDadosItem() then begin
      Executar(' INSERT INTO manut_itens(' +
              ' ite_codigo, man_codigo, ite_descricao, ite_verificado)' +
              ' VALUES (' +
              BuscarNovoCodigo('manut_itens', 'ite_codigo') + ',' +
              QuotedStr(edtCodItens.Text) + ',' +
              QuotedStr(edtItem.Text) + ',' +
              '0' +
              ')');

      AtualizarDadosAcessorios();
   end;
end;

procedure TFormCadManutencao.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 15, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos(Self);
      HabilitarCampos(True, False, Self, 1, 2);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      edtCodigo.Text:= BuscarNovoCodigo('manut', 'man_codigo');
      dblTipoManut.KeyValue:= 1;
      TryFocus(dblIdentModelo);
   end;
end;

procedure TFormCadManutencao.btnPrimeiroClick(Sender: TObject);
begin
   cdsManut.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutencao.btnAnteriorClick(Sender: TObject);
begin
   cdsManut.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutencao.btnProximoClick(Sender: TObject);
begin
   cdsManut.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutencao.btnUltimoClick(Sender: TObject);
begin
   cdsManut.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutencao.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadManutencao.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadManutencao.btnSairObsClick(Sender: TObject);
begin
   pnlObs.Visible:= False;
end;

procedure TFormCadManutencao.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadManutencao.ControlarAbas;
var
   sCodigo: string;
begin
   if pgcManut.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnAlterar.Enabled := False;

      sCodigo:= cdsManut.FieldByName('man_codigo').AsString;
      cdsManut.Filtered:= False;
      if sCodigo <> EmptyStr then begin
         cdsManut.Locate('man_codigo', sCodigo, []);
      end;

      case pgcManut.TabIndex of
         1..2: begin
            AtualizarDadosAcessorios();
         end;
         3: begin
            btnImprimir.Enabled:= False;
            edtValor.Clear;
            TryFocus(edtValor);
         end;
      end;
   end;
end;

procedure TFormCadManutencao.dbgManutCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadManutencao.dbgManutDblClick(Sender: TObject);
var
   sCodigo: string;
begin
   sCodigo:= cdsManut.FieldByName('man_codigo').AsString;
   cdsManut.Filtered:= False;
   if sCodigo <> EmptyStr then begin
      cdsManut.Locate('man_codigo', sCodigo, []);
   end;

   PreencherCampos;
   pgcManut.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadManutencao.dbgItensCellClick(Column: TColumn);
begin
   if cdsItens.RecordCount > 0 then begin
      if Column.Field = cdsItens.FieldByName('ite_verificado') then begin
         cdsItens.Edit;
         if cdsItens.FieldByName('ite_verificado').AsInteger = 0 then begin
            cdsItens.FieldByName('ite_verificado').AsInteger:= 1
         end
         else begin
            cdsItens.FieldByName('ite_verificado').AsInteger:= 0;
         end;

         cdsItens.Post;
         cdsItens.ApplyUpdates(0);
      end;

      if Column.Field = cdsItens.FieldByName('ite_obs') then begin
         lblDescItem.Caption:= cdsItens.FieldByName('ite_descricao').AsString;
         mmoObs.Text        := cdsItens.FieldByName('ite_obs').AsString;
         AbrePanel(pnlObs, Self);
         TryFocus(mmoObs);
      end;
   end;
end;

procedure TFormCadManutencao.dbgItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if cdsItens.RecordCount > 0 then begin
      // Pinta CheckBox
      if Column.Field = cdsItens.FieldByName('ite_verificado') then begin
         dbgItens.Canvas.FillRect(Rect);

         if cdsItens.FieldByName('ite_verificado').AsInteger = 0 then begin
            ImageList.Draw(dbgItens.Canvas,Rect.Left + 22,Rect.Top + 1,1)
         end
         else begin
            ImageList.Draw(dbgItens.Canvas,Rect.Left + 22,Rect.Top + 1,2);
         end;
      end;

      if Column.Field = cdsItens.FieldByName('ite_obs') then begin
         dbgItens.Canvas.FillRect(Rect);

         if cdsItens.FieldByName('ite_obs').AsString <> '' then begin
            ImageList.Draw(dbgItens.Canvas,Rect.Left + 18,Rect.Top + 1,3)
         end;
      end;
   end;
end;

procedure TFormCadManutencao.dbgManutKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadManutencao.dblIdentModeloCloseUp(Sender: TObject);
begin
   edtDescricao.Text:= cdsModeloManut.FieldByName('man_descricao').AsString;
end;

procedure TFormCadManutencao.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> EmptyStr then begin
      case cbbCampo.ItemIndex of
         0: cdsManut.Filter:= 'man_codigo = ' + QuotedStr(edtValor.Text);
         1: cdsManut.Filter:= 'man_descricao LIKE ' + QuotedStr('%' + edtValor.Text + '%');
         2: cdsManut.Filter:= 'equip LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      end;

      cdsManut.Filtered:= True;
   end
   else begin
      cdsManut.Filtered:= False;
   end;
end;

procedure TFormCadManutencao.FormShow(Sender: TObject);
begin
   pgcManut.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
   pnlImprimir.Visible:= False;
//   spnDiasAviso.Hint:= 'Informe em quantos dias de antecedência o sistema deve ' + #13 +
//                       'avisar o vencimento da próxima manutenção preventiva para esse modelo.' + #13 +
//                       '0(zero) para não avisar.';
end;

procedure TFormCadManutencao.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadManutencao.mmoOQueKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadManutencao.pgcManutChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadManutencao.PreencherCampos;
begin
   case pgcManut.TabIndex of
      0: begin // Cadastro
         with cdsManut do begin
            edtCodigo.Text  := FieldByName('man_codigo').AsString;
            dtInicio.Date   := FieldByName('man_datainicio').AsDateTime;
            dtFim.Date      := FieldByName('man_datafim').AsDateTime;
            medtHoraIni.Text:= FieldByName('man_horainicio').AsString;
            medtHoraFim.Text:= FieldByName('man_horafim').AsString;

            if FieldByName('man_modelo').AsString <> EmptyStr then begin
               dblIdentModelo.KeyValue:= FieldByName('man_modelo').AsString;
               dblIdentModeloCloseUp(Self);
            end;

      //      AtualizarItens();
            if FieldByName('man_processo').AsString <> EmptyStr then begin
               dblProcesso.KeyValue:= FieldByName('man_processo').AsString;
            end;

            if FieldByName('man_equipamento').AsString <> EmptyStr then begin
               dblEquip.KeyValue:= FieldByName('man_equipamento').AsString;
            end;

            if FieldByName('man_tipo').AsString <> EmptyStr then begin
               dblTipoManut.KeyValue:= FieldByName('man_tipo').AsString;
            end;
         end;
      end;
      1: begin // Itens
         edtItem.Text:= cdsItens.FieldByName('ite_descricao').AsString;
      end;
   end;
end;

procedure TFormCadManutencao.rgTipoImpressaoClick(Sender: TObject);
begin
   rgTipoManut.Enabled:= rgTipoImpressao.ItemIndex = 1;
end;

function TFormCadManutencao.ValidarDados(): Boolean;
begin
   if dblIdentModelo.KeyValue = -1 then begin
      Application.MessageBox('Campo Modelo Manutenção é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblIdentModelo);
      Result:= False;
      Exit;
   end;

   if dblProcesso.KeyValue = -1 then begin
      Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if dblEquip.KeyValue = -1 then begin
      Application.MessageBox('Campo Máquina ou Equipamento é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblEquip);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormCadManutencao.ValidarDadosItem: Boolean;
begin
   if AllTrim(edtItem.Text) = EmptyStr then begin
      Application.MessageBox('Campo Item de Manutenção é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtItem);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormCadManutencao.ValidarExecutores: Boolean;
begin
   if (dblExecutor.KeyValue = null) or (dblExecutor.KeyValue = -1) then begin
      Application.MessageBox('Campo Executor é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblExecutor);
      Result:= False;
      Exit;
   end;

   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT exe_codigo, man_codigo, exe_executor' +
                    ' FROM manut_executores ' +
                    ' WHERE man_codigo = ' + edtCodigo.Text +
                    ' AND exe_executor = ' + IntToStr(dblExecutor.KeyValue);
      Active:= True;

      if RecordCount > 0 then begin
         Application.MessageBox('O executor já está cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;

procedure TFormCadManutencao.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sExecutores: string;
begin
   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT M.man_codigo, M.man_modelo, M.man_processo, M.man_datainicio, M.man_datafim,' +
                    ' M.man_horainicio, M.man_horafim, M.man_equipamento, ' +
                    ' MM.man_identificacao, MM.man_descricao, MI.ite_obs,' +
                    ' CASE WHEN MI.ite_verificado = ' + QuotedStr('0') + ' THEN ' + QuotedStr('NÃO') +
                         ' ELSE ' + QuotedStr('SIM') +
                    ' END as Verificado,' +
                    ' CAST(I.iden_inf || ' + QuotedStr(' - ') + ' || I.desc_inf as character varying(100)) as Equip,' +
                    ' MI.ite_descricao, P.nome_pro as Processo' +
                    ' FROM manut M' +
                    ' INNER JOIN manut_itens MI ON MI.man_codigo = M.man_codigo' +
                    ' INNER JOIN manut_modelo MM ON MM.man_codigo = M.man_modelo' +
                    ' INNER JOIN infraestrutura I ON I.codi_inf = M.man_equipamento' +
                    ' INNER JOIN processos P ON P.codi_pro = M.man_processo' +
                    ' WHERE M.man_codigo = ' + QuotedStr(edtCodigo.Text) +
                    ' ORDER BY M.man_codigo DESC, MI.ite_descricao';
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   // Monta o registro de Executores
   with cdsManExecutores do begin
      First;
      while not Eof do begin
         sExecutores:= sExecutores + FieldByName('Executor').AsString + '$';
         Next;
      end;
   end;

   if rgTipoImpressao.ItemIndex = 0 then begin
      Imprimir('rel_ManutExecucaoBranco', frxReport1, tipoImp);
   end
   else begin
      Imprimir('rel_ManutExecucaoPreenchida', frxReport1, tipoImp, 'Executores', sExecutores);
   end;
end;

end.
