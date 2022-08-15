typeset -gU cdpath path

# Set the list of directories that cd searches
cdpath=(
  ${CODE_HOME}/$(git config github.user)
  ${CODE_HOME}
  ${cdpath[@]}
)

# Set the list of directories that contain executables
path=(
  /usr/local/bin
  /opt/homebrew/bin
  ${path[@]}
)
