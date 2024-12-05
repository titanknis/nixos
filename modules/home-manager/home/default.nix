{pkgs, ...}: {
  home.file.".bashrc".source = ./.bashrc;
  home.file.".zshrc".source = ./.zshrc;
  home.file.".aliases".source = ./.aliases;
  home.file.".tmux.conf".source = ./.tmux.conf;
  # home.file.".zprofile".source = ./.zprofile;
}
