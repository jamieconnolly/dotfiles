if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash)"
fi

function rbenv_prompt() {
  if [ -n "$(rbenv version-file $PWD 2>/dev/null)" ]; then
    echo "${ZSH_THEME_RBENV_PROMPT_PREFIX}$(rbenv version-name)${ZSH_THEME_RBENV_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
