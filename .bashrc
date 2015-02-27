#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Runs X at startup
[[ $TTY == "/dev/tty1" ]] && exec startx

# PATH
PATH=$PATH:~/.bin
PATH=$PATH:~/.config/bspwm/panel

# Transparency
[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

export TERM=xterm
