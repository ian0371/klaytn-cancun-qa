#!/bin/bash
source ./lib.sh

target=1

removeVal $target
removedBlock=$(loopUntilVote)
echo "removedBlock: $removedBlock"

upgrade $target
sleep 5

addVal $target
addedBlock=$(loopUntilVote)
echo "addedBlock: $addedBlock"
