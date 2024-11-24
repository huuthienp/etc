@echo off

call %USERPROFILE%\etc\prompt_dir.cmd

doskey cd=cd $* $T call %USERPROFILE%\etc\prompt_dir.cmd
doskey pushd=pushd $* $T call %USERPROFILE%\etc\prompt_dir.cmd
doskey popd=popd $* $T call %USERPROFILE%\etc\prompt_dir.cmd

doskey ll=dir $*
doskey ls=dir /d $*
doskey less=sh -c 'less $*'

set EDITOR=%USERPROFILE%\scoop\shims\lvim.cmd
