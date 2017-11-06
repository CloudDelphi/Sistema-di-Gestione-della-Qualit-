unit frm_CadAnaliseCritica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin;

type
  TFormCadAnaliseCritica = class(TForm)
    pctAnalise: TJvgPageControl;
    tsAcoes: TTabSheet;
    pnl1: TPanel;
    btnGravar: TBitBtn;
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
    zqryEntradas: TZQuery;
    dspEntradas: TDataSetProvider;
    cdsEntradas: TClientDataSet;
    dsEntradas: TDataSource;
    frxReport1: TfrxReport;
    frxDBAnaliseCritica: TfrxDBDataset;
    tsCadastro: TTabSheet;
    zqryProcessos: TZQuery;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    cdsProcessoscodi_pro: TLargeintField;
    cdsProcessosnome_pro: TWideStringField;
    dsProcessos: TDataSource;
    mmoEntrada: TMemo;
    lbl4: TLabel;
    dbgAcoesPMC: TDBGrid;
    dtCadastro: TDateEdit;
    lbl10: TLabel;
    mmoSaidas: TMemo;
    lbl18: TLabel;
    lbl19: TLabel;
    dtPrazoAcao: TDateEdit;
    lbl20: TLabel;
    dblResponsavelAcao: TDBLookupComboBox;
    lbl21: TLabel;
    mmoResultados: TMemo;
    zqryAcoes: TZQuery;
    dspAcoes: TDataSetProvider;
    cdsAcoes: TClientDataSet;
    dsAcoes: TDataSource;
    zqryResponsavelAcao: TZQuery;
    dspResponsavelAcao: TDataSetProvider;
    cdsResponsavelAcao: TClientDataSet;
    LargeintField4: TLargeintField;
    WideStringField4: TWideStringField;
    dsResponsavelAcao: TDataSource;
    btnNovo: TBitBtn;
    btnExcluir: TBitBtn;
    mmoEntradaAcao: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    dblProcessos: TDBLookupComboBox;
    dbgEntradas: TDBGrid;
    rgParecer: TRadioGroup;
    cdsEntradasEntrada: TStringField;
    cdsAcoesNomeResp: TStringField;
    cdsAcoesDescProcesso: TStringField;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    lbllb1: TLabel;
    dblProcessosImp: TDBLookupComboBox;
    lbl5: TLabel;
    dblResponsavelImp: TDBLookupComboBox;
    lbl6: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    lbl3: TLabel;
    chkResponsavel: TCheckBox;
    chkProcessos: TCheckBox;
    rgParecerImp: TRadioGroup;
    cdsImprimirNomeResp: TStringField;
    chkData: TCheckBox;
    zqryRespImp: TZQuery;
    dspRespImp: TDataSetProvider;
    cdsRespImp: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsRespImp: TDataSource;
    zqryProcessosImp: TZQuery;
    dspProcessosImp: TDataSetProvider;
    cdsProcessosImp: TClientDataSet;
    LargeintField2: TLargeintField;
    WideStringField2: TWideStringField;
    dsProcessosImp: TDataSource;
    cdsEntradascodi_ana: TLargeintField;
    cdsEntradasentr_ana: TWideMemoField;
    cdsEntradasresu_ana: TWideMemoField;
    cdsAcoescodi_aac: TLargeintField;
    cdsAcoescodi_ana: TLargeintField;
    cdsAcoespare_aac: TWideStringField;
    cdsAcoespraz_aac: TDateTimeField;
    cdsAcoesresp_aac: TLargeintField;
    cdsAcoessaid_aac: TWideMemoField;
    cdsAcoesproc_aac: TLargeintField;
    cdsAcoesdcad_aac: TDateTimeField;
    cdsAcoesaac_resultados: TWideMemoField;
    cdsImprimircodi_ana: TLargeintField;
    cdsImprimirentr_ana: TWideMemoField;
    cdsImprimirresu_ana: TWideMemoField;
    cdsImprimircodi_aac: TLargeintField;
    cdsImprimirpare_aac: TWideStringField;
    cdsImprimirpraz_aac: TDateTimeField;
    cdsImprimirproc_aac: TLargeintField;
    cdsImprimirresp_aac: TLargeintField;
    cdsImprimirsaid_aac: TWideMemoField;
    cdsImprimirdcad_aac: TDateTimeField;
    cdsImprimirresultados: TWideMemoField;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgAcoesPMCKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgAcoesPMCCellClick(Column: TColumn);
    procedure ControlarAbas;
    procedure pctAnaliseChange(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure mmoEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizarAcoes();
    procedure tsAcoesShow(Sender: TObject);
    procedure BuscarNovoCodigoAcao();
    procedure btnNovoClick(Sender: TObject);
    procedure LimparCampos();
    procedure mmoSaidasKeyPress(Sender: TObject; var Key: Char);
    procedure mmoResultadosKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgEntradasCellClick(Column: TColumn);
    procedure cdsEntradasCalcFields(DataSet: TDataSet);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure chkProcessosClick(Sender: TObject);
    procedure chkResponsavelClick(Sender: TObject);
    procedure chkDataClick(Sender: TObject);
    procedure dbgEntradasDblClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
    sNovoCodigoAcao: string;
  public
    { Public declarations }
    sCodigoPMC: string;
    iTela: Integer;
    iCodigoAcao: Integer;
    iCodigoEntrada: Integer;
  end;

var
  FormCadAnaliseCritica: TFormCadAnaliseCritica;

implementation

uses frm_dm, frm_Inicial, Funcoes, frm_Tartaruga,
  frm_CadPMCConsulta;

{$R *.dfm}

procedure TFormCadAnaliseCritica.AtualizarAcoes;
var
   sCodiAcao: string;
begin
   mmoEntradaAcao.Text:= mmoEntrada.Text;

   if cOperacao = 'I' then begin
      sCodiAcao:= sNovoCodigoAcao;
   end
   else begin
      sCodiAcao:= cdsAcoescodi_aac.AsString;
   end;

   with cdsAcoes do begin
      Active:= False;
      CommandText:= ' SELECT codi_aac, codi_ana, pare_aac, praz_aac, resp_aac, said_aac, proc_aac, dcad_aac, aac_resultados' +
                    ' FROM analise_acoes ' +
                    ' WHERE codi_ana = ' + QuotedStr(cdsEntradascodi_ana.AsString);
      Active:= True;

      btnAlterar.Enabled:= not (RecordCount = 0);
      btnExcluir.Enabled:= not (RecordCount = 0);
   end;

   if Alltrim(sCodiAcao) <> EmptyStr then begin
      cdsAcoes.Locate('codi_aac', sCodiAcao, []);
   end;
end;

procedure TFormCadAnaliseCritica.AtualizarDados;
var
   sCodEntrada: string;
begin
   with cdsRespImp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsProcessosImp do begin
      Active:= False;
      Active:= True;
   end;

   with cdsResponsavelAcao do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   with cdsProcessos do begin
      Active:= False;
      Active:= True;
   end;

   sCodEntrada:= cdsEntradascodi_ana.AsString;

   with cdsEntradas do begin
      Active:= False;
      Active:= True;
   end;

   if AllTrim(sCodEntrada) <> EmptyStr then begin
      cdsEntradas.Locate('codi_ana', sCodEntrada,[])
   end;
end;

procedure TFormCadAnaliseCritica.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsEntradas.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadAnaliseCritica.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 12, 'alteracao') = 1) then begin // Ações da Análise Crítica
      cOperacao:= 'A';
      HabilitarCampos(True, False);
      Botoes(False);

      if pctAnalise.TabIndex = 0 then begin
         TryFocus(mmoEntrada);
      end
      else begin
         TryFocus(dblProcessos);
      end;
   end;
end;

procedure TFormCadAnaliseCritica.btnCancelarClick(Sender: TObject);
begin
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False);
end;

procedure TFormCadAnaliseCritica.btnExcluirClick(Sender: TObject);
var
   sEntrada: string;
begin
   if (Acesso(cUsuario, 12, 'exclusao') = 1) then begin
      if pctAnalise.TabIndex = 0 then begin
         if not (cdsEntradas.FieldByName('codi_ana').AsInteger in [1..20]) then begin
            if Application.MessageBox(PChar('Confirma exclusão da Análise Crítica ?' + #13 +
                               'Será excluída a Análise Crítica e suas ações'),'Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then begin
               sEntrada:= cdsEntradasentr_ana.AsString;
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' DELETE FROM analise_acoes' +
                                ' WHERE codi_ana = ' + QuotedStr(cdsEntradascodi_ana.AsString);
                  Execute;

                  Active:= False;
                  CommandText:= ' DELETE FROM analise' +
                                ' WHERE codi_ana = ' + QuotedStr(cdsEntradascodi_ana.AsString);
                  Execute;
               end;

               LimparCampos();
               AtualizarDados();

               Auditoria('ENTRADA ANÁLISE CRÍTICA', sEntrada, 'E', '');
            end;
         end
         else begin
            Application.MessageBox('Este entrada não pode ser excluída por ser padrão do sistema.', 'Aviso', MB_OK + MB_ICONWARNING);
         end;
      end
      else begin
         if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM analise_acoes' +
                             ' WHERE codi_aac = ' + cdsAcoescodi_aac.AsString +
                             ' and codi_ana = ' + QuotedStr(cdsEntradascodi_ana.AsString);
               Execute;
            end;

            AtualizarAcoes();
         end;
      end;
   end;
end;

procedure TFormCadAnaliseCritica.btnGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
   sParecer: string;
begin
   if pctAnalise.TabIndex = 0 then begin // Entradas
      if cOperacao = 'I' then begin
         try
            if ValidarDados() then begin
               with dm.cdsAuxiliar do begin
                  Active:= False;
                  CommandText:= ' SELECT MAX(codi_ana) NovoCodigo FROM analise';
                  Active:= True;
                  if IsEmpty then begin
                     iNovoCodigo:= 1
                  end
                  else begin
                     iNovoCodigo:= FieldByName('NovoCodigo').AsInteger + 1;
                  end;
               end;

               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO analise ' +
                                ' (codi_ana, entr_ana)' +
                                ' VALUES(' +
                                IntToStr(iNovoCodigo) + ',' +
                                QuotedStr(mmoEntrada.Text) +
                                ')';
                  Execute;
               end;

               Botoes(True);
               LimparCampos();
               HabilitarCampos(False, False);
               AtualizarDados();

               Application.MessageBox('Entrada incluída corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
            end;
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
            end;
         end; // try
      end
      else begin
         try
            if ValidarDados() then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE analise SET' +
                                ' entr_ana = ' + QuotedStr(mmoEntrada.Text) +
                                ' WHERE codi_ana = ' + cdsEntradascodi_ana.AsString;
                  Execute;
               end;

               Botoes(True);
               LimparCampos();
               HabilitarCampos(False, False);
               AtualizarDados();
            end;
            Application.MessageBox('Entrada alterada corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Não foi possível realizar a alteração' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
            end;
         end;
      end;

      Auditoria('ENTRADA ANÁLISE CRÍTICA', mmoEntrada.Text, cOperacao, '');
   end
   else begin // Ações da Análise Crítica
      if cOperacao = 'I' then begin
         try
            if ValidarDados() then begin
               with dm.cdsAuxiliar do begin
                  Active:= False;
                  CommandText:= ' SELECT MAX(codi_aac) NovoCodigo FROM analise_acoes';
                  Active:= True;
                  if IsEmpty then begin
                     iNovoCodigo:= 1
                  end
                  else begin
                     iNovoCodigo:= FieldByName('NovoCodigo').AsInteger + 1;
                  end;
               end;

               case rgParecer.ItemIndex of
                  0: sParecer:= 'S';
                  1: sParecer:= 'SP';
                  2: sParecer:= 'NS';
               end;

               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO analise_acoes ' +
                                ' (codi_aac, codi_ana, pare_aac, praz_aac, resp_aac, said_aac, ' +
                                ' proc_aac, dcad_aac, aac_resultados)' +
                                ' VALUES(' +
                                IntToStr(iNovoCodigo) + ',' +
                                cdsEntradascodi_ana.AsString + ',' +
                                QuotedStr(sParecer) + ',' +
                                ArrumaDataSQL(dtPrazoAcao.Date) + ',' +
                                IntToStr(dblResponsavelAcao.KeyValue) + ',' +
                                QuotedStr(mmoSaidas.Text) + ',' +
                                IntToStr(dblProcessos.KeyValue) + ',' +
                                ArrumaDataSQL(dtCadastro.Date) + ',' +
                                QuotedStr(mmoResultados.Text) +
                                ')';
                  Execute;
               end;

               Botoes(True);
               LimparCampos();
               HabilitarCampos(False, False);
               AtualizarAcoes();
            end;
            Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
            end;
         end; // try
      end// if caption
      else begin
         try
            if ValidarDados() then begin
               with cdsGravar do begin
                  case rgParecer.ItemIndex of
                     0: sParecer:= 'S';
                     1: sParecer:= 'SP';
                     2: sParecer:= 'NS';
                  end;

                  Active:= False;
                  CommandText:= ' UPDATE analise_acoes SET' +
                                ' said_aac = ' + QuotedStr(mmoSaidas.Text) + ',' +
                                ' pare_aac = ' + QuotedStr(sParecer) + ',' +
                                ' praz_aac = ' + ArrumaDataSQL(dtPrazoAcao.Date) + ',' +
                                ' resp_aac = ' + IntToStr(dblResponsavelAcao.KeyValue) + ',' +
                                ' proc_aac = ' + IntToStr(dblProcessos.KeyValue) + ',' +
                                ' dcad_aac = ' + ArrumaDataSQL(DtCadastro.Date) + ',' +
                                ' aac_resultados = ' + QuotedStr(mmoResultados.Text) +
                                ' WHERE codi_aac = ' + cdsAcoescodi_aac.AsString;
                  Execute;
               end;

               Botoes(True);
               LimparCampos();
               HabilitarCampos(False, False);
               AtualizarAcoes();
            end;
            Application.MessageBox('Ação alterada corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Não foi possível realizar a alteração' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
            end;
         end;
      end;

      Auditoria('AÇÕES ANÁLISE CRÍTICA', mmoSaidas.Text, cOperacao, '');
   end;
end;

procedure TFormCadAnaliseCritica.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadAnaliseCritica.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 20;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;

   chkProcessos.Checked  := True;
   chkResponsavel.Checked:= True;
   chkData.Checked       := True;
end;

procedure TFormCadAnaliseCritica.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 12, 'cadastro') = 1) then begin // Ações da Análise Crítica
      cOperacao:= 'I';
      LimparCampos;
      HabilitarCampos(True, True);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;

      if pctAnalise.TabIndex = 0 then begin
         TryFocus(mmoEntrada);
      end
      else begin
         BuscarNovoCodigoAcao();
         dtCadastro.Date:= Date();
         rgParecer.ItemIndex:= 2; // NS
         TryFocus(dblProcessos);
      end;
   end;
end;

procedure TFormCadAnaliseCritica.btnPrimeiroClick(Sender: TObject);
begin
   cdsEntradas.First;
   AtualizarAcoes();
   PreencherCampos();
end;

procedure TFormCadAnaliseCritica.btnAnteriorClick(Sender: TObject);
begin
   cdsEntradas.Prior;
   AtualizarAcoes();
   PreencherCampos();
end;

procedure TFormCadAnaliseCritica.btnProximoClick(Sender: TObject);
begin
   cdsEntradas.Next;
   AtualizarAcoes();
   PreencherCampos();
end;

procedure TFormCadAnaliseCritica.btnUltimoClick(Sender: TObject);
begin
   cdsEntradas.Last;
   AtualizarAcoes();
   PreencherCampos();
end;

procedure TFormCadAnaliseCritica.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadAnaliseCritica.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadAnaliseCritica.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadAnaliseCritica.BuscarNovoCodigoAcao;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_aco) as codigo FROM pmc_acoes';
      Active:= True;
      if RecordCount = 0 then begin
         sNovoCodigoAcao:= '1'
      end
      else begin
         sNovoCodigoAcao:= IntToStr(FieldByName('codigo').AsInteger + 1);
      end;
   end;
end;

procedure TFormCadAnaliseCritica.cdsEntradasCalcFields(DataSet: TDataSet);
begin
   cdsEntradasEntrada.AsString:= Copy(cdsEntradasentr_ana.AsString,1,80);
end;

procedure TFormCadAnaliseCritica.chkDataClick(Sender: TObject);
begin
   dtInicial.Enabled:= not chkData.Checked;
   dtFinal.Enabled:= not chkData.Checked;
end;

procedure TFormCadAnaliseCritica.chkProcessosClick(Sender: TObject);
begin
   dblProcessosImp.Enabled:= not chkProcessos.Checked;
end;

procedure TFormCadAnaliseCritica.chkResponsavelClick(Sender: TObject);
begin
   dblResponsavelImp.Enabled:= not chkResponsavel.Checked;
end;

procedure TFormCadAnaliseCritica.ControlarAbas;
begin
   if pctAnalise.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      btnImprimir.Visible:= True;
      PreencherCampos();
      AtualizarAcoes();
   end
   else begin // Ações
      if (Acesso(cUsuario, 12, 'acesso') = 1) then begin
         btnImprimir.Visible:= False;
         Botoes(True);

         AtualizarAcoes();
      end
      else begin
         pctAnalise.TabIndex:= 0
      end;
   end;
end;

procedure TFormCadAnaliseCritica.dbgAcoesPMCCellClick(Column: TColumn);
begin
   PreencherCampos;
end;

procedure TFormCadAnaliseCritica.dbgAcoesPMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadAnaliseCritica.dbgEntradasCellClick(Column: TColumn);
begin
   AtualizarAcoes();
   PreencherCampos();
end;

procedure TFormCadAnaliseCritica.dbgEntradasDblClick(Sender: TObject);
begin
   AtualizarAcoes();
   PreencherCampos();
   pctAnalise.TabIndex:= 1;
end;

procedure TFormCadAnaliseCritica.FormShow(Sender: TObject);
begin
   AtualizarDados();
   Botoes(True);
   HabilitarCampos(False, False);
   pnlImprimir.Visible:= False;

   if iTela = 1 then begin // Tartaruga
      cdsEntradas.Locate('codi_ana', iCodigoEntrada, []);
      AtualizarAcoes();
      cdsAcoes.Locate('codi_aac', iCodigoAcao, []);
      pctAnalise.TabIndex:= 1;
      ControlarAbas();
   end
   else begin
      pctAnalise.TabIndex:= 0;
   end;

   PreencherCampos;
end;

procedure TFormCadAnaliseCritica.HabilitarCampos(Flag, Codigo: Boolean);
begin
   case pctAnalise.TabIndex of
      0: begin
         mmoEntrada.Enabled:= Flag;

         pctAnalise.Pages[1].TabVisible:= not Flag;
      end;
      1: begin
         dblProcessos.Enabled      := Flag;
         dblResponsavelAcao.Enabled:= Flag;
         dtPrazoAcao.Enabled       := Flag;
         dtCadastro.Enabled        := Flag;
         rgParecer.Enabled         := Flag;
         mmoSaidas.Enabled         := Flag;
         mmoResultados.Enabled     := Flag;
      end;
   end;
end;

procedure TFormCadAnaliseCritica.mmoSaidasKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadAnaliseCritica.mmoEntradaKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadAnaliseCritica.mmoResultadosKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadAnaliseCritica.pctAnaliseChange(Sender: TObject);
begin
   ControlarAbas;
end;

procedure TFormCadAnaliseCritica.PreencherCampos;
begin
   if pctAnalise.TabIndex = 0 then begin
      with cdsEntradas do begin
         mmoEntrada.Text:= FieldByName('entr_ana').AsString;

      end;
   end
   else begin
      mmoEntradaAcao.Text:= cdsEntradas.FieldByName('entr_ana').AsString;

      with cdsAcoes do begin
         dtCadastro.Date    := FieldByName('dcad_aac').AsDateTime;
         dtPrazoAcao.Date   := FieldByName('praz_aac').AsDateTime;
         mmoSaidas.Text     := FieldByName('said_aac').AsString;
         mmoResultados.Text := FieldByName('aac_resultados').AsString;

         rgParecer.ItemIndex:= -1;
         if FieldByName('pare_aac').AsString = 'S' then begin
            rgParecer.ItemIndex:= 0;
         end;
         if FieldByName('pare_aac').AsString = 'SP' then begin
            rgParecer.ItemIndex:= 1;
         end;
         if FieldByName('pare_aac').AsString = 'NS' then begin
            rgParecer.ItemIndex:= 2;
         end;

         dblProcessos.KeyValue:= -1;
         if FieldByName('proc_aac').AsString <> EmptyStr then begin
            dblProcessos.KeyValue:= FieldByName('proc_aac').AsString;
         end;

         dblResponsavelAcao.KeyValue:= -1;
         if FieldByName('resp_aac').AsString <> EmptyStr then begin
            dblResponsavelAcao.KeyValue:= FieldByName('resp_aac').AsString;
         end;
      end;
   end;
end;

procedure TFormCadAnaliseCritica.tsAcoesShow(Sender: TObject);
begin
   HabilitarCampos(False, False);
end;

function TFormCadAnaliseCritica.ValidarDados(): Boolean;
begin
   if pctAnalise.TabIndex = 0 then begin
      if AllTrim(mmoEntrada.Text) = EmptyStr then begin
         Application.MessageBox('Campo Entrada é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(mmoEntrada);
         Result:= False;
         Exit;
      end;

      Result:= True;
   end
   else begin
      if dblProcessos.KeyValue = -1 then begin
         Application.MessageBox('Campo Processo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblProcessos);
         Result:= False;
         Exit;
      end;

      if dblResponsavelAcao.KeyValue = -1 then begin
         Application.MessageBox('Campo Responsável pela Ação é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblResponsavelAcao);
         Result:= False;
         Exit;
      end;

      if AllTrim(dtPrazoAcao.Text) = EmptyStr then begin
         Application.MessageBox('Campo Prazo é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(dblResponsavelAcao);
         Result:= False;
         Exit;
      end;

      Result:= True;
   end;
end;

procedure TFormCadAnaliseCritica.Impressao(tipoImp: string);
var
   sParecer: string;
begin
   if (dblProcessosImp.KeyValue = Null) and (chkProcessos.Checked = False) then begin
      Application.MessageBox('Selecione um processo ou marque TODOS !', 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
   end;
   if (dblResponsavelImp.KeyValue = Null) and (chkResponsavel.Checked = False) then begin
      Application.MessageBox('Selecione um responsável ou marque TODOS !', 'Informação', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   case rgParecerImp.ItemIndex of
      0: sParecer:= 'Like ' + QuotedStr('%S%');
      1: sParecer:= '= ' + QuotedStr('S');
      2: sParecer:= '= ' + QuotedStr('SP');
      3: sParecer:= '= ' + QuotedStr('NS');
   end;

   with cdsEntradas do begin
      Active:= False;
      Active:= True;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT A.codi_ana, A.entr_ana, A.resu_ana, C.aac_resultados as Resultados,' +
                    ' C.codi_aac, C.pare_aac, C.praz_aac, C.proc_aac, C.resp_aac, C.said_aac,' +
                    ' C.dcad_aac' +
                    ' from analise A' +
                    ' INNER JOIN  analise_acoes C ON A.codi_ana = C.codi_ana' +
                    ' WHERE C.pare_aac ' + sParecer;
      if chkProcessos.Checked = False then begin
         CommandText:= CommandText + ' AND C.proc_aac = ' + IntToStr(dblProcessosImp.KeyValue);
      end;
      if chkResponsavel.Checked = False then begin
         CommandText:= CommandText + ' AND C.resp_aac = ' + IntToStr(dblResponsavelImp.KeyValue);
      end;
      if chkData.Checked = False then begin
         CommandText:= CommandText + ' AND C.dcad_aac BETWEEN ' + ArrumaDataSQL(dtInicial.Date) +
                                     ' AND ' + ArrumaDataSQL(dtFinal.Date);
      end;

      CommandText:= CommandText + ' ORDER BY A.entr_ana';
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_AnaliseCritica.fr3');

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

   Auditoria('ANÁLISE CRÍTICA',dm.cdsPMCnume_pmc.AsString,'R', '');
end;

procedure TFormCadAnaliseCritica.LimparCampos;
begin
   if pctAnalise.TabIndex = 0 then begin
      mmoEntrada.Clear;
   end
   else begin
      dblProcessos.KeyValue:= -1;
      dblResponsavelAcao.KeyValue:= -1;
      dtPrazoAcao.Clear;
      dtCadastro.Clear;
      mmoSaidas.Clear;
      mmoResultados.Clear;
   end;
end;

end.
