
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    clang
    # LSP servers
    clang-tools  # for clangd
    pyright
  ];
}

