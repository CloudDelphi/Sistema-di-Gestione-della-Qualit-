unit frm_Acessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, RXCtrls, ComCtrls, Grids,
  DBGrids, FMTBcd, DB, DBClient, Provider, SqlExpr, ImgList, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tt_Acessos = class(TForm)
    lbNomeUsuario: TLabel;
    pnl1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    dspAcessos: TDataSetProvider;
    cdsAcessos: TClientDataSet;
    dsAcessos: TDataSource;
    dbgClassificacoes: TDBGrid;
    cdsAcessosDescFuncao: TStringField;
    ImageList: TImageList;
    sbMarcarTodos: TSpeedButton;
    sbDesmarcarTodos: TSpeedButton;
    zqryAcessos: TZQuery;
    cdsAcessosalteracao: TSmallintField;
    cdsAcessoscadastro: TSmallintField;
    cdsAcessosacesso: TSmallintField;
    cdsAcessosexclusao: TSmallintField;
    cdsAcessosfunc_ace: TLargeintField;
    CdsAcessosusua_ace1: TWideStringField;
    procedure sbDesmarcarTodosClick(Sender: TObject);
    procedure sbMarcarTodosClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsAcessosCalcFields(DataSet: TDataSet);
    procedure dbgClassificacoesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgClassificacoesCellClick(Column: TColumn);
    procedure dbgClassificacoesColEnter(Sender: TObject);
    procedure cdsAcessosAfterPost(DataSet: TDataSet);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Acessos: Tt_Acessos;

implementation

uses Funcoes, frm_dm, frm_Funcoes, frm_Principal, frm_Inicial;

{$R *.dfm}

procedure Tt_Acessos.cdsAcessosAfterPost(DataSet: TDataSet);
begin
   cdsAcessos.ApplyUpdates(0);
end;

procedure Tt_Acessos.cdsAcessosCalcFields(DataSet: TDataSet);
begin
   cdsAcessosDescFuncao.AsString:= BuscaNomeFuncaoSistema(cdsAcessosfunc_ace.AsInteger);
end;

procedure Tt_Acessos.dbgClassificacoesCellClick(Column: TColumn);
begin
   if Column.Field = cdsAcessosCadastro then begin
      cdsAcessos.Edit;
      if cdsAcessosCadastro.AsInteger = 0 then
         cdsAcessosCadastro.AsInteger:= 1
      else
         cdsAcessosCadastro.AsInteger:= 0;   
   end;

   if Column.Field = cdsAcessosAlteracao then begin
      cdsAcessos.Edit;
      if cdsAcessosAlteracao.AsInteger = 0 then
         cdsAcessosAlteracao.AsInteger:= 1
      else
         cdsAcessosAlteracao.AsInteger:= 0;
   end;

   if Column.Field = cdsAcessosExclusao then begin
      cdsAcessos.Edit;
      if cdsAcessosExclusao.AsInteger = 0 then
         cdsAcessosExclusao.AsInteger:= 1
      else
         cdsAcessosExclusao.AsInteger:= 0;
   end;

   if Column.Field = cdsAcessosAcesso then begin
      cdsAcessos.Edit;
      if cdsAcessosAcesso.AsInteger = 0 then
         cdsAcessosAcesso.AsInteger:= 1
      else
         cdsAcessosAcesso.AsInteger:= 0;
   end;

//   Self.Refresh;
end;

procedure Tt_Acessos.dbgClassificacoesColEnter(Sender: TObject);
begin
   if dbgClassificacoes.SelectedField <> cdsAcessosDescFuncao then
      dbgClassificacoes.Options:= dbgClassificacoes.Options - [dgEditing]
   else
      dbgClassificacoes.Options:= dbgClassificacoes.Options + [dgEditing];
end;

procedure Tt_Acessos.dbgClassificacoesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   // Pinta CheckBox Cadastro
   if Column.Field = cdsAcessosCadastro then begin
      dbgClassificacoes.Canvas.FillRect(Rect);
//      ImageList.Draw(dbgClassificacoes.Canvas, Rect.Left+22, Rect.Top+1, 0);

      if cdsAcessosCadastro.AsInteger = 0 then
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

   // Pinta CheckBox Alteração
   if Column.Field = cdsAcessosAlteracao then begin
      dbgClassificacoes.Canvas.FillRect(Rect);

      if cdsAcessosAlteracao.AsInteger = 0 then
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

   // Pinta CheckBox Exclusão
   if Column.Field = cdsAcessosExclusao then begin
      dbgClassificacoes.Canvas.FillRect(Rect);

      if cdsAcessosExclusao.AsInteger = 0 then
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

   // Pinta CheckBox Especial1
   if Column.Field = cdsAcessosAcesso then begin
      dbgClassificacoes.Canvas.FillRect(Rect);

      if cdsAcessosAcesso.AsInteger = 0 then
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,1)
      else
         ImageList.Draw(dbgClassificacoes.Canvas,Rect.Left+22,Rect.Top+1,2);
   end;

end;

procedure Tt_Acessos.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Acessos.FormShow(Sender: TObject);
begin
   with cdsAcessos do begin
      Active:= False;
      CommandText:= ' SELECT * FROM Acessos ' +
                    ' WHERE usua_ace = ' + QuotedStr(AllTrim(lbNomeUsuario.Caption));
      Active:= True;
   end;
end;

procedure Tt_Acessos.sbDesmarcarTodosClick(Sender: TObject);
begin
   with cdsAcessos do begin
      First;
      while not Eof do begin
         Edit;
         cdsAcessosCadastro.AsInteger := 0;
         cdsAcessosAlteracao.AsInteger:= 0;
         cdsAcessosExclusao.AsInteger := 0;
         cdsAcessosAcesso.AsInteger   := 0;
         Next;
      end;
   end;
end;

procedure Tt_Acessos.sbMarcarTodosClick(Sender: TObject);
begin
   with cdsAcessos do begin
      First;
      while not Eof do begin
         Edit;
         cdsAcessosCadastro.AsInteger := 1;
         cdsAcessosAlteracao.AsInteger:= 1;
         cdsAcessosExclusao.AsInteger := 1;
         cdsAcessosAcesso.AsInteger   := 1;
         Next;
      end;
   end;
end;

procedure Tt_Acessos.sbGravarClick(Sender: TObject);
begin
   try
      Auditoria('ACESSOS',lbNomeUsuario.Caption,'A', '');
      if cdsAcessos.State in [dsInsert,dsEdit] then begin
         cdsAcessos.Post;
      end;
      Application.MessageBox('Acessos gravados corretamente !','Informação',MB_OK + MB_ICONINFORMATION);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao gravar os acessos !' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure Tt_Acessos.sbSairClick(Sender: TObject);
begin
   Close;
end;

end.
