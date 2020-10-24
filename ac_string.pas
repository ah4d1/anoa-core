unit ac_string;

{**************************************************************
*  Part of Anoa-Core by Ahadi Aprianto                        *
*  See https://github.com/ah4d1/anoa-core                     *
*  The name "Anoa" came from the name of the species endemic  *
*  to the island of Sulawesi in Indonesia.                    *
*  See https://en.wikipedia.org/wiki/Anoa                     *
**************************************************************}

interface

uses
  Classes, SysUtils;

type
  tacString = object
  public
    function fcSplit (AString : string; ADelimiter : Char) : TStringList;
  end;

var
  vacString : tacString;

implementation

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

