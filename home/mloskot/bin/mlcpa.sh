#!/bin/sh
# BROKEN - SRC/DST DIRs SEEMS MESSED
CMD=`which parallel`
if [ ! -x "$CMD" ]; then
    echo "parallel not found"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1 does not exist"
    exit 1
fi

"$CMD" --no-notice -j4 cp -a {} "$1/*" ::: "$2"
