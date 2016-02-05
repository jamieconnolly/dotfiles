# Load pyenv
if (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"
fi

# Load pyenv-virtualenv
if (( $+commands[pyenv-virtualenv] )); then
  eval "$(pyenv virtualenv-init -)"
fi
