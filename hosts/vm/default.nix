{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Import custom configurations and modules

  imports = [
    ./hardware-configuration.nix
    # --- Disk and Boot Configuration ---
    ./disko.nix # Disko partitioning setup
    ./boot.nix # LUKS, GRUB, and kernel settings

    # --- System Configuration ---
    ../../modules/system.nix # General system settings
    ../../modules/networking.nix # Networking configuration (e.g., hostname, NetworkManager)
    ../../modules/services.nix # Services settings (e.g., printing)
    ../../modules/packages.nix # System packages and their configurations
    ../../modules/zsh.nix # Zsh Shell configurations
    ../../modules/users.nix # User account definitions
    ../../modules/git.nix # Git-specific configuration
    ../../modules/nvim.nix # Text editor configuration
    ../../modules/python.nix # python development envirement

    # --- Desktop Environment ---
    ../../modules/hyprland.nix # Hyprland window manager configuration
    # ../../modules/stylix.nix

    # --- Virtual Machine Configuration ---
    ../../modules/vm-guest.nix # Virtual machine-specific settings for the Guest
  ];
}
