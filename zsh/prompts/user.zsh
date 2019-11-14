function user_prompt() {
  [[ $USER != "root" ]] && return
  echo "with ${PR_BRIGHT_YELLOW}%n${PR_RESET} "
}
