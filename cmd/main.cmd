@echo off

set "~=%USERPROFILE:\=/%"
set "DIRCMD=/A"

@REM Enable color
set "COLORTERM=truecolor"

@REM Set some applications
set BROWSER=chromium
set EDITOR=vscodium

@REM check if directory is git repo, and skip prompt.cmd if true
@REM otherwise, cd-ing (see aliases.cmd) would cause indefinite loop,
@REM as this script is called in a cmd sub-instance (see prompt.cmd)
git branch 2>&0 >nul  &  @REM returns error if not git repo
if 0 neq %errorlevel% (  @REM is not git repo
  call "%~dp0\prompt"
)

call "%~dp0\aliases"
