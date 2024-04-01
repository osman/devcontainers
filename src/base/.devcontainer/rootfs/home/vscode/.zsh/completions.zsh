# fzf auto-completion overrides
_fzf_compgen_path() {
  fd --hidden --follow --exclude '.git' --exclude 'node_modules' --type d . "$1"
}

autoload -Uz compinit

zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]'                             # set descriptions format to enable group support
zstyle ':completion:*:git-checkout:*' sort false                              # disable sort when completing `git checkout`
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}                         # set list-colors to enable filename colorizing
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with eza when completing cd
zstyle ':fzf-tab:*' switch-group ',' '.'                                      # switch group using `,` and `.`

# Load static completions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(antidote path zsh-users/zsh-history-substring-search)/zsh-history-substring-search.zsh"

# keybindings
bindkey '^[[1;2C' autosuggest-execute # ->
bindkey '^[[1;3C' forward-word        # alt + ->
bindkey '^[[1;3D' backward-word       # alt + <-
[ -n "${terminfo}" ] && {
  bindkey "${terminfo[kcuu1]}" history-substring-search-up
  bindkey "${terminfo[kcud1]}" history-substring-search-down
}
