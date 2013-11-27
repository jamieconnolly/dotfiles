autoload colors && colors

# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ "$st" =~ ^nothing ]]
    then
      echo "on %{$fg_bold[green]%}$(git_symbolic_ref)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_symbolic_ref)%{$reset_color%}"
    fi
  fi
}

git_prompt() {
  echo "$(git_dirty)$(need_push)"
}

git_symbolic_ref() {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

unpushed () {
  $git cherry -v origin/$(git_branch) 2>/dev/null
}

python_prompt() {
  if ! [[ -z $(python_version) ]]
  then
    echo "%{$fg_bold[yellow]%}$(python_version)%{$reset_color%} "
  else
    echo ""
  fi
}

python_version() {
  if (( $+commands[pyenv] ))
  then
    version=$(pyenv version-name)
    [ "$(pyenv global)" != "$version" ] && echo "python-$version"
  fi
}

virtualenv_info() {
  [ $VIRTUAL_ENV ] && echo ''`basename ${VIRTUAL_ENV%/venv}`''
}

virtualenv_prompt() {
  if ! [[ -z "$(virtualenv_info)" ]]
  then
    echo "%{$fg_bold[black]%}$(virtualenv_info)%{$reset_color%} "
  else
    echo ""
  fi
}

current_pwd() {
  current=$(pwd | sed -e "s,^$HOME,~,")
  if [[ $current == "/" || $current == "~" ]]
  then
    echo $current
  else
    echo "$(basename $current)/"
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}$(current_pwd)%{$reset_color%}"
}

export PROMPT=$'\n$(python_prompt)in $(directory_name) $(git_prompt)\n$(virtualenv_prompt)» '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}