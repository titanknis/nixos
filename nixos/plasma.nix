{ config, lib, pkgs, ... }:

{
  # Desktop Environment and Display Manager
  services.desktopManager.plasma6.enable = true;        # Enable KDE Plasma 6
  services.displayManager.sddm.wayland.enable = true;           # Enable SDDM display manager
  services.displayManager.sddm.enable = true;           # Enable SDDM display manager
  services.displayManager.defaultSession = "plasma";    # Set Plasma as the default session (Wayland)
}

