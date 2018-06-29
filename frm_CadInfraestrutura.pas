unit frm_CadInfraestrutura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, Jpeg;

type
  TFormCadInfraestrutura = class(TForm)
    pctInfra: TJvgPageControl;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    dbgRegistros: TDBGrid;
    edtValor: TEdit;
    cbCampo: TComboBox;
    pnl1: TPanel;
    btnSair: TBitBtn;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryInfra: TZQuery;
    dspInfra: TDataSetProvider;
    cdsInfra: TClientDataSet;
    dsInfra: TDataSource;
    frxReport1: TfrxReport;
    frxDBInfra: TfrxDBDataset;
    tsCadastro: TTabSheet;
    lbl6: TLabel;
    dblProcesso: TDBLookupComboBox;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl1: TLabel;
    edtDescricao: TEdit;
    cdsManutPrev: TClientDataSet;
    dsManutPrev: TDataSource;
    dspManutPrev: TDataSetProvider;
    zqryManutPrev: TZQuery;
    cdsManutPrevcodi_com: TLargeintField;
    cdsManutPrevvalo_com: TWideStringField;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    lblPeriodo: TLabel;
    dblManutPrev: TDBLookupComboBox;
    zqryTipo: TZQuery;
    dspTipo: TDataSetProvider;
    cdsTipo: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsTipo: TDataSource;
    lbl11: TLabel;
    dblTipo: TDBLookupComboBox;
    lbl7: TLabel;
    edtCodigo: TEdit;
    lbl2: TLabel;
    edtIdent: TEdit;
    cdsImprimirNomeProcesso: TStringField;
    cdsImprimirDescManut: TStringField;
    cdsInfraDescManut: TStringField;
    cdsImprimircodi_inf: TLargeintField;
    cdsImprimirdesc_inf: TWideStringField;
    cdsImprimiriden_inf: TWideStringField;
    cdsImprimirproc_inf: TLargeintField;
    cdsImprimirqtde_inf: TLargeintField;
    cdsImprimirseto_inf: TLargeintField;
    cdsImprimirtipo_inf: TLargeintField;
    cdsImprimirmanu_inf: TIntegerField;
    cdsImprimirvalo_com: TWideStringField;
    cdsInfracodi_inf: TLargeintField;
    cdsInfradesc_inf: TWideStringField;
    cdsInfraiden_inf: TWideStringField;
    cdsInfraproc_inf: TLargeintField;
    cdsInfraqtde_inf: TLargeintField;
    cdsInfraseto_inf: TLargeintField;
    cdsInfratipo_inf: TLargeintField;
    cdsInframanu_inf: TIntegerField;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnImprimir: TBitBtn;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    spnDiasAviso: TRxSpinEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cdsInfrainf_diasaviso: TIntegerField;
    lbl22: TLabel;
    edtUnidade: TEdit;
    lbl5: TLabel;
    lbl8: TLabel;
    edtResolucao: TEdit;
    lbl12: TLabel;
    edtCapacidade: TEdit;
    cdsInfrainf_capacidade: TWideStringField;
    cdsInfrainf_resolucao: TWideStringField;
    cdsInfrainf_unidade: TWideStringField;
    lbl14: TLabel;
    dblStatus: TDBLookupComboBox;
    zqryStatus: TZQuery;
    dspStatus: TDataSetProvider;
    cdsStatus: TClientDataSet;
    cds1: TLargeintField;
    cds2: TWideStringField;
    dsStatus: TDataSource;
    cdsInfrainf_status: TIntegerField;
    sbArquivo: TSpeedButton;
    cdsInfrainf_imagem: TWideMemoField;
    pnlImagem: TPanel;
    opd1: TOpenDialog;
    sbVisualizaTreCertificado: TSpeedButton;
    lbl36: TLabel;
    edtCaminhoImagem: TEdit;
    dbimg1: TDBImage;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
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
    procedure dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRegistrosCellClick(Column: TColumn);
    procedure dbgRegistrosDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctInfraChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure AlterarCalibracao();
    procedure sbArquivoClick(Sender: TObject);
    procedure sbVisualizaTreCertificadoClick(Sender: TObject);
    procedure CarregarImagem();
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sCaminhoCompletoImagem: string;
    Imagem    : TJpegImage;
  public
    { Public declarations }
  end;

var
  FormCadInfraestrutura: TFormCadInfraestrutura;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadInfraestrutura.AlterarCalibracao;
begin
   Executar(' UPDATE calibracao SET' +
            ' cali_processo = ' + QuotedStr(dblProcesso.KeyValue) +
            ' WHERE cali_equip = ' + QuotedStr(edtCodigo.Text)
           );
end;

procedure TFormCadInfraestrutura.AtualizarDados;
begin
   with cdsManutPrev do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsStatus do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 15' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   with cdsTipo do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 8' +
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

   with cdsInfra do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(edtIdent.Text) <> EmptyStr then begin
      cdsInfra.Locate('iden_inf', edtIdent.Text,[])
   end;
end;

procedure TFormCadInfraestrutura.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsInfra.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadInfraestrutura.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 14, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self);
      TryFocus(edtDescricao);
      Botoes(False);
   end;
end;

procedure TFormCadInfraestrutura.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self);
end;

procedure TFormCadInfraestrutura.btnExcluirClick(Sender: TObject);
var
   sCodInf: string;
   sNomeInf: string;
begin
   if (Acesso(cUsuario, 14, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodInf := cdsInfracodi_inf.AsString;
         sNomeInf:= cdsInfradesc_inf.AsString;

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM Infraestrutura' +
                          ' WHERE codi_inf = ' + sCodInf;
            Execute;
         end;

         Auditoria('CADASTRO DE INFRAESTRUTURA', sNomeInf, 'E', '');
         LimparCampos;
         AtualizarDados;
         PreencherCampos;
      end;
      Botoes(True);
   end;
end;

procedure TFormCadInfraestrutura.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
//         sCaminhoCompletoImagem:= ExtractFilePath(Application.ExeName) + '\Imagens\Infra' + edtCodigo.Text + '.jpg';

         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO infraestrutura' +
                             ' (codi_inf, tipo_inf, qtde_inf, desc_inf, iden_inf, ' +
                             ' proc_inf, manu_inf, inf_diasaviso, inf_capacidade, ' +
                             ' inf_resolucao, inf_unidade, inf_status, inf_imagem' +
                             ')' +
                             ' VALUES(' +
                             QuotedStr(sNovoCodigo) + ',' +
                             IntToStr(dblTipo.KeyValue) + ',' +
                             '1' + ',' +
                             QuotedStr(edtDescricao.Text) + ',' +
                             QuotedStr(edtIdent.Text) + ',' +
                             QuotedStr(dblProcesso.KeyValue) + ',' +
                             QuotedStr(dblManutPrev.KeyValue) + ',' +
                             VirgulaParaPonto(spnDiasAviso.Value, 0) + ',' +
                             QuotedStr(edtCapacidade.Text) + ',' +
                             QuotedStr(edtResolucao.Text) + ',' +
                             QuotedStr(edtUnidade.Text) + ',' +
                             QuotedStr(dblStatus.KeyValue) + ',' +
                             QuotedStr(edtCaminhoImagem.Text) +
                             ')';
               Execute;
            end
            else begin
               CommandText:= ' UPDATE infraestrutura SET' +
                             ' tipo_inf = ' + IntToStr(dblTipo.KeyValue) + ',' +
                             ' desc_inf = ' + QuotedStr(edtDescricao.Text) + ',' +
                             ' iden_inf = ' + QuotedStr(edtIdent.Text) + ',' +
                             ' proc_inf = ' + QuotedStr(dblProcesso.KeyValue) + ',' +
                             ' manu_inf = ' + QuotedStr(dblManutPrev.KeyValue) + ',' +
                             ' inf_diasaviso = ' + VirgulaParaPonto(spnDiasAviso.Value, 0) + ',' +
                             ' inf_capacidade = ' + QuotedStr(edtCapacidade.Text) + ',' +
                             ' inf_resolucao = ' + QuotedStr(edtResolucao.Text) + ',' +
                             ' inf_unidade = ' + QuotedStr(edtUnidade.Text) + ',' +
                             ' inf_status = ' + QuotedStr(dblStatus.KeyValue) + ',' +
                             ' inf_imagem = ' + QuotedStr(edtCaminhoImagem.Text) +
                             ' WHERE codi_inf = ' + cdsInfracodi_inf.AsString;
               Execute;

               AlterarCalibracao();
            end;
         end;
         // Grava a imagem na pasta Imagens
//         imgEquipamento.Picture.SaveToFile(ExtractFilePath(Application.ExeName) + '\Imagens\Infra' + edtCodigo.Text + '.bmp');

         Auditoria('CADASTRO DE INFRAESTRUTURA', edtDescricao.Text, cOperacao,'');
         AtualizarDados();
         CarregarImagem();

         HabilitarCampos(False, False, Self);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadInfraestrutura.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadInfraestrutura.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   rgOrdemImpressao.ItemIndex:= 1;
end;

procedure TFormCadInfraestrutura.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 14, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, True, Self);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
      BuscarNovoCodigo();
      edtCodigo.Text:= sNovoCodigo;
      TryFocus(edtIdent);
   end;
end;

procedure TFormCadInfraestrutura.btnPrimeiroClick(Sender: TObject);
begin
   cdsInfra.First;
   PreencherCampos();
end;

procedure TFormCadInfraestrutura.btnAnteriorClick(Sender: TObject);
begin
   cdsInfra.Prior;
   PreencherCampos();
end;

procedure TFormCadInfraestrutura.btnProximoClick(Sender: TObject);
begin
   cdsInfra.Next;
   PreencherCampos();
end;

procedure TFormCadInfraestrutura.btnUltimoClick(Sender: TObject);
begin
   cdsInfra.Last;
   PreencherCampos();
end;

procedure TFormCadInfraestrutura.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadInfraestrutura.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadInfraestrutura.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadInfraestrutura.BuscarNovoCodigo;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_inf) AS NovoCodigo FROM Infraestrutura';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         sNovoCodigo:= '1';
      end
      else begin
         sNovoCodigo:= IntToStr(FieldByName('NovoCodigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadInfraestrutura.CarregarImagem;
begin
   if edtCaminhoImagem.Text <> EmptyStr then begin
      if FileExists(edtCaminhoImagem.Text) then begin
         dbimg1.Picture.LoadFromFile(edtCaminhoImagem.Text);
      end
      else begin
         if Copy(edtCaminhoImagem.Text, 1, 4) = 'http' then begin
            dbimg1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Imagens\imgNaoDisponivel.jpg');
         end
         else begin
            dbimg1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Imagens\imgNaoEncontrada.jpg');
         end;
      end;
   end
   else begin
      dbimg1.Picture:= nil;
   end;
end;

procedure TFormCadInfraestrutura.ControlarAbas;
begin
   if pctInfra.TabIndex = 0 then begin  // Cadastro
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

      if pctInfra.TabIndex = 1 then begin
         edtValor.Clear;
         TryFocus(edtValor);
      end;
   end;
end;

procedure TFormCadInfraestrutura.dbgRegistrosCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadInfraestrutura.dbgRegistrosDblClick(Sender: TObject);
begin
   PreencherCampos;
   pctInfra.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadInfraestrutura.dbgRegistrosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadInfraestrutura.edtValorChange(Sender: TObject);
begin
   case cbCampo.ItemIndex of
      0: cdsInfra.Locate('desc_inf', edtValor.Text, [loPartialKey]);
      1: cdsInfra.Locate('codi_inf', edtValor.Text, [loPartialKey]);
      2: cdsInfra.Locate('iden_inf', edtValor.Text, [loPartialKey]);
   end;
end;

procedure TFormCadInfraestrutura.FormShow(Sender: TObject);
begin
   pctInfra.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self);
   pnlImprimir.Visible:= False;
   spnDiasAviso.Hint:= 'Informe em quantos dias de antecedência o sistema deve ' + #13 +
                       'avisar o vencimento da próxima calibração para esse equipamento.' + #13 +
                       '0(zero) para não avisar.';
end;

procedure TFormCadInfraestrutura.LimparCampos;
begin
   edtCodigo.Clear;
   edtDescricao.Clear;
   edtIdent.Clear;
   dblTipo.KeyValue:= -1;
   dblProcesso.KeyValue:= -1;
   dblManutPrev.KeyValue:= -1;
   spnDiasAviso.Value:= 0;
   edtUnidade.Clear;
   edtCapacidade.Clear;
   edtResolucao.Clear;
end;

procedure TFormCadInfraestrutura.pctInfraChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadInfraestrutura.PreencherCampos;
begin
   with cdsInfra do begin
      edtCodigo.Text       := FieldByName('codi_inf').AsString;
      edtDescricao.Text    := FieldByName('desc_inf').AsString;
      edtIdent.Text        := FieldByName('iden_inf').AsString;
      spnDiasAviso.Value   := FieldByName('inf_diasaviso').AsFloat;
      edtUnidade.Text      := FieldByName('inf_unidade').AsString;
      edtResolucao.Text    := FieldByName('inf_resolucao').AsString;
      edtCapacidade.Text   := FieldByName('inf_capacidade').AsString;
      edtCaminhoImagem.Text:= FieldByName('inf_imagem').AsString;

      // Falta definir como vai ficar esse campo
      if FieldByName('tipo_inf').AsString <> EmptyStr then begin
         dblTipo.KeyValue:= FieldByName('tipo_inf').AsString;
      end;

      if FieldByName('manu_inf').AsString <> EmptyStr then begin
         dblManutPrev.KeyValue:= FieldByName('manu_inf').AsString;
      end;

      if FieldByName('proc_inf').AsString <> EmptyStr then begin
         dblProcesso.KeyValue:= FieldByName('proc_inf').AsString;
      end;

      if FieldByName('inf_status').AsString <> EmptyStr then begin
         dblStatus.KeyValue:= FieldByName('inf_status').AsString;
      end;

      CarregarImagem();
   end;
end;

procedure TFormCadInfraestrutura.sbArquivoClick(Sender: TObject);
begin
   opd1.Filter:= 'Imagem no formato JPEG (*.jpg)|*.jpg';
   opd1.DefaultExt:='jpg';
   opd1.Execute;
   edtCaminhoImagem.Text:= opd1.FileName;
   dbimg1.Picture.LoadFromFile(edtCaminhoImagem.Text);
end;

procedure TFormCadInfraestrutura.sbVisualizaTreCertificadoClick(
  Sender: TObject);
begin
   AbrirArquivo(cdsInfra.FieldByName('inf_imagem').AsString, Self.Name);
end;

function TFormCadInfraestrutura.ValidarDados(): Boolean;
begin
   if AllTrim(edtDescricao.Text) = EmptyStr then begin
      Application.MessageBox('Campo Descrição é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtDescricao);
      Result:= False;
      Exit;
   end;

   if AllTrim(edtIdent.Text) = EmptyStr then begin
      Application.MessageBox('Campo Identificação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtIdent);
      Result:= False;
      Exit;
   end;

   if dblTipo.KeyValue = -1 then begin
      Application.MessageBox('Campo Tipo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblTipo);
      Result:= False;
      Exit;
   end;

   if dblProcesso.KeyValue = -1 then begin
      Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcesso);
      Result:= False;
      Exit;
   end;

   if dblManutPrev.KeyValue = -1 then begin
      Application.MessageBox('Campo Manutenção Preventiva é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblManutPrev);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadInfraestrutura.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   case rgOrdemImpressao.ItemIndex of
      0: begin
         sCampoOrdem:= 'proc_inf, codi_inf';
      end;
      1: begin
         sCampoOrdem:= 'proc_inf, desc_inf';
      end;
      2: begin
         sCampoOrdem:= 'proc_inf, iden_inf';
      end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT codi_inf, desc_inf, iden_inf, proc_inf, qtde_inf, seto_inf, ' +
                    ' tipo_inf, manu_inf , T.valo_com ' +
                    ' FROM Infraestrutura I ' +
                    ' INNER JOIN tabela_combos T ON tipo_com = 8 and codi_com = tipo_inf' +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_CadInfra.fr3');

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
