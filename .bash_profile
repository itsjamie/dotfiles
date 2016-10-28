[ -r ~/.exports ] && source ~/.exports

# Case insensitive globbing
shopt -s nocaseglob

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# initialize z
. `brew --prefix`/etc/profile.d/z.sh
# setup colour on log files and other various basic tools
[ -s `brew --prefix`/etc/grc.bashrc ] && source `brew --prefix`/etc/grc.bashrc

# bash completion
if [ -f `brew --prefix`/share/bash-completion/bash_completion ]; then
  . `brew --prefix`/share/bash-completion/bash_completion
fi

if [ -f `brew --prefix`/Cellar/rbenv/1.0.0/completions/rbenv.bash ]; then
	. `brew --prefix`/Cellar/rbenv/1.0.0/completions/rbenv.bash
fi

# Add completion to gulp tasks
eval "$(gulp --completion=bash)"
command rbenv rehash 2>/dev/null

# Load ~/.extra ~/.bash_prompt ~/.exports ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don't want to commit.
for file in ~/.{extra,bash_prompt,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

[ -s $HOME/.iterm2_shell_integration.bash ] && source $HOME/.iterm2_shell_integration.bash
