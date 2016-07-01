if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash)"

  function rbenv_prompt() {
    if [ -n "$(rbenv version-file $PWD)" ]; then
      echo "${ZSH_THEME_RBENV_PROMPT_PREFIX}$(rbenv version-name)${ZSH_THEME_RBENV_PROMPT_SUFFIX}"
      return 0
    else
      return 1
    fi
  }
else
  function rbenv_prompt() { return 1 }
fi
