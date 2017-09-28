config_files=($ZSH/**/*.zsh)
for config_file in ${config_files[*]}; do
  source "$config_file"
done
unset config_file{,s}
