#!/bin/bash
source ./lib.sh

removeVal 2
removedBlock=$(loopUntilVote)
echo "removedBlock: $removedBlock"

upgrade 2
sleep 5

addVal 2
addedBlock=$(loopUntilVote)
echo "addedBlock: $addedBlock"

for i in $(seq 1 10); do
	echo "CN$i"
	./test1.sh $i $removedBlock $addedBlock
done
