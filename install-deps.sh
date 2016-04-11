# Wipe all app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Symlink configuration files
for file in .{ackrc,aliases,bash_profile,bash_prompt,bashrc,exports,functions,gitconfig,gitignore,inputrc,npmrc,vimrc}; do
  [ -r "$file" ] && ln -s "${PWD}/$file" "${HOME}/$file"
done
unset file

# Install plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[ -s ".vimrc" ] && ln -s "${PWD}/.vimrc" "${HOME}/.config/nvim/init.vim"

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
source brew.sh
source brew-cask.sh
# for the c alias (syntax highlighted cat)
sudo easy_install Pygments

# change to bash 4 (installed by homebrew)
BASHPATH=/usr/local/bin/bash
sudo sh -c "echo $BASHPATH >> /etc/shells"
chsh -s $BASHPATH # will set for current user only.
echo $BASH_VERSION # should be 4.x not the old 3.2.X

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
. ~/.nvm/nvm.sh

# Install Golang tools
/usr/local/bin/go get -v golang.org/x/tools/cmd/...
# Install neovim plugins
pip3 install neovim
/usr/local/bin/nvim +PlugInstall +qall
/usr/local/bin/nvim +UpdateRemotePlugins +qall
# Install vim-go binaries
/usr/local/bin/nvim +GoInstallBinaries +qall

nvm install v5.9.1
npm install -g gulp

sudo ${PWD}/osx.sh

