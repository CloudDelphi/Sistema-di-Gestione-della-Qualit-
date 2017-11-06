unit frm_Manutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Mask, rxToolEdit, DBCtrls;

type
  Tt_Manutencao = class(TForm)
    Label2: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    dbgManutencao: TDBGrid;
    mOQue: TMemo;
    Label6: TLabel;
    mComo: TMemo;
    Label3: TLabel;
    Label7: TLabel;
    cbItem: TComboBox;
    lblCodigo: TLabel;
    Label1: TLabel;
    dblProcessos: TDBLookupComboBox;
    cbQuando: TComboBox;
    procedure sbSairClick(Sender: TObject);
    procedure mOQueKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure LimpaCampos;
    procedure FormShow(Sender: TObject);
    procedure dbgManutencaoCellClick(Column: TColumn);
    procedure sbGravarClick(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure sbExcluirClick(Sender: TObject);
    procedure PreencheCampos;
    procedure dbgManutencaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbImprimirClick(Sender: TObject);
    procedure dblProcessosCloseUp(Sender: TObject);
    procedure mAnomaliasExit(Sender: TObject);
    procedure HabilitaCampos(Flag: Boolean);
    procedure Atualiza;
//    function ValorQuando(ValorCombo: Integer): string;
//    function DiasQuando(ValorDias: string): Integer;
  private
    { Private declarations }
//    cOperacao: Char;
  public
    { Public declarations }
//    sFrom: string;
  end;

var
  t_Manutencao: Tt_Manutencao;
  NovoCodigoManutencao: Integer;

implementation

uses Funcoes, frm_dm, DB, DBClient, frm_Inicial;

{$R *.dfm}

procedure Tt_Manutencao.Atualiza;
begin
   with dm.cdsManutencao do begin
      Active:= False;
//      if sFrom = 'MENU' then begin
         CommandText:= ' SELECT anom_man, codi_inf, codi_man, como_man, data_man, ' +
                       ' onde_man, oque_man, quan_man, quem_man, proc_man, efic_man FROM manutencao';
         HabilitaCampos(True);
//      end
//      else begin // 'PROCESSO'
//         CommandText:= ' SELECT anom_man, codi_inf, codi_man, como_man, data_man, ' +
//                       ' onde_man, oque_man, quan_man, quem_man, proc_man FROM manutencao' +
//                       ' WHERE proc_man = ' + lblCodigo.Caption;
//
//         dblProcessos.KeyValue:= StrToInt(lblCodigo.Caption);
//         dblProcessos.KeyValue:= lblCodigo.Caption;
//         HabilitaCampos(False);
//      end;
      Active:= True;
   end;
end;

procedure Tt_Manutencao.dbgManutencaoCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_Manutencao.dbgManutencaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure Tt_Manutencao.dblProcessosCloseUp(Sender: TObject);
begin
   with dm.cdsAuxiliar do
   begin
      cbItem.Clear;
      Active:= False;
      CommandText:= ' SELECT desc_inf FROM infraestrutura '+
                    ' WHERE proc_inf = ' + IntToStr(dblProcessos.KeyValue) +
                    ' AND manu_inf = "SIM" ' +
                    ' ORDER BY desc_inf';
      Active:= True;

      First;
      while not Eof do begin
         cbItem.Items.Add(FieldByName('desc_inf').AsString);
         Next;
      end;
   end;
end;

procedure Tt_Manutencao.FormPaint(Sender: TObject);
begin
//  Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Manutencao.FormShow(Sender: TObject);
begin
   dm.cdsProcessos.Active:= True;

   Atualiza;

//   with dm.cdsAuxiliar do
//   begin
//      cbResponsavel.Clear;
//      Active:= False;
//      CommandText:= ' SELECT nome_col FROM colaboradores'+
//                    ' ORDER BY nome_col';
//      Active:= True;
//
//      First;
//      while not Eof do
//      begin
//         cbResponsavel.Items.Add(FieldByName('nome_col').AsString);
//         Next;
//      end;
//   end;

   with dm.cdsAuxiliar do
   begin
      Active:= False;
      CommandText:= ' SELECT nome_pro FROM processos' +
                    ' WHERE codi_pro = ' + '''' + lblCodigo.Caption + '''';
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;

   LimpaCampos;
end;

procedure Tt_Manutencao.HabilitaCampos(Flag: Boolean);
begin
   dblProcessos.Enabled:= Flag;
   cbItem.Enabled      := Flag;
   mOQue.Enabled       := Flag;
   mComo.Enabled       := Flag;
   cbQuando.Enabled    := Flag;
   sbNovo.Visible      := Flag;
   sbExcluir.Visible   := Flag;
end;

procedure Tt_Manutencao.LimpaCampos;
begin
   dblProcessos.KeyValue:= -1;
   cbItem.ItemIndex:= -1;
   cbItem.Text:= '';
   mOQue.Clear;
   mComo.Clear;
   cbQuando.ItemIndex:= -1;
//   cbResponsavel.ItemIndex:= -1;
//   cbResponsavel.Text:= '';
//   cbOnde.ItemIndex:= -1;
//   cbOnde.Text:= '';
//   dtRealizado.Clear;
//   mAnomalias.Clear;
   sbGravar.Caption:= 'Gravar';
//   if dblProcessos.Enabled then
//      dblProcessos.SetFocus
//   else
//   cbResponsavel.SetFocus;
   sbExcluir.Enabled:= False;
end;

procedure Tt_Manutencao.mAnomaliasExit(Sender: TObject);
begin
   mOQue.SetFocus;
end;

procedure Tt_Manutencao.mOQueKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= AcertaUpperLetra(Key);
end;

procedure Tt_Manutencao.PreencheCampos;
begin
   if dm.cdsManutencao.RecordCount > 0 then
   begin
      sbExcluir.Enabled:= True;
      sbGravar.Caption:= 'Alterar';

      with dm.cdsAuxiliar do
      begin
         Active:= False;
         CommandText:= ' SELECT desc_inf FROM infraestrutura'+
                       ' WHERE codi_inf = ' + '''' + dm.cdsManutencao.FieldByName('codi_inf').AsString + '''';
         Active:= True;
      end;
      cbItem.Text:= dm.cdsAuxiliar.FieldByName('desc_inf').AsString;
      dblProcessos.KeyValue:= dm.cdsManutencao.FieldByName('proc_man').AsString;

      mOQue.Text        := dm.cdsManutencao.FieldByName('oque_man').AsString;
      mComo.Text        := dm.cdsManutencao.FieldByName('como_man').AsString;
//      cbQuando.ItemIndex:= DiasQuando(dm.cdsManutencao.FieldByName('quan_man').AsString);

      with dm.cdsAuxiliar do
      begin
         Active:= False;
         CommandText:= ' SELECT nome_col FROM colaboradores'+
                       ' WHERE codi_col = ' + '''' + dm.cdsManutencao.FieldByName('quem_man').AsString + '''';
         Active:= True;
      end;
//      cbResponsavel.Text:= dm.cdsAuxiliar.FieldByName('nome_col').AsString;

//      cbOnde.ItemIndex:= dm.cdsManutencao.FieldByName('onde_man').AsInteger;
//      dtRealizado.Date:= dm.cdsManutencao.FieldByName('data_man').AsDateTime;
//      mAnomalias.Text := dm.cdsManutencao.FieldByName('anom_man').AsString;

      sbExcluir.Enabled:= True;
   end;
end;

procedure Tt_Manutencao.sbExcluirClick(Sender: TObject);
begin
   try
      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then begin
         Auditoria('MANUTENCAO',cbItem.Text,'E', '');
         dm.cdsManutencao.Delete;
         dm.cdsManutencao.ApplyUpdates(0);
         LimpaCampos;
         Application.MessageBox('Registro excluído corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Erro ao excluir o registro.' + #13 + E.Message), 'Erro', MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure Tt_Manutencao.sbGravarClick(Sender: TObject);
var
   iCodInfra: Integer;
//   iCodQuem : Integer;
begin
   try
      if ValidaCampos then begin
         with dm.cdsAuxiliar do
         begin
            Active:= False;
            CommandText:= ' SELECT codi_inf FROM infraestrutura' +
                          ' WHERE desc_inf = ' + '''' + cbItem.Text + '''';
            Active:= True;
            iCodInfra:= FieldByName('codi_inf').AsInteger;
         end;

//         with dm.cdsAuxiliar do
//         begin
//            Active:= False;
//            CommandText:= ' SELECT codi_col FROM colaboradores' +
//                          ' WHERE nome_col = ' + '''' + cbResponsavel.Text + '''';
//            Active:= True;
//            iCodQuem:= FieldByName('codi_col').AsInteger;
//         end;

         with dm.cdsAuxiliar do begin
            if sbGravar.Caption = 'Gravar' then begin
               Active:= False;
               CommandText:= ' INSERT INTO manutencao ' +
                             ' (codi_inf, oque_man, como_man, quan_man, efic_man, proc_man)' +
//                             quem_man, onde_man, data_man, anom_man, proc_man)' +
                             ' VALUES( ' +
                             IntToStr(iCodInfra)  + ',' +
                             QuotedStr(mOQue.Text) + ',' +
                             QuotedStr(mComo.Text) + ',' +
//                             QuotedStr(ValorQuando(cbQuando.ItemIndex)) + ',' +
//                             IntToStr(iCodQuem) + ',' +
//                             IntToStr(cbOnde.ItemIndex) + ',' +
//                             ArrumaDataSQL(dtRealizado.Date) + ',' +
//                             QuotedStr(mAnomalias.Text) + ',' +
                             '"NÃO"' + ',' +
                             IntToStr(dblProcessos.KeyValue) +
                             ')';
               Execute;
               LimpaCampos;
               Atualiza;
               Application.MessageBox('Registro gravado corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

               Auditoria('MANUTENCAO',cbItem.Text,'I', '');
            end
            else begin
               Active:= False;
               CommandText:= ' UPDATE manutencao SET ' +
                             ' codi_inf = ' + IntToStr(iCodInfra)  + ',' +
                             ' oque_man = ' + QuotedStr(mOQue.Text) + ',' +
                             ' como_man = ' + QuotedStr(mComo.Text) + ',' +
//                             ' quan_man = ' + QuotedStr(ValorQuando(cbQuando.ItemIndex)) + ',' +
//                             ' quem_man = ' + IntToStr(iCodQuem) + ',' +
//                             ' onde_man = ' + IntToStr(cbOnde.ItemIndex) + ',' +
//                             ' data_man = ' + ArrumaDataSQL(dtRealizado.Date) + ',' +
//                             ' anom_man = ' + QuotedStr(mAnomalias.Text) + ',' +
                             ' proc_man = ' + IntToStr(dblProcessos.KeyValue) +
                             ' WHERE codi_man = ' + dm.cdsManutencaocodi_man.AsString ;
               Execute;
               LimpaCampos;
               Atualiza;
               Application.MessageBox('Registro alterado corretamente.', 'Informação', MB_OK + MB_ICONINFORMATION);

               Auditoria('MANUTENCAO',cbItem.Text,'A', '');
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
//         with dm.cdsManutencao do
//         begin
//            Active:= True;
//            if sbGravar.Caption = 'Gravar' then
//            begin
//               cOperacao:= 'I';
//               Insert;
//            end
//            else
//            begin
//               cOperacao:= 'A';
//               Edit;
//               sbGravar.Caption:= 'Gravar';
//            end;
//
//            with dm.cdsAuxiliar do
//            begin
//               Active:= False;
//               CommandText:= ' Select codi_inf from infraestrutura' +
//                             ' where desc_inf = ' + '''' + cbItem.Text + '''';
//               Active:= True;
//               dm.cdsManutencao.FieldByName('codi_inf').AsInteger:= FieldByName('codi_inf').AsInteger;
//            end;
//
//            FieldByName('oque_man').AsString := mOQue.Text;
//            FieldByName('como_man').AsString := mComo.Text;
//            FieldByName('quan_man').AsString := mQuando.Text;
//
//            FieldByName('onde_man').AsInteger:= cbOnde.ItemIndex;
//            if dtRealizado.Text <> '  /  /    ' then
//               FieldByName('data_man').AsDateTime := dtRealizado.Date;
//            FieldByName('anom_man').AsString := mAnomalias.Text;
//            FieldByName('proc_man').AsString := dblProcessos.KeyValue;
//
//            Post;
//            Auditoria('MANUTENCAO',cbItem.Text,cOperacao, '');
//         end;
//         LimpaCampos;
//      end;
//      dm.cdsAuxiliar.Active:= False;
//      Application.MessageBox('Registro gravado corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
//
//   except
//      cbResponsavel.SetFocus;
//      Application.MessageBox('Não foi possível realizar a gravação','Erro',MB_OK+MB_ICONERROR);
//   end; // try
end;

procedure Tt_Manutencao.sbImprimirClick(Sender: TObject);
begin
//  Auditoria('MANUTENCAO','','R', '');
end;

procedure Tt_Manutencao.sbNovoClick(Sender: TObject);
begin
  LimpaCampos;
end;

procedure Tt_Manutencao.sbSairClick(Sender: TObject);
begin
  Self.Close;
end;

function Tt_Manutencao.ValidaCampos: Boolean;
begin
   Result:= True;

   if cbItem.Text = '' then
   begin
      Application.MessageBox('Escolha um item de infraestrutura !','Aviso',MB_OK+MB_ICONWARNING);
       Result:= False;
      cbItem.SetFocus;
      Exit;
   end;

   if mOQue.Text = '' then
   begin
      Application.MessageBox('Digite o que fazer !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      mOQue.SetFocus;
      Exit;
   end;

   if mComo.Text = '' then
   begin
      Application.MessageBox('Digite como fazer !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      mComo.SetFocus;
      Exit;
   end;

   if cbQuando.Text = EmptyStr then
   begin
      Application.MessageBox('Digite quando fazer !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbQuando.SetFocus;
      Exit;
   end;

//   try
//      if dtRealizado.Text <> '  /  /    ' then
//         StrToDate(dtRealizado.Text);
//   except
//      Application.MessageBox('Data inválida !','Aviso',MB_OK+MB_ICONWARNING);
//      Result:= False;
//      dtRealizado.SetFocus;
//      Exit;
//   end;

end;

//function Tt_Manutencao.ValorQuando(ValorCombo: Integer): string;
//begin
//   case ValorCombo of
//      0: Result:= '1';
//      1: Result:= '7';
//      2: Result:= '15';
//      3: Result:= '30';
//      4: Result:= '60';
//      5: Result:= '90';
//      6: Result:= '180';
//      7: Result:= '365';
//      8: Result:= '730';
//      9: Result:= '1095';
//     10: Result:= '1460';
//     11: Result:= '1825';
//   end;
//end;

//function Tt_Manutencao.DiasQuando(ValorDias: string): Integer;
//begin
//   try
//      case StrToInt(ValorDias) of
//         1:    Result:= 0;
//         7:    Result:= 1;
//         15:   Result:= 2;
//         30:   Result:= 3;
//         60:   Result:= 4;
//         90:   Result:= 5;
//         180:  Result:= 6;
//         365:  Result:= 7;
//         730:  Result:= 8;
//         1095: Result:= 9;
//         1460: Result:= 10;
//         1825: Result:= 11;
//      end;
//   except
//      Result:= -1;
//   end;
//end;

end.
