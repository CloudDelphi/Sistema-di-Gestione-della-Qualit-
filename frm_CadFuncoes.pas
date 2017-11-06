unit frm_CadFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet;

type
  TFormCadFuncoes = class(TForm)
    pctFuncoes: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgFuncoes: TDBGrid;
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
    zqryEducacao: TZQuery;
    dspEducacao: TDataSetProvider;
    cdsEducacao: TClientDataSet;
    dsEducacao: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryFuncoes: TZQuery;
    dspFuncoes: TDataSetProvider;
    cdsFuncoes: TClientDataSet;
    dsFuncoes: TDataSource;
    frxReport1: TfrxReport;
    frxDBDSFuncoes: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl2: TLabel;
    lbl8: TLabel;
    lbl6: TLabel;
    dblEducacao: TDBLookupComboBox;
    edtDescFuncao: TEdit;
    mmoResponsabilidades: TMemo;
    dblExperiencia: TDBLookupComboBox;
    lbl5: TLabel;
    edtCodigo: TEdit;
    zqryExperiencia: TZQuery;
    dspExperiencia: TDataSetProvider;
    cdsExperiencia: TClientDataSet;
    dsExperiencia: TDataSource;
    tsTreinamentos: TTabSheet;
    tsHabilidades: TTabSheet;
    cdsFuncoescodi_fun: TLargeintField;
    cdsFuncoesdesc_fun: TWideStringField;
    cdsFuncoeseduc_fun: TLargeintField;
    cdsFuncoesexpe_fun: TLargeintField;
    lbl1: TLabel;
    lbl3: TLabel;
    edtCodigoTre: TEdit;
    edtDescFuncaoTre: TEdit;
    lbl7: TLabel;
    lbl11: TLabel;
    edtCodigoHab: TEdit;
    edtDescFuncaoHab: TEdit;
    dbgTreinamentos: TDBGrid;
    dblTreinamentos: TDBLookupComboBox;
    lbl12: TLabel;
    btnInserirTreinamento: TBitBtn;
    btnExcluirTreinamento: TBitBtn;
    btnInserirHabilidade: TBitBtn;
    btnExcluirHabilidade: TBitBtn;
    lbl13: TLabel;
    dblHabilidades: TDBLookupComboBox;
    dbgHabilidades: TDBGrid;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    zqryHabilidades: TZQuery;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    dsHabilidades: TDataSource;
    cdsTreinamentoscodi_tre: TLargeintField;
    cdsTreinamentosdesc_tre: TWideStringField;
    cdsHabilidadescodi_hab: TIntegerField;
    cdsHabilidadesdesc_hab: TWideStringField;
    zqryTreinamentosFun: TZQuery;
    dspTreinamentosFun: TDataSetProvider;
    cdsTreinamentosFun: TClientDataSet;
    dsTreinamentosFun: TDataSource;
    zqryHabilidadesFun: TZQuery;
    dspHabilidadesFun: TDataSetProvider;
    cdsHabilidadesFun: TClientDataSet;
    dsHabilidadesFun: TDataSource;
    lbl14: TLabel;
    cdsTreinamentosFuncodi_fun: TLargeintField;
    cdsTreinamentosFuncodi_tre: TLargeintField;
    cdsTreinamentosFuntipo_tre: TWideStringField;
    cdsTreinamentosFundesc_tre: TWideStringField;
    cdsEducacaocodi_com: TLargeintField;
    cdsEducacaovalo_com: TWideStringField;
    cdsExperienciacodi_com: TLargeintField;
    cdsExperienciavalo_com: TWideStringField;
    cbTipoTreinamento: TComboBox;
    cdsHabilidadesFuncodi_fun: TLargeintField;
    cdsHabilidadesFuncodi_hab: TLargeintField;
    cdsHabilidadesFundesc_hab: TWideStringField;
    cdsFuncoesDescEducacao: TWideStringField;
    cdsFuncoesDescExperiencia: TWideStringField;
    cdsImprimircodi_fun: TLargeintField;
    cdsImprimirdesc_fun: TWideStringField;
    cdsImprimireduc_fun: TLargeintField;
    cdsImprimirexpe_fun: TLargeintField;
    cdsImprimirDescEducacao: TWideStringField;
    cdsImprimirDescExperiencia: TWideStringField;
    frxDBDSFuncoesHab: TfrxDBDataset;
    zqryImprimirHab: TZQuery;
    dspImprimirHab: TDataSetProvider;
    cdsImprimirHab: TClientDataSet;
    LargeintField1: TLargeintField;
    cds2: TWideStringField;
    LargeintField2: TLargeintField;
    LargeintField3: TLargeintField;
    MemoField1: TMemoField;
    cds3: TWideStringField;
    cds4: TWideStringField;
    lrgntfldImprimirHabcodi_hab: TLargeintField;
    cdsImprimirHabdesc_hab: TWideStringField;
    frxDBDSFuncoesTre: TfrxDBDataset;
    zqryImprimirTre: TZQuery;
    dspImprimirTre: TDataSetProvider;
    cdsImprimirTre: TClientDataSet;
    cds6: TWideStringField;
    cds7: TWideStringField;
    lrgntfldImprimirTrecodi_tre: TLargeintField;
    cdsImprimirTredesc_tre: TWideStringField;
    lrgntfldImprimirTrecodi_fun: TLargeintField;
    cdsImprimirTredesc_fun: TWideStringField;
    lrgntfldImprimirTreeduc_fun: TLargeintField;
    lrgntfldImprimirTreexpe_fun: TLargeintField;
    cdsImprimirTreresp_fun: TMemoField;
    cdsFuncoesresp_fun: TWideMemoField;
    cdsImprimirresp_fun: TWideMemoField;
    lbl15: TLabel;
    dblEducDesejada: TDBLookupComboBox;
    zqryEducDesejada: TZQuery;
    dspEducDesejada: TDataSetProvider;
    cdsEducDesejada: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField1: TWideStringField;
    dsEducDesejada: TDataSource;
    lbl16: TLabel;
    dblExpDesejada: TDBLookupComboBox;
    zqryExpDesejada: TZQuery;
    dspExpDesejada: TDataSetProvider;
    cdsExpDesejada: TClientDataSet;
    LargeintField5: TLargeintField;
    WideStringField2: TWideStringField;
    dsExpDesejada: TDataSource;
    cdsFuncoesfun_edudesejada: TIntegerField;
    cdsFuncoesfun_expdesejada: TIntegerField;
    lbl17: TLabel;
    edtCBO: TEdit;
    cdsFuncoesfun_cbo: TWideStringField;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    rgTipoRel: TRadioGroup;
    grpMatrizfuncao: TGroupBox;
    lblTituloMatrizFunc: TLabel;
    dblMatrizFuncao: TDBLookupComboBox;
    rgMatrizFuncao: TRadioGroup;
    zqryMatrizFuncao: TZQuery;
    dspMatrizFuncao: TDataSetProvider;
    cdsMatrizFuncao: TClientDataSet;
    dsMatrizFuncao: TDataSource;
    cdsMatrizFuncaocodi_fun: TLargeintField;
    cdsMatrizFuncaodesc_fun: TWideStringField;
    dblMatrizTreinamento: TDBLookupComboBox;
    zqryImprimirHabTre: TZQuery;
    dspImprimirHabTre: TDataSetProvider;
    cdsImprimirHabTre: TClientDataSet;
    cds5: TWideStringField;
    cds8: TWideStringField;
    cds9: TLargeintField;
    cdsImprimirHabTre0: TWideStringField;
    cdsImprimirHabTre1: TLargeintField;
    cdsImprimirHabTre2: TWideStringField;
    cdsImprimirHabTre3: TLargeintField;
    cdsImprimirHabTre4: TLargeintField;
    MemoField2: TMemoField;
    frxDBFuncoesHabTre: TfrxDBDataset;
    zqryImprimirHabTreHab: TZQuery;
    dspImprimirHabTreHab: TDataSetProvider;
    cdsImprimirHabTreHab: TClientDataSet;
    cdsImprimirHabTreHabcodi_hab: TLargeintField;
    cdsImprimirHabTreHabdesc_hab: TWideStringField;
    cdsImprimirHabTreHabcodi_fun: TLargeintField;
    cdsImprimirHabTreHabdesc_fun: TWideStringField;
    cdsImprimirHabTreHabeduc_fun: TLargeintField;
    cdsImprimirHabTreHabexpe_fun: TLargeintField;
    cdsImprimirHabTreHabdesceducacao: TWideStringField;
    cdsImprimirHabTreHabdescexperiencia: TWideStringField;
    frxDBFuncoesHabTreHab: TfrxDBDataset;
    cdsImprimirHabTreHabresp_fun: TWideMemoField;
    cdsFuncoesfun_organograma: TWideMemoField;
    lbl18: TLabel;
    edtOrganograma: TEdit;
    sbArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    opd1: TOpenDialog;
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
    procedure dbgFuncoesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgFuncoesCellClick(Column: TColumn);
    procedure dbgFuncoesDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctFuncoesChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure mmoResponsabilidadesKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoResponsabilidadesExit(Sender: TObject);
    procedure AtualizarTreinamentosHabilidades();
    procedure dbgTreinamentosCellClick(Column: TColumn);
    procedure btnInserirTreinamentoClick(Sender: TObject);
    procedure btnExcluirTreinamentoClick(Sender: TObject);
    procedure btnInserirHabilidadeClick(Sender: TObject);
    procedure btnExcluirHabilidadeClick(Sender: TObject);
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure dblEducacaoCloseUp(Sender: TObject);
    procedure dblExperienciaCloseUp(Sender: TObject);
    procedure rgTipoRelClick(Sender: TObject);
    procedure rgMatrizFuncaoClick(Sender: TObject);
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadFuncoes: TFormCadFuncoes;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadFuncoes.AtualizarDados;
begin
   with cdsFuncoes do begin
      Active:= False;
      Active:= True;
   end;

   with cdsEducacao do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 6' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsEducDesejada do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 6' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsExperiencia do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 7' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsExpDesejada do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 7' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT codi_tre, desc_tre ' +
                    ' FROM treinamentos' +
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   with cdsHabilidades do begin
      Active:= False;
      CommandText:= ' SELECT codi_hab, desc_hab ' +
                    ' FROM habilidades' +
                    ' ORDER BY desc_hab';
      Active:= True;
   end;

   with cdsMatrizFuncao do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsFuncoes.Locate('desc_fun', edtDescFuncao.Text,[])
   end;
end;

procedure TFormCadFuncoes.AtualizarTreinamentosHabilidades;
begin
   edtCodigoHab.Text    := edtCodigo.Text;
   edtDescFuncaoHab.Text:= edtDescFuncao.Text;
   edtCodigoTre.Text    := edtCodigo.Text;
   edtDescFuncaoTre.Text:= edtDescFuncao.Text;

   with cdsTreinamentosFun do begin
      Active:= False;
      CommandText:= ' SELECT F.codi_fun, F.codi_tre, F.tipo_tre, T.desc_tre ' +
                    ' FROM funcoes_treinamentos F' +
                    ' INNER JOIN treinamentos T ON T.codi_tre = F.codi_tre' +
                    ' WHERE F.codi_fun = ' + AllTrim(edtCodigo.Text) +
                    ' ORDER BY desc_tre';
      Active:= True;
   end;

   with cdsHabilidadesFun do begin
      Active:= False;
      CommandText:= ' SELECT F.codi_fun, F.codi_hab, H.desc_hab ' +
                    ' FROM funcoes_habilidades F' +
                    ' INNER JOIN habilidades H ON H.codi_hab = F.codi_hab' +
                    ' WHERE F.codi_fun = ' + AllTrim(edtCodigo.Text) +
                    ' ORDER BY desc_hab';
      Active:= True;
   end;
end;

procedure TFormCadFuncoes.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsFuncoes.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadFuncoes.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 5, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtDescFuncao);
      Botoes(False);
   end;
end;

procedure TFormCadFuncoes.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadFuncoes.btnExcluirClick(Sender: TObject);
var
   sCodFuncao: string;
   sDescFuncao: string;
begin
   sCodFuncao:= cdsFuncoescodi_fun.AsString;
   sDescFuncao:= cdsFuncoesdesc_fun.AsString;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS Qtd' +
                    ' FROM colaboradores' +
                    ' WHERE func_col = ' + sCodFuncao;
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         Application.MessageBox(PChar('Existem colaboradores com a função ' + sDescFuncao + ' cadastrada. Não é permitida a exclusão da função.'), 'Aviso', MB_OK + MB_ICONWARNING);
         Botoes(True);
         Exit;
      end;
   end;

   if (Acesso(cUsuario, 5, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM funcoes' +
                          ' WHERE codi_fun = ' + sCodFuncao;
            Execute;
         end;

         Auditoria('CADASTRO DE FUNÇÕES',sDescFuncao,'E','');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadFuncoes.btnExcluirHabilidadeClick(Sender: TObject);
var
   sDescHabilidade: string;
begin
   if (Acesso(cUsuario, 5, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão da habilidade ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sDescHabilidade:= cdsHabilidadesFundesc_hab.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM funcoes_habilidades' +
                          ' WHERE codi_fun = ' + edtCodigo.Text +
                          ' AND codi_hab = ' + cdsHabilidadesFuncodi_hab.AsString;
            Execute;
         end;

         Auditoria('CADASTRO DE FUNÇÕES - HABILIDADES', edtDescFuncao.Text + ' - ' + sDescHabilidade,'E','');
         AtualizarTreinamentosHabilidades();
      end;
   end;
end;

procedure TFormCadFuncoes.btnExcluirTreinamentoClick(Sender: TObject);
var
   sDescTreinamento: string;
begin
   if (Acesso(cUsuario, 5, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do treinamento ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sDescTreinamento:= cdsTreinamentosFundesc_tre.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM funcoes_treinamentos' +
                          ' WHERE codi_fun = ' + edtCodigo.Text +
                          ' AND codi_tre = ' + cdsTreinamentosFuncodi_tre.AsString;
            Execute;
         end;

         Auditoria('CADASTRO DE FUNÇÕES - TREINAMENTOS', edtDescFuncao.Text + ' - ' + sDescTreinamento,'E','');
         AtualizarTreinamentosHabilidades();
      end;
   end;
end;

procedure TFormCadFuncoes.btnInserirHabilidadeClick(Sender: TObject);
begin
   // Verifica se o campo Treinamento está preenchido
   if (dblHabilidades.KeyValue = -1)  or (dblHabilidades.KeyValue = null) then begin
      Application.MessageBox('Selecione uma habilidade para inserir', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblHabilidades);
      Exit;
   end;

   // Verifica se a habilidade já foi cadastrada
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM funcoes_habilidades' +
                    ' WHERE codi_fun = ' + AllTrim(edtCodigo.Text) +
                    ' AND codi_hab = ' + IntToStr(dblHabilidades.KeyValue);
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Habilidade já cadastrada', 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   try
      // Grava a habilidade na função
      with cdsGravar do begin

         Active:= False;
         CommandText:= ' INSERT INTO funcoes_habilidades (codi_fun, codi_hab)' +
                       ' VALUES(' +
                       AllTrim(edtCodigo.Text) + ',' +
                       IntToStr(dblHabilidades.KeyValue) +
                       ')';
         Execute;
         Auditoria('CADASTRO DE FUNÇÕES - HABILIDADES', edtDescFuncao.Text + ' - ' + dblHabilidades.Text,'I','');
         AtualizarTreinamentosHabilidades();


         // Inclui a habilidade no cadastro de colaboradores na matriz de competências
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' SELECT * FROM colaboradores' +
                          ' WHERE func_col = ' + AllTrim(edtCodigo.Text);
            Active:= True;
            First;

            while not Eof do begin
               with dm.cdsAux3 do begin
                  Active:= False;
                  CommandText:= ' SELECT COUNT(*) AS QTD' +
                                ' FROM colab_habilidades' +
                                ' WHERE codi_col = ' + dm.cdsAuxiliar.FieldByName('codi_col').AsString +
                                ' AND codi_hab = ' + IntToStr(dblHabilidades.KeyValue);
                  Active:= True;

                  if FieldByName('QTD').AsInteger = 0 then begin
                     with dm.cdsAux2 do begin
                        Active:= False;
                        CommandText:= ' INSERT INTO colab_habilidades (codi_col, codi_hab, nota_hab, hab_ano)' +
                                      ' VALUES(' +
                                      dm.cdsAuxiliar.FieldByName('codi_col').AsString + ',' +
                                      IntToStr(dblHabilidades.KeyValue) + ',' +
                                      '0' + ',' +
                                      FormatDateTime('yyyy',Date()) +
                                      ')';
                        Execute;
                     end;
                  end;
               end;

               dm.cdsAuxiliar.Next;
            end;
         end;
      end;
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar o treinamento!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure TFormCadFuncoes.btnInserirTreinamentoClick(Sender: TObject);
begin
   // Verifica se o campo Treinamento está preenchido
   if (dblTreinamentos.KeyValue = -1)  or (dblTreinamentos.KeyValue = null) then begin
      Application.MessageBox('Selecione um treinamento para inserir', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTreinamentos);
      Exit;
   end;

   if cbTipoTreinamento.ItemIndex < 0 then begin
      Application.MessageBox('Selecione o tipo de treinamento (Mandatório ou Desejável) para inserir', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(cbTipoTreinamento);
      Exit;
   end;


   // Verifica se o treinamento já foi cadastrado
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS QTD' +
                    ' FROM funcoes_treinamentos' +
                    ' WHERE codi_fun = ' + AllTrim(edtCodigo.Text) +
                    ' AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue);
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Treinamento já cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end;

   try
      // Grava o treinamento na função
      with cdsGravar do begin
         Active:= False;
         CommandText:= ' INSERT INTO funcoes_treinamentos' +
                       ' (codi_fun, codi_tre, tipo_tre)' +
                       ' VALUES (' +
                       edtCodigo.Text + ',' +
                       IntToStr(dblTreinamentos.KeyValue) + ',';
         if cbTipoTreinamento.ItemIndex = 0 then begin
            CommandText:= CommandText + QuotedStr('M') + ')';
         end
         else begin
            CommandText:= CommandText + QuotedStr('D') + ')';
         end;

         Execute;

         Auditoria('CADASTRO DE FUNÇÕES - TREINAMENTOS',edtDescFuncao.Text + ' - ' + dblTreinamentos.Text,'I','');
         AtualizarTreinamentosHabilidades();
      end;

      // Inclui o treinamento no cadastro de colaboradores na matriz de competências
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT * FROM colaboradores' +
                       ' WHERE func_col = ' + AllTrim(edtCodigo.Text);
         Active:= True;
         First;

         while not Eof do begin
            // Verifica se o treinamento já foi cadastrado no colaborador
            with dm.cdsAux3 do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) AS QTD' +
                             ' FROM colab_treinamentos' +
                             ' WHERE codi_col = ' + dm.cdsAuxiliar.FieldByName('codi_col').AsString +
                             ' AND codi_tre = ' + IntToStr(dblTreinamentos.KeyValue);
               Active:= True;

               if FieldByName('QTD').AsInteger = 0 then begin
                  with dm.cdsAux2 do begin
                     Active:= False;
                     CommandText:= ' INSERT INTO colab_treinamentos (codi_col, codi_tre, tipo_tre)' +
                                   ' VALUES(' +
                                   dm.cdsAuxiliar.FieldByName('codi_col').AsString + ',' +
                                   IntToStr(dblTreinamentos.KeyValue) + ',';
                                   if cbTipoTreinamento.ItemIndex = 0 then begin
                                       CommandText:= CommandText + QuotedStr('M') + ')';
                                   end
                                   else begin
                                      CommandText:= CommandText + QuotedStr('D') + ')';
                                   end;
                     Execute;
                  end;
               end;
            end;

            dm.cdsAuxiliar.Next;
         end;
      end;
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar a habilidade!' + #13 + E.Message), 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure TFormCadFuncoes.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO funcoes (' +
                             ' codi_fun, desc_fun, educ_fun, expe_fun, resp_fun, ' +
                             ' fun_edudesejada, fun_expdesejada, fun_cbo, fun_organograma' +
                             ' )' +
                             ' VALUES(' +
                             sNovoCodigo + ',' +
                             QuotedStr(edtDescFuncao.Text) + ',' +
                             QuotedStr(dblEducacao.KeyValue) + ',' +
                             QuotedStr(dblExperiencia.KeyValue) + ',' +
                             QuotedStr(mmoResponsabilidades.Text) + ',' +
                             QuotedStr(dblEducDesejada.KeyValue) + ',' +
                             QuotedStr(dblExpDesejada.KeyValue) + ',' +
                             QuotedStr(edtCBO.Text) + ',' +
                             QuotedStr(edtOrganograma.Text) +
                             ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE funcoes SET' +
                             ' desc_fun = ' + QuotedStr(edtDescFuncao.Text) + ',' +
                             ' educ_fun = ' + QuotedStr(dblEducacao.KeyValue) + ',' +
                             ' expe_fun = ' + QuotedStr(dblExperiencia.KeyValue) + ',' +
                             ' resp_fun = ' + QuotedStr(mmoResponsabilidades.Text) + ',' +
                             ' fun_edudesejada = ' + QuotedStr(dblEducDesejada.KeyValue) + ',' +
                             ' fun_expdesejada = ' + QuotedStr(dblExpDesejada.KeyValue) + ',' +
                             ' fun_cbo = ' + QuotedStr(edtCBO.Text) + ',' +
                             ' fun_organograma = ' + QuotedStr(edtOrganograma.Text) +
                             ' WHERE codi_fun = ' + cdsFuncoescodi_fun.Asstring;
               Execute;
            end;
         end;

         Auditoria('CADASTRO DE FUNÇÕES', edtDescFuncao.Text, cOperacao,'');
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

procedure TFormCadFuncoes.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadFuncoes.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgTipoRel.ItemIndex:= 0;
   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadFuncoes.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 5, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, False);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      TryFocus(edtDescFuncao);
   end;
end;

procedure TFormCadFuncoes.btnPrimeiroClick(Sender: TObject);
begin
   cdsFuncoes.First;
   PreencherCampos;
   AtualizarTreinamentosHabilidades();
end;

procedure TFormCadFuncoes.btnAnteriorClick(Sender: TObject);
begin
   cdsFuncoes.Prior;
   PreencherCampos;
   AtualizarTreinamentosHabilidades();
end;

procedure TFormCadFuncoes.btnProximoClick(Sender: TObject);
begin
   cdsFuncoes.Next;
   PreencherCampos;
   AtualizarTreinamentosHabilidades();
end;

procedure TFormCadFuncoes.btnUltimoClick(Sender: TObject);
begin
   cdsFuncoes.Last;
   PreencherCampos;
   AtualizarTreinamentosHabilidades();
end;

procedure TFormCadFuncoes.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadFuncoes.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadFuncoes.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadFuncoes.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_fun) AS NovoCodigo FROM funcoes';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;

      edtCodigo.Text:= sNovoCodigo;
   end;
end;

procedure TFormCadFuncoes.ControlarAbas;
begin
   if pctFuncoes.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled := False;

      AtualizarTreinamentosHabilidades();

      if pctFuncoes.TabIndex = 3 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadFuncoes.dbgFuncoesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadFuncoes.dbgFuncoesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctFuncoes.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadFuncoes.dbgFuncoesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadFuncoes.dbgHabilidadesCellClick(Column: TColumn);
begin
   with cdsHabilidadesFun do begin
      if FieldByName('codi_hab').AsString <> EmptyStr then begin
         dblHabilidades.KeyValue:= FieldByName('codi_hab').AsString;
      end;
   end;
end;

procedure TFormCadFuncoes.dbgTreinamentosCellClick(Column: TColumn);
begin
   with cdsTreinamentosFun do begin
      if FieldByName('codi_tre').AsString <> EmptyStr then begin
         dblTreinamentos.KeyValue:= FieldByName('codi_tre').AsString;
      end;

      if cdsTreinamentosFuntipo_tre.AsString = 'M' then begin
         cbTipoTreinamento.ItemIndex:= 0;
      end
      else begin
         cbTipoTreinamento.ItemIndex:= 1;
      end;
   end;
end;

procedure TFormCadFuncoes.dblEducacaoCloseUp(Sender: TObject);
begin
   dblEducDesejada.KeyValue:= dblEducacao.KeyValue;
end;

procedure TFormCadFuncoes.dblExperienciaCloseUp(Sender: TObject);
begin
   dblExpDesejada.KeyValue:= dblExperiencia.KeyValue;
end;

procedure TFormCadFuncoes.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsFuncoes.Locate('desc_fun', edtValor.Text, [loPartialKey]);
      1: cdsFuncoes.Locate('fun_cbo', edtValor.Text, [loPartialKey]);
//      0: cdsLaaia.Filter:= 'LAI_ATIVIDADE LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

//   cdsLaaia.Filtered:= True;
end;

procedure TFormCadFuncoes.FormShow(Sender: TObject);
begin
   pctFuncoes.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   dblMatrizTreinamento.Visible:= False;
end;

procedure TFormCadFuncoes.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtCodigo.Enabled           := Codigo;
   edtDescFuncao.Enabled       := Flag;
   dblEducacao.Enabled         := Flag;
   dblExperiencia.Enabled      := Flag;
   dblEducDesejada.Enabled     := Flag;
   dblExpDesejada.Enabled      := Flag;
   mmoResponsabilidades.Enabled:= Flag;
   edtCBO.Enabled              := Flag;
   edtOrganograma.Enabled      := Flag;
   sbArquivo.Enabled           := Flag;

   pctFuncoes.Pages[1].TabVisible:= not Flag;
   pctFuncoes.Pages[2].TabVisible:= not Flag;
   pctFuncoes.Pages[3].TabVisible:= not Flag;
end;

procedure TFormCadFuncoes.LimparCampos;
begin
   edtDescFuncao.Clear;
   dblEducacao.KeyValue:= -1;
   dblExperiencia.KeyValue:= -1;
   dblEducDesejada.KeyValue:= -1;
   dblExpDesejada.KeyValue:= -1;
   mmoResponsabilidades.Clear;
   edtCBO.Clear;
   edtOrganograma.Clear;
end;

procedure TFormCadFuncoes.mmoResponsabilidadesExit(Sender: TObject);
begin
   mmoResponsabilidades.Text:= AcertaUpper(mmoResponsabilidades.Text);
end;

procedure TFormCadFuncoes.mmoResponsabilidadesKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadFuncoes.pctFuncoesChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadFuncoes.PreencherCampos;
begin
   with cdsFuncoes do begin
      edtCodigo.Text           := FieldByName('codi_fun').AsString;
      edtDescFuncao.Text       := FieldByName('desc_fun').AsString;
      mmoResponsabilidades.Text:= FieldByName('resp_fun').AsString;
      edtCBO.Text              := FieldByName('fun_cbo').AsString;
      edtOrganograma.Text      := FieldByName('fun_organograma').AsString;

      if AllTrim(edtOrganograma.Text) <> EmptyStr then begin
         sbVisualizar.Enabled:= True;
      end
      else begin
         sbVisualizar.Enabled:= False;
      end;

      if FieldByName('educ_fun').AsString <> EmptyStr then begin
         dblEducacao.KeyValue:= FieldByName('educ_fun').AsString;
      end;
      if FieldByName('expe_fun').AsString <> EmptyStr then begin
         dblExperiencia.KeyValue:= FieldByName('expe_fun').AsString;
      end;
      if FieldByName('fun_edudesejada').AsString <> EmptyStr then begin
         dblEducDesejada.KeyValue:= FieldByName('fun_edudesejada').AsString;
      end;
      if FieldByName('fun_expdesejada').AsString <> EmptyStr then begin
         dblExpDesejada.KeyValue:= FieldByName('fun_expdesejada').AsString;
      end;
   end;
end;

procedure TFormCadFuncoes.rgMatrizFuncaoClick(Sender: TObject);
begin
   with cdsMatrizFuncao do begin
      Active:= False;
      Active:= True;
   end;

   with cdsTreinamentos do begin
      Active:= False;
      Active:= True;
   end;

   if rgMatrizFuncao.ItemIndex = 0 then begin
      lblTituloMatrizFunc.Caption := 'Função';
      dblMatrizFuncao.Visible     := True;
      dblMatrizTreinamento.Visible:= False;
   end
   else begin
      lblTituloMatrizFunc.Caption := 'Treinamento';
      dblMatrizFuncao.Visible     := False;
      dblMatrizTreinamento.Visible:= True;
   end;

end;

procedure TFormCadFuncoes.rgTipoRelClick(Sender: TObject);
begin
   rgMatrizFuncao.Enabled      := rgTipoRel.ItemIndex = 4;
   dblMatrizFuncao.Enabled     := (rgTipoRel.ItemIndex = 4) OR (rgTipoRel.ItemIndex = 5);
   dblMatrizTreinamento.Enabled:= rgTipoRel.ItemIndex = 4;
end;

procedure TFormCadFuncoes.sbArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   edtOrganograma.Text:= OPD1.FileName;
end;

procedure TFormCadFuncoes.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtOrganograma.Text, Self.Name);
end;

function TFormCadFuncoes.ValidarDados(): Boolean;
begin
   if AllTrim(edtDescFuncao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Descrição da Função é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtDescFuncao);
      Result:= False;
      Exit;
   end;

   if dblEducacao.KeyValue = -1 then begin
      Application.MessageBox('Campo Educação Exigida é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblEducacao);
      Result:= False;
      Exit;
   end;

   if dblEducDesejada.KeyValue = -1 then begin
      Application.MessageBox('Campo Educação Desejada é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblEducDesejada);
      Result:= False;
      Exit;
   end;

   if dblExperiencia.KeyValue = -1 then begin
      Application.MessageBox('Campo Experiência Exigida é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblExperiencia);
      Result:= False;
      Exit;
   end;

   if dblExpDesejada.KeyValue = -1 then begin
      Application.MessageBox('Campo Experiência Desejada é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblExpDesejada);
      Result:= False;
      Exit;
   end;

   if AllTrim(mmoResponsabilidades.Text) = EmptyStr then begin
      Application.MessageBox('Campo Responsabilidades e Autoridades é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoResponsabilidades);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadFuncoes.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'codi_fun';
   end
   else begin
      sCampoOrdem:= 'desc_fun';
   end;

   case rgTipoRel.ItemIndex of
      0..1: begin
         with cdsImprimir do begin
            Active:= False;
            CommandText:= ' SELECT F.codi_fun, F.desc_fun, F.educ_fun, F.expe_fun, F.resp_fun, ' +
                          ' T1.valo_com as DescEducacao, T2.valo_com as DescExperiencia' +
                          ' FROM funcoes F' +
                          ' INNER JOIN tabela_combos T1 ON T1.codi_com = F.educ_fun and T1.tipo_com = 6   ' +
                          ' INNER JOIN tabela_combos T2 ON T2.codi_com = F.expe_fun and T2.tipo_com = 7' +
                          ' ORDER BY ' + sCampoOrdem;
            Active:= True;
         end;

         if cdsImprimir.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;

      2: begin
         with cdsImprimirHab do begin
            Active:= False;
            CommandText:= ' SELECT FH.codi_hab, H.desc_hab, F.codi_fun, F.desc_fun, F.educ_fun, ' +
                          ' F.expe_fun, F.resp_fun,' +
                          ' T1.valo_com as DescEducacao, T2.valo_com as DescExperiencia' +
                          ' FROM funcoes F' +
                          ' INNER JOIN tabela_combos T1 ON T1.codi_com = F.educ_fun and T1.tipo_com = 6' +
                          ' INNER JOIN tabela_combos T2 ON T2.codi_com = F.expe_fun and T2.tipo_com = 7' +
                          ' LEFT JOIN funcoes_habilidades FH ON FH.codi_fun = F.codi_fun' +
                          ' LEFT JOIN habilidades H ON H.codi_hab = FH.codi_hab' +
                          ' ORDER BY ' + sCampoOrdem;
            Active:= True;
         end;

         if cdsImprimirHab.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;

      3: begin
         with cdsImprimirTre do begin
            Active:= False;
            CommandText:= ' SELECT FT.codi_tre, T.desc_tre, F.codi_fun, F.desc_fun, F.educ_fun, ' +
                          ' F.expe_fun, F.resp_fun,' +
                          ' T1.valo_com as DescEducacao, T2.valo_com as DescExperiencia' +
                          ' FROM funcoes F' +
                          ' INNER JOIN tabela_combos T1 ON T1.codi_com = F.educ_fun and T1.tipo_com = 6' +
                          ' INNER JOIN tabela_combos T2 ON T2.codi_com = F.expe_fun and T2.tipo_com = 7' +
                          ' LEFT JOIN funcoes_treinamentos FT ON FT.codi_fun = F.codi_fun' +
                          ' LEFT JOIN treinamentos T ON T.codi_tre = FT.codi_tre' +
                          ' ORDER BY ' + sCampoOrdem;
            Active:= True;
         end;

         if cdsImprimirTre.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;

      4: begin // Matriz de Função
         if rgMatrizFuncao.ItemIndex = 0 then begin
            if (dblMatrizFuncao.KeyValue = null) or (dblMatrizFuncao.KeyValue = -1) then begin
               Application.MessageBox('Selecione uma função', 'Aviso', MB_OK + MB_ICONWARNING);
               TryFocus(dblMatrizFuncao);
               Exit;
            end;
         end
         else begin
            if (dblMatrizTreinamento.KeyValue = null) or (dblMatrizTreinamento.KeyValue = -1) then begin
               Application.MessageBox('Selecione um treinamento', 'Aviso', MB_OK + MB_ICONWARNING);
               TryFocus(dblMatrizTreinamento);
               Exit;
            end;
         end;

         with cdsImprimirTre do begin
            Active:= False;
            CommandText:= ' SELECT FT.codi_tre, T.desc_tre, F.codi_fun, F.desc_fun, F.educ_fun, ' +
                          ' F.expe_fun, F.resp_fun,' +
                          ' T1.valo_com as DescEducacao, T2.valo_com as DescExperiencia' +
                          ' FROM funcoes F' +
                          ' INNER JOIN tabela_combos T1 ON T1.codi_com = F.educ_fun and T1.tipo_com = 6' +
                          ' INNER JOIN tabela_combos T2 ON T2.codi_com = F.expe_fun and T2.tipo_com = 7' +
                          ' LEFT JOIN funcoes_treinamentos FT ON FT.codi_fun = F.codi_fun' +
                          ' LEFT JOIN treinamentos T ON T.codi_tre = FT.codi_tre';
                          if rgMatrizFuncao.ItemIndex = 0 then begin
                              CommandText:= CommandText + ' WHERE F.codi_fun = ' + IntToStr(dblMatrizFuncao.KeyValue);
                          end
                          else begin
                             CommandText:= CommandText + ' WHERE FT.codi_tre = ' + IntToStr(dblMatrizTreinamento.KeyValue);
                          end;
                          CommandText:= CommandText + ' ORDER BY ' + sCampoOrdem;
            Active:= True;
         end;

         if cdsImprimirTre.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;
      5: begin // Descrição de Cargo
         if (dblMatrizFuncao.KeyValue = null) or (dblMatrizFuncao.KeyValue = -1) then begin
            Application.MessageBox('Selecione uma função', 'Aviso', MB_OK + MB_ICONWARNING);
            TryFocus(dblMatrizFuncao);
            Exit;
         end;

         with cdsImprimirHabTre do begin
            Active:= False;
            CommandText:= ' SELECT FT.codi_tre, T.desc_tre, F.codi_fun, F.desc_fun, F.educ_fun, ' +
                          ' F.expe_fun, F.resp_fun,' +
                          ' T1.valo_com as DescEducacao, T2.valo_com as DescExperiencia' +
                          ' FROM funcoes F' +
                          ' INNER JOIN tabela_combos T1 ON T1.codi_com = F.educ_fun and T1.tipo_com = 6' +
                          ' INNER JOIN tabela_combos T2 ON T2.codi_com = F.expe_fun and T2.tipo_com = 7' +
                          ' LEFT JOIN funcoes_treinamentos FT ON FT.codi_fun = F.codi_fun' +
                          ' INNER JOIN treinamentos T ON T.codi_tre = FT.codi_tre' +
                          ' WHERE F.codi_fun = ' + IntToStr(dblMatrizFuncao.KeyValue) +
                          ' ORDER BY T.desc_tre';
            Active:= True;
         end;

         with cdsImprimirHabTreHab do begin
            Active:= False;
            CommandText:= ' SELECT FH.codi_hab, H.desc_hab, F.codi_fun, F.desc_fun, F.educ_fun, ' +
                          ' F.expe_fun, F.resp_fun,' +
                          ' T1.valo_com as DescEducacao, T2.valo_com as DescExperiencia' +
                          ' FROM funcoes F' +
                          ' INNER JOIN tabela_combos T1 ON T1.codi_com = F.educ_fun and T1.tipo_com = 6' +
                          ' INNER JOIN tabela_combos T2 ON T2.codi_com = F.expe_fun and T2.tipo_com = 7' +
                          ' INNER JOIN funcoes_habilidades FH ON FH.codi_fun = F.codi_fun' +
                          ' INNER JOIN habilidades H ON H.codi_hab = FH.codi_hab' +
                          ' WHERE F.codi_fun = ' + IntToStr(dblMatrizFuncao.KeyValue) +
                          ' ORDER BY H.desc_hab';
            Active:= True;
         end;

         if cdsImprimirHabTre.RecordCount = 0 then begin
            Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;
   end;

   with frxReport1 do begin
      case rgTipoRel.ItemIndex of
         0: LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ListaFuncoes.fr3');
         1: LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_FuncoesCompleto.fr3');
         2: LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_FuncoesHab.fr3');
         3: begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_FuncoesTre.fr3');
               Variables['Titulo']:= QuotedStr('RELATÓRIO DE FUNÇÕES');
         end;
         4: begin
            if rgMatrizFuncao.ItemIndex = 0 then begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_FuncoesTre.fr3');
               Variables['Titulo']:= QuotedStr('MATRIZ DE FUNÇÃO - POR FUNÇÃO');
            end
            else begin
               LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_FuncoesMatriz.fr3');
            end;
         end;
         5: begin
            LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_FuncoesHabTre.fr3');
         end;
      end;

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

end.
