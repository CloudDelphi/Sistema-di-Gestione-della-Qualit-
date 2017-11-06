unit frm_Educacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tt_Educacao = class(TForm)
    Label1: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    bbtnGravar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BbtnNovo: TSpeedButton;
    BbtnImprimir: TSpeedButton;
    edDescricao: TEdit;
    edCodigo: TEdit;
    dbgEducacao: TDBGrid;
    BbtnExcluir: TSpeedButton;
    procedure BbtnExcluirClick(Sender: TObject);
    procedure bbtnGravarClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure dbgEducacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEducacaoCellClick(Column: TColumn);
    procedure dbgEducacaoTitleClick(Column: TColumn);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreencheCampos;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Educacao: Tt_Educacao;
  NovoCodigoEducacao: integer;

implementation

uses frm_dm, frm_Principal, Funcoes, frm_Inicial;

{$R *.dfm}

procedure Tt_Educacao.BbtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then
  begin
//    dm.cdsEducacao.Delete;
//    dm.cdsEducacao.ApplyUpdates(0);
    edCodigo.Clear;
    edDescricao.Clear;
  end;
end;

procedure Tt_Educacao.bbtnGravarClick(Sender: TObject);
begin
   try
      if edDescricao.Text <> '' then
      begin
         if bbtnGravar.Caption = 'Gravar' then begin
           with dm.cdsAuxiliar do
            begin
               Active:= False;
               CommandText:= ' Select max(codi_edu) as codigo from educacao';
               Active:= True;
               if FieldByName('codigo').AsInteger = 0 then
                  NovoCodigoEducacao:= 1
               else
                  NovoCodigoEducacao:= FieldByName('codigo').AsInteger + 1;
            end;
         end;

//         with dm.cdsEducacao do
//         begin
//            Active:= True;
//            if bbtnGravar.Caption = 'Gravar' then
//            begin
//                Insert;
//                FieldByName('codi_edu').AsInteger:= NovoCodigoEducacao;
//            end
//            else
//            begin
//               Edit;
//               bbtnGravar.Caption:= 'Gravar';
//            end;
//            FieldByName('desc_edu').AsString:= edDescricao.Text;
//            Post;
//         end;
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

procedure Tt_Educacao.BbtnNovoClick(Sender: TObject);
begin
  edCodigo.Clear;
  edDescricao.Clear;
  edDescricao.SetFocus;
  bbtnGravar.Caption:= 'Gravar';
end;

procedure Tt_Educacao.dbgEducacaoCellClick(Column: TColumn);
begin
  PreencheCampos;
end;

procedure Tt_Educacao.dbgEducacaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PreencheCampos;
end;

procedure Tt_Educacao.dbgEducacaoTitleClick(Column: TColumn);
var
  cCampo: String;
begin
  cCampo:= Column.FieldName;
//  with dm.cdsEducacao do
//  begin
//    Active:= False;
//    CommandText:= ' Select codi_edu, desc_edu from educacao' +
//                  ' Order By '+ cCampo;
//    Active:= True;
//  end;
  PreencheCampos;
end;

procedure Tt_Educacao.FormPaint(Sender: TObject);
begin
  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Educacao.FormShow(Sender: TObject);
begin
//  with dm.cdsEducacao do
//  begin
//    Active:= False;
//    CommandText:= ' Select codi_edu, desc_edu from educacao' +
//                  ' Order By desc_edu';
//    Active:= True;
//  end;
end;

procedure Tt_Educacao.PreencheCampos;
begin
//  if dm.cdsEducacao.RecordCount > 0 then
//  begin
//    edCodigo.Text   := dm.cdsEducacao.FieldByName('codi_edu').AsString;
//    edDescricao.Text:= dm.cdsEducacao.FieldByName('desc_edu').AsString;
//    bbtnGravar.Caption:= 'Alterar';
//  end;
end;

procedure Tt_Educacao.SpeedButton2Click(Sender: TObject);
begin
  Self.Close;
end;

end.
