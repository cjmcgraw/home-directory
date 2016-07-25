#! /usr/bin/env bash
set -eu
echo "SNAPSHOT"
exit;

UNIX_TIMESTAMP="$(date +%s | rev | cut -c 4- | rev)"
DEFAULTS_LOCATION="${HOME}/.my-config/defaults/${UNIX_TIMESTAMP:-4}"

ITEMS_TO_COPY=(
    "${HOME}/.bash_profile" 
    "${HOME}/.bashrc"
    "${HOME}/.environmental-variables"
    "${HOME}/.aliases"
    "${HOME}/.functions"
    "${HOME}/.zsh"
    "${HOME}/.zshrc"
    "${HOME}/.vim"
    "${HOME}/.vimrc"
    "${HOME}/.tmux"
    "${HOME}/.tmux.conf"
)

if [[ -e "${DEFAULTS_LOCATION}" ]]; then
    echo "Found snapshot directory at ${DEFAULTS_LOCATION}"
else
    echo "Creating snapshot directory at ${DEFAULTS_LOCATION}";
    mkdir -p "${DEFAULTS_LOCATION}"
fi

for FILE in "${ITEMS_TO_COPY[@]}"; do
    if [[ -e "${FILE}" ]]; then
        echo "Copying ${FILE} into ${DEFAULTS_LOCATION}"
        sudo cp -rf "${FILE}" "${DEFAULTS_LOCATION}/"
    else
        echo "No ${FILE} file found"
    fi
done
