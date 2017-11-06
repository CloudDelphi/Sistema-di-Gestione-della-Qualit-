unit frm_CadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Grids, DBGrids, FMTBcd, DB,
  DBClient, Provider, SqlExpr, ComCtrls, JvgPage, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, rxToolEdit, DBCtrls, frxClass, frxDBSet,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, JvExStdCtrls, JvHtControls;

type
  TFormCadClientes = class(TForm)
    pnl1: TPanel;
    dspCliente: TDataSetProvider;
    cdsCliente: TClientDataSet;
    dsCliente: TDataSource;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    pctClientes: TJvgPageControl;
    tsCadastro: TTabSheet;
    tsPesquisa: TTabSheet;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbllb7: TLabel;
    lbllb8: TLabel;
    lbl8: TLabel;
    edtEndereco: TEdit;
    edtCep: TMaskEdit;
    mmoObs: TMemo;
    dbgClientes: TDBGrid;
    lbl9: TLabel;
    edtValor: TEdit;
    cbCampo: TComboBox;
    lbl10: TLabel;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    lbl12: TLabel;
    edtFantasia: TEdit;
    edtCodigo: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtNome: TEdit;
    frxDSClientes: TfrxDBDataset;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    lbl15: TLabel;
    edtNumero: TEdit;
    lbl16: TLabel;
    edtMail: TEdit;
    zqryGravar: TZQuery;
    zqryImprimir: TZQuery;
    zqryClientes: TZQuery;
    edtBairro: TEdit;
    edtCidade: TEdit;
    lbl6: TLabel;
    edtContato: TEdit;
    lbl7: TLabel;
    edtInsc: TEdit;
    lbl11: TLabel;
    medtCNPJ: TMaskEdit;
    lbl13: TLabel;
    edtFone: TEdit;
    btn1: TBitBtn;
    btnSairImp: TBitBtn;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    edtEstado: TEdit;
    cdsClientecli_codigo: TIntegerField;
    cdsClientecli_nome: TWideStringField;
    cdsClientecli_endereco: TWideStringField;
    cdsClientecli_numero: TWideStringField;
    cdsClientecli_bairro: TWideStringField;
    cdsClientecli_cidade: TWideStringField;
    cdsClientecli_estado: TWideStringField;
    cdsClientecli_cep: TWideStringField;
    cdsClientecli_fone: TWideStringField;
    cdsClientecli_contato: TWideStringField;
    cdsClientecli_mail: TWideStringField;
    cdsClientecli_inscricao: TWideStringField;
    cdsClientecli_cnpj: TWideStringField;
    cdsClientecli_fantasia: TWideStringField;
    cdsClienteEndereco: TStringField;
    frxReport1: TfrxReport;
    cdsImprimircli_codigo: TIntegerField;
    cdsImprimircli_nome: TWideStringField;
    cdsImprimircli_fantasia: TWideStringField;
    cdsImprimircli_endereco: TWideStringField;
    cdsImprimircli_numero: TWideStringField;
    cdsImprimircli_bairro: TWideStringField;
    cdsImprimircli_cidade: TWideStringField;
    cdsImprimircli_estado: TWideStringField;
    cdsImprimircli_cep: TWideStringField;
    cdsImprimircli_fone: TWideStringField;
    cdsImprimircli_contato: TWideStringField;
    cdsImprimircli_mail: TWideStringField;
    cdsImprimircli_obs: TMemoField;
    cdsImprimircli_inscricao: TWideStringField;
    cdsImprimircli_cnpj: TWideStringField;
    cdsImprimirEndereco: TStringField;
    cdsClientecli_obs: TWideMemoField;
    tsObs: TTabSheet;
    edtCodigoObs: TEdit;
    lbl14: TLabel;
    lbl17: TLabel;
    edtNomeObs: TEdit;
    dbgProcessos: TDBGrid;
    lbl18: TLabel;
    edtContatoObs: TEdit;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    edtMailObs: TEdit;
    edtFoneObs: TEdit;
    edtDeptoObs: TEdit;
    dtDataObs: TDateEdit;
    lbl34: TLabel;
    lbl25: TLabel;
    mmoObsObs: TMemo;
    dsObs: TDataSource;
    cdsObs: TClientDataSet;
    dspObs: TDataSetProvider;
    zqryObs: TZQuery;
    lbl26: TLabel;
    dtDataSaida: TDateEdit;
    lbl27: TLabel;
    dtDataEntrada: TDateEdit;
    cdsClientecli_dataentrada: TDateTimeField;
    cdsClientecli_datasaida: TDateTimeField;
    pnlImpObs: TPanel;
    pnl5: TPanel;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btnSairImpObs: TBitBtn;
    pnl6: TPanel;
    rgOrdemImpressaoObs: TRadioGroup;
    grp1: TGroupBox;
    dblImpClientes: TDBLookupComboBox;
    chkTodosCli: TCheckBox;
    zqryImpClientes: TZQuery;
    dspImpClientes: TDataSetProvider;
    cdsImpClientes: TClientDataSet;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    dsImpClientes: TDataSource;
    cdsTemp: TClientDataSet;
    cdsTempcli_codigo: TIntegerField;
    dsTemp: TDataSource;
    cdsTempcli_nome: TWideStringField;
    frxDBObs: TfrxDBDataset;
    zqryImprimirObs: TZQuery;
    dspImprimirObs: TDataSetProvider;
    cdsImprimirObs: TClientDataSet;
    cdsImprimirObscli_codigo: TIntegerField;
    cdsImprimirObscli_nome: TWideStringField;
    cdsImprimirObscli_fantasia: TWideStringField;
    cdsImprimirObscli_endereco: TWideStringField;
    cdsImprimirObscli_numero: TWideStringField;
    cdsImprimirObscli_bairro: TWideStringField;
    cdsImprimirObscli_cidade: TWideStringField;
    cdsImprimirObscli_estado: TWideStringField;
    cdsImprimirObscli_cep: TWideStringField;
    cdsImprimirObscli_fone: TWideStringField;
    cdsImprimirObscli_contato: TWideStringField;
    cdsImprimirObscli_mail: TWideStringField;
    cdsImprimirObscli_obs: TWideMemoField;
    cdsImprimirObscli_inscricao: TWideStringField;
    cdsImprimirObscli_cnpj: TWideStringField;
    cdsImprimirObscli_codigo_1: TIntegerField;
    cdsImprimirObscli_codicli: TIntegerField;
    cdsImprimirObscli_data: TDateTimeField;
    cdsImprimirObscli_contato_1: TWideStringField;
    cdsImprimirObscli_mail_1: TWideStringField;
    cdsImprimirObscli_fone_1: TWideStringField;
    cdsImprimirObscli_depto: TWideStringField;
    cdsImprimirObscli_obs_1: TWideMemoField;
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure pctClientesChange(Sender: TObject);
    procedure dbgClientesDblClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgClientesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure PreencherCampos;
    procedure Botoes(Flag: Boolean);
//    procedure HabilitaCampos(Flag: Boolean; Codigo: Boolean);
    procedure LimparCampos;
    procedure AtualizarDados;
    procedure ControlarAbas;
    procedure BuscarNovoCodigo(cTipo: string);
    procedure Impressao(tipoImp: string);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure cdsClienteCalcFields(DataSet: TDataSet);
    procedure cdsImprimirCalcFields(DataSet: TDataSet);
    procedure cbCampoCloseUp(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure dbgProcessosCellClick(Column: TColumn);
    procedure btnInserirProcessoClick(Sender: TObject);
    procedure btnSairImpObsClick(Sender: TObject);
    procedure chkTodosCliClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sCodigoObs: string;
  public
    { Public declarations }
  end;

var
  FormCadClientes: TFormCadClientes;

implementation

uses Funcoes, frm_dm, frm_Inicial;

{$R *.dfm}

procedure TFormCadClientes.AtualizarDados;
begin
   with cdsCliente do begin
      Active:= False;
      CommandText:= ' SELECT cli_codigo, cli_nome, cli_fantasia, cli_endereco, cli_numero, ' +
                    ' cli_bairro, cli_cidade, cli_estado, cli_cep,' +
                    ' cli_fone, cli_contato, cli_mail, cli_obs, cli_inscricao, cli_cnpj,' +
                    ' cli_dataentrada, cli_datasaida' +
                    ' FROM Clientes' +
                    ' WHERE cli_codigo < 999999' +
                    ' ORDER BY cli_nome';
      Active:= True;
   end;

   if cOperacao = 'A' then begin
      cdsCliente.Locate('cli_codigo',edtCodigo.Text,[])
   end;
end;

procedure TFormCadClientes.AtualizarDadosAcessorios;
begin
//   edtCodigoObs.Text:= edtCodigo.Text;
//   edtNomeObs.Text  := edtNome.Text;

   if edtCodigoObs.Text <> EmptyStr then begin
      with cdsObs do begin
         Active:= False;
         CommandText:= ' SELECT cli_codigo, cli_codicli, cli_data, cli_contato, cli_mail, cli_fone, cli_depto, cli_obs' +
                       ' FROM clientes_obs' +
                       ' WHERE cli_codicli = ' + QuotedStr(edtCodigoObs.Text) +
                       ' ORDER BY cli_data';
         Active:= True;

         if pctClientes.TabIndex = 1 then begin
            btnAlterar.Enabled:= RecordCount > 0;
            btnExcluir.Enabled:= RecordCount > 0;
         end;
      end;
   end;
end;

procedure TFormCadClientes.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsCliente.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadClientes.BuscarNovoCodigo(cTipo: string);
begin
   if cTipo = 'cadastro' then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT MAX(cli_codigo) AS NovoCodigo FROM clientes' +
                       ' WHERE cli_codigo < 999999';
         Active:= True;

         if FieldByName('NovoCodigo').AsString = EmptyStr then begin
            edtCodigo.Text:= '1';
         end
         else begin
            edtCodigo.Text:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
         end;
      end;
   end;

   if cTipo = 'obs' then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT MAX(cli_codigo) AS NovoCodigo FROM clientes_obs';
         Active:= True;

         if FieldByName('NovoCodigo').AsString = EmptyStr then begin
            sCodigoObs:= '1';
         end
         else begin
            sCodigoObs:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
         end;
      end;
   end;
end;

procedure TFormCadClientes.cbCampoCloseUp(Sender: TObject);
begin
   TryFocus(edtValor);
end;

procedure TFormCadClientes.cdsClienteCalcFields(DataSet: TDataSet);
begin
   cdsClienteEndereco.AsString:= cdsClientecli_endereco.AsString + ', ' + cdsClientecli_numero.AsString;
end;

procedure TFormCadClientes.cdsImprimirCalcFields(DataSet: TDataSet);
begin
   cdsImprimirEndereco.AsString:= cdsImprimircli_endereco.AsString + ', ' + cdsImprimircli_numero.AsString;
end;

procedure TFormCadClientes.chkTodosCliClick(Sender: TObject);
begin
   dblImpClientes.Enabled:= not chkTodosCli.Checked;
end;

procedure TFormCadClientes.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadClientes.btnExcluirClick(Sender: TObject);
begin
   cOperacao:= 'E';

   if pctClientes.TabIndex = 0 then begin
      if (Acesso(cUsuario, 4, 'exclusao') = 1) then begin
         if Application.MessageBox('Confirma a exclusão do cliente e suas observações ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            // Exclui as observações do cliente
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM clientes_obs' +
                             ' WHERE cli_codicli = ' + QuotedStr(edtCodigo.Text);
               Execute;
            end;

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM Clientes' +
                             ' WHERE cli_codigo = ' + QuotedStr(edtCodigo.Text);
               Execute;
            end;
         end;

         LimparCampos();
         AtualizarDados;
         PreencherCampos;
         Botoes(True);
      end;
   end;
   if pctClientes.TabIndex = 1 then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM clientes_obs' +
                          ' WHERE cli_codigo = ' + cdsObs.FieldByName('cli_codigo').AsString;
            Execute;
         end;

         LimparCampos();
         AtualizarDadosAcessorios();
         PreencherCampos();
         Botoes(True);
      end;
   end;
end;

procedure TFormCadClientes.btnCancelarClick(Sender: TObject);
begin
   LimparCampos();
   PreencherCampos;
   Botoes(True);

   if pctClientes.TabIndex = 0 then begin
      HabilitarCampos(False, False, Self, 1, 2);
   end;

   if pctClientes.TabIndex = 1 then begin
      HabilitarCampos(False, False, Self, 2);
   end;
end;

procedure TFormCadClientes.btnGravarClick(Sender: TObject);
begin
   try
      if pctClientes.TabIndex = 0 then begin // Cadastro
         // Verifica se o código digitado já existe
         if cOperacao = 'I' then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) AS Qtd' +
                             ' FROM clientes' +
                             ' WHERE cli_codigo = ' + QuotedStr(edtCodigo.Text);
               Active:= True;

               if FieldByName('Qtd').AsInteger > 0 then begin
                  Application.MessageBox(PChar('Já existe um cliente cadastrado com o código ' + edtCodigo.Text), 'Confirmação', MB_OK + MB_ICONWARNING);
                  TryFocus(edtCodigo);
                  Exit;
               end;
            end;
         end;

         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO clientes ( ' +
                             ' cli_codigo, cli_nome, cli_fantasia, cli_endereco, cli_numero, cli_bairro, cli_cidade, ' +
                             ' cli_estado, cli_cep, cli_fone, cli_contato, cli_mail, cli_inscricao, cli_cnpj,' +
                             ' cli_obs, cli_dataentrada, cli_datasaida)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             QuotedStr(edtNome.Text) + ',' +
                             QuotedStr(edtFantasia.Text) + ',' +
                             QuotedStr(edtEndereco.Text) + ',' +
                             QuotedStr(edtNumero.Text) + ',' +
                             QuotedStr(edtBairro.Text) + ',' +
                             QuotedStr(edtCidade.Text) + ',' +
                             QuotedStr(edtEstado.Text) + ',' +
                             QuotedStr(edtCep.Text) + ',' +
                             QuotedStr(edtFone.Text) + ',' +
                             QuotedStr(edtContato.Text) + ',' +
                             QuotedStr(edtMail.Text) + ',' +
                             QuotedStr(edtInsc.Text) + ',' +
                             QuotedStr(medtCNPJ.Text) + ',' +
                             QuotedStr(mmoObs.Text) + ',' +
                             ArrumaDataSQL(dtDataEntrada.Date) + ',' +
                             ArrumaDataSQL(dtDataSaida.Date) +
                             ')';
            end
            else begin
               CommandText:= ' UPDATE clientes SET' +
                             ' cli_nome = ' + QuotedStr(edtNome.Text) + ',' +
                             ' cli_fantasia = ' + QuotedStr(edtFantasia.Text) + ',' +
                             ' cli_endereco = ' + QuotedStr(edtEndereco.Text) + ',' +
                             ' cli_numero = ' + QuotedStr(edtNumero.Text) + ',' +
                             ' cli_bairro = ' + QuotedStr(edtBairro.Text) + ',' +
                             ' cli_cidade = ' + QuotedStr(edtCidade.Text) + ',' +
                             ' cli_estado = ' + QuotedStr(edtEstado.Text) + ',' +
                             ' cli_cep = ' + QuotedStr(edtCep.Text) + ',' +
                             ' cli_fone = ' + QuotedStr(edtFone.Text) + ',' +
                             ' cli_contato = ' + QuotedStr(edtContato.Text) + ',' +
                             ' cli_mail = ' + QuotedStr(edtMail.Text) + ',' +
                             ' cli_inscricao = ' + QuotedStr(edtInsc.Text) + ',' +
                             ' cli_cnpj = ' + QuotedStr(medtCNPJ.Text) + ',' +
                             ' cli_obs =  ' + QuotedStr(mmoObs.Text) + ',' +
                             ' cli_dataentrada = ' + ArrumaDataSQL(dtDataEntrada.Date) + ',' +
                             ' cli_datasaida = ' + ArrumaDataSQL(dtDataSaida.Date) +
                             ' WHERE cli_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;
         end;

         AtualizarDados();

         HabilitarCampos(False, False, Self, 1, 2);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;

      if pctClientes.TabIndex = 1 then begin // Observações
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO clientes_obs ( ' +
                             ' cli_codigo, cli_codicli, cli_data, cli_contato, cli_mail, cli_fone,' +
                             ' cli_depto, cli_obs)' +
                             ' VALUES(' +
                             sCodigoObs + ',' +
                             QuotedStr(edtCodigoObs.Text) + ',' +
                             ArrumaDataSQL(dtDataObs.Date) + ',' +
                             QuotedStr(edtContatoObs.Text) + ',' +
                             QuotedStr(edtMailObs.Text) + ',' +
                             QuotedStr(edtFoneObs.Text) + ',' +
                             QuotedStr(edtDeptoObs.Text) + ',' +
                             QuotedStr(mmoObsObs.Text) +
                             ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE clientes_obs SET ' +
                             ' cli_data = ' + ArrumaDataSQL(dtDataObs.Date) + ',' +
                             ' cli_contato = ' + QuotedStr(edtContatoObs.Text) + ',' +
                             ' cli_mail = ' + QuotedStr(edtMailObs.Text) + ',' +
                             ' cli_fone = ' + QuotedStr(edtFoneObs.Text) + ',' +
                             ' cli_depto = ' + QuotedStr(edtDeptoObs.Text) + ',' +
                             ' cli_obs = ' + QuotedStr(mmoObsObs.Text) +
                             ' WHERE cli_codigo = ' + cdsObs.FieldByName('cli_codigo').AsString;
               Execute;
            end;
         end;
         HabilitarCampos(False, False, Self, 2);
         AtualizarDadosAcessorios();
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;

   Botoes(True);
end;

procedure TFormCadClientes.btnAlterarClick(Sender: TObject);
begin
   if pctClientes.TabIndex = 0 then begin
      if (Acesso(cUsuario, 32, 'alteracao') = 1) then begin
         cOperacao:= 'A';
         HabilitarCampos(True, False, Self, 1, 2);
         TryFocus(edtNome);
         Botoes(False);
      end;
   end;

   if pctClientes.TabIndex = 1 then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 2);
      TryFocus(dtDataObs);
      Botoes(False);
   end;
end;

procedure TFormCadClientes.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadClientes.btnImprimirClick(Sender: TObject);
begin
   if pctClientes.TabIndex = 0 then begin // Cadastro
      pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
      pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
      pnlImprimir.Visible := True;

      rgOrdemImpressao.ItemIndex:= 0;
   end;
   if pctClientes.TabIndex = 1 then begin // Observações
      with cdsImpClientes do begin
         Active:= False;
         Active:= True;
      end;

      AbrePanel(pnlImpObs, Self);
      rgOrdemImpressaoObs.ItemIndex:= 0;
      dblImpClientes.KeyValue:= edtCodigoObs.Text;
   end;
end;

procedure TFormCadClientes.btnInserirProcessoClick(Sender: TObject);
begin
//   cdsTemp.Open;
//   cdsTemp.Append;
//   cdsTemp.FieldByName('cli_codigo').AsInteger:= dblImpClientes.KeyValue;
//   cdsTemp.FieldByName('cli_nome').AsString   := dblImpClientes.Text;
//   cdsTemp.Post;
end;

procedure TFormCadClientes.btnNovoClick(Sender: TObject);
begin
   case pctClientes.TabIndex of
      0: begin // Cadastro
         if (Acesso(cUsuario, 32, 'cadastro') = 1) then begin
            cOperacao:= 'I';
            LimparCampos();
            HabilitarCampos(True, True, Self, 1, 2);
//            HabilitarCampos(True, False, Self, 2);
            Botoes(False);
            btnExcluir.Enabled:= False;
            btnAlterar.Enabled:= False;
            BuscarNovoCodigo('cadastro');
            TryFocus(edtCodigo);
         end;
      end;
      1: begin // Observações
//         if (Acesso(cUsuario, 32, 'cadastro') = 2) then begin
            cOperacao:= 'I';
            LimparCampos();
            HabilitarCampos(True, False, Self, 2);
            Botoes(False);
            btnExcluir.Enabled:= False;
            btnAlterar.Enabled:= False;
            BuscarNovoCodigo('obs');
            TryFocus(dtDataObs);
//         end;
      end;
   end;
end;

procedure TFormCadClientes.btnPrimeiroClick(Sender: TObject);
begin
   cdsCliente.First;
//   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadClientes.btnAnteriorClick(Sender: TObject);
begin
   cdsCliente.Prior;
//   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadClientes.btnProximoClick(Sender: TObject);
begin
   cdsCliente.Next;
//   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadClientes.btnUltimoClick(Sender: TObject);
begin
   cdsCliente.Last;
//   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   PreencherCampos();
end;

procedure TFormCadClientes.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadClientes.btnSairImpObsClick(Sender: TObject);
begin
   pnlImpObs.Visible:= False;
end;

procedure TFormCadClientes.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadClientes.ControlarAbas;
begin
   case pctClientes.TabIndex of
      0: begin // Cadastro
         Botoes(True);
         if edtCodigo.Text <> EmptyStr then begin
            cdsCliente.Filtered:= False;
            cdsCliente.Locate('cli_codigo', edtCodigo.Text, []);
         end;
      end;
      1: begin // Observações
         Botoes(True);
         edtCodigoObs.Text:= edtCodigo.Text;
         edtNomeObs.Text  := edtNome.Text;
         if cdsCliente.RecordCount > 0 then begin
            AtualizarDadosAcessorios();
            PreencherCampos();
            btnNovo.Enabled    := True;
            btnImprimir.Enabled:= True;
         end
         else begin
            btnNovo.Enabled    := False;
            btnImprimir.Enabled:= False;
         end;
      end;
      2: begin // Pesquisa
         btnNovo.Enabled:= False;
         btnGravar.Enabled:= False;
         btnExcluir.Enabled:= False;
         btnCancelar.Enabled:= False;
         btnImprimir.Enabled:= False;
         btnAlterar.Enabled:= False;

         if pctClientes.TabIndex = 2 then begin
            edtValor.Enabled:= True;
            edtValor.Clear;
            TryFocus(edtValor);
         end;
      end;
   end;
end;

procedure TFormCadClientes.dbgClientesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadClientes.dbgClientesDblClick(Sender: TObject);
begin
   PreencherCampos();
   pctClientes.TabIndex:= 0;
   ControlarAbas();
end;

procedure TFormCadClientes.dbgClientesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadClientes.dbgProcessosCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadClientes.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsCliente.Filter:= 'cli_codigo LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      1: cdsCliente.Filter:= 'cli_nome LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      2: cdsCliente.Filter:= 'cli_fantasia LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      3: cdsCliente.Filter:= 'cli_endereco LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

   cdsCliente.Filtered:= True;
end;

procedure TFormCadClientes.FormShow(Sender: TObject);
begin
   pctClientes.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   AtualizarDadosAcessorios();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
   pnlImprimir.Visible:= False;
//   pctClientes.Pages[1].TabVisible:= False;
   chkTodosCli.Checked:= False;
end;

procedure TFormCadClientes.Impressao(tipoImp: string);
var
   sCampoOrdem, select, sRel: string;
begin
   if pctClientes.TabIndex = 0 then begin // Cadastro
      case rgOrdemImpressao.ItemIndex of
         0: sCampoOrdem:= 'cli_codigo';
         1: sCampoOrdem:= 'cli_nome';
         2: sCampoOrdem:= 'cli_fantasia'
      end;

      with cdsImprimir do begin
         Active:= False;
         CommandText:= ' SELECT cli_codigo, cli_nome, cli_fantasia, cli_endereco, cli_numero, ' +
                       ' cli_bairro, cli_cidade, cli_estado, cli_cep,' +
                       ' cli_fone, cli_contato, cli_mail, cli_obs, cli_inscricao, cli_cnpj' +
                       ' FROM clientes' +
                       ' WHERE cli_codigo < 999999' +
                       ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimir.RecordCount = 0 then begin
         Application.MessageBox('Não há clientes cadastrados','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaClientes.fr3');
   end;

   if pctClientes.TabIndex = 1 then begin // Observações
      case rgOrdemImpressaoObs.ItemIndex of
         0: sCampoOrdem:= 'C.cli_codigo, O.cli_data';
         1: sCampoOrdem:= 'C.cli_codigo, O.cli_contato';
      end;

      with cdsImprimirObs do begin
         Active:= False;
         CommandText:= ' SELECT C.cli_codigo, C.cli_nome, C.cli_fantasia, C.cli_endereco, C.cli_numero, ' +
                       ' C.cli_bairro, C.cli_cidade, C.cli_estado, C.cli_cep, ' +
                       ' C.cli_fone, C.cli_contato, C.cli_mail, C.cli_obs, C.cli_inscricao, C.cli_cnpj,' +
                       ' O.cli_codigo, O.cli_codicli, O.cli_data, O.cli_contato,' +
                       ' O.cli_mail, O.cli_fone, O.cli_depto, O.cli_obs, C.cli_nome' +
                       ' FROM clientes_obs O' +
                       ' INNER JOIN clientes C ON C.cli_codigo = O.cli_codicli';
         if (chkTodosCli.Checked = False) and (dblImpClientes.KeyValue > 0) and (dblImpClientes.KeyValue <> null) then begin
            CommandText:= CommandText + ' WHERE C.cli_codigo = ' + QuotedStr(dblImpClientes.KeyValue);
         end;
         CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
         Active:= True;
      end;

      if cdsImprimirObs.RecordCount = 0 then begin
         Application.MessageBox('Não há observações cadastradas','Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;

      frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaClientesObs.fr3');
   end;

   with frxReport1 do begin
      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

procedure TFormCadClientes.LimparCampos;
begin
   if pctClientes.TabIndex = 0 then begin // Cadastro
      edtCodigo.Clear;
      edtNome.Clear;
      edtFantasia.Clear;
      edtEndereco.Clear;
      edtNumero.Clear;
      edtBairro.Clear;
      edtCidade.Clear;
      edtCep.Clear;
      edtEstado.Clear;
      edtContato.Clear;
      edtMail.Clear;
      edtInsc.Clear;
      medtCNPJ.Clear;
      edtFone.Clear;
      mmoObs.Clear;
      dtDataEntrada.Clear;
      dtDataSaida.Clear;
   end;
   if pctClientes.TabIndex = 1 then begin // Obervações
      dtDataObs.Clear;
      edtContatoObs.Clear;
      edtMailObs.Clear;
      edtFoneObs.Clear;
      edtDeptoObs.Clear;
      mmoObsObs.Clear;
   end;
end;

procedure TFormCadClientes.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadClientes.pctClientesChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadClientes.PreencherCampos;
begin
   with cdsCliente do begin
//      edtCodigo.Text := FieldByName('cli_codigo').AsString;
      edtCodigoObs.Text:= FieldByName('cli_codigo').AsString; // edtCodigo.Text;
      edtNomeObs.Text  := FieldByName('cli_nome').AsString; // edtNome.Text;
   end;

//   if pctClientes.TabIndex = 0 then begin // Cadastro
      with cdsCliente do begin
         edtCodigo.Text    := FieldByName('cli_codigo').AsString;
         edtNome.Text      := FieldByName('cli_nome').AsString;
         edtFantasia.Text  := FieldByName('cli_fantasia').AsString;
         edtEndereco.Text  := FieldByName('cli_endereco').AsString;
         edtNumero.Text    := FieldByName('cli_numero').AsString;
         edtBairro.Text    := FieldByName('cli_bairro').AsString;
         edtCidade.Text    := FieldByName('cli_cidade').AsString;
         edtEstado.Text    := FieldByName('cli_estado').AsString;
         edtCep.Text       := FieldByName('cli_cep').AsString;
         edtFone.Text      := FieldByName('cli_fone').AsString;
         edtContato.Text   := FieldByName('cli_contato').AsString;
         edtMail.Text      := FieldByName('cli_mail').AsString;
         edtInsc.Text      := FieldByName('cli_inscricao').AsString;
         medtCNPJ.Text     := FieldByName('cli_cnpj').AsString;
         mmoObs.Text       := FieldByName('cli_obs').AsString;
         dtDataEntrada.Date:= FieldByName('cli_dataentrada').AsDateTime;
         dtDataSaida.Date  := FieldByName('cli_datasaida').AsDateTime;
      end;
//   end;

   if pctClientes.TabIndex = 1 then begin // Observações
      with cdsObs do begin
         dtDataObs.Date    := FieldByName('cli_data').AsDateTime;
         edtContatoObs.Text:= FieldByName('cli_contato').AsString;
         edtMailObs.Text   := FieldByName('cli_mail').AsString;
         edtFoneObs.Text   := FieldByName('cli_fone').AsString;
         edtDeptoObs.Text  := FieldByName('cli_depto').AsString;
         mmoObsObs.Text    := FieldByName('cli_obs').AsString;
      end;
   end;
end;

end.
