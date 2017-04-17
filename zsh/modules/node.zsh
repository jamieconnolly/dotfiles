function node_prompt() {
  local node_prompt
  node_prompt="$(nodenv_prompt || true)"

  if [[ -n "$node_prompt" ]]; then
    echo "${ZSH_THEME_NODE_PROMPT_PREFIX}${node_prompt}${ZSH_THEME_NODE_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
