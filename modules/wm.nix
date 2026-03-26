{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Hyprland
  programs.hyprland.enable = true;
  # programs.niri.enable = true;

  # Screen lock
  programs.hyprlock.enable = true; # Lockscreen
  # Bar
  programs.waybar.enable = true; # Bar

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ]; # Font

  xdg.mime.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };

  # Set yazi as default file chooser
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-termfilechooser
  ];
  xdg.portal.config.hyprland.FileChooser = [ "termfilechooser" ];
  environment.sessionVariables.QT_QPA_PLATFORMTHEME = "xdgdesktopportal"; # for Qt apps like qutebrowser

  # System packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    (rofi.override { plugins = [ rofi-calc ]; }) # Application launcher for Wayland with plugins
    mako # Notification daemon
    awww # wallpaper daemon
    cliphist # clipboard manager

    brightnessctl # Backlight
    playerctl # Media player control
    pavucontrol # PulseAudio Volume Control(sound graphical interface)
    networkmanagerapplet # Network management
    batsignal # notify on low battery

    # Hyprland-specific
    hyprpicker
    hyprpolkitagent # Authentication agent

    # Terminal and applications
    kitty # Terminal emulator
    mpv # Video player
    imv # image viewer
    zathura # pdf viewer
    yazi # file manager

    # Wayland-specific tools
    grim # Screenshot utility
    slurp # Area selection tool
    tesseract # for image/screenshot text extraction
    wl-clipboard # Wayland clipboard utilities

    st # Simtle Terminal
    dmenu
  ];

  # Display Manager (choose getty or greetd)
  services.getty = {
    autologinUser = "titanknis";
    autologinOnce = true;
  };
  environment = {
    loginShellInit = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
        start-hyprland
      fi
    '';
  };
  # environment = {
  #   loginShellInit = ''
  #     if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  #       # niri-session
  #     fi
  #   '';
  # };
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --time";
  #       user = "greeter";
  #     };
  #   };
  # };
}
