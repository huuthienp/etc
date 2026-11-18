@echo off
SetLocal EnableDelayedExpansion

for /f "delims=" %%G in ("%CD%") do set "__cd_name=%%~nG"
title CMD^: %__cd_name%

@REM Adjust path in prompt
set "_cd=!CD:%USERPROFILE%=%%~%%!"

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

git branch 2>&0 >nul

if 0 equ %errorlevel% (
  for /f "tokens=* usebackq" %%G in (`git branch --show-current`) do (
    set "_git_branch=%%G"
  )  &  @REM for-loop with command starts another cmd instance
) else (
  set _git_branch=
)

if defined _git_branch (
  set "_git_branch=(%_git_branch%) "
)  &  @REM _git_branch is set

EndLocal & set "prompt=%_venv%%_uh%%_cd%$+%_git_branch%$G$S"
