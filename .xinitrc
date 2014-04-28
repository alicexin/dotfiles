#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
#dropboxd
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#srdb ~/.Xresources &
xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
xbindkeys

sxhkd & 
#~/.config/bspwm/bspwmrc &
urxvt &
exec bspwm 

#exec awesome
