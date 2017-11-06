unit frm_CadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids, ComCtrls, FMTBcd,
  DBClient, Provider, DB, SqlExpr, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  Tt_CadUsuario = class(TForm)
    Label1: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    Label2: TLabel;
    dbgUsuarios: TDBGrid;
    Panel1: TPanel;
    sbGravar: TSpeedButton;
    sbSair: TSpeedButton;
    BbtnNovo: TSpeedButton;
    sbAcessos: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbImprimir: TSpeedButton;
    dspAux: TDataSetProvider;
    cdsAux: TClientDataSet;
    sbProcessos: TSpeedButton;
    rgProcessos: TRadioGroup;
    grp1: TGroupBox;
    chkAnalise: TCheckBox;
    chkIndicadores: TCheckBox;
    chkProcedimentos: TCheckBox;
    chkRegistros: TCheckBox;
    chkAcaoCorretiva: TCheckBox;
    chkInfraestrutura: TCheckBox;
    chkManutencao: TCheckBox;
    chkMatriz: TCheckBox;
    zqryAux: TZQuery;
    grp2: TGroupBox;
    chkAprovDoc: TCheckBox;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    procedure sbSairClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    function ValidaCampos: Boolean;
    procedure FormShow(Sender: TObject);
    procedure dbgUsuariosCellClick(Column: TColumn);
    procedure PreencheCampos;
    procedure dbgUsuariosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LimpaCampos;
    procedure sbImprimirClick(Sender: TObject);
    procedure sbAcessosClick(Sender: TObject);
    procedure GravaAcessos(parUsuario: string);
    procedure sbProcessosClick(Sender: TObject);
    procedure ProcessosClick(Sender: TObject);
    procedure AtualizarDados();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  t_CadUsuario: Tt_CadUsuario;
  Mensagem: string;

implementation

uses frm_dm, frm_Principal, Funcoes, frm_Acessos, uCadUsuarioProcessos,
  frm_Inicial;

{$R *.dfm}

procedure Tt_CadUsuario.ProcessosClick(Sender: TObject);
begin
   if Acesso(cUsuario, 21, 'acesso') = 1 then begin
      if not assigned(FormUsuProcesso) then
         Application.CreateForm(TFormUsuProcesso, FormUsuProcesso);
      FormUsuProcesso.lbNomeUsuario.Caption:= dm.cdsUsuario.FieldByName('nome_usu').AsString;
      FormUsuProcesso.ShowModal;
   end;
end;

procedure Tt_CadUsuario.sbAcessosClick(Sender: TObject);
begin
   if Acesso(cUsuario, 17, 'acesso') = 1 then begin
      if not assigned(t_Acessos) then
         Application.CreateForm(Tt_Acessos, t_Acessos);
      t_Acessos.lbNomeUsuario.Caption:= dm.cdsUsuario.FieldByName('nome_usu').AsString;
      t_Acessos.ShowModal;
   end;
end;

procedure Tt_CadUsuario.sbExcluirClick(Sender: TObject);
begin
   if edUsuario.Text = cUsuario then begin
      Application.MessageBox('O usuário ativo não pode ser excluído', 'Aviso', MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if Acesso(cUsuario, 16, 'exclusao') = 1 then begin
      if Application.MessageBox('Confirma exclusão do usuário ?','Exclusão',MB_YESNO+MB_ICONQUESTION) = IDYES then begin
         try
            // Exclui na tabela usuarios
            with cdsAux do begin
               Active:= False;
               CommandText:= ' DELETE FROM Usuarios' +
                             ' WHERE nome_usu = ' + QuotedStr(edUsuario.Text);
               Execute;
            end;
            // Exclui na tabela acessos
            with cdsAux do begin
               Active:= False;
               CommandText:= ' DELETE FROM Acessos' +
                             ' WHERE usua_ace = ' + QuotedStr(edUsuario.Text);
               Execute;
            end;


            Auditoria('USUARIOS',edUsuario.Text,'E', '');
            AtualizarDados();

            LimpaCampos;
            Application.MessageBox('Registro excluído corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
         except
            on E: Exception do begin
               Application.MessageBox(PChar('Erro ao excluir o registro' + #13 + E.Message), 'Erro', MB_OK + MB_ICONINFORMATION);
            end;
         end;
      end;
   end;
end;

procedure Tt_CadUsuario.AtualizarDados;
begin
   dm.cdsUsuario.Active:= False;
   dm.cdsUsuario.Active:= True;
end;

procedure Tt_CadUsuario.BbtnNovoClick(Sender: TObject);
begin
   LimpaCampos;
end;

procedure Tt_CadUsuario.dbgUsuariosCellClick(Column: TColumn);
begin
   PreencheCampos;
end;

procedure Tt_CadUsuario.dbgUsuariosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   PreencheCampos;
end;

procedure Tt_CadUsuario.FormPaint(Sender: TObject);
begin
   Self.Canvas.StretchDraw(Rect(0, 0, Self.Width, Self.Height) ,FormInicial.imgModelo.Picture.Graphic);
end;

procedure Tt_CadUsuario.FormShow(Sender: TObject);
begin
   AtualizarDados();
   sbExcluir.Enabled   := False;
   sbAcessos.Enabled   := False;
   sbProcessos.Enabled := False;
end;

procedure Tt_CadUsuario.GravaAcessos(parUsuario: string);
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT codi_com FROM tabela_combos' +
                    ' WHERE tipo_com = 99' +
                    ' ORDER BY orde_com';
      Active:= True;
      First;

      while not Eof do begin
         cdsAux.Active:= False;
         cdsAux.CommandText:= ' INSERT INTO Acessos Values ' +
                              ' ('+ QuotedStr(parUsuario) + ', ' + FieldByName('codi_com').AsString + ',0,0,0,0,0)';
         cdsAux.Execute;
         Next;
      end;
   end;
end;

procedure Tt_CadUsuario.LimpaCampos;
begin
   edUsuario.Clear;
   edSenha.Clear;
   edUsuario.SetFocus;
   sbGravar.Caption:= 'Gravar';
   edUsuario.SetFocus;
   sbExcluir.Enabled   := False;
   sbAcessos.Enabled   := False;
   sbProcessos.Enabled := False;
end;

procedure Tt_CadUsuario.PreencheCampos;
begin
   if dm.cdsUsuario.RecordCount > 0 then begin
      with dm.cdsUsuario do begin
         edUsuario.Text           := FieldByName('nome_usu').AsString;
         edSenha.Text             := FieldByName('senh_usu').AsString;
         rgProcessos.ItemIndex    := FieldByName('proc_usu').AsInteger;

         chkAnalise.Checked       := StringParaLogico(FieldByName('Analise').AsString);
         chkIndicadores.Checked   := StringParaLogico(FieldByName('Indicadores').AsString);
         chkProcedimentos.Checked := StringParaLogico(FieldByName('Procedimentos').AsString);
         chkRegistros.Checked     := StringParaLogico(FieldByName('Registros').AsString);
         chkAcaoCorretiva.Checked := StringParaLogico(FieldByName('AcaoCorretiva').AsString);
         chkInfraestrutura.Checked:= StringParaLogico(FieldByName('Infraestrutura').AsString);
         chkManutencao.Checked    := StringParaLogico(FieldByName('Manutencao').AsString);
         chkMatriz.Checked        := StringParaLogico(FieldByName('Matriz').AsString);
         chkAprovDoc.Checked      := StringParaLogico(FieldByName('AprovaDoc').AsString);
      end;

      sbExcluir.Enabled    := True;
      sbAcessos.Enabled    := True;
      sbProcessos.Enabled  := True;
      sbGravar.Caption:= 'Alterar';
   end;
end;

procedure Tt_CadUsuario.sbGravarClick(Sender: TObject);
var
   cOperacao: Char;
begin
   try
      if ValidaCampos then begin
         if sbGravar.Caption = 'Gravar' then begin
            if (Acesso(cUsuario, 16, 'cadastro') = 1) then begin
               cOperacao:= 'I';
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO usuarios' +
                                ' (nome_usu, senh_usu, proc_usu, Analise, Indicadores,' +
                                ' Procedimentos, Registros, AcaoCorretiva, Infraestrutura,' +
                                ' Manutencao, Matriz, AprovaDoc)' +
                                ' VALUES (' +
                                QuotedStr(edUsuario.Text) + ',' +
                                QuotedStr(edSenha.Text) + ',' +
                                IntToStr(rgProcessos.ItemIndex) + ',' +
                                QuotedStr(LogicoParaString(chkAnalise.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkIndicadores.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkProcedimentos.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkRegistros.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkAcaoCorretiva.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkInfraestrutura.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkManutencao.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkMatriz.Checked)) + ',' +
                                QuotedStr(LogicoParaString(chkAprovDoc.Checked)) +
                                ')';
                  Execute;
               end;
//               dm.cdsUsuario.Insert;
            end
            else begin
               Exit;
            end;
         end
         else begin
            if (Acesso(cUsuario, 16, 'alteracao') = 1) then begin
               cOperacao:= 'A';
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE usuarios SET' +
                                ' senh_usu = ' + QuotedStr(edSenha.Text) + ',' +
                                ' proc_usu = ' + IntToStr(rgProcessos.ItemIndex) + ',' +
                                ' Analise = ' + QuotedStr(LogicoParaString(chkAnalise.Checked)) + ',' +
                                ' Indicadores = ' + QuotedStr(LogicoParaString(chkIndicadores.Checked)) + ',' +
                                ' Procedimentos = ' + QuotedStr(LogicoParaString(chkProcedimentos.Checked)) + ',' +
                                ' Registros = ' + QuotedStr(LogicoParaString(chkRegistros.Checked)) + ',' +
                                ' AcaoCorretiva = ' + QuotedStr(LogicoParaString(chkAcaoCorretiva.Checked)) + ',' +
                                ' Infraestrutura = ' + QuotedStr(LogicoParaString(chkInfraestrutura.Checked)) + ',' +
                                ' Manutencao = ' + QuotedStr(LogicoParaString(chkManutencao.Checked)) + ',' +
                                ' Matriz = ' + QuotedStr(LogicoParaString(chkMatriz.Checked)) + ',' +
                                ' AprovaDoc = ' + QuotedStr(LogicoParaString(chkAprovDoc.Checked)) +
                                ' WHERE nome_usu = ' + QuotedStr(edUsuario.Text);
                  Execute;
               end;
//               dm.cdsUsuario.Edit;
            end
            else begin
               Exit;
            end;
         end;

         AtualizarDados();
//         with dm.cdsUsuario do begin
//            FieldByName('nome_usu').AsString := edUsuario.Text;
//            FieldByName('senh_usu').AsString := edSenha.Text;
//            FieldByName('proc_usu').AsInteger:= rgProcessos.ItemIndex;
//
//            FieldByName('Analise').AsString       := LogicoParaString(chkAnalise.Checked);
//            FieldByName('Indicadores').AsString   := LogicoParaString(chkIndicadores.Checked);
//            FieldByName('Procedimentos').AsString := LogicoParaString(chkProcedimentos.Checked);
//            FieldByName('Registros').AsString     := LogicoParaString(chkRegistros.Checked);
//            FieldByName('AcaoCorretiva').AsString := LogicoParaString(chkAcaoCorretiva.Checked);
//            FieldByName('Infraestrutura').AsString:= LogicoParaString(chkInfraestrutura.Checked);
//            FieldByName('Manutencao').AsString    := LogicoParaString(chkManutencao.Checked);
//            FieldByName('Matriz').AsString        := LogicoParaString(chkMatriz.Checked);
//            FieldByName('AprovaDoc').AsString     := LogicoParaString(chkAprovDoc.Checked);
//
//            Post;
//         end;

         Auditoria('USUARIOS',edUsuario.Text, cOperacao, '');
         Application.MessageBox('Registro gravado corretamente', 'Informação', MB_OK + MB_ICONINFORMATION);
      end;
      if cOperacao = 'I' then begin
         GravaAcessos(edUsuario.Text);
      end;
   except
      on E: Exception do begin
         Application.MessageBox(PChar('Não foi possível realizar a gravação' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
      end;
   end;
end;

procedure Tt_CadUsuario.sbImprimirClick(Sender: TObject);
begin
//   Auditoria('USUARIOS','','R', '');
end;

procedure Tt_CadUsuario.sbProcessosClick(Sender: TObject);
begin
   if Acesso(cUsuario, 17, 'acesso') = 1 then begin
      if not assigned(t_Acessos) then
         Application.CreateForm(Tt_Acessos, t_Acessos);
      t_Acessos.lbNomeUsuario.Caption:= dm.cdsUsuario.FieldByName('nome_usu').AsString;
      t_Acessos.ShowModal;
   end;
end;

function Tt_CadUsuario.ValidaCampos: Boolean;
begin
   Result:= True;

   if edUsuario.Text = '' then begin
      Application.MessageBox('Digite o usuário','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edUsuario.SetFocus;
      Exit;
   end;

   if sbGravar.Caption <> 'Alterar' then begin
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT nome_usu FROM usuarios' +
                       ' WHERE nome_usu = ' + QuotedStr(edUsuario.Text);
         Active:= True;

         if RecordCount > 0 then begin
            Application.MessageBox('Usuário já cadastrado !','Aviso',MB_OK+MB_ICONWARNING);
            Result:= False;
            edUsuario.SelectAll;
            Exit;
         end;
      end;
   end;

   if edSenha.Text = '' then begin
      Application.MessageBox('Digite a senha do usuário','Aviso',MB_OK+MB_ICONWARNING);
      Result:= False;
      edSenha.SetFocus;
      Exit;
   end;
end;

procedure Tt_CadUsuario.sbSairClick(Sender: TObject);
begin
   Self.Close;
end;

end.
