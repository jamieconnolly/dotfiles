function ruby_prompt() {
  local ruby_prompt="$(rbenv_prompt || true)"

  if [[ -n "$ruby_prompt" ]]; then
    echo "$ZSH_THEME_RUBY_PROMPT_PREFIX$ruby_prompt$ZSH_THEME_RUBY_PROMPT_SUFFIX"
    return 0
  else
    return 1
  fi
}
