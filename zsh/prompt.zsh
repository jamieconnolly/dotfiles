autoload colors && colors

current_pwd() {
  current=$(pwd | sed -e "s,^$HOME,~,")
  if [[ $current == "/" || $current == "~" ]]; then
    echo $current
  else
    echo "$(basename $current)/"
  fi
}

dirname_prompt() {
  echo "%{$fg_bold[cyan]%}$(current_pwd)%{$reset_color%}"
}

git_branch() {
  if (( $+commands[git] )); then
    echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
  fi
}

git_dirty() {
  if (( $+commands[git] )); then
    echo $(git status --porcelain)
  fi
}

git_unpushed() {
  if (( $+commands[git] )); then
    echo $(git cherry -v @{upstream} 2>/dev/null)
  fi
}

git_prompt() {
  if (( $+commands[git] )) && ($(git rev-parse --git-dir >/dev/null 2>&1)); then
    if [[ $(git_dirty) == "" ]]; then
      echo -n "on %{$fg_bold[green]%}$(git_branch)%{$reset_color%} "
    else
      echo -n "on %{$fg_bold[red]%}$(git_branch)%{$reset_color%} "
    fi

    if [[ $(git_unpushed) != "" ]]; then
      echo "with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
    fi
  fi
}

node_version() {
  if (( $+commands[nodenv] )); then
    if ($(nodenv version 1>/dev/null 2>&1)); then
      echo "$(nodenv version)"
    fi
  fi
}

node_prompt() {
  if ! [[ -z "$(node_version)" ]]; then
    echo " %{$fg_bold[black]%}node: %{$reset_color%}%{$fg_bold[blue]%}$(node_version)%{$reset_color%}"
  fi
}

python_version() {
  if (( $+commands[pyenv] )); then
    if ($(pyenv virtualenv-prefix 1>/dev/null 2>&1)); then
      echo $(basename $(pyenv virtualenv-prefix))
    elif [[ $(pyenv version-name) != "system" ]]; then
      echo "$(pyenv version-name)"
    fi
  fi
}

python_prompt() {
  if ! [[ -z "$(python_version)" ]]; then
    echo " %{$fg_bold[black]%}python: %{$reset_color%}%{$fg_bold[blue]%}$(python_version)%{$reset_color%}"
  fi
}

ruby_version() {
  if (( $+commands[rbenv] )); then
    if [[ $(rbenv version-name) != "system" ]]; then
      echo "$(rbenv version-name)"
    fi
  fi
}

ruby_prompt() {
  if ! [[ -z "$(ruby_version)" ]]; then
    echo " %{$fg_bold[black]%}ruby: %{$reset_color%}%{$fg_bold[blue]%}$(ruby_version)%{$reset_color%}"
  fi
}

virtualenv_info() {
  [ $VIRTUAL_ENV ] && echo ''`basename $VIRTUAL_ENV`''
}

venv_prompt() {
  if ! [[ -z "$(virtualenv_info)" ]]; then
    echo "%{$fg_bold[yellow]%}$(virtualenv_info)%{$reset_color%} "
  fi
}

export PROMPT=$'\n$(venv_prompt)in $(dirname_prompt) $(git_prompt)\n» '
set_prompt() {
  export RPROMPT="$(node_prompt)$(python_prompt)$(ruby_prompt)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
