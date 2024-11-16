{pkgs, ...}: {
  home.file.".bashrc".source = ./.bashrc;
  home.file.".zshrc".source = ./.zshrc;
  home.file.".aliases".source = ./.aliases;
  home.file.".symlinks".source = ./.symlinks;

  imports = [
    #./hyprland
    #./dolphin
    #./plasma

    ./kitty
    ./nvim
    ./vscode
    ./ranger
  ];
}
