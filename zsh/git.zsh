function git_prompt() {
  local git_ref git_remote_status
  git_ref="$(git_ref_prompt)"
  git_remote_status="$(git_remote_status_prompt)"

  if [[ -n "$git_ref" ]]; then
    echo "${git_ref}${git_remote_status}"
    return 0
  else
    return 1
  fi
}

function git_ref_prompt() {
  local git_ref
  git_ref=$(command git symbolic-ref --short HEAD 2>/dev/null || command git rev-parse --short HEAD 2>/dev/null)

  if [[ -n "$git_ref" ]]; then
    if [[ -n "$(command git status --porcelain --ignore-submodules=dirty 2>/dev/null | tail -n1)" ]]; then
      echo "on ${PR_BRIGHT_RED}${git_ref}${PR_RESET}"
    else
      echo "on ${PR_BRIGHT_GREEN}${git_ref}${PR_RESET}"
    fi
    return 0
  else
    return 1
  fi
}

function git_remote_status_prompt() {
  local ahead behind git_remote git_remote_status
  git_remote=${$(command git rev-parse --verify "${hook_com[branch]}@{upstream}" --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

  if [[ -n "$git_remote" ]]; then
    ahead=$(command git rev-list "${hook_com[branch]}@{upstream}..HEAD" 2>/dev/null | wc -l | tr -d ' ')
    behind=$(command git rev-list "HEAD..${hook_com[branch]}@{upstream}" 2>/dev/null | wc -l | tr -d ' ')

    if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
      return 0
    elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
      git_remote_status="$((ahead)) ahead of ${git_remote}"
    elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
      git_remote_status="$((behind)) behind ${git_remote}"
    elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
      git_remote_status="$((ahead)) ahead, $((behind)) behind ${git_remote}"
    fi

    echo " ${PR_WHITE}(${git_remote_status})${PR_RESET}"
    return 0
  else
    return 1
  fi
}
