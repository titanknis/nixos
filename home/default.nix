{ pkgs, ... }: {
  imports = [ ./theme.nix ];
  home.file = {
    ".bashrc".source = ./.bashrc;
    ".zshrc".source = ./.zshrc;
    ".aliases".source = ./.aliases;
    ".tmux.conf".source = ./.tmux.conf;
    ".clang-format".source = ./.clang-format;
  };
  # home.file.Wallpapers = {
  #   source = ./Wallpapers;
  #   recursive = true;
  # };

  xdg.configFile = {
    # nvim = {
    #   source = ./config/nvim;
    #   recursive = true;
    # };
    #
    # hypr = {
    #   source = ./config/hypr;
    #   recursive = true;
    # };

    rofi = {
      source = ./config/rofi;
      recursive = true;
    };

    waybar = {
      source = ./config/waybar;
      recursive = true;
    };

    btop = {
      source = ./config/btop;
      recursive = true;
    };
  };
}
