unit frm_Processos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, RXSpin;

type
  TFormProcessos = class(TForm)
    pnlPCH: TPanel;
    pnlPOC: TPanel;
    pnlPAP: TPanel;
    pnlPAP11: TPanel;
    pnlPAP8: TPanel;
    pnlPAP7: TPanel;
    pnlPAP6: TPanel;
    pnlPAP5: TPanel;
    pnlPAP4: TPanel;
    pnlPAP3: TPanel;
    pnlPAP2: TPanel;
    pnlPAP1: TPanel;
    pnlTitulo3: TPanel;
    pnlPAP10: TPanel;
    pnlPAP9: TPanel;
    pnlPOC1: TPanel;
    pnlPOC2: TPanel;
    pnlPOC3: TPanel;
    pnlPOC4: TPanel;
    pnlPOC5: TPanel;
    pnlPOC6: TPanel;
    pnlPOC7: TPanel;
    pnlPOC8: TPanel;
    pnlPOC9: TPanel;
    pnlPOC10: TPanel;
    pnlPOC11: TPanel;
    pnlTitulo1: TPanel;
    pnlPCH1: TPanel;
    pnlPCH2: TPanel;
    pnlPCH3: TPanel;
    pnlPCH4: TPanel;
    pnlPCH5: TPanel;
    pnlPCH6: TPanel;
    pnlPCH7: TPanel;
    pnlPCH8: TPanel;
    pnlPCH9: TPanel;
    pnlPCH10: TPanel;
    pnlPCH11: TPanel;
    pnlTitulo2: TPanel;
    pnlBotoes: TPanel;
    pnlPOC12: TPanel;
    pnlPOC13: TPanel;
    pnlPOC14: TPanel;
    pnlPCH12: TPanel;
    pnlPCH13: TPanel;
    pnlPCH14: TPanel;
    pnlPAP12: TPanel;
    pnlPAP13: TPanel;
    pnlPAP14: TPanel;
    btnSair: TBitBtn;
    pnlPAP15: TPanel;
    pnlPAP16: TPanel;
    pnlPCH15: TPanel;
    pnlPCH16: TPanel;
    pnlPOC15: TPanel;
    pnlPOC16: TPanel;
    lbl15: TLabel;
    spnAltura: TRxSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure CriaProcessosPOC();
    procedure CriaProcessosPCH();
    procedure CriaProcessosPAP();
    procedure AbrirTartaruga(Sender: TObject);
    procedure pnlPOC1MouseEnter(Sender: TObject);
    procedure pnlPOC1MouseLeave(Sender: TObject);
    function VerificarProcessoUsuario(sNomeProcesso: string): Boolean;
    procedure AjustarProcessos(QtdProcessos: string);
    procedure spnAlturaChange(Sender: TObject);
    procedure BuscarAltura();
  private
    { Private declarations }
  public
    { Public declarations }
   cNomeProcesso: string;
   iCodProcesso: Integer;
  end;

var
  FormProcessos: TFormProcessos;

implementation

uses frm_dm, frm_Inicial, frm_Tartaruga, Funcoes;

{$R *.dfm}

procedure TFormProcessos.AjustarProcessos(QtdProcessos: string);
var
   i: Integer;
   iAltura: Integer;
begin
   case StrToInt(QtdProcessos) of
      6: iAltura:= 88;
      7: iAltura:= 76;
      8: iAltura:= 66;
      9: iAltura:= 59;
      10: iAltura:= 53;
      11: iAltura:= 48;
      12: iAltura:= 44;
      13: iAltura:= 41;
      14: iAltura:= 38;
      15: iAltura:= 36;
      16: iAltura:= 33;
   end;

   for i:= 0 to Self.ComponentCount - 1 do begin
      if Self.Components[i] is TPanel then begin
         if ((Self.Components[i] as TPanel).Name <> 'pnlBotoes') and
            (Copy((Self.Components[i] as TPanel).Name, 1,4) <> 'pnlT') then begin
            (Self.Components[i] as TPanel).Height:= iAltura;
         end;
      end;
   end;
end;

procedure TFormProcessos.spnAlturaChange(Sender: TObject);
begin
   AjustarProcessos(FloatToStr(spnAltura.Value));
end;

procedure TFormProcessos.AbrirTartaruga(Sender: TObject);
begin
   cNomeProcesso:= (Sender as TPanel).Caption;

   if Alltrim(cNomeProcesso) <> EmptyStr then begin
   // Trava para acesso dos processos na tela tartaruga - V. 1.82 - Ambicamp - 25/05/2011
      // Busca o código do processo selecionado
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT codi_pro FROM Processos' +
                       ' WHERE nome_pro = ' + QuotedStr(cNomeProcesso);
         Active:= True
      end;
      iCodProcesso:= dm.cdsAuxiliar.FieldByName('codi_pro').AsInteger;

      // Verifica se o processo está liberado para o usuário
      with dm.cdsAuxiliar do begin
         Active:= False;
         CommandText:= ' SELECT COUNT(*) as Qtd FROM Usuarios_Processos' +
                       ' WHERE usu_proc = ' + IntToStr(iCodProcesso) +
                       ' AND usu_nome = ' + QuotedStr(cUsuario);
         Active:= True
      end;

      if dm.cdsAuxiliar.FieldByName('Qtd').AsInteger > 0 then begin
         FormTartaruga:= TFormTartaruga.Create(nil);
         FormTartaruga.ShowModal;
         FormTartaruga.Release;
      end
      else begin
         Application.MessageBox(PChar('O usuário ' + cUsuario + ' não tem permissão para acessar ' + #13 + 'a tela tartaruga do processo selecionado'), 'Confirmação', MB_OK + MB_ICONWARNING);
      end;
   end;
end;

procedure TFormProcessos.btnSairClick(Sender: TObject);
begin
   // Grava a altura dos processos na tabela de usuários
   Executar('UPDATE usuarios SET' +
            ' usu_qtd_proc =' + FloatToStr(spnAltura.Value) +
            ' WHERE nome_usu = ' + QuotedStr(cUsuario));

   Self.Close;
end;

procedure TFormProcessos.BuscarAltura;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT usu_qtd_proc FROM usuarios' +
                    ' WHERE nome_usu = ' + QuotedStr(cUsuario);
      Active:= True;

      if RecordCount > 0 then begin
         spnAltura.Value:= FieldByName('usu_qtd_proc').AsInteger;
      end
      else begin
         spnAltura.Value:= 14;
      end;

      AjustarProcessos(FloatToStr(spnAltura.Value));
   end;
end;

procedure TFormProcessos.FormShow(Sender: TObject);
begin
   pnlPCH.Width:= 350;
   pnlPOC.Width:= 350;
   pnlPAP.Width:= 350;

   CriaProcessosPOC();
   CriaProcessosPCH();
   CriaProcessosPAP();

   BuscarAltura();
end;

procedure TFormProcessos.pnlPOC1MouseEnter(Sender: TObject);
begin
   (Sender as TPanel).Color:= clBtnShadow;
end;

procedure TFormProcessos.pnlPOC1MouseLeave(Sender: TObject);
begin
   (Sender as TPanel).Color:= clBtnFace;
end;

function TFormProcessos.VerificarProcessoUsuario(sNomeProcesso: string): Boolean;
begin
   // Busca o código do processo
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT codi_pro FROM Processos' +
                    ' WHERE nome_pro = ' + QuotedStr(sNomeProcesso);
      Active:= True;

      iCodProcesso:= FieldByName('codi_pro').AsInteger;
   end;


   // Verifica se o processo está cadastrado no usuário
   with dm.cdsAux do begin
      Active:= False;
      CommandText:= ' SELECT Count(*) as Qtd ' +
                    ' FROM usuarios_processos' +
                    ' WHERE usu_proc = ' + IntToStr(iCodProcesso) +
                    ' and usu_nome = ' + QuotedStr(AllTrim(cUsuario));
      Active:= True;

      if FieldByName('Qtd').AsInteger > 0 then begin
         Result:= True;
      end
      else begin
         Result:= False;
      end;
   end;
end;

procedure TFormProcessos.CriaProcessosPAP;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT * FROM processos WHERE clas_pro = 3 ORDER BY nome_pro';
      Active:= True;
      First;

      while not Eof do begin
         case RecNo of
            1: begin
               pnlPAP1.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP1.Caption) then begin
                  pnlPAP1.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP1.Font.Color:= clBlack;
               end;
            end;
            2: begin
               pnlPAP2.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP2.Caption) then begin
                  pnlPAP2.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP2.Font.Color:= clBlack;
               end;
            end;
            3: begin
               pnlPAP3.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP3.Caption) then begin
                  pnlPAP3.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP3.Font.Color:= clBlack;
               end;
            end;
            4: begin
               pnlPAP4.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP4.Caption) then begin
                  pnlPAP4.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP4.Font.Color:= clBlack;
               end;
            end;
            5: begin
               pnlPAP5.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP5.Caption) then begin
                  pnlPAP5.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP5.Font.Color:= clBlack;
               end;
            end;
            6: begin
               pnlPAP6.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP6.Caption) then begin
                  pnlPAP6.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP6.Font.Color:= clBlack;
               end;
            end;
            7: begin
               pnlPAP7.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP7.Caption) then begin
                  pnlPAP7.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP7.Font.Color:= clBlack;
               end;
            end;
            8: begin
               pnlPAP8.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP8.Caption) then begin
                  pnlPAP8.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP8.Font.Color:= clBlack;
               end;
            end;
            9: begin
               pnlPAP9.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP9.Caption) then begin
                  pnlPAP9.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP9.Font.Color:= clBlack;
               end;
            end;
            10: begin
               pnlPAP10.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP10.Caption) then begin
                  pnlPAP10.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP10.Font.Color:= clBlack;
               end;
            end;
            11: begin
               pnlPAP11.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP11.Caption) then begin
                  pnlPAP11.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP11.Font.Color:= clBlack;
               end;
            end;
            12: begin
               pnlPAP12.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP12.Caption) then begin
                  pnlPAP12.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP12.Font.Color:= clBlack;
               end;
            end;
            13: begin
               pnlPAP13.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP13.Caption) then begin
                  pnlPAP13.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP13.Font.Color:= clBlack;
               end;
            end;
            14: begin
               pnlPAP14.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP14.Caption) then begin
                  pnlPAP14.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP14.Font.Color:= clBlack;
               end;
            end;
            15: begin
               pnlPAP15.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP15.Caption) then begin
                  pnlPAP15.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP15.Font.Color:= clBlack;
               end;
            end;
            16: begin
               pnlPAP16.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPAP16.Caption) then begin
                  pnlPAP16.Font.Color:= clGreen;
               end
               else begin
                  pnlPAP16.Font.Color:= clBlack;
               end;
            end;
         end;
         Next;
      end;
   end;
end;

procedure TFormProcessos.CriaProcessosPCH;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT * FROM processos WHERE clas_pro = 2 ORDER BY nome_pro';
      Active:= True;
      First;

      while not Eof do begin
         case RecNo of
            1: begin
               pnlPCH1.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH1.Caption) then begin
                  pnlPCH1.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH1.Font.Color:= clBlack;
               end;
            end;
            2: begin
               pnlPCH2.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH2.Caption) then begin
                  pnlPCH2.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH2.Font.Color:= clBlack;
               end;
            end;
            3: begin
               pnlPCH3.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH3.Caption) then begin
                  pnlPCH3.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH3.Font.Color:= clBlack;
               end;
            end;
            4: begin
               pnlPCH4.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH4.Caption) then begin
                  pnlPCH4.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH4.Font.Color:= clBlack;
               end;
            end;
            5: begin
               pnlPCH5.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH5.Caption) then begin
                  pnlPCH5.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH5.Font.Color:= clBlack;
               end;
            end;
            6: begin
               pnlPCH6.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH6.Caption) then begin
                  pnlPCH6.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH6.Font.Color:= clBlack;
               end;
            end;
            7: begin
               pnlPCH7.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH7.Caption) then begin
                  pnlPCH7.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH7.Font.Color:= clBlack;
               end;
            end;
            8: begin
               pnlPCH8.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH8.Caption) then begin
                  pnlPCH8.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH8.Font.Color:= clBlack;
               end;
            end;
            9: begin
               pnlPCH9.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH9.Caption) then begin
                  pnlPCH9.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH9.Font.Color:= clBlack;
               end;
            end;
            10: begin
               pnlPCH10.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH10.Caption) then begin
                  pnlPCH10.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH10.Font.Color:= clBlack;
               end;
            end;
            11: begin
               pnlPCH11.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH11.Caption) then begin
                  pnlPCH11.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH11.Font.Color:= clBlack;
               end;
            end;
            12: begin
               pnlPCH12.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH12.Caption) then begin
                  pnlPCH12.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH12.Font.Color:= clBlack;
               end;
            end;
            13: begin
               pnlPCH13.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH13.Caption) then begin
                  pnlPCH13.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH13.Font.Color:= clBlack;
               end;
            end;
            14: begin
               pnlPCH14.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH14.Caption) then begin
                  pnlPCH14.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH14.Font.Color:= clBlack;
               end;
            end;
            15: begin
               pnlPCH15.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH15.Caption) then begin
                  pnlPCH15.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH15.Font.Color:= clBlack;
               end;
            end;
            16: begin
               pnlPCH16.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPCH16.Caption) then begin
                  pnlPCH16.Font.Color:= clGreen;
               end
               else begin
                  pnlPCH16.Font.Color:= clBlack;
               end;
            end;
         end;
         Next;
      end;
   end;
end;

procedure TFormProcessos.CriaProcessosPOC;
begin
   with dm.cdsAuxiliar do begin
      Active:= False;
      CommandText:= ' SELECT * FROM processos WHERE clas_pro = 1 ORDER BY nome_pro';
      Active:= True;
      First;

      while not Eof do begin
         case RecNo of
            1: begin
               pnlPOC1.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC1.Caption) then begin
                  pnlPOC1.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC1.Font.Color:= clBlack;
               end;
            end;
            2: begin
               pnlPOC2.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC2.Caption) then begin
                  pnlPOC2.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC2.Font.Color:= clBlack;
               end;
            end;
            3: begin
               pnlPOC3.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC3.Caption) then begin
                  pnlPOC3.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC3.Font.Color:= clBlack;
               end;
            end;
            4: begin
               pnlPOC4.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC4.Caption) then begin
                  pnlPOC4.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC4.Font.Color:= clBlack;
               end;
            end;
            5: begin
               pnlPOC5.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC5.Caption) then begin
                  pnlPOC5.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC5.Font.Color:= clBlack;
               end;
            end;
            6: begin
               pnlPOC6.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC6.Caption) then begin
                  pnlPOC6.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC6.Font.Color:= clBlack;
               end;
            end;
            7: begin
               pnlPOC7.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC7.Caption) then begin
                  pnlPOC7.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC7.Font.Color:= clBlack;
               end;
            end;
            8: begin
               pnlPOC8.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC8.Caption) then begin
                  pnlPOC8.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC8.Font.Color:= clBlack;
               end;
            end;
            9: begin
               pnlPOC9.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC9.Caption) then begin
                  pnlPOC9.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC9.Font.Color:= clBlack;
               end;
            end;
            10: begin
               pnlPOC10.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC10.Caption) then begin
                  pnlPOC10.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC10.Font.Color:= clBlack;
               end;
            end;
            11: begin
               pnlPOC11.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC11.Caption) then begin
                  pnlPOC11.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC11.Font.Color:= clBlack;
               end;
            end;
            12: begin
               pnlPOC12.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC12.Caption) then begin
                  pnlPOC12.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC12.Font.Color:= clBlack;
               end;
            end;
            13: begin
               pnlPOC13.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC13.Caption) then begin
                  pnlPOC13.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC13.Font.Color:= clBlack;
               end;
            end;
            14: begin
               pnlPOC14.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC14.Caption) then begin
                  pnlPOC14.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC14.Font.Color:= clBlack;
               end;
            end;
            15: begin
               pnlPOC15.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC15.Caption) then begin
                  pnlPOC15.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC15.Font.Color:= clBlack;
               end;
            end;
            16: begin
               pnlPOC16.Caption:= FieldByName('nome_pro').AsString;
               if VerificarProcessoUsuario(pnlPOC16.Caption) then begin
                  pnlPOC16.Font.Color:= clGreen;
               end
               else begin
                  pnlPOC16.Font.Color:= clBlack;
               end;
            end;
         end;
         Next;
      end;
   end;
end;

end.
