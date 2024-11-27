{
  config,
  username,
  pkgs,
  ...
}: {
  imports = [
    # ../../modules/home-manager/nvim
    # ../../modules/home-manager/hyprland
    # ../../modules/home-manager/rofi
    # ../../modules/home-manager/dunst
    # ../../modules/home-manager/kitty
    ../../modules/home-manager/home
    ../../modules/home-manager/dunst.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/theme.nix
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
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
