{pkgs, ...}: {
  home.packages = with pkgs; [
    tokyo-night-gtk
    papirus-icon-theme
    bibata-cursors
  ];
  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight";
      package = pkgs.tokyo-night-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice"; # This blue-ish cursor theme matches Tokyo Night well
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  # For Qt applications
  # qt = {
  #   enable = true;
  #   platformTheme = "gtk"; # Use GTK theme for Qt apps
  #   style.name = "gtk2"; # Use GTK theme for Qt apps
  # };
}
#
# # platform theme "gtk" or "gnome"
# qt.platformTheme.name = "gtk";
# qt.style.package = pkgs.adwaita-dark;
# # name of the qt theme
# qt.style.name = "adwaita-dark";
#
# # detected automatically:
# # adwaita, adwaita-dark, adwaita-highcontrast,
# # adwaita-highcontrastinverse, breeze,
# # bb10bright, bb10dark, cde, cleanlooks,
# # gtk2, motif, plastique
#
# # package to use
#
# gtk.enable = true;
#
# gtk.cursorTheme.package = pkgs.bibata-cursors;
# gtk.cursorTheme.name = "Bibata-Modern-Ice";
#
# gtk.theme.package = pkgs.adwaita-dark;
# gtk.theme.name = "adwaita-dark";
#
# gtk.iconTheme.package = pkgs.papirus-icon-theme;
# gtk.iconTheme.name = "Papirus-Dark";

