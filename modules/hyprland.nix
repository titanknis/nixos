{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Hyprland
  programs.hyprland.enable = true;
  # Screen lock
  programs.hyprlock.enable = true;

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  xdg.mime.defaultApplications = {
    # "application/pdf" = "org.pwmt.zathura.desktop";
    "application/pdf" = "firefox.desktop";
    "image/gif" = "mpv.desktop";
  };

  # Wayland-specific environment variables
  environment.sessionVariables = {
    VIDEO_PLAYER = "mpv";
    IMAGE_VIEWER = "imv";
    EDITOR = "nvim";
    FILE_MANAGER = "yazi";
  };
  # System packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    rofi-wayland # Application launcher for Wayland
    waybar # Bar
    libnotify
    dunst # Notification daemon
    swww # wallpaper daemon
    cliphist # clipboard manager

    hyprpolkitagent # Authentication agent

    brightnessctl # Backlight
    playerctl # Media player control
    pavucontrol # PulseAudio Volume Control(sound graphical interface)
    networkmanagerapplet # Network management

    # Hyprland-specific
    hyprpicker
    xdg-desktop-portal-hyprland

    # Terminal and applications
    kitty # Terminal emulator
    cmus # Music player
    mpv # Video player
    imv # image viewer
    # zathura # pdf viewer
    yazi # file manager
    # xfce.thunar

    # Wayland-specific tools
    wl-clipboard # Wayland clipboard utilities
    grim # Screenshot utility
    slurp # Area selection tool
    tesseract
    ocrfeeder

    batsignal # notify on low battery
  ];
}
