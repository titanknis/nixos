{ pkgs, ... }:

{
  home.file.".aliases".text = ''
    # General shortcuts
    alias q='exit'
    alias :q='exit'
    alias t='tmux'
    alias v='nvim'
    alias vs='vscodium'
    alias cd='z'
    alias neo='neofetch'
    alias c='clear'

    # Navigation
    alias ..='cd ..'
    alias ...='cd ../..'
    alias .3='cd ../../..'
    alias .4='cd ../../../..'
    alias .5='cd ../../../../..'

    # Directory listing
    alias ls='ls --color=auto'
    alias ll='ls -l'
    alias la='ls -la'
    alias l='ls -CF'

    # Git shortcuts
    alias gs='git status'
    alias ga='git add'
    alias gc='git commit'
    alias gp='git push'
    alias gpull='git pull'
    alias gl='git log --oneline --graph --decorate'
    alias gacp='ga . && gc && gp'

    # File extraction
    alias untar='tar -zxvf'
    alias unzip='unzip -q'

    # Reload configuration
    alias reload='source ~/.zshrc'

    # Better commands
    alias grep='grep --color=auto'
    alias df='df -h'
    alias history='history | more'
    alias calc='bc -l'

    # Danger zone
    alias self-destruct='sudo rm -rf --no-preserve-root /'
  '';
}


