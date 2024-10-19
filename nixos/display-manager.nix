{ config, lib, pkgs, ... }:

{
  # Display Manager
  services.displayManager.sddm.enable = true;                   # Enable SDDM display manager
  services.displayManager.sddm.wayland.enable = true;           # Enable SDDM display manager on wayland session
}

