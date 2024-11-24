{pkgs, ...}: {
  # dunst configuration
  home.file.".config/dunst/dunstrc".source = ./dunst/dunstrc;
}
