# Browser
if [ "$(uname -s)" = "Darwin" ]; then
  export BROWSER="open"
fi

# Code
if [ "$(uname -s)" = "Darwin" ]; then
  export CODE_HOME="${HOME}/Code"
elif [ -n "$CODESPACES" ] || [ -n "$REMOTE_CONTAINERS" ]; then
  export CODE_HOME="/workspaces"
fi

# Editor
export EDITOR="code"

# GPG
export GPG_TTY="$(tty)"

# Locale
export LANG="en_GB.UTF-8"
export LC_CTYPE=$LANG

# Secrets
if [ "$(uname -s)" = "Darwin" ]; then
  export GPR_TOKEN="op://Personal/GitHub/credentials/gpr_token"
fi

# SSH
if [ "$(uname -s)" = "Darwin" ]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

# ZSH
export ZSH_HOME="${HOME}/.zsh"
