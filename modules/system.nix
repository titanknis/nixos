{
  config,
  lib,
  pkgs,
  ...
}:
{
  nix = {
    # Enable nix flakes
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Enable automatic garbage collection
    gc = {
      automatic = true;
      # dates = "weekly";
      options = "--delete-generations +5"; # Keep only 5 generations
    };

    # Enable automatic nix store optimization
    optimise = {
      automatic = true;
      # dates = [ "weekly" ];
    };
  };

  # Timezone and Locale Settings
  time.timeZone = "Africa/Tunis"; # Set the correct timezone
  i18n.defaultLocale = "en_US.UTF-8"; # Set system locale

  # console keymap
  console = {
    keyMap = "mod-dh-ansi-us";
    earlySetup = true;
  };
}
