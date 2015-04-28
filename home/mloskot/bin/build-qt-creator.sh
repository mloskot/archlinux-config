#!/bin/sh
source ${HOME}/bin/qt-dev-env.sh
date > LOG
${QT5_GIT}/qtbase/bin/qmake -r ${QTC_GIT} && make -j4
date >> LOG
