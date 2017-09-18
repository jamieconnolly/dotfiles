autoload -Uz compinit && compinit -i

setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt complete_in_word
setopt no_list_beep

# prevent the current directory from being completed
zstyle ':completion:*' ignore-parents parents pwd

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[.]=* r:|=*' 'l:|=* r:|=*'

# sequences of slashes in filename paths will be treated as a single slash
zstyle ':completion:*' squeeze-slashes true

# prevent internal zsh functions from being completed
zstyle ':completion:*:functions' ignored-patterns '_*'

# prevent my personal projects directory from being completed
zstyle ':completion:*:path-directories' ignored-patterns "$GITHUB_USER"
