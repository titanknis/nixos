{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3
    # LSP servers
    pyright
    black

    # python312Packages.debugpy # python debug adapter

    # libraries

    yt-dlp
    # ffmpeg
    spotdl

    python312Packages.numpy
    python312Packages.scikit-image
    python312Packages.matplotlib
  ];
}
