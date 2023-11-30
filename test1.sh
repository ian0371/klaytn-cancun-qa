#!/bin/bash
source ./lib.sh

target=1

removeVal $target
loopUntilCommitteeSize 8
removedBlock=$(getBlock)
echo "removedBlock: $removedBlock"

upgrade $target
sleep 5

addVal $target
loopUntilCommitteeSize 9
addedBlock=$(getBlock)
echo "addedBlock: $addedBlock"
