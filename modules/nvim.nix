{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    # General Tools
    ripgrep # Fast search tool
    # texliveMedium
    texliveFull # latex compiler for vimtex plugin
    texlab
    zathura
    tree-sitter

    # C/C++ Development
    gcc # C/C++ compiler
    gdb # C/C++ debugger
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
    maven
    gradle
    jdt-language-server # Java LSP
    google-java-format # Java formatter

    # Flutter/Dart Development
    # flutter

    # Python Development
    (python3.withPackages (ps: [
      ps.debugpy # Python Debugger
      ps.pytest # Python Tester
    ])) # Python interpreter
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
    nixfmt

    # Web Development (JavaScript/TypeScript)
    nodejs # Node.js for JS/TS (optional)
    prettier
    typescript-language-server
    vscode-langservers-extracted

    # SQL
    sql-formatter

    # hyprland config
    hyprls

    # UML
    imagemagick
    plantuml
    mermaid-cli
    kitty
  ];
}
