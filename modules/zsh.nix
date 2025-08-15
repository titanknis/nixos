{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.starship.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };
  users.defaultUserShell = pkgs.zsh;
}
