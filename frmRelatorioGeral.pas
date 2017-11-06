unit frmRelatorioGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormRelatorioGeral = class(TForm)
    pnl8: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImprimir: TBitBtn;
    rgOrdemImpressao: TRadioGroup;
    frxReport1: TfrxReport;
    zqryManutencao: TZQuery;
    dspManutencao: TDataSetProvider;
    cdsManutencao: TClientDataSet;
    dsManutencao: TDataSource;
    frxDBRelManutencao: TfrxDBDataset;
    cdsManutencaoman_codigo: TIntegerField;
    cdsManutencaoman_modelo: TIntegerField;
    cdsManutencaoman_processo: TIntegerField;
    cdsManutencaoman_datainicio: TDateTimeField;
    cdsManutencaoman_datafim: TDateTimeField;
    cdsManutencaoman_horainicio: TWideStringField;
    cdsManutencaoman_horafim: TWideStringField;
    cdsManutencaoman_equipamento: TIntegerField;
    cdsManutencaonome_pro: TWideStringField;
    cdsManutencaodesc_inf: TWideStringField;
    cdsManutencaoman_identificacao: TWideStringField;
    cdsManutencaotipomanut: TWideStringField;
    rgOpcoes: TRadioGroup;
    procedure btnSairImpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure ImpressaoManut(sTipoImp: string);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTitulo: string;
    iCodRel: Integer;
  end;

var
  FormRelatorioGeral: TFormRelatorioGeral;

implementation

uses
   Funcoes;

{$R *.dfm}

procedure TFormRelatorioGeral.btnImprimirClick(Sender: TObject);
begin
   case iCodRel of
      1: begin // Relatório de Manutenção Preventiva
         ImpressaoManut('I');
      end;
   end;
end;

procedure TFormRelatorioGeral.btnSairImpClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormRelatorioGeral.btnVideoClick(Sender: TObject);
begin
   case iCodRel of
      1: begin // Relatório de Manutenção Preventiva
         ImpressaoManut('V');
      end;
   end;
end;

procedure TFormRelatorioGeral.FormShow(Sender: TObject);
begin
   case iCodRel of
      1: begin // Relatório de Manutenção Preventiva
         rgOrdemImpressao.Columns:= 2;
         rgOrdemImpressao.Items.Add('Data Manutenção');
         rgOrdemImpressao.Items.Add('Equipamento');

         rgOpcoes.Visible:= True;
         rgOpcoes.Caption:= 'Tipo de Manutenção';
         rgOpcoes.Columns:= 2;
         rgOpcoes.Items.Add('Programada');
         rgOpcoes.Items.Add('Realizada');
         rgOpcoes.ItemIndex:= 0;

         Self.Height:= 250;
         Self.Width := 370;
         Self.Caption:= sTitulo;
         rgOrdemImpressao.ItemIndex:= 0;
      end;
   end;
end;

procedure TFormRelatorioGeral.ImpressaoManut(sTipoImp: string);
var
   sCampoOrdem: string;
   sWhere     : string;
begin
   case rgOrdemImpressao.ItemIndex of
      0: sCampoOrdem:= 'man_datainicio';
      1: sCampoOrdem:= 'desc_inf';
   end;

   case rgOpcoes.ItemIndex of
      0: sWhere:= ' WHERE man_tipo = 1'; // Programada
      1: sWhere:= ' WHERE man_tipo = 2'; // Realizada
   end;

   with cdsManutencao do begin
      Active:= False;
      CommandText:= ' SELECT M.man_codigo, M.man_modelo, M.man_processo, M.man_datainicio, M.man_datafim,' +
                    '        M.man_horainicio, M.man_horafim, M.man_equipamento, P.nome_pro,' +
                    '        I.desc_inf, MM.man_identificacao, TC.valo_com as TipoManut' +
                    ' FROM manut M' +
                    ' INNER JOIN processos P ON P.codi_pro = M.man_processo' +
                    ' INNER JOIN infraestrutura I ON I.codi_inf = M.man_equipamento' +
                    ' INNER JOIN manut_modelo MM ON MM.man_codigo = M.man_modelo' +
                    ' INNER JOIN tabela_combos TC ON TC.tipo_com = 36 AND TC.codi_com = M.man_tipo' +
                    sWhere +
                    ' ORDER BY P.nome_pro,' + sCampoOrdem;
      Active:= True;
   end;

   if cdsManutencao.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Imprimir('rel_ManutencaoGeral', frxReport1, sTipoImp);
end;

end.
