# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"  # firefox
fi

# Editor
export EDITOR="atom"
export VISUAL=$EDITOR

# Go
export GOPATH="${HOME}/.go"

# Handles
export PROJECT_HOME="${HOME}/Projects"

# Locale
export LANG="en_GB.UTF-8"
export LC_CTYPE=$LANG

# Pipenv
export PIPENV_NOSPIN=true
export PIPENV_VENV_IN_PROJECT=true

# Python
export PYTHONSTARTUP="${HOME}/.pythonrc"

# ZSH
export ZSH="${HOME}/.zsh"
