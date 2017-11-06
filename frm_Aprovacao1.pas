unit frm_Aprovacao1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons, ShellAPI, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBClient, Provider;

type
  Tt_AprovaDocs = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    sbAprovar: TSpeedButton;
    BbtnSair: TSpeedButton;
    edID: TEdit;
    dbgListaMestra: TDBGrid;
    edDesc: TEdit;
    edRevisao: TEdit;
    edAtualizacao: TEdit;
    edArquivo: TEdit;
    edTipo: TEdit;
    edProcesso: TEdit;
    edResponsavel: TEdit;
    sbVisualizar: TSpeedButton;
    sbLocais: TSpeedButton;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryGravar: TZQuery;
    procedure dbgListaMestraTitleClick(Column: TColumn);
    procedure dbgListaMestraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgListaMestraCellClick(Column: TColumn);
    procedure sbAprovarClick(Sender: TObject);
    procedure BbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreencheCampos;
    procedure AtualizaGrid;
    procedure sbVisualizarClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure LimpaCampos;
    procedure sbLocaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_AprovaDocs: Tt_AprovaDocs;

implementation

uses frm_dm, frm_Principal, Funcoes, frm_Inicial,
  frm_ListaMestra_Processos;

{$R *.dfm}

procedure Tt_AprovaDocs.AtualizaGrid;
begin
   with dm.cdsAprovaDocs do begin
      Active:= False;
      CommandText:= ' Select codi_lis, iden_lis, desc_lis, revi_lis, tipo_lis, atua_lis, ' +
                    ' arqu_lis, proc_lis, resp_lis, data_lis, apro_lis, dtap_lis, '+
                    ' quem_lis from lista_mestra' +
                    ' Where apro_lis = ' + QuotedStr('N') +
                    ' Order By iden_lis';
      Active:= True;
   end;
end;

procedure Tt_AprovaDocs.BbtnSairClick(Sender: TObject);
begin
   dm.cdsAprovaDocs.Active:= False;
   Self.Close;
end;

procedure Tt_AprovaDocs.dbgListaMestraCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_AprovaDocs.dbgListaMestraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure Tt_AprovaDocs.dbgListaMestraTitleClick(Column: TColumn);
var
  cCampo: String;
begin
   cCampo:= Column.FieldName;
   with dm.cdsAprovaDocs do begin
      Active:= False;
      CommandText:= ' Select codi_lis, iden_lis, desc_lis, revi_lis, tipo_lis, atua_lis, ' +
                    ' arqu_lis, proc_lis, resp_lis, data_lis, apro_lis, dtap_lis, '+
                    ' quem_lis from lista_mestra' +
                    ' Where apro_lis = ' + QuotedStr('N') +
                    ' ORDER BY ' + cCampo ;
      Active:= True;
   end;
   PreencheCampos;
end;

procedure Tt_AprovaDocs.FormPaint(Sender: TObject);
begin
  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_AprovaDocs.FormShow(Sender: TObject);
begin
   AtualizaGrid;
end;

procedure Tt_AprovaDocs.LimpaCampos;
begin
   edID.Clear;
   edDesc.Clear;
   edRevisao.Clear;
   edTipo.Clear;
   edAtualizacao.Clear;
   edArquivo.Clear;
   edProcesso.Clear;
   edResponsavel.Clear;
   sbVisualizar.Enabled:= False;
end;

procedure Tt_AprovaDocs.PreencheCampos;
begin
   if dm.cdsAprovaDocs.RecordCount > 0 then begin
      edID.Text         := dm.cdsAprovaDocs.FieldByName('iden_lis').AsString;
      edDesc.Text       := dm.cdsAprovaDocs.FieldByName('desc_lis').AsString;
      edRevisao.Text    := dm.cdsAprovaDocs.FieldByName('revi_lis').AsString;

      case dm.cdsAprovaDocs.FieldByName('tipo_lis').AsInteger of
         0: edTipo.Text:= 'EXTERNO';
         1: edTipo.Text:= 'INTERNO';
      end;

      edAtualizacao.Text:= dm.cdsAprovaDocs.FieldByName('atua_lis').AsString;
      edArquivo.Text    := dm.cdsAprovaDocs.FieldByName('arqu_lis').AsString;

      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' Select nome_pro from processos' +
                       ' Where codi_pro = ' + dm.cdsAprovaDocs.FieldByName('proc_lis').AsString;
         Active:= True;
      end;
      edProcesso.Text:= dm.cdsAuxiliar.FieldByName('nome_pro').AsString;

      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' Select desc_fun from funcoes' +
                       ' Where codi_fun = ' + dm.cdsAprovaDocs.FieldByName('resp_lis').AsString;
         Active:= True;
      end;
      edResponsavel.Text:= dm.cdsAuxiliar.FieldByName('desc_fun').AsString;
   end;
   sbVisualizar.Enabled:= True;
end;

procedure Tt_AprovaDocs.sbAprovarClick(Sender: TObject);
begin
   with cdsGravar do begin
      Active:= False;
      CommandText:= ' SELECT AprovaDoc ' +
                    ' FROM Usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;

      if FieldByName('AprovaDoc').AsString = '1' then begin
         if Application.MessageBox('Confirma aprovação do documento ?','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' UPDATE lista_mestra' +
                             ' SET apro_lis = "S",' +
                             ' dtap_lis = ' + ArrumaDataSQL(Now) +
                             ' WHERE codi_lis = ' + dm.cdsAprovaDocscodi_lis.AsString;
               Execute;

//               Edit;
//               FieldByName('apro_lis').AsString  := 'S';
//               FieldByName('dtap_lis').AsDateTime:= Now;
//               Post;
               Auditoria('LISTA_MESTRA',edID.Text,'APROVAÇÃO DE DOCUMENTOS', '');
            end;

            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' UPDATE lista_mestra_proc SET' +
                             ' lis_novo = ' + QuotedStr('S') +
                             ' WHERE  lis_codiDocumento = ' + dm.cdsAprovaDocscodi_lis.AsString;
               Execute;
            end;

            AtualizaGrid;
            LimpaCampos();
            Application.MessageBox('Documento aprovado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;
      end
      else begin
         Application.MessageBox(PChar('Usuário ' + cUsuario + ' não tem permissão para aprovar documentos.'),'Acesso negado',MB_OK + MB_ICONERROR);
      end;

   end;

//   if (Acesso(cUsuario, 8, 'especial2') = 1) then begin
//      if Application.MessageBox('Confirma aprovação do documento ?','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
//         with dm.cdsAprovaDocs do begin
//            Edit;
//            FieldByName('apro_lis').AsString  := 'S';
//            FieldByName('dtap_lis').AsDateTime:= Now;
//            Post;
//            Auditoria('LISTA_MESTRA',edID.Text,'APROVAÇÃO DE DOCUMENTOS', '');
//         end;
//         AtualizaGrid;
//         LimpaCampos();
//         Application.MessageBox('Documento aprovado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
//      end;
//   end;
end;

procedure Tt_AprovaDocs.sbLocaisClick(Sender: TObject);
begin
   FormProcListaMestra:= TFormProcListaMestra.Create(nil);
   FormProcListaMestra.sNomeDoc:= dm.CdsAprovaDocsiden_lis1.AsString;
   FormProcListaMestra.iCodDoc := dm.cdsAprovaDocscodi_lis.AsInteger;
   FormProcListaMestra.ShowModal;
   FormProcListaMestra.Release;
end;

procedure Tt_AprovaDocs.sbVisualizarClick(Sender: TObject);
begin
   try
      AbrirArquivo(edArquivo.text);
//      ShellExecute(Application.Handle, 'open', PChar(edArquivo.text), nil, nil, SW_SHOWMAXIMIZED);
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

end.
