if [ "$TERM_PROGRAM" = "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
  autoload -Uz add-zsh-hook

  # Set Apple Terminal current working directory
  function update_terminal_cwd() {
    # Undocumented Terminal.app-specific control sequence
    printf "\e]7;%s\a" "file://${HOST}${PWD// /%20}"
  }

  add-zsh-hook chpwd update_terminal_cwd
  update_terminal_cwd
fi

function precmd() {
  export PROMPT=$'\n$(user_prompt)$(dir_prompt)$(host_prompt)$(scm_prompt)\n» '
}
