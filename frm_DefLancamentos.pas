unit frm_DefLancamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls, RXSpin, Mask, rxToolEdit;

type
  TFormDefLancamentos = class(TForm)
    pctDefeito: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl4: TLabel;
    edtCodigo: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgLancamentosDef: TDBGrid;
    zqryLanc: TZQuery;
    dspLanc: TDataSetProvider;
    cdsLanc: TClientDataSet;
    dsLanc: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnl1: TPanel;
    btnNovo: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    btnAlterar: TBitBtn;
    zqryAuxiliar: TZQuery;
    dspAuxiliar: TDataSetProvider;
    cdsAuxiliar: TClientDataSet;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDSDefeito: TfrxDBDataset;
    Label1: TLabel;
    edtRastreabilidade: TEdit;
    dblStatus: TDBLookupComboBox;
    zqryOrigem: TZQuery;
    dspOrigem: TDataSetProvider;
    cdsOrigem: TClientDataSet;
    dsOrigem: TDataSource;
    cdsImprimirdef_codigo: TIntegerField;
    cdsImprimirdef_descricao: TWideStringField;
    cdsImprimirdef_classe: TIntegerField;
    cdsImprimircla_descricao: TWideStringField;
    grp1: TGroupBox;
    chkClasse: TCheckBox;
    lbl2: TLabel;
    dtData: TDateEdit;
    lbl3: TLabel;
    dblOrigem: TDBLookupComboBox;
    lbl5: TLabel;
    dblProduto: TDBLookupComboBox;
    lbl15: TLabel;
    spnQtdInsp: TRxSpinEdit;
    tsLancamentos: TTabSheet;
    lbl6: TLabel;
    edtCodLanc: TEdit;
    lbl7: TLabel;
    dblDefeito: TDBLookupComboBox;
    lbl8: TLabel;
    spnQtdLanc: TRxSpinEdit;
    lbl11: TLabel;
    edtCodLanc1: TEdit;
    lbl12: TLabel;
    dtDataLanc: TDateEdit;
    dbgrd1: TDBGrid;
    cdsOrigemori_codigo: TIntegerField;
    cdsOrigemori_descricao: TWideStringField;
    zqryProduto: TZQuery;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsProdutopro_codigo: TIntegerField;
    cdsProdutopro_descricao: TWideStringField;
    zqryStatus: TZQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    dsStatus: TDataSource;
    cdsStatuscodi_com: TLargeintField;
    cdsStatusvalo_com: TWideStringField;
    cdsLanclan_codigo: TIntegerField;
    cdsLanclan_data: TDateTimeField;
    cdsLanclan_origem: TIntegerField;
    cdsLanclan_produto: TIntegerField;
    cdsLanclan_rastreabilidade: TWideStringField;
    cdsLanclan_qtd: TFloatField;
    cdsLanclan_status: TIntegerField;
    cdsLancori_descricao: TWideStringField;
    cdsLancpro_descricao: TWideStringField;
    cdsLancstatus: TWideStringField;
    zqryLancItem: TZQuery;
    dspLancItem: TDataSetProvider;
    cdsLancItem: TClientDataSet;
    dsLancItem: TDataSource;
    cdsLancItemite_codigo: TIntegerField;
    cdsLancItemlan_codigo: TIntegerField;
    cdsLancItemlan_defeito: TIntegerField;
    cdsLancItemlan_qtd: TFloatField;
    cdsLancItemdef_descricao: TWideStringField;
    zqryDefeitos: TZQuery;
    dspDefeitos: TDataSetProvider;
    cdsDefeitos: TClientDataSet;
    dsDefeitos: TDataSource;
    cdsDefeitosdef_codigo: TIntegerField;
    cdsDefeitosdef_descricao: TWideStringField;
    cdsDefeitosdef_classe: TIntegerField;
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure AtualizarDados;
    procedure AtualizarDadosAcessorios;
    procedure PreencherCampos;
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure FormShow(Sender: TObject);
    procedure dbgLancamentosDefCellClick(Column: TColumn);
    procedure dbgLancamentosDefDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure pctDefeitoChange(Sender: TObject);
    procedure tsLancamentosShow(Sender: TObject);
    procedure dblDefeitoCloseUp(Sender: TObject);
    procedure edtCodLancExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  FormDefLancamentos: TFormDefLancamentos;

implementation

uses Funcoes, frm_Inicial, frm_dm;

{$R *.dfm}

procedure TFormDefLancamentos.AtualizarDados;
begin
   cdsOrigem.Active:= False;
   cdsOrigem.Active:= True;

   cdsDefeitos.Active:= False;
   cdsDefeitos.Active:= True;

   cdsProduto.Active:= False;
   cdsProduto.Active:= True;

   with cdsStatus do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 26' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   cdsLanc.Active:= False;
   cdsLanc.Active:= True;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsLanc.Locate('lan_codigo', edtCodigo.Text,[])
   end;
end;

procedure TFormDefLancamentos.AtualizarDadosAcessorios;
var
   sCodigo: string;
begin
   sCodigo:= edtCodigo.Text;
   if sCodigo = '' then begin
      sCodigo:= '0';
   end;

   with cdsLancItem do begin
      Active:= False;
      CommandText:= ' SELECT I.ite_codigo, I.lan_codigo, I.lan_defeito, I.lan_qtd, D.def_descricao' +
                    ' FROM defeitos_lanc_itens I' +
                    ' INNER JOIN defeitos_lanc L ON L.lan_codigo = I.lan_codigo' +
                    ' INNER JOIN defeitos D ON D.def_codigo = I.lan_defeito' +
                    ' WHERE I.lan_codigo = ' + sCodigo +
                    ' ORDER BY I.lan_defeito';
      Active:= True;
   end;
end;

procedure TFormDefLancamentos.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsLanc.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormDefLancamentos.btnAlterarClick(Sender: TObject);
begin
//   if not (Acesso(cUsuario, 3, 'alteracao') = 1) then begin
//      Exit;
//   end;

   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 2);
   Botoes(False);

   if pctDefeito.TabIndex = 0 then begin
      TryFocus(dtData);
   end;
   if pctDefeito.TabIndex = 1 then begin
      TryFocus(edtCodLanc);
   end;
end;

procedure TFormDefLancamentos.btnAnteriorClick(Sender: TObject);
begin
   cdsLanc.Prior;
   PreencherCampos;
end;

procedure TFormDefLancamentos.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 2);
end;

procedure TFormDefLancamentos.btnExcluirClick(Sender: TObject);
var
   sDefeito: string;
begin
//   if (Acesso(cUsuario, 3, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sDefeito:= DateToStr(dtData.Date) + ' - ' + edtRastreabilidade.Text;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM defeitos_lanc' +
                          ' WHERE lan_codigo = ' + QuotedStr(edtCodigo.Text);
            Execute;
         end;

         Auditoria('LANÇAMENTOS DE DEFEITOS', sDefeito,'E','');
         LimparCampos(Self);
         AtualizarDados();
         PreencherCampos();
      end;
      Botoes(True);
//   end;
end;

procedure TFormDefLancamentos.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if pctDefeito.TabIndex = 0 then begin // Cadastro
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO defeitos_lanc (' +
                             ' lan_codigo, lan_data, lan_origem, lan_produto, lan_rastreabilidade, ' +
                             ' lan_qtd, lan_status)' +
                             ' VALUES(' +
                             QuotedStr(edtCodigo.Text) + ',' +
                             ArrumaDataSQL(dtData.Date) + ',' +
                             IntToStr(dblOrigem.KeyValue) + ',' +
                             IntToStr(dblProduto.KeyValue) + ',' +
                             QuotedStr(edtRastreabilidade.Text) + ',' +
                             VirgulaParaPonto(spnQtdInsp.Value, 2) + ',' +
                             IntToStr(dblStatus.KeyValue) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE defeitos_lanc SET' +
                             ' lan_data = ' + ArrumaDataSQL(dtData.Date) + ',' +
                             ' lan_origem = ' +IntToStr(dblOrigem.KeyValue) + ',' +
                             ' lan_produto = ' + IntToStr(dblProduto.KeyValue) + ',' +
                             ' lan_rastreabilidade = ' + QuotedStr(edtRastreabilidade.Text) + ',' +
                             ' lan_qtd = ' + VirgulaParaPonto(spnQtdInsp.Value, 2) + ',' +
                             ' lan_status = ' + IntToStr(dblStatus.KeyValue) +
                             ' WHERE lan_codigo = ' + QuotedStr(edtCodigo.Text);
            end;
            Execute;

            Auditoria('LANÇAMENTO DE DEFEITOS', DateToStr(dtData.Date) + ' - ' + edtRastreabilidade.Text ,cOperacao,'');
            AtualizarDados();

            HabilitarCampos(False, False, Self, 2);
            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;

         if pctDefeito.TabIndex = 1 then begin // Lançamentos
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO defeitos_lanc_itens(' +
                             ' ite_codigo, lan_codigo, lan_defeito, lan_qtd)' +
                             ' VALUES(' +
                             BuscarNovoCodigo('defeitos_lanc_itens', 'ite_codigo') + ',' +
                             edtCodLanc1.Text + ',' +
                             edtCodLanc.Text + ',' +
                             VirgulaParaPonto(spnQtdLanc.Value, 2) +
                             ');';
            end
            else begin
               CommandText:= ' UPDATE defeitos_lanc_itens SET' +
                             ' lan_defeito = ' + edtCodLanc.Text + ',' +
                             ' lan_qtd = ' + VirgulaParaPonto(spnQtdLanc.Value, 2) +
                             ' WHERE ite_codigo = ' + QuotedStr(cdsLancItem.FieldByName('ite_codigo').AsString);
            end;
            Execute;

            Auditoria('LANÇAMENTO DE DEFEITOS - ITEM', DateToStr(dtData.Date) + ' - ' + edtRastreabilidade.Text ,cOperacao,'');
            AtualizarDados();
            AtualizarDadosAcessorios();

            HabilitarCampos(False, False, Self, 2);
            Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;
      end;

   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;

   Botoes(True);
   TryFocus(btnNovo);
end;

procedure TFormDefLancamentos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormDefLancamentos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormDefLancamentos.btnNovoClick(Sender: TObject);
begin
//   if not (Acesso(cUsuario, 3, 'cadastro') = 1) then begin
//      Exit;
//   end;

   cOperacao:= 'I';
   HabilitarCampos(True, True, Self, 2);
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;

   case pctDefeito.TabIndex of
      0: begin
         LimparCampos(Self);
         edtCodigo.Text:= BuscarNovoCodigo('defeitos_lanc', 'lan_codigo');
         TryFocus(dtData);
         dblStatus.KeyValue:= 1;
         dtData.Date:= Date();
      end;
      1: begin
         TryFocus(edtCodLanc);
      end;
   end;
end;

procedure TFormDefLancamentos.btnPrimeiroClick(Sender: TObject);
begin
   cdsLanc.First;
   PreencherCampos;
end;

procedure TFormDefLancamentos.btnProximoClick(Sender: TObject);
begin
   cdsLanc.Next;
   PreencherCampos;
end;

procedure TFormDefLancamentos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormDefLancamentos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormDefLancamentos.btnUltimoClick(Sender: TObject);
begin
   cdsLanc.Last;
   PreencherCampos;
end;

procedure TFormDefLancamentos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormDefLancamentos.ControlarAbas;
begin
   if pctDefeito.TabIndex < 2 then begin
      Botoes(True);
      PreencherCampos();

      if pctDefeito.TabIndex = 0 then begin // Cadastro
         if cdsLanc.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;

      if pctDefeito.TabIndex = 1 then begin // Lançamentos
         if cdsLancItem.RecordCount = 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end;
      end;
   end
   else begin // Pesquisa
      btnNovo.Enabled:= False;
      btnGravar.Enabled:= False;
      btnExcluir.Enabled:= False;
      btnCancelar.Enabled:= False;
      btnImprimir.Enabled:= False;
      btnAlterar.Enabled:= False;

//      if pctAspectos.TabIndex = 1 then begin
         edtValor.Clear;
         edtValor.SetFocus;
//      end;
   end;
end;

procedure TFormDefLancamentos.dbgLancamentosDefCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormDefLancamentos.dbgLancamentosDefDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctDefeito.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormDefLancamentos.dblDefeitoCloseUp(Sender: TObject);
begin
   edtCodLanc.Text:= dblDefeito.KeyValue;
end;

procedure TFormDefLancamentos.edtCodLancExit(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT def_codigo, def_descricao, def_classe' +
                    ' FROM defeitos' +
                    ' WHERE def_codigo = ' + edtCodLanc.Text;
      Active:= True;

      if RecordCount <= 0 then begin
         Application.MessageBox('Não existe o código do defeito digitado', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtCodLanc);
      end
      else begin
         dblDefeito.KeyValue:= edtCodLanc.Text;
      end;
   end;
end;

procedure TFormDefLancamentos.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> '' then begin
      case cbbCampo.ItemIndex of
         0: cdsLanc.Locate('lan_rastreabilidade', edtValor.Text, [loPartialKey]);
      end;
   end;
end;

procedure TFormDefLancamentos.FormShow(Sender: TObject);
begin
   pctDefeito.TabIndex:= 0;
   AtualizarDados();
   AtualizarDadosAcessorios();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 2);
   ControlarAbas();
   pnlImprimir.Visible:= False;
   TryFocus(btnNovo);

   rgOrdemImpressao.ItemIndex:= 1;
   chkClasse.Checked:= True;
end;

procedure TFormDefLancamentos.pctDefeitoChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormDefLancamentos.PreencherCampos;
begin
   if pctDefeito.TabIndex = 0 then begin // Cadastro
      with cdsLanc do begin
         edtCodigo.Text         := FieldByName('lan_codigo').AsString;
         dtData.Date            := FieldByName('lan_data').AsDateTime;
         edtRastreabilidade.Text:= FieldByName('lan_rastreabilidade').AsString;
         spnQtdInsp.Value       := FieldByName('lan_qtd').AsInteger;

         if FieldByName('lan_origem').AsString <> EmptyStr then begin
            dblOrigem.KeyValue:= FieldByName('lan_origem').AsString;
         end;

         if FieldByName('lan_produto').AsString <> EmptyStr then begin
            dblProduto.KeyValue:= FieldByName('lan_produto').AsString;
         end;

         if FieldByName('lan_status').AsString <> EmptyStr then begin
            dblStatus.KeyValue:= FieldByName('lan_status').AsString;
         end;

         AtualizarDadosAcessorios();
      end;
   end;

   if pctDefeito.TabIndex = 1 then begin // Cadastro
      with cdsLancItem do begin
         edtCodLanc.Text := FieldByName('lan_defeito').AsString;
         spnQtdLanc.Value:= FieldByName('lan_qtd').AsFloat;

         if FieldByName('lan_defeito').AsString <> EmptyStr then begin
            dblDefeito.KeyValue:= FieldByName('lan_defeito').AsString;
         end;
      end;
   end;
end;

procedure TFormDefLancamentos.tsLancamentosShow(Sender: TObject);
begin
   edtCodLanc1.Text:= edtCodigo.Text;
   dtDataLanc.Date := dtData.Date;
end;

procedure TFormDefLancamentos.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if chkClasse.Checked then begin
      if rgOrdemImpressao.ItemIndex = 0 then begin // Código
         sCampoOrdem:= 'cla_descricao, def_codigo'
      end
      else begin // Alfabética
         sCampoOrdem:= 'cla_descricao, def_descricao'
      end;
   end
   else begin
      if rgOrdemImpressao.ItemIndex = 0 then begin // Código
         sCampoOrdem:= 'def_codigo'
      end
      else begin // Alfabética
         sCampoOrdem:= 'def_descricao'
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT D.def_codigo, D.def_descricao, D.def_classe, C.cla_descricao' +
                    ' FROM defeitos D' +
                    ' INNER JOIN defeitos_classe C ON C.cla_codigo = D.def_classe' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      if chkClasse.Checked then begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaDefeitosAgrupa.fr3');
      end
      else begin
         LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_listaDefeitos.fr3');
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
