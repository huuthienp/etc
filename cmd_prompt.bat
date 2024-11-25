@echo off

set _temp=temp.txt

for %%i in ("%cd%") do set "cwd=%%~nxi"

if defined SSH_CLIENT (
  set "_uh=%USERNAME%@%COMPUTERNAME% "
) else (
  if defined SSH_TTY (
    set "_uh=%USERNAME%@%COMPUTERNAME% "
  ) else (
    set "_uh="
  )
)

git branch 2>NUL | call findstr /b "* " > %_temp% || set "__git_branch=" && goto :setprompt
set /p __git_branch=<%_temp%
set "__git_branch=%__git_branch: =%"
set "__git_branch=%__git_branch:**=%"
set "__git_branch=(%__git_branch%)"

:setprompt
if exist %_temp% del %_temp%
set "ps1=$m$_%_uh%$n:\ $e[1;34m%cwd% $+$e[00m%__git_branch% $$$s"
prompt %ps1%
