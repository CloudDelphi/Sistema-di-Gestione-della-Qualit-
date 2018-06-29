unit frm_CadEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, ExtDlgs, DBCtrls, Jpeg, DBClient,
  Provider, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass,
  frxDBSet, Grids, DBGrids, rxToolEdit, ComCtrls, JvgPage;

type
  TFormCadEmpresa = class(TForm)
    Panel1: TPanel;
    OPD: TOpenPictureDialog;
    zqryGravar: TZQuery;
    dspGravar: TDataSetProvider;
    cdsGravar: TClientDataSet;
    pctEmpresa: TJvgPageControl;
    tsCadastro: TTabSheet;
    lbl5: TLabel;
    lbl2: TLabel;
    lbl11: TLabel;
    edtNomeEmp: TEdit;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    zqryEstados: TZQuery;
    dspEstados: TDataSetProvider;
    cdsEstados: TClientDataSet;
    dsEstados: TDataSource;
    medtCEP: TMaskEdit;
    lbl1: TLabel;
    dbimg1: TDBImage;
    lbl3: TLabel;
    sbLogo: TSpeedButton;
    lbl4: TLabel;
    edtCidade: TEdit;
    lbl8: TLabel;
    edtPais: TEdit;
    lbl9: TLabel;
    medtCNPJ: TMaskEdit;
    lbl10: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl15: TLabel;
    edtInscEstadual: TEdit;
    edtInscMunicipal: TEdit;
    edtFone: TEdit;
    edtFax: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    edtSite: TEdit;
    edtMail: TEdit;
    btnGravar: TBitBtn;
    btnSair: TBitBtn;
    lbl14: TLabel;
    dblEstado: TDBLookupComboBox;
    cdsEstadoscodi_est: TLargeintField;
    cdsEstadosdesc_est: TWideStringField;
    cdsEstadossigl_est: TWideStringField;
    lbl16: TLabel;
    mmoEscopo: TMemo;
    lbl17: TLabel;
    mmoPolitica: TMemo;
    zqryEmpresa: TZQuery;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    dsEmpresa: TDataSource;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnNovo: TBitBtn;
    lbl18: TLabel;
    mmoMissao: TMemo;
    lbl19: TLabel;
    mmoVisao: TMemo;
    lbl20: TLabel;
    mmoValores: TMemo;
    mmoExclusoes: TMemo;
    lbl21: TLabel;
    procedure sbLogoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure mmoEscopoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAlterarClick(Sender: TObject);
    procedure Botoes(flag: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure AtualizarDados();
    procedure PreencherDados();
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
     cOperacao: Char;
  public
     caminho: String;
    { Public declarations }
  end;

var
  FormCadEmpresa: TFormCadEmpresa;

  Imagem: TJpegImage;
  BlobStream: TStream;
  Diretorio: string;
  CaminhoCompleto: string;

implementation

uses frm_dm, Funcoes, frm_Inicial;

{$R *.dfm}

procedure TFormCadEmpresa.sbLogoClick(Sender: TObject);
begin
   OPD.Filter:= 'Imagem no formato JPEG (*.jpg)|*.jpg';
   OPD.DefaultExt:='jpg';
   OPD.Execute;
   if OPD.FileName <> '' then begin
      Imagem:= TJPEGImage.Create;//aqui você tá criando o obj
      Imagem.Scale:= jsHalf;//aqui você esta atribuindo uma escala.. exibir 100%
      Imagem.LoadFromFile(OPD.FileName);//aqui tá carregando a imagem
      DBImg1.picture.Bitmap.assign(Imagem);//aqui jogando ela prum Timage

//      Diretorio:= Diretorio + ExtractFileName(OPD.FileName) +'.jpg';

      //      Diretorio:= 'C:\Sistemas\';
      Diretorio:= OPD.FileName;
//      CaminhoCompleto:= Diretorio + ExtractFileName(OPD.FileName);
      CaminhoCompleto:= Diretorio;
//      Imagem.SaveToFile(Diretorio + ExtractFileName(OPD.FileName));
   end;
end;

procedure TFormCadEmpresa.btnAlterarClick(Sender: TObject);
begin
   if (Acesso(cUsuario, 1, 'alteracao') = 1) then begin
      cOperacao:= 'A';
      HabilitarCampos(True, True, Self, -1);
      TryFocus(edtNomeEmp);
      Botoes(False);
   end;
end;

procedure TFormCadEmpresa.btnCancelarClick(Sender: TObject);
begin
   Botoes(True);
   HabilitarCampos(False, False, Self, -1);
   AtualizarDados();
   PreencherDados();
end;

procedure TFormCadEmpresa.btnGravarClick(Sender: TObject);
begin
   if dblEstado.KeyValue = null then begin
      dblEstado.KeyValue:= 24;
   end;

   if Acesso(cUsuario, 1, 'cadastro') = 1 then begin
      try
         with cdsEmpresa do begin
            Active:= False;
            CommandText:= ' SELECT * from empresa';
            Active:= True;

            if RecordCount > 0 then begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' UPDATE empresa SET' +
                                ' nome_emp = ' + QuotedStr(edtNomeEmp.Text) + ',' +
                                ' ende_emp = ' + QuotedStr(edtEndereco.Text) + ',' +
                                ' bair_emp = ' + QuotedStr(edtBairro.Text) + ',' +
                                ' cepe_emp = ' + QuotedStr(medtCep.Text) + ',' +
                                ' cida_emp = ' + QuotedStr(edtCidade.Text) + ',' +
                                ' esta_emp = ' + IntToStr(dblEstado.KeyValue) + ',' +
                                ' site_emp = ' + QuotedStr(edtSite.Text) + ',' +
                                ' mail_emp = ' + QuotedStr(edtMail.Text) + ',' +
                                ' pais_emp = ' + QuotedStr(edtPais.Text) + ',' +
                                ' cnpj_emp = ' + QuotedStr(medtCNPJ.Text) + ',' +
                                ' iest_emp = ' + QuotedStr(edtInscEstadual.Text) + ',' +
                                ' imun_emp = ' + QuotedStr(edtInscMunicipal.Text) + ',' +
                                ' fone_emp = ' + QuotedStr(edtFone.Text) + ',' +
                                ' fax_emp = ' + QuotedStr(edtFax.Text) + ',' +
                                ' logo_emp = ' + QuotedStr(DuploBar(CaminhoCompleto)) + ',' +
                                ' emp_escopo = ' + QuotedStr(mmoEscopo.Text) + ',' +
                                ' emp_politica = ' + QuotedStr(mmoPolitica.Text) + ',' +
                                ' emp_missao = ' + QuotedStr(mmoMissao.Text) + ',' +
                                ' emp_visao = ' + QuotedStr(mmoVisao.Text) + ',' +
                                ' emp_valores = ' + QuotedStr(mmoValores.Text) + ',' +
                                ' emp_exclusoes = ' + QuotedStr(mmoExclusoes.Text);
                  Execute;
               end;
            end
            else begin
               with cdsGravar do begin
                  Active:= False;
                  CommandText:= ' INSERT INTO empresa (nome_emp, ende_emp, bair_emp, cepe_emp, cida_emp, ' +
                                ' esta_emp, site_emp, mail_emp, pais_emp, cnpj_emp, iest_emp, imun_emp, ' +
                                ' fone_emp, fax_emp, logo_emp, emp_escopo, emp_politica, ' +
                                ' emp_missao, emp_visao, emp_valores, emp_exclusoes)' +
                                ' VALUES(' +
                                QuotedStr(edtNomeEmp.Text) + ',' +
                                QuotedStr(edtEndereco.Text) + ',' +
                                QuotedStr(edtBairro.Text) + ',' +
                                QuotedStr(medtCep.Text) + ',' +
                                QuotedStr(edtCidade.Text) + ',' +
                                IntToStr(dblEstado.KeyValue) + ',' +
                                QuotedStr(edtSite.Text) + ',' +
                                QuotedStr(edtMail.Text) + ',' +
                                QuotedStr(edtPais.Text) + ',' +
                                QuotedStr(medtCNPJ.Text) + ',' +
                                QuotedStr(edtInscEstadual.Text) + ',' +
                                QuotedStr(edtInscMunicipal.Text) + ',' +
                                QuotedStr(edtFone.Text) + ',' +
                                QuotedStr(edtFax.Text) + ',' +
                                QuotedStr(CaminhoCompleto) + ',' +
                                QuotedStr(mmoEscopo.Text) + ',' +
                                QuotedStr(mmoPolitica.Text) + ',' +
                                QuotedStr(mmoMissao.Text) + ',' +
                                QuotedStr(mmoVisao.Text) + ',' +
                                QuotedStr(mmoValores.Text) + ',' +
                                QuotedStr(mmoExclusoes.Text) +
                                ')';
                  Execute;
               end;
            end;
         end;

         HabilitarCampos(False, False, Self, -1);
         Botoes(True);
         FormInicial.StatPrincipal.Panels[3].Text:= 'EMPRESA: ' + edtNomeEmp.Text;
         Application.MessageBox('Empresa cadastrada corretamente','Informação',MB_OK+MB_ICONINFORMATION);
      except
         on E: Exception do begin
            MostrarErro('Erro na gravação da empresa', E.Message, Self.Name);
//            Application.MessageBox(PChar('Erro na gravação da empresa' + #13 + E.Message),'Erro',MB_OK+MB_ICONERROR);
         end;
      end;
   end;
end;

procedure TFormCadEmpresa.btnNovoClick(Sender: TObject);
begin
   HabilitarCampos(True, True, Self, -1);
   Botoes(False);
   btnNovo.Enabled:= False;
   TryFocus(edtNomeEmp);
end;

procedure TFormCadEmpresa.AtualizarDados;
begin
   with cdsEmpresa do begin
      Active:= False;
      CommandText:= ' SELECT nome_emp, ende_emp, bair_emp, '+
                    ' cepe_emp, cida_emp, esta_emp, site_emp, mail_emp, logo_emp, '+
                    ' pais_emp, iest_emp, imun_emp, fone_emp, fax_emp, cnpj_emp, emp_escopo, emp_politica, ' +
                    ' emp_missao, emp_visao, emp_valores, emp_exclusoes' +
                    ' FROM empresa';
      Active:= True;
   end;
end;

procedure TFormCadEmpresa.Botoes(flag: Boolean);
begin
   btnNovo.Enabled    := Flag;
   btnAlterar.Enabled := Flag;
   btnGravar.Enabled  := not Flag;
   btnCancelar.Enabled:= not Flag;

   AtualizarDados();

   if cdsEmpresa.RecordCount = 0 then begin
      btnAlterar.Enabled:= False;
      btnNovo.Enabled   := True;
   end
   else begin
//      btnAlterar.Enabled:= True;
      btnNovo.Enabled   := False;
   end;
end;

procedure TFormCadEmpresa.btnSairClick(Sender: TObject);
begin
   Self.Close;
end;

procedure TFormCadEmpresa.FormShow(Sender: TObject);
begin
//   with dm.cdsEstados do begin
//      Active:= False;
//      CommandText:= ' SELECT codi_est, desc_est, sigl_est from estados '+
//                    ' ORDER BY sigl_est';
//      Active:= True;
//      First;
//
//      cbEstado.Items.Clear;
//      while not Eof do begin
//         cbEstado.Items.Add(FieldByName('sigl_est').AsString);
//         Next;
//      end;
//      cbEstado.ItemIndex:= 24; // São Paulo
//   end;

   with cdsEstados do begin
      Active:= False;
      Active:= True;
   end;

   AtualizarDados();

   with cdsEmpresa do begin
//      Active:= False;
//      CommandText:= ' SELECT nome_emp, ende_emp, bair_emp, '+
//                   ' cepe_emp, cida_emp, esta_emp, site_emp, mail_emp, logo_emp, '+
//                   ' pais_emp, iest_emp, imun_emp, fone_emp, fax_emp, cnpj_emp, emp_escopo, emp_politica ' +
//                   ' FROM empresa';
//      Active:= True;
      First;

      if RecordCount > 0  then begin
         PreencherDados();


         // Carrega a imagem do caminho gravado na tabela empresas
//         Imagem:= TJPEGImage.Create;//aqui você tá criando o obj
//         Imagem.Scale:= jsHalf;//aqui você esta atribuindo uma escala.. exibir 100%
//         Imagem.LoadFromFile(dm.cdsEmpresa.FieldByname('logo_emp').AsString);//aqui tá carregando a imagem
         if FileExists(cdsEmpresa.FieldByname('logo_emp').AsString) then begin
            dbimg1.Picture.LoadFromFile(cdsEmpresa.FieldByname('logo_emp').AsString);//aqui jogando ela prum Timage
         end;
//         BlobStream := dm.cdsEmpresa.CreateBlobStream(dm.cdsEmpresa.FieldByname('logo_emp'), bmRead);

//         if BlobStream.Size <> 0 then begin
//            Imagem:= TJPEGImage.Create;
//            try
//               Imagem.LoadFromStream(BlobStream);
//               Imagem.Scale:= jsFullSize;
//               DBImage1.Picture.Assign(Imagem);
//            finally
//               BlobStream.Free;
//               Imagem.Free;
//            end;
//         end
      end
      else begin
         edtNomeEmp.Clear;
         edtEndereco.Clear;
         edtBairro.Clear;
         edtCidade.Clear;
         medtCep.Clear;
         edtSite.Clear;
         edtMail.Clear;
         edtPais.Text:= 'BRASIL';
         mmoEscopo.Clear;
         mmoPolitica.Clear;
      end;
   end;

   Botoes(True);
   HabilitarCampos(False, False, Self, -1);
end;

procedure TFormCadEmpresa.mmoEscopoKeyPress(Sender: TObject; var Key: Char);
begin
   Key:= AcertaUpperLetra(Key);
end;

procedure TFormCadEmpresa.PreencherDados;
begin
   with cdsEmpresa do begin
      edtNomeEmp.Text      := FieldByName('nome_emp').AsString;
      edtEndereco.Text     := FieldByName('ende_emp').AsString;
      edtBairro.Text       := FieldByName('bair_emp').AsString;
      edtCidade.Text       := FieldByName('cida_emp').AsString;
      if FieldByName('esta_emp').AsString <> EmptyStr then begin
         dblEstado.KeyValue   := FieldByName('esta_emp').AsInteger;
      end;
      medtCep.Text         := FieldByName('cepe_emp').AsString;
      edtSite.Text         := FieldByName('site_emp').AsString;
      edtMail.Text         := FieldByName('mail_emp').AsString;
      edtPais.Text         := FieldByName('pais_emp').AsString;
      medtCNPJ.Text        := FieldByName('cnpj_emp').AsString;
      edtInscEstadual.Text := FieldByName('iest_emp').AsString;
      edtInscMunicipal.Text:= FieldByName('imun_emp').AsString;
      edtFone.Text         := FieldByName('fone_emp').AsString;
      edtFax.Text          := FieldByName('fax_emp').AsString;
      mmoEscopo.Text       := FieldByName('emp_escopo').AsString;
      mmoExclusoes.Text    := FieldByName('emp_exclusoes').AsString;
      mmoPolitica.Text     := FieldByName('emp_politica').AsString;
      mmoMissao.Text       := FieldByName('emp_missao').AsString;
      mmoVisao.Text        := FieldByName('emp_visao').AsString;
      mmoValores.Text      := FieldByName('emp_valores').AsString;
   end;
end;

end.
