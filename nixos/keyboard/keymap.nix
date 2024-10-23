{ config, lib, pkgs, ... }:

{
  # console keymap
  console = {
     #keyMap = "mod-dh-ansi-us";
     useXkbConfig = true;
  };
}

