@echo off

set "~=%USERPROFILE%"
set EDITOR=%USERPROFILE%\scoop\shims\lvim.cmd
set PATH=%PATH%;%USERPROFILE%\scoop\apps\git\current\usr\bin

call %USERPROFILE%\etc\cmd_prompt.bat
call %USERPROFILE%\etc\cmd_aliases.bat
