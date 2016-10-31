unalias run-help

autoload run-help
autoload run-help-git
autoload run-help-sudo
autoload run-help-svn

if command -v brew >/dev/null 2>&1; then
  export HELPDIR="$(brew --prefix)/share/zsh/help"
fi
