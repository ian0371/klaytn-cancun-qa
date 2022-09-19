#!/bin/bash

vals=$(ls -1 homi-output/keys/nodekey* | wc -l)

for i in $(seq 0 $((vals-1))); do
    pushd cn$i
    cp `which kcn` bin/
    popd
done
