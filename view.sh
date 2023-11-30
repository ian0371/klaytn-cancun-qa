#!/bin/bash
source ./lib.sh

target=$1
start=$2
end=$3

echo "* CN$((target + 1))"
echo "block,committeeSize,committedSealSize"

for i in $(seq $start $end); do
	output=$(getBlockWithConsensus $target $i)
	committeeSize=$(echo $output | jq '.committee | length')
	committedSealSize=$(kcn util decode-extra <(echo $output) | jq '.committedSealSize')
	echo "$i,$committeeSize,$committedSealSize"
done
