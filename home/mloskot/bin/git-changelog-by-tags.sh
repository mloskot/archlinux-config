#!/bin/bash
# Author:Andrey Nikishaev, Gunnar Lindholm
# http://stackoverflow.com/a/9884424/151641
echo "CHANGELOG"
echo ----------------------
git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags |tac |grep -v '^$' | while read TAG ; do
     echo
    if [ $NEXT ];then
        echo [$NEXT]
    else
        echo "[Current]"
    fi
    GIT_PAGER=cat git log --no-merges --format=" * %s" $TAG..$NEXT
    NEXT=$TAG
done
FIRST=$(git tag -l | head -1)
echo
echo [$FIRST]
GIT_PAGER=cat git log --no-merges --format=" * %s" $FIRST
