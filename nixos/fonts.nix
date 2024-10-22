{ config, lib, pkgs, ... }:

{
fonts.packages = with pkgs; [
  fira-code-nerdfont
  ];
}

