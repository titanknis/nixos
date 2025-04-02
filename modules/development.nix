{ config, lib, pkgs, ... }: {
  # Installed System Packages
  environment.systemPackages = with pkgs; [
    # Python
    python3
    python3Packages.pip
    pyright # LSP servers
    black # Formatter
    python312Packages.debugpy # Debugger
    # libraries
    yt-dlp
    spotdl

    # CLI Utilities
    clang # C/C++ compiler
    clang-tools # Clang tools
    gcc # C/C++ compiler
    gnumake
  ];
}
