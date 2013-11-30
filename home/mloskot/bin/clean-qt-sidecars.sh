#!/bin/sh
find . -name '*.qtcreator.*' -o -name '*.user*'|xargs rm
