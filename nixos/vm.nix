{ config, lib, pkgs, ... }:

{
  # Enable dconf, a low-level configuration system used by some GNOME applications
  # This is necessary for virt-manager to save its settings
  programs.dconf.enable = true;

  # Install necessary packages for virtualization
  environment.systemPackages = with pkgs; [
    virt-manager        # Graphical user interface for managing virtual machines
    virt-viewer         # Graphical console client for connecting to virtual machines
    spice               # Remote-display system built for virtual environments
    spice-gtk           # A GTK+ widget for SPICE clients
    spice-protocol      # Spice protocol headers
    win-virtio          # VirtIO drivers for Windows guests
    win-spice           # SPICE drivers for Windows guests
    adwaita-icon-theme  # Default icon theme for GNOME (used by virt-manager)
    qemu                # A generic machine emulator and virtualizer
    OVMF                # Open Virtual Machine Firmware (for UEFI support)
    swtpm               # Software TPM emulator
  ];

  # Configure virtualization services
  virtualisation = {
    libvirtd = {
      enable = true;                            # Enable libvirtd, the virtualization management daemon
      qemu = {
        swtpm.enable = true;                    # Enable software TPM emulation
        ovmf.enable = true;                     # Enable OVMF (UEFI) support
        ovmf.packages = [ pkgs.OVMFFull.fd ];   # Use the full OVMF package
        #runAsRoot = false;                      # Don't run QEMU as root for improved security
      };
    };
    spiceUSBRedirection.enable = true;          # Enable USB redirection for SPICE
  };

  # Enable the SPICE guest agent service
  # This improves integration between the host and guest VMs when using SPICE
  services.spice-vdagentd.enable = true;

}
