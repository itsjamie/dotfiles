# Setting up a new computer guide

## Setup dotfiles..
```
mkdir ~/Repositories && cd ~/Repositories
git clone https://github.com/jamie-stackhouse/dotfiles
ln -s dotfiles/.vimrc ~/.vimrc
ln -s dotfiles/.bash_profile ~/.bash_profile
ln -s dotfiles/.bashrc ~/.bashrc
```

## Homebrew list
```
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```
* bash-completion
* git
* git-flow
* node
* vim
* virtualhost.sh
* z

## Install Apache
```
brew tap djl/homebrew-apache2
brew install djl/apache2/apache22
```
