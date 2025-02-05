{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3
    python3Packages.pip
    # LSP servers
    pyright
    # Formatter
    black

    # libraries
    yt-dlp
    spotdl
  ];
}
