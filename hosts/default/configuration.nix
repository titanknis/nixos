{
  config,
  lib,
  pkgs,
  ...
}: {
  # Import custom configurations and modules

  imports = [
    ./hardware-configuration.nix
    # --- Disk and Boot Configuration ---
    ../../modules/nixos/disko.nix # Disko partitioning setup
    ../../modules/nixos/boot.nix # LUKS, GRUB, and kernel settings
    # ../../modules/nixos/plymouth.nix # splash screen

    # --- System Configuration ---
    ../../modules/nixos/system.nix # General system settings
    ../../modules/nixos/services.nix # Services settings (e.g., networking, printing)
    ../../modules/nixos/packages.nix # System packages and their configurations
    ../../modules/nixos/firewall.nix # Firewall configuration
    ../../modules/nixos/shell.nix # Shell configurations
    ../../modules/nixos/fonts.nix # fonts configurations
    ../../modules/nixos/users.nix # User account definitions
    ../../modules/nixos/git.nix # Git-specific configuration
    ../../modules/nixos/nvim.nix # Text editor configuration
    ../../modules/nixos/tmux.nix # Terminal multiplexer configuration
    ../../modules/nixos/python.nix # python development envirement

    # --- Networking and Locale ---
    ../../modules/nixos/network.nix # Networking configuration (e.g., hostname, NetworkManager)
    ../../modules/nixos/locale.nix # Timezone and locale settings

    # --- Peripheral and Audio Services ---
    ../../modules/nixos/printing.nix # CUPS printing service settings
    ../../modules/nixos/bluetooth.nix # Bluetooth support configuration
    ../../modules/nixos/audio.nix # Audio system configuration (e.g., PipeWire)

    # --- Input ---
    ../../modules/nixos/input.nix # Input device support (e.g., touchpad)
    ../../modules/nixos/keyboard

    # --- Desktop Environment ---
    ../../modules/nixos/hyprland.nix # Hyprland window manager configuration
    # ../../modules/nixos/plasma.nix # KDE Plasma desktop configuration
    ../../modules/nixos/display-manager.nix # Display manager configuration
    # ../../modules/nixos/stylix.nix

    # --- Virtual Machine Configuration ---
    #../../modules/nixos/vm.nix                          # Virtual machine-specific settings
  ];
}
