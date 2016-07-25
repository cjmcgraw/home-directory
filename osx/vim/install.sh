#! /usr/bin/env bash
set -eu

source "./../.environmental-variables"

VIM_CONFIG_LOCATIONS=(
    "$VIM_CONFIG_FILES"
    "$VIM_CONFIG_FILES/defaults"
    "$VUNDLE_CONFIG_FILES"
    "$VUNDLERC_BASE_FILE"
    "$VUNDLERC_FILE"
    "$VUNDLE_INSTALL"
)

for FILE in "${VIM_CONFIG_LOCATIONS[@]}"; do
    echo "recreating file at $FILE"
    rm -rf "$FILE"
    mkdir -p "$(dirname $FILE)"
done

echo "cloning vundle git repository"
git clone "https://github.com/VundleVim/Vundle.vim.git" "$VUNDLE_INSTALL"


echo "moving default vundlerc file to $VUNDLERC_FILE"
cp -rf "./vundlerc" "$VUNDLERC_FILE"

echo "moving default vundlerc.base file to $VUNDLERC_BASE_FILE"
cp -rf "./vundlerc.base" "$VUNDLERC_BASE_FILE"

echo "moving default .vimrc file to $VIMRC"
cp -rf "./.vimrc" "$VIMRC"
cp -rf "./.vimrc" "$VIM_CONFIG_FILES/defaults/"

echo "Beginning vim plugin install"
vim +PluginInstall +qall
