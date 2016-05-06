ZSH_FILES=~/.zsh

fpath=($ZSH_FILES/completions(/FN) $fpath)
autoload -Uz $ZSH_FILES/completions/*(:t)

fpath=($ZSH_FILES/functions(/FN) $fpath)
autoload -Uz $ZSH_FILES/functions/*(:t)

typeset -U config_files
config_files=($ZSH_FILES/*.zsh $ZSH_FILES/modules/*.zsh)

for config_file in ${${config_files:#*/completion.zsh}:#*/theme.zsh}; do
  source $config_file
done

for config_file in ${(M)config_files:#*/completion.zsh}; do
  source $config_file
done

for config_file in ${(M)config_files:#*/theme.zsh}; do
  source $config_file
done

unset config_file{,s}
