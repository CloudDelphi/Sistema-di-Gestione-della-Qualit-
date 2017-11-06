unit frm_ColabEducacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Mask, FMTBcd, DB,
  DBClient, Provider, SqlExpr, ShellAPI, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFormColabEducacao = class(TForm)
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
    dbgEducacao: TDBGrid;
    edtEscola: TEdit;
    edtDe: TMaskEdit;
    edtAte: TMaskEdit;
    Label2: TLabel;
    edCodColaborador: TEdit;
    dspColabEdu: TDataSetProvider;
    cdsColabEdu: TClientDataSet;
    dsColabEdu: TDataSource;
    cbEducacao: TComboBox;
    lbl1: TLabel;
    edtArquivo: TEdit;
    btnBbtnArquivo: TSpeedButton;
    btnVisualizar: TSpeedButton;
    opd1: TOpenDialog;
    cdsColabEduDescInstrucao: TStringField;
    zqryColabEdu: TZQuery;
    CdsColabEduedu_anexo: TWideStringField;
    CdsColabEduedu_ate: TWideStringField;
    cdsColabEduedu_codigo: TLargeintField;
    cdsColabEduedu_colaborador: TLargeintField;
    CdsColabEduedu_de: TWideStringField;
    CdsColabEduedu_escola: TWideStringField;
    cdsColabEduedu_grau: TIntegerField;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    dsGravar: TDataSource;
    procedure cdsColabEduCalcFields(DataSet: TDataSet);
    procedure cdsColabEduAfterPost(DataSet: TDataSet);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnBbtnArquivoClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgEducacaoCellClick(Column: TColumn);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure LimparCampos;
    procedure PreencherCampos;
    function VerificaDados: Boolean;
    procedure FormPaint(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure AtualizarDados();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormColabEducacao: TFormColabEducacao;
  NovoCodigoEduc: integer;

implementation

uses frm_dm, frm_Colaboradores, frm_Principal, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormColabEducacao.sbExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma a exclusão do registro ?', 'Informação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      try
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM colab_educacao WHERE edu_codigo = ' +
                          cdsColabEdu.FieldByName('edu_codigo').AsString;
            Execute;
         end;

         // Atualiza a grid
         with cdsColabEdu do begin
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

procedure TFormColabEducacao.sbGravarClick(Sender: TObject);
begin
   try
      if VerificaDados then begin
         if sbGravar.Caption = 'Gravar' then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' Select max(edu_codigo) as codigo from colab_educacao';
               Active:= True;
               if RecordCount = 0 then begin
                  NovoCodigoEduc:= 1
               end
               else begin
                  NovoCodigoEduc:= FieldByName('codigo').AsInteger + 1;
               end;
            end;
         end;

         with cdsGravar do begin
            if sbGravar.Caption = 'Gravar' then begin
               Active:= False;
               CommandText:= ' INSERT INTO colab_educacao' +
                             ' (edu_codigo, edu_colaborador, edu_de, edu_ate, edu_grau, edu_escola, edu_anexo)' +
                             ' VALUES(' +
                             IntToStr(NovoCodigoEduc) + ',' +
                             QuotedStr(edCodColaborador.Text) + ',' +
                             QuotedStr(edtDe.Text) + ',' +
                             QuotedStr(edtAte.Text) + ',' +
                             IntToStr(BuscaCodigoTabelaCombos(6,cbEducacao.Text)) + ',' +
                             QuotedStr(edtEscola.Text) + ',' +
                             QuotedStr(DuploBar(edtArquivo.Text)) +
                             ')';
               Execute;
            end
            else begin
               Active:= False;
               CommandText:= ' UPDATE colab_educacao SET' +
                             ' edu_colaborador = ' + QuotedStr(edCodColaborador.Text) + ',' +
                             ' edu_de = ' + QuotedStr(edtDe.Text) + ',' +
                             ' edu_ate = ' + QuotedStr(edtAte.Text) + ',' +
                             ' edu_grau = ' + IntToStr(BuscaCodigoTabelaCombos(6,cbEducacao.Text)) + ',' +
                             ' edu_escola = ' + QuotedStr(edtEscola.Text) + ',' +
                             ' edu_anexo = ' + QuotedStr(DuploBar(edtArquivo.Text)) +
                             ' WHERE edu_codigo = ' + IntToStr(cdsColabEduedu_codigo.AsInteger);
               Execute;
            end;

//            Active:= True;
//            if sbGravar.Caption = 'Gravar' then begin
//               Insert;
//               FieldByName('edu_codigo').AsInteger:= NovoCodigoEduc;
//            end
//            else begin
//               Edit;
//               sbGravar.Caption:= 'Gravar';
//            end;
//            FieldByName('edu_colaborador').AsString:= edCodColaborador.Text;
//            FieldByName('edu_escola').AsString     := edtEscola.Text;
//            FieldByName('edu_de').AsString         := edtDe.Text;
//            FieldByName('edu_ate').AsString        := edtAte.Text;
//            FieldByName('edu_grau').AsString       := IntToStr(BuscaCodigoTabelaCombos(6,cbEducacao.Text));
//            FieldByName('edu_anexo').AsString      := edtArquivo.Text;
//            Post;
         end;
         LimparCampos;
         AtualizarDados();
         Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;

      btnVisualizar.Enabled:= False;
   except
      on E: Exception do begin
         edtEscola.SetFocus;
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end; // try
end;

procedure TFormColabEducacao.sbNovoClick(Sender: TObject);
begin
   LimparCampos;
   edtEscola.SetFocus;
   sbGravar.Caption:= 'Gravar';
   btnVisualizar.Enabled:= False;
end;

procedure TFormColabEducacao.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

function TFormColabEducacao.VerificaDados: Boolean;
begin
   Result:= True;
   if edtEscola.Text = '' then begin
      Result:= False;
      Application.MessageBox('Campo "Entidade" obrigatório', 'Aviso',MB_OK+MB_ICONWARNING);
      edtEscola.SetFocus;
      Exit;
   end;

   if edtDe.Text = '  /  ' then begin
      Result:= False;
      Application.MessageBox('Campo "De" obrigatório', 'Aviso',MB_OK+MB_ICONWARNING);
      edtDe.SetFocus;
      Exit;
   end;

   if cbEducacao.Text = '' then begin
      Application.MessageBox('Escolha o nível de educação do colaborador !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbEducacao.SetFocus;
      Exit;
   end;
end;

procedure TFormColabEducacao.AtualizarDados;
begin
   with cdsColabEdu do begin
      Active:= False;
      CommandText:= ' SELECT edu_ate, edu_codigo, edu_colaborador, edu_de, edu_escola, edu_grau, edu_anexo ' +
                    ' FROM colab_educacao ' +
                    ' WHERE edu_colaborador = ' + dm.cdsColaboradores.FieldByName('codi_col').AsString + //QuotedStr(edCodColaborador.Text) +
                    ' ORDER By edu_codigo';
      Active:= True;
   end;
end;

procedure TFormColabEducacao.btnBbtnArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   if OPD1.FileName <> '' then begin
      edtArquivo.Text:= OPD1.FileName;
      btnVisualizar.Enabled:= True;
   end
   else begin
      btnVisualizar.Enabled:= False;
   end;
end;

procedure TFormColabEducacao.btnVisualizarClick(Sender: TObject);
begin
   try
      ShellExecute(Application.Handle, nil, PChar(edtArquivo.text), nil, nil, SW_SHOWMAXIMIZED);
//      Auditoria('LISTA_MESTRA',edID.Text,'LIDA', '');

   except
      on E: Exception do
         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
   end;
end;

procedure TFormColabEducacao.cdsColabEduAfterPost(DataSet: TDataSet);
begin
   cdsColabEdu.ApplyUpdates(0);
end;

procedure TFormColabEducacao.cdsColabEduCalcFields(DataSet: TDataSet);
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' Select valo_com from tabela_combos' +
                       ' where tipo_com = 6' +
                       ' AND codi_com = ' + cdsColabEduedu_grau.AsString;
         Active:= True;

         if RecordCount > 0 then
            cdsColabEdu.FieldByName('DescInstrucao').AsString:= FieldByName('valo_com').AsString;
      end;
   except
      on E: Exception do begin
//         Application.MessageBox(PChar('Erro no carregamento do valor' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
         cdsColabEdu.FieldByName('DescInstrucao').AsString:= EmptyStr;
      end;
   end;
end;

procedure TFormColabEducacao.dbgEducacaoCellClick(Column: TColumn);
begin
   if cdsColabEdu.RecordCount > 0 then begin
      PreencherCampos;
      sbGravar.Caption:= 'Alterar';
   end;

   if edtArquivo.Text = '' then begin
      btnVisualizar.Enabled:= False
   end
   else begin
      btnVisualizar.Enabled:= True;
   end;
end;

procedure TFormColabEducacao.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure TFormColabEducacao.FormShow(Sender: TObject);
begin
   MontaCombosGeral(6,cbEducacao);

   edCodColaborador.Text := dm.cdsColaboradores.FieldByName('codi_col').AsString; //t_Colaboradores.edCodigo.Text;
   edNomeColaborador.Text:= t_Colaboradores.edNome.Text;

   AtualizarDados();
end;

procedure TFormColabEducacao.LimparCampos;
begin
   edtEscola.Clear;
   edtDe.Clear;
   edtAte.Clear;
   cbEducacao.Text:= EmptyStr;
   edtEscola.SetFocus;
   edtArquivo.Clear;
end;

procedure TFormColabEducacao.PreencherCampos;
begin
   if cdsColabEdu.RecordCount > 0 then begin
      edtEscola.Text := cdsColabEdu.FieldByName('edu_escola').AsString;
      edtDe.Text     := cdsColabEdu.FieldByName('edu_de').AsString;
      edtAte.Text    := cdsColabEdu.FieldByName('edu_ate').AsString;
      CarregaCombosGeral(6,cbEducacao,cdsColabEdu,'edu_grau');
      edtArquivo.Text:= cdsColabEdu.FieldByName('edu_anexo').AsString;

      sbGravar.Caption:= 'Alterar';
   end;
end;

end.
