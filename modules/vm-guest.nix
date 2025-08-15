{
  config,
  lib,
  pkgs,
  ...
}:
{
  ###########################
  ### Guest Configuration ###
  ###########################

  # Enable SPICE vdagent for better integration when NixOS is the guest OS
  # This enables clipboard sharing, dynamic display resizing, and mouse integration
  services.spice-vdagentd.enable = true;

  # Enable QEMU guest agent for additional guest utilities
  # This provides features like time synchronization and graceful shutdown
  services.qemuGuest.enable = true;
}
