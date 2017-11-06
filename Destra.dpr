program Destra;

uses
  Forms,
  SysUtils,
  Dialogs,
  frm_dm in 'frm_dm.pas' {dm: TDataModule},
  Funcoes in 'Funcoes.pas',
  frm_CadEmpresa in 'frm_CadEmpresa.pas' {FormCadEmpresa},
  frm_Tartaruga in 'frm_Tartaruga.pas' {FormTartaruga},
  frmSplash in 'frmSplash.pas' {t_Splash},
  frm_VisualizaPMC in 'frm_VisualizaPMC.pas' {FormVisualizaPMC},
  frm_VisualizaInfra in 'frm_VisualizaInfra.pas' {FormVisualizaInfra},
  frm_VisualizaFormularios in 'frm_VisualizaFormularios.pas' {FormVisualizaFormularios},
  frm_Login in 'frm_Login.pas' {FormLogin},
  frm_VisualizaAnaliseCritica in 'frm_VisualizaAnaliseCritica.pas' {FormVisualizaAnalise},
  frm_VisualizaMatriz in 'frm_VisualizaMatriz.pas' {FormVisualizaMatriz},
  frm_AuditoriaInterna in 'frm_AuditoriaInterna.pas' {FormAuditoriaInterna},
  frm_AuditoriaRelatorio in 'frm_AuditoriaRelatorio.pas' {FormRelatorioAuditoria},
  frm_ValoresIndicador in 'frm_ValoresIndicador.pas' {FormValorIndicadores},
  frm_PlanoAcaoMatriz in 'frm_PlanoAcaoMatriz.pas' {t_PlanoAcaoMatriz},
  frm_pesqPrgAudit in 'frm_pesqPrgAudit.pas' {FormPesqPrgAudit},
  frm_ResumoIndicadores in 'frm_ResumoIndicadores.pas' {FormResumoInd},
  frm_Log in 'frm_Log.pas' {FormLog},
  uAncestral in 'uAncestral.pas' {frmAncestral},
  uAtivaSistema in 'uAtivaSistema.pas' {FormAtivaSistema},
  Validacao in 'Validacao.pas',
  frm_PesqManutencao in 'frm_PesqManutencao.pas' {FormPesqManutencao},
  Enter in '..\..\Lib\Enter.pas',
  frm_cartaAtualizacao in 'frm_cartaAtualizacao.pas' {FormCarta},
  frm_CadAspectosAmb in 'frm_CadAspectosAmb.pas' {FormCadAspectos},
  frm_Laaia in 'frm_Laaia.pas' {FormLaaia},
  frm_MsgErro in 'frm_MsgErro.pas' {FormMsgErro},
  frm_Lira in 'frm_Lira.pas' {FormLira},
  frm_pesqLira in 'frm_pesqLira.pas' {FormPesqLira},
  frm_CadProcessos in 'frm_CadProcessos.pas' {FormCadProcessos},
  frm_DefCadClasse in 'frm_DefCadClasse.pas' {FormCadDefClasse},
  frm_CadHabilidades in 'frm_CadHabilidades.pas' {FormCadHabilidades},
  frm_CadFuncoes in 'frm_CadFuncoes.pas' {FormCadFuncoes},
  frm_CadListaMestra in 'frm_CadListaMestra.pas' {FormCadListaMestra},
  frm_ColabProcedimentos in 'frm_ColabProcedimentos.pas' {FormColabProcedimentos},
  frm_Aprovacao in 'frm_Aprovacao.pas' {FormAprovacao},
  frm_CadRegistros in 'frm_CadRegistros.pas' {FormCadRegistros},
  frm_CadPMCAbre in 'frm_CadPMCAbre.pas' {FormCadPMCAbre},
  frm_CadPMCConsulta in 'frm_CadPMCConsulta.pas' {FormCadPMCConsulta},
  frm_CadPMCFecha in 'frm_CadPMCFecha.pas' {FormCadPMCFecha},
  frm_CadImpactosAmb in 'frm_CadImpactosAmb.pas' {FormCadImpactos},
  frm_CadAnaliseCritica in 'frm_CadAnaliseCritica.pas' {FormCadAnaliseCritica},
  frm_CadIndicadores in 'frm_CadIndicadores.pas' {FormCadIndicadores},
  frm_CadInfraestrutura in 'frm_CadInfraestrutura.pas' {FormCadInfraestrutura},
  frm_CadManutPreventiva in 'frm_CadManutPreventiva.pas' {FormCadManutPreventiva},
  frm_CadFornecedores in 'frm_CadFornecedores.pas' {FormCadFornecedores},
  frm_CadUsuarios in 'frm_CadUsuarios.pas' {FormCadUsuarios},
  frm_CadTipoProduto in 'frm_CadTipoProduto.pas' {FormCadTipoProduto},
  frm_Processos in 'frm_Processos.pas' {FormProcessos},
  frm_CadIQF in 'frm_CadIQF.pas' {FormCadIQF},
  frm_CadCalibracao in 'frm_CadCalibracao.pas' {FormCadCalibracao},
  frm_Sobre in 'frm_Sobre.pas' {FormSobre},
  frm_configEmail in 'frm_configEmail.pas' {FormConfigEmail},
  frm_CadClientes in 'frm_CadClientes.pas' {FormCadClientes},
  AtualizaBanco in 'AtualizaBanco.pas',
  frm_CadColaborador in 'frm_CadColaborador.pas' {FormCadColaboradores},
  frm_VisualizaDocumentos in 'frm_VisualizaDocumentos.pas' {FormVisualizaDocumentos},
  frm_Inicial in 'frm_Inicial.pas' {FormInicial},
  frm_CadRiscoVarExternas in 'frm_CadRiscoVarExternas.pas' {FormCadRiscoVarExternas},
  frm_CadRiscoVarInternas in 'frm_CadRiscoVarInternas.pas' {FormCadRiscoVarInternas},
  frm_CadRiscoAnaliseInterna in 'frm_CadRiscoAnaliseInterna.pas' {FormCadRiscoAnaliseInterna},
  frm_CadRiscoAnaliseRisco in 'frm_CadRiscoAnaliseRisco.pas' {FormAnaliseRisco},
  frm_CadRiscoMacroAmbiente in 'frm_CadRiscoMacroAmbiente.pas' {FormCadRiscoMacroAmbiente},
  frm_CadNotasHabilidade in 'frm_CadNotasHabilidade.pas' {FormCadNotasHabilidade},
  frm_CadColaboradorAval in 'frm_CadColaboradorAval.pas' {FormCadAvaliador},
  frm_CadRiscoGrafico2DTeste in 'frm_CadRiscoGrafico2DTeste.pas' {FormRiscoGrafico2DTeste},
  frm_ValoresIndicadorGrafico in 'frm_ValoresIndicadorGrafico.pas' {FormValoresIndicadoresGrafico},
  frm_AuditoriaAgenda in 'frm_AuditoriaAgenda.pas' {FormAuditoriaAgenda},
  frm_CadModoRecuperacao in 'frm_CadModoRecuperacao.pas' {FormCadModoRecuperacao},
  frm_CadTreinamentos in 'frm_CadTreinamentos.pas' {FormCadTreinamentos},
  frm_DefCadDefeitos in 'frm_DefCadDefeitos.pas' {FormCadDefDefeitos},
  frm_DefCadOrigem in 'frm_DefCadOrigem.pas' {FormCadDefOrigem},
  frm_DefLancamentos in 'frm_DefLancamentos.pas' {FormDefLancamentos},
  frm_CadProdutos in 'frm_CadProdutos.pas' {FormCadProdutos},
  frm_PDCA in 'frm_PDCA.pas' {FormPDCA},
  WebBrowser in 'WebBrowser.pas' {FormWebBrowser},
  frm_CadContexto in 'frm_CadContexto.pas' {FormCadContexto},
  frm_CadPartesInteressadas in 'frm_CadPartesInteressadas.pas' {FormCadPartesInteressadas},
  frm_CadContextoAnalise in 'frm_CadContextoAnalise.pas' {FormContextoAnalise},
  frm_CadParametros in 'frm_CadParametros.pas' {FormCadParametros},
  frm_VisualizaPDCA in 'frm_VisualizaPDCA.pas' {FormVisualizaPDCA},
//  MidasLib,
  frm_CadPMCVinculo in 'frm_CadPMCVinculo.pas' {FormCadPMCVinculo},
  frm_CadRiscoVisualizacao in 'frm_CadRiscoVisualizacao.pas' {FormCadRiscoVisualizacao},
  frm_PrevEficacia in 'frm_PrevEficacia.pas' {FormPrevEficacia},
  frm_AuditoriaInterna2015 in 'frm_AuditoriaInterna2015.pas' {FormAuditoriaInterna2015},
  frm_pesqPrgAudit2015 in 'frm_pesqPrgAudit2015.pas' {FormPesqPrgAudit2015},
  frm_AuditoriaAgenda2015 in 'frm_AuditoriaAgenda2015.pas' {FormAuditoriaAgenda2015},
  frm_AuditoriaRelatorio2015 in 'frm_AuditoriaRelatorio2015.pas' {FormRelatorioAuditoria2015},
  frm_dmPendencias in 'frm_dmPendencias.pas' {dmPendencias: TDataModule},
  frm_Perigos in 'frm_Perigos.pas' {FormPerigos},
  frm_CadDanos in 'frm_CadDanos.pas' {FormCadDanos},
  frm_AlteraSenha in 'frm_AlteraSenha.pas' {FormAlteraSenha},
  frm_CadRNCAbre in 'frm_CadRNCAbre.pas' {FormCadRNCAbre},
  frm_PesqPDCA in 'frm_PesqPDCA.pas' {FormPesqPDCA},
  frm_CadMotivoRNC in 'frm_CadMotivoRNC.pas' {FormCadMotivoRNC},
  frm_CadOrigemRNC in 'frm_CadOrigemRNC.pas' {FormCadOrigemRNC},
  frm_CadRNCFecha in 'frm_CadRNCFecha.pas' {FormCadRNCFecha},
  frm_CadRNCConsulta in 'frm_CadRNCConsulta.pas' {FormCadRNCConsulta},
  frm_CadPlanMudanca in 'frm_CadPlanMudanca.pas' {FormCadPlanMudanca},
  frm_ObsColaborador in 'frm_ObsColaborador.pas' {FormObsColaborador},
  frm_EmailAuto in 'frm_EmailAuto.pas' {FormEmailAuto},
  frm_VisualizaRNC in 'frm_VisualizaRNC.pas' {FormVisualizaRNC},
  frm_PesqTreinamentos in 'frm_PesqTreinamentos.pas' {FormPesqTreinamentos},
  frm_GraficoPMC in 'frm_GraficoPMC.pas' {FormGraficoPMC},
  frm_CadPMCAcoesConsulta in 'frm_CadPMCAcoesConsulta.pas' {FormCadPMCAcoesConsulta},
  frm_CadManutModelo in 'frm_CadManutModelo.pas' {FormCadManutModelo},
  frm_CadManutencao in 'frm_CadManutencao.pas' {FormCadManutencao},
  frmRelatorioGeral in 'frmRelatorioGeral.pas' {FormRelatorioGeral},
  frm_CadCronograma in 'frm_CadCronograma.pas' {FormCadCronograma},
  frm_AuditoriaAuto in 'frm_AuditoriaAuto.pas' {FormAuditoriaAuto};

{$R *.res}
//{$SetPEFlags IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP

// Previne o erro de External exception C0000006
{$SetPEFlags $0C00}

begin
  Application.Initialize;

  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdmPendencias, dmPendencias);
  //  Application.CreateForm(Tt_Login, t_Login);

  T_Splash := TT_Splash.Create(Application);
  T_Splash.Show;

//  T_Splash.Caption:= 'Destra Manager';
//  T_Splash.ProgressBar.Max:= 6;

//  T_Splash.ProgressBar.Position := 1;
  T_Splash.Refresh;
  // Fica exibindo o splash por 1 segundo
  Sleep(1000);

//  Application.CreateForm(Tt_Principal, t_Principal);
//  T_Splash.ProgressBar.Position := 2;
//  T_Splash.Refresh;

  Application.Title := 'Destra Manager';

  //  T_Splash.ProgressBar.Position := 3;
//  T_Splash.Refresh;

//  T_Splash.ProgressBar.Position := 4;
//  T_Splash.Refresh;

//  T_Splash.ProgressBar.Position := 5;
//  T_Splash.Refresh;

//  Sleep(500);

//  T_Splash.ProgressBar.Position := 6;
//  T_Splash.Refresh;
//  T_Splash.Refresh;

//  Application.CreateForm(Tt_Principal, t_Principal);
  Application.CreateForm(TFormInicial, FormInicial);

  Application.Run;
end.
