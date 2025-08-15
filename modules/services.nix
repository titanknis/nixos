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
      # PermitRootLogin = "no"; # Disable root login
      KbdInteractiveAuthentication = false;
    };
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

  # Display Manager
  services.getty = {
    autologinUser = "titanknis";
    autologinOnce = true;
  };
  environment = {
    loginShellInit = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
         hyprland
      fi
    '';
  };
}
