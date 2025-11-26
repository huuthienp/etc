@echo off
@REM https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/doskey

doskey cd=cd $* $T call %USERPROFILE%\etc\cmd_prompt.bat
doskey pushd=pushd $* $T call %USERPROFILE%\etc\cmd_prompt.bat
doskey popd=popd $* $T call %USERPROFILE%\etc\cmd_prompt.bat

doskey ll=dir $*
doskey ls=dir /w $*
doskey la=dir /a:a $*
doskey ld=dir /a:d $*
doskey laa=where /f /t /r $* * 2^>NUL $T if ERRORLEVEL 2 echo Use '.' for current directory
doskey ldd=dir /a:d /b /s $*

doskey lll=dir $* $B less
doskey $=bash -c "$*"

if DEFINED EDITOR doskey e=%EDITOR% $*

doskey scb=set /p "_dummy=$*" ^<NUL ^| clip
doskey scbf=clip ^< $1
doskey scbl=for /f "delims=" %%G in ($1) do @set /p "_dummy=%%G" ^<NUL ^| clip
doskey scbv=for /f "delims=" %%G in ('pwsh -c "gcb"') do @set "$*=%%G"
doskey gcb=pwsh -c "gcb" $*

@REM Git Operations
where lazygit >nul && doskey lzg=lazygit $*
doskey gf=git fetch
doskey gs=git status -sb
doskey gl=git log --oneline
doskey ga=git add $*
doskey gaa=git add .
doskey gc=git commit -m $*
doskey gca=git commit -a -m $*
doskey gd=git diff --cached --color-words $T echo. $T git diff --color-words
doskey gds=git diff --cached --stat $T echo. $T git diff --stat

@REM More Utilities
where rclone >nul && doskey ncdu=rclone ncdu $*