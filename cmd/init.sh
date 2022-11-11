#!/bin/bash

init() {
    vals=$(ls -1d $ROOTDIR/output/cn* | wc -l)

    for i in $(seq 1 $vals); do
        pushd "$ROOTDIR/output/cn$i"
        DATA_DIR="$PWD/data"
        kcn --datadir "$DATA_DIR" init "$DATA_DIR/genesis.json"
        popd
    done
}
