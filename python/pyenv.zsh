# Load pyenv
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Load pyenv-virtualenv
if command -v pyenv-virtualenv >/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi
