{
  config,
  lib,
  pkgs,
  ...
}: {
  # Hyprland
  programs.hyprland = {
    enable = true;
  };
  xdg.mime.defaultApplications = {
    # "application/pdf" = "org.pwmt.zathura.desktop";
  };
  # Wayland-specific environment variables
  services.getty.autologinUser = "titanknis";
  environment = {
    loginShellInit = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
         Hyprland
      fi
    '';
  };
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";

    VIDEO_PLAYER = "mpv";
    IMAGE_VIEWER = "imv";
    EDITOR = "nvim";
    VISUAL = "nvim";
    FILE_MANAGER = "yazi";
    XDG_DEFAULT_FILE_MANAGER = "yazi";
    # Set default icon theme
    # GTK_THEME = "Papirus-Dark";
    # ICON_THEME = "Papirus-Dark";
    ELECTRON_FORCE_DARK_MODE = "1";
    NIXOS_OZONE_WL = "1"; # Hint Electron apps to use Wayland
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  # Wayland-related programs
  #programs = {
  #  waybar.enable = true;
  #};

  # System packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    rofi-wayland # Application launcher for Wayland
    waybar # Bar
    libnotify
    dunst # Notification daemon
    swww # wallpaper daemon
    cliphist # clipboard manager

    libsForQt5.polkit-kde-agent # Authentication agent

    brightnessctl # Backlight

    playerctl # Media player control
    networkmanagerapplet # Network management

    # Hyprland-specific
    hyprpicker
    xdg-desktop-portal-hyprland

    # Terminal and applications
    kitty # Terminal emulator
    firefox # Web browser
    thunderbird # email client
    mpv # Video player
    imv # image viewer
    yazi # file manager
    zathura # pdf viewer

    # Wayland-specific tools
    wl-clipboard # Wayland clipboard utilities
    grim # Screenshot utility
    slurp # Area selection tool
    wf-recorder
    swaylock-effects # For screen locking
    wlogout

    qalculate-gtk # calculator
    libqalculate # calculator cli
    termdown
  ];
}
