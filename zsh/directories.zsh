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

# List directory contents
alias l="ls -lah"
alias la="ls -lAh"
alias ll="ls -lh"

# Push and pop directories on directory stack
alias po="popd"
alias pu="pushd"
