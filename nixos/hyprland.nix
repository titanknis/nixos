{ config, lib, pkgs, ... }:

{
  # Hyprland
  programs.hyprland = {
    enable = true;
  };

  # Wayland-specific environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";  # Hint Electron apps to use Wayland
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
    wofi            # Application launcher for Wayland
    waybar
    mako            # Notification daemon
    libsForQt5.polkit-kde-agent  # Authentication agent
    brightnessctl   # Backlight control
    playerctl       # Media player control
    networkmanagerapplet  # Network management
    
    # Hyprland-specific
    hyprpaper       # Wallpaper utility for Hyprland

    # Terminal and applications
    kitty           # Terminal emulator
    firefox         # Web browser

    # Wayland-specific tools
    wl-clipboard    # Wayland clipboard utilities
    grim            # Screenshot utility
    slurp           # Area selection tool
    swaylock        # Screen locker
    swayidle        # Idle management daemon
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # Enable bluetooth.
  hardware.bluetooth.enable = true;		    # Enable Bluetooth 
  hardware.bluetooth.powerOnBoot = true;	# Power on Bluetooth by default
  services.blueman.enable = true;
}
