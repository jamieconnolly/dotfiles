# shellcheck source=/dev/null
fpath=($ZSH/{functions,completions} $fpath)
autoload -Uz "$ZSH"/{functions,completions}/*(:t)

autoload -Uz compinit && compinit -i

config_files=($ZSH/**/*.zsh)
for config_file in ${config_files[*]}; do
  source "$config_file"
done
unset config_file{,s}
