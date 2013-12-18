#!/bin/sh
# Launches Qt Creator for plugins testing and debugging.
# This executable and arguments are also used in the Run Configuration
# of a plugin project.
XQTC=$HOME/dev/qt/_git/qt-creator/_build.testing
${XQTC}/bin/qtcreator -style gtk -color red -settingspath ${XQTC}/.config
