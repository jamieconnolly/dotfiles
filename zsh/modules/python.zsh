function python_prompt() {
  local python_prompt
  python_prompt="$(pyenv_prompt || true)"

  if [[ -n "$python_prompt" ]]; then
    echo "${ZSH_THEME_PYTHON_PROMPT_PREFIX}${python_prompt}${ZSH_THEME_PYTHON_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
