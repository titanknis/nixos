{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Enable TRIM on encrypted SSD - improves performance and longevity but may leak block usage patterns
  boot.initrd.luks.devices."luksCrypted".allowDiscards = true;

  # Bootloader Configuration (systemd)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
