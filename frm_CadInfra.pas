unit frm_CadInfra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, DBClient, Provider, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls, frxClass, frxDBSet;

type
  Tt_Infra = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    dbgInfra: TDBGrid;
    cbTipo: TComboBox;
    edDescricao: TEdit;
    edIdentificacao: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    cbManutencao: TComboBox;
    Label5: TLabel;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    dblProcessos: TDBLookupComboBox;
    zqryImpressao: TZQuery;
    dspImpressao: TDataSetProvider;
    cdsImpressao: TClientDataSet;
    cdsImpressaoNomeProcesso: TStringField;
    dsImpressao: TDataSource;
    cdsImpressaocodi_inf: TLargeintField;
    cdsImpressaotipo_inf: TLargeintField;
    cdsImpressaoqtde_inf: TLargeintField;
    cdsImpressaodesc_inf: TWideStringField;
    cdsImpressaoseto_inf: TLargeintField;
    cdsImpressaoiden_inf: TWideStringField;
    cdsImpressaoproc_inf: TLargeintField;
    cdsImpressaomanu_inf: TWideStringField;
    frxdbCadInfra: TfrxDBDataset;
    cdsImpressaovalo_com: TWideStringField;
    procedure dbgInfraCellClick(Column: TColumn);
    procedure sbGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure PreencheCampos;
    procedure cbTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure LimpaCampos;
    procedure sbImprimirClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure AtualizarDados();
  private
    { Private declarations }
    cOperacao: Char;
  public
    { Public declarations }
  end;

var
  t_Infra: Tt_Infra;
  Mensagem: string;

implementation

uses frm_dm, Funcoes, frm_Inicial;

{$R *.dfm}

procedure Tt_Infra.AtualizarDados;
begin
   with dm.cdsInfra do begin
      Active:= False;
      CommandText:= ' SELECT * FROM infraestrutura';
      Active:= True;
   end;
end;

procedure Tt_Infra.cbTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   MudaEdicao(t_Infra, Sender, Key);
end;

procedure Tt_Infra.dbgInfraCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_Infra.FormPaint(Sender: TObject);
begin
//   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_Infra.FormShow(Sender: TObject);
begin
   MontaCombosGeral(8,cbTipo);
   dm.cdsProcessos.Active:= False;
   dm.cdsProcessos.Active:= True;

   AtualizarDados();
end;

procedure Tt_Infra.LimpaCampos;
begin
   cbTipo.Text:= '';
   edDescricao.Clear;
   edIdentificacao.Clear;
   dblProcessos.KeyValue:= -1;
   sbExcluir.Enabled:= False;
   cbManutencao.Text:= 'SIM';
   sbGravar.Caption:= 'Gravar';
end;

procedure Tt_Infra.PreencheCampos;
begin
  if dm.cdsInfra.RecordCount > 0 then begin
     edDescricao.Text     := dm.cdsInfra.FieldByName('desc_inf').AsString;
     CarregaCombosGeral(8,cbTipo,dm.cdsInfra,'tipo_inf');
     edIdentificacao.Text := dm.cdsInfra.FieldByName('iden_inf').AsString;
     dblProcessos.KeyValue:= dm.cdsInfra.FieldByName('proc_inf').AsInteger;
     cbManutencao.Text    := dm.cdsInfra.FieldByName('manu_inf').AsString;
     sbGravar.Caption     := 'Alterar';
     sbExcluir.Enabled    := True;
  end;
end;

procedure Tt_Infra.sbExcluirClick(Sender: TObject);
var
   sDescInfra: string;
begin
   if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then begin
      try
         if dm.cdsInfra.RecordCount > 0 then begin
            sDescInfra:= dm.CdsInfraiden_inf1.AsString;
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' DELETE FROM Infraestrutura' +
                             ' WHERE CODI_INF = ' + dm.cdsInfracodi_inf.AsString;
               Execute;
            end;
            LimpaCampos();
            AtualizarDados();
         end;

         Auditoria('INFRAESTRUTURA',sDescInfra,'E','');
         Application.MessageBox('Registro excluído corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Erro ao excluir o registro.' + #13 + E.Message), 'Erro', MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure Tt_Infra.sbGravarClick(Sender: TObject);
var
   iNovoCodigo: Integer;
//   iCodProcesso: Integer;
begin
   try
      if ValidaCampos then begin
         if sbGravar.Caption = 'Gravar' then begin
            cOperacao:= 'I';

            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' SELECT MAX(codi_inf) + 1 as NovoCodigo FROM infraestrutura';
               Active:= True;

               iNovoCodigo:= dm.cdsAuxiliar.FieldByName('NovoCodigo').AsInteger;
            end;

//               with dm.cdsAuxiliar do begin
//                  Active:= False;
//                  CommandText:= ' SELECT codi_pro as codigo FROM processos' +
//                                ' WHERE nome_pro = ' + QuotedStr(cbProcesso.Text);
//                  Active:= True;
//
//                  iCodProcesso:= dm.cdsAuxiliar.FieldByName('codigo').AsInteger;
//               end;

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO infraestrutura' +
                             ' (codi_inf, tipo_inf, qtde_inf, desc_inf, iden_inf, proc_inf, manu_inf)' +
                             ' VALUES(' +
                             IntToStr(iNovoCodigo) + ',' +
                             IntToStr(BuscaCodigoTabelaCombos(8,cbTipo.Text)) + ',' +
                             '1' + ',' +
                             QuotedStr(edDescricao.Text) + ',' +
                             QuotedStr(edIdentificacao.Text) + ',' +
                             QuotedStr(dblProcessos.KeyValue) + ',' +
                             QuotedStr(cbManutencao.Text) +
                             ')';
               Execute;
            end;
         end
         else begin
            cOperacao:= 'A';

            with cdsGravar do begin
               Active:= False;
               CommandText:= ' UPDATE infraestrutura SET' +
                             ' tipo_inf = ' + IntToStr(BuscaCodigoTabelaCombos(8,cbTipo.Text)) + ',' +
                             ' desc_inf = ' + QuotedStr(edDescricao.Text) + ',' +
                             ' iden_inf = ' + QuotedStr(edIdentificacao.Text) + ',' +
                             ' proc_inf = ' + QuotedStr(dblProcessos.KeyValue) + ',' +
                             ' manu_inf = ' + QuotedStr(cbManutencao.Text) +
                             ' WHERE codi_inf = ' + dm.cdsInfracodi_inf.AsString;
               Execute;
            end;
         end;

         Auditoria('INFRAESTRUTURA',edIdentificacao.Text, cOperacao, '');
         AtualizarDados();
         Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end; // try
end;

procedure Tt_Infra.sbImprimirClick(Sender: TObject);
begin
   with cdsImpressao do begin
      Active:= False;
      CommandText:= ' SELECT I.*, T.valo_com FROM Infraestrutura I ' +
                    ' INNER JOIN tabela_combos T ON tipo_com = 8 and codi_com = tipo_inf';
      Active:= True;
   end;

//   with dm.frxReport1 do begin
//      LoadFromFile(ExtractFilePath(Application.ExeName) + '\Relatórios\rel_CadInfra.fr3');
//      ShowReport;
//   end;
   Auditoria('INFRAESTRUTURA','','R', '');
end;

procedure Tt_Infra.sbNovoClick(Sender: TObject);
begin
   LimpaCampos;
end;

procedure Tt_Infra.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

function Tt_Infra.ValidaCampos: Boolean;
begin
   Result:= True;
   if cbTipo.Text = '' then begin
      Application.MessageBox('Escolha um tipo de infraestrutura !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbTipo.SetFocus;
      Exit;
   end;

   if edDescricao.Text = '' then begin
      Application.MessageBox('Digite a descrição do item !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edDescricao.SetFocus;
      Exit;
   end;

   if edIdentificacao.Text = '' then begin
      Application.MessageBox('Digite a identificação do item !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edIdentificacao.SetFocus;
      Exit;
   end;

   if (cbManutencao.Text <> 'SIM') and (cbManutencao.Text <> 'NÃO') then begin
      Application.MessageBox('Escolha o processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbManutencao.SetFocus;
      Exit;

   end;
   if dblProcessos.KeyValue = -1 then begin
      Application.MessageBox('Escolha o processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      dblProcessos.SetFocus;
      Exit;
   end;
end;

end.
