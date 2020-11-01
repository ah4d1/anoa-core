unit ac_synedit;

{**************************************************************
*  A Part of Anoa-Core                                        *
*  See https://github.com/ah4d1/anoa-core                     *
**************************************************************}

interface

uses
  Classes, SysUtils, SynEdit, Graphics;

type
  tseTheme = (seThemeNormal,seThemeDark);
  tacCustomSynEdit = class(TSynEdit)
  private
    FSynEditColor : TColor;
    FSynEditFontColor : TColor;
    FGutterColor : TColor;
    FGutterMarkupColor : TColor;
    FLineHighlightColor : TColor;
    FCommentAttriColor : TColor;
    FKeyAttriColor : TColor;
    FTheme : tseTheme;
    function GetTheme : tseTheme;
    procedure SetTheme (AValue : tseTheme);
    procedure _DefaultColor;
    procedure _ThemeNormal;
    procedure _ThemeDark;
  public
    property vTheme : tseTheme read GetTheme write SetTheme default seThemeNormal;
    constructor Create (AOwner: TComponent); override;
    procedure fcUndo;
    procedure fcRedo;
    procedure fcCopy;
    procedure fcCut;
    procedure fcPaste;
    procedure fcSelectAll;
  end;
  tacSynEdit = class(tacCustomSynEdit)
  published
    property vTheme;
  end;

var
  vacSynEdit : tacSynEdit;

procedure Register;

implementation

uses
  ac_color;

procedure Register;
begin
  RegisterComponents('AnoaCore',[tacSynEdit]);
end;

constructor tacCustomSynEdit.Create (AOwner : TComponent);
begin
  inherited Create(AOwner);
  Self._DefaultColor;
end;

procedure tacCustomSynEdit.fcUndo;
begin
  Self.Undo;
end;

procedure tacCustomSynEdit.fcRedo;
begin
  Self.Redo;
end;

procedure tacCustomSynEdit.fcCopy;
begin
  Self.CopyToClipboard;
end;

procedure tacCustomSynEdit.fcCut;
begin
  Self.CutToClipboard;
end;

procedure tacCustomSynEdit.fcPaste;
begin
  Self.PasteFromClipboard;
end;

procedure tacCustomSynEdit.fcSelectAll;
begin
  Self.SelectAll;
end;

function tacCustomSynEdit.GetTheme : tseTheme;
begin
  Result := Self.FTheme;
end;

procedure tacCustomSynEdit.SetTheme (AValue : tseTheme);
begin
  Self.FTheme := AValue;
  if Self.FTheme = seThemeNormal then
    Self._ThemeNormal
  else
    Self._ThemeDark
  ;
end;

procedure tacCustomSynEdit._DefaultColor;
begin
  Self.FSynEditColor := clWhite;
  Self.FSynEditFontColor := clBlack;
  Self.FGutterColor := clBtnFace;
  Self.FGutterMarkupColor := clBtnFace;
  Self.FLineHighlightColor := $00EFE8D6;
  Self.FCommentAttriColor := clRed;
  Self.FKeyAttriColor := clBlue;
end;

procedure tacCustomSynEdit._ThemeNormal;
begin
  Self.Color := Self.FSynEditColor;
  Self.Font.Color := Self.FSynEditFontColor;
  Self.Gutter.Color := Self.FGutterColor;
  Self.Gutter.Parts[1].MarkupInfo.Background := Self.FGutterMarkupColor;
  Self.LineHighlightColor.Background := Self.FLineHighlightColor;
  Self.FCommentAttriColor := Self.FCommentAttriColor;
  Self.FKeyAttriColor := Self.FKeyAttriColor;
end;

procedure tacCustomSynEdit._ThemeDark;
begin
  Self.Color := vacColor.fcInvert(Self.FSynEditColor);
  Self.Font.Color := vacColor.fcInvert(Self.FSynEditFontColor);
  Self.Gutter.Color := vacColor.fcInvert(Self.FGutterColor);
  Self.Gutter.Parts[1].MarkupInfo.Background := vacColor.fcInvert(Self.FGutterMarkupColor);
  Self.LineHighlightColor.Background := vacColor.fcInvert(Self.FLineHighlightColor);
  Self.FCommentAttriColor := vacColor.fcInvert(Self.FCommentAttriColor);
  Self.FKeyAttriColor := vacColor.fcInvert(Self.FKeyAttriColor);
end;

end.

