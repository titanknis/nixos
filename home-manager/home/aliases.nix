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

    # Directory listing aliases using 'eza'
    alias rls='/run/current-system/sw/bin/ls --color'  # Real ls
    alias ls='eza -1 --icons=auto'             # Default: single column
    alias l='eza -lh --icons=auto'             # Long, human-readable
    alias la='eza -lha --icons=auto --sort=name --group-directories-first'  # All files
    alias ll='eza -lha --icons=auto'           # All files, unsorted
    alias ld='eza -lhD --icons=auto'           # Directories only
    alias lf='eza -lhf --icons=auto'           # Files only
    alias lh='eza -ldh .* --icons=auto --sort=name --group-directories-first'  # Hidden only
    alias lt='eza --icons=auto --tree'         # Tree view

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


