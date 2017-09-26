#!/bin/bash

WM="${WM:-i3}"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# remap Caps Lock to Escape key
setxkbmap -option caps:escape

# Set dpi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Set dpi
xrandr --dpi 120

# Fix cursor
xsetroot -cursor_name left_ptr

# Disable touch screen
xinput disable 12

systemctl --user import-environment
systemctl --user start xorg.target

# Just kill the sleep to exit X11
sleep 365d

exit
