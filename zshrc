fpath=($ZSH/completions(/FN) $fpath)
autoload -Uz $ZSH/completions/*(:t)

fpath=($ZSH/functions(/FN) $fpath)
autoload -Uz $ZSH/functions/*(:t)

typeset -U config_files
config_files=($ZSH/*.zsh $ZSH/modules/*.zsh)

for config_file in ${${config_files:#*/completion.zsh}:#*/theme.zsh}; do
  source $config_file
done

for config_file in ${(M)config_files:#*/completion.zsh}; do
  source $config_file
done

for config_file in ${(M)config_files:#*/theme.zsh}; do
  source $config_file
done

unset config_file{s,}

[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

export PATH="bin:${PATH}"
