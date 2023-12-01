#!/bin/bash
source ./lib.sh

removeVal 2 3
removedBlock=$(loopUntilVote)
echo "removedBlock: $removedBlock"

upgrade 2 &
upgrade 3 &
sleep 10

addVal 2 3
addedBlock=$(loopUntilVote)
echo "addedBlock: $addedBlock"
