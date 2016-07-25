#! /usr/bin/env bash
set -eu

source "./../.environmental-variables"

TMUX_CONFIG_FILES=(
    "${TMUX_CONFIG_FILES}"
    "${TPM_PLUGINS}"
    "${TPM_INSTALL}"
    "${TMUX_CONFIG_FILES}/defaults"
)

for FILE in "${TMUX_CONFIG_FILES[@]}"; do
    echo "recreating tmux configuration files at $FILE"
    rm -rf "${FILE}"
    mkdir -p "${FILE}"
done

echo "cloning tmux plugin manager from git"
git clone "https://github.com/tmux-plugins/tpm" "${HOME}/.tmux/plugins/tpm"

echo "creating ${HOME}/.tmux.conf file"
cp -rf "./.tmux.conf" "${TMUXRC}"
cp -rf "./.tmux.conf" "${TMUX_CONFIG_FILES}/defaults/"

echo "installing/updating plugins as needed"
exec "${TPM_INSTALL}/scripts/clean_plugins.sh"
exec "${TPM_INSTALL}/scripts/install_plugins.sh"
exec "${TPM_INSTALL}/scripts/update_plugins.sh"
