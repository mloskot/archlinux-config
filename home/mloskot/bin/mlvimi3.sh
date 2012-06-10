#!/bin/sh
if [ -z $DISPLAY ]; then
    vim ${HOME}/.config/i3/config
else
    gvim ${HOME}/.config/i3/config
fi
