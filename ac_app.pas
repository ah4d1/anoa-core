unit ac_app;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils;

type
  TAcApp = class(TComponent)
  public
    function fcGetParam : WideString;
  end;

var
  vacApp : TAcApp;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AnoaCore',[TAcApp]);
end;

// Get params sent to app in a single text
function TAcApp.fcGetParam : WideString;
var
  i : Integer;
  LResult : WideString;
begin
  LResult := '';
  for i := 1 to ParamCount() do LResult := Trim(LResult + ' ' + ParamStr(i));
  Result := LResult;
end;

end.

