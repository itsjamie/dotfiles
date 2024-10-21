# Symlink configuration files
for file in .{aliases,exports,functions,gitconfig,gitignore,inputrc,zshrc}; do
  [ -r "$file" ] && ln -s "${PWD}/$file" "${HOME}/$file"
done
unset file

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source brew.sh
source brew-cask.sh
# for the c alias (syntax highlighted cat)
sudo easy_install Pygments