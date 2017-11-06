unit frm_Indicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, rxToolEdit,
  rxCurrEdit, DBClient, Provider, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  Tt_Indicadores = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    sbNovo: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExcluir: TSpeedButton;
    edDescricao: TEdit;
    dbgIndicadores: TDBGrid;
    Label2: TLabel;
    dblProcessos: TDBLookupComboBox;
    lb1: TLabel;
    edMeta: TCurrencyEdit;
    cbTipo: TComboBox;
    cbPeriodicidade: TComboBox;
    lbl1: TLabel;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    procedure sbSairClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure LimpaCampos();
    procedure sbGravarClick(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure sbExcluirClick(Sender: TObject);
    procedure PreencheCampos;
    procedure FormShow(Sender: TObject);
    procedure dbgIndicadoresCellClick(Column: TColumn);
    function NovoCodigo(): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_Indicadores: Tt_Indicadores;

implementation

uses frm_dm, frm_Principal, frm_Funcoes, Funcoes;

{$R *.dfm}

procedure Tt_Indicadores.FormShow(Sender: TObject);
begin
   with dm.cdsIndicadores do begin
      Active:= False;
      CommandText:= ' SELECT codi_ind, desc_ind, tipo_ind, meta_ind, proc_ind, peri_ind' +
                    ' FROM indicadores';
      Active:= True;
   end;
   dm.cdsProcessos.Active:= False;
   dm.cdsProcessos.Active:= True;
   edDescricao.SetFocus;
end;

procedure Tt_Indicadores.LimpaCampos;
begin
//  edCodigo.Clear;
   edDescricao.Clear;
   edMeta.Clear;
   dblProcessos.KeyValue:= -1;
   sbGravar.Caption:= 'Gravar';
end;

function Tt_Indicadores.NovoCodigo: Integer;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT MAX(codi_ind) AS NovoCodigo' +
                    ' FROM indicadores';
      Active:= True;

      if FieldByName('NovoCodigo').AsString = EmptyStr then begin
         Result:= 1;
      end
      else begin
         Result:= FieldByName('NovoCodigo').AsInteger + 1;
      end;
   end;
end;

procedure Tt_Indicadores.PreencheCampos;
begin
   if dm.cdsIndicadores.RecordCount > 0 then
   begin
      dm.cdsIndicadores.Edit;
 //     edCodigo.Text   := dm.cdsIndicadores.FieldByName('codi_ind').AsString;
      edDescricao.Text         := dm.cdsIndicadores.FieldByName('desc_ind').AsString;
      edMeta.Text              := dm.cdsIndicadores.FieldByName('meta_ind').AsString;
      dblProcessos.KeyValue    := dm.cdsIndicadores.FieldByName('proc_ind').AsInteger;
      cbTipo.Text              := dm.cdsIndicadores.FieldByName('tipo_ind').AsString;
      if dm.cdsIndicadores.FieldByName('peri_ind').AsString = EmptyStr then begin
         cbPeriodicidade.ItemIndex:= -1;
      end
      else begin
         cbPeriodicidade.ItemIndex:= dm.cdsIndicadores.FieldByName('peri_ind').AsInteger;
      end;
      sbGravar.Caption:= 'Alterar';
   end;
end;

procedure Tt_Indicadores.sbNovoClick(Sender: TObject);
begin
   LimpaCampos;
   edDescricao.SetFocus;
   sbGravar.Caption:= 'Gravar';
end;

procedure Tt_Indicadores.sbExcluirClick(Sender: TObject);
begin
   if Application.MessageBox('Confirma exclusão do registro ?','Exclusão',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then begin
      try
         dm.cdsIndicadores.Delete;
         dm.cdsIndicadores.ApplyUpdates(0);
         LimpaCampos;
         Auditoria('INDICADORES',edDescricao.Text,'E', '');
         Application.MessageBox('Registro excluído corretamente.','Informação', MB_OK + MB_ICONINFORMATION);
      except
         on e: Exception do begin
            Application.MessageBox(PChar('Erro ao excluir o registro.' + #13 + E.Message), 'Erro', MB_OK + MB_ICONERROR);
         end;
      end;
   end;
end;

procedure Tt_Indicadores.sbGravarClick(Sender: TObject);
begin
   if sbGravar.Caption = 'Gravar' then begin
      try
         if ValidaCampos then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' INSERT INTO indicadores ' +
                             ' (codi_ind, desc_ind, meta_ind, proc_ind, tipo_ind, peri_ind)' +
                             ' VALUES(' +
                             IntToStr(NovoCodigo()) + ',' +
                             QuotedStr(edDescricao.Text) + ',' +
                             VirgulaParaPonto(edMeta.Value,2) + ',' +
                             IntToStr(dblProcessos.KeyValue) + ',' +
                             QuotedStr(cbTipo.Text) + ',' +
                             IntToStr(cbPeriodicidade.ItemIndex) +
                             ')';
               Execute;
            end;

//            with dm.cdsIndicadores do begin
//               Active:= True;
//               Insert;
//               FieldByName('desc_ind').AsString := edDescricao.Text;
//               FieldByName('meta_ind').AsString := edMeta.Text;
//               FieldByName('proc_ind').AsInteger:= dblProcessos.KeyValue;
//               FieldByName('tipo_ind').AsString := cbTipo.Text;
//               FieldByName('peri_ind').AsInteger:= cbPeriodicidade.ItemIndex;
//               Post;
//            end;
            Auditoria('INDICADORES',edDescricao.Text,'I', '');
            LimpaCampos;
            Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         end;
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
         end;
      end; // try
   end// if caption
   else begin
      try
         if ValidaCampos then begin
            with cdsGravar do begin
               Active:= False;
               CommandText:= ' UPDATE indicadores SET ' +
                             ' desc_ind = ' + QuotedStr(edDescricao.Text) + ',' +
                             ' meta_ind = ' + VirgulaParaPonto(edMeta.Value,2) + ',' +
                             ' proc_ind = ' + IntToStr(dblProcessos.KeyValue) + ',' +
                             ' tipo_ind = ' + QuotedStr(cbTipo.Text) + ',' +
                             ' peri_ind = ' + IntToStr(cbPeriodicidade.ItemIndex) +
                             ' WHERE codi_ind = ' + dm.cdsIndicadorescodi_ind.AsString;
               Execute;
            end;

//            with dm.cdsIndicadores do begin
//               Active:= True;
//               Edit;
//               FieldByName('desc_ind').AsString := edDescricao.Text;
//               FieldByName('meta_ind').AsString := edMeta.Text;
//               FieldByName('proc_ind').AsInteger:= dblProcessos.KeyValue;
//               FieldByName('tipo_ind').AsString := cbTipo.Text;
//               FieldByName('peri_ind').AsInteger:= cbPeriodicidade.ItemIndex;
//               Post;
//            end;
            Auditoria('INDICADORES',edDescricao.Text,'A', '');
            LimpaCampos;
            Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
            sbGravar.Caption:= 'Gravar';
         end;
      except
         on E: Exception do begin
            Application.MessageBox(PChar('Não foi possível realizar a alteração' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
         end;
      end;
   end;
   dm.cdsIndicadores.Active:= False;
   dm.cdsIndicadores.Active:= True;
end;

procedure Tt_Indicadores.dbgIndicadoresCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_Indicadores.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

function Tt_Indicadores.ValidaCampos: Boolean;
begin
   Result:= True;

   if edDescricao.Text = '' then begin
      Application.MessageBox('Digite a descrição !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edDescricao.SetFocus;
      Exit;
   end;

   if cbTipo.Text = '' then begin
      Application.MessageBox('Digite o tipo de meta !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      cbTipo.SetFocus;
      Exit;
   end;

   if edMeta.Text = '' then begin
      Application.MessageBox('Digite a meta !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edMeta.SetFocus;
      Exit;
   end;

   if dblProcessos.KeyValue <= 0 then begin
      Application.MessageBox('Escolha um processo !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      dblProcessos.SetFocus;
      Exit;
   end;
end;

end.
