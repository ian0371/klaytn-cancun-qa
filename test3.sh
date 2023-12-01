#!/bin/bash
source ./lib.sh

removeVal 2 3 4 5
removedBlock=$(loopUntilVote)
echo "removedBlock: $removedBlock"

upgrade 2 &
upgrade 3 &
upgrade 4 &
upgrade 5 &
sleep 10

addVal 2 3 4 5
addedBlock=$(loopUntilVote)
echo "addedBlock: $addedBlock"
