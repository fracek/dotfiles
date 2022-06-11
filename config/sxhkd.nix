{ pkgs, ... }:

{
  enable = true;
  # keybindings from @tsjazil
  keybindings = {
    # Launch programs.
    "super + Return" = "${pkgs.alacritty}/bin/alacritty";
    "super + r" = "${pkgs.rofi}/bin/rofi -show drun";
    "super + shift + r" = "${pkgs.rofi}/bin/rofi -show run";
    "super + shift + m" = "${pkgs.rofi}/bin/rofi -show emoji -modi emoji -matching normal";
    "super + shift + v" = "${pkgs.rofi}/bin/rofi -show calc -modi calc";
    # Reload config.
    "super + ctrl + Escape" = "pkill -USR1 -x sxhkd";
    # BSPWM controls.
    "super + e : {h,j,k,l}" = "bspwm_resize expand {west,south,north,east} 50";
    "super + shift + e : {h,j,k,l}" = "bspwm_resize contract {west,south,north,east} 50";
    # close/reload wm
    "super + shift + {q,r}" = "bspc {quit,wm -r}";
    # close/kill window
    "super + {_,shift + }c" = "bspc node -{c,k}";
    # alternate layout
    "super + m" = "bspc desktop -l next";
    # send the newest marked node to the newest preselected node
    "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
    # swap the current node and the biggest window
    "super + g" = "bspc node -s biggest.window";
    # set window state
    "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
    # set node flag
    "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";
    # focus the node in the given direction
    "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";
    # focus the node for the given path jump
    "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";
    # focus the next/previous window in the current desktop
    "super + {_,shift + }q" = "bspc node -f {next,prev}.local.!hidden.window";
    # focus the next/previous desktop in the current monitor
    "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";
    # focus the last node/desktop
    "super + {grave,Tab}" = "bspc {node,desktop} -f last";
    # focus or send to the given desktop
    "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
    # preselect the direction
    "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
    # preselect the ratio
    "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";
    # cancel the preselection for the focused node
    "super + ctrl + space" = "bspc node -p cancel";
    # cancel the preselection for the focused desktop
    "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";
    # expand a window by moving one of its side outward
    "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
    # contract a window by moving one of its side inward
    "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
    # move a floating window
    "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
  };
}