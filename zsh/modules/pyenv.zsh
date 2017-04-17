if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

function pyenv_prompt() {
  local pyenv_versions pyenv_version_file
  pyenv_version_file="$(pyenv version-file "$PWD" 2>/dev/null)"

  if [[ -n "$pyenv_version_file" ]]; then
    OLDIFS="$IFS"
    IFS=: pyenv_versions=($(pyenv version-file-read "$pyenv_version_file" || true))
    IFS="$OLDIFS"

    if [[ -n "$(pyenv prefix "${pyenv_versions[1]}" 2>/dev/null)" ]]; then
      pyenv_prompt="${ZSH_THEME_VERSION_PROMPT_VALID_PREFIX}${pyenv_versions[1]}${ZSH_THEME_VERSION_PROMPT_VALID_SUFFIX}"
    else
      pyenv_prompt="${ZSH_THEME_VERSION_PROMPT_INVALID_PREFIX}${pyenv_versions[1]}${ZSH_THEME_VERSION_PROMPT_INVALID_SUFFIX}"
    fi

    echo "${ZSH_THEME_VERSION_PROMPT_PREFIX}${pyenv_prompt}${ZSH_THEME_VERSION_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
