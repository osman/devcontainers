#! /bin/bash
set -e

source "$(brew --prefix)/share/antidote/antidote.zsh"
antidote bundle <"${ZDOTDIR}/plugins.txt" >"${ZDOTDIR}/plugins.zsh"
rm "${ZDOTDIR}/plugins.txt"