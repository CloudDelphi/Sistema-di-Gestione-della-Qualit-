unit frm_PlanoAcaoMatriz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, rxToolEdit, DBCtrls, Grids, DBGrids,
  DB, DBClient, Provider, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tt_PlanoAcaoMatriz = class(TForm)
    Panel1: TPanel;
    mmoAcao: TMemo;
    dblResponsavel: TDBLookupComboBox;
    dtPrazo: TDateEdit;
    lb1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    mmoVerif_eficacia: TMemo;
    Label3: TLabel;
    lb2: TLabel;
    dblEficaz: TDBLookupComboBox;
    zqryColaboradores: TZQuery;
    dspColaboradores: TDataSetProvider;
    cdsColaboradores: TClientDataSet;
    cdsColaboradorescodi_col: TLargeintField;
    cdsColaboradoresconc_col: TWideStringField;
    cdsColaboradoreseduc_col: TLargeintField;
    cdsColaboradoresesco_col: TWideStringField;
    cdsColaboradoresexpe_col: TLargeintField;
    cdsColaboradoresfunc_col: TLargeintField;
    cdsColaboradoresnome_col: TWideStringField;
    cdsColaboradoresproc_col: TLargeintField;
    cdsColaboradoresobs_col: TMemoField;
    cdsColaboradoresDescExpe: TStringField;
    cdsColaboradoresDescFunc: TStringField;
    dsColaboradores: TDataSource;
    zqryEficaz: TZQuery;
    dspEficaz: TDataSetProvider;
    cdsEficaz: TClientDataSet;
    dsEficaz: TDataSource;
    cdsEficazcodi_com: TLargeintField;
    cdsEficazvalo_com: TWideStringField;
    zqryPlanoAcao: TZQuery;
    dspPlanoAcao: TDataSetProvider;
    cdsPlanoAcao: TClientDataSet;
    cdsPlanoAcaoAcao: TStringField;
    dsPlanoAcao: TDataSource;
    pnlNomeColaborador: TPanel;
    lblCodigo: TLabel;
    lbl1: TLabel;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    dsGravar: TDataSource;
    cdsColaboradorescol_status: TIntegerField;
    cdsPlanoAcaoacao_pla: TWideMemoField;
    cdsPlanoAcaocodi_pla: TLargeintField;
    cdsPlanoAcaocola_pla: TLargeintField;
    cdsPlanoAcaocome_pla: TWideMemoField;
    cdsPlanoAcaoefic_pla: TWideStringField;
    cdsPlanoAcaopraz_pla: TDateTimeField;
    cdsPlanoAcaoresp_pla: TLargeintField;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure LimparCampos;
    procedure mmoAcaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Botoes(Flag: Boolean);
    procedure HabilitarCampos(Flag: Boolean; Codigo: Boolean);
    procedure PreencherCampos;
    procedure btnCancelarClick(Sender: TObject);
    function BuscarNovoCodigo(): string;
  private
    { Private declarations }
    cOperacao: Char;
    iCodColab: Integer;
    iCodHabil: Integer;

  public
    { Public declarations }
    cTipo     : string;
    iCodPlano : Integer;
    iCodHabTre: Integer;
    iTela     : Integer;
    cAnoHab   : string;
  end;

var
  t_PlanoAcaoMatriz: Tt_PlanoAcaoMatriz;

implementation

uses frm_dm, Funcoes, frm_VisualizaMatriz, frm_Inicial, frm_CadColaborador;

{$R *.dfm}

procedure Tt_PlanoAcaoMatriz.Botoes(Flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnExcluir.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;
end;

procedure Tt_PlanoAcaoMatriz.btnAlterarClick(Sender: TObject);
begin
   cOperacao:= 'A';
   HabilitarCampos(True, True);
   Botoes(False);
end;

procedure Tt_PlanoAcaoMatriz.btnCancelarClick(Sender: TObject);
begin
   Botoes(False);
end;

procedure Tt_PlanoAcaoMatriz.btnExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
      try
         if iTela = 1 then begin // Matriz de Competências
            if cTipo = 'T' then begin // Treinamentos
               iCodColab:= FormVisualizaMatriz.cdsTreinamentos.FieldByName('codi_col').AsInteger;
            end
            else begin // Habilidades
               iCodColab:= FormVisualizaMatriz.cdsHabilidadescodi_col.AsInteger;
            end;
            FormVisualizaMatriz.dblColaboradorCloseUp(Self);
         end;
         if iTela = 2 then begin // Cadastro de Colaboradores
            if cTipo = 'T' then begin // Treinamentos
               iCodColab:= FormCadColaboradores.cdsTreinamentosCol.FieldByName('codi_col').AsInteger;
            end
            else begin // Habilidades
//               iCodColab:= FormCadColaboradores.cdsHabilidadescodi_col.AsInteger;
            end;
         end;

         // Apaga a referência no treinamento
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' UPDATE colab_treinamentos SET' +
                          ' codi_pla = 0' +
                          ' WHERE codi_col = ' + IntToStr(iCodColab) +
                          ' AND codi_tre = ' + IntToStr(iCodHabTre);
            Execute;
         end;

         // Apaga o plano de ação da tabela
         with cdsGravar do begin
            Active:= False;
            CommandText:= ' DELETE FROM planoacao' +
                          ' WHERE codi_pla = ' + cdsPlanoAcaocodi_pla.AsString;
            Execute;
         end;

         LimparCampos();
         Botoes(True);

         btnAlterar.Enabled:= False;
         btnExcluir.Enabled:= False;
      Except

      end;
   end;
end;

procedure Tt_PlanoAcaoMatriz.btnGravarClick(Sender: TObject);
var
   cNovoCodigo: string;
begin
   cNovoCodigo:= '0';

   if iTela = 1 then begin // Matriz de Competências
      if cTipo = 'T' then begin // Treinamentos
         iCodColab:= FormVisualizaMatriz.cdsTreinamentos.FieldByName('codi_col').AsInteger;
      end
      else begin // Habilidades
         iCodColab:= FormVisualizaMatriz.cdsHabilidades.FieldByName('codi_col').AsInteger;
      end;
   end
   else begin // iTela = 2 -> Cadastro de Colaboradores
      if cTipo = 'T' then begin // Treinamentos
         iCodColab:= FormCadColaboradores.cdsTreinamentosCol.FieldByName('codi_col').AsInteger;
      end
      else begin // Habilidades
//         iCodColab:= FormCadColaboradores.cdsHabilidadescodi_col.AsInteger;
      end;
   end;

   try
      if ValidaCampos() then begin
         with cdsPlanoAcao do begin
            Active:= True;
            if cOperacao = 'I' then begin
               cNovoCodigo:= BuscarNovoCodigo();
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO planoacao (codi_pla, acao_pla, resp_pla, praz_pla, ' +
                                ' come_pla, efic_pla, cola_pla) VALUES (' +
                                QuotedStr(cNovoCodigo) + ',' +
                                QuotedStr(mmoAcao.Text) + ',' +
                                IntToStr(dblResponsavel.KeyValue) + ',' +
                                ArrumaDataSQL(dtPrazo.Date) + ',' +
                                QuotedStr(mmoVerif_eficacia.Text) + ',' +
                                IntToStr(dblEficaz.KeyValue) + ',' +
                                QuotedStr(IntToStr(iCodColab)) +
                                ')';
                  Execute;
               end;
            end
            else begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE planoacao SET ' +
                                ' acao_pla = ' + QuotedStr(mmoAcao.Text) + ',' +
                                ' resp_pla = ' + IntToStr(dblResponsavel.KeyValue) + ',' +
                                ' praz_pla = ' + ArrumaDataSQL(dtPrazo.Date) + ',' +
                                ' come_pla = ' + QuotedStr(mmoVerif_eficacia.Text) + ',' +
                                ' efic_pla = ' + IntToStr(dblEficaz.KeyValue) + ',' +
                                ' cola_pla = ' + QuotedStr(IntToStr(iCodColab)) +
                                ' WHERE codi_pla = ' + cdsPlanoAcaocodi_pla.AsString;
                  Execute;
               end;
            end;
         end;
         Auditoria('PLANO DE AÇÃO', mmoAcao.Text, cOperacao, '');
//         LimparCampos;

//      dm.cdsAuxiliar.Active:= False;
//      TryFocus(mmoAcao);
         Botoes(True);
         btnNovo.Enabled:= False;
         HabilitarCampos(False, False);

         Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E:Exception do begin
         TryFocus(mmoAcao);
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end; // try

   // Atualiza o registro de treinamento com o código do Plano de Ação correspondente
   if cOperacao = 'I' then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         if cTipo = 'T' then begin // Treinamentos
            CommandText:= ' UPDATE colab_treinamentos ' +
                          ' SET codi_pla = ' + QuotedStr(cNovoCodigo) +
                          ' WHERE codi_col = ' + IntToStr(iCodColab) +
                          ' AND codi_tre = ' + IntToStr(iCodHabTre);
         end
         else begin // Habilidades
            CommandText:= ' UPDATE colab_habilidades ' +
                          ' SET codi_pla = ' + QuotedStr(cNovoCodigo) +
                          ' WHERE codi_col = ' + IntToStr(iCodColab) +
                          ' AND codi_hab = ' + IntToStr(iCodHabTre) +
                          ' AND hab_ano = ' + QuotedStr(cAnoHab);
         end;
         Execute;
      end;
   end;

   // Atualiza os dados de Treinamentos e Habilidades Na matriz de Competência
   if iTela = 1 then begin // Matriz de Competências
      with FormVisualizaMatriz.cdsHabilidades do begin
         Active:= False;
         Active:= True;
      end;

      with FormVisualizaMatriz.cdsTreinamentos do begin
         Active:= False;
         Active:= True;
      end;
   end;

   // Atualiza os dados de Treinamentos e Habilidades no cadastro de Colaboradores
   if iTela = 2 then begin // Matriz de Competências
      with FormCadColaboradores.cdsHabilidadesCol do begin
         Active:= False;
         Active:= True;
      end;

      with FormCadColaboradores.cdsTreinamentosCol do begin
         Active:= False;
         Active:= True;
      end;
   end;
end;

procedure Tt_PlanoAcaoMatriz.btnNovoClick(Sender: TObject);
begin
   cOperacao:= 'I';
   LimparCampos();
   Botoes(False);
   btnExcluir.Enabled := False;
   btnAlterar.Enabled := False;
   HabilitarCampos(True, False);

   if cdsPlanoAcao.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
   end;
end;

procedure Tt_PlanoAcaoMatriz.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

function Tt_PlanoAcaoMatriz.BuscarNovoCodigo: string;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= 'SELECT MAX(codi_pla) + 1 NovoCodigo FROM PlanoAcao';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= '1'
      end
      else begin
         Result:= FieldByName('NovoCodigo').AsString;
      end;
   end;
end;

procedure Tt_PlanoAcaoMatriz.FormShow(Sender: TObject);
//var
//   iCodPlano: Integer;
begin
   LimparCampos;

//   if cTipo = 'T' then begin // Treinamentos
//      iCodPlano:= FormVisualizaMatriz.cdsTreinamentoscodi_pla.AsInteger;
//   end
//   else begin // Habilidades
//      iCodPlano:= FormVisualizaMatriz.cdsHabilidadescodi_pla.AsInteger;
//   end;

   // Seleciona somente os planos de ação do colaborador selecionado
   with cdsPlanoAcao do begin
      Active:= False;
//      CommandText:= ' SELECT * FROM planoacao ' +
//                    ' WHERE cola_pla = ' + lblCodigo.Caption +
//                    ' AND codi_pla = ' + IntToStr(iCodPlano);
      CommandText:= ' SELECT * FROM planoacao ' +
                    ' WHERE codi_pla = ' + IntToStr(iCodPlano);
      Active:= True;
   end;

   PreencherCampos();

   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT nome_col FROM Colaboradores' +
                    ' WHERE codi_col = ' + lblCodigo.Caption;
      Active:= True;

      lblCodigo.Caption:= FieldByName('nome_col').AsString;
   end;

   with cdsEficaz do begin
      Active:= False;
      CommandText:= ' SELECT codi_com, valo_com FROM tabela_combos' +
                    ' WHERE tipo_com = 14' +
                    ' ORDER BY orde_com';
      Active:= True;
   end;

   // Mostra o nome de todos os colaboradores para seleção de Responsável pelo Plano de Ação
   with cdsColaboradores do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, conc_col, educ_col, esco_col, expe_col, ' +
                    ' func_col, nome_col, proc_col, obs_col, col_status ' +
                    ' FROM Colaboradores' +
                    ' WHERE col_status = 1' +
                    ' ORDER BY nome_col';
      Active:= True;
   end;

   Botoes(True);

   HabilitarCampos(False, False);

   if cdsPlanoAcao.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnExcluir.Enabled:= False;
      btnNovo.Enabled   := True;
   end
   else begin
      btnAlterar.Enabled:= True;
      btnExcluir.Enabled:= True;
      btnNovo.Enabled   := False;
   end;
end;

procedure Tt_PlanoAcaoMatriz.HabilitarCampos(Flag, Codigo: Boolean);
begin
   mmoAcao.Enabled          := Flag;
   mmoVerif_eficacia.Enabled:= Flag;
   dblResponsavel.Enabled   := Flag;
   dtPrazo.Enabled          := Flag;
   dblEficaz.Enabled        := Flag;
end;

procedure Tt_PlanoAcaoMatriz.LimparCampos;
begin
//   mAcao.Clear;
   dblResponsavel.KeyValue:= -1;
   dtPrazo.Clear;
   mmoVerif_eficacia.Clear;
   dblEficaz.KeyValue:= 1;
//   sbExcluir.Enabled:= False;
//   sbGravar.Caption:= 'Gravar';
//   mmoAcao.SetFocus;
end;

procedure Tt_PlanoAcaoMatriz.mmoAcaoKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure Tt_PlanoAcaoMatriz.PreencherCampos;
begin
   if cdsPlanoAcao.RecordCount > 0 then begin
      mmoAcao.Text           := cdsPlanoAcao.FieldByName('acao_pla').AsString;
      dblResponsavel.KeyValue:= cdsPlanoAcao.FieldByName('resp_pla').AsString;
      dtPrazo.Date           := cdsPlanoAcao.FieldByName('praz_pla').AsDateTime;
      mmoVerif_eficacia.Text := cdsPlanoAcao.FieldByName('come_pla').AsString;
      dblEficaz.KeyValue     := cdsPlanoAcao.FieldByName('efic_pla').AsString;
//      if cdsPlanoAcaoefic_pla.AsString = 'S' then begin
//         dblEficaz.KeyValue:= 0
//      end
//      else begin
//         dblEficaz.KeyValue:= 1;
//      end;

//      sbGravar.Caption:= 'Alterar';
//      sbExcluir.Enabled:= True;
   end;
end;

function Tt_PlanoAcaoMatriz.ValidaCampos: Boolean;
begin
   Result:= True;

   if (dblEficaz.KeyValue = 0) and (Alltrim(mmoVerif_eficacia.Text) = EmptyStr) then begin
      Application.MessageBox('Preencha o campo Verificação da Eficácia do Treinamento','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      mmoVerif_eficacia.SetFocus;
      Exit;
   end;

   if mmoAcao.Text = '' then begin
      Application.MessageBox('Digite a ação a ser tomada !','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      mmoAcao.SetFocus;
      Exit;
   end;
   if dblResponsavel.KeyValue <= 0 then begin
      Application.MessageBox('Escolha o responsável pela ação !','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      dblResponsavel.SetFocus;
      Exit;
   end;
   if dtPrazo.Text = '  /  /    ' then begin
      Application.MessageBox('Digite o prazo de realização da ação !','Aviso', MB_OK+MB_ICONWARNING);
      Result:= False;
      dtPrazo.SetFocus;
      Exit;
   end;

end;

end.
