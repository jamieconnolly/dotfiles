if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"
fi

if [ -n "$SSH_CONNECTION" ]; then
  export EDITOR="vim"
else
  export EDITOR="atom"
fi

if [ -z "$LANG" ]; then
  export LANG="en_GB.UTF-8"
fi

export GPG_TTY=$(tty)
export PAGER="less"
export PYTHONSTARTUP="$HOME/.pythonrc"
export VISUAL="nano"

export GITHUB_USER="$(git config github.user)"
export PROJECTS_HOME="$HOME/Projects"
