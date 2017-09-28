# Open the specified directory in your editor
function e() {
  $EDITOR "${1:-.}"
}

# Open the specified directory in GitHub Desktop
function gh() {
  github "${1:-.}"
}
