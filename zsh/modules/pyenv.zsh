if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - --no-rehash)"

  function pyenv_prompt() {
    local python_version python_virtualenv
    python_version="$(pyenv virtualenv-version || pyenv version-name)"
    python_virtualenv="$(pyenv virtualenv-name)"

    if [[ -n "$python_virtualenv" ]]; then
      echo "$ZSH_THEME_PYENV_PROMPT_PREFIX$python_version ($python_virtualenv)$ZSH_THEME_PYENV_PROMPT_SUFFIX"
      return 0
    elif [[ -n "$python_version" ]] && [[ $python_version != "system" ]]; then
      echo "$ZSH_THEME_PYENV_PROMPT_PREFIX$python_version$ZSH_THEME_PYENV_PROMPT_SUFFIX"
      return 0
    else
      return 1
    fi
  }
else
  function pyenv_prompt() { return 1 }
fi
