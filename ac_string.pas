unit ac_string;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils;

type
  tacString = class(TComponent)
  public
    function fcSplit (AString : string; ADelimiter : Char) : TStringList;
  end;

var
  vacString : tacString;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AnoaCore',[tacString]);
end;

function tacString.fcSplit (AString : string; ADelimiter : Char) : TStringList;
var
  LStrings : TStringList;
begin
  LStrings := TStringList.Create;
  LStrings.StrictDelimiter := True;
  LStrings.Delimiter := ADelimiter;
  LStrings.DelimitedText := AString;
  Result := LStrings;
end;

end.

