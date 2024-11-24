{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./home
    ./theme.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "titanknis";
  home.homeDirectory = "/home/titanknis";

  # Add stuff for your user as you see fit:
  #  home.packages = with pkgs; [];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
