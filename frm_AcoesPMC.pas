unit frm_AcoesPMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls, rxToolEdit,
  ShellAPI, DBClient, Provider, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  Tt_AcoesPMC = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    mVerificacao: TMemo;
    dblResponsavel: TDBLookupComboBox;
    mDescricao: TMemo;
    dtPrazo: TDateEdit;
    lbl1: TLabel;
    edtArquivo: TEdit;
    btnArquivo: TSpeedButton;
    btnVisualizar: TSpeedButton;
    opd1: TOpenDialog;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure sbSairClick(Sender: TObject);
    procedure mVerificacaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure LimpaCampos;
    procedure FormShow(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure mDescricaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCodigoPMC: string;
  end;

var
  t_AcoesPMC: Tt_AcoesPMC;
  NovoCodigoAcao: integer;

implementation

uses Funcoes, frm_dm, frm_Principal, frm_PMCFecha;

{$R *.dfm}

procedure Tt_AcoesPMC.sbSairClick(Sender: TObject);
begin
   t_PMCFecha.AtualizarAcoes();
   Self.Close;
end;

procedure Tt_AcoesPMC.btnArquivoClick(Sender: TObject);
begin
   OPD1.Execute;
   if OPD1.FileName <> '' then begin
      edtArquivo.Text:= OPD1.FileName;
      btnVisualizar.Enabled:= True;
   end
   else begin
      btnVisualizar.Enabled:= False;
   end;
end;

procedure Tt_AcoesPMC.btnVisualizarClick(Sender: TObject);
begin
   try
      ShellExecute(Application.Handle, nil, PChar(edtArquivo.text), nil, nil, SW_SHOWMAXIMIZED);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível abrir o arquivo.' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

procedure Tt_AcoesPMC.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,t_Principal.imFundo.Picture.Graphic);
end;

procedure Tt_AcoesPMC.FormShow(Sender: TObject);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_col, nome_col from Colaboradores '+
                    ' ORDER BY nome_col';
      Active:= True;
      First;

//    dbcResponsavel.Items.Clear;
//    while not Eof do
//    begin
//      cbResponsavel.Items.Add(FieldByName('nome_col').AsString);
//      Next;
//    end;
//    cbResponsavel.ItemIndex:= -1;
   end;

   dm.cdsColaboradores.Open;

   mDescricao.SetFocus;
end;

procedure Tt_AcoesPMC.LimpaCampos;
begin
   mDescricao.Clear;
   dtPrazo.Clear;
   dblResponsavel.KeyValue:= -1;
   mVerificacao.Clear;
   edtArquivo.Clear;
end;

procedure Tt_AcoesPMC.mDescricaoExit(Sender: TObject);
begin
   AcertaUpper(mDescricao.Text);
end;

procedure Tt_AcoesPMC.mVerificacaoKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure Tt_AcoesPMC.sbGravarClick(Sender: TObject);
begin
   try
      if ValidaCampos then begin
         if sbGravar.Caption = 'Gravar' then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' Select max(codi_aco) as codigo from pmc_acoes';
               Active:= True;
               if RecordCount = 0 then begin
                  NovoCodigoAcao:= 1
               end
               else begin
                  NovoCodigoAcao:= FieldByName('codigo').AsInteger + 1;
               end;
            end;
         end;

         with cdsGravar do begin
            Active:= False;
            if sbGravar.Caption = 'Gravar' then begin
               CommandText:= ' INSERT INTO pmc_acoes' +
                             ' (codi_aco, codi_pmc, resp_aco, praz_aco, vimp_aco, desc_aco, arqu_aco)' +
                             ' VALUES( ' +
                             IntToStr(NovoCodigoAcao) + ',' +
                             QuotedStr(sCodigoPMC) + ',' +
                             IntToStr(dblResponsavel.KeyValue) + ',' +
                             QuotedStr(dtPrazo.Text) + ',' +
                             QuotedStr(mVerificacao.Text) + ',' +
                             QuotedStr(mDescricao.Text) + ',' +
                             QuotedStr(DuploBar(edtArquivo.Text)) +
                             ')';
//               Insert;
//               FieldByName('codi_aco').AsInteger:= NovoCodigoAcao;
            end
            else begin
               CommandText:= ' UPDATE pmc_acoes SET' +
                             ' resp_aco = ' + IntToStr(dblResponsavel.KeyValue) + ',' +
                             ' praz_aco = ' + QuotedStr(dtPrazo.Text) + ',' +
                             ' vimp_aco = ' + QuotedStr(mVerificacao.Text) + ',' +
                             ' desc_aco = ' + QuotedStr(mDescricao.Text) + ',' +
                             ' arqu_aco = ' +  QuotedStr(DuploBar(edtArquivo.Text)) +
                             ' WHERE codi_aco = ' + DM.cdsPmc_Acoescodi_aco.AsString +
                             ' and codi_pmc = ' + QuotedStr(sCodigoPMC);
               sbGravar.Caption:= 'Gravar';
            end;

            Execute;
//            FieldByName('codi_pmc').AsInteger := StrToInt(sCodigoPMC);// dm.cdsPMC.FieldByName('codi_pmc').AsInteger;
//            FieldByName('resp_aco').AsInteger := dbcResponsavel.KeyValue;
//            FieldByName('praz_aco').AsDateTime:= dtPrazo.Date;
//            FieldByName('vimp_aco').AsString  := mVerificacao.Text;
//            FieldByName('desc_aco').AsString  := mDescricao.Text;
//            FieldByName('arqu_aco').AsString  := edtArquivo.Text;
//            Post;
         end;
         LimpaCampos;
      end;
      Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      dm.cdsAuxiliar.Active:= False;
      sbSairClick(Self);
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end; // try
end;

function Tt_AcoesPMC.ValidaCampos: Boolean;
begin
   Result:= True;
   if mDescricao.Text = '' then begin
      Application.MessageBox('Digite a descrição da ação !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      mDescricao.SetFocus;
      Exit;
   end;

   if dtPrazo.Text = '  /  /    ' then begin
      Application.MessageBox('Digite prazo de execução da ação !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      dtPrazo.SetFocus;
      dtPrazo.SelectAll;
      Exit;
   end;

   try
     StrToDate(dtPrazo.Text);
   except
      Application.MessageBox('Data inválida !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      dtPrazo.SetFocus;
      dtPrazo.SelectAll;
      Exit;
   end;

   if dblResponsavel.KeyValue <= 0 then begin
      Application.MessageBox('Escolha um responsável pela ação !','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      dblResponsavel.SetFocus;
      Exit;
   end;
end;

end.
