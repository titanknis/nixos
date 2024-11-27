{pkgs, ...}: {
  imports = [
    ./kmonad
    ./layout.nix
    ./keymap.nix
  ];
}
