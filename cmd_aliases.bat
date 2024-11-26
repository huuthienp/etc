@echo off

doskey cd=cd $* $T call %USERPROFILE%\etc\cmd_prompt.bat
doskey pushd=pushd $* $T call %USERPROFILE%\etc\cmd_prompt.bat
doskey popd=popd $* $T call %USERPROFILE%\etc\cmd_prompt.bat

doskey ll=dir $*
doskey ls=dir /d $*
doskey less=sh -c 'less $*'

if exist %EDITOR% for %%G in ("%EDITOR%") do doskey e=%%~nxG $*

doskey gf=git fetch
doskey gs=git status -sb
doskey gl=git log --oneline
doskey ga=git add $*
doskey gaa=git add .
doskey gc=git commit -m $*
doskey gca=git commit -a -m $*
doskey gd=git diff --cached --color-words $T echo. $T git diff --color-words
doskey gds=git diff --cached --stat $T echo. $T git diff --stat
