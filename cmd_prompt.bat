@echo off
SetLocal EnableDelayedExpansion

set __git_branch_temp=".temp_branch_%RANDOM%"

set "_cd=!CD:%USERPROFILE%=~!"
set "_cd=%_cd:\=/%"

rem Make path bold and blue
if defined COLORTERM (
  set "_cd=$E[1;34m%_cd%$E[00m"
) else (
  echo COLORTERM is not defined.
)
set "_cd=%_cd%$S"

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
EndLocal & set "PROMPT=%_venv%%_uh%%_cd%$+%__git_branch%$S$$$S"
