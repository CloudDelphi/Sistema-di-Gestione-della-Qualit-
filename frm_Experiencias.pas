unit frm_Experiencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tt_Experiencias = class(TForm)
    Label1: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    bbtnGravar: TSpeedButton;
    sbSair: TSpeedButton;
    BbtnNovo: TSpeedButton;
    BbtnImprimir: TSpeedButton;
    edDescricao: TEdit;
    edCodigo: TEdit;
    dbgExperiencias: TDBGrid;
    BbtnExcluir: TSpeedButton;
    procedure BbtnExcluirClick(Sender: TObject);
    procedure dbgExperienciasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgExperienciasCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure dbgExperienciasTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGravarClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure PreencheCampos;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Experiencias: Tt_Experiencias;
  NovoCodigoExperiencia: integer;

implementation

uses frm_dm, frm_Principal, frm_Inicial;

{$R *.dfm}

procedure Tt_Experiencias.BbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    dm.cdsExperiencias.Delete;
    dm.cdsExperiencias.ApplyUpdates(0);
    edCodigo.Clear;
    edDescricao.Clear;
  end;
end;

procedure Tt_Experiencias.bbtnGravarClick(Sender: TObject);
begin
  try
    if edDescricao.Text <> '' then
    begin
      if bbtnGravar.Caption = 'Gravar' then
      begin
        with dm.cdsAuxiliar do
        begin
          Active:= False;
          CommandText:= ' Select max(codi_exp) as codigo from experiencia';
          Active:= True;
          if RecordCount = 0 then
            NovoCodigoExperiencia:= 1
          else
            NovoCodigoExperiencia:= FieldByName('codigo').AsInteger + 1;
        end;
      end;

      with dm.cdsExperiencias do
      begin
        Active:= True;
        if bbtnGravar.Caption = 'Gravar' then
        begin
          Insert;
          FieldByName('codi_exp').AsInteger:= NovoCodigoExperiencia;
        end
        else
        begin
          Edit;
          bbtnGravar.Caption:= 'Gravar';
        end;
        FieldByName('desc_exp').AsString:= edDescricao.Text;
        Post;
      end;
      edCodigo.Clear;
      edDescricao.Clear;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      Application.MessageBox('Campo "Descrição" vazio','Aviso',MB_OK+MB_ICONWARNING);
    end;
    dm.cdsAuxiliar.Active:= False;
    edDescricao.SetFocus;
  except
    edDescricao.SetFocus;
    Application.MessageBox('Não foi possível realizar a gravação','Erro',MB_OK+MB_ICONERROR);
  end; // try
end;

procedure Tt_Experiencias.BbtnNovoClick(Sender: TObject);
begin
  edCodigo.Clear;
  edDescricao.Clear;
  edDescricao.SetFocus;
  bbtnGravar.Caption:= 'Gravar';
end;

procedure Tt_Experiencias.dbgExperienciasCellClick(Column: TColumn);
begin
  PreencheCampos;
end;

procedure Tt_Experiencias.dbgExperienciasKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PreencheCampos;
end;

procedure Tt_Experiencias.dbgExperienciasTitleClick(Column: TColumn);
var
  cCampo: String;
begin
  cCampo:= Column.FieldName;
  with dm.cdsExperiencias do
  begin
    Active:= False;
    CommandText:= ' Select codi_exp, desc_exp from experiencia' +
                  ' Order By '+ cCampo;
    Active:= True;
  end;
  PreencheCampos;
end;

procedure Tt_Experiencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(t_Experiencias);
end;

procedure Tt_Experiencias.FormPaint(Sender: TObject);
begin
  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Experiencias.FormShow(Sender: TObject);
begin
  with dm.cdsExperiencias do
  begin
    Active:= False;
    CommandText:= ' Select codi_exp, desc_exp from experiencia' +
                  ' Order By desc_exp';
    Active:= True;
  end;
end;

procedure Tt_Experiencias.PreencheCampos;
begin
  if dm.cdsExperiencias.RecordCount > 0 then
  begin
    edCodigo.Text   := dm.cdsExperiencias.FieldByName('codi_exp').AsString;
    edDescricao.Text:= dm.cdsExperiencias.FieldByName('desc_exp').AsString;
    bbtnGravar.Caption:= 'Alterar';
  end;
end;

procedure Tt_Experiencias.sbSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
