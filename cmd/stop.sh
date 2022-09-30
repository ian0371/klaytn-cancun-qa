#!/bin/bash

stop() {
    vals=$(ls -1d $ROOTDIR/output/cn* | wc -l)

    for i in $(seq 1 $vals); do
        pushd "$ROOTDIR/output/cn$i"
        bin/kcnd stop
        popd
    done
}
