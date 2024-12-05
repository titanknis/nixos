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
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono" # Covers JetBrains-Mono-Nerd-Font-Complete
        "Iosevka" # Covers Iosevka-Nerd-Font-Complete
      ];
    })
    inter
    # google-fonts
  ];
}
