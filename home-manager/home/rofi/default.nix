{pkgs, ...}: {
  # rofi configuration
  home.file.".config/rofi/config.rasi".source = ./rofi/config.rasi;
}
