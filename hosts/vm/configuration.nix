{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Import custom configurations and modules

  imports = [
    ./hardware.nix
    # --- Disk and Boot Configuration ---
    ./disko.nix # Disko partitioning setup

    # --- System Configuration ---
    ../../modules/system.nix # General system settings
    ../../modules/networking.nix # Networking configuration (e.g., hostname, NetworkManager)
    ../../modules/services.nix # Services settings (e.g., printing)
    ../../modules/packages.nix # System packages and their configurations
    ../../modules/users.nix # User account definitions
    ../../modules/nvim.nix # Text editor configuration

    # --- Desktop Environment ---
    ../../modules/hyprland.nix # Hyprland window manager configuration

    # --- Virtual Machine Configuration ---
    ../../modules/vm-guest.nix # Virtual machine-specific settings for the Guest
  ];
}
