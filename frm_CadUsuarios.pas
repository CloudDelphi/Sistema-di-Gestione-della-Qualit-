unit frm_CadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, ImgList, DBCtrls;

type
  TFormCadUsuarios = class(TForm)
    pctUsuarios: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgHabilidades: TDBGrid;
    zqryUsuarios: TZQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    dsUsuarios: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    frxDBAcessos: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryFuncoesSys: TZQuery;
    dspFuncoesSys: TDataSetProvider;
    cdsFuncoesSys: TClientDataSet;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    frxReport1: TfrxReport;
    rgProcessos: TRadioGroup;
    grp1: TGroupBox;
    chkAnalise: TCheckBox;
    chkIndicadores: TCheckBox;
    chkProcedimentos: TCheckBox;
    chkRegistros: TCheckBox;
    chkAcaoCorretiva: TCheckBox;
    chkInfraestrutura: TCheckBox;
    chkManutencao: TCheckBox;
    chkMatriz: TCheckBox;
    grp2: TGroupBox;
    chkAprovDoc: TCheckBox;
    tsAcessos: TTabSheet;
    tsProcessos: TTabSheet;
    dbgAcessos: TDBGrid;
    cdsUsuariosnome_usu: TWideStringField;
    cdsUsuariossenh_usu: TWideStringField;
    cdsUsuariosproc_usu: TWideStringField;
    cdsUsuariosAcaoCorretiva: TWideStringField;
    cdsUsuariosAnalise: TWideStringField;
    cdsUsuariosIndicadores: TWideStringField;
    cdsUsuariosInfraestrutura: TWideStringField;
    cdsUsuariosManutencao: TWideStringField;
    cdsUsuariosMatriz: TWideStringField;
    cdsUsuariosProcedimentos: TWideStringField;
    cdsUsuariosRegistros: TWideStringField;
    cdsUsuariosAprovaDoc: TWideStringField;
    lbl2: TLabel;
    edtUsuarioAcessos: TEdit;
    lbl3: TLabel;
    edtUsuarioProcessos: TEdit;
    pnl1: TPanel;
    pnl4: TPanel;
    btnGravarAcessos: TBitBtn;
    btnCancelarAcessos: TBitBtn;
    btnImprimirAcessos: TBitBtn;
    btnSairAcessos: TBitBtn;
    btnAlterarAcessos: TBitBtn;
    pnl5: TPanel;
    btn8: TBitBtn;
    btn9: TBitBtn;
    btn10: TBitBtn;
    btn11: TBitBtn;
    pnl6: TPanel;
    btnSairProcessos: TBitBtn;
    pnl7: TPanel;
    btn20: TBitBtn;
    btn21: TBitBtn;
    btn22: TBitBtn;
    btn23: TBitBtn;
    pnl8: TPanel;
    btnSairPesquisa: TBitBtn;
    pnl9: TPanel;
    btn3: TBitBtn;
    btn12: TBitBtn;
    btn13: TBitBtn;
    btn14: TBitBtn;
    zqryAcessos: TZQuery;
    dspAcessos: TDataSetProvider;
    cdsAcessos: TClientDataSet;
    cdsAcessosalteracao: TSmallintField;
    cdsAcessoscadastro: TSmallintField;
    cdsAcessosacesso: TSmallintField;
    cdsAcessosexclusao: TSmallintField;
    cdsAcessosfunc_ace: TLargeintField;
    CdsAcessosusua_ace1: TWideStringField;
    dsAcessos: TDataSource;
    ImageList: TImageList;
    cdsFuncoesSyscodi_com: TLargeintField;
    cdsFuncoesSysvalo_com: TWideStringField;
    btnDesmarcar: TBitBtn;
    btnMarcar: TBitBtn;
    lbl18: TLabel;
    dblProcessos: TDBLookupComboBox;
    btnInserirProcesso: TBitBtn;
    btnExcluirProcesso: TBitBtn;
    dbgProcessos: TDBGrid;
    zqryProcUsu: TZQuery;
    dspProcUsu: TDataSetProvider;
    cdsProcUsu: TClientDataSet;
    CdsProcUsuusu_nome1: TWideStringField;
    cdsProcUsuusu_proc: TLargeintField;
    dsProcUsu: TDataSource;
    dsProcessos: TDataSource;
    cdsProcessos: TClientDataSet;
    dspProcessos: TDataSetProvider;
    zqryProcessos: TZQuery;
    cdsProcUsuNomeProcesso: TStringField;
    cdsImprimiralteracao: TSmallintField;
    cdsImprimircadastro: TSmallintField;
    cdsImprimiracesso: TSmallintField;
    cdsImprimirexclusao: TSmallintField;
    cdsImprimirfunc_ace: TLargeintField;
    cdsImprimirusua_ace: TWideStringField;
    cdsAcessosdescfunc: TWideStringField;
    btnInserirTodos: TBitBtn;
    chkPDCA: TCheckBox;
    cdsUsuariospdca: TWideStringField;
    chkRisco: TCheckBox;
    cdsUsuariosrisco: TWideStringField;
    btnCancelar: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    btnSair: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    tsPendencias: TTabSheet;
    grp3: TGroupBox;
    chkPend_indicadores: TCheckBox;
    chkPend_calibracao: TCheckBox;
    chkPend_pmceficacia: TCheckBox;
    chkPend_pmcacoes: TCheckBox;
    chkPend_forn: TCheckBox;
    chkPend_procedimentos: TCheckBox;
    chkPend_treinamentoeficacia: TCheckBox;
    chkPend_treinamentosvencido: TCheckBox;
    chkPend_educacao: TCheckBox;
    chkPend_experiencia: TCheckBox;
    chkPend_manutencao: TCheckBox;
    chkPend_pdca: TCheckBox;
    chkPend_analisecritica: TCheckBox;
    chkPend_habilidades: TCheckBox;
    chkPend_avalhabilidade: TCheckBox;
    pnl10: TPanel;
    btn1: TBitBtn;
    pnl11: TPanel;
    btn2: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    edtUsuarioPend: TEdit;
    lbl5: TLabel;
    btnMarcarPend: TBitBtn;
    btnDesmarcarPend: TBitBtn;
    btnGravarPend: TBitBtn;
    btnCancelarPend: TBitBtn;
    btnAlterarPend: TBitBtn;
    cdsUsuariosusu_pend_habilidades: TIntegerField;
    cdsUsuariosusu_pend_analisecritica: TIntegerField;
    cdsUsuariosusu_pend_pdcaacoes: TIntegerField;
    cdsUsuariosusu_pend_manutpreventiva: TIntegerField;
    cdsUsuariosusu_pend_colexperiencia: TIntegerField;
    cdsUsuariosusu_pend_coleducacao: TIntegerField;
    cdsUsuariosusu_pend_treinprevisao: TIntegerField;
    cdsUsuariosusu_pend_treineficacia: TIntegerField;
    cdsUsuariosusu_pend_avaliacao: TIntegerField;
    cdsUsuariosusu_pend_procedimentos: TIntegerField;
    cdsUsuariosusu_pend_forn: TIntegerField;
    cdsUsuariosusu_pend_pmcacoes: TIntegerField;
    cdsUsuariosusu_pend_pmc: TIntegerField;
    cdsUsuariosusu_pend_calibracao: TIntegerField;
    cdsUsuariosusu_pend_indicadores: TIntegerField;
    grp4: TGroupBox;
    chkCliente: TCheckBox;
    cdsUsuariosusu_desabilita_cliente_forn: TIntegerField;
    chkPend_pmc_causa: TCheckBox;
    chkPend_pmc_acaoimediata: TCheckBox;
    chkRNC: TCheckBox;
    cdsUsuariosrnc: TWideStringField;
    cdsUsuariosusu_pend_pmc_causa: TIntegerField;
    cdsUsuariosusu_pend_pmc_acaoimediata: TIntegerField;
    chkPend_rnc_naopreenchido: TCheckBox;
    chkPend_rnc_aceiterecusa: TCheckBox;
    cdsUsuariosusu_pend_rnc_naopreenchido: TIntegerField;
    cdsUsuariosusu_pend_rnc_aceite: TIntegerField;
    cdsImprimirdescfuncao: TWideStringField;
    edtConfSenha: TEdit;
    lbl6: TLabel;
    chkVisualizaSenha: TCheckBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos;
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
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
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure dbgHabilidadesDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctUsuariosChange(Sender: TObject);
    procedure AtualizarDadosAcessorios();
    procedure dbgAcessosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgAcessosColEnter(Sender: TObject);
    procedure dbgAcessosCellClick(Column: TColumn);
    procedure btnMarcarClick(Sender: TObject);
    procedure ControlarMarcacoes(Status: Integer);
    procedure btnDesmarcarClick(Sender: TObject);
    procedure btnAlterarAcessosClick(Sender: TObject);
    procedure tsAcessosEnter(Sender: TObject);
    procedure tsProcessosEnter(Sender: TObject);
    procedure btnCancelarAcessosClick(Sender: TObject);
    procedure btnGravarAcessosClick(Sender: TObject);
    procedure cdsAcessosAfterPost(DataSet: TDataSet);
    procedure GravaAcessos(parUsuario: string);
    procedure btnInserirProcessoClick(Sender: TObject);
    procedure dbgProcessosCellClick(Column: TColumn);
    procedure btnExcluirProcessoClick(Sender: TObject);
    procedure btnInserirTodosClick(Sender: TObject);
    procedure btnMarcarPendClick(Sender: TObject);
    procedure btnDesmarcarPendClick(Sender: TObject);
    procedure btnAlterarPendClick(Sender: TObject);
    procedure btnGravarPendClick(Sender: TObject);
    procedure btnCancelarPendClick(Sender: TObject);
    procedure edtConfSenhaExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure chkVisualizaSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: string;
  end;

var
  FormCadUsuarios: TFormCadUsuarios;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormCadUsuarios.AtualizarDados;
begin
   with cdsFuncoesSys do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 99' +
                    ' ORDER BY orde_com';
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

   with cdsUsuarios do begin
      Active:= False;
      CommandText:= ' SELECT  nome_usu, senh_usu, proc_usu, AcaoCorretiva, ' +
                    ' Analise, Indicadores, Infraestrutura,' +
                    ' Manutencao, Matriz, Procedimentos, Registros, AprovaDoc, ' +
                    ' pdca, risco, rnc, usu_pend_habilidades, usu_pend_analisecritica, ' +
                    ' usu_pend_pdcaacoes, usu_pend_manutpreventiva, usu_pend_colexperiencia,' +
                    ' usu_pend_coleducacao, usu_pend_treinprevisao, usu_pend_treineficacia, ' +
                    ' usu_pend_avaliacao, usu_pend_procedimentos, usu_pend_forn, ' +
                    ' usu_pend_pmcacoes, usu_pend_pmc, usu_pend_calibracao, usu_pend_indicadores,' +
                    ' usu_desabilita_cliente_forn, usu_pend_pmc_causa, usu_pend_pmc_acaoimediata,' +
                    ' usu_pend_rnc_naopreenchido, usu_pend_rnc_aceite' +
                    ' FROM usuarios' +
                    ' WHERE nome_usu <> ' + QuotedStr('-- N/A --') +
                    ' ORDER BY nome_usu';
      Active:= True;
   end;

   if AllTrim(edtUsuario.Text) <> EmptyStr then begin
      cdsUsuarios.Locate('nome_usu', edtUsuario.Text,[])
   end;
end;

procedure TFormCadUsuarios.AtualizarDadosAcessorios;
begin
   edtUsuarioAcessos.Text  := edtUsuario.Text;
   edtUsuarioProcessos.Text:= edtUsuario.Text;
   edtUsuarioPend.Text     := edtUsuario.Text;

   with cdsAcessos do begin
      Active:= False;
      CommandText:= ' SELECT alteracao, cadastro, acesso, exclusao, func_ace,  usua_ace, ' +
                    ' TC.valo_com as DescFunc' +
                    ' FROM acessos A' +
                    ' INNER JOIN tabela_combos TC ON A.func_ace = TC.codi_com AND TC.tipo_com = 99' +
                    ' WHERE usua_ace = ' + QuotedStr(AllTrim(edtUsuario.Text)) +
                    ' ORDER BY func_ace';
      Active:= True;
   end;

   with cdsProcUsu do begin
      Active:= False;
      CommandText:= ' SELECT usu_nome, usu_proc FROM usuarios_processos' +
                    ' WHERE usu_nome = ' + QuotedStr(AllTrim(edtUsuario.Text));
      Active:= True;
   end;

   with cdsProcUsu do begin
      Active:= False;
      CommandText:= ' SELECT usu_nome, usu_proc FROM usuarios_processos' +
                    ' WHERE usu_nome = ' + QuotedStr(AllTrim(edtUsuario.Text));
      Active:= True;
   end;
end;

procedure TFormCadUsuarios.Botoes(Flag: Boolean);
begin
   case pctUsuarios.TabIndex of
      0: begin
         btnNovo.Enabled    := Flag;
         btnAlterar.Enabled := Flag;
         btnExcluir.Enabled := Flag;
         btnGravar.Enabled  := not Flag;
         btnCancelar.Enabled:= not Flag;

         if cdsUsuarios.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;
      1: begin // Acessos
         btnAlterarAcessos.Enabled := Flag;
         btnGravarAcessos.Enabled  := not Flag;
         btnCancelarAcessos.Enabled:= not Flag;
         btnImprimirAcessos.Enabled:= Flag;
         btnMarcar.Enabled         := not Flag;
         btnDesmarcar.Enabled      := not Flag;
      end;
      3: begin // Pendências
         btnAlterarPend.Enabled  := Flag;
         btnGravarPend.Enabled   := not Flag;
         btnCancelarPend.Enabled := not Flag;
         btnMarcarPend.Enabled   := not Flag;
         btnDesmarcarPend.Enabled:= not Flag;
      end;
   end;
end;

procedure TFormCadUsuarios.btnDesmarcarClick(Sender: TObject);
begin
   ControlarMarcacoes(0);
end;

procedure TFormCadUsuarios.btnMarcarClick(Sender: TObject);
begin
   ControlarMarcacoes(1);
end;

procedure TFormCadUsuarios.btnMarcarPendClick(Sender: TObject);
var
   i: Integer;
begin
   for i:= 0 to Self.ComponentCount - 1 do begin
      if Self.Components[i] is TCheckBox then begin
         (Self.Components[i] as TCheckBox).Checked:= True;
      end;
   end;
end;

procedure TFormCadUsuarios.btnDesmarcarPendClick(Sender: TObject);
var
   i: Integer;
begin
   for i:= 0 to Self.ComponentCount - 1 do begin
      if Self.Components[i] is TCheckBox then begin
         (Self.Components[i] as TCheckBox).Checked:= False;
      end;
   end;
end;

procedure TFormCadUsuarios.btnInserirTodosClick(Sender: TObject);
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
            CommandText:= ' SELECT COUNT(*) qtd FROM usuarios_processos' +
                          ' WHERE usu_nome = ' + QuotedStr(edtUsuario.Text) +
                          '       AND usu_proc = ' + IntToStr(dm.cdsAux.FieldByName('codi_pro').AsInteger);
            Active:= True;
         end;
         if dm.cdsAuxiliar.FieldByName('qtd').AsInteger <= 0 then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO usuarios_processos (usu_nome, usu_proc)' +
                             ' VALUES(' +
                             QuotedStr(edtUsuario.Text) + ',' +
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

procedure TFormCadUsuarios.btnAlterarAcessosClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 17, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      Botoes(False);
   end;
end;

procedure TFormCadUsuarios.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 16, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtSenha);
      Botoes(False);
   end;
end;

procedure TFormCadUsuarios.btnAlterarPendClick(Sender: TObject);
begin
   HabilitarCampos(True, False);
   Botoes(False);
end;

procedure TFormCadUsuarios.btnCancelarAcessosClick(Sender: TObject);
begin
   AtualizarDadosAcessorios();
   HabilitarCampos(False, False);
   Botoes(True);
end;

procedure TFormCadUsuarios.btnCancelarClick(Sender: TObject);
begin
   LimparCampos();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadUsuarios.btnCancelarPendClick(Sender: TObject);
begin
   Botoes(True);
   PreencherCampos();
end;

procedure TFormCadUsuarios.btnExcluirClick(Sender: TObject);
var
   sUsuario: string;
begin
   if edtUsuario.Text = cUsuario then begin
      Application.MessageBox('O usuário ativo não pode ser excluído', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if Acesso(cUsuario, 16, 'exclusao') = 1 then begin
      if Application.MessageBox('Confirma exclusão do usuário ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         try
            // Exclui na tabela usuarios
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM Usuarios' +
                             ' WHERE nome_usu = ' + QuotedStr(edtUsuario.Text);
               Execute;
            end;
            // Exclui na tabela acessos
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM Acessos' +
                             ' WHERE usua_ace = ' + QuotedStr(edtUsuario.Text);
               Execute;
            end;


            Auditoria('CADASTRO DE USUÁRIOS',edtUsuario.Text, 'E', '');
            AtualizarDados();
            PreencherCampos();

            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;
end;

procedure TFormCadUsuarios.btnExcluirProcessoClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' DELETE FROM usuarios_processos' +
                       ' WHERE usu_nome = ' + QuotedStr(edtUsuario.Text) +
                       ' AND usu_proc = ' + cdsProcUsuusu_proc.AsString;
         Execute;
      end;
      AtualizarDadosAcessorios();
   end;
end;

procedure TFormCadUsuarios.btnGravarAcessosClick(Sender: TObject);
begin
   try
      if cdsAcessos.State in [dsInsert,dsEdit] then begin
         cdsAcessos.Post;
      end;

      Auditoria('ACESSOS', edtUsuario.Text, 'A', '');
      Botoes(True);
      HabilitarCampos(False, False);

      Application.MessageBox('Acessos gravados corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
      cOperacao:= '';
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar os acessos !' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormCadUsuarios.btnGravarClick(Sender: TObject);
begin
//   if edtSenha.Text <> edtConfSenha.Text then begin
//      Application.MessageBox('As senhas não conferem.  ', 'Aviso', MB_OK + MB_ICONWARNING);
//      TryFocus(edtSenha);
//      Exit;
//   end;

   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            CommandText:= ' INSERT INTO usuarios' +
                          ' (nome_usu, senh_usu, proc_usu, Analise, Indicadores,' +
                          ' Procedimentos, Registros, AcaoCorretiva, Infraestrutura,' +
                          ' Manutencao, Matriz, AprovaDoc, pdca, risco, rnc, usu_desabilita_cliente_forn)' +
                          ' VALUES (' +
                          QuotedStr(edtUsuario.Text) + ',' +
                          QuotedStr(edtSenha.Text) + ',' +
                          IntToStr(rgProcessos.ItemIndex) + ',' +
                          QuotedStr(LogicoParaString(chkAnalise.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkIndicadores.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkProcedimentos.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkRegistros.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkAcaoCorretiva.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkInfraestrutura.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkManutencao.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkMatriz.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkAprovDoc.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkPDCA.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkRisco.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkRNC.Checked)) + ',' +
                          QuotedStr(LogicoParaString(chkCliente.Checked)) +
                          ')';
         end
         else begin
            CommandText:= ' UPDATE usuarios SET' +
                          ' senh_usu = ' + QuotedStr(edtSenha.Text) + ',' +
                          ' proc_usu = ' + IntToStr(rgProcessos.ItemIndex) + ',' +
                          ' Analise = ' + QuotedStr(LogicoParaString(chkAnalise.Checked)) + ',' +
                          ' Indicadores = ' + QuotedStr(LogicoParaString(chkIndicadores.Checked)) + ',' +
                          ' Procedimentos = ' + QuotedStr(LogicoParaString(chkProcedimentos.Checked)) + ',' +
                          ' Registros = ' + QuotedStr(LogicoParaString(chkRegistros.Checked)) + ',' +
                          ' AcaoCorretiva = ' + QuotedStr(LogicoParaString(chkAcaoCorretiva.Checked)) + ',' +
                          ' Infraestrutura = ' + QuotedStr(LogicoParaString(chkInfraestrutura.Checked)) + ',' +
                          ' Manutencao = ' + QuotedStr(LogicoParaString(chkManutencao.Checked)) + ',' +
                          ' Matriz = ' + QuotedStr(LogicoParaString(chkMatriz.Checked)) + ',' +
                          ' AprovaDoc = ' + QuotedStr(LogicoParaString(chkAprovDoc.Checked)) + ',' +
                          ' pdca = ' + QuotedStr(LogicoParaString(chkPDCA.Checked)) + ',' +
                          ' risco = ' + QuotedStr(LogicoParaString(chkRisco.Checked)) + ',' +
                          ' rnc = ' + QuotedStr(LogicoParaString(chkRNC.Checked)) + ',' +
                          ' usu_desabilita_cliente_forn = ' + QuotedStr(LogicoParaString(chkCliente.Checked)) +
                          ' WHERE nome_usu = ' + QuotedStr(edtUsuario.Text);
         end;
         Execute;
      end;

      if cOperacao = 'I' then begin
         GravaAcessos(edtUsuario.Text);
      end;

      Auditoria('CADASTRO DE USUÁRIOS' ,edtUsuario.Text, cOperacao, '');
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

procedure TFormCadUsuarios.btnGravarPendClick(Sender: TObject);
begin
   with cdsGravar do begin
      Active:= False;
      CommandText:= ' UPDATE usuarios ' +
                    ' SET usu_pend_habilidades = ' + LogicoParaString(chkPend_habilidades.Checked) + ',' +
                    ' usu_pend_analisecritica = ' + LogicoParaString(chkPend_analisecritica.Checked) + ',' +
                    ' usu_pend_pdcaacoes = ' + LogicoParaString(chkPend_pdca.Checked) + ',' +
                    ' usu_pend_manutpreventiva = ' + LogicoParaString(chkPend_manutencao.Checked) + ',' +
                    ' usu_pend_colexperiencia = ' + LogicoParaString(chkPend_experiencia.Checked) + ',' +
                    ' usu_pend_coleducacao = ' + LogicoParaString(chkPend_educacao.Checked) + ',' +
                    ' usu_pend_treinprevisao = ' + LogicoParaString(chkPend_treinamentosvencido.Checked) + ',' +
                    ' usu_pend_treineficacia = ' + LogicoParaString(chkPend_treinamentoeficacia.Checked) + ',' +
                    ' usu_pend_avaliacao = ' + LogicoParaString(chkPend_avalhabilidade.Checked) + ',' +
                    ' usu_pend_procedimentos = ' + LogicoParaString(chkPend_procedimentos.Checked) + ',' +
                    ' usu_pend_forn = ' + LogicoParaString(chkPend_forn.Checked) + ',' +
                    ' usu_pend_pmcacoes = ' + LogicoParaString(chkPend_pmcacoes.Checked) + ',' +
                    ' usu_pend_pmc = ' + LogicoParaString(chkPend_pmceficacia.Checked) + ',' +
                    ' usu_pend_calibracao = ' + LogicoParaString(chkPend_calibracao.Checked) + ',' +
                    ' usu_pend_indicadores = ' + LogicoParaString(chkPend_indicadores.Checked) + ',' +
                    ' usu_pend_pmc_causa = ' + LogicoParaString(chkPend_pmc_causa.Checked) + ',' +
                    ' usu_pend_pmc_acaoimediata = ' + LogicoParaString(chkPend_pmc_acaoimediata.Checked) + ',' +
                    ' usu_pend_rnc_naopreenchido = ' + LogicoParaString(chkPend_rnc_naopreenchido.Checked) + ',' +
                    ' usu_pend_rnc_aceite = ' + LogicoParaString(chkPend_rnc_aceiterecusa.Checked) +
                    ' WHERE nome_usu = ' + QuotedStr(edtUsuario.Text);
      Execute;
   end;
   HabilitarCampos(False, False);
   Botoes(True);
   AtualizarDados();
   FormInicial.VerificarPendencias();
end;

procedure TFormCadUsuarios.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadUsuarios.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadUsuarios.btnInserirProcessoClick(Sender: TObject);
begin
//   if btnInserirProcesso.Caption = 'Inserir' then begin
      // Verifica se já existe o processo para o usuário
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) qtd FROM usuarios_processos' +
                       ' WHERE usu_nome = ' + QuotedStr(edtUsuario.Text) +
                       '       AND usu_proc = ' + IntToStr(dblProcessos.KeyValue);
         Active:= True;
      end;

      if dm.cdsAuxiliar.FieldByName('qtd').AsInteger > 0 then begin
         Application.MessageBox('Este processo já foi cadastrado para esse usuário.','Aviso', MB_OK + MB_ICONWARNING);
         dblProcessos.SetFocus;
      end
      else begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' INSERT INTO usuarios_processos (usu_nome, usu_proc)' +
                          ' VALUES(' +
                          QuotedStr(edtUsuario.Text) + ',' +
                          IntToStr(dblProcessos.KeyValue) +
                          ')';
            Execute;
         end;
      end;
//   end
//   else begin
//      with cdsProcUsu do begin
//         FieldByName('usu_nome').AsString:= edtUsuario.Text;
//         FieldByName('usu_proc').AsString := dblProcessos.KeyValue;
//         Post;
//      end;
//   end;

//   LimparCampos;
   AtualizarDadosAcessorios();
//   btnInserirProcesso.Caption:= 'Inserir';
end;

procedure TFormCadUsuarios.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 16, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      TryFocus(edtUsuario);
   end;
end;

procedure TFormCadUsuarios.btnAnteriorClick(Sender: TObject);
begin
   cdsUsuarios.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadUsuarios.btnPrimeiroClick(Sender: TObject);
begin
   cdsUsuarios.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadUsuarios.btnProximoClick(Sender: TObject);
begin
   cdsUsuarios.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadUsuarios.btnUltimoClick(Sender: TObject);
begin
   cdsUsuarios.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadUsuarios.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadUsuarios.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadUsuarios.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadUsuarios.cdsAcessosAfterPost(DataSet: TDataSet);
begin
   cdsAcessos.ApplyUpdates(0);
end;

procedure TFormCadUsuarios.chkVisualizaSenhaClick(Sender: TObject);
begin
   if chkVisualizaSenha.Checked = True then begin
      edtSenha.PasswordChar:= #0;
   end
   else begin
      edtSenha.PasswordChar:= '*';
   end;

end;

procedure TFormCadUsuarios.ControlarAbas;
begin
   case pctUsuarios.TabIndex of
      0: begin // Cadastro
         Botoes(True);
         PreencherCampos();
      end;
      1: begin // Acessos
         Botoes(True);
         HabilitarCampos(False, False);
      end;
      2: begin // Processos

      end;
      3: begin // Pendências
         Botoes(True);
         edtUsuarioPend.Text:= edtUsuario.Text;
      end;
      4: begin // Pesquisa
         edtValor.Clear;
         edtValor.SetFocus;
      end;
   end;
end;

procedure TFormCadUsuarios.ControlarMarcacoes(Status: Integer);
begin
   with cdsAcessos do begin
      First;
      while not Eof do begin
         Edit;
         cdsAcessosCadastro.AsInteger := Status;
         cdsAcessosAlteracao.AsInteger:= Status;
         cdsAcessosExclusao.AsInteger := Status;
         cdsAcessosAcesso.AsInteger   := Status;
         Next;
      end;
   end;
end;

procedure TFormCadUsuarios.dbgProcessosCellClick(Column: TColumn);
begin
   dblProcessos.KeyValue:= cdsProcUsu.FieldByName('usu_proc').AsString;
end;

procedure TFormCadUsuarios.dbgAcessosCellClick(Column: TColumn);
begin
   if cOperacao = 'A' then begin
      if Column.Field = cdsAcessosCadastro then begin
         cdsAcessos.Edit;
         if cdsAcessosCadastro.AsInteger = 0 then begin
            cdsAcessosCadastro.AsInteger:= 1
         end
         else begin
            cdsAcessosCadastro.AsInteger:= 0;
         end;
      end;

      if Column.Field = cdsAcessosAlteracao then begin
         cdsAcessos.Edit;
         if cdsAcessosAlteracao.AsInteger = 0 then begin
            cdsAcessosAlteracao.AsInteger:= 1
         end
         else begin
            cdsAcessosAlteracao.AsInteger:= 0;
         end;
      end;

      if Column.Field = cdsAcessosExclusao then begin
         cdsAcessos.Edit;
         if cdsAcessosExclusao.AsInteger = 0 then begin
            cdsAcessosExclusao.AsInteger:= 1
         end
         else begin
            cdsAcessosExclusao.AsInteger:= 0;
         end;
      end;

      if Column.Field = cdsAcessosAcesso then begin
         cdsAcessos.Edit;
         if cdsAcessosAcesso.AsInteger = 0 then begin
            cdsAcessosAcesso.AsInteger:= 1
         end
         else begin
            cdsAcessosAcesso.AsInteger:= 0;
         end;
      end;
   end;
end;

procedure TFormCadUsuarios.dbgAcessosColEnter(Sender: TObject);
begin
   if dbgAcessos.SelectedField <> cdsAcessosdescfunc then
      dbgAcessos.Options:= dbgAcessos.Options - [dgEditing]
   else
      dbgAcessos.Options:= dbgAcessos.Options + [dgEditing];
end;

procedure TFormCadUsuarios.dbgAcessosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   // Pinta CheckBox Cadastro
   if Column.Field = cdsAcessosCadastro then begin
      dbgAcessos.Canvas.FillRect(Rect);

      if cdsAcessosCadastro.AsInteger = 0 then
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

   // Pinta CheckBox Alteração
   if Column.Field = cdsAcessosAlteracao then begin
      dbgAcessos.Canvas.FillRect(Rect);

      if cdsAcessosAlteracao.AsInteger = 0 then
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

   // Pinta CheckBox Exclusão
   if Column.Field = cdsAcessosExclusao then begin
      dbgAcessos.Canvas.FillRect(Rect);

      if cdsAcessosExclusao.AsInteger = 0 then
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

   // Pinta CheckBox Especial1
   if Column.Field = cdsAcessosAcesso then begin
      dbgAcessos.Canvas.FillRect(Rect);

      if cdsAcessosAcesso.AsInteger = 0 then
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgAcessos.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;
end;

procedure TFormCadUsuarios.dbgHabilidadesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadUsuarios.dbgHabilidadesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctUsuarios.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadUsuarios.edtConfSenhaExit(Sender: TObject);
begin
   if edtSenha.Text <> edtConfSenha.Text then begin
      Application.MessageBox('As senhas não conferem.  ', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
      TryFocus(edtSenha);
   end;
end;

procedure TFormCadUsuarios.edtSenhaExit(Sender: TObject);
begin
   if VerificarSenhaForte(edtSenha.Text) = False then begin
      TryFocus(edtSenha);
   end;
end;

procedure TFormCadUsuarios.edtValorChange(Sender: TObject);
begin
   case cbbCampo.ItemIndex of
      0: cdsUsuarios.Locate('nome_usu',edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadUsuarios.FormShow(Sender: TObject);
begin
   pctUsuarios.TabIndex:= 0;
   AtualizarDados;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);
//   pctUsuarios.Pages[3].TabVisible:= False;
end;

procedure TFormCadUsuarios.GravaAcessos(parUsuario: string);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_com FROM tabela_combos' +
                    ' WHERE tipo_com = 99' +
                    ' ORDER BY orde_com';
      Active:= True;
      First;

      while not Eof do begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' INSERT INTO Acessos Values ' +
                          ' ('+ QuotedStr(parUsuario) + ', ' + dm.cdsAuxiliar.FieldByName('codi_com').AsString + ',0,0,0,0)';
            Execute;
            dm.cdsAuxiliar.Next;
         end;
      end;
   end;
end;

procedure TFormCadUsuarios.HabilitarCampos(Flag: Boolean; Codigo: Boolean);
var
   i: Integer;
begin
   case pctUsuarios.TabIndex of
      0: begin
         edtUsuario.Enabled := Codigo;
         edtSenha.Enabled   := Flag;
         rgProcessos.Enabled:= Flag;

         // Limpa todos os checkbox da tela
         for i:= 0 to ComponentCount - 1 do begin
            if Components[i] is TCheckBox then begin
               (Components[i] as TCheckBox).Enabled:= Flag;
            end;
         end;

         pctUsuarios.Pages[1].TabVisible:= not Flag;
         pctUsuarios.Pages[2].TabVisible:= not Flag;
      end;
      1: begin
//         dbgAcessos.Enabled:= Flag;
//         dbgAcessos.ReadOnly:= Flag;
      end;
      2: begin

      end;
      3: begin // Pendências
         // Limpa todos os checkbox da tela
         for i:= 0 to ComponentCount - 1 do begin
            if Components[i] is TCheckBox then begin
               (Components[i] as TCheckBox).Enabled:= Flag;
            end;
         end;
      end;
   end

end;

procedure TFormCadUsuarios.LimparCampos;
var
   i: Integer;
begin
   edtUsuario.Clear;
   edtSenha.Clear;
   rgProcessos.ItemIndex:= 0;

   // Limpa todos os checkbox da tela
   for i:= 0 to ComponentCount - 1 do begin
      if Components[i] is TCheckBox then begin
         (Components[i] as TCheckBox).State:= cbUnchecked;
      end;
   end;
end;

procedure TFormCadUsuarios.pctUsuariosChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadUsuarios.PreencherCampos;
begin
   with cdsUsuarios do begin
       edtUsuario.Text          := FieldByName('nome_usu').AsString;
       edtSenha.Text            := FieldByName('senh_usu').AsString;
       rgProcessos.ItemIndex    := FieldByName('proc_usu').AsInteger;

       chkAnalise.Checked       := StringParaLogico(FieldByName('Analise').AsString);
       chkIndicadores.Checked   := StringParaLogico(FieldByName('Indicadores').AsString);
       chkProcedimentos.Checked := StringParaLogico(FieldByName('Procedimentos').AsString);
       chkRegistros.Checked     := StringParaLogico(FieldByName('Registros').AsString);
       chkAcaoCorretiva.Checked := StringParaLogico(FieldByName('AcaoCorretiva').AsString);
       chkInfraestrutura.Checked:= StringParaLogico(FieldByName('Infraestrutura').AsString);
       chkManutencao.Checked    := StringParaLogico(FieldByName('Manutencao').AsString);
       chkMatriz.Checked        := StringParaLogico(FieldByName('Matriz').AsString);
       chkAprovDoc.Checked      := StringParaLogico(FieldByName('AprovaDoc').AsString);
       chkPDCA.Checked          := StringParaLogico(FieldByName('pdca').AsString);
       chkRisco.Checked         := StringParaLogico(FieldByName('risco').AsString);
       chkRNC.Checked           := StringParaLogico(FieldByName('rnc').AsString);
       chkCliente.Checked       := StringParaLogico(FieldByName('usu_desabilita_cliente_forn').AsString);

       chkPend_habilidades.Checked        := StringParaLogico(FieldByName('usu_pend_habilidades').AsString);
       chkPend_analisecritica.Checked     := StringParaLogico(FieldByName('usu_pend_analisecritica').AsString);
       chkPend_pdca.Checked               := StringParaLogico(FieldByName('usu_pend_pdcaacoes').AsString);
       chkPend_manutencao.Checked         := StringParaLogico(FieldByName('usu_pend_manutpreventiva').AsString);
       chkPend_experiencia.Checked        := StringParaLogico(FieldByName('usu_pend_colexperiencia').AsString);
       chkPend_educacao.Checked           := StringParaLogico(FieldByName('usu_pend_coleducacao').AsString);
       chkPend_treinamentosvencido.Checked:= StringParaLogico(FieldByName('usu_pend_treinprevisao').AsString);
       chkPend_treinamentoeficacia.Checked:= StringParaLogico(FieldByName('usu_pend_treineficacia').AsString);
       chkPend_avalhabilidade.Checked     := StringParaLogico(FieldByName('usu_pend_avaliacao').AsString);
       chkPend_procedimentos.Checked      := StringParaLogico(FieldByName('usu_pend_procedimentos').AsString);
       chkPend_forn.Checked               := StringParaLogico(FieldByName('usu_pend_forn').AsString);
       chkPend_pmcacoes.Checked           := StringParaLogico(FieldByName('usu_pend_pmcacoes').AsString);
       chkPend_pmceficacia.Checked        := StringParaLogico(FieldByName('usu_pend_pmc').AsString);
       chkPend_calibracao.Checked         := StringParaLogico(FieldByName('usu_pend_calibracao').AsString);
       chkPend_indicadores.Checked        := StringParaLogico(FieldByName('usu_pend_indicadores').AsString);
       chkPend_pmc_acaoimediata.Checked   := StringParaLogico(FieldByName('usu_pend_pmc_acaoimediata').AsString);
       chkPend_pmc_causa.Checked          := StringParaLogico(FieldByName('usu_pend_pmc_causa').AsString);
       chkPend_rnc_naopreenchido.Checked  := StringParaLogico(FieldByName('usu_pend_rnc_naopreenchido').AsString);
       chkPend_rnc_aceiterecusa.Checked   := StringParaLogico(FieldByName('usu_pend_rnc_aceite').AsString);
   end;
end;

procedure TFormCadUsuarios.tsAcessosEnter(Sender: TObject);
begin
   AtualizarDadosAcessorios();
end;

procedure TFormCadUsuarios.tsProcessosEnter(Sender: TObject);
begin
   AtualizarDadosAcessorios();
end;

procedure TFormCadUsuarios.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   sCampoOrdem:= 'usua_ace';

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT alteracao, cadastro, acesso, exclusao, func_ace, usua_ace,' +
                    ' TC.valo_com as DescFuncao' +
                    ' FROM acessos A' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 99 AND TC.codi_com = A.func_ace' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Imprimir('rel_acessosUsuarios', frxReport1, tipoImp);
end;

end.
