{
  config,
  lib,
  pkgs,
  ...
}: {
  # Installed System Packages
  environment.systemPackages = with pkgs; [
    # Python
    python3
    python3Packages.pip
    pyright # LSP servers
    black # Formatter
    # libraries
    yt-dlp
    spotdl

    # Java
    # eclipses.eclipse-jee
    # temurin-bin
    # mysql-workbench

    # CLI Utilities
    clang # C/C++ compiler
    clang-tools # Clang tools
  ];
}
