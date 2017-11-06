unit frm_CadManutPreventiva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadManutPreventiva = class(TForm)
    pctManut: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgManut: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
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
    tsCadastro: TTabSheet;
    lbl6: TLabel;
    dblProcesso: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    cdsPeriodo: TClientDataSet;
    dsPeriodo: TDataSource;
    dspPeriodo: TDataSetProvider;
    zqryPeriodo: TZQuery;
    cdsPeriodocodi_com: TLargeintField;
    cdsPeriodovalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    dblPeriodo: TDBLookupComboBox;
    lbl7: TLabel;
    edtCodigo: TEdit;
    lbl1: TLabel;
    mmoOQue: TMemo;
    lbl2: TLabel;
    mmoComo: TMemo;
    lbl3: TLabel;
    lbl4: TLabel;
    zqryItens: TZQuery;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    dblItens: TDBLookupComboBox;
    cdsItenscodi_inf: TLargeintField;
    cdsManutDescPeriodo: TStringField;
    cdsImprimirDescPeriodo: TStringField;
    cdsImprimirNomeProcesso: TStringField;
    cdsManutcodi_inf: TLargeintField;
    cdsManutcodi_man: TLargeintField;
    cdsManutdata_man: TDateTimeField;
    cdsManutonde_man: TLargeintField;
    cdsManutquem_man: TLargeintField;
    cdsManutproc_man: TLargeintField;
    cdsManutefic_man: TWideStringField;
    cdsImprimircodi_inf: TLargeintField;
    cdsImprimircodi_man: TLargeintField;
    cdsImprimirdata_man: TDateTimeField;
    cdsImprimironde_man: TLargeintField;
    cdsImprimirquem_man: TLargeintField;
    cdsImprimirproc_man: TLargeintField;
    cdsImprimirefic_man: TWideStringField;
    cdsItensdesc_inf: TWideStringField;
    cdsItensiden_inf: TWideStringField;
    cdsManutDescItem: TStringField;
    cdsManutdesc_inf: TWideStringField;
    cdsManutiden_inf: TWideStringField;
    cdsManutcomo_man: TWideMemoField;
    cdsManutoque_man: TWideMemoField;
    cdsManutquan_man: TWideMemoField;
    cdsManutanom_man: TWideMemoField;
    cdsImprimirdescitem: TWideStringField;
    cdsImprimiridentitem: TWideStringField;
    cdsImprimiranom_man: TWideMemoField;
    cdsImprimircomo_man: TWideMemoField;
    cdsImprimiroque_man: TWideMemoField;
    cdsImprimirquan_man: TWideMemoField;
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
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    lbl5: TLabel;
    spnDiasAviso: TRxSpinEdit;
    lbl8: TLabel;
    cdsManutman_diasaviso: TIntegerField;
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
    procedure dbgManutKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgManutCellClick(Column: TColumn);
    procedure dbgManutDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctManutChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure AtualizarItens();
    procedure dblProcessoCloseUp(Sender: TObject);
    procedure mmoOQueKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure cdsManutCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadManutPreventiva: TFormCadManutPreventiva;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadManutPreventiva.AtualizarDados;
begin
   with cdsPeriodo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 19' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsManut do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
      cdsManut.Locate('codi_man', edtCodigo.Text,[])
   end;
end;

procedure TFormCadManutPreventiva.AtualizarItens;
begin
   dblItens.KeyValue:= -1;

   if dblProcesso.KeyValue <> Null then begin
      with cdsItens do begin
         Active:= False;
         CommandText:= ' SELECT codi_inf, desc_inf, iden_inf ' + //|| ' + QuotedStr(' - ') + ' || desc_inf AS DescItem ' +
                       ' FROM infraestrutura' +
                       ' WHERE proc_inf = ' + QuotedStr(IntToStr(dblProcesso.KeyValue)) +
                       ' AND manu_inf = 0' + // SIM
                       ' ORDER BY desc_inf';
         Active:= True;
      end;
   end;
end;

procedure TFormCadManutPreventiva.Botoes(flag: Boolean);
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

procedure TFormCadManutPreventiva.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 15, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      TryFocus(dblProcesso);
      Botoes(False);
   end;
end;

procedure TFormCadManutPreventiva.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadManutPreventiva.btnExcluirClick(Sender: TObject);
var
   sCodMan: string;
   sNomeMan: string;
begin
   if (Acesso(cUsuario, 15, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodMan := cdsManutcodi_man.AsString;
         sNomeMan:= cdsManutanom_man.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM manutencao' +
                          ' WHERE codi_man = ' + sCodMan;
            Execute;
         end;

         Auditoria('CADASTRO DE MANUTENÇÃO PREVENTIVA', sNomeMan, 'E', '');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadManutPreventiva.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO manutencao' +
                             ' (codi_man, proc_man, codi_inf, oque_man, como_man, ' +
                             ' quan_man, efic_man, man_datacadastro, man_diasaviso)' +
                             ' VALUES(' +
                             QuotedStr(sNovoCodigo) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             IntToStr(dblItens.KeyValue) + ',' +
                             QuotedStr(mmoOQue.Text) + ',' +
                             QuotedStr(mmoComo.Text) + ',' +
                             QuotedStr(dblPeriodo.KeyValue) + ',' +
                             QuotedStr('1') + ',' +// NÃO
                             QuotedStr(ArrumaDataSQL(date())) + ',' +
                             VirgulaParaPonto(spnDiasAviso.Value, 0) +
                             ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE manutencao SET' +
                             ' proc_man = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' codi_inf = ' + IntToStr(dblItens.KeyValue) + ',' +
                             ' oque_man = ' + QuotedStr(mmoOQue.Text) + ',' +
                             ' como_man = ' + QuotedStr(mmoComo.Text) + ',' +
                             ' quan_man = ' + QuotedStr(dblPeriodo.KeyValue) + ',' +
                             ' man_diasaviso = ' + VirgulaParaPonto(spnDiasAviso.Value, 0) +
                             ' WHERE codi_man = ' + cdsManutcodi_man.AsString;
               Execute;
            end;
         end;

         Auditoria('CADASTRO DE MANUTENÇÃO PREVENTIVA', dblItens.Text, cOperacao,'');
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

procedure TFormCadManutPreventiva.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadManutPreventiva.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 0;
end;

procedure TFormCadManutPreventiva.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 15, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, False);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      edtCodigo.Text:= sNovoCodigo;
      TryFocus(dblProcesso);
   end;
end;

procedure TFormCadManutPreventiva.btnPrimeiroClick(Sender: TObject);
begin
   cdsManut.First;
   PreencherCampos();
end;

procedure TFormCadManutPreventiva.btnAnteriorClick(Sender: TObject);
begin
   cdsManut.Prior;
   PreencherCampos();
end;

procedure TFormCadManutPreventiva.btnProximoClick(Sender: TObject);
begin
   cdsManut.Next;
   PreencherCampos();
end;

procedure TFormCadManutPreventiva.btnUltimoClick(Sender: TObject);
begin
   cdsManut.Last;
   PreencherCampos();
end;

procedure TFormCadManutPreventiva.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadManutPreventiva.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadManutPreventiva.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadManutPreventiva.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_man) AS NovoCodigo FROM manutencao';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadManutPreventiva.cdsManutCalcFields(DataSet: TDataSet);
begin
   cdsManut.FieldByName('DescItem').AsString:= cdsManut.FieldByName('iden_inf').AsString + ' - ' +
                                               cdsManut.FieldByName('desc_inf').AsString;
end;

procedure TFormCadManutPreventiva.ControlarAbas;
begin
   if pctManut.TabIndex = 0 then begin  // Cadastro
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

      if pctManut.TabIndex = 1 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadManutPreventiva.dbgManutCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadManutPreventiva.dbgManutDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctManut.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadManutPreventiva.dbgManutKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadManutPreventiva.dblProcessoCloseUp(Sender: TObject);
begin
   AtualizarItens();
end;

procedure TFormCadManutPreventiva.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> EmptyStr then begin
      case cbCampo.ItemIndex of
         0: cdsManut.Locate('codi_man', edtValor.Text, [loPartialKey]);
      end;
   end;
end;

procedure TFormCadManutPreventiva.edtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Not (key in ['0'..'9',#8]) then begin
      key := #0;
   end;
end;

procedure TFormCadManutPreventiva.FormShow(Sender: TObject);
begin
   pctManut.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;
   spnDiasAviso.Hint:= 'Informe em quantos dias de antecedência o sistema deve ' + #13 +
                       'avisar o vencimento da próxima manutenção preventiva para esse item.' + #13 +
                       '0(zero) para não avisar.';
end;

procedure TFormCadManutPreventiva.HabilitarCampos(Flag, Codigo: Boolean);
begin
   edtCodigo.Enabled   := Codigo;
   dblProcesso.Enabled := Flag;
   dblItens.Enabled    := Flag;
   mmoOQue.Enabled     := Flag;
   mmoComo.Enabled     := Flag;
   dblPeriodo.Enabled  := Flag;
   spnDiasAviso.Enabled:= Flag;

   pctManut.Pages[1].TabVisible:= not Flag;
end;

procedure TFormCadManutPreventiva.LimparCampos;
begin
   edtCodigo.Clear;
   dblProcesso.KeyValue:= -1;
   dblItens.KeyValue:= -1;
   mmoOQue.Clear;
   mmoComo.Clear;
   dblPeriodo.KeyValue:= -1;
   spnDiasAviso.Value:= 0;
end;

procedure TFormCadManutPreventiva.mmoOQueKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadManutPreventiva.pctManutChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadManutPreventiva.PreencherCampos;
begin
   with cdsManut do begin
      edtCodigo.Text    := FieldByName('codi_man').AsString;
      mmoOQue.Text      := FieldByName('oque_man').AsString;
      mmoComo.Text      := FieldByName('como_man').AsString;
      spnDiasAviso.Value:= FieldByName('man_diasaviso').AsFloat;

      if FieldByName('proc_man').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('proc_man').AsString;
      end;

      AtualizarItens();
      if FieldByName('codi_inf').AsString <> EmptyStr then begin
         dblItens.KeyValue:= FieldByName('codi_inf').AsString;
      end;

      if FieldByName('quan_man').AsString <> EmptyStr then begin
         dblPeriodo.KeyValue:= FieldByName('quan_man').AsString;
      end;
   end;
end;

function TFormCadManutPreventiva.ValidarDados(): Boolean;
begin
   if dblProcesso.KeyValue = -1 then begin
      Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if dblItens.KeyValue = -1 then begin
      Application.MessageBox('Campo Item é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblItens);
      Result:= False;
      Exit;
   end;

   if AllTrim(mmoOQue.Text) = EmptyStr then begin
      Application.MessageBox('Campo O que fazer é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoOQue);
      Result:= False;
      Exit;
   end;

   if AllTrim(mmoComo.Text) = EmptyStr then begin
      Application.MessageBox('Campo Como fazer é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoComo);
      Result:= False;
      Exit;
   end;

   if dblPeriodo.KeyValue = -1 then begin
      Application.MessageBox('Campo Quando ? (Periodicidade) é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblPeriodo);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadManutPreventiva.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin
      sCampoOrdem:= 'proc_man, codi_man';
//   end
//   else begin
//      sCampoOrdem:= 'proc_man, desc_inf';
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT anom_man, M.codi_inf, codi_man, como_man, data_man, ' +
                    ' onde_man, oque_man, quan_man, quem_man, proc_man, efic_man, ' +
                    ' I.desc_inf AS DescItem, I.iden_inf as IdentItem ' +
                    ' FROM manutencao M' +
                    ' INNER JOIN infraestrutura I ON I.codi_inf = M.codi_inf' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_manutPreventiva.fr3');

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
