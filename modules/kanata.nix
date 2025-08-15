{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        config = ''
          (defsrc
            esc     f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            grv     1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab     q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps    a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft    z    x    c    v    b    n    m    ,    .    /    rsft
            lctl    lmet lalt           spc            ralt rmet cmp  rctl
          )

          (defalias
           ext  (layer-toggle extend)
          )

          (deflayer base 
            esc     f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            grv     1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab     q    w    e    r    t    y    u    i    o    p    [    ]    \
            @ext    a    s    d    f   g    h     j    k    l    ;   '    ret
            lsft    z    x    c    v    b    n    m    ,    .    /    rsft
            lctl    lmet lalt           spc            ralt rmet cmp  rctl
          )

          (deflayer extend
            _        _    _    _    _    _    _    _    _    _    _    _    _
            _        f1   f2   f3   f4   f5   f6   f7   f8   f9  f10   f11  f12  _
            _        esc  _    _    _    ins  pgup home up   end  menu prnt slck _
            _        lalt lmet lsft lctl ralt pgdn lft  down rght del  caps _
            _        _    _    tab  _    _    pgdn bks  lsft lctl comp _
            _        _    _              ret            _    _    _    _
          )

        '';
      };
    };
  };
}
