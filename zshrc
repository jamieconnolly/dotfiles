# Make the path of the code available
export PROJECTS=$HOME/Code

# Make the path of the dotfiles available
export ZSH=$HOME/.dotfiles

# Use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo
if [ -f ~/.localrc ] ; then
  source ~/.localrc
fi

# Find all of our zsh files
typeset -U config_files
config_files=($ZSH/**/*.zsh)

# Load the path.zsh files first
for file in ${(M)config_files:#*/path.zsh}; do source $file; done

# Load everything but the path.zsh and completion.zsh config files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do source $file; done

# Initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# Load every completion.zsh after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do source $file; done

unset config_files

# Add ./bin and ./node_modules/.bin to the path. This happens after
# initialization to make sure local stubs take precedence over everything else.
export PATH=bin:node_modules/.bin:$PATH
