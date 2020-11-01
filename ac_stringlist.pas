unit ac_stringlist;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, StdCtrls;

type
  tacStringList = class(TComponent)
  public
    function fcToDelimited (AStringList : TStringList; ADelimiter : Char) : WideString;
  end;

var
  vacStringList : tacStringList;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AnoaCore',[tacStringList]);
end;

function tacStringList.fcToDelimited (AStringList : TStringList; ADelimiter : Char) : WideString;
var
  i : Integer;
  LString : WideString;
begin
  LString := '';
  for i := 0 to AStringList.Count - 1 do
  begin
    if i = 0 then
      LString := AStringList[i]
    else
      LString := LString + ADelimiter + AStringList[i]
    ;
  end;
  Result := LString;
end;

end.

