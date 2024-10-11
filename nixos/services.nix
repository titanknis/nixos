{ config, lib, pkgs, ... }:

{
  # Disable the OpenSSH daemon
  services.openssh.enable = false;
}
