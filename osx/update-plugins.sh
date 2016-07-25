#!/usr/bin/env bash
echo "UPDATING PLUGINS"
exit;

source "${HOME}/.environmental-variables"

echo "updating tmux plugins"
source "${TPM_PLUGINS}/scripts/update/clean_plugins.sh"
source "${TPM_PLUGINS}/scripts/update/install_plugins.sh"
source "${TPM_PLUGINS}/scripts/update/update_plugins.sh"

echo "Updating vim plugins"
vim +PluginInstall +qall
