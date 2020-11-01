unit ac_synhighlighter;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, SynEdit, Graphics, SynEditHighlighter, SynHighlighterCobol,
  SynHighlighterCS, SynHighlighterCSS, SynHighlighterHTML, SynHighlighterJava,
  SynHighlighterJSON, SynHighlighterPas, SynHighlighterPHP, SynHighlighterPython,
  SynHighlighterSQL;

type
  TShLang = (shLangNone,shLangCobol,shLangCS,shLangCSS,shLangHTML,shLangJava,shLangJSON,
    shLangPas,shLangPHP,shLangPython,shLangSQL
  );
  TAcCustomSynHighlighter = class(TComponent)
  private
    FLang : TShLang;
    {Attribute Colors}
    FCommentAttriColor : TColor;
    FKeyAttriColor : TColor;
    {Highlighter}
    FNone   : TSynCustomHighLighter;
    FCobol  : TSynCobolSyn;
    FCS     : TSynCSSyn;
    FCSS    : TSynCSSSyn;
    FHTML   : TSynHTMLSyn;
    FJava   : TSynJavaSyn;
    FJSON   : TSynJSONSyn;
    FPas    : TSynPasSyn;
    FPHP    : TSynPHPSyn;
    FPython : TSynPythonSyn;
    FSQL    : TSynSQLSyn;
    {Default Filter}
    FDefaultFilter : WideString;
    {Ext}
    FExt : string;
    {Highlighter}
    FHighlighter : TSynCustomHighlighter;
    {Lang}
    function GetLang : TShLang;
    procedure SetLang (AValue : TShLang);
    {Default Filter}
    function GetDefaultFilter : WideString;
    {Ext}
    function GetExt : string;
    procedure SetExt (AValue : string);
    {Set Color}
    procedure fcSetColor (ALang : TSynCustomHighlighter);
    procedure fcSetColor (ALang : TSynCustomHighlighter; AComment : Boolean);
  public
    {Attribute Colors}
    property vCommentAttriColor : TColor read FCommentAttriColor write FCommentAttriColor;
    property vKeyAttriColor : TColor read FKeyAttriColor write FKeyAttriColor;
    {Highlighter}
    property vNone : TSynCustomHighLighter read FNone write FNone;
    property vCobol : TSynCobolSyn read FCobol write FCobol;
    property vCS : TSynCSSyn read FCS write FCS;
    property vCSS : TSynCSSSyn read FCSS write FCSS;
    property vHTML : TSynHTMLSyn read FHTML write FHTML;
    property vJava : TSynJavaSyn read FJava write FJava;
    property vJSON : TSynJSONSyn read FJSON write FJSON;
    property vPas : TSynPasSyn read FPas write FPas;
    property vPHP : TSynPHPSyn read FPHP write FPHP;
    property vPython : TSynPythonSyn read FPython write FPython;
    property vSQL : TSynSQLSyn read FSQL write FSQL;
    {}
    property vLang : TShLang read GetLang write SetLang default shLangNone;
    property vDefaultFilter : WideString read GetDefaultFilter;
    property vExt : string read GetExt write SetExt;
    property vHighlighter : TSynCustomHighlighter read FHighlighter;
    constructor Create (AOwner: TComponent); override;
  end;
  TAcSynHighlighter = class(TAcCustomSynHighlighter)
  published
    property vLang;
  end;

procedure Register;

implementation

uses
  ac_filedir;

procedure Register;
begin
  RegisterComponents('AnoaCore',[TAcSynHighlighter]);
end;

constructor TAcCustomSynHighlighter.Create (AOwner : TComponent);
begin
  inherited Create(AOwner);
  {Attribute Colors}
  Self.FCommentAttriColor := clRed;
  Self.FKeyAttriColor := clBlue;
  {Highlighter}
  Self.FNone   := nil;
  Self.FCobol  := TSynCobolSyn.Create(AOwner);
  Self.FCS     := TSynCSSyn.Create(AOwner);
  Self.FCSS    := TSynCSSSyn.Create(AOwner);
  Self.FHTML   := TSynHTMLSyn.Create(AOwner);
  Self.FJava   := TSynJavaSyn.Create(AOwner);
  Self.FJSON   := TSynJSONSyn.Create(AOwner);
  Self.FPas    := TSynPasSyn.Create(AOwner);
  Self.FPHP    := TSynPHPSyn.Create(AOwner);
  Self.FPython := TSynPythonSyn.Create(AOwner);
  Self.FSQL    := TSynSQLSyn.Create(AOwner);
  {Set Color}
  Self.fcSetColor(Self.FCobol);
  Self.fcSetColor(Self.FCS);
  Self.fcSetColor(Self.FCSS);
  Self.fcSetColor(Self.FHTML);
  Self.fcSetColor(Self.FJava);
  Self.fcSetColor(Self.FJSON,False);
  Self.fcSetColor(Self.FPas);
  Self.fcSetColor(Self.FPHP);
  Self.fcSetColor(Self.FPython);
  Self.fcSetColor(Self.FSQL);
end;

function TAcCustomSynHighlighter.GetLang : TShLang;
begin
  Result := Self.FLang;
end;

procedure TAcCustomSynHighlighter.SetLang (AValue : TShLang);
begin
  Self.FLang := AValue;
  case Self.FLang of
    shLangNone   : Self.FHighlighter := Self.FNone;
    shLangCobol  : Self.FHighlighter := Self.FCobol;
    shLangCS     : Self.FHighlighter := Self.FCS;
    shLangCSS    : Self.FHighlighter := Self.FCSS;
    shLangHTML   : Self.FHighlighter := Self.FHTML;
    shLangJava   : Self.FHighlighter := Self.FJava;
    shLangJSON   : Self.FHighlighter := Self.FJSON;
    shLangPas    : Self.FHighlighter := Self.FPas;
    shLangPHP    : Self.FHighlighter := Self.FPHP;
    shLangPython : Self.FHighlighter := Self.FPython;
    shLangSQL    : Self.FHighlighter := Self.FSQL;
  end;
end;

function TAcCustomSynHighlighter.GetDefaultFilter : WideString;
begin
  Result := ''
    + 'All Files (*.*)|*.*'
    + '|' + Self.FCobol.DefaultFilter
    + '|' + Self.FCS.DefaultFilter
    + '|' + Self.FCSS.DefaultFilter
    + '|' + Self.FHTML.DefaultFilter
    + '|' + Self.FJava.DefaultFilter
    + '|' + Self.FJSOn.DefaultFilter
    + '|' + Self.FPas.DefaultFilter
    + '|' + Self.FPHP.DefaultFilter
    + '|' + Self.FPython.DefaultFilter
    + '|' + Self.FSQL.DefaultFilter
  ;
end;

function TAcCustomSynHighlighter.GetExt : string;
begin
  Result := Self.FExt;
end;

procedure TAcCustomSynHighlighter.SetExt (AValue : string);
var
  LLang : TShLang;
begin
  LLang := shLangNone;
  if vacFileDir.fcIsExt(AValue,Self.FCobol.DefaultFilter) then LLang := shLangCobol
    else if vacFileDir.fcIsExt(AValue,Self.FCS.DefaultFilter) then LLang := shLangCS
    else if vacFileDir.fcIsExt(AValue,Self.FCSS.DefaultFilter) then LLang := shLangCSS
    else if vacFileDir.fcIsExt(AValue,Self.FHTML.DefaultFilter) then LLang := shLangHTML
    else if vacFileDir.fcIsExt(AValue,Self.FJava.DefaultFilter) then LLang := shLangJava
    else if vacFileDir.fcIsExt(AValue,Self.FJSON.DefaultFilter) then LLang := shLangJSON
    else if vacFileDir.fcIsExt(AValue,Self.FPas.DefaultFilter) then LLang := shLangPas
    else if vacFileDir.fcIsExt(AValue,Self.FPHP.DefaultFilter) then LLang := shLangPHP
    else if vacFileDir.fcIsExt(AValue,Self.FPython.DefaultFilter) then LLang := shLangPython
    else if vacFileDir.fcIsExt(AValue,Self.FSQL.DefaultFilter) then LLang := shLangSQL
  ;
  Self.FLang := LLang;
end;

procedure TAcCustomSynHighlighter.fcSetColor (ALang : TSynCustomHighlighter);
begin
  ALang.CommentAttribute.Foreground := Self.FCommentAttriColor;
  ALang.KeywordAttribute.Foreground := Self.FKeyAttriColor;
end;

procedure TAcCustomSynHighlighter.fcSetColor (ALang : TSynCustomHighlighter; AComment : Boolean);
begin
  if AComment then ALang.CommentAttribute.Foreground := Self.FCommentAttriColor;
  ALang.KeywordAttribute.Foreground := Self.FKeyAttriColor;
end;

end.

