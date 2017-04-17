# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"
fi

# Editor
export EDITOR="atom"
export PAGER="less"
export VISUAL="nano"

# GitHub
GITHUB_USER="$(git config github.user)"
export GITHUB_USER

# GPG encryption prompt
GPG_TTY="$(tty)"
export GPG_TTY

# Handles
export PROJECT_HOME="${HOME}/Projects"

# History
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# Locale
export LANG="en_GB.UTF-8"
export LC_ALL="$LANG"
export LC_CTYPE="$LANG"

# Python
export PYTHONSTARTUP="${HOME}/.pythonrc"

# ZSH
export ZSH="${HOME}/.zsh"
