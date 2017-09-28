setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

alias -- -='cd -'

alias cp="cp -iRv"
alias md="mkdir"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias rd="rmdir"
alias rm="rm -iv"

alias df="df -kH"
alias du="du -ksh"

alias fd="find . -type d -name"
alias ff="find . -type f -name"

alias l="ls -Flh"
alias ls="ls -F"

alias po="popd"
alias pu="pushd"
