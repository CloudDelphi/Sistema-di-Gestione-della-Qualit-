unit frm_CadCronograma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI, RXSpin, Spin;

type
  TFormCadCronograma = class(TForm)
    pnl1: TPanel;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    zqryCronograma: TZQuery;
    dspCronograma: TDataSetProvider;
    cdsCronograma: TClientDataSet;
    dsCronograma: TDataSource;
    frxReport1: TfrxReport;
    frxDBCronograma: TfrxDBDataset;
    pnlNavegacao: TPanel;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    btnProximo: TBitBtn;
    btnAnterior: TBitBtn;
    btnSair: TBitBtn;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnNovo: TBitBtn;
    pgcCrono: TPageControl;
    tsCadastro: TTabSheet;
    lbl4: TLabel;
    lbl14: TLabel;
    edtRequisito: TEdit;
    edtTelaDestra: TEdit;
    tsPesquisa: TTabSheet;
    lbl9: TLabel;
    lbl10: TLabel;
    edtValor: TEdit;
    cbbCampo: TComboBox;
    dbgCronograma: TDBGrid;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    btnSairImp: TBitBtn;
    pnl3: TPanel;
    dtPrevista: TDateEdit;
    lbl34: TLabel;
    dtRealizada: TDateEdit;
    lbl6: TLabel;
    dblResponsavel: TDBLookupComboBox;
    lbl8: TLabel;
    zqryResp: TZQuery;
    dspResp: TDataSetProvider;
    cdsResp: TClientDataSet;
    dsResp: TDataSource;
    ImageList: TImageList;
    mmoAtividade: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    edtStatus: TEdit;
    lbl3: TLabel;
    mmoResultado: TMemo;
    grpResp: TGroupBox;
    dblResp: TDBLookupComboBox;
    chkTodosResp: TCheckBox;
    cdsImprimircro_codigo: TIntegerField;
    cdsImprimircro_requisito: TWideStringField;
    cdsImprimircro_tela_destra: TWideStringField;
    cdsImprimircro_atividade: TWideMemoField;
    cdsImprimircro_responsavel: TIntegerField;
    cdsImprimircro_data_prevista: TDateTimeField;
    cdsImprimircro_data_realizada: TDateTimeField;
    cdsImprimircro_status: TWideStringField;
    cdsImprimircro_resultado: TWideMemoField;
    cdsImprimirresponsavel: TWideStringField;
    cdsImprimirstatus: TWideStringField;
    rgTipoRel: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure PreencherCampos;
    procedure Botoes(flag: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbgCronogramaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgCronogramaCellClick(Column: TColumn);
    procedure dbgCronogramaDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure edtValorChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure pgcCronoChange(Sender: TObject);
    procedure dbgItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure mmoAtividadeExit(Sender: TObject);
    procedure mmoAtividadeKeyPress(Sender: TObject; var Key: Char);
    procedure mmoResultadoExit(Sender: TObject);
    procedure CalcularStatus();
    procedure chkTodosRespClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: Char;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadCronograma: TFormCadCronograma;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormCadCronograma.AtualizarDados;
begin
   with cdsCronograma do begin
      Active:= False;
      CommandText:= ' SELECT C.cro_codigo, C.cro_requisito, C.cro_tela_destra, C.cro_atividade, C.cro_responsavel,' +
                    ' CAST(C.cro_atividade as Character Varying(80)) as Atividade, ' +
                    '        CO.nome_col as Responsavel, C.cro_data_prevista, C.cro_data_realizada, C.cro_resultado,' +
                    '        CAST(CASE WHEN C.cro_data_prevista ISNULL THEN ' + QuotedStr('NÃO PLANEJADO') +
                    '             WHEN C.cro_data_prevista > ' + ArrumaDataSQL(Date()) + ' AND C.cro_data_realizada ISNULL THEN ' + QuotedStr('ATIVIDADE NO PRAZO') +
                    '        WHEN C.cro_data_prevista <= ' + ArrumaDataSQL(Date()) + ' AND C.cro_data_realizada ISNULL THEN ' + QuotedStr('ATIVIDADE FORA DO PRAZO') +
                    '             WHEN C.cro_data_realizada NOTNULL THEN ' + QuotedStr('ATIVIDADE REALIZADA') +
                    '        END as character varying(25)) as Status' +
                    ' FROM cronograma C' +
                    ' LEFT JOIN colaboradores CO on CO.codi_col = C.cro_responsavel' +
                    ' ORDER BY C.cro_codigo';
      Active:= True;
   end;

   with cdsResp do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col ' +
                    ' FROM colaboradores' +
                    ' ORDER BY nome_col';
      Active:= True;
   end;


//   if AllTrim(edtCodigo.Text) <> EmptyStr then begin
//      cdsManut.Locate('man_codigo', edtCodigo.Text,[])
//   end;
end;

procedure TFormCadCronograma.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
   btnImprimir.Enabled:= Flag;

   if cdsCronograma.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadCronograma.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 60, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, False, Self, 1);
      Botoes(False);
   end;
end;

procedure TFormCadCronograma.btnCancelarClick(Sender: TObject);
begin
   LimparCampos(Self);
   PreencherCampos;
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormCadCronograma.btnExcluirClick(Sender: TObject);
var
   sCodCro  : string;
   sAtividade: string;
begin
   if (Acesso(cUsuario, 60, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do registro ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         sCodCro   := cdsCronograma.FieldByName('cro_codigo').AsString;
         sAtividade:= Copy(cdsCronograma.FieldByName('cro_atividade').AsString, 1, 180);

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM cronograma' +
                          ' WHERE cro_codigo = ' + sCodCro;
            Execute;
         end;

         Auditoria('CRONOGRAMA', 'Cod ' + sCodCro + '-' + sAtividade, 'E','');
         LimparCampos(Self);
         AtualizarDados();
         PreencherCampos();
      end;
      Botoes(True);
   end;
end;

procedure TFormCadCronograma.btnGravarClick(Sender: TObject);
begin
   if ValidarDados() then begin
      try
         with cdsGravar do begin
            Active:= False;
            if cOperacao = 'I' then begin
               CommandText:= ' INSERT INTO cronograma' +
                             ' (cro_codigo, cro_requisito, cro_tela_destra, cro_atividade, cro_responsavel,' +
                             ' cro_data_prevista, cro_data_realizada, cro_resultado)' +
                             ' VALUES(' +
                             BuscarNovoCodigo('cronograma', 'cro_codigo') + ',' +
                             QuotedStr(edtRequisito.Text) + ',' +
                             QuotedStr(edtTelaDestra.Text) + ',' +
                             QuotedStr(mmoAtividade.Text) + ',' +
                             Nulo(dblResponsavel.KeyValue, 'I') + ',' +
                             ArrumaDataSQL(dtPrevista.Date) + ',' +
                             ArrumaDataSQL(dtRealizada.Date) + ',' +
                             QuotedStr(mmoResultado.Text) +
                             ')';
               Execute;

            end
            else begin
               CommandText:= ' UPDATE cronograma SET' +
                             ' cro_requisito = ' + QuotedStr(edtRequisito.Text) + ',' +
                             ' cro_tela_destra = ' + QuotedStr(edtTelaDestra.Text) + ',' +
                             ' cro_atividade = ' + QuotedStr(mmoAtividade.Text) + ',' +
                             ' cro_responsavel = ' + Nulo(dblResponsavel.KeyValue, 'I') + ',' +
                             ' cro_data_prevista = ' + ArrumaDataSQL(dtPrevista.Date) + ',' +
                             ' cro_data_realizada = ' + ArrumaDataSQL(dtRealizada.Date) + ',' +
                             ' cro_resultado = ' + QuotedStr(mmoResultado.Text) +
                             ' WHERE cro_codigo = ' + cdsCronograma.FieldByName('cro_codigo').AsString;
               Execute;
            end;
         end;

         Auditoria('CRONOGRAMA', 'Req ' + edtRequisito.Text + '-' + Copy(mmoAtividade.Text, 1, 80), cOperacao,'');
         AtualizarDados();
         CalcularStatus();

         HabilitarCampos(False, False, Self, 1);
         Botoes(True);
         Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E:Exception do begin
            MostrarErro('Erro ao gravar dados', E.Message, Self.Name);
         end;
      end;
   end;
end;

procedure TFormCadCronograma.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormCadCronograma.btnImprimirClick(Sender: TObject);
begin
   AbrePanel(pnlImprimir, Self);
   rgTipoRel.ItemIndex := 0;
   chkTodosResp.Checked:= True
end;

procedure TFormCadCronograma.btnNovoClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 60, 'cadastro') = 1) then begin
      cOperacao:= 'I';
      LimparCampos(Self);
      HabilitarCampos(True, False, Self, 1);
      Botoes(False);
      btnExcluir.Enabled := False;
      btnAlterar.Enabled := False;
//      edtCodigo.Text:= BuscarNovoCodigo('manut', 'man_codigo');
      TryFocus(edtRequisito);
   end;
end;

procedure TFormCadCronograma.btnPrimeiroClick(Sender: TObject);
begin
   cdsCronograma.First;
   PreencherCampos();
end;

procedure TFormCadCronograma.btnAnteriorClick(Sender: TObject);
begin
   cdsCronograma.Prior;
   PreencherCampos();
end;

procedure TFormCadCronograma.btnProximoClick(Sender: TObject);
begin
   cdsCronograma.Next;
   PreencherCampos();
end;

procedure TFormCadCronograma.btnUltimoClick(Sender: TObject);
begin
   cdsCronograma.Last;
   PreencherCampos();
end;

procedure TFormCadCronograma.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadCronograma.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible:= False;
end;

procedure TFormCadCronograma.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormCadCronograma.CalcularStatus;
begin
   if dtPrevista.Text = '  /  /    ' then begin
      edtStatus.Text := 'NÃO PLANEJADO';
   end
   else if (dtPrevista.Date > Date())
      AND (dtRealizada.Text = '  /  /    ') then begin
      edtStatus.Text := 'ATIVIDADE NO PRAZO';
   end
   else if (dtPrevista.Date <= Date())
      AND (dtRealizada.Text = '  /  /    ') then begin
      edtStatus.Text := 'ATIVIDADE FORA DO PRAZO';
   end
   else if dtRealizada.Text <> '  /  /    ' then begin
      edtStatus.Text := 'ATIVIDADE REALIZADA';
   end;

//   with cdsCronograma do begin
//      if FieldByName('cro_data_prevista').AsString = '' then begin
//         edtStatus.Text := 'NÃO PLANEJADO';
//      end
//      else if (FieldByName('cro_data_prevista').AsDateTime > Date())
//         AND (FieldByName('cro_data_realizada').AsString = '') then begin
//         edtStatus.Text := 'ATIVIDADE NO PRAZO';
//      end
//      else if (FieldByName('cro_data_prevista').AsDateTime <= Date())
//         AND (FieldByName('cro_data_realizada').AsString = '') then begin
//         edtStatus.Text := 'ATIVIDADE FORA DO PRAZO';
//      end
//      else if FieldByName('cro_data_realizada').AsString <> '' then begin
//         edtStatus.Text := 'ATIVIDADE REALIZADA';
//      end;
//   end;
end;

procedure TFormCadCronograma.chkTodosRespClick(Sender: TObject);
begin
   dblResp.Enabled:= not chkTodosResp.Checked;
end;

procedure TFormCadCronograma.ControlarAbas;
var
   sCodigo: string;
begin
   if pgcCrono.TabIndex = 0 then begin  // Cadastro
      Botoes(True);
      PreencherCampos();
   end
   else begin // Pesquisa
      btnNovo.Enabled    := False;
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled:= False;
      btnAlterar.Enabled := False;

      sCodigo:= cdsCronograma.FieldByName('cro_codigo').AsString;
      cdsCronograma.Filtered:= False;
      if sCodigo <> EmptyStr then begin
         cdsCronograma.Locate('cro_codigo', sCodigo, []);
      end;

      case pgcCrono.TabIndex of
         3: begin
            btnImprimir.Enabled:= False;
            edtValor.Clear;
            TryFocus(edtValor);
         end;
      end;
   end;
end;

procedure TFormCadCronograma.dbgCronogramaCellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadCronograma.dbgCronogramaDblClick(Sender: TObject);
var
   sCodigo: string;
begin
   sCodigo:= cdsCronograma.FieldByName('cro_codigo').AsString;
   cdsCronograma.Filtered:= False;
   if sCodigo <> EmptyStr then begin
      cdsCronograma.Locate('cro_codigo', sCodigo, []);
   end;

   PreencherCampos;
   pgcCrono.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormCadCronograma.dbgItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//   if cdsItens.RecordCount > 0 then begin
//      // Pinta CheckBox
//      if Column.Field = cdsItens.FieldByName('ite_verificado') then begin
//         dbgItens.Canvas.FillRect(Rect);
//
//         if cdsItens.FieldByName('ite_verificado').AsInteger = 0 then begin
//            ImageList.Draw(dbgItens.Canvas,Rect.Left + 22,Rect.Top + 1,1)
//         end
//         else begin
//            ImageList.Draw(dbgItens.Canvas,Rect.Left + 22,Rect.Top + 1,2);
//         end;
//      end;
//
//      if Column.Field = cdsItens.FieldByName('ite_obs') then begin
//         dbgItens.Canvas.FillRect(Rect);
//
//         if cdsItens.FieldByName('ite_obs').AsString <> '' then begin
//            ImageList.Draw(dbgItens.Canvas,Rect.Left + 18,Rect.Top + 1,3)
//         end;
//      end;
//   end;
end;

procedure TFormCadCronograma.dbgCronogramaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos;
end;

procedure TFormCadCronograma.edtValorChange(Sender: TObject);
begin
   if AllTrim(edtValor.Text) <> EmptyStr then begin
      case cbbCampo.ItemIndex of
         0: cdsCronograma.Filter:= 'cro_requisito LIKE ' + QuotedStr('%' + edtValor.Text + '%');
         1: cdsCronograma.Filter:= 'atividade LIKE ' + QuotedStr('%' + edtValor.Text + '%');
      end;

      cdsCronograma.Filtered:= True;
   end
   else begin
      cdsCronograma.Filtered:= False;
   end;

   dbgCronograma.Width:= dbgCronograma.Width + 1;
   dbgCronograma.Width:= dbgCronograma.Width - 1;
end;

procedure TFormCadCronograma.FormShow(Sender: TObject);
begin
   pgcCrono.TabIndex:= 0;
   AtualizarDados();
   PreencherCampos();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
   pnlImprimir.Visible:= False;
end;

procedure TFormCadCronograma.mmoAtividadeExit(Sender: TObject);
begin
   mmoAtividade.Text:= AcertaUpper(mmoAtividade.Text);
end;

procedure TFormCadCronograma.mmoAtividadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadCronograma.mmoResultadoExit(Sender: TObject);
begin
   mmoResultado.Text:= AcertaUpper(mmoResultado.Text);
end;

procedure TFormCadCronograma.pgcCronoChange(Sender: TObject);
begin
   ControlarAbas();
end;

procedure TFormCadCronograma.PreencherCampos;
begin
   case pgcCrono.TabIndex of
      0: begin // Cadastro
         with cdsCronograma do begin
            edtRequisito.Text  := FieldByName('cro_requisito').AsString;
            edtTelaDestra.Text := FieldByName('cro_tela_destra').AsString;
            mmoAtividade.Text  := FieldByName('cro_atividade').AsString;
            dtPrevista.Date    := FieldByName('cro_data_prevista').AsDateTime;
            dtRealizada.Date   := FieldByName('cro_data_realizada').AsDateTime;
//            edtStatus.Text     := FieldByName('status').AsString;
            mmoResultado.Text  := FieldByName('cro_resultado').AsString;

            if FieldByName('cro_responsavel').AsString <> EmptyStr then begin
               dblResponsavel.KeyValue:= FieldByName('cro_responsavel').AsString;
            end
            else begin
               dblResponsavel.KeyValue:= Null;
            end;

            CalcularStatus();
         end;
      end;
   end;
end;

function TFormCadCronograma.ValidarDados(): Boolean;
begin
   if edtRequisito.Text = EmptyStr then begin
      Application.MessageBox('Campo Requisito é obrigatório. Se não for aplicável, digite N.A.', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtRequisito);
      Result:= False;
      Exit;
   end;

   if edtTelaDestra.Text = EmptyStr then begin
      Application.MessageBox('Campo Requisito é obrigatório. Se não for aplicável, digite N.A.', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(edtRequisito);
      Result:= False;
      Exit;
   end;

   if mmoAtividade.Text = EmptyStr then begin
      Application.MessageBox('Campo Atividade é obrigatório.', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoAtividade);
      Result:= False;
      Exit;
   end;

   if (mmoResultado.Text = EmptyStr) and (dtRealizada.Text <> '  /  /    ') then begin
      Application.MessageBox('Campo Resultado Alcançado é obrigatório quando a atividade tem data realizada.', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mmoResultado);
      Result:= False;
      Exit;
   end;

   if (mmoResultado.Text <> EmptyStr) and (dtRealizada.Text = '  /  /    ') then begin
      Application.MessageBox('Campo Data Realizada é obrigatório quando a atividade tem resultado alcançado.', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dtRealizada);
      Result:= False;
      Exit;
   end;

   Result:= True;
end;

procedure TFormCadCronograma.Impressao(tipoImp: string);
var
   sCampoOrdem: string;
   sWhere     : string;
begin
   sWhere:= '';
   if rgTipoRel.ItemIndex = 1 then begin // Atividades Realizadas
      sWhere:= ' WHERE C.cro_data_realizada NOTNULL ';
   end;

   if (chkTodosResp.Checked = False) and (dblResp.KeyValue <> null)
       and (dblResp.KeyValue <> -1) then begin
       if sWhere = '' then begin
          sWhere:= ' WHERE cro_responsavel = ' + IntToStr(dblResp.KeyValue);
       end
       else begin
          sWhere:= sWhere + ' AND cro_responsavel = ' + IntToStr(dblResp.KeyValue);
       end;
   end;

   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT cro_codigo, cro_requisito, cro_tela_destra, cro_atividade, cro_responsavel,' +
                    '        cro_data_prevista, cro_data_realizada, cro_status, cro_resultado,' +
                    '        CO.nome_col as Responsavel,' +
                    '        CAST(CASE WHEN C.cro_data_prevista ISNULL THEN ' + QuotedStr('NÃO PLANEJADO') +
                    '             WHEN C.cro_data_prevista > ' + ArrumaDataSQL(Date()) + ' AND C.cro_data_realizada ISNULL THEN ' + QuotedStr('ATIVIDADE NO PRAZO') +
                    '             WHEN C.cro_data_prevista <= ' + ArrumaDataSQL(Date()) + ' AND C.cro_data_realizada ISNULL THEN ' + QuotedStr('ATIVIDADE FORA DO PRAZO') +
                    '             WHEN C.cro_data_realizada NOTNULL THEN ' + QuotedStr('ATIVIDADE REALIZADA') +
                    '        END as character varying(25)) as Status' +
                    ' FROM cronograma C' +
                    ' LEFT JOIN Colaboradores CO ON CO.codi_col = cro_responsavel' +
                    sWhere +
                    ' ORDER BY cro_codigo';
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para imprimir','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if rgTipoRel.ItemIndex = 0 then begin
      Imprimir('rel_Cronograma', frxReport1, tipoImp);
   end
   else begin
      Imprimir('rel_CronogramaRealizado', frxReport1, tipoImp);
   end;
end;

end.
