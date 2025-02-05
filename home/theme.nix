{pkgs, ...}: {
  # Packages for icons and cursor themes
  home.packages = with pkgs; [
    papirus-icon-theme
  ];

  # GTK Configuration
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}
