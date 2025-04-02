{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # General Tools
    neovim # Neovim editor
    ripgrep # Fast search tool

    # C/C++ Development
    clang # Clang tools (C/C++ compiler and tools)
    clang-tools # clangd (C/C++), clang-format

    # Rust Development
    rustc # Rust compiler
    cargo # Rust package manager
    rust-analyzer # Rust LSP
    rustfmt # Rust formatter

    # Go Development
    go # Go compiler
    gopls # Go LSP

    # Java Development
    jdk # Java Development Kit (optional)
    jdt-language-server # Java LSP
    google-java-format # Java formatter

    # Python Development
    python3 # Python interpreter
    pyright # Python LSP
    black # Python formatter

    # Bash Development
    bash-language-server # Bash LSP
    shfmt # Shell formatter

    # Lua Development
    lua-language-server # Lua LSP
    stylua # Lua formatter

    # Nix Development
    nixd # Nix LSP
    alejandra # Nix formatter
    nixfmt # Nix formatter

    # Web Development (JavaScript/TypeScript)
    # nodejs # Node.js for JS/TS (optional)
    # nodePackages.typescript-language-server # TypeScript/JS LSP
    nodePackages.prettier # Prettier (JS/HTML/CSS/Markdown)
  ];
}
