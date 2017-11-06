unit Validacao;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
   Dialogs, Buttons, ExtCtrls, StdCtrls, Mask, DB, DBClient, StrUtils,
   Controls, Registry;

function VerificaAutenticidadeSistema: Boolean;
function VerificarRegistro: string;
function VerificarRegistroOffLine: string;

implementation

uses Funcoes, uAtivaSistema, frm_dm;

function VerificarRegistro: string;
var
   sRetorno: string;
   sCodEmpDM: string;
   sData: string;
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT emp_codidm FROM empresa';
         Active:= True;

         sCodEmpDM:= FieldByName('emp_codidm').AsString;
      end;

      dm.conMySQL.Connected:= True;
      with dm.cdsAuxMySQL do begin
         Active:= False;
         CommandText:= ' SELECT cli_dmlibera, cli_dmdata' +
                       ' FROM clientes' +
                       ' WHERE cli_coddm = ' + QuotedStr(sCodEmpDM);
         Active:= True;

         sData:= FieldByName('cli_dmdata').AsString;

         if FieldByName('cli_dmlibera').AsString <> 'S' then begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' UPDATE parametros SET' +
                             ' contr = ' + QuotedStr('1++-x+),*+');
               Execute;
            end;
            sRetorno:= 'N'; // N�o Liberado
         end
         else begin
            with dm.cdsAuxiliar do begin
               Active:= False;
               CommandText:= ' UPDATE parametros SET' +
                             ' contr = ' + QuotedStr('1++-y+),*+') + ',' +
                             ' contr1 = ' + QuotedStr(Criptografar(sData)) ;
               Execute;
            end;
            if (AllTrim(sData) = EmptyStr) or (sData = Null) then begin
               sRetorno:= 'L'; // Liberado
            end
            else begin
               if ArrumaDataNumero(StrToDate(sData)) >= ArrumaDataNumero(Date()) then begin
                  sRetorno:= 'L'; // Liberado
               end
               else begin
                  sRetorno:= 'E'; // Data Expirada
               end;
            end;
         end;
      end;
      dm.conMySQL.Connected:= False;

      Result:= sRetorno;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao validar libera��o do sistema. Entre em contato com a Destra Consultoria.' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

function VerificarRegistroOffline: string;
var
   sRetorno: string;
   sParametro, sData: string;
begin
   try
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT contr, contr1 FROM parametros';
         Active:= True;

         sParametro:= FieldByName('contr').AsString;
         sData     := Descriptografar(FieldByName('contr1').AsString);
      end;

      if sParametro[5] = 'y' then begin
         if (AllTrim(sData) = EmptyStr) or (sData = Null) then begin
            sRetorno:= 'L'; // Liberado
         end
         else begin
            if ArrumaDataNumero(StrToDate(sData)) >= ArrumaDataNumero(Date()) then begin
               sRetorno:= 'L'; // Liberado
            end
            else begin
               sRetorno:= 'E'; // Data Expirada
            end;
         end;
      end
      else begin
         sRetorno:= 'N'; // N�o Liberado
      end;

      Result:= sRetorno;
   except
      on E:Exception do begin
         Application.MessageBox(PChar('Erro ao validar libera��o do sistema. Entre em contato com a Destra Consultoria.' + #13 + E.Message),'Erro',MB_OK + MB_ICONERROR);
      end;
   end;
end;

function VerificaAutenticidadeSistema: Boolean;
var
   DataAtual, DataVenc: TDateTime;
   wDia, wMes, wAno: Word;
   Reg, DadosLocal, DadosReg: String;
   nDias: Integer;
begin
   nDias := 15;

   Result := True;

//   Reg := LerRegistro(pathReg, nomeReg);
   Reg:= LerRegistroNovo();

   // Se n�o tiver o registro, ent�o cria para N dias
   if AllTrim(Reg) = EmptyStr then begin
      // Grava o registro com data de mais N dias de uso
      DataAtual := Date;
      // DataVenc  := IncMonth(DataAtual);
      DataVenc := DataAtual + nDias;
      DecodeDate(DataVenc, wAno, wMes, wDia);
//      GravarRegistro(pathReg, nomeReg, Cript(RetNumSerieHD(True) + RetWinPath) + Cript(StrZero(wDia, 2) + '/' +
//        StrZero(wMes, 2) + '/' + StrZero(wAno, 4)));
//      GravarRegistroNovo(Cript(RetNumSerieHD(True) + RetWinPath) + Cript(StrZero(wDia, 2) + '/' +
//        StrZero(wMes, 2) + '/' + StrZero(wAno, 4)));
      GravarRegistroNovo(Cript(StrZero(wDia, 2) + '/' + StrZero(wMes, 2) + '/' + StrZero(wAno, 4)));

      // avisa que est� usando uma vers�o trial
      Application.MessageBox
        (PChar('Voc� est� utilizando uma vers�o de demonstra��o do Destra Manager,'
        + #13 + 'o que lhe d� o direito de usar o sistema por ' +
        AllTrim(IntToStr(nDias)) + ' dias a partir de hoje.' + #13 +
        'Ap�s este per�odo, ser� necess�rio adquirir a Chave de Ativa��o que lhe dar� direito a licen�a de uso deste software.'),
        'ATEN��O!', MB_OK + MB_ICONEXCLAMATION);
   end
   else begin
      DadosLocal := Cript(RetNumSerieHD(True) + RetWinPath);
      DadosReg := Copy(Reg, 1, Length(Reg) - 10);

      if DadosReg = DadosLocal then begin
         // Se o conteudo do registro for diferente de branco, verifica se j� expirou
         DataVenc := StrToDate(Decript(Copy(Reg, Length(Reg) - 9, 10)));

         if DataVenc < Date then begin
            Application.MessageBox
              ('A sua vers�o de demonstra��o ou chave de ativa��o do sistema Destra Manager expirou.'
              + #13 + 'Para continuar utilizando os benef�cios deste sistema, ser� necess�rio adquirir a Chave de Ativa��o que lhe dar� direito a licen�a de uso deste software.',
              'ATEN��O!', MB_OK + MB_ICONWARNING);
            FormAtivaSistema := TFormAtivaSistema.Create(Application);
            Result := FormAtivaSistema.ShowModal = mrOK;
         end
         else begin
            if DataVenc - Date <= 5 then begin
               Application.MessageBox
                 (PChar('Falta(m) ' + Trim(FloatToStr(DataVenc - Date)) +
                 ' dia(s) para expirar a sua vers�o de demonstra��o ou chave de ativa��o do sistema Destra Manager.'
                 + #13 + 'Para adquirir uma licen�a definitiva, entre em contato pelo e-mail daniel@destraconsultoria.com.br e solicite sua Chave de Ativa��o.'),
                 'ATEN��O!', MB_OK + MB_ICONWARNING);
               Result := True;

            end;
         end;
      end
      else begin
         FormAtivaSistema := TFormAtivaSistema.Create(Application);
         Result := FormAtivaSistema.ShowModal = mrOK;
      end;
   end;
end;

end.
