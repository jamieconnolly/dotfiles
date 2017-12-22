alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias cls="clear"
alias count="wc -l"
alias flush="dscacheutil -flushcache"
alias grep="grep --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias path="echo \${PATH} | tr -s ':' '\n'"
alias ping="ping -c 5"
alias psa="ps aux"
alias psg="ps aux | grep "
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '==> Public key copied to pasteboard…'"
alias reload!=". ~/.zshrc"
alias secret="openssl rand -base64 48 | sed -e 's/[\/&]/\\&/g'"
alias sha256="shasum -a 256"

alias g="git"
alias ga="git a"
alias gc="git c"
alias gd="git d"
alias gp="git p"

alias h="handles"
alias hb="handles bootstrap"
alias hs="handles server"
alias ht="handles test"
alias hu="handles update"
