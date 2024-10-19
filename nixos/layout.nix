{ config, lib, pkgs, ... }:

{
  # Set XKB keyboard layout options
  services.xserver.xkb = {
    layout = "us";                                                  # Set the keyboard layout to US
    variant = "colemak_dh";
    options = "caps:escape,grp:win_space_toggle,shift:both_capslock_cancel,compose:102";
    #options = "lv5:caps_switch,grp:win_space_toggle,shift:both_capslock_cancel,compose:102";
 

  };
}

