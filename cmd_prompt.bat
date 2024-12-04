@echo off
SetLocal EnableDelayedExpansion

set __git_branch_temp=".temp_branch_%RANDOM%"

for %%G in ("%CD%") do set "_cd=%%~nxG"

if defined SSH_CLIENT (
  set "_uh=%USERNAME%@%COMPUTERNAME% "
) else (
  if defined SSH_TTY (
    set "_uh=%USERNAME%@%COMPUTERNAME% "
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
EndLocal & set "PROMPT=$m$_%_uh%$n:\ $e[1;34m%_cd%$e[00m $+%__git_branch% $$$s"
