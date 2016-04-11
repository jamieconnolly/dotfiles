setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

alias history="fc -l 1"
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

HISTFILE=${ZDOTDIR:-~}/.zhistory
HISTSIZE=10000
SAVEHIST=10000
