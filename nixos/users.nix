{
  config,
  lib,
  pkgs,
  ...
}: {
  # User Configuration
  users.users.titanknis = {
    isNormalUser = true;
    home = "/home/titanknis";
    description = "titanknis";
    extraGroups = ["wheel" "networkmanager" "libvirtd" "kvm"]; # Add user to sudo and other groups
  };
}
