if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - --no-rehash)"

  function pyenv_prompt() {
    if [ -n "$(pyenv version-file $PWD)" ]; then
      echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}$(pyenv version-name)${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
      return 0
    else
      return 1
    fi
  }
else
  function pyenv_prompt() { return 1 }
fi
