# NixOS Configuration

This repository contains my NixOS configuration files organized for a custom setup, leveraging Nix and its flakes feature. The structure is designed for easy management and deployment of system settings, packages, and services.

## Directory Structure

```
├── flake.lock
├── flake.nix
├── home-manager
│   ├── home
│   │   ├── aliases.nix
│   │   ├── bash.nix
│   │   ├── kitty.nix
│   │   ├── nvim.nix
│   │   ├── symlinks.nix
│   │   └── zsh.nix
│   └── home.nix
├── nixos
│   ├── audio.nix
│   ├── bluetooth.nix
│   ├── boot.nix
│   ├── configuration.nix
│   ├── disko.nix
│   ├── firewall.nix
│   ├── git.nix
│   ├── hardware-configuration.nix
│   ├── hyprland.nix
│   ├── input.nix
│   ├── locale.nix
│   ├── network.nix
│   ├── packages.nix
│   ├── plasma.nix
│   ├── printing.nix
│   ├── services.nix
│   ├── shell.nix
│   ├── system.nix
│   ├── users.nix
│   ├── vm.nix
│   └── xserver.nix
└── README.md
```

## Overview of Components

### Flake Files
- **flake.nix**: The main entry point for the flake, defining dependencies and inputs.
- **flake.lock**: Automatically generated file that locks the versions of the inputs defined in `flake.nix`.

### Home Manager
- **home-manager/**: Contains configurations for user-specific settings.
  - **home/**: Directory for organizing user-specific configuration files for various applications.
    - **aliases.nix**: User-defined command aliases.
    - **bash.nix**: Bash shell configuration.
    - **kitty.nix**: Configuration for the Kitty terminal emulator.
    - **nvim.nix**: Configuration for Neovim.
    - **symlinks.nix**: File for managing symlinks.
    - **zsh.nix**: Zsh shell configuration.
  - **home.nix**: Main file to manage home configurations.

### NixOS Configurations
- **nixos/**: Directory for system-wide configurations.
  - **configuration.nix**: Primary configuration file for NixOS settings.
  - **boot.nix**: Bootloader and encryption settings.
  - **disko.nix**: Disk partitioning and LVM setup.
  - **firewall.nix**: Firewall configuration.
  - **git.nix**: Git configuration.
  - **hardware-configuration.nix**: Hardware-specific settings.
  - **hyprland.nix**: Configuration for the Hyprland window manager.
  - **locale.nix**: Timezone and locale settings.
  - **network.nix**: Network settings, including DHCP and NetworkManager.
  - **packages.nix**: List of system packages and their configurations.
  - **plasma.nix**: Configuration for KDE Plasma desktop environment.
  - **services.nix**: Various system service configurations (e.g., audio, printing, Bluetooth).
  - **users.nix**: User account definitions and settings.
  - **vm.nix**: Virtual machine configuration.
  - **xserver.nix**: X11 windowing system settings.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/titanknis/nixos.git
   cd nixos
   ```

2. Build and activate the configuration:
   ```bash
   sudo nixos-rebuild switch --flake ./#mysystem 
   ```

## Usage

This configuration is tailored for a system utilizing LUKS encryption and LVM for disk management, with support for multiple desktop environments and user-specific configurations. You can modify the configuration files according to your requirements and rebuild the system.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/titanknis/nixos/blob/main/LICENSE) file for details.
