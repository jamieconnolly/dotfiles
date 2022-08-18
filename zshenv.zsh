# Browser
if [ "$(uname -s)" = "Darwin" ]; then
  export BROWSER="open"
fi

# Code
if [ "$(uname -s)" = "Darwin" ]; then
  export CODE_HOME="${HOME}/Code"
elif [ -n "$CODESPACES" ]; then
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
export GITHUB_TOKEN="op://Personal/GitHub/credentials/personal_token"

# ZSH
export ZSH_HOME="${HOME}/.zsh"
