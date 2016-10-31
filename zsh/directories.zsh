setopt auto_cd
setopt auto_pushd
setopt cdable_vars
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
alias l="ls -lah"
alias la="ls -lAh"
alias ll="ls -lh"

alias po="popd"
alias pu="pushd"
