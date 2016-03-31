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

export PAGER="less"
export PROJECTS=$HOME/Documents/Code
export VISUAL="nano"
export ZSH=$HOME/.zsh

if [[ -f $HOME/.localenv ]]; then
  source $HOME/.localenv
fi
