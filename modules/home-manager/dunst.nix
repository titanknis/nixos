{pkgs, ...}: {
  # dunst configuration
  home.file.".config/dunst/dunstrc".text = ''
    font = "JetBrains Mono Nerd Font 10"
  '';
}
