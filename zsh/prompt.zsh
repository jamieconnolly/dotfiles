setopt prompt_subst

function dirname_prompt() {
  echo "in ${PR_BRIGHT_CYAN}${PWD/#$HOME/~}${PR_RESET} "
}

function hostname_prompt() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    echo "at ${PR_BRIGHT_MAGENTA}%m${PR_RESET} "
    return 0
  else
    return 1
  fi
}

function scm_prompt() {
  local scm_prompt
  scm_prompt="$(git_prompt || true)"

  if [[ -n "$scm_prompt" ]]; then
    echo "${scm_prompt}"
    return 0
  else
    return 1
  fi
}

function user_prompt() {
  if [[ $USER = "root" ]]; then
    echo "${PR_BRIGHT_BLUE}%n${PR_RESET} "
    return 0
  else
    return 1
  fi
}

function precmd() {
  export PROMPT=$'\n$(user_prompt)$(hostname_prompt)$(dirname_prompt)$(scm_prompt)\n» '
}
