unit frm_VisualizaDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, ShellAPI, DBClient, DB,
  Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormVisualizaDocumentos = class(TForm)
    Panel1: TPanel;
    dbgProcedimentos: TDBGrid;
    lblCodigo: TLabel;
    zqryListaMestra: TZQuery;
    dspListaMestra: TDataSetProvider;
    cdsListaMestra: TClientDataSet;
    dsListaMestra: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    cdsListaMestraDescTipo: TStringField;
    cdsListaMestraapro_lis: TWideStringField;
    cdsListaMestraarqu_lis: TWideMemoField;
    cdsListaMestraatua_lis: TWideStringField;
    cdsListaMestracodi_lis: TLargeintField;
    cdsListaMestradata_lis: TDateTimeField;
    cdsListaMestradesc_lis: TWideStringField;
    cdsListaMestradtap_lis: TDateTimeField;
    cdsListaMestraiden_lis: TWideStringField;
    cdsListaMestraproc_lis: TLargeintField;
    cdsListaMestraquem_lis: TLargeintField;
    cdsListaMestraresp_lis: TLargeintField;
    cdsListaMestrarevi_lis: TWideStringField;
    cdsListaMestratipo_lis: TLargeintField;
    cdsListaMestraqtde_lis: TLargeintField;
    cdsListaMestraarma_lis: TWideStringField;
    cdsListaMestralis_novo: TWideStringField;
    cdsListaMestralis_treinamento: TIntegerField;
    btnVisualizar: TBitBtn;
    btnSair: TBitBtn;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure dbgProcedimentosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados();
    procedure cdsListaMestraCalcFields(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure AtualizarTreinamentoColaborador();
  private
    { Private declarations }
  public
    { Public declarations }
    iTela: integer;
    sCodColaborador: string;

  end;

var
  FormVisualizaDocumentos: TFormVisualizaDocumentos;
  ContProcedimentos: integer;
  sCodProcesso: string;


implementation

uses frm_dm, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormVisualizaDocumentos.AtualizarDados;
begin
   if iTela = 1 then begin // Tartaruga
      with cdsListaMestra do begin
         Active:= False;
         CommandText:= ' SELECT apro_lis, arqu_lis, atua_lis, '+
                       ' codi_lis, data_lis, desc_lis, dtap_lis,' +
                       ' iden_lis, proc_lis, quem_lis, resp_lis,' +
                       ' revi_lis, tipo_lis, qtde_lis, arma_lis, lis_novo, lis_treinamento ' +
                       ' FROM lista_mestra ' +
                       ' INNER JOIN lista_mestra_proc P ON P.lis_codiDocumento = codi_lis ' +
                       ' WHERE P.lis_codiProcesso = ' + QuotedStr(sCodProcesso) +
                       ' ORDER BY iden_lis';
         Active:= True;
      end;
   end;

   if iTela = 2 then begin // Menu Procedimentos de colaboradores
      with cdsListaMestra do begin
         Active:= False;
         CommandText:= ' SELECT apro_lis, arqu_lis, atua_lis, '+
                       ' codi_lis, data_lis, desc_lis, dtap_lis,' +
                       ' iden_lis, proc_lis, quem_lis, resp_lis,' +
                       ' revi_lis, tipo_lis, qtde_lis, arma_lis, lis_novo, lis_treinamento ' +
                       ' FROM lista_mestra ' +
                       ' INNER JOIN colab_procedimentos CP ON CP.pro_codproc = codi_lis ' +
                       ' WHERE CP.col_codigo = ' + QuotedStr(sCodColaborador) +
                       ' ORDER BY iden_lis';
         Active:= True;
      end;
   end;
end;

procedure TFormVisualizaDocumentos.AtualizarTreinamentoColaborador;
begin
   // Se não tiver um treinamento relacionado no documento, não grava o treinamento no usuário
   if (cdsListaMestralis_treinamento.AsString = '-1') OR (cdsListaMestralis_treinamento.AsString = '') then begin
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_col' +
                    ' FROM Colaboradores' +
                    ' WHERE col_usuario = ' + QuotedStr(cUsuario);
      Active:= True;
   end;

   // Se existir um colaborador relacionado a um usuário do sistema
   if dm.cdsAuxiliar.RecordCount > 0 then begin
      // Verifica se existe o treinamento para o colaborador
      with dm.cdsaux2 do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) as Qtd' +
                       ' FROM Colab_treinamentos' +
                       ' WHERE codi_col = ' + dm.cdsAuxiliar.FieldByName('codi_col').AsString +
                       ' AND codi_tre = ' + cdsListaMestralis_treinamento.AsString;
         Active:= True;
      end;

      // Se encontrar o treinamento na matriz de competências do colaborador atualiza
      if dm.cdsaux2.FieldByName('Qtd').AsInteger > 0 then begin
         with dm.cdsaux3 do begin
            Active:= False;
            CommandText:= ' UPDATE Colab_treinamentos SET' +
                          ' dtre_tre = ' + ArrumaDataSQL(Date()) + ',' +
                          ' dtpr_tre = ' + ArrumaDataSQL(Date()) +
                          ' WHERE codi_col = ' + dm.cdsAuxiliar.FieldByName('codi_col').AsString +
                          ' AND codi_tre = ' + cdsListaMestralis_treinamento.AsString;
            Execute;
         end;
      end
      else begin
         // Se não encontrar o treinamento na matriz de competências do colaborador inclui
         with dm.cdsaux3 do begin
            Active:= False;
            CommandText:= ' INSERT INTO Colab_treinamentos (codi_col, codi_tre, dtpr_tre, dtre_tre, tipo_tre) ' +
                          ' VALUES (' +
                          dm.cdsAuxiliar.FieldByName('codi_col').AsString + ',' +
                          cdsListaMestralis_treinamento.AsString + ',' +
                          ArrumaDataSQL(Date()) + ',' +
                          ArrumaDataSQL(Date()) + ',' +
                          QuotedStr('D') +
                          ')';
            Execute;
         end;
      end;
   end;
end;

procedure TFormVisualizaDocumentos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormVisualizaDocumentos.btnVisualizarClick(Sender: TObject);
var
   bFlagViu: Boolean;
begin
   if cdsListaMestra.RecordCount <= 0 then begin
      Application.MessageBox('Não existem Procedimentos Documentados para esse processo', 'Aviso', MB_OK + MB_ICONWARNING);
   end
   else begin
      try
         AbrirArquivo(cdsListaMestra.FieldByName('arqu_lis').AsString, Self.Name);
         bFlagViu:= True;

         if cdsListaMestra.FieldByName('apro_lis').AsString = 'S' then begin
            if iTela = 1 then begin // Tartaruga
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE lista_mestra_proc SET' +
                                ' lis_novo = ' + QuotedStr('N') +
                                ' WHERE lis_codiProcesso = ' + QuotedStr(sCodProcesso) +
                                ' AND lis_codiDocumento = ' + cdsListaMestracodi_lis.AsString;
                  Execute;
               end;
            end;
            if iTela = 2 then begin // Menu Procedimentos Colaboradores
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE colab_procedimentos SET' +
                                ' lis_novo = ' + QuotedStr('N') +
                                ' WHERE col_codigo = ' + QuotedStr(sCodColaborador) +
                                ' AND pro_codproc = ' + cdsListaMestracodi_lis.AsString;
                  Execute;
               end;
            end;
         end;
      finally
         if bFlagViu = True then begin
            Auditoria('LISTA_MESTRA',cdsListaMestra.FieldByName('iden_lis').AsString,'LIDA', cdsListaMestra.FieldByName('revi_lis').AsString);
            AtualizarTreinamentoColaborador();
         end;

         AtualizarDados();
   //      on E: Exception do
   //         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;

end;

procedure TFormVisualizaDocumentos.cdsListaMestraCalcFields(DataSet: TDataSet);
begin
   with cdsListaMestra do begin
      if FieldByName('tipo_lis').AsInteger = 1 then begin
         FieldByName('DescTipo').AsString:= 'EXTERNO'
      end
      else begin
         FieldByName('DescTipo').AsString:= 'INTERNO';
      end;
   end;
end;

procedure TFormVisualizaDocumentos.dbgProcedimentosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if cdsListaMestra.FieldByName('apro_lis').AsString = 'N' then begin
     dbgProcedimentos.Canvas.Font.Color:= clRed;
     dbgProcedimentos.DefaultDrawDataCell(Rect, dbgProcedimentos.columns[datacol].field, State);
     ContProcedimentos:= ContProcedimentos + 1;
  end
  else begin
     if cdsListaMestra.FieldByName('lis_novo').AsString = 'S' then begin
        dbgProcedimentos.Canvas.Font.Color:= clBlue;
        dbgProcedimentos.DefaultDrawDataCell(Rect, dbgProcedimentos.columns[datacol].field, State);
     end;
  end;
end;

procedure TFormVisualizaDocumentos.FormShow(Sender: TObject);
begin
   ContProcedimentos:= 0;
   if iTela = 1 then begin // Tartaruga
      sCodProcesso:= lblCodigo.Caption;
   end;
   if iTela = 2 then begin // Menu Procedimentos Colaboradores
      sCodProcesso:= '0';
      Self.Caption:= Self.Caption + ' (Colaboradores)';
   end;

   AtualizarDados();

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' select nome_pro from processos' +
                    ' where codi_pro = ' + QuotedStr(sCodProcesso);
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_pro').AsString;
   end;


end;

end.
