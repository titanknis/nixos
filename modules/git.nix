{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    config = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      delta.line-numbers = true;
      merge.conflictStyle = "zdiff3";

      user.name = "titanknis";
      user.email = "titanknis@gmail.com";
      init.defaultBranch = "main";
    };
  };

  environment.systemPackages = with pkgs; [
    delta
  ];
}
