#!/bin/bash
source ./lib.sh

removeVal 2
block=$(loopUntilVote)
echo "removeValidatorBlock: $block"

stop 2

upgrade 2
sleep 10

start 2

addVal 2
block=$(loopUntilVote)
echo "addValidatorBlock: $block"
