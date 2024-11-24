{pkgs, ...}: {
  home.file.".bashrc".source = ./.bashrc;
  home.file.".zshrc".source = ./.zshrc;
  home.file.".aliases".source = ./.aliases;
  home.file.".symlinks".source = ./.symlinks;
  home.file.".tmux.conf".source = ./.tmux.conf;

  imports = [
    #./hyprland
    #./rofi
    #./waybar
    #./mako
    #./swaylock
    #./swww
    #./plasma

    ./kitty
    ./nvim
    ./vscode
    ./ranger
  ];
}
