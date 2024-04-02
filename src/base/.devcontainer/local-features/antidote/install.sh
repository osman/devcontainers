#! /bin/zsh
set -e

su - vscode <<'EOF'
source "$(brew --prefix)/share/antidote/antidote.zsh"
antidote bundle <"${ZDOTDIR}/plugins.txt" >"${ZDOTDIR}/plugins.zsh"
rm "${ZDOTDIR}/plugins.txt"
EOF