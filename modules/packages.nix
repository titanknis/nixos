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
  #
  # # Fonts
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
  #
  # System packages
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty
    # shell tools
    aria2
    wl-clipboard
    zoxide
    eza
    bat
    fzf
    tldr
    wtype
    taskwarrior3
    jq # rofi-timer script dependency
    curl
    wget

    tailwindcss_4

    # AI Tools
    # kilocode-cli
    claude-code
    cursor-cli

    flex
    bison

    # Security & privacy
    (pass.withExtensions (ext: [ ext.pass-otp ]))
    zbar

    # Media tools
    yt-dlp
    ffmpeg

    # Apps
    libreoffice
    qutebrowser
    firefox
    signal-desktop

    # github-desktop

    # python313Packages.argostranslate

    # audacity

    # wineWowPackages.full
    # winetricks
    # asciinema

    # Music player
    # tauon
    # kew
    # musikcube

    # mpd
    # rmpc
    # mpc

    # Fun
    # sl
    # fastfetch
    # cmatrix
    # asciiquarium
    # fortune
    # cowsay
    # ponysay
    # pipes
    # figlet
    # ninvaders
    # hollywood
    # cava
    # cbonsai
    # clock-rs
    # cool-retro-term
    # lolcat

    # Unfree
    # ciscoPacketTracer8 # unfree :(
    oracle-instantclient
    discord

  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      # "ciscoPacketTracer8"
      "oracle-instantclient"
      "discord"
      "claude-code"
      "cursor-cli"
    ];

  nixpkgs.config.permittedInsecurePackages = [
    "ciscoPacketTracer8-8.2.2"
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
