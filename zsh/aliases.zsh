alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias cls="clear"
alias count="wc -l"
alias grep="grep --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
alias path="echo \${PATH} | tr -s ':' '\n'"
alias ping="ping -c 5"
alias psa="ps aux"
alias psg="ps aux | grep "
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '==> Public key copied to pasteboard…'"
alias reload!=". ~/.zshrc"
alias secret="openssl rand -base64 48 | sed -e 's/[\/&]/\\&/g'"
alias sha256="shasum -a 256"

alias npm="op run -- npm"
alias yarn="op run -- yarn"

alias g="git"
alias ga="git a"
alias gc="git c"
alias gd="git d"
alias gp="git p"

if [ "$(uname -s)" = "Darwin" ]; then
  alias flushdns!="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper"
  alias h="handles"
fi
