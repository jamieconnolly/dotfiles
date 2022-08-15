typeset -gU cdpath

# Set the list of directories that cd searches
cdpath=(
  ${CODE_HOME}/$(git config github.user)
  ${CODE_HOME}
  ${cdpath[@]}
)
