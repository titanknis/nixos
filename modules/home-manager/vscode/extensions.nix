{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode; # VSCode package
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      ms-python.black-formatter
      redhat.java
      esbenp.prettier-vscode
      pkief.material-icon-theme
      vscodevim.vim
      catppuccin.catppuccin-vsc

      #ms-vscode.cpptools   # this is fucking unfree :(
      ms-vscode.cpptools-extension-pack
      formulahendry.code-runner

      # Add more extensions here
    ];
  };
}
