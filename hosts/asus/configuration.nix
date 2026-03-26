{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Import custom configurations and modules

  imports = [
    # --- Hardware, Disk and Boot Configuration ---
    ./disko.nix
    ./hardware.nix
    ../../modules/boot.nix # LUKS, GRUB, and kernel settings

    # --- System Configuration ---
    ../../modules/users.nix # User account definitions
    ../../modules/system.nix # General system settings
    ../../modules/networking.nix # Networking configuration (e.g., hostname, NetworkManager)
    ../../modules/services.nix # Services settings (e.g., printing)
    ../../modules/kanata.nix # Keyboard Configuration (extend layer)

    # --- Packages ---
    ../../modules/packages.nix # System packages and their configurations
    ../../modules/nvim.nix # Text editor
    ../../modules/git.nix # Git
    ../../modules/zsh.nix # Shell
    ../../modules/wm.nix # Window Manager

    # --- Virtual Machine Configuration ---
    ../../modules/virtualisation.nix
    ../../modules/vm.nix # Virtual machine-specific settings for the Host
  ];
}
