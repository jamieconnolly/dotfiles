if command -v pyenv >/dev/null 2>&1; then
  function pyenv_prompt() {
    local python_version python_virtualenv
    python_version="$(pyenv version-name)"
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

if command -v python >/dev/null 2>&1; then
  function python_prompt() {
    local python_prompt="$(pyenv_prompt || true)"

    if [[ -n "$python_prompt" ]]; then
      echo "$ZSH_THEME_PYTHON_PROMPT_PREFIX$python_prompt$ZSH_THEME_PYTHON_PROMPT_SUFFIX"
      return 0
    else
      return 1
    fi
  }
else
  function python_prompt() { return 1 }
fi
