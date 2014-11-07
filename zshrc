# Make sure Boxen is available
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Make the path of the dotfiles available
export ZSH=$BOXEN_SRC_DIR/my/dotfiles

# Use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo
if [ -f ~/.localrc ] ; then
  source ~/.localrc
fi

# Find all of our zsh files
typeset -U config_files
config_files=($ZSH/**/*.zsh)

# Load the path.zsh files first
for file in ${(M)config_files:#*/path.zsh} ; do
  if [ -f $file ] ; then
    source $file
  fi
done

# Load everything but the path.zsh and completion.zsh config files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh} ; do
  if [ -f $file ] ; then
    source $file
  fi
done

# Initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Load every completion.zsh after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh} ; do
  if [ -f $file ] ; then
    source $file
  fi
done

unset config_files