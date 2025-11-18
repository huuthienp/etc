@echo off

set "~=%USERPROFILE:\=/%"
set "DIRCMD=/A"
set EDITOR=vscodium
set PATH=%USERPROFILE%\scoop\apps\git\current\usr\bin;%PATH%

@REM Enable color
set "COLORTERM=truecolor"

call %USERPROFILE%\etc\cmd_prompt.bat
call %USERPROFILE%\etc\cmd_aliases.bat
