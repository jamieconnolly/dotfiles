autoload -Uz compinit && compinit -i

setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word
setopt no_list_beep

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
