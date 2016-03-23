function _pyenv_find_local_venv_file() {
  local root="$1"
  while ! [[ "$root" =~ ^//[^/]*$ ]]; do
    if [ -e "${root}/.python-venv" ]; then
      echo "${root}/.python-venv"
      return 0
    fi
    [ -n "$root" ] || break
    root="${root%/*}"
  done
  return 1
}

function _pyenv_virtualenv_hook() {
  local ret=$?
  local virtualenv="$(pyenv version-file-read $(_pyenv_find_local_venv_file $PWD) || true)"

  if [ -n "$VIRTUAL_ENV" ]; then
    eval "$(pyenv sh-activate --quiet $virtualenv 2>/dev/null || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet $virtualenv 2>/dev/null || true)" || true
  fi
  return $ret
}
