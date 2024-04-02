#! /bin/zsh
set -e

su - vscode <<EOF
set -e

PATH=${PATH}
source "$(brew --prefix)/share/antidote/antidote.zsh"
antidote bundle <"${ZDOTDIR}/plugins.txt" >"${ZDOTDIR}/plugins.zsh"
rm "${ZDOTDIR}/plugins.txt"
EOF