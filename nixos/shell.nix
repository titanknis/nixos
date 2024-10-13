{ config, lib, pkgs, ... }:

{
  # Shell Configuration (Zsh)
  programs.zsh.enable = true;                           # Enable Zsh
  programs.zsh.syntaxHighlighting.enable = true;        # Enable syntax highlighting
  programs.zsh.autosuggestions.enable = true;           # Enable autosuggestions

  programs.starship.enable = true;                      # Enable Starship prompt
  users.defaultUserShell = pkgs.zsh;                    # Set Zsh as the default shell

}

