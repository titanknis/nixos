{
  pkgs,
  config,
  ...
}: {
  # Enable Stylix theming
  stylix = {
    enable = true;

    # targets = {
    #   gtk.enable = true;
    #   qt.enable = true;
    # };

    # Set the Tokyo Night color scheme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    image = ../home/Wallpapers/Best/manga.png;

    polarity = "dark"; # "light" or "either"``

    # Set fonts (optional)
    # fonts = {
    #   # Monospace: For coding and terminals.
    #   monospace = {
    #     package = pkgs.nerd-fonts.jetbrains-mono; # Developer-friendly monospace font.
    #     name = "JetBrainsMono Nerd Font Mono";
    #   };
    #   serif = config.stylix.fonts.monospace;
    #   sansSerif = config.stylix.fonts.monospace;
    #   emoji = config.stylix.fonts.monospace;
    # };

    #TODO: done
    # Set cursor theme (optional)
    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 32;
    };

    # Set icon theme (optional)
    # iconTheme = {
    #   package = pkgs.papirus-icon-theme;
    #   name = "Papirus-Dark";
    # };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Install required packages
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
  ];
}
