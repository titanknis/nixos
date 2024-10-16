{ pkgs, ... }:

{
  home.file.".config/kitty/kitty.conf".text = ''
    font_family          Fira Code
    font_size            9.0
    enable_audio_bell    no
    #window_padding_width 5
    background_opacity   0.9
    hide_window_decorations yes
    confirm_os_window_close 0
  '';
}

