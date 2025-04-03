{
  config,
  lib,
  pkgs,
  ...
}:
{
  # GPG Configuration
  programs.gnupg.agent = {
    enable = true; # Enable the GPG agent
    enableSSHSupport = true; # Enable GPG for SSH key management
  };

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  programs.tmux = {
    enable = true;
    # plugins = with pkgs.tmuxPlugins; [
    #   sensible
    # ];
  };

  # Web Browser
  programs.firefox.enable = true;
  # Email Client
  programs.thunderbird.enable = true;
  # Editor
  programs.neovim.enable = true;
  # File Manager
  programs.yazi.enable = true;
  # Version control
  programs.git.enable = true;

  # Installed System Packages
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty # Terminal emulator

    # Media
    mpv # Video player
    cmus # Music player
    youtube-music

    komikku # managa reader

    # archieve managers
    file-roller
    # ark
    # peazip

    # Office Suite
    # libreoffice
    onlyoffice-bin

    # Editing
    krita
    nomacs

    xfce.thunar # gui file manager for drag and drop feature

    # CLI Utilities
    img2pdf
    wl-clipboard # Clipboard manager
    # tree # Directory tree

    # Networking & Monitoring
    # wget # Download tool (better for resuming downloads)
    # curl # Download tool (supports more protocols)
    aria2
    nload
    bmon
    btop
    # htop
    # gtop

    zoxide # Directory jumper
    eza # Enhanced ls
    bat # Syntax-highlighted cat
    fzf # Fuzzy finder
    ripgrep
    # unzip # .zip file extractor

    # parted
    disko

    tldr
    # man
    # man-pages

    # ffmpeg
    # qalculate-gtk # calculator
    libqalculate # calculator cli

    # Fun and Miscellaneous
    fastfetch # Display system info in a visually appealing way
    sl # Steam locomotive animation in terminal
    cmatrix # Matrix effect in terminal
    asciiquarium # Watch an aquarium in terminal
    cowsay # ASCII cowspeak for fun messages
    ponysay # Pony-themed version of cowsay
    fortune # Display random quotes
    pipes # Animated pipes in terminal
    figlet # Generate ASCII art text
    ninvaders
    hollywood
    cava
    cbonsai
    cool-retro-term

    # Clock and Timers
    clock-rs
    tomato-c
    # tty-clock
    # termdown
    # pomodoro-gtk

    # Unfree Software
    # discord # Communication platform
    # spotify # Music streaming service
    # vscode
    # rar # proprietary .rar files extractor :(
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # Add additional package names here
      # "discord" # Allow Discord
      # "spotify" # Allow Spotify
      # "vscode"
      # "rar"
    ];
}
