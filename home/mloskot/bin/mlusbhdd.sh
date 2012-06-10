#!/bin/sh
#
# usbhdd.sh - mount or umount external USB hard drive
#
CMD=$1
DEV=$2
MNT=$3
function usage() {
    s=`basename $0`
    echo "Usage: ${s} <mount|umount> <device> <mount point>"
    exit 1
}
function mount() {
    echo "$CMD -o uid=mloskot,gid=users,fmask=113,dmask=002 $DEV $MNT"
    sudo $CMD -o uid=mloskot,gid=users,fmask=113,dmask=002 $DEV $MNT
}
function umount() {
    echo "$CMD $DEV"
    sudo $CMD $DEV
}
[[ $# -eq 0 ]] && usage
if [ "$1" = "mount" ]; then
    mount
elif [ "$1"="umount" ]; then
    umount
else
    usage
fi
