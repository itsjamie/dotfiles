# Load ~/.extra ~/.bash_prompt ~/.exports ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don't want to commit.
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# initialize z
. `brew --prefix`/etc/profile.d/z.sh

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Case insensitive globbing
shopt -s nocaseglob

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

export NPM_HOME=/usr/local/share/npm
export GOPATH=~/go

PATH=/usr/bin:/bin:/usr/sbin:/sbin
# Updated GNU Core Utilities
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Add NPM packages to path
PATH=$PATH:$NPM_HOME/bin

# Add Go packages to path
PATH=$PATH:$GOPATH/bin

# Homebrew executables are important
export PATH=/usr/local/bin:$PATH