export ZDOTDIR="${HOME}/.zsh"

source "${ZDOTDIR}/env.zsh"
source "${ZDOTDIR}/styling.zsh"
source "${ZDOTDIR}/utils.zsh"
source "${ZDOTDIR}/completions.zsh"
source "${ZDOTDIR}/plugins.zsh"
source "${ZDOTDIR}/aliases.zsh"

[ -n "${SSH_SIGNING_KEY}" ] && {
  git config --global gpg.format ssh
  git config --global user.signingkey "${SSH_SIGNING_KEY}"
  git config commit.gpgsign true --global
}
