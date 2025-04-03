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
    ../../modules/disko.nix # Disko partitioning setup
    ../../modules/boot.nix # LUKS, GRUB, and kernel settings

    # --- System Configuration ---
    ../../modules/system.nix # General system settings
    ../../modules/networking.nix # Networking configuration (e.g., hostname, NetworkManager)
    ../../modules/services.nix # Services settings (e.g., printing)
    ../../modules/packages.nix # System packages and their configurations
    ../../modules/zsh.nix # Zsh Shell configurations
    ../../modules/users.nix # User account definitions
    ../../modules/git.nix # Git-specific configuration
    ../../modules/nvim.nix # Text editor configuration
    ../../modules/development.nix # development envirement

    # --- Desktop Environment ---
    ../../modules/hyprland.nix # Hyprland window manager configuration

    # --- Keyboard Configuration ---
    ../../modules/kmonad.nix

    # --- Virtual Machine Configuration ---
    ../../modules/vm-host.nix # Virtual machine-specific settings for the Host
    ../../modules/docker.nix # Docker Containers
  ];
}
