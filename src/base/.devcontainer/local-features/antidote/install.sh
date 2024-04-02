#! /bin/zsh
set -e

su - vscode <<EOF
set -e

PATH=${PATH}
ZDOTDIR=${ZDOTDIR}

git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR}/antidote
source "${ZDOTDIR}/antidote/antidote.zsh"
antidote bundle <"${ZDOTDIR}/plugins.txt" >"${ZDOTDIR}/plugins.zsh"
rm "${ZDOTDIR}/plugins.txt"
EOF