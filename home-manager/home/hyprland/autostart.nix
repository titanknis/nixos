{ pkgs, ... }:

{
  home.file.".config/hypr/autostart.conf".text = ''

#################
### AUTOSTART ###
#################

# Autostart necessary processes (like notifications daemons, status bars, etc.)
# Or execute your favorite apps at launch like this:

#exec-once = $terminal
exec-once = nm-applet &
#exec-once = waybar & hyprpaper & firefox

''; 
}


