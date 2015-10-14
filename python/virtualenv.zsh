function _pyenv_virtualenv_find_local_file() {
  local root="$PWD"
  while [ -n "$root" ]; do
    if [ -e "${root}/.python-venv" ]; then
      echo "${root}/.python-venv"
      exit
    elif [ -e "${root}/.pyenv-venv" ]; then
      echo "${root}/.pyenv-venv"
      exit
    fi
    [ "${root}" = "${root%/*}" ] && break
    root="${root%/*}"
  done
}

function _pyenv_virtualenv_hook() {
  virtualenv="$(pyenv version-file-read $(_pyenv_virtualenv_find_local_file) || true)"
  prefix="$(pyenv prefix $virtualenv 2>/dev/null || true)"

  if [ -n "$PYENV_ACTIVATE" ]; then
    if [ -n "$virtualenv" ]; then
      if [ "$PYENV_ACTIVATE" != "$prefix" ]; then
        if eval "$(pyenv sh-deactivate --no-error)"; then
          unset PYENV_DEACTIVATE
          eval "$(pyenv sh-activate --no-error $virtualenv)" || unset PYENV_DEACTIVATE
        else
          eval "$(pyenv sh-activate --no-error $virtualenv)"
        fi
      fi
    else
      eval "$(pyenv sh-deactivate --no-error)"
      unset PYENV_DEACTIVATE
      return 0
    fi
  else
    if [ -z "$VIRTUAL_ENV" ] && [ -n "$virtualenv" ] && [ "$PYENV_DEACTIVATE" != "$prefix" ]; then
      eval "$(pyenv sh-activate --no-error $virtualenv)" || true
    fi
  fi
}

typeset -ag precmd_functions
if [[ -z "$precmd_functions[(r)_pyenv_virtualenv_hook]" ]]; then
  precmd_functions+=_pyenv_virtualenv_hook
fi
