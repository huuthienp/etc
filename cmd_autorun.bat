@echo off

set EDITOR=%USERPROFILE%\scoop\shims\lvim.cmd

call %USERPROFILE%\etc\cmd_prompt.bat
call %USERPROFILE%\etc\cmd_aliases.bat

doskey cd=cd $* $T call %USERPROFILE%\etc\prompt_dir.cmd
doskey pushd=pushd $* $T call %USERPROFILE%\etc\prompt_dir.cmd
doskey popd=popd $* $T call %USERPROFILE%\etc\prompt_dir.cmd

doskey ll=dir $*
doskey ls=dir /d $*
doskey less=sh -c 'less $*'
