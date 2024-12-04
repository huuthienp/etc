@echo off
SetLocal EnableDelayedExpansion

set __git_branch_temp=".temp_branch_%RANDOM%"

set "_cd=!CD:%USERPROFILE%=~!"
set "_cd=%_cd:\=/%"

if defined VIRTUAL_ENV_PROMPT set "_venv=$C%VIRTUAL_ENV_PROMPT%$F$S"

if defined SSH_CLIENT (
  set "_uh=%USERNAME%@%COMPUTERNAME%$S$M:$S"
) else (
  if defined SSH_TTY (
    set "_uh=%USERNAME%@%COMPUTERNAME%$S$M:$S"
  ) else (
    set "_uh="
  )
)

git branch 2>NUL | call findstr /b "* " > %__git_branch_temp%

rem echo errorlevel is %ERRORLEVEL%
if errorlevel 1 (set "__git_branch=")
if errorlevel 1 goto :setprompt

set /p __git_branch=<%__git_branch_temp%
set "__git_branch=%__git_branch: =%"
set "__git_branch=%__git_branch:**=%"
set "__git_branch=(%__git_branch%)"

:setprompt
if exist %__git_branch_temp% (
  del %__git_branch_temp%
)
EndLocal & set "PROMPT=%_venv%%_uh%$E[1;34m%_cd%$E[00m$S$+%__git_branch% $$$s"
