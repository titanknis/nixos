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

  # Wayland-specific environment variables
  environment.sessionVariables = {
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
    brightnessctl # Backlight control
    playerctl # Media player control
    networkmanagerapplet # Network management

    # Hyprland-specific
    hyprpaper # Wallpaper utility for Hyprland
    hyprpicker
    xdg-desktop-portal-hyprland

    # Terminal and applications
    kitty # Terminal emulator
    firefox # Web browser
    mpv # Video player

    # Wayland-specific tools
    wl-clipboard # Wayland clipboard utilities
    grim # Screenshot utility
    slurp # Area selection tool
    wf-recorder
    swaylock # Screen locker
    swayidle # Idle management daemon
  ];
}
