@echo off

for %%i in ("%cd%") do set "cwd=%%~nxi"

if defined SSH_CLIENT (
  set "_uh=%USERNAME%@%COMPUTERNAME%"
) else (
  if defined SSH_TTY (
    set "_uh=%USERNAME%@%COMPUTERNAME%"
  ) else (
    set "_uh="
  )
)
rem echo %_uh%

set "ps1=$m$_%_uh%($n:\) $e[1;34m%cwd% $e[00m$+$$$s"
prompt %ps1%
