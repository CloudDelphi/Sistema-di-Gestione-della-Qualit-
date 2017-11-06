unit frm_HistProfissional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Mask;

type
  Tt_HistProf = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    edNomeColaborador: TEdit;
    dbgHistProf: TDBGrid;
    edEmpresa: TEdit;
    edDe: TMaskEdit;
    edAte: TMaskEdit;
    Label2: TLabel;
    edFuncao: TEdit;
    edCodColaborador: TEdit;
    procedure sbGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgHistProfCellClick(Column: TColumn);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure LimparCampos;
    procedure PreencherCampos;
    function VerificaDados: Boolean;
    procedure FormPaint(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_HistProf: Tt_HistProf;
  NovoCodigoHisProf: integer;

implementation

uses frm_dm, frm_Colaboradores, frm_Principal, DBClient, frm_Inicial;

{$R *.dfm}

procedure Tt_HistProf.sbExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro ?', 'Informação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      try
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM histprof WHERE codi_his = ' +
                          dm.cdsHistProf.FieldByName('codi_his').AsString;
            Execute;
         end;

         // Atualiza a grid
         with dm.cdsHistProf do
         begin
            Active:= False;
            Active:= True;
         end;

         Application.MessageBox('Registro excluído corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

         LimparCampos;
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONSTOP);
         end;
      end;
   end;
end;

procedure Tt_HistProf.sbGravarClick(Sender: TObject);
begin
   try
      if VerificaDados then
      begin
         if sbGravar.Caption = 'Gravar' then
         begin
            with dm.cdsAuxiliar do
            begin
              Active:= False;
              CommandText:= ' Select max(codi_his) as codigo from histprof';
              Active:= True;
              if RecordCount = 0 then
                 NovoCodigoHisProf:= 1
              else
                 NovoCodigoHisProf:= FieldByName('codigo').AsInteger + 1;
            end;
         end;

         with dm.cdsHistProf do
         begin
            Active:= True;
            if sbGravar.Caption = 'Gravar' then begin
               Insert;
               FieldByName('codi_his').AsInteger:= NovoCodigoHisProf;
            end
            else
            begin
               Edit;
               sbGravar.Caption:= 'Gravar';
            end;
            FieldByName('codi_col').AsString:= edCodColaborador.Text;
            FieldByName('empr_his').AsString:= edEmpresa.Text;
            FieldByName('de_his').AsString  := edDe.Text;
            FieldByName('ate_his').AsString := edAte.Text;
            FieldByName('func_his').AsString:= edFuncao.Text;
            Post;
         end;
         LimparCampos;
         Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      edEmpresa.SetFocus;
      Application.MessageBox('Não foi possível realizar a gravação','Erro',MB_OK+MB_ICONERROR);
   end; // try
end;

procedure Tt_HistProf.sbNovoClick(Sender: TObject);
begin
  LimparCampos;
  edEmpresa.SetFocus;
  sbGravar.Caption:= 'Gravar';
end;

procedure Tt_HistProf.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

function Tt_HistProf.VerificaDados: Boolean;
begin
   Result:= True;
   if edEmpresa.Text = '' then
   begin
      Result:= False;
      Application.MessageBox('Campo "Empresa" obrigatório', 'Aviso',MB_OK+MB_ICONWARNING);
      edEmpresa.SetFocus;
      Exit;
   end;

   if edDe.Text = '  /  ' then
   begin
      Result:= False;
      Application.MessageBox('Campo "De" obrigatório', 'Aviso',MB_OK+MB_ICONWARNING);
      edDe.SetFocus;
      Exit;
   end;

   if edFuncao.Text = '' then
   begin
      Result:= False;
      Application.MessageBox('Campo "Função" obrigatório', 'Aviso',MB_OK+MB_ICONWARNING);
      edFuncao.SetFocus;
      Exit;
   end;
end;

procedure Tt_HistProf.dbgHistProfCellClick(Column: TColumn);
begin
   if dm.cdsHistProf.RecordCount > 0 then begin
      PreencherCampos;
      sbGravar.Caption:= 'Alterar';
   end;
end;

procedure Tt_HistProf.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_HistProf.FormShow(Sender: TObject);
begin
   edCodColaborador.Text := dm.cdsColaboradores.FieldByName('codi_col').AsString; //t_Colaboradores.edCodigo.Text;
   edNomeColaborador.Text:= t_Colaboradores.edNome.Text;
   with dm.cdsHistProf do begin
      Active:= False;
      CommandText:= ' Select codi_his, codi_col, empr_his, de_his, ate_his, func_his ' +
                    ' from histprof' +
                    ' where codi_col = ' + QuotedStr(edCodColaborador.Text) +
                    ' Order By codi_his';
      Active:= True;
   end;
end;

procedure Tt_HistProf.LimparCampos;
begin
   edEmpresa.Clear;
   edDe.Clear;
   edAte.Clear;
   edFuncao.Clear;
   edEmpresa.SetFocus;
end;

procedure Tt_HistProf.PreencherCampos;
begin
   if dm.cdsHistProf.RecordCount > 0 then begin
      edEmpresa.Text:= dm.cdsHistProf.FieldByName('empr_his').AsString;
      edDe.Text     := dm.cdsHistProf.FieldByName('de_his').AsString;
      edAte.Text    := dm.cdsHistProf.FieldByName('ate_his').AsString;
      edFuncao.Text := dm.cdsHistProf.FieldByName('func_his').AsString;

      sbGravar.Caption:= 'Alterar';
   end;
end;

end.
