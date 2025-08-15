{
  config,
  lib,
  pkgs,
  ...
}:
{
  ###########################
  ### Host Configuration ###
  ###########################

  # Enable libvirt and QEMU/KVM for virtualization
  virtualisation.libvirtd.enable = true; # Essential for managing VMs on the host

  # Enable virt-manager (GUI for managing VMs)
  programs.virt-manager.enable = true; # Auto-enables dconf for saving settings

  # Enable SPICE USB redirection for VMs
  # This allows USB devices (e.g., flash drives) to be redirected to the VM
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable UEFI support for VMs (recommended for modern OSes like Windows 11)
  virtualisation.libvirtd.qemu.ovmf.enable = true; # Uses OVMF firmware for UEFI boot
  # Enable software tpm for VMs (recommended for modern OSes like Windows 11)
  # virtualisation.libvirtd.qemu.swtpm.enable = true; # Uses OVMF firmware for UEFI boot

  # Set default libvirt URI for all users (system-wide)
  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  # System packages for the host
  environment.systemPackages = with pkgs; [
    virt-viewer # Graphical console client for connecting to VMs
    spice-gtk # SPICE client for enhanced display, clipboard, and USB redirection

    # win-virtio
    # win-spice
  ];
}
