#! /usr/bin/env bash
set -u
source "./.environmental-variables"

echo "getting osx package manager:"
if [[ "$(type brew &> /dev/null)" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
fi
brew update

echo "installing gnu coreutils:"
brew install wget
brew install curl
brew install coreutils findutils gnu-tar gnused gawk gnutls gnu-indent gnu-getopt

echo "install useful tools to have:"
brew install git
#brew install python
#brew install pip

echo "installing zsh:"
brew install zsh zsh-completions

echo "installing tmux:"
brew install tmux

echo "Installing vim: "
brew install vim --override-system-vi

echo "configuring zsh:"
pushd "zsh/"
exec "./install.sh"
popd

echo "configuring tmux:"
pushd "tmux/"
exec "./install.sh"
popd

echo "configuring vim:"
pushd "vim/"
exec "/.install.sh"
popd

echo "copying over hidden home files/directories"
cp -rf "/.*" "${HOME}"
