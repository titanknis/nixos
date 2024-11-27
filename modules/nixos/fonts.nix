{
  config,
  lib,
  pkgs,
  ...
}: {
  # fonts.packages = with pkgs; [
  #   fira-code-nerdfont
  # ];
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
}
