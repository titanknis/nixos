{pkgs, ...}: {
  home.packages = with pkgs; [
    papirus-icon-theme
    bibata-cursors
    # adw-gtk3
  ];
  gtk = {
    enable = true;
    # theme = {
    #   name = "adw-gtk3-dark";
    #   package = pkgs.adw-gtk3;
    # };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice"; # This white cursor theme matches Tokyo Night well
      package = pkgs.bibata-cursors;
      # size = 24;
    };
  };

  # For Qt applications
  qt = {
    enable = true;
    platformTheme.name = "gtk"; # Use GTK theme for Qt apps
    style = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk;
    };
  };
}
