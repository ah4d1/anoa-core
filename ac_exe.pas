unit ac_exe;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, Process;

type
  TAcExe = class(TComponent)
  public
    function fcRun (AExeName : string; ACommand : string) : TStringList;
  end;

var
  vacExe : TAcExe;

procedure Register;

implementation

uses
  ac_string;

procedure Register;
begin
  RegisterComponents('AnoaCore',[TAcExe]);
end;

{One command & No Console}
{Example : fcRun('python','C:/myfile.py')}
function TAcExe.fcRun (AExeName : string; ACommand : string) : TStringList;
var
  LOutputString : string;
  LOutputStrings : TStringList;
begin
  {poNoConsole : no cmd window}
  {poStderrToOutPut : get error output}
  RunCommand(AExeName,[ACommand],LOutputString,[poNoConsole,poStderrToOutPut]);
  LOutputStrings := vacString.fcSplit(LOutputString,#13);
  Result := LOutputStrings;
end;

end.

