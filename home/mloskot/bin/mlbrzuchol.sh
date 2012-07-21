#!/bin/bash
#
# mlbrzuchol.sh - mounts sshfs directory from brzuchol server
#
# fstab-enabled
MOUNT_POINT=/mnt/brzuchol/mloskot
mount ${MOUNT_POINT} && mc ${HOME} ${MOUNT_POINT} && fusermount -u ${MOUNT_POINT}
