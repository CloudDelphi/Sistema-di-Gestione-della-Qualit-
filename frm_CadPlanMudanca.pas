unit frm_CadPlanMudanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, JvExExtCtrls, JvExtComponent, JvPanel, jpeg,
  dxGDIPlusClasses;

type
  TFormCadPlanMudanca = class(TForm)
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
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryMudanca: TZQuery;
    dspMudanca: TDataSetProvider;
    cdsMudanca: TClientDataSet;
    dsMudanca: TDataSource;
    frxReport1: TfrxReport;
    frxDBDSProcessos: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl2: TLabel;
    lbl8: TLabel;
    lbl3: TLabel;
    edtNomeProcesso: TEdit;
    mmoEntradas: TMemo;
    mmoSaidas: TMemo;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    mmoRequisitos: TMemo;
    lbl1: TLabel;
    lrgntfldMudancaclas_pro: TLargeintField;
    lrgntfldMudancacodi_pro: TLargeintField;
    lrgntfldMudancafunc_pro: TLargeintField;
    lrgntfldMudancagest_pro: TLargeintField;
    cdsMudancainfr_pro: TMemoField;
    cdsMudancanome_pro: TWideStringField;
    cdsImprimirclas_pro: TLargeintField;
    cdsImprimircodi_pro: TLargeintField;
    cdsImprimirentr_pro: TMemoField;
    cdsImprimirfunc_pro: TLargeintField;
    cdsImprimirgest_pro: TLargeintField;
    cdsImprimirinfr_pro: TMemoField;
    cdsImprimirnome_pro: TWideStringField;
    cdsImprimirrequ_pro: TMemoField;
    cdsImprimirsaid_pro: TMemoField;
    cdsMudancaDescClassificacao: TStringField;
    cdsMudancaDescGestor: TStringField;
    cdsImprimirDescClassificacao: TStringField;
    cdsImprimirnome_col: TWideStringField;
    cdsMudancaentr_pro: TWideMemoField;
    cdsMudancarequ_pro: TWideMemoField;
    cdsMudancasaid_pro: TWideMemoField;
    cdsMudancapro_exibelista: TWideStringField;
    lbl4: TLabel;
    mmo1: TMemo;
    tsCheckList: TTabSheet;
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
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadPlanMudanca: TFormCadPlanMudanca;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadPlanMudanca.AtualizarDados;
begin
   with cdsMudanca do begin
      Active:= False;
      CommandText:= ' SELECT clas_pro, codi_pro, entr_pro, func_pro, gest_pro, ' +
                    ' infr_pro, nome_pro, requ_pro, said_pro, pro_exibelista' +
                    ' FROM processos' +
                    ' WHERE pro_exibelista = ' + QuotedStr('S') +
                    ' ORDER BY nome_pro';
      Active:= True;
   end;

   if AllTrim(cdsMudanca.FieldByName('pla_codigo').AsString) <> EmptyStr then begin
      cdsMudanca.Locate('nome_pro', edtNomeProcesso.Text,[])
   end;
end;

procedure TFormCadPlanMudanca.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsMudanca.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadPlanMudanca.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 2, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(edtNomeProcesso);
      Botoes(False);
   end;
end;

procedure TFormCadPlanMudanca.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadPlanMudanca.btnExcluirClick(Sender: TObject);
var
   sCodProcesso: string;
   sDescProcesso: string;
begin
   if (Acesso(cUsuario, 2, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodProcesso:= cdsMudanca.FieldByName('pla_codigo').AsString;
         sDescProcesso:= cdsMudanca.FieldByName('pla_mudanca').AsString;

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

procedure TFormCadPlanMudanca.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO processos (' +
                             ' codi_pro, nome_pro, clas_pro, entr_pro, said_pro, ' +
                             ' requ_pro, pro_exibelista ' +
                             ') VALUES(' +
                             sNovoCodigo + ',' +
                             QuotedStr(edtNomeProcesso.Text) + ',' +
                             QuotedStr(mmoEntradas.Text) + ',' +
                             QuotedStr(mmoSaidas.Text) + ',' +
                             QuotedStr(mmoRequisitos.Text) + ',' +
                             QuotedStr('S');
               Execute;
            end
            else begin
               CommandText:= ' UPDATE processos SET' +
                             ' nome_pro = ' + QuotedStr(edtNomeProcesso.Text) + ',' +
                             ' entr_pro = ' + QuotedStr(mmoEntradas.Text) + ',' +
                             ' said_pro = ' + QuotedStr(mmoSaidas.Text) + ',' +
                             ' requ_pro = ' + QuotedStr(mmoRequisitos.Text) +
                             ' WHERE codi_pro = ' + cdsMudanca.FieldByName('pla_codigo').Asstring;
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

procedure TFormCadPlanMudanca.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPlanMudanca.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
end;

procedure TFormCadPlanMudanca.btnNovoClick(Sender: TObject);
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

procedure TFormCadPlanMudanca.btnPrimeiroClick(Sender: TObject);
begin
   cdsMudanca.First;
   PreencherCampos;
end;

procedure TFormCadPlanMudanca.btnAnteriorClick(Sender: TObject);
begin
   cdsMudanca.Prior;
   PreencherCampos;
end;

procedure TFormCadPlanMudanca.btnProximoClick(Sender: TObject);
begin
   cdsMudanca.Next;
   PreencherCampos;
end;

procedure TFormCadPlanMudanca.btnUltimoClick(Sender: TObject);
begin
   cdsMudanca.Last;
   PreencherCampos;
end;

procedure TFormCadPlanMudanca.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadPlanMudanca.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPlanMudanca.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPlanMudanca.BuscarNovoCodigo;
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

procedure TFormCadPlanMudanca.ControlarAbas;
begin
   case pctProcessos.TabIndex of
      0: begin  // Cadastro
         Botoes(True);
         PreencherCampos();
      end;
      1: begin // Pesquisa
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

procedure TFormCadPlanMudanca.dbgClientesCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadPlanMudanca.dbgClientesDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctProcessos.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadPlanMudanca.dbgClientesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadPlanMudanca.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsMudanca.Locate('nome_pro', edtValor.Text, [loPartialKey]);
//      0: cdsLaaia.Filter:= 'LAI_ATIVIDADE LIKE ' + QuotedStr('%' + edtValor.Text + '%');
   end;

//   cdsLaaia.Filtered:= True;
end;

procedure TFormCadPlanMudanca.FormShow(Sender: TObject);
begin
   pctProcessos.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
end;

procedure TFormCadPlanMudanca.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtNomeProcesso.Enabled := Flag;
   mmoEntradas.Enabled     := Flag;
   mmoSaidas.Enabled       := Flag;
   mmoRequisitos.Enabled   := Flag;

   pctProcessos.Pages[1].TabVisible:= not Flag;
end;

procedure TFormCadPlanMudanca.LimparCampos;
begin
   edtNomeProcesso.Clear;
   mmoEntradas.Clear;
   mmoSaidas.Clear;
   mmoRequisitos.Clear;
end;

procedure TFormCadPlanMudanca.mmoSaidasExit(Sender: TObject);
begin
   mmoSaidas.Text:= AcertaUpper(mmoSaidas.Text);
end;

procedure TFormCadPlanMudanca.mmoEntradasExit(Sender: TObject);
begin
   mmoEntradas.Text:= AcertaUpper(mmoEntradas.Text);
end;

procedure TFormCadPlanMudanca.mmoEntradasKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadPlanMudanca.mmoRequisitosExit(Sender: TObject);
begin
   mmoRequisitos.Text:= AcertaUpper(mmoRequisitos.Text);
end;

procedure TFormCadPlanMudanca.pctProcessosChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadPlanMudanca.PreencherCampos;
begin
   with cdsMudanca do begin
      edtNomeProcesso.Text:= FieldByName('nome_pro').AsString;
      mmoEntradas.Text    := FieldByName('entr_pro').AsString;
      mmoSaidas.Text      := FieldByName('said_pro').AsString;
      mmoRequisitos.Text  := FieldByName('requ_pro').AsString;

   end;
end;

function TFormCadPlanMudanca.ValidarDados(): Boolean;
begin
   if AllTrim(edtNomeProcesso.Text) = EmptyStr then begin
      Application.MessageBox('Campo Nome do Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtNomeProcesso);
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

procedure TFormCadPlanMudanca.Impressao(tipoImp: string);
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
