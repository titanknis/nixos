{
  config,
  username,
  pkgs,
  ...
}:
{
  imports = [
    ../../home
    ../../home/programs/dunst.nix
    ../../home/programs/kitty.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Add stuff for your user as you see fit:
  #  home.packages = with pkgs; [];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
