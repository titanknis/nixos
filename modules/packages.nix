{
  config,
  lib,
  pkgs,
  ...
}: {
  # GPG Configuration
  programs.gnupg.agent = {
    enable = true; # Enable the GPG agent
    enableSSHSupport = true; # Enable GPG for SSH key management
  };

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
    # youtube-music

    # CLI Utilities
    clang # C/C++ compiler
    clang-tools # Clang tools
    wl-clipboard # Clipboard manager
    tree # Directory tree
    wget # Download tool (better for resuming downloads)
    curl # Download tool (supports more protocols)
    zoxide # Directory jumper
    eza # Enhanced ls
    fzf # Fuzzy finder
    bat # Syntax-highlighted cat
    htop
    btop
    gtop
    parted
    disko
    tldr
    man
    man-pages
    ripgrep
    ffmpeg
    qalculate-gtk # calculator
    # libqalculate # calculator cli

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
    tty-clock
    termdown

    # Unfree Software
    spotify # Music streaming service
    discord # Communication platform
  ];

  # Allow specific unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord" # Allow Discord
      "spotify" # Allow Spotify
    ];
}
