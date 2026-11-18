@echo off

set "~=%USERPROFILE:\=/%"
set "DIRCMD=/A"

@REM Enable color
set "COLORTERM=truecolor"

@REM Set some applications
set BROWSER=chromium
set EDITOR=vscodium

call %USERPROFILE%\etc\cmd_prompt.bat
call %USERPROFILE%\etc\cmd_aliases.bat
