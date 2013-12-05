#!/bin/sh
date > LOG
./configure -developer-build -opensource -nomake examples -nomake tests -confirm-license && \
make -j 4
date >> LOG
