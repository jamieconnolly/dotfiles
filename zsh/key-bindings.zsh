bindkey -e

bindkey '^?' backward-delete-char
bindkey '^w' backward-kill-word
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char
bindkey "^u" history-beginning-search-backward
bindkey "^v" history-beginning-search-forward
