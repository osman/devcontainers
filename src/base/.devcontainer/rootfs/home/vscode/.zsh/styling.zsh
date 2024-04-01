# CASE_SENSITIVE=true
HYPHEN_SENSITIVE=true

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

ENABLE_AUTOCORRECTION=true

# Auto-Suggestion Settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert ${OLD_SELF_INSERT}
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent agent-forwarding yes

zstyle ':completion:*' use-cache true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}         # set list-colors to enable filename colorizing
zstyle ':completion:*:descriptions' format '[%d]'             # set descriptions format to enable group support
zstyle ':completion:*:git-checkout:*' sort false              # disable sort when completing `git checkout`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' fzf-bindings '?:toggle-preview'
zstyle ':fzf-tab:*' fzf-min-height '20'
zstyle ':fzf-tab:*' query-string prefix input first
zstyle ':fzf-tab:*' switch-group ',' '.'                      # switch group using `,` and `.`
zstyle ':fzf-tab:git*' continuous-trigger ''
zstyle ':fzf-tab:complete:git*:*' fzf-flags --preview-window=hidden
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:*' fzf-flags -0 -1 --preview-window 'right,50%'
zstyle ':fzf-tab:complete:*' fzf-preview '{{ [ -f ${realpath} ] && bat -nf ${realpath} } || { [ -d ${realpath} ] && { tree -L 2 -C ${realpath} }} || echo ${realpath} } 2> /dev/null | head -200'