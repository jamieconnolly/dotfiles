function _pyenv_find_local_venv_file() {
  local root="$1"
  while true; do
    [[ "$root" =~ ^//[^/]*$ ]] && break
    if [ -e "${root}/.python-venv" ]; then
      echo "${root}/.python-venv"
      exit
    elif [ -e "${root}/.pyenv-venv" ]; then
      echo "${root}/.pyenv-venv"
      exit
    fi
    [ -n "$root" ] || break
    root="${root%/*}"
  done
}

function _pyenv_virtualenv_hook() {
  local ret=$?

  local virtualenv="$(pyenv version-file-read $(_pyenv_find_local_venv_file $PWD) || true)"
  local prefix="$(pyenv prefix $virtualenv 2>/dev/null || true)"

  if [ -n "$VIRTUAL_ENV" ]; then
    if [ -n "$virtualenv" ]; then
      eval "$(pyenv sh-activate --quiet $virtualenv || true)" || true
    else
      eval "$(pyenv sh-deactivate --quiet || true)" || true
    fi
  else
    eval "$(pyenv sh-activate --quiet $virtualenv || true)" || true
  fi
  return $ret
}
