# Load pyenv
if which pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi

# Load pyenv-virtualenv
if which pyenv-virtualenv &>/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
