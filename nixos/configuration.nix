{ config, lib, pkgs, ... }:

{
  # Import hardware and custom configurations
  imports =
    [
      ./hardware-configuration.nix  # Hardware-specific configuration
      ./git.nix                     # Git-specific configuration
      ./firewall.nix                # Firewall configuration
      ./boot.nix                    # Luks, grub and kernel configuration
      ./desktop.nix
      ./packages.nix
      ./users.nix
      ./shell.nix
      ./settings.nix
      ./services.nix
      ./vm.nix                      # Virtual machine-specific config
      #./disko.nix
  ];
}
