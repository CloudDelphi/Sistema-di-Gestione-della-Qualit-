unit frm_Aprovacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI;

type
  TFormAprovacao = class(TForm)
    pctLira: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl5: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtIdentificação: TEdit;
    edtDescricao: TEdit;
    lbl11: TLabel;
    edtAtualizacao: TEdit;
    pnl1: TPanel;
    btnAprovar: TBitBtn;
    btnSair: TBitBtn;
    lbl21: TLabel;
    edtDocumento: TEdit;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryAprovacao: TZQuery;
    dspAprovacao: TDataSetProvider;
    cdsAprovacao: TClientDataSet;
    dsAprovacao: TDataSource;
    lbl7: TLabel;
    edtResponsavel: TEdit;
    edtRevisao: TEdit;
    sbVisualizar: TSpeedButton;
    lbl4: TLabel;
    edtTipo: TEdit;
    dbgAprovacao: TDBGrid;
    cdsAprovacaoDescResponsavel: TStringField;
    btnAprovarTodos: TBitBtn;
    cdsAprovacaoapro_lis: TWideStringField;
    cdsAprovacaoarqu_lis: TWideMemoField;
    cdsAprovacaoatua_lis: TWideStringField;
    cdsAprovacaocodi_lis: TLargeintField;
    cdsAprovacaodata_lis: TDateTimeField;
    cdsAprovacaodesc_lis: TWideStringField;
    cdsAprovacaodtap_lis: TDateTimeField;
    cdsAprovacaoiden_lis: TWideStringField;
    cdsAprovacaoproc_lis: TLargeintField;
    cdsAprovacaoquem_lis: TLargeintField;
    cdsAprovacaoresp_lis: TLargeintField;
    cdsAprovacaorevi_lis: TWideStringField;
    cdsAprovacaotipo_lis: TLargeintField;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure btnSairClick(Sender: TObject);
    procedure btnAprovarClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure LimparCampos();
    procedure dbgAprovacaoCellClick(Column: TColumn);
    procedure cdsAprovacaoCalcFields(DataSet: TDataSet);
    procedure GravarDados();
    procedure btnAprovarTodosClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormAprovacao: TFormAprovacao;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormAprovacao.AtualizarDados;
begin
   with cdsAprovacao do begin
      Active:= False;
      Active:= True;
   end;

   btnAprovar.Enabled:= not cdsAprovacao.IsEmpty;
end;

procedure TFormAprovacao.btnAprovarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         // Verifica se o usuário tem permissão de aprovar documentos
         Active:= False;
         CommandText:= ' SELECT AprovaDoc ' +
                       ' FROM Usuarios' +
                       ' WHERE nome_usu = ' + QuotedStr(cUsuario);
         Active:= True;

         if FieldByName('AprovaDoc').AsString = '1' then begin
            if Application.MessageBox('Confirma aprovação do documento ?','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
               GravarDados();
//               with dm.cdsAuxiliar do begin
//                  Active:= False;
//                  CommandText:= ' UPDATE lista_mestra' +
//                                ' SET apro_lis = "S",' +
//                                ' dtap_lis = ' + ArrumaDataSQL(Now) +
//                                ' WHERE codi_lis = ' + cdsAprovacaocodi_lis.AsString;
//                  Execute;
//
//                  Auditoria('LISTA_MESTRA',edtIdentificação.Text,'APROVAÇÃO DE DOCUMENTOS', edtRevisao.Text);
//               end;
//
//               with dm.cdsAuxiliar do begin
//                  Active:= False;
//                  CommandText:= ' UPDATE lista_mestra_proc SET' +
//                                ' lis_novo = ' + QuotedStr('S') +
//                                ' WHERE lis_codiDocumento = ' + cdsAprovacaocodi_lis.AsString;
//                  Execute;
//               end;

               AtualizarDados;
               LimparCampos();
               Application.MessageBox('Documento aprovado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
            end;
         end
         else begin
            Application.MessageBox(PChar('Usuário ' + cUsuario + ' não tem permissão para aprovar documentos.'),'Acesso negado',MB_OK + MB_ICONERROR);
         end;
      end;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao aprovar o documento. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormAprovacao.btnAprovarTodosClick(Sender: TObject);
begin
   with cdsGravar do begin
      // Verifica se o usuário tem permissão de aprovar documentos
      Active:= False;
      CommandText:= ' SELECT AprovaDoc ' +
                    ' FROM Usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;

      if FieldByName('AprovaDoc').AsString = '1' then begin
         if Application.MessageBox('Confirma aprovação de todos os documentos ?','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
            with cdsAprovacao do begin
               First;
               while not Eof do begin
                  GravarDados();
                  Next;
               end;

               AtualizarDados;
               LimparCampos();
               Application.MessageBox('Documentos aprovados com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end
      else begin
         Application.MessageBox(PChar('Usuário ' + cUsuario + ' não tem permissão para aprovar documentos.'),'Acesso negado',MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFormAprovacao.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormAprovacao.cdsAprovacaoCalcFields(DataSet: TDataSet);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT desc_fun from funcoes' +
                    ' WHERE codi_fun = ' + cdsAprovacao.FieldByName('resp_lis').AsString;
      Active:= True;
   end;
   cdsAprovacao.FieldByName('DescResponsavel').AsString:= dm.cdsAuxiliar.FieldByName('desc_fun').AsString;
end;

procedure TFormAprovacao.dbgAprovacaoCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormAprovacao.FormShow(Sender: TObject);
begin
   AtualizarDados();
end;

procedure TFormAprovacao.GravarDados;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE lista_mestra' +
                    ' SET apro_lis = ' + QuotedStr('S') + ',' +
                    ' dtap_lis = ' + ArrumaDataSQL(Now) +
                    ' WHERE codi_lis = ' + cdsAprovacaocodi_lis.AsString;
      Execute;

      Auditoria('LISTA_MESTRA', cdsAprovacaoiden_lis.AsString,'APROVAÇÃO DE DOCUMENTOS', cdsAprovacaorevi_lis.AsString);
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' UPDATE lista_mestra_proc SET' +
                    ' lis_novo = ' + QuotedStr('S') +
                    ' WHERE lis_codiDocumento = ' + cdsAprovacaocodi_lis.AsString;
      Execute;
   end;
end;

procedure TFormAprovacao.LimparCampos;
begin
   edtIdentificação.Clear;
   edtDescricao.Clear;
   edtRevisao.Clear;
   edtTipo.Clear;
   edtAtualizacao.Clear;
   edtDocumento.Clear;
   edtResponsavel.Clear;
   sbVisualizar.Enabled:= False;
end;

procedure TFormAprovacao.PreencherCampos;
begin
   with cdsAprovacao do begin
      edtIdentificação.Text:= FieldByName('iden_lis').AsString;
      edtDescricao.Text    := FieldByName('desc_lis').AsString;
      edtRevisao.Text      := FieldByName('revi_lis').AsString;

      case dm.cdsAprovaDocs.FieldByName('tipo_lis').AsInteger of
         0: edtTipo.Text:= 'INTERNO';
         1: edtTipo.Text:= 'EXTERNO';
      end;

      edtAtualizacao.Text  := FieldByName('atua_lis').AsString;
      edtDocumento.Text    := FieldByName('arqu_lis').AsString;
      if edtDocumento.Text <> '' then begin
         sbVisualizar.Enabled:= True;
      end
      else begin
         sbVisualizar.Enabled:= False;
      end;

      edtResponsavel.Text  := FieldByName('DescResponsavel').AsString;
   end;
end;

procedure TFormAprovacao.sbVisualizarClick(Sender: TObject);
begin
   AbrirArquivo(edtDocumento.text, Self.Name);
end;

end.
