{pkgs, ...}: {
  home.file.".config/kitty/kitty.conf".text = ''
    font_family      JetBrainsMono Nerd Font
    font_size        13.0
    # font_family          Fira Code Nerd Font
    # font_size            12.0
    enable_audio_bell    no
    window_padding_width 0
    background_opacity   0.9
    hide_window_decorations yes
    confirm_os_window_close 0

  '';
}