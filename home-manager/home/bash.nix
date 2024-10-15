{ pkgs, ... }:

{
  home.file.".bashrc".text = ''
    # ~/.bashrc - Minimal Bash configuration

    # Enable colored output for `ls` and `grep`
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'

    # Enable vi keybindings for command-line editing
    set -o vi

    # Source custom aliases
    source ~/.aliases

    # Initialize zoxide for directory jumping
    eval "$(zoxide init bash)"

    # Load Starship prompt
    # eval "$(starship init bash)"
  '';
}

