{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # neomutt
    #
    # mutt-wizard
    # isync
    # msmtp
    # (pass.withExtensions (ext: [ ext.pass-otp ]))
    # notmuch
    # abook
    #
    # lynx
  ];
}
