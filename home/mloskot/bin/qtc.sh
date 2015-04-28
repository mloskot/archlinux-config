#!/bin/sh
# Launches Qt Creator for regular use as IDE
source ${HOME}/bin/qt-dev-env.sh
XQTC=${QTC_GIT}/_build
${XQTC}/bin/qtcreator -style gtk
