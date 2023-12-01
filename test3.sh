#!/bin/bash
source ./lib.sh

removeVal 2 3 4 5
block=$(loopUntilVote)
echo "removeValidatorBlock: $block"

stop 2
stop 3
stop 4
stop 5

upgrade 2
upgrade 3
upgrade 4
upgrade 5
sleep 10

start 2
start 3
start 4
start 5

addVal 2 3 4 5
block=$(loopUntilVote)
echo "addValidatorBlock: $block"
