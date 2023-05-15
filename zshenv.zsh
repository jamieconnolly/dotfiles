# Browser
if [ "$(uname -s)" = "Darwin" ]; then
  export BROWSER="open"
fi

# Developer
if [ "$(uname -s)" = "Darwin" ]; then
  export DEVELOPER_HOME="${HOME}/Developer"
elif [ -n "$CODESPACES" ] || [ -n "$REMOTE_CONTAINERS" ]; then
  export DEVELOPER_HOME="/workspaces"
fi

# Editor
export EDITOR="code"

# Locale
export LANG="en_GB.UTF-8"
export LC_CTYPE=$LANG

# Secrets (@TODO - move to 1Password Shell Plugins)
if [ "$(uname -s)" = "Darwin" ]; then
  export GPR_TOKEN="op://Personal/GitHub/credentials/gpr_token"
elif [ -n "$CODESPACES" ] || [ -n "$REMOTE_CONTAINERS" ]; then
  export GPR_TOKEN=$GITHUB_TOKEN
fi

# SSH
if [ "$(uname -s)" = "Darwin" ]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

# ZSH
export ZSH_HOME="${HOME}/.zsh"
