#!/bin/sh
#
# ~/.xinitrc.i3
#
# Mateusz Loskot <mateusz@loskot.net>
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Disable DPMS turning off the screen
xset -dpms
xset s off

# Make the beep quieter, shorter, and a nicer pitch. I tend to set 440 Hz, 50ms
#xset b 50 440 50
# Disable bell
#xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap -option terminate:ctrl_alt_bksp pl

# Enforce correct locales from the beginning
unset LC_COLLATE

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

# Set background color or wallpaper
if type feh >/dev/null 2>&1; then
    sh ~/.fehbg &
else
    xsetroot -solid "#333333"
fi

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Start the VirtualBox X Window System guest services
VBoxClient-all &

# Start i3 and log
I3_CONFIG_HOME=${HOME}/.config/i3
# Uncomment to log debugging info
#LOGFILE=${I3_CONFIG_HOME}/log-$(date +'%F-%k-%M-%S')
if [ ! -z "$LOGFILE" ]; then
   echo "i3 starting at $(date)" > ${LOGFILE}
   exec /usr/bin/i3 -V -d all >> ${LOGFILE}
   echo "i3 started at $(date)" > ${LOGFILE}
else
   exec /usr/bin/i3
fi
