#!/bin/bash
source ./lib.sh

target1=1 # CN2
target2=2 # CN3

removeVal $target1 $target2
removedBlock=$(loopUntilVote)
echo "removedBlock: $removedBlock"

upgrade $target1
upgrade $target2
sleep 5

addVal $target1 $target2
addedBlock=$(loopUntilVote)
echo "addedBlock: $addedBlock"
