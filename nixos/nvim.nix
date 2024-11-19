{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim

    ripgrep
    nodejs
    python3
    clang
    jdk
    glow
    syncthing
    # LSP servers
    pyright
    clang-tools # for clangd and clang-format

    jdt-language-server
    # Formatters
    black
    google-java-format
    alejandra
    stylua
    nodePackages.prettier
  ];
}
