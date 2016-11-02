if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

function rbenv_prompt() {
  local rbenv_version rbenv_version_file
  rbenv_version_file="$(rbenv version-file $PWD 2>/dev/null)"

  if [[ -n "$rbenv_version_file" ]]; then
    rbenv_version="$(rbenv version-file-read $rbenv_version_file || true)"

    if [[ -n "$(rbenv prefix ${rbenv_version} 2>/dev/null)" ]]; then
      rbenv_prompt="${ZSH_THEME_VERSION_PROMPT_VALID_PREFIX}${rbenv_version}${ZSH_THEME_VERSION_PROMPT_VALID_SUFFIX}"
    else
      rbenv_prompt="${ZSH_THEME_VERSION_PROMPT_INVALID_PREFIX}${rbenv_version}${ZSH_THEME_VERSION_PROMPT_INVALID_SUFFIX}"
    fi

    echo "${ZSH_THEME_VERSION_PROMPT_PREFIX}${rbenv_prompt}${ZSH_THEME_VERSION_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
