{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # General Tools
    ripgrep # Fast search tool

    # C/C++ Development
    gcc # C/C++ compiler
    gdb # C/C++ debugger
    clang # Clang tools (C/C++ compiler and tools)
    clang-tools # clangd (C/C++), clang-format

    # Rust Development
    # rustc # Rust compiler
    # cargo # Rust package manager
    # rust-analyzer # Rust LSP
    # rustfmt # Rust formatter

    # Go Development
    # go # Go compiler
    # gopls # Go LSP

    # Java Development
    # jdk # Java Development Kit (optional)
    # jdt-language-server # Java LSP
    # google-java-format # Java formatter

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
    nixfmt-rfc-style

    # Web Development (JavaScript/TypeScript)
    # nodejs # Node.js for JS/TS (optional)
    nodePackages.prettier # Prettier (JS/HTML/CSS/Markdown)
    nodePackages.typescript-language-server # TypeScript/JS LSP
    nodePackages.vscode-langservers-extracted # HTML/CSS/JSON/ESLint

    # hyprland config
    hyprls
  ];
}
