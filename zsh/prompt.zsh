setopt prompt_subst

function precmd() {
  export PROMPT=$'\n$(user_prompt)$(dir_prompt)$(host_prompt)$(scm_prompt)\n» '
}
