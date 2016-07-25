#! /usr/bin/env bash
set -eu
echo "update"
exit;

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
