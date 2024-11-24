{
  config,
  lib,
  pkgs,
  ...
}: {
  # Display Manager
  # services.displayManager.sddm.enable = true; # Enable SDDM display manager
  # services.displayManager.sddm.wayland.enable = true; # Enable SDDM display manager on wayland session

  services.greetd.enable = true;
  programs.regreet.enable = true;
  programs.regreet.cursorTheme.name = "Bibata-Modern-Ice";
  programs.regreet.iconTheme.package = pkgs.papirus-icon-theme;
}
