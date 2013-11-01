# Make the path of the dotfiles available.
export DOTFILES=$HOME/.dotfiles

# Expose the projects folder so that we can `c [tab]`
#export PROJECTS=$HOME/Projects

# Make sure Boxen is available.
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Find all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# Load the path.zsh files first
for file in ${(M)config_files:#*/path.zsh} ; do
  if [ -f $file ] ; then
    source $file
  fi
done

# Load everything but the path and completion config files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh} ; do
  if [ -f $file ] ; then
    source $file
  fi
done

# Use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [ -f "$HOME/.localrc" ] ; then
  source $HOME/.localrc
fi

# Initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Load every completion.zsh after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh} ; do
  if [ -f $file ] ; then
    source $file
  fi
done