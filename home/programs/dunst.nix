{ pkgs, ... }:
{
  # dunst configuration
  xdg.configFile."dunst/dunstrc".text = ''
    font = "JetBrains Mono Nerd Font 10"
  '';
}
