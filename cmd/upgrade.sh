#!/bin/bash

upgrade() {
    vals=$(ls -1d $ROOTDIR/output/cn* | wc -l)

    for i in $(seq 1 $vals); do
        pushd "$ROOTDIR/output/cn$i"
        cp `which kcn` "$ROOTDIR/kcnd" bin/
        cp "$HOMIOUTPUT/scripts/genesis.json" "$PWD/data"
        popd
    done
}
