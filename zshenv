# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"
fi

# Editor
export EDITOR="code"
export VISUAL=$EDITOR

# GPG
export GPG_TTY="$(tty)"

# Handles
export PROJECT_HOME="${HOME}/Projects"

# Locale
export LANG="en_GB.UTF-8"
export LC_CTYPE=$LANG

# Pipenv
export PIPENV_DONT_LOAD_ENV=true
export PIPENV_NOSPIN=true
export PIPENV_VENV_IN_PROJECT=true

# Python
export PYTHONSTARTUP="${HOME}/.pythonrc"

# ZSH
export ZSH_HOME="${HOME}/.zsh"
