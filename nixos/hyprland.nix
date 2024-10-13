{ config, lib, pkgs, ... }:

{  
  # Enable Hyprland
  programs.hyprland.enable = true;
  # Optional, hint electron apps to use wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment.systemPackages = with pkgs; [
    # Add any additional packages you want to include
    waybar
    wofi
    # ... other packages ...
  ];
}

