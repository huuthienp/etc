@echo off

doskey cd=cd $* $T call %USERPROFILE%\etc\prompt_dir.cmd
doskey pushd=pushd $* $T call %USERPROFILE%\etc\prompt_dir.cmd
doskey popd=popd $* $T call %USERPROFILE%\etc\prompt_dir.cmd

doskey ll=dir $*
doskey ls=dir /d $*
doskey less=sh -c 'less $*'

:: Start SSH
doskey sssh=ssh-agent -s $T ssh-add %USERPROFILE%\.ssh\git_ed25519

:: Fetch updates without merging
doskey gf=git fetch

:: Show status
doskey gs=git status -sb

:: Display commit history
doskey gl=git log --oneline

:: Stage changes
doskey ga=git add $*
doskey gaa=git add .

:: Commit staged changes
doskey gc=git commit -m $*

:: Commit all changes (staged and unstaged)
doskey gca=git commit -a -m $*

:: Show differences (staged then unstaged)
doskey gd=git diff --cached --color-words $T echo. $T git diff --color-words

:: Show only stats
doskey gds=git diff --cached --stat $T echo. $T git diff --stat
