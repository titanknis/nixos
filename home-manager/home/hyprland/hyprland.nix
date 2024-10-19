{ pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".text = ''

# █▀ █▀█ █░█ █▀█ █▀▀ █▀▀
# ▄█ █▄█ █▄█ █▀▄ █▄▄ ██▄

source = ./appearance.conf
source = ./autostart.conf
source = ./input.conf
source = ./keybindings.conf
source = ./monitors.conf
source = ./windowrules.conf
source = ./environment.conf
#source = ~/.config/hypr/themes/common.conf # shared theme settings
#source = ~/.config/hypr/themes/theme.conf # theme specific settings
#source = ~/.config/hypr/themes/colors.conf # wallbash color override

'';

}


