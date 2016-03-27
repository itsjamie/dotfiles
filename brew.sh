brew update && brew upgrade
# Install GNU core utilities (OSX ones are outdated)
brew install coreutils
# Install GNU `sed` overwriting OSX sed
brew install gnu-sed --default-names
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
brew install bash
# regular bash-completion package is held back to an older release, so we get latest from versions.
#   github.com/Homebrew/homebrew/blob/master/Library/Formula/bash-completion.rb#L3-L4
brew tap homebrew/versions
brew install homebrew/versions/bash-completion2
brew install grc
brew install wget --enable-iri

# Other useful packages
brew install ack
brew install ffmpeg --with-libvpx
brew install hg
brew install git
brew install svn
brew install go
brew install mongo
brew install python3
brew install neovim
brew install python
brew install ngrep
brew install nvm
brew install ossp-uuid
brew install postgresql
brew install redis
brew install z
brew cleanup
