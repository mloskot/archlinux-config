#!/bin/sh
#
# mlscreenshot.sh - takes screenshot, nicely integrates with i3wm
#
# Uses:
# - scrot - simple screenshot utility
# - viewnior - lightweight and fast image viewer
#
# Originally based on screenshot.sh by Radek (at) fastlinux (dot) eu
#
# Take screenshot to specified directory in user home
# directory and show it thrue image editor
# Modified: 28.10.2011 : mseed : http://www.fastlinux.eu
#
SHOTER=`which scrot`
VIEWER=`which viewnior`
SAVETO="${HOME}/tmp"

if [ ! -x "${SHOTER}" ]; then
    echo "${SHOTER} is missing"
    exit 1
fi

if [ ! -x "${VIEWER}" ]; then
    echo "${VIEWER} is missing"
    exit 1
fi

if [ ! -d "${SAVETO}" ] ; then
    mkdir ${SAVETO}
fi

# scrot expression used below:
# $f image path/filename (ignored when used in the filename)
${SHOTER} "screenshot-%Y%m%d%H%M%S.png" -e 'mv $f '$SAVETO'/; '$VIEWER' '$SAVETO'/$f'
