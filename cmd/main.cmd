@echo off

set "~=%USERPROFILE:\=/%"
set "DIRCMD=/A"

@REM Enable color
set "COLORTERM=truecolor"

@REM Set some applications
set BROWSER=chromium
set EDITOR=vscodium

call "%~dp0\prompt.cmd"
call "%~dp0\aliases"
