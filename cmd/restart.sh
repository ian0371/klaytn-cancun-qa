#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/start.sh"
. "$DIR/stop.sh"
. "$DIR/clean.sh"
. "$DIR/setup.sh"

restart() {
    stop
    clean
    setup
    start
}
