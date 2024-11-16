{
  config,
  lib,
  pkgs,
  ...
}: {
  services.kmonad = {
    enable = true;
    keyboards = {
      myKMonadOutput = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = builtins.readFile ./kmonad/colemak-dh-extend-ansi.kbd;
        #config = builtins.readFile ./kmonad/colemak-dh-extend-iso.kbd;
        #config = builtins.readFile ./kmonad/colemak-dh-seniply-split.kbd;
        #config = builtins.readFile ./kmonad/colemak-dh-seniply-wide.kbd;
      };
    };
  };
}
