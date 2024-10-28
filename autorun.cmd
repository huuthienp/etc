@echo off
call %USERPROFILE%\shcfg\prompt_dir.cmd
doskey cd=cd $* $T call %USERPROFILE%\shcfg\prompt_dir.cmd
