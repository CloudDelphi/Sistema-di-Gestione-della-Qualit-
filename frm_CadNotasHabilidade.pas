unit frm_CadNotasHabilidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit, rxCurrEdit, Grids,
  DBGrids, DBCtrls, ComCtrls, JvgPage, DB, DBClient, Provider,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFormCadNotasHabilidade = class(TForm)
    pctColaboradores: TJvgPageControl;
    tsHabilidades: TTabSheet;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl26: TLabel;
    lbl250: TLabel;
    lbl33: TLabel;
    edtNomeHab: TEdit;
    edtCodigoCol: TEdit;
    dblHabilidades: TDBLookupComboBox;
    dbg1: TDBGrid;
    edtNota: TCurrencyEdit;
    edtAno: TEdit;
    btnInserirTodos: TBitBtn;
    pnlCopiarHab: TPanel;
    pnl7: TPanel;
    btnCopiarHab: TBitBtn;
    btnCancelarHab: TBitBtn;
    pnl8: TPanel;
    pnl10: TPanel;
    lbl37: TLabel;
    edtAnoCopia: TEdit;
    pnl1: TPanel;
    btnCopiaFuncao: TBitBtn;
    zqryHabilidades: TZQuery;
    dspHabilidades: TDataSetProvider;
    cdsHabilidades: TClientDataSet;
    cdsHabilidadescodi_hab: TIntegerField;
    cdsHabilidadesdesc_hab: TWideStringField;
    dsHabilidades: TDataSource;
    zqryHabilidadesCol: TZQuery;
    dspHabilidadesCol: TDataSetProvider;
    cdsHabilidadesCol: TClientDataSet;
    cdsHabilidadesColcodi_col: TLargeintField;
    cdsHabilidadesColcodi_hab: TLargeintField;
    cdsHabilidadesColdesc_hab: TWideStringField;
    cdsHabilidadesColnota_hab: TFloatField;
    cdsHabilidadesColhab_ano: TWideStringField;
    dsHabilidadesCol: TDataSource;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    pnlFuncoes: TPanel;
    pnl3: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    pnl4: TPanel;
    pnl5: TPanel;
    lbl1: TLabel;
    zqryFuncoes: TZQuery;
    dspFuncoes: TDataSetProvider;
    cdsFuncoes: TClientDataSet;
    cdsFuncoescodi_fun: TLargeintField;
    cdsFuncoesdesc_fun: TWideStringField;
    dsFuncoes: TDataSource;
    dblFuncao: TDBLookupComboBox;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure AtualizarDados();
    procedure btnSairClick(Sender: TObject);
    procedure PreencherCampos();
    procedure HabilitarCampos(Flag: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);
    procedure dbg1CellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirTodosClick(Sender: TObject);
    procedure btnCopiarHabClick(Sender: TObject);
    procedure btnCopiaFuncaoClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao: string;
    sNovoCodigo: string;
  public
    { Public declarations }
  end;

var
  FormCadNotasHabilidade: TFormCadNotasHabilidade;

implementation

uses Funcoes, frm_Inicial, frm_dm, frm_VisualizaMatriz;

{$R *.dfm}

procedure TFormCadNotasHabilidade.AtualizarDados;
var
   sAno: string;
begin
   with cdsHabilidades do begin
      Active:= False;
      Active:= True;
   end;

   with cdsFuncoes do begin
      Active:= False;
      Active:= True;
   end;

   // Busca o último ano da habilidade cadastrada
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(hab_ano) as MaiorAno FROM colab_habilidades' +
                    ' WHERE codi_col = ' + AllTrim(edtCodigoCol.Text);
      Active:= True;

      sAno:= FieldByName('MaiorAno').AsString;
   end;

   with cdsHabilidadesCol do begin
      Active:= False;
      CommandText:= ' SELECT C.codi_col, C.codi_hab, C.nota_hab, C.hab_ano, H.desc_hab' +
                    ' FROM colab_habilidades C' +
                    ' INNER JOIN habilidades H ON H.codi_hab = C.codi_hab' +
                    ' WHERE codi_col = ' + AllTrim(edtCodigoCol.Text) +
                    ' AND C.hab_ano = ' + QuotedStr(sAno) +
                    ' ORDER BY H.desc_hab';
      Active:= True;
   end;
end;

procedure TFormCadNotasHabilidade.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
//   btnImprimir.Enabled:= Flag;

   if cdsHabilidadesCol.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure TFormCadNotasHabilidade.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 6, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True);
      Botoes(False);
      TryFocus(edtNota);
   end;
end;

procedure TFormCadNotasHabilidade.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
   HabilitarCampos(False);
end;

procedure TFormCadNotasHabilidade.btnCopiaFuncaoClick(Sender: TObject);
begin
   AbrePanel(pnlFuncoes, Self);
   TryFocus(dblFuncao);
end;

procedure TFormCadNotasHabilidade.btnCopiarHabClick(Sender: TObject);
var
   iResp: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, codi_hab, nota_hab, codi_pla, hab_ano' +
                    ' FROM colab_habilidades' +
                    ' WHERE hab_ano = ' + QuotedStr(edtAnoCopia.Text) +
                    ' AND codi_col = ' + QuotedStr(edtCodigoCol.Text);
      Active:= True;

      if RecordCount <= 0 then begin
         Application.MessageBox(PChar('Não existem habilidades cadastradas para o ano de ' + edtAnoCopia.Text), 'Aviso', MB_OK + MB_ICONWARNING);
         TryFocus(edtAnoCopia);
         Exit;
      end;

      // Verifica se alguma habilidade do ano selecionado já está cadastrado e pede confirmação
      with dm.cdsAux do begin
         Active:= False;
         CommandText:= ' SELECT codi_col, codi_hab, nota_hab, codi_pla, hab_ano' +
                       ' FROM colab_habilidades' +
                       ' WHERE hab_ano = ' + QuotedStr(FormatDateTime('yyyy',Date())) +
                       ' AND codi_col = ' + QuotedStr(edtCodigoCol.Text);
         Active:= True;
      end;

      if dm.cdsAux.RecordCount > 0 then begin
         iResp:= Application.MessageBox(PChar('Já existem habilidades cadastradas para o ano de ' + FormatDateTime('yyyy',Date())), 'Aviso', MB_YESNO + MB_ICONQUESTION);
      end
      else begin
         iResp:= 6; // Sim  7 -> Não
      end;

      if iResp = 6 then begin
         First;
         while not Eof do begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO colab_habilidades (codi_col, codi_hab, nota_hab, hab_ano)' +
                             ' VALUES(' +
                             dm.cdsAuxiliar.FieldByName('codi_col').AsString + ',' +
                             dm.cdsAuxiliar.FieldByName('codi_hab').AsString + ',' +
                             '0,' + // Nota zerada
                             QuotedStr(FormatDateTime('yyyy',Date())) +
                             ')';
               Execute;
            end;

            Next;
         end;
      end;
   end;

   pnlCopiarHab.Visible:= False;
end;

procedure TFormCadNotasHabilidade.btnExcluirClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 6, 'exclusao') = 1) then begin
      if Application.MessageBox('Confirma a exclusão da habilidade ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then begin

         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM colab_habilidades' +
                          ' WHERE codi_col = ' + edtCodigoCol.Text +
                          ' AND codi_hab = ' + cdsHabilidadesColcodi_hab.AsString +
                          ' AND hab_ano = ' + QuotedStr(cdsHabilidadesColhab_ano.AsString) ;
            Execute;
         end;

         Auditoria('CADASTRO DE HABILIDADES TARTARUGA', edtNomeHab.Text + ' - ' + dblHabilidades.Text + ' ' + edtAno.Text,'E','');
         AtualizarDados();
      end;
   end;
end;

procedure TFormCadNotasHabilidade.btnGravarClick(Sender: TObject);
begin
   try
      with cdsGravar do begin
         Active:= False;
         if cOperacao = 'I' then begin
            // Verifica se a habilidade já foi cadastrada
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' SELECT COUNT(*) AS QTD' +
                             ' FROM colab_habilidades' +
                             ' WHERE codi_col = ' + AllTrim(edtCodigoCol.Text) +
                             ' AND codi_hab = ' + IntToStr(dblHabilidades.KeyValue) +
                             ' AND hab_ano = ' + QuotedStr(edtAno.Text);
               Active:= True;

               if FieldByName('QTD').AsInteger > 0 then begin
                  Application.MessageBox(PChar('Habilidade já cadastrada para o ano de ' + edtAno.Text), 'Aviso', MB_OK + MB_ICONWARNING);
                  Exit;
               end;
            end;

            CommandText:= ' INSERT INTO colab_habilidades (codi_col, codi_hab, nota_hab, hab_ano)' +
                          ' VALUES(' +
                          AllTrim(edtCodigoCol.Text) + ',' +
                          IntToStr(dblHabilidades.KeyValue) + ',' +
                          VirgulaParaPonto(edtNota.Value, 2) + ',' +
                          QuotedStr(edtAno.Text) +
                          ')';
         end
         else begin
            CommandText:= ' UPDATE colab_habilidades SET' +
                          ' nota_hab = ' + VirgulaParaPonto(edtNota.Value, 2) +
                          ' WHERE codi_hab = ' + cdsHabilidadesColcodi_hab.AsString +
                          ' AND codi_col = ' + edtCodigoCol.Text +
                          ' AND hab_ano = ' + QuotedStr(edtAno.Text);
         end;
         Execute;

         Auditoria('CADASTRO DE HABILIDADE TARTARUGA', edtNomeHab.Text + ' - ' + dblHabilidades.Text + ' ' + edtAno.Text, cOperacao, '');
      end;

      cOperacao:= '';
      AtualizarDados();
      HabilitarCampos(False);
      Botoes(True);
   except
      on E: Exception do begin
         MostrarErro('Erro ao gravar habilidade!', E.Message, Self.Name);
      end;
   end;
end;

procedure TFormCadNotasHabilidade.btnInserirTodosClick(Sender: TObject);
begin
   AbrePanel(pnlCopiarHab, Self);
   TryFocus(edtAnoCopia);
end;

procedure TFormCadNotasHabilidade.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   Botoes(False);
   edtAno.Text:= Copy(ArrumaDataSQL(Date()), 2, 4);
   HabilitarCampos(True);
   TryFocus(dblHabilidades);
end;

procedure TFormCadNotasHabilidade.btnSairClick(Sender: TObject);
begin
   FormVisualizaMatriz.dblColaboradorCloseUp(Self);
   Self.Close;
end;

procedure TFormCadNotasHabilidade.dbg1CellClick(Column: TColumn);
begin
   PreencherCampos();
end;

procedure TFormCadNotasHabilidade.FormShow(Sender: TObject);
begin
   AtualizarDados();
   Botoes(True);
   HabilitarCampos(False);
end;

procedure TFormCadNotasHabilidade.HabilitarCampos(Flag: Boolean);
begin
   if cOperacao <> 'A' then begin
      dblHabilidades.Enabled := Flag;
      edtAno.Enabled         := Flag;
   end;
   edtNota.Enabled        := Flag;
end;

procedure TFormCadNotasHabilidade.PreencherCampos;
begin
   with cdsHabilidadesCol do begin
      dblHabilidades.KeyValue:= FieldByName('codi_hab').AsString;
      edtNota.Value          := FieldByName('nota_hab').AsFloat;
      edtAno.Text            := FieldByName('hab_ano').AsString;
   end;
end;

end.
