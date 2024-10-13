{ config, pkgs, ... }:

let
    # Import the individual dotfile configurations
    bashConfig = import ./home/bash.nix { inherit pkgs; };
    zshConfig = import ./home/zsh.nix { inherit pkgs; };
    aliasesConfig = import ./home/aliases.nix { inherit pkgs; };
    kittyConfig= import ./home/kitty.nix { inherit pkgs; };
    nvimConfig= import ./home/nvim.nix { inherit pkgs; };
    hyprlandConfig= import ./home/hyprland.nix { inherit pkgs; };
in
{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "titanknis";
  home.homeDirectory = "/home/titanknis";
  
  # Managing dotfiles
  # Combine the configurations
  home.file = bashConfig.home.file // zshConfig.home.file  // aliasesConfig.home.file  // kittyConfig.home.file // nvimConfig.home.file
  #// hyprlandConfig.home.file 
  ;


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

