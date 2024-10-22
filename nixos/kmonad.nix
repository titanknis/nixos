{ config, lib, pkgs, ... }:

{
  services.kmonad = {
    enable = true;
    keyboards = {
      myKMonadOutput = {
        device = "/dev/input/by-id/platform-i8042-serio-0-event-kbd";
        config = builtins.readFile ../home-manager/kmonad/config.kbd;
      };
    };
  };
  users.users.titanknis.extraGroups = [ "input" "uinput" ];
}

