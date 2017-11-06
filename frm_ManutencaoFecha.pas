unit frm_ManutencaoFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  FMTBcd, DBClient, Provider, SqlExpr, rxToolEdit, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFormManutencaoFecha = class(TForm)
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    lblCodigo: TLabel;
    pnl1: TPanel;
    dbgManutencao: TDBGrid;
    mOQue: TMemo;
    mComo: TMemo;
    mAnomalias: TMemo;
    cbItem: TComboBox;
    dtRealizado: TDateEdit;
    dblQuem: TDBLookupComboBox;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    dspFecha: TDataSetProvider;
    cdsFecha: TClientDataSet;
    dsFecha: TDataSource;
    cdsFechaQuem: TStringField;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryColaboradores: TZQuery;
    zqryGravar: TZQuery;
    zqryFecha: TZQuery;
    cdsFechaman_codigo: TLargeintField;
    btnPesquisar: TBitBtn;
    dblOnde: TDBLookupComboBox;
    zqryOnde: TZQuery;
    dspOnde: TDataSetProvider;
    cdsOnde: TClientDataSet;
    dsOnde: TDataSource;
    cdsOndecodi_com: TLargeintField;
    cdsOndevalo_com: TWideStringField;
    cdsFechaOnde: TStringField;
    cdsFechafec_anomalias: TWideMemoField;
    cdsFechafec_codigo: TLargeintField;
    cdsFechafec_data_realizado: TDateTimeField;
    cdsFechafec_onde: TLargeintField;
    cdsFechafec_quem: TLargeintField;
    edtIdentItem: TEdit;
    lbl7: TLabel;
    dblQuemForn: TDBLookupComboBox;
    zqryForn: TZQuery;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dsForn: TDataSource;
    cdsFechafec_quemforn: TIntegerField;
    cdsFechaQuemTipo: TStringField;
    cdsFechaForn: TStringField;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    dblQuando: TDBLookupComboBox;
    zqryQuando: TZQuery;
    dspQuando: TDataSetProvider;
    cdsQuando: TClientDataSet;
    dsQuando: TDataSource;
    cdsQuandocodi_com: TLargeintField;
    cdsQuandovalo_com: TWideStringField;
    sbComo: TSpeedButton;
    sbOQue: TSpeedButton;
    pnlTexto: TPanel;
    mmoTexto: TMemo;
    pnl14: TPanel;
    btnFecharAnCausa: TBitBtn;
    function ValidaCampos: Boolean;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados();
    procedure PreencherCampos;
    procedure PreencherCamposFilho;
    procedure dbgManutencaoCellClick(Column: TColumn);
    procedure dbgManutencaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimpaCampos;
    procedure LimparCamposFilho;
    procedure mAnomaliasKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Botoes(flag: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dblOndeCloseUp(Sender: TObject);
    procedure ControlarQuem();
    procedure cdsFechaCalcFields(DataSet: TDataSet);
    procedure sbOQueClick(Sender: TObject);
    procedure sbComoClick(Sender: TObject);
    procedure btnFecharAnCausaClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: string;
  public
    { Public declarations }
    sCodProcesso: string;
    sCodMan: string;
  end;

var
  FormManutencaoFecha: TFormManutencaoFecha;

implementation

uses frm_dm, Funcoes, frm_Tartaruga, frm_Manutencao, frm_PesqManutencao, frm_Inicial;

{$R *.dfm}

procedure TFormManutencaoFecha.AtualizarDados;
begin
   Botoes(True);

   with cdsOnde do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 16' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   if sCodMan <> EmptyStr then begin
      with cdsFecha do begin
         Active:= False;
         CommandText:= ' SELECT fec_codigo, fec_anomalias, fec_data_realizado, ' +
                       ' fec_onde, fec_quem, man_codigo, fec_quemforn ' +
                       ' FROM manutencao_fecha ' +
                       ' WHERE man_codigo = ' + sCodMan +
                       ' ORDER BY fec_data_realizado DESC';
         Active:= True;

         btnAlterar.Enabled:= (RecordCount > 0);
         btnExcluir.Enabled:= (RecordCount > 0);
      end;
   end
   else begin
      btnNovo.Enabled     := False;
      btnAlterar.Enabled  := False;
      btnExcluir.Enabled  := False;
      btnGravar.Enabled   := False;
      btnCancelar.Enabled := False;
   end;
end;

procedure TFormManutencaoFecha.Botoes(flag: Boolean);
begin
   btnNovo.Enabled     := Flag;
   btnAlterar.Enabled  := Flag;
   btnExcluir.Enabled  := Flag;
   btnGravar.Enabled   := not Flag;
   btnCancelar.Enabled := not Flag;
   btnPesquisar.Enabled:= Flag;
end;

procedure TFormManutencaoFecha.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';
   HabilitarCampos(True, False, Self, 1);
   Botoes(False);
end;

procedure TFormManutencaoFecha.btnCancelarClick(Sender: TObject);
begin
//   LimparCamposFilho();
   Botoes(True);
   HabilitarCampos(False, False, Self, 1);
end;

procedure TFormManutencaoFecha.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then  begin
      try
         Auditoria('MANUTENCAO FECHAMENTO',cbItem.Text,'E', '');
         with dm.cdsAuxiliar do begin
            Active:= False;
            CommandText:= ' DELETE FROM manutencao_fecha' +
                          ' WHERE fec_codigo = ' + cdsFechafec_codigo.AsString;
            Execute;
         end;

         AtualizarDados;

         Application.MessageBox('Registro excluído corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro ao excluir.' + #13 + E.Message), 'Erro', MB_OK + MB_ICONSTOP);
         end;
      end;
   end;
end;

procedure TFormManutencaoFecha.btnFecharAnCausaClick(Sender: TObject);
begin
   pnlTexto.Visible:= False;
end;

procedure TFormManutencaoFecha.btnGravarClick(Sender: TObject);
var
   sNovoCodigo: string;
begin
   try
      if cOperacao = 'I' then begin
         if ValidaCampos then begin
            sNovoCodigo:= BuscarNovoCodigo('manutencao_fecha', 'fec_codigo');
//            with dm.cdsAuxiliar do begin
//               Active:= False;
//               CommandText:= 'SELECT MAX(fec_codigo) as NovoCodigo FROM manutencao_fecha';
//               Active:= True;
//
//               if FieldByName('NovoCodigo').AsString = EmptyStr then begin
//                  iNovoCodigo:= 1;
//               end
//               else begin
//                  iNovoCodigo:= FieldByName('NovoCodigo').AsInteger + 1;
//               end;
//            end;

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO manutencao_fecha (' +
                             ' fec_codigo, man_codigo, fec_quem, fec_onde, fec_data_realizado, fec_anomalias, fec_quemforn)' +
                             ' VALUES(' +
                             sNovoCodigo + ',' +
                             FormPesqManutencao.cdsManutencaocodi_man.AsString + ',' +
                             IntToStr(dblQuem.KeyValue) + ',' +
                             IntToStr(dblOnde.KeyValue) + ',' +
                             ArrumaDataSQL(dtRealizado.Date) + ',' +
                             QuotedStr(mAnomalias.Text) + ',' +
                             IntToStr(dblQuemForn.KeyValue) +
                             ')';
               Execute;
               Application.MessageBox('Registro gravado corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

               Auditoria('MANUTENCAO FECHAMENTO',cbItem.Text,'A', '');
            end;

            Botoes(True);
            HabilitarCampos(False, False, Self, 1);
            LimparCamposFilho();
            AtualizarDados();
         end;
      end
      else begin
         if ValidaCampos then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' UPDATE manutencao_fecha SET ' +
                             ' fec_quem = ' + IntToStr(dblQuem.KeyValue) + ',' +
                             ' fec_onde = ' + IntToStr(dblOnde.KeyValue) + ',' +
                             ' fec_data_realizado = ' + ArrumaDataSQL(dtRealizado.Date) + ',' +
                             ' fec_anomalias = ' + QuotedStr(mAnomalias.Text) + ',' +
                             ' fec_quemforn = ' + IntToStr(dblQuemForn.KeyValue) +
                             ' WHERE fec_codigo = ' + cdsFechafec_codigo.AsString ;

               Execute;
               Application.MessageBox('Registro alterado corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

               Auditoria('MANUTENCAO FECHAMENTO',cbItem.Text,'A', '');
            end;

            Botoes(True);
            HabilitarCampos(False, False, Self, 1);
            LimparCamposFilho();
            AtualizarDados();
         end;
      end;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;

end;

procedure TFormManutencaoFecha.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCamposFilho();
   HabilitarCampos(True, False, Self, 1);
   TryFocus(dblOnde);
   Botoes(False);
end;

procedure TFormManutencaoFecha.btnPesquisarClick(Sender: TObject);
begin
   if not assigned(FormPesqManutencao) then
      Application.CreateForm(TFormPesqManutencao, FormPesqManutencao);
   FormPesqManutencao.lblProcesso.Caption:= lblCodigo.Caption;
   FormPesqManutencao.ShowModal;
end;

procedure TFormManutencaoFecha.btnSairClick(Sender: TObject);
begin
   FormTartaruga.VerificaPendencias;
   Self.Close;
end;

procedure TFormManutencaoFecha.cdsFechaCalcFields(DataSet: TDataSet);
begin
   if cdsFecha.FieldByName('fec_onde').AsInteger = 0 then begin // Interno
      cdsFecha.FieldByName('QuemTipo').AsString:= cdsFecha.FieldByName('Quem').AsString;
   end
   else begin // externo
      cdsFecha.FieldByName('QuemTipo').AsString:= cdsFecha.FieldByName('Forn').AsString;
   end;
end;

procedure TFormManutencaoFecha.ControlarQuem;
begin
   if dblOnde.KeyValue = 0 then begin // Interno
      dblQuem.Top    := 188;
      dblQuem.Visible:= True;

      dblQuemForn.Top     := 650;
      dblQuemForn.KeyValue:= -1;
      dblQuemForn.Visible := False;

   end
   else begin // Externo
      dblQuemForn.Top    := 188;
      dblQuemForn.Visible:= True;

      dblQuem.Top     := 650;
      dblQuem.KeyValue:= -1;
      dblQuem.Visible := False;
   end;
end;

procedure TFormManutencaoFecha.dbgManutencaoCellClick(Column: TColumn);
begin
   PreencherCamposFilho;
end;

procedure TFormManutencaoFecha.dbgManutencaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //PreencherCamposFilho;
end;

procedure TFormManutencaoFecha.dblOndeCloseUp(Sender: TObject);
begin
   ControlarQuem();
end;

procedure TFormManutencaoFecha.FormShow(Sender: TObject);
begin
   cdsColaboradores.Active:= False;
   cdsColaboradores.Active:= True;

   cdsQuando.Active:= False;
   cdsQuando.Active:= True;

   cdsForn.Active:= False;
   cdsForn.Active:= True;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_pro FROM processos' +
                    ' WHERE codi_pro = ' + QuotedStr(sCodProcesso);
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;

   LimpaCampos;
   LimparCamposFilho();
   AtualizarDados();
   cdsFecha.Active:= False;
   HabilitarCampos(False, False, Self, 1);

   btnNovo.Enabled    := False;
   btnAlterar.Enabled := False;
   btnExcluir.Enabled := False;
   btnGravar.Enabled  := False;
   btnCancelar.Enabled:= False;

   TryFocus(btnPesquisar);

   dblQuemForn.Top := 650;
   dblQuemForn.Left:= 148;
   dblQuemForn.Visible:= False;

   mComo.ReadOnly:= True;
   mOQue.ReadOnly:= True;
   mComo.Font.Color:= clGray;
   mOQue.Font.Color:= clGray;
end;

procedure TFormManutencaoFecha.LimpaCampos;
begin
   cbItem.ItemIndex:= -1;
   cbItem.Text:= '';
   mOQue.Clear;
   mComo.Clear;
   dblQuando.KeyValue:= -1;
   dblQuem.KeyValue:= -1;
   dblOnde.KeyValue:= -1;
   dtRealizado.Clear;
   mAnomalias.Clear;
end;

procedure TFormManutencaoFecha.LimparCamposFilho;
begin
   dblQuem.KeyValue:= -1;
   dblOnde.KeyValue:= 0;
   dblQuemForn.KeyValue:= -1;
   dtRealizado.Clear;
   mAnomalias.Clear;
end;

procedure TFormManutencaoFecha.mAnomaliasKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormManutencaoFecha.PreencherCampos;
begin
   if FormPesqManutencao.cdsManutencao.RecordCount > 0 then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT desc_inf FROM infraestrutura'+
                       ' WHERE codi_inf = ' + QuotedStr(FormPesqManutencao.cdsManutencao.FieldByName('codi_inf').AsString);
         Active:= True;

         if RecordCount <= 0 then begin
            btnAlterar.Enabled:= False;
            btnExcluir.Enabled:= False;
         end
         else begin
            btnAlterar.Enabled:= True;
            btnExcluir.Enabled:= True;
         end;
      end;
      cbItem.Text:= dm.cdsAuxiliar.FieldByName('desc_inf').AsString;

      mOQue.Text        := FormPesqManutencao.cdsManutencao.FieldByName('oque_man').AsString;
      mComo.Text        := FormPesqManutencao.cdsManutencao.FieldByName('como_man').AsString;
      dblQuando.KeyValue:= FormPesqManutencao.cdsManutencao.FieldByName('quan_man').AsString;
   end;
end;

procedure TFormManutencaoFecha.PreencherCamposFilho;
begin
   dblQuem.KeyValue    := cdsFechafec_quem.AsInteger;
   dblQuemForn.KeyValue:= cdsFechafec_quemforn.AsInteger;
   dblOnde.KeyValue    := cdsFechafec_onde.AsInteger;
   dtRealizado.Date    := cdsFechafec_data_realizado.AsDateTime;
   mAnomalias.Text     := cdsFechafec_anomalias.AsString;

   ControlarQuem();
end;

procedure TFormManutencaoFecha.sbComoClick(Sender: TObject);
begin
   pnlTexto.Left:= 323;
   pnlTexto.Top := 82;
   mmoTexto.Text:= mComo.Text;
   pnlTexto.Visible:= True;
end;

procedure TFormManutencaoFecha.sbOQueClick(Sender: TObject);
begin
   pnlTexto.Left:= 20;
   pnlTexto.Top := 82;
   mmoTexto.Text:= mOQue.Text;
   pnlTexto.Visible:= True;
end;

function TFormManutencaoFecha.ValidaCampos: Boolean;
begin
   Result:= True;

   try
      if dtRealizado.Text <> '  /  /    ' then
         StrToDate(dtRealizado.Text);
   except
      Application.MessageBox('Data inválida !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      dtRealizado.SetFocus;
      Exit;
   end;

   if (dblQuem.KeyValue = -1) and (dblQuemForn.KeyValue = -1) then begin
      Application.MessageBox('Campo Quem fez ? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblQuem);
      Result:= False;
      Exit;
   end;

   if dblOnde.KeyValue = -1 then begin
      Application.MessageBox('Campo Onde ? é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblOnde);
      Result:= False;
      Exit;
   end;

   if dtRealizado.Text = '  /  /    ' then begin
      Application.MessageBox('Campo Realizado em é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dtRealizado);
      Result:= False;
      Exit;
   end;

   if mAnomalias.Text = EmptyStr then begin
      Application.MessageBox('Campo Anomalias é obrigatório', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(mAnomalias);
      Result:= False;
      Exit;
   end;

end;

end.
