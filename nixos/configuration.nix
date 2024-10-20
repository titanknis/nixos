{ config, lib, pkgs, ... }:

{
  # Import custom configurations and modules
  imports =
    [
      # --- Disk and Boot Configuration ---
      #./disko.nix                       # Disko partitioning setup
      ./hardware-configuration.nix      # Hardware-specific configuration
      ./boot.nix                        # LUKS, GRUB, and kernel settings

      # --- System Configuration ---
      ./system.nix                      # General system settings
      ./services.nix                    # Services settings (e.g., networking, printing)
      ./packages.nix                    # System packages and their configurations
      ./firewall.nix                    # Firewall configuration
      ./console.nix                     # Console configuration
      ./shell.nix                       # Shell configurations
      ./users.nix                       # User account definitions
      ./git.nix                         # Git-specific configuration

      # --- Networking and Locale ---
      ./network.nix                     # Networking configuration (e.g., hostname, NetworkManager)
      ./locale.nix                      # Timezone and locale settings

      # --- Peripheral and Audio Services ---
      ./printing.nix                    # CUPS printing service settings
      ./bluetooth.nix                   # Bluetooth support configuration
      ./audio.nix                       # Audio system configuration (e.g., PipeWire)

      # --- Input and Display Configuration ---
      ./input.nix                       # Input device support (e.g., touchpad)
      #./keymap.nix                      # Set the console keymap
      ./layout.nix                      # xkb keyboard layout

      # --- Desktop Environment ---
      ./display-manager.nix             # Display manager configuration
      ./plasma.nix                      # KDE Plasma desktop configuration
      ./hyprland.nix                    # Hyprland window manager configuration

      # --- Virtual Machine Configuration ---
      ./vm.nix                          # Virtual machine-specific settings
  ];
}
