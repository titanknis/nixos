{
  config,
  lib,
  pkgs,
  username,
  ...
}:
{
  # Waydroid
  # virtualisation.waydroid.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];
}
