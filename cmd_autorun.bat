@echo off

title cmd
set "~=%USERPROFILE%"
set "DIRCMD=/A"
set EDITOR=lvim
set PATH=%PATH%;%USERPROFILE%\scoop\apps\git\current\usr\bin

call %USERPROFILE%\etc\cmd_prompt.bat
call %USERPROFILE%\etc\cmd_aliases.bat
