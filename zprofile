typeset -gU cdpath fpath manpath path

# Set the list of directories that cd searches
cdpath=(
  ${cdpath[@]}
  ${PROJECT_HOME}/${GITHUB_USER}
  ${PROJECT_HOME}
)

# Set the list of directories that zsh searches for functions
fpath=(
  ${ZSH}/{functions,completions}
  ${fpath[@]}
)

# Set the list of directories that man searches for manuals
manpath=(
  /usr/local/share/man
  /usr/share/man
  ${manpath[@]}
)

# Set the list of directories that zsh searches for programs
path=(
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  ${path[@]}
)
