{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Disable the OpenSSH daemon
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false; # Force key-based auth
      PermitRootLogin = "no"; # Disable root login
      KbdInteractiveAuthentication = false;
    };
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql;
  };

  # Input Device Configuration
  services.libinput.enable = true; # Enable touchpad support (default in most desktop managers)

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Audio System Configuration
  services.pipewire.enable = true; # Enable PipeWire (audio system)

  # Enable bluetooth.
  hardware.bluetooth.enable = true; # Enable Bluetooth
  services.blueman.enable = true;
}
