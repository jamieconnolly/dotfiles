function host_prompt() {
  [[ -z "$SSH_CONNECTION" ]] && return
  echo "at ${PR_BRIGHT_BLUE}%m${PR_RESET} "
}
