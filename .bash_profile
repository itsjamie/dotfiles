# Setup PATH for Homebrew and NodeJS.
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

source /Users/jstackhouse/.bashrc

. `brew --prefix`/etc/profile.d/z.sh

alias g="git"
alias gf="git flow"
alias gs="git status"
alias phpmamp="/Applications/MAMP/bin/php/php5.4.10/bin/php"

