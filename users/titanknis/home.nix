{
  config,
  username,
  pkgs,
  lib,
  ...
}:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  #############
  ### THEME ###
  #############

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig."gtk-application-prefer-dark-theme" = true;
    gtk4.extraConfig."gtk-application-prefer-dark-theme" = true;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
  };

  ################
  ### DOTFILES ###
  ################

  home.file =
    let
      dotfilesDir = "${config.home.homeDirectory}/nixos/users/${username}/dotfiles";
      dotfiles = [
        # XDG Config Items
        ".config/fastfetch"
        ".config/hypr"
        ".config/kitty"
        ".config/mako"
        ".config/mpv"
        ".config/nvim"
        ".config/qutebrowser"
        ".config/rofi"
        ".config/task"
        ".config/waybar"
        ".config/yt-dlp"

        # Home Directory Items
        ".aliases"
        ".bashrc"
        ".zshrc"
        ".clang-format"
      ];
    in
    lib.genAttrs dotfiles (name: {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${name}";
    });
}
