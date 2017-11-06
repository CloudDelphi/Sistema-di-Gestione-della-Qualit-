unit frm_ColabProcedimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ComCtrls, JvgPage, Buttons,
  ExtCtrls, DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, rxToolEdit, rxCurrEdit, ImgList, JvComponentBase, JvBalloonHint,
  frxClass, frxDBSet, ShellAPI;

type
  TFormColabProcedimentos = class(TForm)
    pctColaboradores: TJvgPageControl;
    pnl1: TPanel;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnImprimir: TBitBtn;
    btnSair: TBitBtn;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    dsColaboradores: TDataSource;
    tsHabilidades: TTabSheet;
    lbl22: TLabel;
    lbl26: TLabel;
    dblProcedimentos: TDBLookupComboBox;
    zqryColabProcedimentos: TZQuery;
    dspColabProcedimentos: TDataSetProvider;
    cdsColabProcedimentos: TClientDataSet;
    dsColabProcedimentos: TDataSource;
    dbgProcedimentos: TDBGrid;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    dblColaboradores: TDBLookupComboBox;
    zqryProcedimentos: TZQuery;
    dspProcedimentos: TDataSetProvider;
    cdsProcedimentos: TClientDataSet;
    dsProcedimentos: TDataSource;
    cdsProcedimentoscodi_lis: TLargeintField;
    cdsProcedimentosidentificacao: TWideStringField;
    cdsColabProcedimentoscol_codigo: TIntegerField;
    cdsColabProcedimentospro_codproc: TIntegerField;
    cdsColabProcedimentosidentificacao: TWideStringField;
    pnlImprimir: TPanel;
    pnl2: TPanel;
    btnSairImp: TBitBtn;
    btnVideo: TBitBtn;
    btnImpressora: TBitBtn;
    pnl3: TPanel;
    frxDBDSColabProcedimentos: TfrxDBDataset;
    zqryImprimir: TZQuery;
    dspImprimir: TDataSetProvider;
    cdsImprimir: TClientDataSet;
    frxReport1: TfrxReport;
    pnl4: TPanel;
    lbl34: TLabel;
    dblColaborador: TDBLookupComboBox;
    chkTodosCol: TCheckBox;
    zqryColaboradorImp: TZQuery;
    dspColaboradorImp: TDataSetProvider;
    cdsColaboradorImp: TClientDataSet;
    LargeintField1: TLargeintField;
    WideStringField1: TWideStringField;
    dsColaboradorImp: TDataSource;
    cdsImprimircol_codigo: TIntegerField;
    cdsImprimirpro_codproc: TIntegerField;
    cdsImprimirnome_col: TWideStringField;
    cdsImprimiridentificacao: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados;
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure dbgColaboradoresDblClick(Sender: TObject);
    procedure ControlarAbas;
    procedure pctColaboradoresChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    function ValidarDados(): Boolean;
    procedure AtualizarDadosAcessorios();
    procedure dblColaboradoresCloseUp(Sender: TObject);
    procedure dblColaboradoresKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairImpClick(Sender: TObject);
    procedure Impressao(tipoImp: string);
    procedure chkTodosColClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnImpressoraClick(Sender: TObject);

  private
    { Private declarations }
    cOperacao: string;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormColabProcedimentos: TFormColabProcedimentos;

implementation

uses frm_dm, frm_Inicial, Funcoes;

{$R *.dfm}

procedure TFormColabProcedimentos.AtualizarDados;
begin
   with cdsColaboradores do begin
      Active:= False;
      Active:= True;
   end;

   with cdsProcedimentos do begin
      Active:= False;
      Active:= True;
   end;

   with cdsColaboradorImp do begin
      Active:= False;
      Active:= True;
   end;
end;

procedure TFormColabProcedimentos.AtualizarDadosAcessorios;
begin
   if (dblColaboradores.KeyValue <> -1) and (dblColaboradores.KeyValue <> Null) then begin
      with cdsColabProcedimentos do begin
         Active:= False;
         CommandText:= ' SELECT C.col_codigo, C.pro_codproc, ' +
                       ' cast(( L.iden_lis || ' + QuotedStr(' - ') + ' || L.desc_lis) as character varying(600)) as identificacao' +
                       ' FROM colab_procedimentos C' +
                       ' INNER JOIN lista_mestra L ON L.codi_lis = C.pro_codproc' +
                       ' WHERE C.col_codigo = ' + QuotedStr(dblColaboradores.KeyValue);
         Active:= True;
      end;
   end;
end;

procedure TFormColabProcedimentos.btnExcluirClick(Sender: TObject);
var
   sCodColaborador: string;
   sNomeColaborador: string;
   sDescTreinamento: string;
   sDescHabilidade: string;
begin
   if (Acesso(cUsuario, 33, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão do vínculo do procedimento ao colaborador ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM colab_procedimentos' +
                          ' WHERE col_codigo = ' + QuotedStr(dblColaboradores.KeyValue) +
                          ' AND pro_codproc = ' + QuotedStr(cdsColabProcedimentos.FieldByName('pro_codproc').AsString);
            Execute;
         end;

         Auditoria('CADASTRO DE PROCEDIMENTOS DE COLABORADORES',dblColaboradores.Text + '->' + cdsColabProcedimentos.FieldByName('identificacao').AsString,'E','');
         Application.MessageBox('Procedimento excluído', 'Aviso', MB_OK + MB_ICONINFORMATION);

         AtualizarDadosAcessorios();
      end;
   end;
end;

procedure TFormColabProcedimentos.btnGravarClick(Sender: TObject);
var
   sCodigoHistProf: string;
   sCodigoEducacao: string;
   sTipo: string;
begin
   case pctColaboradores.TabIndex of
      0: begin
         if ValidarDados() then begin
            try
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO colab_procedimentos (' +
                                ' col_codigo, pro_codproc, lis_novo' +
                                ' )' +
                                ' VALUES(' +
                                QuotedStr(dblColaboradores.KeyValue) + ',' +
                                QuotedStr(dblProcedimentos.KeyValue) + ',' +
                                QuotedStr('S') +
                                ')';
                     Execute;
               end;

               Auditoria('CADASTRO DE PROCEDIMENTOS DE COLABORADORES',dblColaboradores.Text + '->' + dblProcedimentos.Text,'I','');
               AtualizarDadosAcessorios();

//               Application.MessageBox('Registro gravado com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
            except
               on E:Exception do begin
                  Application.MessageBox(PChar('Erro ao gravar dados. Verifique' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
               end;
            end;
         end;
      end;
   end;

   cOperacao:= '';
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.btnImpressoraClick(Sender: TObject);
begin
   Impressao('I');
end;

procedure TFormColabProcedimentos.btnImprimirClick(Sender: TObject);
begin
   pnlImprimir.Top     := Self.Height div 2 - pnlImprimir.Height div 2 - 40;
   pnlImprimir.Left    := Self.Width div 2 - pnlImprimir.Width div 2;
   pnlImprimir.Visible := True;
end;

procedure TFormColabProcedimentos.btnPrimeiroClick(Sender: TObject);
begin
   cdsColaboradores.First;
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.btnAnteriorClick(Sender: TObject);
begin
   cdsColaboradores.Prior;
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.btnProximoClick(Sender: TObject);
begin
   cdsColaboradores.Next;
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.btnUltimoClick(Sender: TObject);
begin
   cdsColaboradores.Last;
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.btnVideoClick(Sender: TObject);
begin
   Impressao('V');
end;

procedure TFormColabProcedimentos.chkTodosColClick(Sender: TObject);
begin
   dblColaborador.Enabled:= not chkTodosCol.Checked;
end;

procedure TFormColabProcedimentos.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormColabProcedimentos.btnSairImpClick(Sender: TObject);
begin
   pnlImprimir.Visible := False;
end;

procedure TFormColabProcedimentos.ControlarAbas;
begin
   if pctColaboradores.TabIndex <= 4 then begin  // Cadastro
      AtualizarDadosAcessorios();

      if pctColaboradores.TabIndex > 0 then begin
         btnImprimir.Enabled:= False;
      end;
   end
   else begin // Pesquisa
      btnGravar.Enabled  := False;
      btnExcluir.Enabled := False;
      btnImprimir.Enabled:= False;

      AtualizarDadosAcessorios();
   end;
end;

procedure TFormColabProcedimentos.dbgColaboradoresDblClick(Sender: TObject);
begin
   pctColaboradores.TabIndex:= 0;
   ControlarAbas;
end;

procedure TFormColabProcedimentos.dblColaboradoresCloseUp(Sender: TObject);
begin
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.dblColaboradoresKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   AtualizarDadosAcessorios();
end;

procedure TFormColabProcedimentos.FormShow(Sender: TObject);
begin
   pnlImprimir.Visible := False;
   dblColaborador.Enabled    := False;
   chkTodosCol.Checked       := True;

   pctColaboradores.TabIndex:= 0;
   AtualizarDados();
end;

procedure TFormColabProcedimentos.pctColaboradoresChange(Sender: TObject);
begin
   ControlarAbas;
end;

function TFormColabProcedimentos.ValidarDados(): Boolean;
begin
   if (dblColaboradores.KeyValue = -1) or (dblColaboradores.KeyValue = Null) then begin
      Application.MessageBox('Esoolha um Colaborador', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblColaboradores);
      Result:= False;
      Exit;
   end;

   if (dblProcedimentos.KeyValue = -1) or (dblProcedimentos.KeyValue = Null) then begin
      Application.MessageBox('Escolha um Procedimento', 'Aviso', MB_OK + MB_ICONWARNING);
      TryFocus(dblProcedimentos);
      Result:= False;
      Exit;
   end;

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT count(*) as qtd' +
                    ' FROM colab_procedimentos C' +
                    ' INNER JOIN lista_mestra L ON L.codi_lis = C.pro_codproc' +
                    ' WHERE C.col_codigo = ' + QuotedStr(dblColaboradores.KeyValue) +
                    ' AND C.pro_codproc = ' + QuotedStr(dblProcedimentos.KeyValue);
      Active:= True;

      if FieldByName('QTD').AsInteger > 0 then begin
         Application.MessageBox('Procedimento já cadastrado', 'Aviso', MB_OK + MB_ICONWARNING);
         Result:= False;
         Exit;
      end;
   end;

   Result:= True;
end;

procedure TFormColabProcedimentos.Impressao(tipoImp: string);
begin
   with cdsImprimir do begin
      Active:= False;
      CommandText:= ' SELECT CP.col_codigo, CP.pro_codproc, C.nome_col,' +
                    ' cast(( L.iden_lis || ' + QuotedStr(' - ') + ' || L.desc_lis) as character varying(600)) as identificacao' +
                    ' FROM colab_procedimentos CP' +
                    ' INNER JOIN lista_mestra L ON L.codi_lis = CP.pro_codproc' +
                    ' INNER JOIN colaboradores C ON C.codi_col = CP.col_codigo' +
                    ' WHERE 1 = 1';
               if chkTodosCol.Checked = False then begin
                  CommandText:= CommandText + ' AND C.codi_col = ' + IntToStr(dblColaborador.KeyValue);
               end;
               CommandText:= CommandText + ' ORDER BY C.nome_col';
      Active:= True;
   end;

   if cdsImprimir.RecordCount = 0 then begin
      Application.MessageBox('Não há registros para este colaborador','Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   with frxReport1 do begin
      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_ColabProcedimentos.fr3');

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

end.
