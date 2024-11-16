{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep

    python3
    clang
    jdk
    # LSP servers
    pyright
    clang-tools # for clangd
    jdt-language-server
    # Formatters
    black
    google-java-format
    stylua
    nodePackages.prettier
    alejandra
  ];
}
