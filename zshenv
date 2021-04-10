# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"
fi

# Code
if [[ "$OSTYPE" == darwin* ]]; then
  export CODE_HOME="${HOME}/Code"
fi

# Editor
export EDITOR="code"

# GPG
export GPG_TTY="$(tty)"

# Locale
export LANG="en_GB.UTF-8"
export LC_CTYPE=$LANG

# Python
export PYTHONSTARTUP="${HOME}/.pythonrc"

# ZSH
export ZSH_HOME="${HOME}/.zsh"
