unit frm_Setores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tt_Setores = class(TForm)
    Label1: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    bbtnGravar: TSpeedButton;
    BbtnSair: TSpeedButton;
    BbtnNovo: TSpeedButton;
    BbtnImprimir: TSpeedButton;
    edDescricao: TEdit;
    edCodigo: TEdit;
    dbgSetores: TDBGrid;
    BbtnExcluir: TSpeedButton;
    procedure BbtnExcluirClick(Sender: TObject);
    procedure dbgSetoresTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgSetoresKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgSetoresCellClick(Column: TColumn);
    procedure bbtnGravarClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure BbtnSairClick(Sender: TObject);
    procedure PreencheCampos;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Setores: Tt_Setores;

implementation

uses frm_dm, frm_Principal, frm_Inicial;

{$R *.dfm}

procedure Tt_Setores.BbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
//    dm.cdsSetores.Delete;
//    dm.cdsSetores.ApplyUpdates(0);
    edCodigo.Clear;
    edDescricao.Clear;
  end;
end;

procedure Tt_Setores.bbtnGravarClick(Sender: TObject);
var
  NovoCodigoSetor: integer;
begin
  if bbtnGravar.Caption = 'Gravar' then
  begin
    try
      if edDescricao.Text <> '' then
      begin
        with dm.cdsAuxiliar do
        begin
          Active:= False;
          CommandText:= ' Select max(codi_set) as codigo from setores';
          Active:= True;
          if RecordCount = 0 then
            NovoCodigoSetor:= 1
          else
            NovoCodigoSetor:= FieldByName('codigo').AsInteger + 1;
        end;

//        with dm.cdsSetores do
//        begin
//          Active:= True;
//          Insert;
//          FieldByName('codi_set').AsInteger:= NovoCodigoSetor;
//          FieldByName('desc_set').AsString:= edDescricao.Text;
//          Post;
//        end;
        edCodigo.Clear;
        edDescricao.Clear;
      end
      else
      begin
        Application.MessageBox('Campo "Setor" vazio','Aviso',MB_OK+MB_ICONWARNING);
      end;
      dm.cdsAuxiliar.Active:= False;
      edDescricao.SetFocus;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
    except
      edDescricao.SetFocus;
      Application.MessageBox('Não foi possível realizar a gravação','Erro',MB_OK+MB_ICONERROR);
    end; // try
  end// if caption
  else
  begin
    try
      if edDescricao.Text <> '' then
      begin
//        with dm.cdsSetores do
//        begin
//          Active:= True;
//          Edit;
//          FieldByName('desc_set').AsString:= edDescricao.Text;
//          Post;
//        end;
        edCodigo.Clear;
        edDescricao.Clear;
        bbtnGravar.Caption:= 'Gravar';
      end
      else
      begin
        Application.MessageBox('Campo "Setor" vazio','Aviso',MB_OK+MB_ICONWARNING);
      end;
      dm.cdsAuxiliar.Active:= False;
      edDescricao.SetFocus;
    except
      edDescricao.SetFocus;
      Application.MessageBox('Não foi possível realizar a alteração','Erro',MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure Tt_Setores.BbtnNovoClick(Sender: TObject);
begin
  edCodigo.Clear;
  edDescricao.Clear;
  edDescricao.SetFocus;
  bbtnGravar.Caption:= 'Gravar';
end;

procedure Tt_Setores.BbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tt_Setores.dbgSetoresCellClick(Column: TColumn);
begin
  PreencheCampos;
end;

procedure Tt_Setores.dbgSetoresKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PreencheCampos;
end;

procedure Tt_Setores.dbgSetoresTitleClick(Column: TColumn);
var
  cCampo: String;
begin
  cCampo:= Column.FieldName;
//  with dm.cdsSetores do
//  begin
//    Active:= False;
//    CommandText:= ' Select codi_set, desc_set from setores' +
//                  ' Order By '+ cCampo;
//    Active:= True;
//  end;
  PreencheCampos;
end;

procedure Tt_Setores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(t_Setores);
end;

procedure Tt_Setores.FormPaint(Sender: TObject);
begin
  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Setores.FormShow(Sender: TObject);
begin
//  with dm.cdsSetores do
//  begin
//    Active:= False;
//    CommandText:= ' Select codi_set, desc_set from setores' +
//                  ' Order By desc_set';
//    Active:= True;
//  end;
end;

procedure Tt_Setores.PreencheCampos;
begin
//  if dm.cdsSetores.RecordCount > 0 then
//  begin
//    edCodigo.Text   := dm.cdsSetores.FieldByName('codi_set').AsString;
//    edDescricao.Text:= dm.cdsSetores.FieldByName('desc_set').AsString;
//    bbtnGravar.Caption:= 'Alterar';
//  end;
end;

end.
