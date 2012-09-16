#!/bin/bash
#
# make and colormake selector
#

colormake $* || make $* || {
    echo >&2 "*** Neither colormake nor make found. Aborting.";
    exit 1;
}
