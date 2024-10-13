{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Set XKB keyboard layout options
  services.xserver.xkb = {
    layout = "us";                                                  # Set the keyboard layout to US
    variant = "colemak_dh";                                         # Use the Colemak DH variant
    #options = "misc:extend,lv5:caps_switch_lock,compose:menu";		# Alternative XKB options (commented out)
    options = "caps:escape, compose:ralt, terminate:ctrl_alt_bksp";	# Set additional XKB options
  };
}

