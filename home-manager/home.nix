{ config, pkgs, ... }:
{
  imports = [
    ./home/bash.nix 
    ./home/zsh.nix
    ./home/aliases.nix
    ./home/kitty.nix 
    ./home/nvim.nix 
    ./home/plasma
    ./home/vscode
    ./home/vscodium
    #./home/hyprland
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "titanknis";
  home.homeDirectory = "/home/titanknis";
  
  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;
  home.packages = with pkgs; [   ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

