unit uCadUsuarioProcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  FMTBcd, DBClient, Provider, SqlExpr, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFormUsuProcesso = class(TForm)
    pnl1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    dbgrd1: TDBGrid;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    lbNomeUsuario: TLabel;
    lb3: TLabel;
    dblProcessos: TDBLookupComboBox;
    sbInsereTreinamentos: TSpeedButton;
    sb1: TSpeedButton;
    dspProcUsu: TDataSetProvider;
    cdsProcUsu: TClientDataSet;
    dsProcUsu: TDataSource;
    cdsProcUsuNomeProcesso: TStringField;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    zqryProcessos: TZQuery;
    zqryProcUsu: TZQuery;
    CdsProcUsuusu_nome1: TWideStringField;
    cdsProcUsuusu_proc: TLargeintField;
    zqryAux: TZQuery;
    procedure sb1Click(Sender: TObject);
    procedure cdsProcUsuAfterPost(DataSet: TDataSet);
    procedure sbInsereTreinamentosClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsProcUsuCalcFields(DataSet: TDataSet);
    procedure AtualizaDados();
    procedure sbGravarClick(Sender: TObject);
    procedure LimparCampos;
  private
    { Private declarations }
    sUsuario: string;
  public
    { Public declarations }
  end;

var
  FormUsuProcesso: TFormUsuProcesso;

implementation

uses frm_Principal, frm_dm, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormUsuProcesso.cdsProcUsuAfterPost(DataSet: TDataSet);
begin
   cdsProcUsu.ApplyUpdates(0);
end;

procedure TFormUsuProcesso.cdsProcUsuCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro FROM processos' +
                    ' WHERE codi_pro = ' + QuotedStr(cdsProcUsuusu_proc.AsString);
      Active:= True;

      cdsProcUsuNomeProcesso.AsString:= dm.cdsAuxiliar.FieldByName('nome_pro').AsString;
   end;
end;

procedure TFormUsuProcesso.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure TFormUsuProcesso.FormShow(Sender: TObject);
begin
   cdsProcessos.Active:= True;
   cdsProcUsu.Active  := True;
   sUsuario:= AllTrim(lbNomeUsuario.Caption);
   AtualizaDados();
end;

procedure TFormUsuProcesso.LimparCampos;
begin
   dblProcessos.KeyValue:= -1;
end;

procedure TFormUsuProcesso.sb1Click(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      with cdsAux do begin
         Active:= False;
         CommandText:= ' DELETE FROM usuarios_processos' +
                       ' WHERE usu_nome = ' + QuotedStr(sUsuario) +
                       ' AND usu_proc = ' + cdsProcUsuusu_proc.AsString;
         Execute;
      end;
      AtualizaDados;
   end;
end;

procedure TFormUsuProcesso.sbGravarClick(Sender: TObject);
begin
//   with dm.cdsAux do begin
//      Active:= False;
//      CommandText:= ' SELECT count(*) as Total FROM usuarios_processos' +
//                    ' WHERE usu_proc = ' + IntToStr(dblProcessos.KeyValue) +
//                    ' AND usu_nome = ' + QuotedStr(AllTrim(lbNomeUsuario.Caption));
//      Active:= True;
//   end;
//
//   if dm.cdsAux.FieldByName('Total').AsInteger > 0 then begin
//      Application.MessageBox('Processo já gravado para este usuário', 'Aviso',MB_OK + MB_ICONWARNING);
//   end
//   else begin
//      with cdsProcUsu do begin
//         Append;
//         cdsProcUsuusu_nome.AsString:= AllTrim(lbNomeUsuario.Caption);
//         cdsProcUsuusu_proc.AsString:= IntToStr(dblProcessos.KeyValue);
//         cdsProcUsu.Post;
//         cdsProcUsu.ApplyUpdates(0);
//      end;
//
//      AtualizaDados();
//   end;

end;

procedure TFormUsuProcesso.sbInsereTreinamentosClick(Sender: TObject);
begin
   if sbInsereTreinamentos.Caption = 'INSERIR' then begin
      // Verifica se já existe o treinamento para o colaborador
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) qtd FROM Usuarios_processos' +
                       ' WHERE usu_nome = ' + QuotedStr(sUsuario) +
                       '       AND usu_proc = ' + IntToStr(dblProcessos.KeyValue);
         Active:= True;
      end;

      if dm.cdsAuxiliar.FieldByName('qtd').AsInteger > 0 then begin
         Application.MessageBox('Este processo já foi cadastrado para esse usuário.','Aviso', MB_OK + MB_ICONWARNING);
         dblProcessos.SetFocus;
      end
      else begin
         with cdsProcUsu do begin
            Active:= True;
            Append;
            FieldByName('usu_nome').AsString := sUsuario;
            FieldByName('usu_proc').AsString  := dblProcessos.KeyValue;
            Post;
         end;
      end;
   end
   else begin
      with cdsProcUsu do begin
         FieldByName('usu_nome').AsString:= sUsuario;
         FieldByName('usu_proc').AsString := dblProcessos.KeyValue;
         Post;
      end;
   end;
   LimparCampos;
   sbInsereTreinamentos.Caption:= 'INSERIR';
end;

procedure TFormUsuProcesso.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormUsuProcesso.AtualizaDados();
begin
   with cdsProcUsu do begin
      Active:= False;
      CommandText:= ' SELECT * FROM usuarios_processos' +
                    ' WHERE usu_nome = ' + QuotedStr(AllTrim(lbNomeUsuario.Caption));
      Active:= True;
   end;
end;

end.
