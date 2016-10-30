if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="open"
fi

if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR="vim"
else
  export EDITOR="atom"
fi

if [[ -z "$LANG" ]]; then
  export LANG="en_GB.UTF-8"
fi

export GITHUB_USER="$(git config github.user)"
export GPG_TTY=$(tty)
export PAGER="less"
export PROJECTS_HOME=~/Documents/Code
export PYTHONSTARTUP=~/.pythonrc
export VISUAL="nano"

export ATOM_ACCESS_TOKEN="$(security -q find-generic-password -a atom.io -ws "Atom.io API Token" 2>/dev/null)"
export NPM_ACCESS_TOKEN="$(security -q find-generic-password -a npmjs.org -ws "npm API Token" 2>/dev/null)"
