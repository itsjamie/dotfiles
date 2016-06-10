#!/bin/bash

for file in .{ackrc,aliases,bash_profile,bash_linux,bash_prompt,bashrc,exports,functions,gitconfig,gitignore,inputrc,npmrc,vimrc}; do
	[ -r "$file" ] && ln -s "${PWD}/$file" "${HOME}/$file"
done
unset file

# Setup file permissions on /usr/local folder
sudo chown -R $USER /usr/local
sudo chown -R root /usr/local/sbin

sudo apt-get install bash-completion

# Install Neovim
sudo apt-get install software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
pip3 install neovim

curl -fLo /usr/local/bin/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
chmod +x /usr/local/bin/z.sh
source /usr/local/bin/z.sh

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
[ -s ".vimrc" ] && ln -s "${PWD}/.vimrc" "${HOME}/.config/nvim/init.vim"

# Install Node Version Manager
git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abrev=0 --tags`
source ~/.nvm/nvm.sh

# Install Golang Tools
go get -u -v golang.org/x/tools/cmd/...

# Setup Neovim
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall
nvim +GoInstallBinaries +qall
