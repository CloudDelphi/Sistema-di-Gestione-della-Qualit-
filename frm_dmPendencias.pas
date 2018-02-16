unit frm_dmPendencias;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, FMTBcd, SqlExpr;

type
  TdmPendencias = class(TDataModule)
    zqryCalibracao: TZQuery;
    dspCalibracao: TDataSetProvider;
    cdsCalibracao: TClientDataSet;
    dsCalibracao: TDataSource;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    zqryPMC: TZQuery;
    dspPMC: TDataSetProvider;
    cdsPMC: TClientDataSet;
    dsPMC: TDataSource;
    zqryProcedimentos: TZQuery;
    dspProcedimentos: TDataSetProvider;
    cdsProcedimentos: TClientDataSet;
    dsProcedimentos: TDataSource;
    zqryEficaciaTre: TZQuery;
    dspEficaciaTre: TDataSetProvider;
    cdsEficaciaTre: TClientDataSet;
    dsEficaciaTre: TDataSource;
    zqryManutencao: TZQuery;
    dspManutencao: TDataSetProvider;
    cdsManutencao: TClientDataSet;
    dsManutencao: TDataSource;
    cdsManutencaodatalimite: TDateTimeField;
    cdsManutencaoultimadata: TDateTimeField;
    cdsManutencaoman_codigo: TLargeintField;
    cdsManutencaoiden_inf: TWideMemoField;
    cdsManutencaooque_man: TWideMemoField;
    cdsManutencaoquan_man: TWideMemoField;
    cdsManutencaoperiodicidade: TWideStringField;
    zqryPMCAcoes: TZQuery;
    dspPMCAcoes: TDataSetProvider;
    cdsPMCAcoes: TClientDataSet;
    dsPMCAcoes: TDataSource;
    cdsPMCAcoesnume_pmc: TWideStringField;
    cdsPMCAcoesdesc_aco: TWideMemoField;
    cdsPMCAcoesresponsavelacao: TWideStringField;
    cdsPMCAcoesaco_prazo: TDateTimeField;
    cdsPMCAcoesvimp_aco: TWideMemoField;
    zqryPDCA: TZQuery;
    dspPDCA: TDataSetProvider;
    cdsPDCA: TClientDataSet;
    dsPDCA: TDataSource;
    zqryEducacao: TZQuery;
    dspEducacao: TDataSetProvider;
    cdsEducacao: TClientDataSet;
    dsEducacao: TDataSource;
    zqryExperiencia: TZQuery;
    dspExperiencia: TDataSetProvider;
    cdsExperiencia: TClientDataSet;
    dsExperiencia: TDataSource;
    zqryTreinamentos: TZQuery;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    zqryAnaliseCritica: TZQuery;
    dspAnaliseCritica: TDataSetProvider;
    cdsAnaliseCritica: TClientDataSet;
    dsAnaliseCritica: TDataSource;
    cdsAnaliseCriticacodi_aac: TLargeintField;
    cdsAnaliseCriticacodi_ana: TLargeintField;
    cdsAnaliseCriticapare_aac: TWideStringField;
    cdsAnaliseCriticapraz_aac: TDateTimeField;
    cdsAnaliseCriticaresp_aac: TLargeintField;
    cdsAnaliseCriticasaid_aac: TWideMemoField;
    cdsAnaliseCriticaproc_aac: TLargeintField;
    cdsAnaliseCriticadcad_aac: TDateTimeField;
    cdsAnaliseCriticaaac_resultados: TWideMemoField;
    cdsAnaliseCriticaprocesso: TWideStringField;
    cdsAnaliseCriticaparecer: TWideMemoField;
    cdsPDCApdca_codigo: TIntegerField;
    cdsPDCApdca_identificacao: TWideStringField;
    cdsPDCApdca_data: TDateTimeField;
    cdsPDCApdca_descricao: TWideStringField;
    cdsPDCApdca_origem: TIntegerField;
    cdsPDCApdca_processo: TIntegerField;
    cdsPDCApdca_emitido: TIntegerField;
    cdsPDCAlan_codigo: TIntegerField;
    cdsPDCAlan_oque: TWideMemoField;
    cdsPDCAlan_onde: TWideMemoField;
    cdsPDCAlan_porque: TWideMemoField;
    cdsPDCAlan_quando: TDateTimeField;
    cdsPDCAlan_como: TWideMemoField;
    cdsPDCAlan_quem: TIntegerField;
    cdsPDCAlan_recursos: TWideMemoField;
    cdsPDCAlan_quanto: TFloatField;
    cdsPDCAlan_datarealizada: TDateTimeField;
    cdsPDCAlan_verimplantacao: TWideMemoField;
    cdsPDCAlan_status: TIntegerField;
    cdsPDCAlan_dtprevista: TDateTimeField;
    cdsPDCAlan_dtfinalizado: TDateTimeField;
    cdsPDCAlan_chkobs: TWideMemoField;
    zqryHabilidade: TZQuery;
    dspHabilidade: TDataSetProvider;
    cdsHabilidade: TClientDataSet;
    dsHabilidade: TDataSource;
    zqryHabVencida: TZQuery;
    dspHabVencida: TDataSetProvider;
    cdsHabVencida: TClientDataSet;
    dsHabVencida: TDataSource;
    cdsHabVencidacodi_col: TLargeintField;
    cdsHabVencidanome_col: TWideStringField;
    cdsHabVencidaultimaavaliacao: TWideMemoField;
    zqryPMCsemCausa: TZQuery;
    dspPMCsemCausa: TDataSetProvider;
    cdsPMCsemCausa: TClientDataSet;
    dsPMCsemCausa: TDataSource;
    zqryPMCsemAcaoImediata: TZQuery;
    dspPMCsemAcaoImediata: TDataSetProvider;
    cdsPMCsemAcaoImediata: TClientDataSet;
    dsPMCsemAcaoImediata: TDataSource;
    zqryRNCSemResposta: TZQuery;
    dspRNCSemResposta: TDataSetProvider;
    cdsRNCSemResposta: TClientDataSet;
    dsRNCSemResposta: TDataSource;
    cdsRNCSemRespostarnc_identificacao: TWideStringField;
    cdsRNCSemRespostarnc_nconformidade: TWideMemoField;
    cdsRNCSemRespostastatus: TWideStringField;
    cdsRNCSemRespostarnc_codigo: TIntegerField;
    procedure cdsManutencaoiden_infGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsManutencaooque_manGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPMCAcoesdesc_acoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnaliseCriticasaid_aacGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsAnaliseCriticaparecerGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsPDCAlan_oqueGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsHabVencidaultimaavaliacaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure cdsRNCSemRespostarnc_nconformidadeGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPendencias: TdmPendencias;

implementation

{$R *.dfm}

procedure TdmPendencias.cdsAnaliseCriticaparecerGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAnaliseCritica.FieldByName('parecer').AsString, 1,22);
end;

procedure TdmPendencias.cdsAnaliseCriticasaid_aacGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsAnaliseCritica.FieldByName('said_aac').AsString, 1,50);
end;

procedure TdmPendencias.cdsHabVencidaultimaavaliacaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsHabVencida.FieldByName('ultimaavaliacao').AsString, 1,4);
end;

procedure TdmPendencias.cdsManutencaoiden_infGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsManutencao.FieldByName('iden_inf').AsString, 1,50);
end;

procedure TdmPendencias.cdsManutencaooque_manGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsManutencao.FieldByName('oque_man').AsString, 1,50);
end;

procedure TdmPendencias.cdsPDCAlan_oqueGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   Text:= Copy(cdsPDCA.FieldByName('lan_oque').AsString, 1,50);
end;

procedure TdmPendencias.cdsPMCAcoesdesc_acoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsPMCAcoes.FieldByName('desc_aco').AsString, 1,50);
end;

procedure TdmPendencias.cdsRNCSemRespostarnc_nconformidadeGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text:= Copy(cdsRNCSemResposta.FieldByName('rnc_nconformidade').AsString, 1,200);
end;

end.
