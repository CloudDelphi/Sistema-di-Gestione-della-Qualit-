unit frm_Colaboradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, FMTBcd,
  DBClient, Provider, DB, SqlExpr, jpeg, frxClass, frxDBSet, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  Tt_Colaboradores = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    edNome: TEdit;
    dbgColaboradores: TDBGrid;
    cbEducacao: TComboBox;
    cbExperiencia: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edEntidade: TEdit;
    Label5: TLabel;
    edConclusao: TEdit;
    Label6: TLabel;
    cbFuncao: TComboBox;
    sbExcluir: TSpeedButton;
    imgCurriculo: TImage;
    sbCurriculum: TSpeedButton;
    lb1: TLabel;
    dblProcessos: TDBLookupComboBox;
    imgAtributos: TImage;
    sbAtributos: TSpeedButton;
    dbxGravaAtributo: TSQLDataSet;
    dspGravaAtributo: TDataSetProvider;
    cdsGravaAtributo: TClientDataSet;
    btnGeraAtributos: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    img1: TImage;
    btnEducacao: TSpeedButton;
    lbl3: TLabel;
    lbl4: TLabel;
    mmoObs: TMemo;
    cbStatus: TComboBox;
    lbl5: TLabel;
    zqryReport: TZQuery;
    dspReport: TDataSetProvider;
    cdsReport: TClientDataSet;
    frxdbColaboradores: TfrxDBDataset;
    cdsReportcodi_col: TLargeintField;
    cdsReportnome_col: TWideStringField;
    cdsReportfunc_col: TLargeintField;
    cdsReporteduc_col: TLargeintField;
    cdsReportexpe_col: TLargeintField;
    cdsReportesco_col: TWideStringField;
    cdsReportconc_col: TWideStringField;
    cdsReportobs_col: TMemoField;
    cdsReportproc_col: TLargeintField;
    cdsReportdesc_fun: TWideStringField;
    cdsReportEducacao: TWideStringField;
    cdsReportExperiencia: TWideStringField;
    cdsReportStatus: TWideStringField;
    cdsReportnome_pro: TWideStringField;
    procedure mmoObsKeyPress(Sender: TObject; var Key: Char);
    procedure btnEducacaoClick(Sender: TObject);
    procedure btnGeraAtributosClick(Sender: TObject);
    procedure sbCurriculumClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure dbgColaboradoresTitleClick(Column: TColumn);
    procedure sbGravarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreencheCampos;
    procedure dbgColaboradoresCellClick(Column: TColumn);
    procedure dbgColaboradoresKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimpaCampos;
    procedure FormPaint(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure sbImprimirClick(Sender: TObject);
    procedure sbAtributosClick(Sender: TObject);
    procedure VerificaGestor;
//    procedure GravaAtributos(iCodCol: Integer; iCodFuncao: Integer);
    procedure Atualiza;
    procedure cbStatusCloseUp(Sender: TObject);
    procedure VerificarColaborador;
  private
    { Private declarations }
  public
    { Public declarations }
    cOperacao: Char;
    iNovoCodigo: Integer;
  end;

var
  t_Colaboradores: Tt_Colaboradores;

implementation

uses frm_dm, frm_HistProfissional, Funcoes, frm_Principal,
  frm_DefineAtributos, frm_ColabEducacao, frm_Inicial;

{$R *.dfm}

procedure Tt_Colaboradores.sbExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 6, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         try
            // Exclui os itens da tabela colab_habilidades
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' DELETE FROM colab_habilidades ' +
                             ' WHERE codi_col = ' + dm.cdsColaboradorescodi_col.AsString;
               Execute;
            end;

            // Exclui os itens da tabela colab_treinamentos
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' DELETE FROM colab_treinamentos ' +
                             ' WHERE codi_col = ' + dm.cdsColaboradorescodi_col.AsString;
               Execute;
            end;

            dm.cdsColaboradores.Delete;
            dm.cdsColaboradores.ApplyUpdates(0);

            Auditoria('COLABORADORES',edNome.Text,'E', '');

            LimpaCampos;
            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;
end;

function Tt_Colaboradores.ValidaCampos: Boolean;
begin
   Result:= True;

   if edNome.Text = '' then begin
      Application.MessageBox('Digite o nome do colaborador !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edNome.SetFocus;
      Exit;
   end;

   if cbEducacao.Text = '' then begin
      Application.MessageBox('Escolha o nível de educação do colaborador !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbEducacao.SetFocus;
      Exit;
   end;

   if edEntidade.Text = '' then begin
      Application.MessageBox('Digite entidade onde o colaborador estudou !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edEntidade.SetFocus;
      Exit;
   end;

   if edConclusao.Text = '' then begin
      Application.MessageBox('Digite o ano de conclusão !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edConclusao.SetFocus;
      Exit;
   end;

   if cbExperiencia.Text = '' then begin
      Application.MessageBox('Escolha a experiência do colaborador !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbExperiencia.SetFocus;
      Exit;
   end;

   if cbFuncao.Text = '' then begin
      Application.MessageBox('Escolha uma função para o colaborador !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbFuncao.SetFocus;
      Exit;
   end;
end;

procedure Tt_Colaboradores.VerificaGestor;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT gest_pro from processos' +
                    ' WHERE codi_pro = ' + IntToStr(dblProcessos.KeyValue);
      Active:= True;
   end;

   if dm.cdsAuxiliar.FieldByName('gest_pro').AsInteger = 0 then
      if Application.MessageBox('O processo escolhido não tem um gestor definido.'
         + #13#10 + 'Gostaria de confirmar o colaborador corrente como' +
         #13#10 + 'gestor do processo ?', 'Confirmação', MB_YESNO +
         MB_ICONQUESTION) = IDYES then begin
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' UPDATE processos' +
                          ' SET gest_pro = ' + IntToStr(dm.cdsColaboradorescodi_col.AsInteger) +
                          ' WHERE codi_pro = ' + IntToStr(dblProcessos.KeyValue);
            Execute;
         end;
      end;
  end;

procedure Tt_Colaboradores.VerificarColaborador;
begin
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT COUNT(*) AS Qtd' +
                    ' FROM lista_mestra' +
                    ' WHERE resp_lis = ' + dm.cdsColaboradorescodi_col.AsString;
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         Application.MessageBox('Colaborador não pode ser inativado! ' + #13#10 + 'Há documentos vinculados ao colaborador.', 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure Tt_Colaboradores.sbGravarClick(Sender: TObject);
var
   iFuncao: Integer;
//   sMensagem: string;
begin
   if sbGravar.Caption = 'Gravar' then begin
       if (Acesso(cUsuario, 6, 'cadastro') = 0) then begin
          Exit;
       end;
   end;

   if sbGravar.Caption = 'Alterar' then begin
       if (Acesso(cUsuario, 6, 'alteracao') = 0) then begin
          Exit;
       end;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT MAX(codi_col) + 1 NovoCodigo FROM Colaboradores';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         iNovoCodigo:= 1
      end
      else begin
         iNovoCodigo:= FieldByName('NovoCodigo').AsInteger;
      end;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_fun FROM funcoes' +
                    ' WHERE desc_fun = ' + QuotedStr(cbFuncao.Text);
      Active:= True;
      iFuncao:= FieldByName('codi_fun').AsInteger;
   end;

   try
      if ValidaCampos then begin
         with dm.cdsAuxiliar do begin
            if sbGravar.Caption = 'Gravar' then begin
               Active:= False;
               CommandText:= ' INSERT INTO colaboradores ' +
                             ' (codi_col, nome_col, func_col, educ_col, expe_col, ' +
                             ' esco_col, conc_col, obs_col, proc_col, col_status)' +
                             ' VALUES( ' +
                             IntToStr(iNovoCodigo)  + ',' +
                             QuotedStr(edNome.Text) + ',' +
                             IntToStr(iFuncao) + ',' +
                             IntToStr(BuscaCodigoTabelaCombos(6,cbEducacao.Text)) + ',' +
                             IntToStr(BuscaCodigoTabelaCombos(7,cbExperiencia.Text)) + ',' +
                             QuotedStr(edEntidade.Text) + ',' +
                             QuotedStr(edConclusao.Text) + ',' +
                             QuotedStr(mmoObs.Text) + ',' +
                             IntToStr(dblProcessos.KeyValue) + ',' +
                             QuotedStr(IntToStr(cbStatus.ItemIndex)) +
                             ')';
               Execute;
               LimpaCampos;
               Atualiza;
               // Grava as habilidades e treinamentos da função no colaborador
               GravaAtributos(iNovoCodigo, iFuncao);
               Application.MessageBox('Registro gravado corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

               Auditoria('COLABORADORES',edNome.Text,'I', '');
            end
            else begin
               Active:= False;
               CommandText:= ' UPDATE colaboradores SET ' +
                             ' nome_col = ' + QuotedStr(edNome.Text) + ',' +
                             ' func_col = ' + IntToStr(iFuncao) + ',' +
                             ' educ_col = ' + IntToStr(BuscaCodigoTabelaCombos(6,cbEducacao.Text)) + ',' +
                             ' expe_col = ' + IntToStr(BuscaCodigoTabelaCombos(7,cbExperiencia.Text)) + ',' +
                             ' esco_col = ' + QuotedStr(edEntidade.Text) + ',' +
                             ' conc_col = ' + QuotedStr(edConclusao.Text) + ',' +
                             ' obs_col  = ' + QuotedStr(mmoObs.Text) + ',' +
                             ' proc_col = ' + IntToStr(dblProcessos.KeyValue) + ',' +
                             ' col_status = ' + QuotedStr(IntToStr(cbStatus.ItemIndex)) +
                             ' WHERE codi_col = ' + dm.cdsColaboradorescodi_col.AsString ;
               Execute;
               LimpaCampos;
               Atualiza;
               Application.MessageBox('Registro alterado corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

               Auditoria('COLABORADORES',edNome.Text,'A', '');
            end;
         end;
      end;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;

   //   try
//      if ValidaCampos then
//      begin
//         with dm.cdsColaboradores do
//         begin
//            Active:= True;
//            if sbGravar.Caption = 'Gravar' then
//            begin
//               if (Acesso(cUsuario, 6, 'cadastro') = 1) then begin
//                  sMensagem:= 'Registro cadastrado corretamente';
//                  cOperacao:= 'I';
//                  Insert;
//                  FieldByName('codi_col').AsInteger:= iNovoCodigo;
//               end
//               else
//                  Exit;
//            end
//            else
//            begin
//               if (Acesso(cUsuario, 6, 'alteracao') = 1) then begin
//               sMensagem:= 'Registro alterado corretamente';
//                  cOperacao:= 'A';
//                  Edit;
//                  sbGravar.Caption:= 'Gravar';
//               end
//               else
//                  Exit;
//            end;
//            FieldByName('nome_col').AsString := edNome.Text;
//            FieldByName('esco_col').AsString := edEntidade.Text;
//            FieldByName('conc_col').AsString := edConclusao.Text;
//
//            FieldByName('educ_col').AsInteger:= BuscaCodigoTabelaCombos(6,cbEducacao.Text);
//            FieldByName('expe_col').AsInteger:= BuscaCodigoTabelaCombos(7,cbExperiencia.Text);
//            FieldByName('proc_col').AsString := dblProcessos.KeyValue;
//
//            with dm.cdsAuxiliar do
//            begin
//               Active:= False;
//               CommandText:= ' SELECT codi_fun FROM funcoes' +
//                             ' WHERE desc_fun = ' + '''' + cbFuncao.Text + '''';
//               Active:= True;
//               iFuncao:= FieldByName('codi_fun').AsInteger;
//               dm.cdsColaboradores.FieldByName('func_col').AsInteger:= FieldByName('codi_fun').AsInteger;
//            end;
//            Post;
//            Auditoria('COLABORADORES',edNome.Text,cOperacao, '');
//            Application.MessageBox(PChar(sMensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
//
//         end;
//         VerificaGestor;
//         if cOperacao = 'I' then begin
//            GravaAtributos(iNovoCodigo, iFuncao);
//         end;
//         LimpaCampos;
//      end;
//      dm.cdsAuxiliar.Active:= False;
//   except
//      on E:Exception do begin
//         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
//      end;
//   end; // try
   edNome.SetFocus;
end;

procedure Tt_Colaboradores.sbImprimirClick(Sender: TObject);
begin
   with cdsReport do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col, func_col, desc_fun, educ_col, TC.valo_com as Educacao,' +
                    ' expe_col, TC1.valo_com as Experiencia,' +
                    ' esco_col, conc_col, obs_col, proc_col, P.nome_pro, IF(col_status = 1,"ATIVO","INATIVO") as Status' +
                    ' FROM Colaboradores' +
                    ' INNER JOIN tabela_combos TC ON TC.codi_com = educ_col and TC.tipo_com = 6' +
                    ' INNER JOIN tabela_combos TC1 ON TC1.codi_com = expe_col and TC1.tipo_com = 7' +
                    ' INNER JOIN funcoes F ON F.codi_fun = func_col' +
                    ' INNER JOIN processos P ON P.codi_pro = proc_col' +
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   if not cdsReport.IsEmpty then begin
//      with dm.frxReport1 do begin
//          LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Colaboradores.fr3');
//          ShowReport;
//      end;
      Auditoria('COLABORADORES','','R', '');
   end
   else begin
      Application.MessageBox('Não há dados para imprimir', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
   end;
end;

procedure Tt_Colaboradores.sbNovoClick(Sender: TObject);
begin
   LimpaCampos;
   sbGravar.Caption:= 'Gravar';
   edNome.SetFocus;
   sbCurriculum.Enabled:= False;
   sbAtributos.Enabled := False;
   btnEducacao.Enabled := False;
end;

procedure Tt_Colaboradores.Atualiza;
var
   sCodCol: string;
begin
   sCodCol:= dm.cdsColaboradorescodi_col.AsString;

   with dm.cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col, func_col, educ_col, expe_col, ' +
                    ' esco_col, conc_col, proc_col, obs_col, col_status '+
                    ' FROM colaboradores '+
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   if AllTrim(sCodCol) <> EmptyStr then begin
      dm.cdsColaboradores.Locate('codi_col',sCodCol,[])
   end;
end;

procedure Tt_Colaboradores.btnEducacaoClick(Sender: TObject);
begin
   FormColabEducacao:= TFormColabEducacao.Create(nil);
   FormColabEducacao.ShowModal;
   FormColabEducacao.Release;
end;

procedure Tt_Colaboradores.btnGeraAtributosClick(Sender: TObject);
var
   iCodColab: Integer;
   iCodFuncao: Integer;
begin
   if Application.MessageBox('Este procedimento vai redefinir os atributos do colaborador, zerando suas notas de habilidades e as datas dos treinamentos. Confirma ?',
     'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      try
         iCodColab:= dm.cdsColaboradorescodi_col.AsInteger;
         iCodFuncao:= dm.cdsColaboradoresfunc_col.AsInteger;

         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM colab_habilidades '+
                          ' WHERE codi_col = ' + IntToStr(iCodColab);
            Execute;
         end;
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM colab_treinamentos '+
                          ' WHERE codi_col = ' + IntToStr(iCodColab);
            Execute;
         end;

         GravaAtributos(iCodColab, iCodFuncao);

         Application.MessageBox('Atributos redefinidos com sucesso.','Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            Application.MessageBox(PChar('Não foi possível gerar os atributos' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
         end;
      end;
   end;
end;

procedure Tt_Colaboradores.cbStatusCloseUp(Sender: TObject);
begin
   VerificarColaborador();
end;

procedure Tt_Colaboradores.dbgColaboradoresCellClick(Column: TColumn);
begin
   PreencheCampos;
   sbCurriculum.Enabled:= True;
   sbAtributos.Enabled := True;
   btnEducacao.Enabled := True;
end;

procedure Tt_Colaboradores.dbgColaboradoresKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure Tt_Colaboradores.dbgColaboradoresTitleClick(Column: TColumn);
var
//  cCampo: String;
  i: integer;
begin
//  cCampo:= Column.FieldName;
//  with dm.cdsColaboradores do
//  begin
//    Active:= False;
//    CommandText:= ' SELECT codi_col, nome_col, func_col, educ_col, expe_col, esco_col, conc_col from colaboradores '+
//                  ' Order By '+ cCampo;
//    Active:= True;
//  end;

   // Cria os indices do dbgrid com todos os campos
   dm.cdsColaboradores.IndexDefs.Clear;
   for i := 0 to dm.cdsColaboradores.FieldCount - 1 do begin
     dm.cdsColaboradores.IndexDefs.Add('a' + dm.cdsColaboradores.Fields[i].FieldName,
       dm.cdsColaboradores.Fields[i].FieldName, []);
   end;

   dm.cdsColaboradores.IndexName := 'a' + column.FieldName;

   PreencheCampos;
end;

procedure Tt_Colaboradores.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Colaboradores.FormShow(Sender: TObject);
begin
   sbCurriculum.Enabled:= False;
   sbAtributos.Enabled := False;
   btnEducacao.Enabled := False;

   dm.cdsColaboradores.Active:= False;

   Atualiza;

   MontaCombosGeral(6,cbEducacao);
   MontaCombosGeral(7,cbExperiencia);

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT desc_fun FROM funcoes '+
                    ' ORDER BY codi_fun';
      Active:= True;
      First;

      cbFuncao.Items.Clear;
      while not Eof do begin
         cbFuncao.Items.Add(FieldByName('desc_fun').AsString);
         Next;
      end;
   end;

   sbCurriculum.Hint:= 'Clique para cadastrar o '+ #13+ 'histórico profissional do colaborador';
   sbCurriculum.ShowHint:= True;
   sbAtributos.Hint:= 'Clique para cadastrar os '+ #13+ 'treinamentos e habilidades do colaborador';
   sbAtributos.ShowHint:= True;
   btnEducacao.Hint:= 'Clique para cadastrar o '+ #13+ 'histórico de educação do colaborador';
   btnEducacao.ShowHint:= True;

   dm.cdsProcessos.Active:= True;

   sbNovoClick(Self);
end;

procedure Tt_Colaboradores.LimpaCampos;
begin
   edNome.Clear;
   cbEducacao.Text   := '';
   cbExperiencia.Text:= '';
   cbFuncao.Text     := '';
   edConclusao.Clear;
   edEntidade.Clear;
   dblProcessos.KeyValue:= -1;
   mmoObs.Clear;
   cbStatus.ItemIndex:= 1;

   sbExcluir.Enabled:= False;
   sbGravar.Caption:= 'Gravar' ;
end;

procedure Tt_Colaboradores.mmoObsKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure Tt_Colaboradores.PreencheCampos;
begin
   if dm.cdsColaboradores.RecordCount > 0 then begin
      edNome.Text:= dm.cdsColaboradores.FieldByName('nome_col').AsString;

      CarregaCombosGeral(6,cbEducacao,dm.cdsColaboradores,'educ_col');
      CarregaCombosGeral(7,cbExperiencia,dm.cdsColaboradores,'expe_col');

      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' Select desc_fun from funcoes' +
                       ' where codi_fun = ' + QuotedStr(dm.cdsColaboradores.FieldByName('func_col').AsString);
         Active:= True;
         cbFuncao.Text:= FieldByName('desc_fun').AsString;
      end;

      edConclusao.Text     := dm.cdsColaboradores.FieldByName('conc_col').AsString;
      edEntidade.Text      := dm.cdsColaboradores.FieldByName('esco_col').AsString;
      dblProcessos.KeyValue:= dm.cdsColaboradores.FieldByName('proc_col').AsInteger;
      mmoObs.Text          := dm.cdsColaboradores.FieldByName('obs_col').AsString;
      if dm.cdsColaboradores.FieldByName('col_status').AsString <> '' then begin
         cbStatus.ItemIndex:= dm.cdsColaboradores.FieldByName('col_status').AsInteger;
      end
      else begin
         cbStatus.ItemIndex:= -1;
      end;
      
      sbGravar.Caption:= 'Alterar';
      sbExcluir.Enabled:= True;
   end;
end;

procedure Tt_Colaboradores.sbAtributosClick(Sender: TObject);
begin
   t_DefineAtributos:= Tt_DefineAtributos.Create(nil);
   t_DefineAtributos.lbNomeColaborador.Caption:= dm.cdsColaboradoresnome_col.AsString;
   t_DefineAtributos.ShowModal;
   t_DefineAtributos.Release;
end;

procedure Tt_Colaboradores.sbCurriculumClick(Sender: TObject);
begin
   t_HistProf:= Tt_HistProf.Create(nil);
   t_HistProf.ShowModal;
   t_HistProf.Release;
end;

procedure Tt_Colaboradores.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

end.
