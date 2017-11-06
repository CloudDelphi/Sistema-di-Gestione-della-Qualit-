unit frm_Calibracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, DBClient, Provider, SqlExpr, rxToolEdit, rxCurrEdit, Mask,
  StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls, ShellAPI,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormCalibracao = class(TForm)
    lbl5: TLabel;
    lbl6: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    pnl1: TPanel;
    sbGravar: TSpeedButton;
    sbBbtnSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbCancelar: TSpeedButton;
    dbgCalibracao: TDBGrid;
    dspCalibracao: TDataSetProvider;
    cdsCalibracao: TClientDataSet;
    cdsImprimir: TClientDataSet;
    dspImprimir: TDataSetProvider;
    dsCalibracao: TDataSource;
    lbl7: TLabel;
    edtCapacidade: TEdit;
    lbl8: TLabel;
    edtCriterio: TEdit;
    lbl9: TLabel;
    edtCertificado: TEdit;
    dtCalibracao: TDateEdit;
    lbl10: TLabel;
    dtProxima: TDateEdit;
    lbl11: TLabel;
    edtCodigo: TEdit;
    edtResolucao: TEdit;
    edtLocalizacao: TEdit;
    edtFaixa: TEdit;
    dspAuxiliar: TDataSetProvider;
    cdsAuxiliar: TClientDataSet;
    lbl15: TLabel;
    dblProcessos: TDBLookupComboBox;
    dspProcessos: TDataSetProvider;
    cdsProcessos: TClientDataSet;
    dsProcessos: TDataSource;
    cbFrequencia: TComboBox;
    cdsCalibracaoFrequencia: TStringField;
    lbl12: TLabel;
    edtArquivo: TEdit;
    sbBbtnArquivo: TSpeedButton;
    sbVisualizar: TSpeedButton;
    opd1: TOpenDialog;
    zqryCalibracao: TZQuery;
    zqryImprimir: TZQuery;
    zqryAuxiliar: TZQuery;
    zqryProcessos: TZQuery;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    dblEquipamentos: TDBLookupComboBox;
    zqryEquip: TZQuery;
    dspEquip: TDataSetProvider;
    cdsEquip: TClientDataSet;
    dsEquip: TDataSource;
    cdsCalibracaocali_capacidade: TWideStringField;
    cdsCalibracaocali_codigo: TLargeintField;
    cdsCalibracaocali_criterio: TWideStringField;
    cdsCalibracaocali_dataCalibracao: TDateTimeField;
    cdsCalibracaocali_equipamento: TWideStringField;
    cdsCalibracaocali_erro: TWideStringField;
    cdsCalibracaocali_faixa: TWideStringField;
    cdsCalibracaocali_frequencia: TWideStringField;
    cdsCalibracaocali_localizacao: TWideStringField;
    cdsCalibracaocali_numero: TWideStringField;
    cdsCalibracaocali_padroes: TMemoField;
    cdsCalibracaocali_parecer: TWideStringField;
    cdsCalibracaocali_proxCalibracao: TDateTimeField;
    cdsCalibracaocali_resolucao: TWideStringField;
    cdsCalibracaocali_certificado: TWideStringField;
    cdsCalibracaocali_processo: TLargeintField;
    cdsCalibracaocali_arquivo: TWideStringField;
    cdsEquipcodi_inf: TLargeintField;
    cdsEquipiden_inf: TWideStringField;
    cdsEquipdesc_inf: TWideStringField;
    cdsCalibracaodesc_inf: TWideStringField;
    cdsCalibracaocodi_inf: TLargeintField;
    procedure dbgCalibracaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbVisualizarClick(Sender: TObject);
    procedure sbBbtnArquivoClick(Sender: TObject);
    procedure cdsCalibracaoCalcFields(DataSet: TDataSet);
    procedure dbgCalibracaoCellClick(Column: TColumn);
    procedure dtCalibracaoExit(Sender: TObject);
    procedure cbFrequenciaCloseUp(Sender: TObject);
    procedure cdsCalibracaoAfterPost(DataSet: TDataSet);
    procedure mmoPadroesKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblProcessosCloseUp(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbBbtnSairClick(Sender: TObject);
    procedure LimpaCampos;
    procedure Botoes(Flag: Boolean);
    function ValidaCampos: Boolean;
    function ValorFrequencia(ValorCombo: Integer): string;
    function DiasFrequencia(ValorDias: string): Integer;
    procedure CalcularProximaCalibracao();
    procedure PreencherCampos;
    function BuscarNovoCodigo(): Integer;
    procedure dbgCalibracaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dblEquipamentosCloseUp(Sender: TObject);
    procedure AtualizarDados();
  private
    { Private declarations }
    cOperacao: Char;
  public
    { Public declarations }
  end;

var
  FormCalibracao: TFormCalibracao;

implementation

uses Funcoes, frm_Principal, frm_dm, frm_Inicial;

{$R *.dfm}

procedure TFormCalibracao.AtualizarDados;
begin
   with cdsCalibracao do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormCalibracao.Botoes(Flag: Boolean);
begin
   sbNovo.Enabled    := Flag;
   sbExcluir.Enabled := not Flag;
   sbGravar.Enabled  := not Flag;
   sbCancelar.Enabled:= not Flag;
   sbImprimir.Enabled:= Flag;
end;

function TFormCalibracao.BuscarNovoCodigo: Integer;
begin
   with cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(cali_codigo) as NovoCodigo' +
                    ' FROM calibracao';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= 1
      end
      else begin
         Result:= FieldByName('NovoCodigo').AsInteger + 1;
      end;
   end;
end;

procedure TFormCalibracao.CalcularProximaCalibracao;
begin
   dtProxima.Date:= dtCalibracao.Date + StrToInt(ValorFrequencia(cbFrequencia.ItemIndex));
end;

procedure TFormCalibracao.cbFrequenciaCloseUp(Sender: TObject);
begin
   if dtCalibracao.Text <> '  /  /    ' then begin
      CalcularProximaCalibracao();
   end;
end;

procedure TFormCalibracao.cdsCalibracaoAfterPost(DataSet: TDataSet);
begin
   cdsCalibracao.ApplyUpdates(0);
end;

procedure TFormCalibracao.cdsCalibracaoCalcFields(DataSet: TDataSet);
begin
   try
      case StrToInt(cdsCalibracaocali_frequencia.AsString) of
         1  : cdsCalibracaoFrequencia.AsString:= 'DIÁRIO';
         7  : cdsCalibracaoFrequencia.AsString:= 'SEMANAL';
         15 : cdsCalibracaoFrequencia.AsString:= 'QUINZENAL';
         30 : cdsCalibracaoFrequencia.AsString:= 'MENSAL';
         90 : cdsCalibracaoFrequencia.AsString:= 'TRIMESTRAL';
         180: cdsCalibracaoFrequencia.AsString:= 'SEMESTRAL';
         365: cdsCalibracaoFrequencia.AsString:= 'ANUAL';
         730: cdsCalibracaoFrequencia.AsString:= 'BIENAL';
        1095: cdsCalibracaoFrequencia.AsString:= 'TRIENAL';
        1460: cdsCalibracaoFrequencia.AsString:= 'QUADRIENAL';
        1825: cdsCalibracaoFrequencia.AsString:= 'QUINQUENAL';
      end;
   except
      cdsCalibracaoFrequencia.AsString:= cdsCalibracaocali_frequencia.AsString;
   end;
end;

procedure TFormCalibracao.dbgCalibracaoCellClick(Column: TColumn);
begin
   PreencherCampos();
   Botoes(False);
   sbGravar.Caption:= 'Alterar';
end;

procedure TFormCalibracao.dbgCalibracaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if cdsCalibracao.FieldByName('cali_proxCalibracao').AsDateTime < date() then begin
      dbgCalibracao.Canvas.Font.Color:= clRed;
      dbgCalibracao.DefaultDrawDataCell(Rect, dbgCalibracao.columns[datacol].field, State);
   end;
end;

procedure TFormCalibracao.dbgCalibracaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencherCampos();
end;

procedure TFormCalibracao.dblEquipamentosCloseUp(Sender: TObject);
begin
   edtCodigo.Text:= cdsEquip.FieldByName('iden_inf').AsString; // cdsEquipiden_inf.AsString;
end;

procedure TFormCalibracao.dblProcessosCloseUp(Sender: TObject);
begin
   //   ShowMessage(dblProcessos.KeyValue);
   LimpaCampos;
   if dblProcessos.KeyValue <> Null then begin
      with cdsEquip do begin
//         cbItem.Clear;
         Active:= False;
         CommandText:= ' SELECT codi_inf, iden_inf, desc_inf ' +
                       ' FROM infraestrutura '+
                       ' WHERE proc_inf = ' + QuotedStr(IntToStr(dblProcessos.KeyValue)) +
                       ' AND manu_inf = "SIM" ' +
                       ' AND tipo_inf = 5 ' +
                       ' ORDER BY desc_inf';
         Active:= True;

//         First;
//         while not Eof do begin
//            cbItem.Items.Add(FieldByName('desc_inf').AsString);
//            Next;
//         end;
      end;

//      cdsEquip.Active:= False;
//      cdsEquip.Active:= True;

      with cdsCalibracao do begin
         Active:= False;
         CommandText:= ' SELECT cali_capacidade, cali_codigo, cali_criterio, ' +
                       ' cali_dataCalibracao, cali_equipamento, cali_erro, cali_faixa, ' +
                       ' cali_frequencia, cali_localizacao, cali_numero, cali_padroes, ' +
                       ' cali_parecer, cali_proxCalibracao, cali_resolucao, cali_certificado, ' +
                       ' cali_processo, cali_arquivo, I.codi_inf, I.desc_inf' +
                       ' from calibracao C ' +
                       ' inner join infraestrutura I on I.iden_inf = C.cali_numero '+
                       ' WHERE cali_processo = ' + IntToStr(dblProcessos.KeyValue);
         Active:= True;
      end;
   end;
end;

procedure TFormCalibracao.dtCalibracaoExit(Sender: TObject);
begin
   CalcularProximaCalibracao();
end;

procedure TFormCalibracao.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure TFormCalibracao.FormShow(Sender: TObject);
begin
   cdsProcessos.Active:= False;
   cdsProcessos.Active:= True;

   Botoes(True);
end;

procedure TFormCalibracao.LimpaCampos;
begin
   edtCodigo.Clear;
//   cbItem.Text:= '';
//   cbItem.ItemIndex:= -1;
   dblEquipamentos.KeyValue:= -1;
   edtResolucao.Clear;
   edtLocalizacao.Clear;
   cbFrequencia.ItemIndex:= -1;
   edtFaixa.Clear;
   edtCapacidade.Clear;
   edtCriterio.Clear;
   edtCertificado.Clear;
   dtCalibracao.Clear;
   dtProxima.Clear;
   edtArquivo.Clear;
//   mmoPadroes.Clear;
//   edtErro.Clear;
//   cbParecer.ItemIndex:= 1;
   sbExcluir.Enabled:= False;
end;

procedure TFormCalibracao.mmoPadroesKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCalibracao.PreencherCampos;
begin
   edtCodigo.Text          := cdsCalibracaocali_numero.AsString;
//   cbItem.Text           := cdsCalibracaocali_equipamento.AsString;
   dblEquipamentos.KeyValue:= cdsCalibracaocodi_inf.AsString;
   edtResolucao.Text       := cdsCalibracaocali_resolucao.AsString;
   edtLocalizacao.Text     := cdsCalibracaocali_localizacao.AsString;
   cbFrequencia.ItemIndex  := DiasFrequencia(cdsCalibracaocali_frequencia.AsString);
   edtFaixa.Text           := cdsCalibracaocali_faixa.AsString;
   edtCapacidade.Text      := cdsCalibracaocali_capacidade.AsString;
   edtCriterio.Text        := cdsCalibracaocali_criterio.AsString;
   edtCertificado.Text     := cdsCalibracaocali_certificado.AsString;
   dtCalibracao.Date       := cdsCalibracaocali_dataCalibracao.AsDateTime;
   dtProxima.Date          := cdsCalibracaocali_proxCalibracao.AsDateTime;
   edtArquivo.Text         := cdsCalibracaocali_arquivo.AsString;

   if AllTrim(edtArquivo.Text) = EmptyStr then begin
      sbVisualizar.Enabled:= False;
   end
   else begin
      sbVisualizar.Enabled:= True;
   end;
end;

procedure TFormCalibracao.sbBbtnArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   if OPD1.FileName <> '' then begin
      edtArquivo.Text:= OPD1.FileName;
      sbVisualizar.Enabled:= True;
   end
   else begin
      sbVisualizar.Enabled:= False;
   end;
end;

procedure TFormCalibracao.sbBbtnSairClick(Sender: TObject);
begin
   t_Principal.AtuMetrologia();
   Self.Close;
end;

procedure TFormCalibracao.sbCancelarClick(Sender: TObject);
begin
   LimpaCampos;
   Botoes(True);
end;

procedure TFormCalibracao.sbExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 23, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         try
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM calibracao' +
                             ' WHERE cali_codigo = ' + cdsCalibracaocali_codigo.AsString;
               Execute;
            end;

            Auditoria('Tabela de Calibração',edtCodigo.Text + '-' + dblEquipamentos.Text,'E', '');
//            cdsCalibracao.Delete;
//            cdsCalibracao.ApplyUpdates(0);
            LimpaCampos;
            AtualizarDados();
            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;

   Botoes(True);
end;

procedure TFormCalibracao.sbGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
   sCodCali: string;
begin
   if ValidaCampos then begin
      with cdsCalibracao do begin
         if sbGravar.Caption = 'Gravar' then begin
            Active:= True;
            if (Acesso(cUsuario, 23, 'cadastro') = 1) then begin
               cOperacao:= 'I';

               iNovoCodigo:= BuscarNovoCodigo();

               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO calibracao' +
                                ' (cali_codigo, cali_numero, cali_equipamento, cali_resolucao, cali_localizacao, ' +
                                ' cali_frequencia, cali_faixa, cali_capacidade, cali_criterio, cali_certificado, ' +
                                ' cali_dataCalibracao, cali_proxCalibracao, cali_processo, cali_arquivo)' +
                                ' VALUES(' +
                                IntToStr(iNovoCodigo) + ',' +
                                QuotedStr(edtCodigo.Text) + ',' +
                                QuotedStr(dblEquipamentos.Text) + ',' +
                                QuotedStr(edtResolucao.Text) + ',' +
                                QuotedStr(edtLocalizacao.Text) + ',' +
                                ValorFrequencia(cbFrequencia.ItemIndex) + ',' +
                                QuotedStr(edtFaixa.Text) + ',' +
                                QuotedStr(edtCapacidade.Text) + ',' +
                                QuotedStr(edtCriterio.Text) + ',' +
                                QuotedStr(edtCertificado.Text) + ',' +
                                ArrumaDataSQL(dtCalibracao.Date) + ',' +
                                ArrumaDataSQL(dtProxima.Date) + ',' +
                                IntToStr(dblProcessos.KeyValue) + ',' +
                                QuotedStr(DuploBar(edtArquivo.Text)) +
                                ')';
                  Execute;
               end;
            end
            else begin
               Exit;
            end;
         end
         else begin
            if (Acesso(cUsuario, 23, 'alteracao') = 1) then begin
               cOperacao:= 'A';
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE calibracao SET ' +
                                ' cali_numero = ' + QuotedStr(edtCodigo.Text) + ',' +
                                ' cali_equipamento = ' + QuotedStr(dblEquipamentos.KeyValue) + ',' +
                                ' cali_resolucao = ' + QuotedStr(edtResolucao.Text) + ',' +
                                ' cali_localizacao = ' + QuotedStr(edtLocalizacao.Text) + ',' +
                                ' cali_frequencia = ' + ValorFrequencia(cbFrequencia.ItemIndex) + ',' +
                                ' cali_faixa = ' + QuotedStr(edtFaixa.Text) + ',' +
                                ' cali_capacidade = ' + QuotedStr(edtCapacidade.Text) + ',' +
                                ' cali_criterio = ' + QuotedStr(edtCriterio.Text) + ',' +
                                ' cali_certificado = ' + QuotedStr(edtCertificado.Text) + ',' +
                                ' cali_dataCalibracao = ' + ArrumaDataSQL(dtCalibracao.Date) + ',' +
                                ' cali_proxCalibracao = ' + ArrumaDataSQL(dtProxima.Date) + ',' +
                                ' cali_processo = ' + IntToStr(dblProcessos.KeyValue) + ',' +
                                ' cali_arquivo = ' + QuotedStr(DuploBar(edtArquivo.Text)) +
                                ' WHERE cali_codigo = ' + cdsCalibracao.FieldByName('cali_codigo').AsString;
                  Execute;
               end;
               sbGravar.Caption:= 'Gravar';
            end
            else begin
               Exit;
            end;
         end;

         sCodCali:= cdsCalibracaocali_codigo.AsString;
         AtualizarDados();

         if AllTrim(sCodCali) <> EmptyStr then begin
            cdsCalibracao.Locate('cali_codigo',sCodCali,[])
         end;

         sbGravar.Caption:= 'Gravar';
         Auditoria('Tabela de Calibração',edtCodigo.Text + '-' + dblEquipamentos.Text,cOperacao, '');
      end;
      LimpaCampos;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
   end;
   cdsAuxiliar.Active:= False;
   Botoes(True);
end;

procedure TFormCalibracao.sbImprimirClick(Sender: TObject);
begin
   with cdsImprimir do begin
      Active:= False;
//      CommandText:= ' SELECT lm.*, p.desc_pro as processo FROM lista_mestra lm ' +
//                    ' INNER JOIN Processos p ON proc_lis = codi_pro';
      Active:= True;
   end;

//   dm.rvRaveProject.Close;
//   dm.RvdsConexao.DataSet:= cdsImprimir;
//   dm.rvRaveProject.ProjectFile:= ExtractFilePath(Application.ExeName) + '\Relatórios\rCalibracao.rav';
//   dm.rvRaveProject.Open;
//   dm.rvRaveProject.Execute;
   Auditoria('Tabela de Calibração','','R', '');
end;

procedure TFormCalibracao.sbNovoClick(Sender: TObject);
begin
   LimpaCampos;
   sbGravar.Caption:= 'Gravar';
   Botoes(False);
   dblEquipamentos.SetFocus;
end;

procedure TFormCalibracao.sbVisualizarClick(Sender: TObject);
begin
   try
      ShellExecute(Application.Handle, nil, PChar(edtArquivo.text), nil, nil, SW_SHOWMAXIMIZED);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

function TFormCalibracao.ValidaCampos: Boolean;
begin
   Result:= True;

   if edtCodigo.Text = EmptyStr then begin
      Result:= False;
      Application.MessageBox('Campo "Código" obrigatório !','Aviso',MB_OK+MB_ICONERROR);
      edtCodigo.SetFocus;
      Exit;
   end;

   if dblEquipamentos.Text = EmptyStr then begin
      Result:= False;
      Application.MessageBox('Campo "Equipamento/Instrumento" obrigatório !','Aviso',MB_OK+MB_ICONERROR);
      dblEquipamentos.SetFocus;
      Exit;
   end;

   if dtCalibracao.Text = '  /    ' then begin
      Result:= False;
      Application.MessageBox('Campo "Data da Calibração" obrigatório !','Aviso',MB_OK+MB_ICONERROR);
      dtCalibracao.SetFocus;
      Exit;
   end;
end;

function TFormCalibracao.ValorFrequencia(ValorCombo: Integer): string;
begin
   case ValorCombo of
      0:  Result:= '1';
      1:  Result:= '7';
      2:  Result:= '15';
      3:  Result:= '30';
      4:  Result:= '90';
      5:  Result:= '180';
      6:  Result:= '365';
      7:  Result:= '730';
      8:  Result:= '1095';
      9:  Result:= '1460';
      10: Result:= '1825';
   end;
end;

function TFormCalibracao.DiasFrequencia(ValorDias: string): Integer;
begin
   case StrToInt(ValorDias) of
      1:   Result:= 0;
      7:   Result:= 1;
      15:  Result:= 2;
      30:  Result:= 3;
      90:  Result:= 4;
      180: Result:= 5;
      365: Result:= 6;
      730: Result:= 7;
     1095: Result:= 8;
     1460: Result:= 9;
     1825: Result:= 10;
   end;
end;

end.
