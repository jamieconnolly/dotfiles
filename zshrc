# shellcheck source=/dev/null
autoload -Uz compinit && compinit -i
autoload -Uz "$ZSH"/functions/*(:t)

config_files=($ZSH/**/*.zsh)
for config_file in ${config_files[*]}; do
  source "$config_file"
done
unset config_file{,s}
