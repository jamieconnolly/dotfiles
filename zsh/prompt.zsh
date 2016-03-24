autoload colors && colors

current_pwd() {
  local current=$(pwd | sed -e "s,^$HOME,~,")
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
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  echo $(git status --porcelain)
}

git_unpushed() {
  echo $(git cherry -v @{upstream} 2>/dev/null)
}

git_prompt() {
  if $(git rev-parse --git-dir >/dev/null 2>&1); then
    local git_branch="$(git_branch)"
    if [ -z "$(git_dirty)" ]; then
      echo -n "on %{$fg_bold[green]%}$git_branch%{$reset_color%} "
    else
      echo -n "on %{$fg_bold[red]%}$git_branch%{$reset_color%} "
    fi

    if [ -n "$(git_unpushed)" ]; then
      echo "with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
    fi
  fi
}

node_version() {
  if command -v nodenv >/dev/null 2>&1; then
    local node_version="$(nodenv version-name)"
    if [[ $node_version != "system" ]]; then
      echo $node_version
    fi
  fi
}

node_prompt() {
  local node_version="$(node_version)"
  if ! [ -z $node_version ]; then
    echo " %{$fg_bold[black]%}node:%{$reset_color%}%{$fg_bold[blue]%}$node_version%{$reset_color%}"
  fi
}

python_version() {
  if command -v pyenv >/dev/null 2>&1; then
    local virtualenv_name="$(virtualenv_name 2>/dev/null)"
    if ! [ -z $virtualenv_name ]; then
      echo $(basename $(pyenv virtualenv-prefix $virtualenv_name))
    else
      local python_version="$(pyenv version-name)"
      if [[ $python_version != "system" ]]; then
        echo $python_version
      fi
    fi
  fi
}

python_prompt() {
  local python_version="$(python_version)"
  if ! [ -z $python_version ]; then
    echo " %{$fg_bold[black]%}python:%{$reset_color%}%{$fg_bold[blue]%}$python_version%{$reset_color%}"
  fi
}

ruby_version() {
  if command -v rbenv >/dev/null 2>&1; then
    local ruby_version="$(rbenv version-name)"
    if [[ $ruby_version != "system" ]]; then
      echo $ruby_version
    fi
  fi
}

ruby_prompt() {
  local ruby_version="$(ruby_version)"
  if ! [ -z $ruby_version ]; then
    echo " %{$fg_bold[black]%}ruby:%{$reset_color%}%{$fg_bold[blue]%}$ruby_version%{$reset_color%}"
  fi
}

virtualenv_name() {
  if command -v pyenv >/dev/null 2>&1; then
    echo "$(pyenv virtualenv-name)"
  fi
}

virtualenv_prompt() {
  local virtualenv_name="$(virtualenv_name 2>/dev/null)"
  if ! [ -z "$virtualenv_name" ]; then
    echo "%{$fg_bold[yellow]%}$virtualenv_name%{$reset_color%} "
  fi
}

export PROMPT=$'\n$(virtualenv_prompt)in $(dirname_prompt) $(git_prompt)\n» '
set_prompt() {
  export RPROMPT="$(node_prompt)$(python_prompt)$(ruby_prompt)"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
