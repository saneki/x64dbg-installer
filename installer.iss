#define MyAppName "x64dbg"
#define MyAppVersion "25"
#define MyAppPublisher "x64dbg"
#define MyAppURL "http://x64dbg.com"

; Plugins, comment these out if you don't want them included in the installer
#define PLUGIN_SCYLLA
#define PLUGIN_TITANHIDE
#define PLUGIN_SWISSARMYKNIFE

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B8A277F8-EFB2-40DF-94CB-435A6BA5FE48}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=output
OutputBaseFilename=x64dbg.Setup
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64 ia64
UninstallDisplayIcon={app}\x64\x64dbg.exe
WizardSmallImageFile=img\smallimage.bmp

[Tasks]
Name: shellexe; Description: "Register shell extensions for *.exe files"; GroupDescription: "File extensions:"
Name: shelldll; Description: "Register shell extensions for *.dll files"; GroupDescription: "File extensions:"

[Registry]
; Shell extension: *.exe
Root: HKCR; Subkey: "exefile\shell\Debug with x64dbg"; ValueType: string; ValueData: "Debug with x64dbg"; Flags: uninsdeletekey; Tasks: shellexe
Root: HKCR; Subkey: "exefile\shell\Debug with x64dbg"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\x96dbg.exe"",0"; Tasks: shellexe
Root: HKCR; Subkey: "exefile\shell\Debug with x64dbg\Command"; ValueType: expandsz; ValueData: """C:\Program Files\x64dbg\x96dbg.exe"" ""%1"""; Tasks: shellexe
; Shell extension: *.dll
Root: HKCR; Subkey: "dllfile\shell\Debug with x64dbg"; ValueType: string; ValueData: "Debug with x64dbg"; Flags: uninsdeletekey; Tasks: shelldll
Root: HKCR; Subkey: "dllfile\shell\Debug with x64dbg"; ValueType: string; ValueName: "Icon"; ValueData: """{app}\x96dbg.exe"",0"; Tasks: shelldll
Root: HKCR; Subkey: "dllfile\shell\Debug with x64dbg\Command"; ValueType: expandsz; ValueData: """C:\Program Files\x64dbg\x96dbg.exe"" ""%1"""; Tasks: shelldll

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Icons]
Name: "{group}\x32dbg"; Filename: "{app}\x32\x32dbg.exe"
Name: "{group}\x64dbg"; Filename: "{app}\x64\x64dbg.exe"

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "program"; Description: "Program Files"; Types: full compact custom; Flags: fixed
Name: "pluginsdk"; Description: "Plugin SDK"; Types: full
Name: "plugins"; Description: "Open Source Plugins"; Types: full

; ==========================
; Optional plugin components
; ==========================

#ifdef PLUGIN_SCYLLA
Name: "plugins\scylla"; Description: "Scylla Hide"; Types: full compact
#endif

#ifdef PLUGIN_TITANHIDE
Name: "plugins\titanhide"; Description: "Titan Hide"; Types: full
#endif

#ifdef PLUGIN_SWISSARMYKNIFE
Name: "plugins\swissarmyknife"; Description: "Swiss Army Knife"; Types: full
#endif

[Files]
Source: "files\release\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "files\pluginsdk\*"; DestDir: "{app}\pluginsdk"; Components: pluginsdk; Flags: ignoreversion recursesubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

; =====================
; Optional plugin files
; =====================

#ifdef PLUGIN_SCYLLA
; 32-bit
Source: "files\plugins\ScyllaHide\HookLibraryx86.dll"; DestDir: "{app}\x32"; Components: "plugins\scylla"
Source: "files\plugins\ScyllaHide\NtApiCollection.ini"; DestDir: "{app}\x32"; Components: "plugins\scylla"
Source: "files\plugins\ScyllaHide\scylla_hide.ini"; DestDir: "{app}\x32"; Components: "plugins\scylla"
Source: "files\plugins\ScyllaHide\plugins\ScyllaHideX64DBGPlugin.dp32"; DestDir: "{app}\x32\plugins"; Components: "plugins\scylla"
; 64-bit
Source: "files\plugins\ScyllaHide\HookLibraryx64.dll"; DestDir: "{app}\x64"; Components: "plugins\scylla"
Source: "files\plugins\ScyllaHide\NtApiCollection.ini"; DestDir: "{app}\x64"; Components: "plugins\scylla"
Source: "files\plugins\ScyllaHide\scylla_hide.ini"; DestDir: "{app}\x64"; Components: "plugins\scylla"
Source: "files\plugins\ScyllaHide\plugins\ScyllaHideX64DBGPlugin.dp64"; DestDir: "{app}\x64\plugins"; Components: "plugins\scylla"
#endif

#ifdef PLUGIN_TITANHIDE
; 32-bit
Source: "files\plugins\TitanHide\x32\TitanHide.dp32"; DestDir: "{app}\x32\plugins"; Components: "plugins\titanhide"
; 64-bit
Source: "files\plugins\TitanHide\x64\TitanHide.dp64"; DestDir: "{app}\x64\plugins"; Components: "plugins\titanhide"
#endif

#ifdef PLUGIN_SWISSARMYKNIFE
; 32-bit
Source: "files\plugins\SwissArmyKnife\x32\plugins\SwissArmyKnife.dp32"; DestDir: "{app}\x32\plugins"; Components: "plugins\swissarmyknife"
; 64-bit
Source: "files\plugins\SwissArmyKnife\x64\plugins\SwissArmyKnife.dp64"; DestDir: "{app}\x64\plugins"; Components: "plugins\swissarmyknife"
#endif
