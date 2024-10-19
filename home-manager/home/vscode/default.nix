{ pkgs, ... }:

{
  imports = [
    ./keybindings.nix
    ./settings.nix
    ./extensions.nix
  ];
}


