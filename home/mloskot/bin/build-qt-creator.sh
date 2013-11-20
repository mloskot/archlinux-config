#!/bin/sh
date > LOG
$HOME/dev/qt/_git/qt5/qtbase/bin/qmake -r $HOME/dev/qt/_git/qt-creator && make -j4
date >> LOG
