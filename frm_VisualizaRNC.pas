unit frm_VisualizaRNC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, FMTBcd, DBClient,
  Provider, DB, SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormVisualizaRNC = class(TForm)
    dbgRNC: TDBGrid;
    Panel1: TPanel;
    lblCodigo: TLabel;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    btnImprimir: TBitBtn;
    zqryRNC: TZQuery;
    dspRNC: TDataSetProvider;
    cdsRNC: TClientDataSet;
    dsRNC: TDataSource;
    grp2: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl1: TLabel;
    btnPMC: TBitBtn;
    lbl2: TLabel;
    rgFiltro: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure dbgRNCDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure AtualizarDados();
    procedure btnPMCClick(Sender: TObject);
    procedure dbgRNCDblClick(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoProcesso: string;
  end;

var
  FormVisualizaRNC: TFormVisualizaRNC;

implementation

uses frm_dm, frm_Tartaruga, Funcoes, frm_Inicial, frm_CadPMCFecha,
  frm_CadPMCAbre, frm_CadRNCFecha;

{$R *.dfm}

procedure TFormVisualizaRNC.AtualizarDados;
begin
   with cdsRNC do begin
      Active:= False;
      CommandText:= ' SELECT rnc_codigo, rnc_identificacao, rnc_data, rnc_emitido, C.nome_col as Emitido, rnc_motivo,' +
                    ' rnc_processo, rnc_setor, rnc_origem, TC.valo_com as Origem, rnc_cliente, rnc_fornecedor,' +
                    ' rnc_consumidor, rnc_nconformidade, rnc_procede, rnc_responsavel,' +
                    ' rnc_departamento, rnc_relacionamento, rnc_representante, rnc_status, TC1.valo_com as Status,' +
                    ' rnc_disposicao, P.nome_pro as Processo' +
                    ' FROM rnc R' +
                    ' INNER JOIN processos P ON P.codi_pro = R.rnc_processo' +
                    ' INNER JOIN colaboradores C ON C.codi_col = rnc_emitido' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 33 AND TC.codi_com = rnc_origem' +
                    ' INNER JOIN tabela_combos TC1 ON TC1.tipo_com = 35 AND TC1.codi_com = rnc_status' +
                    ' WHERE rnc_processo = ' + QuotedStr(Alltrim(sCodigoProcesso)) +
                    ' ORDER BY rnc_data';
      Active:= True;
   end;
end;

procedure TFormVisualizaRNC.btnPMCClick(Sender: TObject);
begin
//   if Acesso(cUsuario, 10, 'acesso') = 1 then begin
//      AbrirForm(TFormCadPMCAbre, FormCadPMCAbre);
//   end;
end;

procedure TFormVisualizaRNC.btnSairClick(Sender: TObject);
begin
   FormTartaruga.VerificaPendencias;
   Self.Close;
end;

procedure TFormVisualizaRNC.btnVisualizarClick(Sender: TObject);
begin
   if cdsRNC.RecordCount = 0 then begin
      Application.MessageBox('Não existem RNC para esse processo', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      FormCadRNCFecha:= TFormCadRNCFecha.Create(nil);
      FormCadRNCFecha.sCodigoRNC:= cdsRNC.FieldByName('rnc_codigo').AsString;
      FormCadRNCFecha.iTela:= 1;
      FormCadRNCFecha.ShowModal;
      FormCadRNCFecha.Release;
      FreeAndNil(FormCadRNCFecha);
   end;
end;

procedure TFormVisualizaRNC.dbgRNCDblClick(Sender: TObject);
begin
   btnVisualizarClick(Self);
end;

procedure TFormVisualizaRNC.dbgRNCDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   case cdsRNC.FieldByName('rnc_status').AsInteger of
      1: begin // Aberto
         dbgRNC.Canvas.Font.Color:= clBlue;
      end;
      2: begin // Respondido
         dbgRNC.Canvas.Font.Color:= clBlack;
      end;
      3: begin // Aceito
         dbgRNC.Canvas.Font.Color:= clGreen;
      end;
      4: begin // Recusado
         dbgRNC.Canvas.Font.Color:= clRed;
      end;
   end;

   dbgRNC.DefaultDrawDataCell(Rect, dbgRNC.columns[datacol].field, State);
end;

procedure TFormVisualizaRNC.FormShow(Sender: TObject);
begin
   AtualizarDados();
end;

procedure TFormVisualizaRNC.rgFiltroClick(Sender: TObject);
var
   sFiltro: string;
begin
   // Chamado TT651 - Criar filtro de pendente de resposta e pendente de aceite/recusa
   case rgFiltro.ItemIndex of
      0: begin
         sFiltro:= '';
      end;
      1: begin // Pendente de Resposta
         sFiltro:= 'rnc_status = 1';
      end;
      2: begin // Pendente de Aceite/Recusa
         sFiltro:= 'rnc_status = 2';
      end;
   end;

   cdsRNC.Filter  := sFiltro;
   cdsRNC.Filtered:= True;
end;

end.
