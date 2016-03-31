if command -v rbenv >/dev/null 2>&1; then
  function rbenv_prompt() {
    local ruby_gemset ruby_version
    ruby_gemset="$(rbenv gemset active 2&>/dev/null | sed -e ":a" -e '$ s/\n/+/gp;N;b a' | head -n1)"
    ruby_version="$(rbenv version-name)"

    if [[ -n "$ruby_gemset" ]]; then
      echo "$ZSH_THEME_RBENV_PROMPT_PREFIX$ruby_version ($ruby_gemset)$ZSH_THEME_RBENV_PROMPT_SUFFIX"
      return 0
    elif [[ -n "$ruby_version" ]] && [[ $ruby_version != "system" ]]; then
      echo "$ZSH_THEME_RBENV_PROMPT_PREFIX$ruby_version$ZSH_THEME_RBENV_PROMPT_SUFFIX"
      return 0
    else
      return 1
    fi
  }
else
  function rbenv_prompt() { return 1 }
fi

if command -v ruby >/dev/null 2>&1; then
  function ruby_prompt() {
    local ruby_prompt="$(rbenv_prompt || true)"

    if [[ -n "$ruby_prompt" ]]; then
      echo "$ZSH_THEME_RUBY_PROMPT_PREFIX$ruby_prompt$ZSH_THEME_RUBY_PROMPT_SUFFIX"
      return 0
    else
      return 1
    fi
  }
else
  function ruby_prompt() { return 1 }
fi
