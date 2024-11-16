{pkgs, ...}: {
  #home.file.".config/Code/User/keybindings.json".source = ./Code/User/keybindings.json;
  #home.file.".config/Code/User/settings.json".source = ./Code/User/settings.json;

  imports = [
    ./extensions.nix
  ];
}
