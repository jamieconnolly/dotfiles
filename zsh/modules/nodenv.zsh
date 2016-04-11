if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init - --no-rehash)"

  function nodenv_prompt() {
    local node_version="$(nodenv version-name)"

    if [[ -n "$node_version" ]] && [[ $node_version != "system" ]]; then
      echo "$ZSH_THEME_NODENV_PROMPT_PREFIX$node_version$ZSH_THEME_NODENV_PROMPT_SUFFIX"
      return 0
    else
      return 1
    fi
  }
else
  function nodenv_prompt() { return 1 }
fi
