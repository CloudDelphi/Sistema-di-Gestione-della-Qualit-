unit frm_CadManutModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, Spin;

type
  TFormCadManutModelo = class(TForm)
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
    frxDBManutModelo: TfrxDBDataset;
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
    lbl15: TLabel;
    edtCodigo: TEdit;
    edtIdent: TEdit;
    edtDescricao: TEdit;
    mmoObs: TMemo;
    tsItens: TTabSheet;
    lbl12: TLabel;
    lbl13: TLabel;
    tsPesquisa: TTabSheet;
    lbl2: TLabel;
    edtIdentItens: TEdit;
    lbl3: TLabel;
    edtDescItens: TEdit;
    lbl1: TLabel;
    edtItem: TEdit;
    btnInserirProcesso: TBitBtn;
    btnExcluirProcesso: TBitBtn;
    dbgItens: TDBGrid;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    dbgManut: TDBGrid;
    spnDiasAviso: TRxSpinEdit;
    edtCodItens: TEdit;
    lbl5: TLabel;
    cdsImprimirman_codigo: TIntegerField;
    cdsImprimirman_identificacao: TWideStringField;
    cdsImprimirman_descricao: TWideStringField;
    cdsImprimirman_obs: TWideMemoField;
    cdsImprimirite_descricao: TWideStringField;
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
    procedure dbgManutDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    function ValidarDadosItem(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoOQueKeyPress(Sender: TObject; var Key: Char);
    procedure btnInserirProcessoClick(Sender: TObject);
    procedure pgcManutChange(Sender: TObject);
    procedure btnExcluirProcessoClick(Sender: TObject);
    procedure dbgItensCellClick(Column: TColumn);
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadManutModelo: TFormCadManutModelo;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadManutModelo.AtualizarDados;
begin
   with cdsManut do begin
      Active:= False;
      CommandText:= ' SELECT man_codigo, man_identificacao, man_descricao, ' +
                    ' man_obs, man_dias_aviso' +
                    ' FROM manut_modelo';
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsManut.Locate('man_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormCadManutModelo.AtualizarDadosAcessorios;
begin
   if cdsManut.RecordCount > 0 then begin
      edtCodItens.Text  := cdsManut.FieldByName('man_codigo').AsString;
      edtIdentItens.Text:= cdsManut.FieldByName('man_identificacao').AsString;
      edtDescItens.Text := cdsManut.FieldByName('man_descricao').AsString;

      with cdsItens do begin
         Active:= False;
         CommandText:= ' SELECT ite_codigo, man_codigo, ite_descricao' +
                       ' FROM manut_modelo_itens' +
                       ' WHERE man_codigo = ' + QuotedStr(edtCodigo.Text) +
                       ' ORDER BY ite_descricao';
         Active:= True;
      end;
   end;
end;

procedure TFormCadManutModelo.Botoes(flag: Boolean);
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

procedure TFormCadManutModelo.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 15, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 1, 2);
      Botoes(False);
   end;
end;

procedure TFormCadManutModelo.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
end;

procedure TFormCadManutModelo.btnExcluirClick(Sender: TObject);
var
   sCodMan: string;
   sNomeMan: string;
   sDescMan: string;
begin
   if (Acesso(cUsuario, 15, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodMan := cdsManut.FieldByName('man_codigo').AsString;
         sNomeMan:= cdsManut.FieldByName('man_identificacao').AsString;
         sDescMan:= cdsManut.FieldByName('man_descricao').AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM manut_modelo' +
                          ' WHERE man_codigo = ' + sCodMan;
            Execute;
         end;

         Auditoria('CADASTRO DE MANUTENÇÃO MODELO', 'Cod ' + sCodMan + '-' + sNomeMan + '-' + sDescMan, 'E', '');
         LimparCampos(Self);
         AtualizarDados();
         PreencherCampos();
      end;
      Botoes(True);
   end;
end;

procedure TFormCadManutModelo.btnExcluirProcessoClick(Sender: TObject);
begin
   Executar(' DELETE FROM manut_modelo_itens' +
            ' WHERE ite_codigo = ' + cdsItens.FieldByName('ite_codigo').AsString);

   AtualizarDadosAcessorios();
end;

procedure TFormCadManutModelo.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO manut_modelo' +
                             ' (man_codigo, man_identificacao, man_descricao, ' +
                             ' man_obs, man_dias_aviso)' +
                             ' VALUES(' +
                             BuscarNovoCodigo('manut_modelo', 'man_codigo') + ',' +
                             QuotedStr(edtIdent.Text) + ',' +
                             QuotedStr(edtDescricao.Text) + ',' +
                             QuotedStr(mmoObs.Text) + ',' +
                             VirgulaParaPonto(spnDiasAviso.Value, 0) +
                             ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE manut_modelo SET ' +
                             ' man_identificacao = ' + QuotedStr(edtIdent.Text) + ',' +
                             ' man_descricao = ' + QuotedStr(edtDescricao.Text) + ',' +
                             ' man_obs = ' + QuotedStr(mmoObs.Text) + ',' +
                             ' man_dias_aviso = ' + VirgulaParaPonto(spnDiasAviso.Value, 0) +
                             ' WHERE man_codigo = ' + cdsManut.FieldByName('man_codigo').AsString;
               Execute;
            end;
         end;

         Auditoria('CADASTRO DE MANUTENÇÃO MODELO', 'Cod ' + edtCodigo.Text + '-' + edtIdent.Text + '-' + edtDescricao.Text, cOperacao,'');
         AtualizarDados();
//
         HabilitarCampos(False, False, Self, 1, 2);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadManutModelo.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadManutModelo.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
end;

procedure TFormCadManutModelo.btnInserirProcessoClick(Sender: TObject);
begin
   if ValidarDadosItem() then begin
      Executar(' INSERT INTO manut_modelo_itens(' +
              ' ite_codigo, man_codigo, ite_descricao)' +
              ' VALUES (' +
              BuscarNovoCodigo('manut_modelo_itens', 'ite_codigo') + ',' +
              QuotedStr(edtCodigo.Text) + ',' +
              QuotedStr(edtItem.Text) +
              ')');

      AtualizarDadosAcessorios();
   end;
end;

procedure TFormCadManutModelo.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 15, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos(Self);
      HabilitarCampos(True, False, Self, 1, 2);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      edtCodigo.Text:= BuscarNovoCodigo('manut_modelo', 'man_codigo');
      TryFocus(edtIdent);
   end;
end;

procedure TFormCadManutModelo.btnPrimeiroClick(Sender: TObject);
begin
   cdsManut.First;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutModelo.btnAnteriorClick(Sender: TObject);
begin
   cdsManut.Prior;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutModelo.btnProximoClick(Sender: TObject);
begin
   cdsManut.Next;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutModelo.btnUltimoClick(Sender: TObject);
begin
   cdsManut.Last;
   PreencherCampos();
   AtualizarDadosAcessorios();
end;

procedure TFormCadManutModelo.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadManutModelo.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadManutModelo.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadManutModelo.ControlarAbas;
begin
   if pgcManut.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin // Itens e Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnAlterar.Enabled := False;

      cdsManut.Filtered:= False;
      if AllTrim(edtCodigo.Text) <> EmptyStr then begin
         cdsManut.Locate('man_codigo', edtCodigo.Text,[]);
      end;

      if pgcManut.TabIndex = 1 then begin
         edtCodItens.Text  := edtCodigo.Text;
         edtIdentItens.Text:= edtIdent.Text;
         edtDescItens.Text := edtDescricao.Text;

         AtualizarDadosAcessorios();
      end;

      if pgcManut.TabIndex = 2 then begin
//         edtValor.Clear;
         TryFocus(edtValor);
         btnImprimir.Enabled:= False;
      end;
   end;
end;

procedure TFormCadManutModelo.dbgItensCellClick(Column: TColumn);
begin
   edtItem.Text:= cdsItens.FieldByName('ite_descricao').AsString;
end;

procedure TFormCadManutModelo.dbgManutDblClick(Sender: TObject);
var
   sCodigo: string;
begin
   sCodigo:= cdsManut.FieldByName('man_codigo').AsString;
   cdsManut.Filtered:= False;
   if AllTrim(sCodigo) <> EmptyStr then begin
      cdsManut.Locate('man_codigo', sCodigo,[]);
   end;

   PreencherCampos();
   pgcManut.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadManutModelo.dbgManutKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadManutModelo.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> EmptyStr then begin
      case cbbCampo.ItemIndex of
         0: cdsManut.Filter:= 'man_codigo = ' + QuotedStr(edtValor.Text);
         1: cdsManut.Filter:= 'man_identificacao LIKE ' + QuotedStr('%' + edtValor.Text + '%');
         2: cdsManut.Filter:= 'man_descricao LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      end;

      cdsManut.Filtered:= True;
   end
   else begin
      cdsManut.Filtered:= False;
   end;
end;

procedure TFormCadManutModelo.FormShow(Sender: TObject);
begin
   pgcManut.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1, 2);
   pnlImprimir.Visible:= False;
   spnDiasAviso.Hint:= 'Informe em quantos dias de antecedência o sistema deve ' + #13 +
                       'avisar o vencimento da próxima manutenção preventiva para esse item.' + #13 +
                       '0(zero) para não avisar.';
end;

procedure TFormCadManutModelo.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadManutModelo.mmoOQueKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadManutModelo.pgcManutChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadManutModelo.PreencherCampos;
begin
   with cdsManut do begin
      edtCodigo.Text    := FieldByName('man_codigo').AsString;
      edtIdent.Text     := FieldByName('man_identificacao').AsString;
      edtDescricao.Text := FieldByName('man_descricao').AsString;
      mmoObs.Text       := FieldByName('man_obs').AsString;
      spnDiasAviso.Value:= FieldByName('man_dias_aviso').AsFloat;
   end;
end;

function TFormCadManutModelo.ValidarDados(): Boolean;
begin
   if AllTrim(edtIdent.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdent);
      Result:= False;
      Exit;
   end;

   if AllTrim(edtDescricao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Descrição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtDescricao);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

function TFormCadManutModelo.ValidarDadosItem: Boolean;
begin
   if AllTrim(edtItem.Text) = EmptyStr then begin
      Application.MessageBox('Campo Item de Manutenção é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtItem);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadManutModelo.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'proc_man, man_codigo';
//   end
//   else begin
//      sCampoOrdem:= 'proc_man, desc_inf';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT M.man_codigo, M.man_identificacao, M.man_descricao, M.man_obs, ' +
                    ' MI.ite_descricao' +
                    ' FROM manut_modelo M' +
                    ' LEFT JOIN manut_modelo_itens MI ON MI.man_codigo = M.man_codigo' +
                    ' ORDER BY M.man_codigo DESC, MI.ite_descricao';
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_manutModelo.fr3');

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
