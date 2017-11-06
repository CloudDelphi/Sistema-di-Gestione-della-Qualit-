unit frm_IQF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, ShellAPI, FMTBcd,
  DBClient, Provider, DB, SqlExpr, Mask, rxToolEdit, rxCurrEdit, frxClass, frxDBSet,
  DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm_IQF = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    BbtnSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    dbgIQF: TDBGrid;
    sbExcluir: TSpeedButton;
    dspIQF: TDataSetProvider;
    cdsIQF: TClientDataSet;
    sbCancelar: TSpeedButton;
    edtAvaliacao: TCurrencyEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    cdsImprimir: TClientDataSet;
    dspImprimir: TDataSetProvider;
    dsIQF: TDataSource;
    dspForn: TDataSetProvider;
    cdsForn: TClientDataSet;
    dblForn: TDBLookupComboBox;
    dsForn: TDataSource;
    edtData: TDateEdit;
    cbPontual: TComboBox;
    cbConforme: TComboBox;
    lbl1: TLabel;
    edtNF: TEdit;
    dblColaborador: TDBLookupComboBox;
    lbllb1: TLabel;
    cdsIQFPontual: TStringField;
    cdsIQFConforme: TStringField;
    cdsIQFResponsavel: TStringField;
    cdsIQFNomeForn: TStringField;
    pnlImpressao: TPanel;
    pnl2: TPanel;
    sbFecharImpressao: TSpeedButton;
    sbImpressao: TSpeedButton;
    lbl4: TLabel;
    edtDataInicial: TDateEdit;
    lbl5: TLabel;
    edtDataFinal: TDateEdit;
    frxdbIQF: TfrxDBDataset;
    zqryIQF: TZQuery;
    CdsIQFiqf_CodFornecedor: TWideStringField;
    cdsIQFiqf_codigo: TLargeintField;
    cdsIQFiqf_conforme: TLargeintField;
    cdsIQFiqf_data: TDateTimeField;
    CdsIQFiqf_NF: TWideStringField;
    cdsIQFiqf_pontual: TLargeintField;
    cdsIQFiqf_responsavel: TLargeintField;
    zqryImprimir: TZQuery;
    CdsImprimirforn_nome1: TWideStringField;
    cdsImprimirforn_avaliacao: TFloatField;
    cdsImprimirforn_validade: TDateTimeField;
    CdsImprimiriqf_codFornecedor1: TWideStringField;
    cdsImprimirQtd: TLargeintField;
    cdsImprimirIQF: TFloatField;
    zqryForn: TZQuery;
    CdsFornforn_codigo1: TWideStringField;
    CdsFornforn_nome1: TWideStringField;
    cdsFornforn_avaliacao: TFloatField;
    lbl6: TLabel;
    edtObs: TEdit;
    cdsIQFiqf_obs: TMemoField;
    procedure sbImpressaoClick(Sender: TObject);
    procedure sbFecharImpressaoClick(Sender: TObject);
    procedure dblFornCloseUp(Sender: TObject);
    procedure cdsIQFAfterPost(DataSet: TDataSet);
    procedure edtConformeExit(Sender: TObject);
    procedure cdsIQFCalcFields(DataSet: TDataSet);
    procedure edtAvaliacaoExit(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure dbgIQFKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgIQFCellClick(Column: TColumn);
    procedure sbNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure BbtnSairClick(Sender: TObject);
    procedure PreencheCampos;
    procedure LimpaCampos;
    function ValidaCampos: Boolean;
    procedure FormPaint(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);

  private
    { Private declarations }
    anomes: string;
    function CalcularIQF(): Real;
  public
    { Public declarations }
    cOperacao: Char;
  end;

var
  Form_IQF: TForm_IQF;

implementation

uses frm_dm, frm_Principal, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TForm_IQF.sbCancelarClick(Sender: TObject);
begin
   Botoes(True);
   LimpaCampos;
end;

procedure TForm_IQF.sbExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 22, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         try
            cdsIQF.Delete;
            cdsIQF.ApplyUpdates(0);
            LimpaCampos;
            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
            Auditoria('IQF',edtData.Text + '-' + dblForn.Text,'E', '');
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;

   Botoes(True);
end;

procedure TForm_IQF.sbFecharImpressaoClick(Sender: TObject);
begin
   pnlImpressao.Visible:= False;
end;

procedure TForm_IQF.sbImpressaoClick(Sender: TObject);
var
   sPeriodo: string;
   nCont: Integer;
   nAcumula: Real;
begin
   nCont   := 0;
   nAcumula:= 0;
   sPeriodo:= edtDataInicial.Text + ' à ' + edtDataFinal.Text;
   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT F.forn_nome, F.forn_avaliacao, F.forn_validade, F.forn_area,' +
                    ' iqf_codFornecedor, COUNT(*) as Qtd, ' +
//                    ' SUM(iqf_pontual) as Pontual,' +
//                    ' SUM(iqf_conforme) as Conforme,' +
                    ' (forn_avaliacao * 0.3) + ((SUM(iqf_pontual) / COUNT(*)) * 20) + ((SUM(iqf_conforme) / COUNT(*)) * 50) as IQF' +
                    ' FROM iqf_remessa' +
                    ' INNER JOIN Fornecedores F ON F.forn_codigo = iqf_codFornecedor' +
                    ' WHERE iqf_data between ' + ArrumaDataSQL(edtDataInicial.Date) +
                    '                and '+ ArrumaDataSQL(edtDataFinal.Date) +
                    ' GROUP BY iqf_codFornecedor';
      Active:= True;
      First;

      while not Eof do begin
         nAcumula:= nAcumula + FieldByName('IQF').AsFloat;
         nCont:= nCont + 1;
         Next;
      end;

      First;
   end;

   if not cdsImprimir.IsEmpty then begin
//      with dm.frxReport1 do begin
//          LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_IQF.fr3');
//          Variables['Periodo']:= QuotedStr(sPeriodo);
//          Variables['Media']  := QuotedStr(FormatFloat('##,##0.00',nAcumula / nCont));
//          ShowReport;
//      end;
      Auditoria('IQF','','R', '');
   end
   else begin
      Application.MessageBox('Não há dados para o período especificado', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);
   end;
end;

procedure TForm_IQF.sbImprimirClick(Sender: TObject);
begin
   pnlImpressao.Top    := Self.Height div 2 - pnlImpressao.Height div 2 - 20;
   pnlImpressao.Left   := Self.Width div 2 - pnlImpressao.Width div 2;
   pnlImpressao.Visible:= True;
end;

procedure TForm_IQF.sbGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
begin
   if ValidaCampos then
   begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' Select max(iqf_codigo) as codigo from iqf_remessa';
         Active:= True;
         if RecordCount = 0 then
            iNovoCodigo:= 1
         else
            iNovoCodigo:= FieldByName('codigo').AsInteger + 1;
      end;

      with cdsIQF do begin
         if sbGravar.Caption = 'Gravar' then begin
            if (Acesso(cUsuario, 22, 'cadastro') = 1) then begin
               cOperacao:= 'I';
               Insert;
            end
            else begin
               Exit;
            end;
         end
         else begin
            if (Acesso(cUsuario, 22, 'alteracao') = 1) then begin
               cOperacao:= 'A';
               Edit;
               sbGravar.Caption:= 'Gravar';
            end
            else begin
               Exit;
            end;
         end;
         Active:= True;
         FieldByName('iqf_codigo').AsInteger       := iNovoCodigo;
         FieldByName('iqf_data').AsDateTime        := edtData.Date;
         FieldByName('iqf_codFornecedor').AsString := dblForn.KeyValue;
         FieldByName('iqf_pontual').AsInteger      := cbPontual.ItemIndex;
         FieldByName('iqf_conforme').AsInteger     := cbConforme.ItemIndex;
         FieldByName('iqf_NF').AsString            := edtNF.Text;
         FieldByName('iqf_responsavel').AsInteger  := dblColaborador.KeyValue;
         FieldByName('iqf_obs').AsString          := edtObs.Text;

         Post;
         Auditoria('IQF',edtData.Text + '-' + dblForn.Text,cOperacao, '');
      end;
      LimpaCampos;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
   end;
   dm.cdsAuxiliar.Active:= False;
   Botoes(True);
 end;

procedure TForm_IQF.sbNovoClick(Sender: TObject);
begin
   LimpaCampos;
   edtData.Date:= Date();
   sbGravar.Caption:= 'Gravar';
   Botoes(False);
end;

procedure TForm_IQF.BbtnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TForm_IQF.Botoes(Flag: Boolean);
begin
   sbNovo.Enabled    := Flag;
   sbExcluir.Enabled := not Flag;
   sbGravar.Enabled  := not Flag;
   sbCancelar.Enabled:= not Flag;
   sbImprimir.Enabled:= Flag;

//   dbgIQF.Enabled:= Flag;
end;

function TForm_IQF.CalcularIQF: Real;
//var
//   rResultado: Real;
begin
//   if edtRemessa.Value > 0 then begin
//      rResultado:= (edtAvaliacao.Value * 0.2) + ((edtPontual.Value / edtRemessa.Value) * 30) + ((edtConforme.Value / edtRemessa.Value) * 50);
//   end
//   else begin
//      rResultado:= 0;
//   end;
//   Result:= rResultado;
end;

procedure TForm_IQF.cdsIQFAfterPost(DataSet: TDataSet);
begin
   cdsIQF.ApplyUpdates(0);
end;

procedure TForm_IQF.cdsIQFCalcFields(DataSet: TDataSet);
begin
//   if cdsIQFiqf_remessa.AsFloat > 0 then begin
//      cdsIQFIQF.AsFloat:= (cdsIQFiqf_avaliacao.AsFloat * 0.2) + ((cdsIQFiqf_pontual.AsFloat / cdsIQFiqf_remessa.AsFloat) * 30) + ((cdsIQFiqf_conforme.AsFloat / cdsIQFiqf_remessa.AsFloat) * 50);
//   end;

//   cdsIQFMesAno.AsString:= Copy(cdsIQF.FieldByName('iqf_anomes').AsString,5,2) + '/' + Copy(cdsIQF.FieldByName('iqf_anomes').AsString,1,4);

//   if dblForn.KeyValue <> null then begin
//      with dm.cdsAuxiliar do begin
//         Active:= False;
//         CommandText:= ' SELECT forn_nome FROM fornecedores ' +
//                       ' WHERE forn_codigo = ' + cdsIQFiqf_CodFornecedor.AsString; // IntToStr(dblForn.KeyValue);
//         Active:= True;
//
//         cdsIQFNomeForn.AsString:= FieldByName('forn_nome').AsString;
//      end;
//   end;

   if cdsIQFiqf_conforme.AsInteger = 1 then begin
      cdsIQFConforme.AsString:= 'SIM';
   end
   else begin
      cdsIQFConforme.AsString:= 'NÃO';
   end;

   if cdsIQFiqf_pontual.AsInteger = 1 then begin
      cdsIQFPontual.AsString:= 'SIM';
   end
   else begin
      cdsIQFPontual.AsString:= 'NÃO';
   end;
end;

procedure TForm_IQF.dbgIQFCellClick(Column: TColumn);
begin
   PreencheCampos;
   Botoes(False);
   dbgIQF.Enabled:= True;
end;

procedure TForm_IQF.dbgIQFKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure TForm_IQF.dblFornCloseUp(Sender: TObject);
begin
   edtAvaliacao.Value:= cdsFornforn_avaliacao.AsFloat;
end;

procedure TForm_IQF.edtAvaliacaoExit(Sender: TObject);
begin
//   edtIQF.Value:= CalcularIQF();
end;

procedure TForm_IQF.edtConformeExit(Sender: TObject);
begin
//   edtIQF.Value:= CalcularIQF();
   edtData.SetFocus;
end;

procedure TForm_IQF.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure TForm_IQF.FormShow(Sender: TObject);
begin
   with cdsForn do begin
      Active:= False;
      Active:= True;
   end;

   with cdsIQF do begin
      Active:= False;
      CommandText:= ' SELECT  iqf_CodFornecedor, iqf_codigo, iqf_conforme, iqf_data, iqf_NF, ' +
                    ' iqf_pontual, iqf_responsavel, iqf_obs ' +
                    ' FROM iqf_remessa' +
                    ' ORDER BY iqf_data';
      Active:= True;
   end;
   edtData.SetFocus;
   pnlImpressao.Visible:= False;
   edtDataInicial.Date:= Date();
   edtDataFinal.Date  := Date();
   LimpaCampos;
   Botoes(True);
end;

procedure TForm_IQF.LimpaCampos;
begin
   edtData.Date:= Date();
   edtAvaliacao.Clear;
   dblForn.KeyValue:= -1;
   cbPontual.ItemIndex:= 0;
   cbConforme.ItemIndex:= 0;
   edtNF.Clear;
   dblColaborador.KeyValue:= -1;
   edtData.SetFocus;
   sbExcluir.Enabled:= False;
   edtObs.Clear;
end;

procedure TForm_IQF.PreencheCampos;
begin
   if cdsIQF.RecordCount > 0 then begin
      edtData.Date           := cdsIQF.FieldByName('iqf_data').AsDateTime;
      dblForn.KeyValue       := cdsIQF.FieldByName('iqf_CodFornecedor').AsString;
      dblFornCloseUp(Self);
      cbPontual.ItemIndex    := cdsIQF.FieldByName('iqf_pontual').AsInteger;
      cbConforme.ItemIndex   := cdsIQF.FieldByName('iqf_conforme').AsInteger;
      edtNF.Text             := cdsIQF.FieldByName('iqf_NF').AsString;
      dblColaborador.KeyValue:= cdsIQF.FieldByName('iqf_responsavel').AsInteger;
      edtObs.Text            := cdsIQF.FieldByName('iqf_obs').AsString;
//      edtIQF.Value:= CalcularIQF();

      sbGravar.Caption:= 'Alterar';
   end;
end;

function TForm_IQF.ValidaCampos: Boolean;
begin
   Result:= True;
   if edtData.Text = '  /  /    ' then begin
      Result:= False;
      Application.MessageBox('Campo "Data" obrigatório !','Aviso',MB_OK+MB_ICONERROR);
      edtData.SetFocus;
      Exit;
   end;

   if dblForn.KeyValue = -1 then begin
      Result:= False;
      Application.MessageBox('Campo "Nome do Fornecedor" obrigatório !','Aviso',MB_OK+MB_ICONERROR);
      dblForn.SetFocus;
      Exit;
   end;
end;

end.
