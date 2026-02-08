# see https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/

# core
brew install coreutils

# key commands
brew install binutils
brew install diffutils
brew install findutils --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-default-names
brew install gzip
brew install watch
brew install wget

brew install git
brew install less
brew install openssh
brew install unzip
# brew install macvim --override-system-vim --custom-system-icons
brew install fd
brew install font-hack-nerd-font
brew install neovim

# Enable apple's press and hold feature
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

