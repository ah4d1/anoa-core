unit ac_dialog;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, Dialogs;

type
  tacDialog = class(TComponent)
  public
    procedure fcInfo (AMessage : Widestring); overload;
    procedure fcInfo (ATitle : string; AMessage : Widestring); overload;
  end;

var
  vacDialog : tacDialog;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AnoaCore',[tacDialog]);
end;

procedure tacDialog.fcInfo (AMessage : Widestring);
begin
  Self.fcInfo('Information',AMessage);
end;

procedure tacDialog.fcInfo (ATitle : string; AMessage : Widestring);
begin
  MessageDlg(ATitle,AMessage,mtInformation,[mbOK],0);
end;

end.

