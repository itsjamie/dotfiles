ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

source brew.sh
source brew-cask.sh
source osx.sh

# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

# change to bash 4 (installed by homebrew)
BASHPATH=`brew --prefix`/bin/bash
sudo sh -c "echo $BASHPATH >> /etc/shells"
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

# Install Vundle for Vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle.vim
vim +PluginInstall +qall
