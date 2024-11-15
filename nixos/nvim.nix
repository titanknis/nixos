
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    python3
    clang
    jdk
    # LSP servers
    pyright
    clang-tools  # for clangd
    jdt-language-server
    # Formatters
    black
    clang-format
    google-java-format
    stylua
    prettier

  ];
}

