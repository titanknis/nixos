{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;  # VSCode package
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.black-formatter
      redhat.java
      esbenp.prettier-vscode
      pkief.material-icon-theme
      ms-vscode.cpptools   # this is fucking unfree :(

      # Add more extensions here
    ];
  };

#  home.file.".vscode/extensions.json".text = ''
#{
#  "recommendations": [
#    "ms-python.python",
#    "ms-vscode.cpptools"
#  ]
#}
#'';

}


