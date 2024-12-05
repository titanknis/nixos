{
  config,
  lib,
  pkgs,
  ...
}: {
  # Display Manager
  # services.displayManager.sddm.enable = true; # Enable SDDM display manager
  # services.displayManager.sddm.wayland.enable = true; # Enable SDDM display manager on wayland session
  # services.displayManager.sddm.autoNumlock = true;

  # services.displayManager.defaultSession = "none+Hyprland";
  services.getty.autologinUser = "titanknis";
  environment = {
    loginShellInit = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
         Hyprland
      fi
    '';
  };
  # services.greetd.enable = true;
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "titanknis";
  # programs.regreet = {
  #   enable = true;
  #   # Theme configuration
  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.gnome-themes-extra;
  #   };
  #
  #   # Icon theme
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #
  #   # Cursor theme
  #   cursorTheme = {
  #     name = "Bibata-Modern-Ice";
  #     package = pkgs.bibata-cursors;
  #   };
  #
  #   # Font configuration
  #   # font = {
  #   #   name = "DejaVu Sans";
  #   #   size = 11;
  #   #   package = pkgs.dejavu_fonts;
  #   # };
  #
  #   # Additional CSS for customization
  #   extraCss = ''
  #     window {
  #       background-color: #1e1e2e;
  #     }
  #
  #     #clock {
  #       color: white;
  #       font-size: 96px;
  #       margin: 100px;
  #     }
  #   '';
  #
  #   # Main settings (as TOML)
  #   # settings = {
  #   #   background = {
  #   #     background = "/home/titanknis/Wallpapers/mountainscapedark.jpg"; # Specify your background image here
  #   #     fit = "Contain";
  #   #   };
  #   #   # The message that initially displays on startup
  #   #   appearance = {
  #   #     greeting_msg = "hello world!";
  #   #   };
  #   # };
  # };
}
