unit ac_registry;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, Registry;

type
  tacRegistry = class(TComponent)
  public
    procedure fcWriteString (ARootKey : HKEY; AKey,AName,AValue : string);
  end;

var
  vacRegistry : tacRegistry;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AnoaCore',[tacRegistry]);
end;

procedure tacRegistry.fcWriteString (ARootKey : HKEY; AKey,AName,AValue : string);
var
  LRegistry : TRegistry;
begin
  LRegistry := TRegistry.Create();
  LRegistry.RootKey := ARootKey;
  LRegistry.OpenKey(AKey,True);
  LRegistry.WriteString(AName,AValue);
  LRegistry.CloseKey();
  LRegistry.Free;
end;

end.

