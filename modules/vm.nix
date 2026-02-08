{
  username,
  config,
  lib,
  pkgs,
  ...
}:
{
  # Set up virtualisation
  virtualisation.libvirtd = {
    enable = true;

    # Enable TPM emulation (for Windows 11)
    qemu = {
      swtpm.enable = true;
    };

  };

  # Enable USB redirection
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable virt-manager (GUI for managing VMs)
  programs.virt-manager.enable = true;

  # Set default libvirt URI for all users (system-wide)
  environment.sessionVariables = {
    LIBVIRT_DEFAULT_URI = "qemu:///system";
  };

  users.users.${username}.extraGroups = [
    "libvirtd"
    "kvm"
  ];

  # System packages for the host
  environment.systemPackages = with pkgs; [
    # virt-viewer # Graphical console client for connecting to VMs
    # spice-gtk # SPICE client for enhanced display, clipboard, and USB redirection

    # win-virtio
    # win-spice
  ];
}
