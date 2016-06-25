if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - --no-rehash)"

  function rbenv_prompt() {
    local ruby_version="$(rbenv version-name)"

    if [[ -n "$ruby_version" ]] && [[ $ruby_version != "system" ]]; then
      echo "$ZSH_THEME_RBENV_PROMPT_PREFIX$ruby_version$ZSH_THEME_RBENV_PROMPT_SUFFIX"
      return 0
    else
      return 1
    fi
  }
else
  function rbenv_prompt() { return 1 }
fi
