{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
