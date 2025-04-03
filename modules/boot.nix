{
  config,
  lib,
  pkgs,
  ...
}:
{
  # LUKS configuration - simplified since Disko handles device setup
  boot.initrd.luks.devices."luksCrypted" = {
    preLVM = true;
    allowDiscards = true;
  };

  # Bootloader Configuration (systemd)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; # Allow modification of EFI variables

  # Kernel Configuration (Using Zen Kernel)
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
