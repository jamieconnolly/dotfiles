autoload -U colors && colors

export CLICOLOR=true
export LSCOLORS="exfxcxdxbxegedabagacad"

for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
  eval export PR_$COLOR='%{$fg[${(L)COLOR}]%}'
  eval export PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
export PR_RESET="%{${reset_color:?}%}"
