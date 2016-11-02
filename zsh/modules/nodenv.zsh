if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init --no-rehash - zsh)"
fi

function nodenv_prompt() {
  local nodenv_version nodenv_version_file
  nodenv_version_file="$(nodenv version-file $PWD 2>/dev/null)"

  if [[ -n "$nodenv_version_file" ]]; then
    nodenv_version="$(nodenv version-file-read $nodenv_version_file || true)"

    if [[ -n "$(nodenv prefix ${nodenv_version} 2>/dev/null)" ]]; then
      nodenv_prompt="${ZSH_THEME_VERSION_PROMPT_VALID_PREFIX}${nodenv_version}${ZSH_THEME_VERSION_PROMPT_VALID_SUFFIX}"
    else
      nodenv_prompt="${ZSH_THEME_VERSION_PROMPT_INVALID_PREFIX}${nodenv_version}${ZSH_THEME_VERSION_PROMPT_INVALID_SUFFIX}"
    fi

    echo "${ZSH_THEME_VERSION_PROMPT_PREFIX}${nodenv_prompt}${ZSH_THEME_VERSION_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
