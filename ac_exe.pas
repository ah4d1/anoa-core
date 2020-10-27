unit ac_exe;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, Process;

type
  tacExe = object
  public
    function fcRunCommand (AExeName : string; ACommand : string) : TStringList;
  end;

var
  vacExe : tacExe;

implementation

uses
  ac_string;

{One command & No Console}
function tacExe.fcRunCommand (AExeName : string; ACommand : string) : TStringList;
var
  LOutputString : string;
  LOutputStrings : TStringList;
begin
  RunCommand(AExeName,[ACommand],LOutputString,[poNoConsole]);
  LOutputStrings := vacString.fcSplit(LOutputString,#13);
  Result := LOutputStrings;
end;

end.
