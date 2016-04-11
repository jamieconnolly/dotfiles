setopt prompt_subst

function dirname_prompt() {
  echo "$ZSH_THEME_DIRNAME_PROMPT_PREFIX${PWD/#$HOME/~}$ZSH_THEME_DIRNAME_PROMPT_SUFFIX"
}

function hostname_prompt() {
  if [[ -n "${SSH_CONNECTION}" ]]; then
    echo "$ZSH_THEME_HOSTNAME_PROMPT_PREFIX%m$ZSH_THEME_HOSTNAME_PROMPT_SUFFIX"
    return 0
  else
    return 1
  fi
}

function scm_prompt() {
  local scm_prompt="$(git_prompt || true)"

  if [[ -n "$scm_prompt" ]]; then
    echo "$ZSH_THEME_SCM_PROMPT_PREFIX$scm_prompt$ZSH_THEME_SCM_PROMPT_SUFFIX"
    return 0
  else
    return 1
  fi
}

function user_prompt() {
  if [[ $USER = "root" ]]; then
    echo "$ZSH_THEME_USER_PROMPT_PREFIX%n$ZSH_THEME_USER_PROMPT_SUFFIX"
    return 0
  else
    return 1
  fi
}

function precmd() {
  PROMPT=$'\n$(user_prompt)$(hostname_prompt)$(dirname_prompt)$(scm_prompt)\n» '
  RPROMPT="$(node_prompt)$(python_prompt)$(ruby_prompt)"
}
