x64dbg-installer
================

An [Inno Setup] installer for [x64dbg].


Optional Features
-----------------

- Adds shortcuts to desktop and start menu
- Registers shell extensions for `exe` and `dll` files
- Installs the plugin SDK if selected
- Allows installing popular plugins as components


Building
--------

1. Extract the x64dbg release into `files`
2. Run `download-plugins.ps1` to download the plugins to `files/plugins`
3. Compile `installer.iss` with Inno Setup Compiler

[Inno Setup]:http://www.jrsoftware.org/isinfo.php
[x64dbg]:https://github.com/x64dbg/x64dbg
