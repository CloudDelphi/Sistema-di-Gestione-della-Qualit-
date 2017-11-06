unit frm_CadProcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  Tt_Tartaruga = class(TForm)
    Fundo: TImage;
    pnProcesso: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    lblMatriz: TLabel;
    lblInfra: TLabel;
    lblProcedimento: TLabel;
    lblPadroes: TLabel;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    BbtnImprimir: TSpeedButton;
    lblNomeProcesso: TLabel;
    lblGestor: TLabel;
    lblCodigo: TLabel;
    mEntradas: TMemo;
    mSaidas: TMemo;
    mRequisitos: TMemo;
    sbProcedimentosOnOff: TSpeedButton;
    lblCargo: TLabel;
    sbProcedimentos: TSpeedButton;
    sbRegistros: TSpeedButton;
    sbAcaoCorretiva: TSpeedButton;
    sbAnalise: TSpeedButton;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sbInfraestrutura: TSpeedButton;
    sbManutencao: TSpeedButton;
    sbIndicador: TSpeedButton;
    sbMatriz: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure bbtnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure dbgProcedimentosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbProcedimentosClick(Sender: TObject);
    procedure mEntradasClick(Sender: TObject);
    procedure mSaidasClick(Sender: TObject);
    procedure mRequisitosClick(Sender: TObject);
    procedure sbInfraestruturaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Tartaruga: Tt_Tartaruga;

implementation

uses frm_dm, DBClient, DB, frm_CadInfra, frm_VisualizaDocumentos, frm_Principal;

{$R *.dfm}

procedure Tt_Tartaruga.bbtnGravarClick(Sender: TObject);
begin
//  if bbtnGravar.Caption = 'Gravar' then
//  begin
//    try
//      if ValidaCampos then
//      begin
//        with dm.cdsTartaruga do
//        begin
//          Active:= False;
//          CommandText:= ' SELECT * FROM processos' +
//                        ' WHERE codi_pro = ' + '''' + lblCodigo.Caption + '''';
//          Active:= True;
//          Edit;
//          FieldByName('entr_pro').AsString:= mEntradas.Text;
//          FieldByName('said_pro').AsString:= mSaidas.Text;
//          FieldByName('requ_pro').AsString:= mRequisitos.Text;
//          Post;
//        end;
//        Application.MessageBox('Gravação efetuada com sucesso !','Aviso',MB_OK+MB_ICONINFORMATION);
//      end
//      else
//      begin
//        Application.MessageBox('Campo "Descrição" vazio','Aviso',MB_OK+MB_ICONWARNING);
//      end;
//      dm.cdsAuxiliar.Active:= False;
//    except
//      Application.MessageBox('Não foi possível realizar a gravação','Erro',MB_OK+MB_ICONERROR);
//    end; // try
//  end;// if ValidaCampos
end;

procedure Tt_Tartaruga.dbgProcedimentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ContProcedimentos > 0 then
    sbProcedimentos.Enabled:= True;
end;

procedure Tt_Tartaruga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(t_Tartaruga);
end;

procedure Tt_Tartaruga.FormShow(Sender: TObject);
var
  CodCargo: string;
begin
  ContProcedimentos:= 0;
  lblNomeProcesso.Caption:= t_Principal.cNomeProcesso;

  with dm.cdsTartaruga do
  begin
    Active:= False;
    CommandText:= ' SELECT * FROM processos' +
                  ' WHERE nome_pro = '+ '''' + t_Principal.cNomeProcesso + '''';
    Active:= True;
                                           //    lblNomeProcesso.Caption
    lblCodigo.Caption:= FieldByName('codi_pro').AsString;

    with dm.cdsAuxiliar do
    begin
      Active:= False;
      CommandText:= ' SELECT nome_col, func_col FROM colaboradores ' +
                    ' WHERE codi_col = ' + '''' + dm.cdsTartaruga.FieldByName('gest_pro').AsString + '''';
      Active:= True;

      lblGestor.Caption:= FieldByName('nome_col').AsString;
      CodCargo         := FieldByName('func_col').AsString;

      Active:= False;
      CommandText:= ' SELECT desc_fun FROM funcoes ' +
                    ' WHERE codi_fun = ' + '''' + CodCargo + '''';
      Active:= True;

      lblCargo.Caption := FieldByName('desc_fun').AsString;
    end;
    mEntradas.Text  := FieldByName('entr_pro').AsString;
    mSaidas.Text    := FieldByName('said_pro').AsString;
    mRequisitos.Text:= FieldByName('requ_pro').AsString;
  end;

  // Labels do centro
//  lblCodigo.Width:= 184;
//  lblCodigo.Left:= 1;
  lblGestor.Width:= 184;
  lblGestor.Left:= 1;
  lblCargo.Width:= 184;
  lblCargo.Left:= 1;
  lblNomeProcesso.Width:= 184;
  lblNomeProcesso.Left:= 1;

  // Títulos das caixas externas
  lblPadroes.Width:= 385;
  lblPadroes.Left:= 1;
  lblInfra.Width:= 385;
  lblInfra.Left:= 1;
  lblMatriz.Width:= 385;
  lblMatriz.Left:= 1;
  lblProcedimento.Width:= 385;
  lblProcedimento.Left:= 1;

  // Verfica pendências de Procedimentos
  with dm.cdsProcedimentos do
  begin
    Active:= False;
    CommandText:= ' select apro_lis, arqu_lis, atua_lis, '+
                  ' codi_lis, data_lis, desc_lis, dtap_lis,' +
                  ' iden_lis, proc_lis, quem_lis, resp_lis,' +
                  ' revi_lis, tipo_lis from lista_mestra ' +
                  ' where proc_lis = ' + '''' + lblCodigo.Caption + '''' +
                  ' and apro_lis = ' + '''' + 'N' + '''';
    Active:= True;

    if RecordCount > 0 then
      ContProcedimentos:= ContProcedimentos + 1;
  end;

  if ContProcedimentos > 0 then
    sbProcedimentosOnOff.Enabled:= True
  else
    sbProcedimentosOnOff.Enabled:= False;

  Panel5.SetFocus;
end;

procedure Tt_Tartaruga.mEntradasClick(Sender: TObject);
begin
  Panel5.SetFocus;
end;

procedure Tt_Tartaruga.mRequisitosClick(Sender: TObject);
begin
  Panel5.SetFocus;
end;

procedure Tt_Tartaruga.mSaidasClick(Sender: TObject);
begin
  Panel5.SetFocus;
end;

procedure Tt_Tartaruga.SpeedButton2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tt_Tartaruga.sbInfraestruturaClick(Sender: TObject);
begin
  if not assigned(t_Infra) then
    Application.CreateForm(Tt_Infra, t_Infra);
  t_Infra.edCodProcesso.Text:= lblCodigo.Caption;
  t_Infra.edNomeProcesso.Text:= lblNomeProcesso.Caption;
  t_Infra.Show;
end;

procedure Tt_Tartaruga.sbProcedimentosClick(Sender: TObject);
begin
  if not assigned(t_VisualizaDocumentos) then
    Application.CreateForm(Tt_VisualizaDocumentos, t_VisualizaDocumentos);
  t_VisualizaDocumentos.lblCodigo.Caption:= lblCodigo.Caption;  
  t_VisualizaDocumentos.ShowModal;
end;

function Tt_Tartaruga.ValidaCampos: Boolean;
begin
  Result:= True;
end;

end.
