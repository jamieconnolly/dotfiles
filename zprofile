typeset -gU cdpath

# Set the list of directories that cd searches
cdpath=(
  ${PROJECT_HOME}/$(git config github.user)
  ${PROJECT_HOME}
  ${cdpath[@]}
)
