if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
. `brew --prefix`/etc/profile.d/z.sh
alias g="git"
alias gf="git flow"
alias gs="git status"
alias ls="ls -G"
alias phpmamp="/Applications/MAMP/bin/php/php5.4.10/bin/php"

