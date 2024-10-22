{ pkgs, ... }:

{
  home.file.".config/ranger/rc.conf".source = ./ranger/rc.conf;
  home.file.".config/ranger/scope.sh".source = ./ranger/scope.sh;
}

