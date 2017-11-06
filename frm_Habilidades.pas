unit frm_Habilidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tt_Habilidades = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbNovo: TSpeedButton;
    BbtnImprimir: TSpeedButton;
    edDescricao: TEdit;
    dbgHabilidades: TDBGrid;
    sbExcluir: TSpeedButton;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    dsHabilidades: TDataSource;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryHabilidades: TZQuery;
    zqryGravar: TZQuery;
    cdsHabilidadescodi_hab: TIntegerField;
    CdsHabilidadesdesc_hab: TWideStringField;
    procedure sbNovoClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure PreencheCampos;
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure dbgHabilidadesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgHabilidadesTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BbtnImprimirClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarDados;
  public
    { Public declarations }
    cOperacao: String;
  end;

var
  t_Habilidades: Tt_Habilidades;
  NovoCodigoHabilidade: Integer;

implementation

uses frm_dm, frm_Principal, Funcoes, frm_Inicial;

{$R *.dfm}

procedure Tt_Habilidades.sbExcluirClick(Sender: TObject);
begin
   if Acesso(cUsuario, 4, 'exclusao') = 1 then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) AS QTD' +
                       ' FROM colab_habilidades' +
                       ' WHERE codi_hab = ' + cdsHabilidadescodi_hab.AsString;
         Active:= True;

         if FieldByName('QTD').AsInteger > 0 then begin
            Application.MessageBox('A habilidade não pode ser excluído, pois está vinculado aos colaboradores',
              'Aviso', MB_OK + MB_ICONWARNING);
            Exit;
         end;
      end;

      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then begin
         try
            cdsHabilidades.Delete;
            cdsHabilidades.ApplyUpdates(0);
            edDescricao.Clear;
            Auditoria('HABILIDADES',edDescricao.Text,'E', '');
            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;
end;

procedure Tt_Habilidades.sbGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
begin
   with cdsGravar do begin
      Active:= False;
      CommandText:= 'SELECT MAX(codi_hab) + 1 NovoCodigo FROM Habilidades';
      Active:= True;

      if FieldByName('NovoCodigo').AsInteger = 0 then
         iNovoCodigo:= 1
      else
         iNovoCodigo:= FieldByName('NovoCodigo').AsInteger;
   end;

   try
      if edDescricao.Text <> '' then
      begin
         with cdsGravar do
         begin
            Active:= True;
            if sbGravar.Caption = 'Gravar' then begin
               if Acesso(cUsuario, 4, 'cadastro') = 1 then begin
                  CommandText:= ' INSERT INTO Habilidades ' +
                                ' (codi_hab, desc_hab) VALUES(' +
                                IntToStr(iNovoCodigo) + ',' +
                                QuotedStr(edDescricao.Text) +
                                ')';

                  cOperacao:= 'I';
//                  Insert;
//                  FieldByName('codi_hab').AsInteger:= iNovoCodigo;
               end
               else
                  Exit;
            end
            else
            begin
               if Acesso(cUsuario, 4, 'alteracao') = 1 then begin
                  CommandText:= ' UPDATE Habilidades SET' +
                                ' desc_hab = ' + QuotedStr(edDescricao.Text) +
                                ' WHERE codi_hab = ' + cdsHabilidadescodi_hab.AsString;
                  cOperacao:= 'A';
//                  Edit;
                  sbGravar.Caption:= 'Gravar';
               end
               else
                  Exit;
            end;
//            FieldByName('desc_hab').AsString:= edDescricao.Text;
//            Post;
              Execute;

            Auditoria('HABILIDADES',edDescricao.Text,cOperacao, '');
         end;
         edDescricao.Clear;
      end
      else
      begin
        Application.MessageBox('Campo "Descrição" vazio','Aviso',MB_OK+MB_ICONWARNING);
      end;
      dm.cdsAuxiliar.Active:= False;
      edDescricao.SetFocus;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);

      AtualizarDados();
   except
      on E:Exception do begin
         edDescricao.SetFocus;
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

procedure Tt_Habilidades.AtualizarDados;
begin
   with cdsHabilidades do begin
      Active:= False;
      CommandText:= ' Select codi_hab, desc_hab from habilidades' +
                   ' Order By desc_hab';
      Active:= True;
   end;
end;

procedure Tt_Habilidades.BbtnImprimirClick(Sender: TObject);
begin
//  Auditoria('HABILIDADES','','R', '');
end;

procedure Tt_Habilidades.sbNovoClick(Sender: TObject);
begin
   edDescricao.Clear;
   edDescricao.SetFocus;
   sbGravar.Caption:= 'Gravar';
end;

procedure Tt_Habilidades.dbgHabilidadesCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_Habilidades.dbgHabilidadesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure Tt_Habilidades.dbgHabilidadesTitleClick(Column: TColumn);
var
  cCampo: String;
begin
   cCampo:= Column.FieldName;
   with cdsHabilidades do begin
      Active:= False;
      CommandText:= ' Select codi_hab, desc_hab from habilidades' +
                    ' Order By '+ cCampo;
      Active:= True;
   end;
   PreencheCampos;
end;

procedure Tt_Habilidades.FormPaint(Sender: TObject);
begin
  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Habilidades.FormShow(Sender: TObject);
begin
   AtualizarDados;
end;

procedure Tt_Habilidades.PreencheCampos;
begin
  if cdsHabilidades.RecordCount > 0 then
  begin
    edDescricao.Text:= cdsHabilidades.FieldByName('desc_hab').AsString;
    sbGravar.Caption:= 'Alterar';
  end;
end;

procedure Tt_Habilidades.sbSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
