{ pkgs, ... }:

{
  imports = [
    ./appearance.nix
    ./autostart.nix
    ./environment.nix
    ./hyprland.nix
    ./input.nix
    ./keybindings.nix
    ./monitors.nix
    ./windowrules.nix
  ];
}


