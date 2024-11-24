{pkgs, ...}: {
  # waybar configuration
  home.file.".config/waybar/config".source = ./waybar/config;
  home.file.".config/waybar/style.css".source = ./waybar/style.css;
}
