unit frm_CadRiscoVisualizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadRiscoVisualizacao = class(TForm)
    frxDBDSMacro: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnl1: TPanel;
    btnSair: TBitBtn;
    frxReport1: TfrxReport;
    cdsImprimirmac_codigo: TIntegerField;
    cdsImprimirmac_codfator: TIntegerField;
    cdsImprimirmac_codvariavel: TIntegerField;
    cdsImprimirmac_tipo: TIntegerField;
    cdsImprimirmac_texto: TWideStringField;
    cdsImprimirfator: TWideStringField;
    cdsImprimirvar_descricao: TWideStringField;
    pctMacro: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl1: TLabel;
    lbl16: TLabel;
    lblVariavel: TLabel;
    lbl4: TLabel;
    edtPMC: TEdit;
    mmoTexto: TMemo;
    edtProcesso: TEdit;
    edtFator: TEdit;
    edtVariavel: TEdit;
    lblTipo: TLabel;
    btnPMC: TBitBtn;
    pnlRisco: TPanel;
    btnDesvincular: TBitBtn;
    btnVincular: TBitBtn;
    zqryPMC: TZQuery;
    dspPMC: TDataSetProvider;
    cdsPMC: TClientDataSet;
    dsPMC: TDataSource;
    cdsPMCcodi_pmc: TLargeintField;
    cdsPMCdata_pmc: TDateTimeField;
    cdsPMCnume_pmc: TWideStringField;
    cdsPMCdesctipo: TWideStringField;
    pnlPMCLista: TPanel;
    pnl2: TPanel;
    btnSairPMC: TBitBtn;
    btnSelecionar: TBitBtn;
    dbgPMC: TDBGrid;
    btnVisualizar: TBitBtn;
    pnlPDCALista: TPanel;
    pnl4: TPanel;
    btnSairPDCA: TBitBtn;
    btnSelecionarPDCA: TBitBtn;
    btnVisualizarPDCA: TBitBtn;
    dbgPDCA: TDBGrid;
    zqryPDCA: TZQuery;
    dspPDCA: TDataSetProvider;
    cdsPDCA: TClientDataSet;
    dsPDCA: TDataSource;
    cdsPDCApdca_codigo: TIntegerField;
    cdsPDCApdca_identificacao: TWideStringField;
    cdsPDCApdca_data: TDateTimeField;
    cdsPDCApdca_descricao: TWideStringField;
    cdsPDCApdca_origem: TIntegerField;
    cdsPDCApdca_processo: TIntegerField;
    cdsPDCApdca_emitido: TIntegerField;
    btnPDCA: TBitBtn;
    btnVincularPDCA: TBitBtn;
    btnDesvincularPDCA: TBitBtn;
    lbl2: TLabel;
    edtPDCA: TEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure btnPMCClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDesvincularClick(Sender: TObject);
    procedure btnVincularClick(Sender: TObject);
    procedure btnSairPMCClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnPDCAClick(Sender: TObject);
    procedure btnDesvincularPDCAClick(Sender: TObject);
    procedure btnVincularPDCAClick(Sender: TObject);
    procedure btnSairPDCAClick(Sender: TObject);
    procedure btnVisualizarPDCAClick(Sender: TObject);
    procedure btnSelecionarPDCAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iCodProcesso: Integer;
    iCodigo: Integer;
    sTipoIntExt: string;
    sTipoRisco: string;
  end;

var
  FormCadRiscoVisualizacao: TFormCadRiscoVisualizacao;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_CadPMCAbre, frm_CadPMCFecha,
  frm_CadRiscoAnaliseRisco, frm_PDCA;

{$R *.dfm}

procedure TFormCadRiscoVisualizacao.btnPDCAClick(Sender: TObject);
begin
   // Se for novo PDCA abre a tela de cadastro
   if Acesso(cUsuario, 44, 'acesso') = 1 then begin
      FormPDCA:= TFormPDCA.Create(nil);
      if edtPDCA.Text = '' then begin
         FormPDCA.iTela:= 5; // Gestão de Riscos
      end
      else begin
         FormPDCA.iTela:= 6;
      end;
      FormPDCA.ShowModal;
      FormPDCA.Release;
   end;
end;

procedure TFormCadRiscoVisualizacao.btnDesvincularPDCAClick(Sender: TObject);
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         if sTipoIntExt = 'INTERNA' then begin
            CommandText:= ' UPDATE risco_analiseint SET' +
                          ' int_pdca = ' + QuotedStr('') +
                          ' WHERE int_codigo = ' + IntToStr(iCodigo);
         end
         else begin
            CommandText:= ' UPDATE risco_macro SET' +
                          ' mac_pdca = ' + QuotedStr('') +
                          ' WHERE mac_codigo = ' + IntToStr(iCodigo);
         end;
         Execute;
      end;

      edtPDCA.Clear;
      btnDesvincularPDCA.Enabled:= False;
      btnVincularPDCA.Enabled   := True;
      FormAnaliseRisco.AtualizarDados();
   except
      on E:Exception do begin
         MostrarErro('Erro ao desvincular PMC', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormCadRiscoVisualizacao.btnSairPDCAClick(Sender: TObject);
begin
   pnlPDCALista.Visible:= False;
end;

procedure TFormCadRiscoVisualizacao.btnDesvincularClick(Sender: TObject);
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         if sTipoIntExt = 'INTERNA' then begin
            CommandText:= ' UPDATE risco_analiseint SET' +
                          ' int_pmc = ' + QuotedStr('') +
                          ' WHERE int_codigo = ' + IntToStr(iCodigo);
         end
         else begin
            CommandText:= ' UPDATE risco_macro SET' +
                          ' mac_pmc = ' + QuotedStr('') +
                          ' WHERE mac_codigo = ' + IntToStr(iCodigo);
         end;
         Execute;
      end;

      edtPMC.Clear;
      btnDesvincular.Enabled:= False;
      btnVincular.Enabled   := True;
      FormAnaliseRisco.AtualizarDados();
   except
      on E:Exception do begin
         MostrarErro('Erro ao desvincular PMC', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormCadRiscoVisualizacao.btnSelecionarClick(Sender: TObject);
begin
   try
      edtPMC.Text:= cdsPMC.FieldByName('nume_pmc').AsString;

      if sTipoIntExt = 'INTERNA' then begin
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE risco_analiseint SET' +
                          ' int_pmc = ' + QuotedStr(edtPMC.Text) +
                          ' WHERE int_codigo = ' + IntToStr(iCodigo);
            Execute;
         end;
      end
      else begin
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE risco_macro SET' +
                          ' mac_pmc = ' + QuotedStr(edtPMC.Text) +
                          ' WHERE mac_codigo = ' + IntToStr(iCodigo);
            Execute;
         end;
      end;

      btnDesvincular.Enabled:= True;
      btnVincular.Enabled   := False;
      FormAnaliseRisco.AtualizarDados();
      pnlPMCLista.Visible:= False;
   except
      on E:Exception do begin
         MostrarErro('Erro ao vincular PMC', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormCadRiscoVisualizacao.btnSelecionarPDCAClick(Sender: TObject);
begin
   try
      edtPDCA.Text:= cdsPDCA.FieldByName('pdca_identificacao').AsString;

      if sTipoIntExt = 'INTERNA' then begin
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE risco_analiseint SET' +
                          ' int_pdca = ' + QuotedStr(edtPDCA.Text) +
                          ' WHERE int_codigo = ' + IntToStr(iCodigo);
            Execute;
         end;
      end
      else begin
         with dm.cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE risco_macro SET' +
                          ' mac_pdca = ' + QuotedStr(edtPDCA.Text) +
                          ' WHERE mac_codigo = ' + IntToStr(iCodigo);
            Execute;
         end;
      end;

      btnDesvincularPDCA.Enabled:= True;
      btnVincularPDCA.Enabled   := False;
      FormAnaliseRisco.AtualizarDados();
      pnlPDCALista.Visible:= False;
   except
      on E:Exception do begin
         MostrarErro('Erro ao vincular PDCA', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormCadRiscoVisualizacao.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadRiscoVisualizacao.btnPMCClick(Sender: TObject);
begin
   // Se for novo PMC abre a tela de cadastro
   // senão abre a tela de finalização de PMC
   if edtPMC.Text = '' then begin
      if Acesso(cUsuario, 10, 'acesso') = 1 then begin
         FormCadPMCAbre:= TFormCadPMCAbre.Create(nil);
         FormCadPMCAbre.iTela:= 2; // Gestão de Riscos
         FormCadPMCAbre.ShowModal;
         FormCadPMCAbre.Release;
      end;
   end
   else begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= BuscarCodPMC(edtPMC.Text);
      FormCadPMCFecha.iTela:= 3; // Gestão de Riscos
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end;
end;

procedure TFormCadRiscoVisualizacao.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadRiscoVisualizacao.btnSairPMCClick(Sender: TObject);
begin
   pnlPMCLista.Visible:= False;
end;

procedure TFormCadRiscoVisualizacao.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadRiscoVisualizacao.btnVincularClick(Sender: TObject);
begin
   cdsPMC.Active:= False;
   cdsPMC.Active:= True;

   AbrePanel(pnlPMCLista, Self);
end;

procedure TFormCadRiscoVisualizacao.btnVincularPDCAClick(Sender: TObject);
begin
   cdsPDCA.Active:= False;
   cdsPDCA.Active:= True;

   AbrePanel(pnlPDCALista, Self);
end;

procedure TFormCadRiscoVisualizacao.btnVisualizarClick(Sender: TObject);
begin
   FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
   FormCadPMCFecha.sCodigoPMC:= cdsPMC.FieldByName('codi_pmc').AsString;
   FormCadPMCFecha.iTela:= 4;
   FormCadPMCFecha.ShowModal;
   FormCadPMCFecha.Release;
end;

procedure TFormCadRiscoVisualizacao.btnVisualizarPDCAClick(Sender: TObject);
begin
   if Acesso(cUsuario, 44, 'acesso') = 1 then begin
      FormPDCA:= TFormPDCA.Create(nil);
      FormPDCA.iTela:= 7;
      FormPDCA.ShowModal;
      FormPDCA.Release;
   end;
end;

procedure TFormCadRiscoVisualizacao.FormShow(Sender: TObject);
begin
   ColorirRisco(pnlRisco, FormAnaliseRisco.cdsAnalise.FieldByName('mac_consequencia').AsInteger,
                FormAnaliseRisco.cdsAnalise.FieldByName('mac_probabilidade').AsInteger,
                FormAnaliseRisco.cdsAnalise.FieldByName('mac_tipo').AsInteger);

   btnDesvincular.Enabled:= edtPMC.Text <> '';
   btnVincular.Enabled:= not btnDesvincular.Enabled;

   btnDesvincularPDCA.Enabled:= edtPDCA.Text <> '';
   btnVincularPDCA.Enabled:= not btnDesvincularPDCA.Enabled;
end;

procedure TFormCadRiscoVisualizacao.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sTipo: string;
begin
   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT mac_codigo, mac_codfator, mac_codvariavel, mac_tipo, mac_texto, ' +
                    ' TC.valo_com as Fator, R.var_descricao' +
                    ' FROM risco_macro' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = mac_codfator and TC.tipo_com = 22' +
                    ' INNER JOIN risco_variaveis_ext R ON R.var_codigo = mac_codvariavel' +
                    ' WHERE 1 = 1';
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_risco_macroambiente.fr3');
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
