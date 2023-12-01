#!/bin/bash
source ./lib.sh

removeVal 2 3
block=$(loopUntilVote)
echo "removeValidatorBlock: $block"

stop 2
stop 3

upgrade 2
upgrade 3
sleep 10

start 2
start 3

addVal 2 3
block=$(loopUntilVote)
echo "addValidatorBlock: $block"
