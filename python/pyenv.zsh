# Load pyenv
if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
fi

# Load pyenv-virtualenv
if (( $+commands[pyenv-virtualenv-init] )); then
  eval "$(pyenv virtualenv-init -)"
fi
