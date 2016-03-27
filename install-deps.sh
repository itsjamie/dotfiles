# Wipe all app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Symlink configuration files
for file in .{ackrc,aliases,bash_profile,bash_prompt,bashrc,exports,functions,gitconfig,gitignore,inputrc,npmrc}; do
  [ -r "$file" ] && ln -s "${PWD}/$file" "${HOME}/$file"
done
unset file

# Install vim-plug for neovim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
[ -r "init.vim" ] && ln -s "${PWD}/init.vim" "${HOME}/.config/nvim/init.vim"

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
# For the below commands
source ~/.bash_profile

# Install Golang tools
go get golang.org/x/tools/cmd/...
# Install neovim plugins
nvim +PlugInstall +qall
# Install vim-go binaries
nvim +GoInstallBinaries +qall
