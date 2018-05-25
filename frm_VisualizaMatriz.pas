unit frm_VisualizaMatriz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, ExtCtrls, FMTBcd, DBClient, Provider, DB,
  SqlExpr, Grids, DBGrids, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  frxClass, frxDBSet, ShellAPI, Mask, RXSpin;

type
  TFormVisualizaMatriz = class(TForm)
    lb1: TLabel;
    dblColaborador: TDBLookupComboBox;
    pnl1: TPanel;
    mResponsabilidades: TMemo;
    edFuncao: TEdit;
    lb2: TLabel;
    shp6: TShape;
    lbHabilidades: TLabel;
    shp7: TShape;
    lbExigido1: TLabel;
    shp8: TShape;
    lbComprovado1: TLabel;
    shp9: TShape;
    lbEducacao: TLabel;
    shp10: TShape;
    lbExigido2: TLabel;
    shp11: TShape;
    lbComprovado2: TLabel;
    shp12: TShape;
    lbExperiencia: TLabel;
    shp15: TShape;
    edEducacaoEx: TEdit;
    edEducacaoCp: TEdit;
    shp16: TShape;
    edExperienciaEx: TEdit;
    edExperienciaCp: TEdit;
    dspAuxiliar: TDataSetProvider;
    cdsAux: TClientDataSet;
    sbExperiencia: TSpeedButton;
    sbTreinamentos: TSpeedButton;
    sbHabilidade: TSpeedButton;
    dbgTreinamentos: TDBGrid;
    shp1: TShape;
    lbTreinamentos: TLabel;
    dspTreinamentos: TDataSetProvider;
    cdsTreinamentos: TClientDataSet;
    dsTreinamentos: TDataSource;
    dbgHabilidades: TDBGrid;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    dsHabilidades: TDataSource;
    zqryAuxiliar: TZQuery;
    zqryTreinamentos: TZQuery;
    zqryHabilidades: TZQuery;
    cdsHabilidadescodi_col: TLargeintField;
    cdsHabilidadescodi_hab: TLargeintField;
    CdsHabilidadeshabilidade: TWideStringField;
    cdsHabilidadesnota: TFloatField;
    cdsHabilidadescodi_pla: TLargeintField;
    cdsHabilidadeshab_ano: TWideStringField;
    zqryImpressao: TZQuery;
    dspImpressao: TDataSetProvider;
    cdsImpressao: TClientDataSet;
    dsImpressao: TDataSource;
    frxdbHabilidades: TfrxDBDataset;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    rgOrdemImpressao: TRadioGroup;
    lbl1: TLabel;
    sbEducacao: TSpeedButton;
    shp2: TShape;
    lbl2: TLabel;
    sbVisualizar: TSpeedButton;
    btnImprimir: TBitBtn;
    lbl3: TLabel;
    frxReport1: TfrxReport;
    cdsImpressaocodi_col: TLargeintField;
    cdsImpressaonome_col: TWideStringField;
    cdsImpressaocodi_hab: TLargeintField;
    cdsImpressaohabilidade: TWideStringField;
    cdsImpressaonota: TFloatField;
    cdsImpressaocodi_pla: TLargeintField;
    cdsImpressaohab_ano: TWideStringField;
    cdsImpressaoacao: TWideMemoField;
    btnNotas: TBitBtn;
    lbl4: TLabel;
    pnl4: TPanel;
    btnSair: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    btnAvaliador: TBitBtn;
    spnAno: TRxSpinEdit;
    edtAdmissao: TEdit;
    lbl5: TLabel;
    lblValidacaoEdu: TLabel;
    lblValidacaoExp: TLabel;
    procedure dbgHabilidadesDblClick(Sender: TObject);
    procedure dbgHabilidadesCellClick(Column: TColumn);
    procedure dblColaboradorCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LimpaCampos;
    procedure FormCreate(Sender: TObject);
    procedure dbgTreinamentosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgTreinamentosDblClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure btnImpressoraClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cdsTreinamentosdtre_treGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnNotasClick(Sender: TObject);
    procedure cdsTreinamentosdtpr_treGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sbSairImpClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnAvaliadorClick(Sender: TObject);
    procedure lblValidacaoEduMouseEnter(Sender: TObject);
    procedure lblValidacaoExpMouseEnter(Sender: TObject);
    procedure lblValidacaoEduClick(Sender: TObject);
    procedure MostrarObsCol(sCodCol: string);
  private
    // Busca o valor padrão da nota das habiliadades do colaborador (Específico Destra Manager)
    function BuscaNotaHabilidade(): Real;
    { Private declarations }
  public
    { Public declarations }
    iCodColaborador: Integer;
  end;

var
  FormVisualizaMatriz: TFormVisualizaMatriz;

implementation

uses frm_dm, Funcoes, frm_Tartaruga, frm_PlanoAcaoMatriz, frm_Inicial, frm_CadNotasHabilidade,
  frm_CadColaboradorAval, frm_ObsColaborador;

{$R *.dfm}

procedure TFormVisualizaMatriz.btnAvaliadorClick(Sender: TObject);
begin
   AbrirForm(TFormCadAvaliador, FormCadAvaliador, 2);
end;

procedure TFormVisualizaMatriz.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormVisualizaMatriz.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);

   rgOrdemImpressao.ItemIndex:= 1;
   spnAno.Text         := FormatDateTime('yyyy',Date());
   spnAno.SelectAll;
end;

procedure TFormVisualizaMatriz.btnNotasClick(Sender: TObject);
begin
//   if Acesso(cUsuario, 25, 'acesso') = 1 then begin
      FormCadNotasHabilidade:= TFormCadNotasHabilidade.Create(nil);
      FormCadNotasHabilidade.edtCodigoCol.Text:= dblColaborador.KeyValue;
      FormCadNotasHabilidade.edtNomeHab.Text  := dblColaborador.Text;
      FormCadNotasHabilidade.ShowModal;
      FormCadNotasHabilidade.Release;
//   end;
end;

procedure TFormVisualizaMatriz.btnSairClick(Sender: TObject);
begin
   FormTartaruga.VerificaPendencias();
   Self.Close;
end;

procedure TFormVisualizaMatriz.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormVisualizaMatriz.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

function TFormVisualizaMatriz.BuscaNotaHabilidade: Real;
begin
   with cdsAux do begin
      Active:= False;
      CommandText:= 'SELECT nota_padrao_habilidade FROM Parametros';
      Active:= True;

      Result:= FieldByName('nota_padrao_habilidade').AsFloat;
   end;
end;

procedure TFormVisualizaMatriz.cdsTreinamentosdtpr_treGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (cdsTreinamentos.FieldByName('dtpr_tre').AsString = '30/12/1899') or
      (cdsTreinamentos.FieldByName('dtpr_tre').AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsTreinamentos.FieldByName('dtpr_tre').AsDateTime);
   end;
end;

procedure TFormVisualizaMatriz.cdsTreinamentosdtre_treGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
   if (cdsTreinamentos.FieldByName('dtre_tre').AsString = '30/12/1899') or
      (cdsTreinamentos.FieldByName('dtre_tre').AsString = '') then begin
      Text:= '';
   end
   else begin
      Text:= FormatDateTime('dd/mm/yyyy', cdsTreinamentos.FieldByName('dtre_tre').AsDateTime);
   end;
end;

procedure TFormVisualizaMatriz.dbgHabilidadesCellClick(Column: TColumn);
begin
   dbgTreinamentos.Refresh;
end;

procedure TFormVisualizaMatriz.dbgHabilidadesDblClick(Sender: TObject);
begin
   if cdsHabilidades.RecordCount > 0 then begin
      t_PlanoAcaoMatriz:= Tt_PlanoAcaoMatriz.Create(nil);
      t_PlanoAcaoMatriz.cTipo:= 'H';
      t_PlanoAcaoMatriz.iTela:= 1;
      t_PlanoAcaoMatriz.cAnoHab:= cdsHabilidadeshab_ano.AsString;
      t_PlanoAcaoMatriz.iCodPlano:= cdsHabilidadescodi_pla.AsInteger;
      t_PlanoAcaoMatriz.iCodHabTre:= cdsHabilidadescodi_hab.AsInteger;
      t_PlanoAcaoMatriz.lblCodigo.Caption:= dblColaborador.KeyValue;
      t_PlanoAcaoMatriz.mmoAcao.Text:= cdsHabilidadeshabilidade.AsString;
      t_PlanoAcaoMatriz.ShowModal;
      t_PlanoAcaoMatriz.Release;
   end;
end;

procedure TFormVisualizaMatriz.dbgTreinamentosDblClick(Sender: TObject);
begin
   if cdsTreinamentos.RecordCount > 0 then begin
      t_PlanoAcaoMatriz:= Tt_PlanoAcaoMatriz.Create(nil);
      t_PlanoAcaoMatriz.cTipo:= 'T';
      t_PlanoAcaoMatriz.iTela:= 1; // Matriz de Competências
      t_PlanoAcaoMatriz.iCodPlano:= cdsTreinamentos.FieldByName('codi_pla').AsInteger;
      t_PlanoAcaoMatriz.iCodHabTre:= cdsTreinamentos.FieldByName('codi_tre').AsInteger;
      t_PlanoAcaoMatriz.lblCodigo.Caption:= dblColaborador.KeyValue;
      t_PlanoAcaoMatriz.mmoAcao.Text:= cdsTreinamentos.FieldByName('desc_tre').AsString;
      t_PlanoAcaoMatriz.ShowModal;
      t_PlanoAcaoMatriz.Release;
   end;
end;

procedure TFormVisualizaMatriz.dbgTreinamentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//   if ArrumaDataSQL(cdsTreinamentos.FieldByName('dtre_tre').AsDateTime) = QuotedStr('1899-12-30') then begin
//      dbgTreinamentos.Canvas.Font.Color:= clRed;
//      dbgTreinamentos.DefaultDrawDataCell(Rect, dbgTreinamentos.columns[datacol].field, State);
//   end;

   // Chamado TT583
   if ((cdsTreinamentos.FieldByName('codi_pla').AsString = '') or
      (cdsTreinamentos.FieldByName('codi_pla').AsString = '0')) and
      (cdsTreinamentos.FieldByName('tre_eficacia').AsString = '0') then begin
      dbgTreinamentos.Canvas.Font.Color:= clRed;
      dbgTreinamentos.DefaultDrawDataCell(Rect, dbgTreinamentos.columns[datacol].field, State);
   end;
end;

procedure TFormVisualizaMatriz.dblColaboradorCloseUp(Sender: TObject);
var
   sCodFuncao: string;
   iEducacaoEx, iEducacaoCp: Integer;
   iExperienciaEx, iExperienciaCp: Integer;
   iHabilidade, iTreinamento: Boolean;
   sAno: string;
   iValidacao_educ_tre: Integer;
begin
   if dblColaborador.KeyValue = null then begin
      Exit;
   end;

   btnAvaliador.Enabled:= True;
   btnNotas.Enabled    := True;

   iCodColaborador:= dblColaborador.KeyValue;
   iEducacaoEx   := 0;
   iEducacaoCp   := 0;
   iExperienciaEx:= 0;
   iExperienciaCp:= 0;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_fun, desc_fun, resp_fun, expe_fun, educ_fun, ' +
                    ' expe_col, educ_col, col_admissao, col_validacao_educ_exp' +
                    ' FROM funcoes' +
                    ' INNER JOIN colaboradores on codi_fun = func_col' +
                    ' WHERE codi_col = ' + IntToStr(dblColaborador.KeyValue);
      Active:= True;

      edFuncao.Text          := FieldByName('desc_fun').AsString;
      mResponsabilidades.Text:= FieldByName('resp_fun').AsString;
      sCodFuncao             := FieldByName('codi_fun').AsString;
      edtAdmissao.Text       := FieldByName('col_admissao').AsString;
      iValidacao_educ_tre    := FieldByName('col_validacao_educ_exp').AsInteger;

      if iValidacao_educ_tre = 1 then begin
         lblValidacaoEdu.Caption:= 'Educação validada (Clique aqui para ver as observações)';
         lblValidacaoExp.Caption:= 'Experiência validada (Clique aqui para ver as observações)';
      end
      else begin
         lblValidacaoEdu.Caption:= '';
         lblValidacaoExp.Caption:= '';
      end;

      //**************** Experiência ******************
      if dm.cdsAuxiliar.FieldByName('expe_fun').AsString <> EmptyStr then begin
         with cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT codi_com, valo_com, orde_com' +
                          ' FROM tabela_combos' +
                          ' WHERE codi_com = ' + dm.cdsAuxiliar.FieldByName('expe_fun').AsString +
                          ' AND tipo_com = 7';
            Active:= True;

            edExperienciaEx.Text:= cdsAux.FieldByName('valo_com').AsString;
            iExperienciaEx      := cdsAux.FieldByName('orde_com').AsInteger;
         end
      end
      else begin
         edExperienciaCp.Text:= EmptyStr;
      end;

      if dm.cdsAuxiliar.FieldByName('expe_col').AsString <> EmptyStr then begin
         with cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT codi_com, valo_com, orde_com' +
                          ' FROM tabela_combos' +
                          ' WHERE codi_com = ' + dm.cdsAuxiliar.FieldByName('expe_col').AsString +
                          ' AND tipo_com = 7';
            Active:= True;

            edExperienciaCp.Text:= cdsAux.FieldByName('valo_com').AsString;
            iExperienciaCp      := cdsAux.FieldByName('orde_com').AsInteger;
         end
      end
      else begin
         edExperienciaCp.Text:= EmptyStr;
      end;

      // Verifica se a EXPERIÊNCIA Exigida é compatível com a Comprovada
      sbExperiencia.Enabled:= iExperienciaEx > iExperienciaCp;

//**************** Educação ******************
      if dm.cdsAuxiliar.FieldByName('educ_fun').AsString <> EmptyStr then begin

         with cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT codi_com, valo_com, orde_com' +
                          ' FROM tabela_combos' +
                          ' WHERE codi_com = ' + dm.cdsAuxiliar.FieldByName('educ_fun').AsString +
                          ' AND tipo_com = 6';
            Active:= True;

            edEducacaoEx.Text:= cdsAux.FieldByName('valo_com').AsString;
            iEducacaoEx      := cdsAux.FieldByName('orde_com').AsInteger;
         end
      end
      else begin
        edEducacaoEx.Text:= EmptyStr;
      end;

      if dm.cdsAuxiliar.FieldByName('educ_col').AsString <> EmptyStr then begin
         with cdsAux do begin
            Active:= False;
            CommandText:= ' SELECT codi_com, valo_com, orde_com' +
                          ' FROM tabela_combos' +
                          ' WHERE codi_com = ' + dm.cdsAuxiliar.FieldByName('educ_col').AsString +
                          ' AND tipo_com = 6';
            Active:= True;

            edEducacaoCp.Text:= cdsAux.FieldByName('valo_com').AsString;
            iEducacaoCp      := cdsAux.FieldByName('orde_com').AsInteger;
         end
      end
      else begin
        edEducacaoCp.Text:= EmptyStr;
      end;
       // Verifica se a EDUCAÇÃO Exigida é compatível com a Comprovada
       sbEducacao.Enabled:= iEducacaoEx < iEducacaoCP;
   end;

   // Inclui Habilidades à tela
   // Busca o último ano da habilidade cadastrada
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(hab_ano) as MaiorAno FROM colab_habilidades' +
                    ' WHERE codi_col = ' + IntToStr(dblColaborador.KeyValue);
      Active:= True;

      sAno:= FieldByName('MaiorAno').AsString;
   end;

   if Length(Alltrim(sAno)) > 0 then begin
      with cdsHabilidades do begin
         Active:= False;
         CommandText:= ' SELECT ch.codi_col, ch.codi_hab, h.desc_hab AS habilidade, ' +
                       ' ch.nota_hab AS nota, codi_pla, ch.hab_ano' +
                       ' FROM colab_habilidades ch' +
                       ' INNER JOIN habilidades h on h.codi_hab = ch.codi_hab' +
                       ' WHERE ch.codi_col = ' + IntToStr(dblColaborador.KeyValue) +
                       ' AND ch.hab_ano = ' + QuotedStr(sAno) +
                       ' ORDER BY h.desc_hab';
   //                     ' AND ch.hab_ano = ' + FormatDateTime('yyyy', Date());

    //     CommandText:= ' SELECT f.codi_fun, f.codi_hab, h.desc_hab' +
    //                   ' FROM funcoes_habilidades f' +
    //                   ' INNER JOIN funcoes fc on fc.codi_fun = f.codi_fun' +
    //                   ' INNER JOIN habilidades h on h.codi_hab = f.codi_hab' +
    //                   ' WHERE fc.codi_fun = ' + sCodFuncao;
         Active:= True;

         First;
   //      lsthabilidade.Clear;
   //      lstNotas.Clear;
         iHabilidade:= False;

   //      // Se a nota da habilidade for menor que a data estipulada na tela de parâmetros, gera inconsistência
   //      while not Eof do begin
   //         lsthabilidade.Items.Add(dm.cdsAuxiliar.FieldByName('habilidade').AsString);
   //         lstNotas.Items.Add(Direita(FormatFloat('0.00',dm.cdsAuxiliar.FieldByName('nota').AsFloat),15));
   //         if dm.cdsAuxiliar.FieldByName('nota').AsFloat < BuscaNotaHabilidade() then
   //            iHabilidade:= True; // Há Habilidades abaixo da nota mínima
   //         Next;
   //      end;

         sbHabilidade.Enabled:= iHabilidade;
      end;
   end
   else begin
      cdsHabilidades.Active:= False;
   end;

   // Inclui treinamentos à tela
   with cdsTreinamentos do begin
      Active:= False;
      CommandText:= ' SELECT CT.dtpr_tre, CT.dtre_tre, T.desc_tre, CT.codi_pla,' +
                    ' CT.codi_col, CT.codi_tre, CT.tipo_tre, T.tre_eficacia' +
                    ' FROM colab_treinamentos CT' +
                    ' INNER JOIN treinamentos T ON T.codi_tre = CT.codi_tre' +
                    ' WHERE CT.codi_col = ' + IntToStr(dblColaborador.KeyValue);

//      CommandText:= ' SELECT f.codi_fun, f.codi_tre, f.tipo_tre, t.desc_tre' +
//                    ' FROM funcoes_treinamentos f' +
//                    ' INNER JOIN funcoes fc on fc.codi_fun = f.codi_fun' +
//                    ' INNER JOIN treinamentos t on t.codi_tre = f.codi_tre' +
//                    ' WHERE fc.codi_fun = ' + sCodFuncao;
      Active:= True;

      First;
      sbTreinamentos.Enabled:= False;
      iTreinamento:= False;

      // Se existir data de treinamento menor que a data atual e não haver data realizada, gera pendência
//      while not Eof do begin
//         if AllTrim(dm.cdsAuxiliar.FieldByName('desc_tre').AsString) = EmptyStr then begin
//            sbTreinamentos.Enabled:= True;
//         end;
//         lstTreinamentos.Items.Add(dm.cdsAuxiliar.FieldByName('desc_tre').AsString);
//         lstPrevisao.Items.Add(dm.cdsAuxiliar.FieldByName('dtpr_tre').AsString);
//         lstRealizado.Items.Add(dm.cdsAuxiliar.FieldByName('dtre_tre').AsString);
////         if (dm.cdsAuxiliar.FieldByName('dtpr_tre').AsDateTime < Date())
////            and (dm.cdsAuxiliar.FieldByName('dtre_tre').AsString = EmptyStr) then begin
//            iTreinamento:= True;
////         end;
//
//         Next;
//      end;

      sbTreinamentos.Enabled:= iTreinamento;
   end;

   sbVisualizar.Enabled:= True;
end;

procedure TFormVisualizaMatriz.FormCreate(Sender: TObject);
begin
//   dbgHabilidades.ShowHint:= True;
//   dbgHabilidades.Hint:= '1 - Não Apto' + #13 +
//                         '2 - Não Apto' + #13 +
//                         '3 - Necessita de Atenção' + #13 +
//                         '4 - Apto' + #13 +
//                         '5 - Apto';
end;

procedure TFormVisualizaMatriz.FormShow(Sender: TObject);
begin
   LimpaCampos;
   lbTreinamentos.Width:= 433;
   lbHabilidades.Width:= 305;
   lbEducacao.Width   := 415;
   lbExperiencia.Width:= 364;

   lbExigido1.Width:= 175;
   lbExigido2.Width:= 151;
//   lbExigido3.Width:= 151;
//   lbExigido4.Width:= 237;

   lbComprovado1.Width:= 173;
   lbComprovado2.Width:= 151;
//   lbDtRealizado.Width:= 74;
//   lbComprovado3.Width:= 74;
//   lbComprovado4.Width:= 65;

   with dm.cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT * FROM colaboradores' +
                    ' WHERE proc_col = ' + FormTartaruga.lblCodigo.Caption +
                    ' AND col_status = 1' + // Ativos
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   btnAvaliador.Enabled:= False;
   btnNotas.Enabled    := False;

   lblValidacaoEdu.Caption:= '';
   lblValidacaoExp.Caption:= '';
end;

procedure TFormVisualizaMatriz.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
begin
   if rgOrdemImpressao.ItemIndex = 0 then begin // Nota
      sCampoOrdem:= 'nota_hab'
   end
   else begin // Nome Colaborador
      sCampoOrdem:= 'nome_col'
   end;

   with cdsImpressao do begin
      Active:= False;
      CommandText:= ' SELECT ch.codi_col, c.nome_col, ch.codi_hab, h.desc_hab habilidade, ' +
                    ' ch.nota_hab nota, ch.codi_pla, ch.hab_ano, ' +
                    ' CASE  ' +
                    '    when ch.nota_hab < 3 THEN ' + QuotedStr('Verificar se houve um plano de ação') +
                    ' ELSE ' + QuotedStr('Habilidade dentro da meta') +
                    ' END as Acao' +
                    ' FROM colab_habilidades ch' +
                    ' INNER JOIN habilidades h on h.codi_hab = ch.codi_hab' +
                    ' INNER JOIN colaboradores C ON C.codi_col = ch.codi_col' +
                    ' WHERE hab_ano = ' + QuotedStr(spnAno.Text) +
                    ' AND C.col_status = 1' + // Ativos
                    ' AND proc_col = ' + FormTartaruga.lblCodigo.Caption +
                    ' ORDER BY ' + sCampoOrdem;
      Active:= True;
   end;

   if cdsImpressao.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_Habilidades.fr3');
      if tipoImp = 'I' then begin
      // Imprimir direto
         PrepareReport;
//            PrintOptions.Printer:= 'CutePDF Writer';
         PrintOptions.ShowDialog:= False;
         Print;
      end
      else begin
         ShowReport;
      end;
   end;
end;

procedure TFormVisualizaMatriz.lblValidacaoEduClick(Sender: TObject);
begin
   MostrarObsCol(dblColaborador.KeyValue);
end;

procedure TFormVisualizaMatriz.lblValidacaoEduMouseEnter(Sender: TObject);
begin
   lblValidacaoEdu.Cursor:= crHandPoint;
end;

procedure TFormVisualizaMatriz.lblValidacaoExpMouseEnter(Sender: TObject);
begin
   lblValidacaoExp.Cursor:= crHandPoint;
end;

procedure TFormVisualizaMatriz.LimpaCampos;
begin
   dblColaborador.KeyValue:= -1;
   edFuncao.Clear;
   mResponsabilidades.Clear;
   edEducacaoEx.Clear;
   edEducacaoCp.Clear;
   edExperienciaEx.Clear;
   edExperienciaCp.Clear;
//   lstTreinamentos.Clear;
//   lstPrevisao.Clear;
//   lstRealizado.Clear;
//   lsthabilidade.Clear;
//   lstNotas.Clear;
   dblColaborador.SetFocus;
end;

procedure TFormVisualizaMatriz.MostrarObsCol(sCodCol: string);
begin
   FormObsColaborador:= TFormObsColaborador.Create(nil);
   FormObsColaborador.sCodigoCol:= sCodCol;
   FormObsColaborador.ShowModal;
   FormObsColaborador.Release;
end;

procedure TFormVisualizaMatriz.sbSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormVisualizaMatriz.sbVisualizarClick(Sender: TObject);
begin
   with cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT edu_anexo' +
                    ' FROM colab_educacao' +
                    ' WHERE edu_colaborador = ' + IntToStr(dblColaborador.KeyValue);
      Active:= True;

      if cdsAux.RecordCount > 0 then begin
//         if not FileExists(FieldByName('edu_anexo').AsString) then begin
//            Application.MessageBox(PChar('O arquivo não foi encontrado no caminho cadastrado. Verifique.' + #13 + FieldByName('edu_anexo').AsString), 'Aviso', MB_OK + MB_ICONWARNING);
//         end
//         else begin
//            try
//               ShellExecute(Application.Handle, nil, PChar(FieldByName('edu_anexo').AsString), nil, nil, SW_SHOWMAXIMIZED);
//            except
//               on E: Exception do begin
//                  Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
//               end;
//            end;
//         end;
         AbrirArquivo(FieldByName('edu_anexo').AsString, Self.Name);
      end
      else begin
         Application.MessageBox('Não há documento cadastrado. Verifique o cadastro de Colaboradores.', 'Aviso', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

end.
