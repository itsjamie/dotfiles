brew update
brew upgrade

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

# generic colouriser  http://kassiopeia.juls.savba.sk/~garabik/software/grc/
brew install grc

brew install wget --enable-iri
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install ack

# Other useful binaries
brew install macvim --with-override-system-vim
brew install ffmpeg --with-libvpx
brew install hg
brew install git
brew install svn
brew install go
brew install mongo
brew install ngrep
brew install node
brew install ossp-uuid
brew install postgresql
brew install redis
brew install virtualhost.sh
brew install wrk
brew install z

brew cleanup
