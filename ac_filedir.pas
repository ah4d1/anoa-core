unit ac_filedir;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils;

type
  TAcFileDir = class(TComponent)
  public
    procedure fcCreateFile (AFileName : TFileName; AText : WideString);
    procedure fcDeleteFile (AFileName : TFileName);
    function fcFileToStringList (AFileName : TFileName) : TStringList;
    function fcTmpFileName : TFileName;
    function fcIsExt (AFileExt : string; ADefaultFilter : string) : Boolean;
  end;

var
  vacFileDir : TAcFileDir;

procedure Register;

implementation

uses
  ac_string;

procedure Register;
begin
  RegisterComponents('AnoaCore',[TAcFileDir]);
end;

procedure TAcFileDir.fcCreateFile (AFileName : TFileName; AText : WideString);
var
  LF : TextFile;
begin
  AssignFile(LF,AFileName);
  Rewrite(LF);
  Writeln(LF,AText);
  CloseFile(LF);
end;

procedure TAcFileDir.fcDeleteFile (AFileName : TFileName);
begin
  if FileExists(AFileName) then DeleteFile(AFileName);
end;

function TAcFileDir.fcFileToStringList (AFileName : TFileName) : TStringList;
var
  LStringList : TStringList;
  LFile : TextFile;
  LLine : WideString;
begin
  LStringList := TStringList.Create;
  AssignFile(LFile,AFileName);
  Reset(LFile);
  repeat
    Readln(LFile,LLine);
    LStringList.Add(string(LLine));
  until EOF(LFile);
  CloseFile(LFile);
  Result := LStringList;
end;

function TAcFileDir.fcTmpFileName : TFileName;
begin
  Result := GetTempFileName;
end;

{Is File Ext a member of Default Filter?}
function TAcFileDir.fcIsExt (AFileExt : string; ADefaultFilter : string) : Boolean;
var
  i : Byte;
  LFilters : TStringList;
  LExts : TStringList;
  LFound : Boolean;
begin
  LFilters := vacString.fcSplit(ADefaultFilter,'|');
  LExts := vacString.fcSplit(LFilters[1],';');
  LFound := False;
  for i := 0 to LExts.Count - 1 do
  begin
    if '*' + AFileExt = LExts[i] then
    begin
      LFound := True;
      Break;
    end;
  end;
  Result := LFound;
end;

end.

