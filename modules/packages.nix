{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Programs
  programs.gnupg.agent.enable = true;
  programs.yazi.enable = true; # File manager

  # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  # System packages
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty
    # shell tools
    wl-clipboard
    zoxide
    eza
    bat
    fzf
    tldr
    wtype
    taskwarrior3
    jq # rofi-timer script dependency

    # Security & privacy
    (pass.withExtensions (ext: [ ext.pass-otp ]))
    zbar

    # Media tools
    yt-dlp
    ffmpeg

    # Apps
    qutebrowser
    # youtube-music
    # signal-desktop
  ];

  # Commented packages for reference
  /*
    # Office Suite
    onlyoffice-bin
    libreoffice

    # Editing
    krita
    nomacs
    obs-studio

    # CLI Tools
    disko
    dust
    libnotify
    libqalculate
    asciinema
    asciinema-agg

    # Networking
    aria2
    nload
    bmon
    btop

    # Fun
    sl
    fastfetch
    cmatrix
    asciiquarium
    fortune
    cowsay
    ponysay
    pipes
    figlet
    ninvaders
    hollywood
    cava
    cbonsai
    clock-rs
  */
}
