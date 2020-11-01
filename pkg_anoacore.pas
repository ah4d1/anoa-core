{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit pkg_anoacore;

{$warn 5023 off : no warning about unused units}
interface

uses
  ac_app, ac_color, ac_dialog, ac_exe, ac_string, ac_filedir, ac_memo, 
  ac_registry, ac_stringlist, ac_system, ac_synedit, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ac_app', @ac_app.Register);
  RegisterUnit('ac_color', @ac_color.Register);
  RegisterUnit('ac_dialog', @ac_dialog.Register);
  RegisterUnit('ac_exe', @ac_exe.Register);
  RegisterUnit('ac_string', @ac_string.Register);
  RegisterUnit('ac_filedir', @ac_filedir.Register);
  RegisterUnit('ac_memo', @ac_memo.Register);
  RegisterUnit('ac_registry', @ac_registry.Register);
  RegisterUnit('ac_stringlist', @ac_stringlist.Register);
  RegisterUnit('ac_system', @ac_system.Register);
  RegisterUnit('ac_synedit', @ac_synedit.Register);
end;

initialization
  RegisterPackage('pkg_anoacore', @Register);
end.
