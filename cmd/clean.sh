#!/bin/bash

clean() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if pgrep -q kcn; then
            echo "kcn is running"
            exit 1
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if pgrep -x kcn > /dev/null; then
            echo "kcn is running"
            exit 1
        fi
    fi
    rm -rf "$ROOTDIR/output"
}
