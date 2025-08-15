{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Bootloader Configuration (systemd)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
