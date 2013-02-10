#!/bin/sh
#
# mlsfshell.sh - connect to SF.net shell for given project
#
function usage() {
    s=`basename $0`
    echo "Usage: ${s} <project>"
    exit 1
}
[[ $# -eq 0 ]] && usage
[[ -z ${1} ]] && usage
SSF="shell.sourceforge.net"
USR=mloskot
echo "Connecting to ${1} at ${SSF} as ${USR}"
ssh -t mloskot,${1}@${SSF} create
