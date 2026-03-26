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

    colorScheme = "dark";
    gtk4.theme = null;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    # name = "Bibata-Modern-Amber";
    # name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    # size = 32;
    # package = pkgs.catppuccin-cursors.mochaLight;
    hyprcursor.enable = true;
  };

  ################
  ### DOTFILES ###
  ################

  home.file =
    lib.genAttrs
      [
        ".config/fastfetch"
        ".config/hypr"
        ".config/niri"
        ".config/kitty"
        ".config/mako"
        ".config/mpv"
        ".config/mpd"
        ".config/nvim"
        ".config/qutebrowser"
        ".config/rofi"
        ".config/task"
        ".config/waybar"
        ".config/yt-dlp"
        ".config/zathura"
        ".config/YouTube Music/config.json"

        ".aliases"
        ".bashrc"
        ".zshrc"
        ".clang-format"
      ]
      (name: {
        # source = ./dotfiles/${name}; # Default: Immutable store path (works anywhere, requires rebuild for changes)

        # Alternative: Editable symlink (requires flake in ~/nixos, changes apply instantly)
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/users/${username}/dotfiles/${name}";
      });
}
