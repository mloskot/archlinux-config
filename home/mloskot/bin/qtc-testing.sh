#!/bin/sh
# Launches Qt Creator for plugins testing and debugging.
# This executable and arguments are also used in the Run Configuration
# of a plugin project.
source ${HOME}/bin/qt-dev-env.sh
XQTC=${QTC_GIT}/_build.testing
${XQTC}/bin/qtcreator -style gtk -color red -settingspath ${XQTC}/.config
