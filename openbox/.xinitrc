#!/bin/sh
#
# ~/.xinitrc.openbox
#
# Mateusz Loskot <mateusz@loskot.net>
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec ck-launch-session dbus-launch openbox-session
