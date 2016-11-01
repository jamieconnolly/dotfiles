if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --no-rehash - zsh)"
fi

function pyenv_prompt() {
  if [ -n "$(pyenv version-file $PWD 2>/dev/null)" ]; then
    OLDIFS="$IFS"
    IFS=: versions=($(pyenv version-name))
    IFS="$OLDIFS"
    echo "${ZSH_THEME_PYENV_PROMPT_PREFIX}${versions[1]}${ZSH_THEME_PYENV_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
