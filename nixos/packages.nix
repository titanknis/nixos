{ config, lib, pkgs, ... }:

{
  # GPG Configuration
  programs.gnupg.agent = {
    enable = true;                  # Enable the GPG agent
    enableSSHSupport = true;        # Enable GPG for SSH key management
  };

  # Installed System Packages
  environment.systemPackages = with pkgs; [
    # Browsers
    firefox                         # Web browser

    # Editors
    neovim                          # Text editor
    vscodium                        # Visual Studio Code alternative

    # Media
    vlc                             # Video player

    #Markdown and Office
    #onlyoffice-bin                 # Office suite for document editing
    #libreoffice                    # Another office suite option
    #marktext                       # Markdown editor
    #zettlr                         # Markdown editor with additional features

    # Development Tools
    gcc                             # C/C++ compiler
    gdb                             # GNU Debugger
    codeblocks                      # Code::Blocks IDE
    git                             # Version control system

    # CLI Utilities
    tree
    wget                            # Download tool (better for resuming downloads)
    curl                            # Download tool (supports more protocols)
    zoxide                          # Z directory jumper for easier navigation
    fzf                             # Fuzzy finder for terminal
    bat                             # Enhanced 'cat' with syntax highlighting
    ranger                          # Terminal file manager with keyboard shortcuts
    htop

    # Terminal
    kitty                           # Terminal emulator with advanced features

    # Wine and Winetricks
    # Uncomment if you need to run Windows applications
    # wine                          # Compatibility layer for running Windows applications
    # winetricks                    # Script to help manage Wine

    # Fun and Miscellaneous
    neofetch                        # Display system info in a visually appealing way
    sl                              # Steam locomotive animation in terminal
    cmatrix                         # Matrix effect in terminal
    asciiquarium                    # Watch an aquarium in terminal
    cowsay                          # ASCII cowspeak for fun messages
    ponysay                         # Pony-themed version of cowsay
    fortune                         # Display random quotes
    pipes                           # Animated pipes in terminal
    figlet                          # Generate ASCII art text

    # Clipboard Tools
    wl-clipboard                    # Clipboard manager for Wayland

    # Prompt and Fonts
    starship                        # Cross-shell prompt for better CLI experience
    fira-code                       # Monospaced programming font for coding

    # Unfree Software
    spotify                         # Music streaming service
    discord                         # Communication platform
    obsidian                        # Note-taking and knowledge management tool
    #unrar                           # Tool for extracting RAR archives
  ];

  # Allow specific unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"                      # Allow Discord
    "spotify"                      # Allow Spotify
    "obsidian"                     # Allow Obsidian
  ];
}

