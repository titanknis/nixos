{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Bootloader Configuration (systemd)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; # Allow modification of EFI variables

  # Kernel Configuration (Using Zen Kernel)
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
