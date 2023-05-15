typeset -gU cdpath path

# Set the list of directories that cd searches
cdpath=(
  ${DEVELOPER_HOME}/$(git config github.user)
  ${DEVELOPER_HOME}
  ${cdpath[@]}
)

# Set the list of directories that contain executables
path=(
  /usr/local/bin
  /opt/homebrew/bin
  ${path[@]}
)
