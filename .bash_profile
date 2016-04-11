# Case insensitive globbing
shopt -s nocaseglob

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

export EDITOR=/usr/local/bin/nvim
export GOPATH=~/go
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

PATH=/usr/bin:/bin:/usr/sbin:/sbin:$PATH
# Add Go binaries to path
PATH=$PATH:$GOPATH/bin
# Add GOROOT binaries to path
PATH=$PATH:/usr/local/opt/go/libexec/bin
# Add Homebrew binaries to path, with priority
PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH

# initialize z
. `brew --prefix`/etc/profile.d/z.sh
# setup colour on log files and other various basic tools
[ -s `brew --prefix`/etc/grc.bashrc ] && source `brew --prefix`/etc/grc.bashrc

# bash completion
if [ -f `brew --prefix`/share/bash-completion/bash_completion ]; then
  . `brew --prefix`/share/bash-completion/bash_completion
fi

# Add completion to gulp tasks
eval "$(gulp --completion=bash)"

# Load ~/.extra ~/.bash_prompt ~/.exports ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don't want to commit.
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file
