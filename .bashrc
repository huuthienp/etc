alias ls='ls --color=auto'
alias ll='ls -l'
alias path='IFS=":" read -ra array <<< "$PATH"; for i in "${array[@]}"; do echo $i; done'

export UOW_HOME="$HOME/uowMaster/subject"
export HADOOP_HOME="$HOME/hadoop"
export HIVE_HOME="$HOME/hive"
export GH_PLANEATARY="git@github.com:huuthienp/planeatary.git"
export PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin"
