#core
unalias rm
unalias cp
unalias mv

alias ls='eza --color=auto --icons'
alias l='ls -l'
alias ll='ls -l'
alias lt='ls -l --sort time'
alias la='ls -la'
alias lr='ls -R --sort time'
alias ldot='ls -ld .*'
alias lS='\ls -1FSs'
alias lart='ls -1ar --sort modified'
alias lrt='ls -1r --sort modified'
alias lsr='ls -laR' # Recursive list of files and directories
alias lsn='ls -1'   # A column contains name of files and directories

d() {
  nl -v0 <(dirs -v | awk '{print $2}' | tac)
}
alias ..='cd ..'
alias 0='cd +0'
alias 1='cd +1'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

alias -g B='| bat'
alias -g BB='2>&1 | bat'

# git
unalias gup
unalias gp
unalias gc

alias gc='czg-helper'
alias gcbv='g commit --allow-empty -m "fix: bump version"'
alias gbrd='g brd'
alias gsq='g sq'
alias gdh='gd HEAD'
alias grhh~='grhh_tilde'
alias grbi~='grbi_tilde'
alias gd~='gd_tilde'

gp() {
  if [ -z "${1:-}" ]; then
    git push
  else
    command gp "${@}"
  fi
}
grhh_tilde() {
  grhh "HEAD~${1:-}"
}
grbi_tilde() {
  grbi "HEAD~${1:-}"
}
gd_tilde() {
  gd "HEAD~${1:-}"
}

# misc
alias curlj='curl -H "Content-Type: application/json"'
