{
  config,
  lib,
  pkgs,
  ...
}: {
  # Input Device Configuration
  services.libinput.enable = true; # Enable touchpad support (default in most desktop managers)
}
