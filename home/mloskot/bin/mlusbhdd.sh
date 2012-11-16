#!/bin/sh
#
# usbhdd.sh - mount or umount external USB hard drive
#
DEV=$2
MNT=$3
function usage() {
    s=`basename $0`
    echo "Usage: ${s} <m|u> <device> <mount point>"
    exit 1
}
function mount() {
    echo "mount -o uid=mloskot,gid=users,fmask=113,dmask=002 $DEV $MNT"
    sudo mount -o uid=mloskot,gid=users,fmask=113,dmask=002 $DEV $MNT
}
function umount() {
    echo "umount $DEV"
    sudo umount $DEV
}
[[ $# -eq 0 ]] && usage
if [ "$1" = "m" ]; then
    mount
elif [ "$1"="u" ]; then
    umount
else
    usage
fi
