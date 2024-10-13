{ config, lib, pkgs, ... }:

{
# Networking Configuration
  networking.hostName = "nixos";            # Set system hostname
  networking.networkmanager.enable = true;  # Enable NetworkManager for easier network management
}

