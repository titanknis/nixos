# NixOS Configuration

**DISCLAIMER:** This documentation may be outdated due to recent additions and changes.

This repository contains my personal NixOS configuration, built using Nix flakes. Each component is organized to make managing and deploying system settings, packages, and services simple and flexible. The setup is modular, allowing you to easily tweak or extend it to meet your needs.

## Directory Structure

```
.
├── flake.lock
├── flake.nix
├── home
│   ├── config
│   │   ├── btop
│   │   ├── hypr
│   │   ├── nvim
│   │   ├── rofi
│   │   └── waybar
│   ├── default.nix
│   ├── programs
│   ├── theme.nix
│   └── Wallpapers
├── hosts
│   ├── default
│   │   ├── default.nix
│   │   ├── hardware-configuration.nix
│   │   └── home.nix
│   └── vm
│       ├── boot.nix
│       ├── default.nix
│       ├── disko.nix
│       ├── hardware-configuration.nix
│       └── home.nix
├── LICENSE
├── modules
│   ├── boot.nix
│   ├── disko.nix
│   ├── git.nix
│   ├── hyprland.nix
│   ├── kmonad.nix
│   ├── networking.nix
│   ├── nvim.nix
│   ├── packages.nix
│   ├── python.nix
│   ├── services.nix
│   ├── stylix.nix
│   ├── system.nix
│   ├── users.nix
│   ├── vm-guest.nix
│   ├── vm-host.nix
│   └── zsh.nix
└── README.md
```

## Overview of Components

### Flake Files

- **flake.nix**: Main entry point for the flake, defining dependencies and inputs.
- **flake.lock**: Automatically generated file that locks the versions of the inputs defined in `flake.nix`.

### Home Manager

- **home-manager/**: Configures user-specific settings.

### NixOS Configurations

- **nixos/**: System-wide configuration files.
  - **boot.nix**: Bootloader and encryption settings.
  - **disko.nix**: Disk partitioning and LVM setup.
  - **git.nix**: Git configuration.
  - **hardware-configuration.nix**: Hardware-specific settings.
  - **hyprland.nix**: Configuration for the Hyprland window manager.
  - **networking.nix**: Network settings and NetworkManager.
  - **packages.nix**: List of system packages and configurations.
  - **services.nix**: Various system service configurations.
  - **users.nix**: User account definitions and settings.
  - **vm-host.nix**: Virtual machine configuration.
  - **vm-guest.nix**: Virtual machine configuration.

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

This configuration is set up for a system using LUKS encryption and LVM for disk management. It supports both Plasma and Hyprland desktop environments, along with user-specific configurations. The setup is modular, so you can easily customize the configuration to fit your system's needs. Rebuilding the system after making changes is simple.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/titanknis/nixos/blob/main/LICENSE) file for details.
