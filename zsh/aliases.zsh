alias cl="clear"
alias count="wc -l"
alias e="$EDITOR"
alias l='ls -lahL'
alias reload!=". ~/.zshrc"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
