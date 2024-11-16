{
  config,
  lib,
  pkgs,
  ...
}: {
  # Other configuration...
  programs.git = {
    enable = true;
    config = {
      user.name = "titanknis";
      user.email = "titanknis@gmail.com";
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };

  # Enable Neovim
  programs.neovim.enable = true;
}
