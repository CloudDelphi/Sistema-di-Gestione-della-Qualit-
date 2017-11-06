unit frm_Classificacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  Tt_Classificacoes = class(TForm)
    Label1: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    bbtnGravar: TSpeedButton;
    BbtnSair: TSpeedButton;
    edDescricao: TEdit;
    edCodigo: TEdit;
    dbgClassificacoes: TDBGrid;
    BbtnNovo: TSpeedButton;
    BbtnImprimir: TSpeedButton;
    BbtnExcluir: TSpeedButton;
    procedure BbtnExcluirClick(Sender: TObject);
    procedure dbgClassificacoesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgClassificacoesTitleClick(Column: TColumn);
    procedure BbtnNovoClick(Sender: TObject);
    procedure dbgClassificacoesCellClick(Column: TColumn);
    procedure bbtnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BbtnSairClick(Sender: TObject);
    procedure PreencheCampos;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Classificacoes: Tt_Classificacoes;

implementation

uses frm_dm, DBClient, DB, frm_Principal, frm_Inicial, Funcoes;

{$R *.dfm}

procedure Tt_Classificacoes.BbtnExcluirClick(Sender: TObject);
begin
if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
    dm.cdsClassificacoes.Delete;
    dm.cdsClassificacoes.ApplyUpdates(0);
    edCodigo.Clear;
    edDescricao.Clear;
  end;
end;

procedure Tt_Classificacoes.bbtnGravarClick(Sender: TObject);
var
  NovoCodigoClassificacao: integer;
begin
  if bbtnGravar.Caption = 'Gravar' then
  begin
    try
      if edDescricao.Text <> '' then
      begin
        with dm.cdsAuxiliar do
        begin
          Active:= False;
          CommandText:= ' Select max(codi_cla) as codigo from classificacoes';
          Active:= True;
          if RecordCount = 0 then
            NovoCodigoClassificacao:= 1
          else
            NovoCodigoClassificacao:= FieldByName('codigo').AsInteger + 1;
        end;

        with dm.cdsClassificacoes do
        begin
          Active:= True;
          Insert;
          FieldByName('codi_cla').AsInteger:= NovoCodigoClassificacao;
          FieldByName('desc_cla').AsString:= edDescricao.Text;
          Post;
        end;
        edCodigo.Clear;
        edDescricao.Clear;
      end
      else
      begin
        Application.MessageBox('Campo "Descrição" vazio','Aviso',MB_OK+MB_ICONWARNING);
      end;
      dm.cdsAuxiliar.Active:= False;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      TryFocus(edDescricao);
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
        with dm.cdsClassificacoes do
        begin
          Active:= True;
          Edit;
          FieldByName('desc_cla').AsString:= edDescricao.Text;
          Post;
        end;
        edCodigo.Clear;
        edDescricao.Clear;
        bbtnGravar.Caption:= 'Gravar';
      end
      else
      begin
        Application.MessageBox('Campo "Descrição" vazio','Aviso',MB_OK+MB_ICONWARNING);
      end;
      dm.cdsAuxiliar.Active:= False;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      edDescricao.SetFocus;
    except
      edDescricao.SetFocus;
      Application.MessageBox('Não foi possível realizar a alteração','Erro',MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure Tt_Classificacoes.dbgClassificacoesCellClick(Column: TColumn);
begin
  PreencheCampos;
end;

procedure Tt_Classificacoes.dbgClassificacoesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  PreencheCampos;
end;

procedure Tt_Classificacoes.dbgClassificacoesTitleClick(Column: TColumn);
var
  cCampo: String;
begin
  cCampo:= Column.FieldName;
  with dm.cdsClassificacoes do
  begin
    Active:= False;
    CommandText:= ' Select codi_cla, desc_cla from classificacoes' +
                  ' Order By '+ cCampo;
    Active:= True;
  end;
  PreencheCampos;
end;

procedure Tt_Classificacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(t_Classificacoes);
end;

procedure Tt_Classificacoes.FormPaint(Sender: TObject);
begin
  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Classificacoes.FormShow(Sender: TObject);
begin
  with dm.cdsClassificacoes do
  begin
    Active:= False;
    CommandText:= ' Select codi_cla, desc_cla from classificacoes' +
                  ' Order By desc_cla';
    Active:= True;
  end;
end;

procedure Tt_Classificacoes.PreencheCampos;
begin
  if dm.cdsClassificacoes.RecordCount > 0 then
  begin
    edCodigo.Text   := dm.cdsClassificacoes.FieldByName('codi_cla').AsString;
    edDescricao.Text:= dm.cdsClassificacoes.FieldByName('desc_cla').AsString;
    bbtnGravar.Caption:= 'Alterar';
  end;
end;

procedure Tt_Classificacoes.BbtnNovoClick(Sender: TObject);
begin
  edCodigo.Clear;
  edDescricao.Clear;
  edDescricao.SetFocus;
  bbtnGravar.Caption:= 'Gravar';
end;

procedure Tt_Classificacoes.BbtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
