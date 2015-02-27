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

 export PATH=$PATH:/home/alice/.cabal/bin

export WINEPREFIX=~/.wine
export WINEARCH=win32

#dropboxd
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#srdb ~/.Xresources &
xsetroot -cursor_name left_ptr
xset +fp /usr/share/fonts/local
xbindkeys
easystroke &
dropboxd &
#sxhkd & 
#~/.config/bspwm/bspwmrc &
#urxvt &
#syndaemon -t -k -i 1 &
#exec bspwm 

source ~/.bashrc
exec awesome
