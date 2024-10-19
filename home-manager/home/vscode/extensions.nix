{ pkgs, ... }:

{
  # Allow unfree packages
  #nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;  # VSCode package
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      ms-python.black-formatter
      redhat.java
      esbenp.prettier-vscode
      pkief.material-icon-theme
      vscodevim.vim
      #ms-vscode.cpptools   # this is fucking unfree :(

      # Add more extensions here
    ];
  };
}


