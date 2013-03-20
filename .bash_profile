if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
alias ls="ls -G"
alias g="git"
alias gf="git flow"
alias gs="git status"
function _update_ps1() {
  export PS1="$(~/powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"
