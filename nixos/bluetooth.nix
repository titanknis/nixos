{ config, lib, pkgs, ... }:

{
  # Enable bluetooth.
  hardware.bluetooth.enable = true;		    # Enable Bluetooth 
  hardware.bluetooth.powerOnBoot = true;	# Power on Bluetooth by default
  services.blueman.enable = true;
}

