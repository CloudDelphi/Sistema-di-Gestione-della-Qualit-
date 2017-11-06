unit uAncestral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, ExtCtrls, ComCtrls, Grids, DBGrids,
  DBCtrls, DB, DBTables, IBCustomDataSet, IBQuery, RXDBCtrl, RxDBComb, Mask,
  IBUpdateSQL, ImgList, ToolWin, jpeg, ActnList, rxToolEdit;

type
  TfrmAncestral = class(TForm)
    pnlTitulo: TPanel;
    imgTitulo: TImage;
    lblTitulo: TRxLabel;
    ActionList1: TActionList;
    ActionSair: TAction;
    ActionF3: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ActionSairExecute(Sender: TObject);
    procedure ActionF3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAncestral: TfrmAncestral;

implementation


{$R *.dfm}

procedure TfrmAncestral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Self.Release;
//  Action := caFree;
end;

procedure TfrmAncestral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmAncestral.FormShow(Sender: TObject);
begin
   lblTitulo.Caption := Caption;
   Caption := 'Destra Manager';
end;

procedure TfrmAncestral.ActionSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAncestral.ActionF3Execute(Sender: TObject);
begin
  if Sender is TComboEdit then
  begin
    //if TComboEdit(Sender).OnButtonClick <> nil then
    //  TComboEdit(Sender).OnButtonClick;

//    showmessage('Pressionou F3');


  end;

  if Sender is TRxDBComboEdit then
  begin
    //if TComboEdit(Sender).OnButtonClick <> nil then
    //  TComboEdit(Sender).OnButtonClick;

//    showmessage('Pressionou F3');


  end;

end;

end.
