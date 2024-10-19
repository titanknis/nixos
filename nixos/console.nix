{ config, lib, pkgs, ... }:

{
  # conso
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;                # Use XKB configuration for keyboard layout in tty
    #keyMap = "mod-dh-ansi-us";
  };
}

