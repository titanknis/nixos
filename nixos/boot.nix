{
  config,
  lib,
  pkgs,
  ...
}: {
  # LUKS Encryption Setup
  # boot.initrd = {
  #   luks.devices = {
  #     luksCrypted = {
  #       device = "/dev/nvme0n1p2"; # Update with the actual device UUID
  #       preLVM = true; # Unlock LUKS before LVM activation
  #       allowDiscards = true; # Enable TRIM for SSDs
  #     };
  #   };
  # };
  # LUKS configuration - simplified since Disko handles device setup
  boot.initrd.luks.devices."luksCrypted" = {
    preLVM = true;
    allowDiscards = true;
  };

  # Bootloader Configuration (systemd)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true; # Allow modification of EFI variables

  #boot.loader.efi.efiSysMountPoint = "/boot"; # Mount point for EFI partition
  # Bootloader Configuration (GRUB)
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "nodev"; # Install GRUB on the EFI system partition
  # boot.loader.grub.copyKernels = true; # Automatically copy kernels
  # boot.loader.grub.efiSupport = true; # Enable EFI support for GRUB
  # boot.loader.grub.enableCryptodisk = true; # Enable encrypted disk support for GRUB

  # Custom GRUB Entries for Reboot and Poweroff
  # boot.loader.grub.extraEntries = ''
  #   menuentry "Reboot" { reboot }
  #   menuentry "Poweroff" { halt }
  # '';

  # Kernel Configuration (Using Zen Kernel)
  boot.kernelPackages = pkgs.linuxPackages_zen;
}
