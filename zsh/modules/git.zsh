function git_prompt() {
  local git_ref git_remote_status
  git_ref="$(git_ref_prompt)"
  git_remote_status="$(git_remote_status_prompt)"

  if [[ -n "$git_ref" ]]; then
    echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${git_ref}${git_remote_status}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}

function git_ref_prompt() {
  local git_ref git_ref_prompt
  git_ref=$(command git current-ref 2>/dev/null || command git current-rev 2>/dev/null)

  if [[ -n "$git_ref" ]]; then
    if [[ -n "$(command git status --porcelain --ignore-submodules=dirty 2>/dev/null | tail -n1)" ]]; then
      git_ref_prompt="${ZSH_THEME_GIT_REF_PROMPT_DIRTY_PREFIX}${git_ref}${ZSH_THEME_GIT_REF_PROMPT_DIRTY_SUFFIX}"
    else
      git_ref_prompt="${ZSH_THEME_GIT_REF_PROMPT_CLEAN_PREFIX}${git_ref}${ZSH_THEME_GIT_REF_PROMPT_CLEAN_SUFFIX}"
    fi

    echo "${ZSH_THEME_GIT_REF_PROMPT_PREFIX}${git_ref_prompt}${ZSH_THEME_GIT_REF_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}

function git_remote_status_prompt() {
  local ahead behind git_remote_status git_remote_status_prompt
  git_remote_status=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

  if [[ -n "$git_remote_status" ]]; then
    ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
    behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l | tr -d ' ')

    if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
      return 0
    elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
      git_remote_status_prompt="${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_AHEAD_PREFIX}$((ahead)) ahead${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_AHEAD_SUFFIX}"
    elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
      git_remote_status_prompt="${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_BEHIND_PREFIX}$((behind)) behind${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_BEHIND_SUFFIX}"
    elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
      git_remote_status_prompt="${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_DIVERGED_PREFIX}$((ahead)) ahead, $((behind)) behind${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_DIVERGED_SUFFIX}"
    fi

    echo "${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_PREFIX}${git_remote_status_prompt}${ZSH_THEME_GIT_REMOTE_STATUS_PROMPT_SUFFIX}"
    return 0
  else
    return 1
  fi
}
