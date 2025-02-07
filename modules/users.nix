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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDD9PaOMqw+haPBVarlPmetOm25wSGVv9RiEUOjge+px titanknis@gmail.com"
    ];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDD9PaOMqw+haPBVarlPmetOm25wSGVv9RiEUOjge+px titanknis@gmail.com"
    ];
  };
}
