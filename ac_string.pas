unit ac_string;

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
