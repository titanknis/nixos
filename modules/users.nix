{
  config,
  lib,
  pkgs,
  ...
}:
{
  # User Configuration
  users.users.titanknis = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "kvm"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZqkqYJO/ORQRkx6wGMDyahyW4wpIIX/17ld+9JM9yV titanknis@gmail.com"
    ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINZqkqYJO/ORQRkx6wGMDyahyW4wpIIX/17ld+9JM9yV titanknis@gmail.com"
  ];

}
