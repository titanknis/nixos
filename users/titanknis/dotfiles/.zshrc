# ~/.zshrc - Minimal Zsh configuration

# History Settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Options
setopt autocd
bindkey -v

# Aliases
source ~/.aliases

# FZF History Search
fzf_history(){
    print -z $(history 0 | fzf --tac --no-sort --exact --height=40% | cut -c7-) 
    zle accept-line
}
zle -N fzf_history
bindkey -M viins '^_' fzf_history
bindkey -M vicmd '^_' fzf_history
bindkey -M vicmd '/' fzf_history

# Directory Navigation
eval "$(zoxide init zsh)"
