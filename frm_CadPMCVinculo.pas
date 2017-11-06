unit frm_CadPMCVinculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Grids, DBGrids, StdCtrls, ComCtrls, JvgPage,
  Buttons, ExtCtrls, DBCtrls;

type
  TFormCadPMCVinculo = class(TForm)
    frxDBDSMacro: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    pnl1: TPanel;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    frxReport1: TfrxReport;
    cdsImprimirmac_codigo: TIntegerField;
    cdsImprimirmac_codfator: TIntegerField;
    cdsImprimirmac_codvariavel: TIntegerField;
    cdsImprimirmac_tipo: TIntegerField;
    cdsImprimirmac_texto: TWideStringField;
    cdsImprimirfator: TWideStringField;
    cdsImprimirvar_descricao: TWideStringField;
    btnRisco: TBitBtn;
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
    pnlFiltro: TPanel;
    dbgPMC: TDBGrid;
    rgFiltro: TRadioGroup;
    cdsPMCpmc_codrisco: TIntegerField;
    pnlTipoRisco: TPanel;
    pnl8: TPanel;
    btnSairImp: TBitBtn;
    pnl10: TPanel;
    sbInterna: TSpeedButton;
    sb1: TSpeedButton;
    cdsPMCpmc_tiporisco: TIntegerField;
    cdsPMCtiporisco: TWideStringField;
    grp1: TGroupBox;
    lbl1: TLabel;
    edtPesqPMC: TEdit;
    btnPMC: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure btnRiscoClick(Sender: TObject);
    procedure btnDesvincularClick(Sender: TObject);
    procedure btnVincularClick(Sender: TObject);
    procedure AtualizarDados();
    procedure FormShow(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure sbInternaClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure sb1Click(Sender: TObject);
    procedure edtPesqPMCChange(Sender: TObject);
    procedure dbgPMCCellClick(Column: TColumn);
    procedure Botoes();
    procedure dbgPMCKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPMCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iCodProcesso: Integer;
    iCodigo: Integer;
    sTipoIntExt: string;
    sTipoRisco: string;
    sCodigoRisco: string;
  end;

var
  FormCadPMCVinculo: TFormCadPMCVinculo;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_CadPMCAbre, frm_CadPMCFecha,
  frm_CadRiscoAnaliseRisco, frm_CadRiscoAnaliseInterna,
  frm_CadRiscoMacroAmbiente;

{$R *.dfm}

procedure TFormCadPMCVinculo.AtualizarDados;
var
   sWhere: string;
begin
   case rgFiltro.ItemIndex of
      0: begin
         sWhere:= '';
      end;
      1: begin
         sWhere:= ' WHERE pmc_codrisco is not null';
      end;
      2: begin
         sWhere:= ' WHERE pmc_codrisco is null'
      end;
   end;

   with cdsPMC do begin
      Active:= False;
      CommandText:= ' SELECT codi_pmc, data_pmc, nume_pmc, pmc_codrisco, pmc_tiporisco, ' +
                    ' TC.valo_com as DescTipo, TC1.valo_com as TipoRisco' +
                    ' FROM pmc' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 4 AND TC.codi_com = tipo_pmc ' +
                    ' LEFT JOIN tabela_combos TC1 ON TC1.tipo_com = 29 AND TC1.codi_com = pmc_tiporisco' +
                    sWhere +
                    ' ORDER BY nume_pmc DESC';
      Active:= True;
   end;
end;

procedure TFormCadPMCVinculo.Botoes;
begin
   if cdsPMC.FieldByName('pmc_codrisco').AsString = EmptyStr then begin
      btnRisco.Enabled      := True;
      btnVincular.Enabled   := True;
      btnDesvincular.Enabled:= False;
   end
   else begin
      btnRisco.Enabled      := False;
      btnVincular.Enabled   := False;
      btnDesvincular.Enabled:= True;
   end;
end;

procedure TFormCadPMCVinculo.btnDesvincularClick(Sender: TObject);
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' UPDATE pmc SET' +
                       ' pmc_codrisco = null, ' +
                       ' pmc_tiporisco = null ' +
                       ' WHERE codi_pmc = ' + cdsPMC.FieldByName('codi_pmc').AsString;
         Execute;
      end;

      btnDesvincular.Enabled:= False;
      btnVincular.Enabled   := True;
      btnRisco.Enabled      := True;
      AtualizarDados();
   except
      on E:Exception do begin
         MostrarErro('Erro ao desvincular Risco', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormCadPMCVinculo.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadPMCVinculo.btnPMCClick(Sender: TObject);
begin
   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
      FormCadPMCFecha.sCodigoPMC:= QuotedStr(cdsPMC.FieldByName('codi_pmc').AsString);
      FormCadPMCFecha.iTela:= 4; // Vínculo de PMC
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end;
end;

procedure TFormCadPMCVinculo.btnRiscoClick(Sender: TObject);
begin
//   iBotao:= 1;
//    Abre o cadastro de Análise de Riscos Interno ou Externo
   if cdsPMC.FieldByName('pmc_codrisco').AsString = '' then begin
      AbrePanel(pnlTipoRisco, Self);
   end
   else begin
      FormCadPMCFecha:= TFormCadPMCFecha.Create(nil);
//      FormCadPMCFecha.sCodigoPMC:= QuotedStr(edtPMC.Text);
      FormCadPMCFecha.iTela:= 3; // Gestão de Riscos
      FormCadPMCFecha.ShowModal;
      FormCadPMCFecha.Release;
      FormCadPMCFecha.Free;
      FormCadPMCFecha:= nil;
   end;
end;

procedure TFormCadPMCVinculo.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadPMCVinculo.btnSairImpClick(Sender: TObject);
begin
   pnlTipoRisco.Visible:= False;
end;

procedure TFormCadPMCVinculo.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadPMCVinculo.btnVincularClick(Sender: TObject);
begin
   if AcessoTartaruga('risco') then begin
      FormAnaliseRisco:= TFormAnaliseRisco.Create(nil);
      FormAnaliseRisco.iTela:= 3;
      FormAnaliseRisco.ShowModal;
      FormAnaliseRisco.Release;
   end;

   if sCodigoRisco <> '' then begin
      if Copy(sTipoRisco,1,1)  = 'E' then begin
         sTipoRisco:= '2';
      end
      else begin
         sTipoRisco:= '1';
      end;

      with dm.cdsGravar do begin
         Active:= False;
         CommandText:= ' UPDATE pmc SET ' +
                       ' pmc_codrisco = ' + sCodigoRisco + ',' +
                       ' pmc_tiporisco = ' + sTipoRisco +
                       ' WHERE codi_pmc = ' + cdsPMC.FieldByName('codi_pmc').AsString;
         Execute;
      end;

      AtualizarDados();
   end;

end;

procedure TFormCadPMCVinculo.dbgPMCCellClick(Column: TColumn);
begin
   Botoes();
end;

procedure TFormCadPMCVinculo.dbgPMCKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Botoes();
end;

procedure TFormCadPMCVinculo.edtPesqPMCChange(Sender: TObject);
begin
   cdsPMC.Locate('nume_pmc',edtPesqPMC.Text, [loPartialKey]);
end;

procedure TFormCadPMCVinculo.FormShow(Sender: TObject);
begin
   rgFiltro.ItemIndex:= 0; // Todos
   AtualizarDados();
   Botoes();
end;

procedure TFormCadPMCVinculo.Impressao(tipoImp: string);
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

procedure TFormCadPMCVinculo.rgFiltroClick(Sender: TObject);
begin
   AtualizarDados();
end;

procedure TFormCadPMCVinculo.sb1Click(Sender: TObject);
begin
   if Acesso(cUsuario, 37, 'acesso') = 1 then begin
      FormCadRiscoMacroAmbiente:= TFormCadRiscoMacroAmbiente.Create(nil);
      FormCadRiscoMacroAmbiente.iTela     := 1; // Vínculo de PMC/Risco
      FormCadRiscoMacroAmbiente.sCodigoPMC:= cdsPMC.FieldByName('codi_pmc').AsString; // Código do PMC
      FormCadRiscoMacroAmbiente.ShowModal;
      FormCadRiscoMacroAmbiente.Release;

      pnlTipoRisco.Visible:= False;
   end;
end;

procedure TFormCadPMCVinculo.sbInternaClick(Sender: TObject);
begin
   if Acesso(cUsuario, 38, 'acesso') = 1 then begin
      FormCadRiscoAnaliseInterna:= TFormCadRiscoAnaliseInterna.Create(nil);
      FormCadRiscoAnaliseInterna.iTela     := 1; // Vínculo de PMC/Risco
      FormCadRiscoAnaliseInterna.sCodigoPMC:= cdsPMC.FieldByName('codi_pmc').AsString; // Código do PMC
      FormCadRiscoAnaliseInterna.ShowModal;
      FormCadRiscoAnaliseInterna.Release;

      pnlTipoRisco.Visible:= False;
   end;
end;

end.
