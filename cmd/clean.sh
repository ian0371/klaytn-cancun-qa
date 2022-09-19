#!/bin/bash

clean() {
    if pgrep -q kcn; then
        echo "kcn is running"
        exit 1
    fi
    rm -rf "$ROOTDIR/output"
}
