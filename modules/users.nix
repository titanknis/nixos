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
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsecA8XcV40ba74VP7P1aV5qx3dJRAZbtV3GTrEg/9l titanknis"
    ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsecA8XcV40ba74VP7P1aV5qx3dJRAZbtV3GTrEg/9l titanknis"
  ];

}
