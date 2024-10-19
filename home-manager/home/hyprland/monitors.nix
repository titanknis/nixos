{ pkgs, ... }:

{
  home.file.".config/hypr/monitors.conf".text = ''

################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=,preferred,auto,auto

''; 
}


