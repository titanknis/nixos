{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim # Modern text editor
    ripgrep # Fast file search
    nodejs # JavaScript runtime
    python3 # Python interpreter
    clang # C/C++ compiler
    jdk # Java Development Kit
    glow # Terminal markdown renderer

    # LSP servers
    pyright # Python LSP
    clang-tools # Clangd (C/C++ LSP) and clang-format
    nixd # Nix LSP
    jdt-language-server # Java LSP

    # Formatters
    black # Python formatter
    google-java-format # Java formatter
    alejandra # Nix formatter
    stylua # Lua formatter
    nodePackages.prettier # JS/TS formatter
  ];
}
