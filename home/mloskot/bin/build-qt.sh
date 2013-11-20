#!/bin/sh
./configure -developer-build -opensource -nomake examples -nomake tests \
    -confirm-license && \
make -j 4
