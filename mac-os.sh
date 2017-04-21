#!/bin/bash

echo "Installing breeeewwwww..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing HomeBrew Cask, please wait..."
brew install caskroom/cask/brew-cask

echo "Installing ssh-copy-id command, please wait..."
brew install ssh-copy-id

echo "Installing Wget command, please wait..."
brew install wget

echo "Installing Google Chrome, please wait..."
brew cask install google-chrome
brew cask install 1password

echo "Installing VLC, please wait..."
brew cask install vlc

echo "Installing Caffeine, please wait..."
brew cask install caffeine

echo "Installing Atom, please wait..."
brew cask install atom

echo "Installing Virtualbox, please wait..."
brew cask install virtualbox

echo "Installing Oh-My-ZSH, please wait..."
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh