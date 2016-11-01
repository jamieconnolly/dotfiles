if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init --no-rehash - zsh)"
fi

function nodenv_prompt() {
  if [ -n "$(nodenv version-file $PWD 2>/dev/null)" ]; then
    echo "${ZSH_THEME_NODENV_PROMPT_PREFIX}$(nodenv version-name)${ZSH_THEME_NODENV_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
