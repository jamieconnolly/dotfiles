alias cls="clear"
alias count="wc -l"
alias flush="dscacheutil -flushcache"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias ping="ping -c 5"
alias psa="ps aux"
alias psg="ps aux | grep "
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '==> Public key copied to pasteboard…'"
alias reload!=". ~/.zshrc"
alias sha256="shasum -a 256"

alias gc="git c"
alias gd="git d"
alias gp="git p"

alias gpg="gpg2"

alias h="handles"
alias hb="handles bootstrap"
alias ht="handles test"
