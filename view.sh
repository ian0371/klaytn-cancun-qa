#!/bin/bash

getBlockWithConsensus() {
	local cn=$1
	local blocknum=$2
	local fn="block-${blocknum}-from-cn$cn.json"
	cast rpc klay_getBlockWithConsensusInfoByNumber $blocknum -r http://localhost:$((8551 + $cn - 1))
	# echo "[cn$cn] $blocknum"
	# echo "committeeSize=$(echo $output | jq '.committee | length')"
	# echo "committedSealSize=$(kcn util decode-extra <(echo $output) | jq ".committedSealSize")"
}

cn=$1
start=$2
end=$3

echo "* CN$cn"
echo "block,committedSealSize,timestamp"

for i in $(seq $start $end); do
	output=$(getBlockWithConsensus $cn $i)
	# committeeSize=$(echo $output | jq '.committee | length')
	ts=$(echo $output | jq '.timestamp' | xargs printf "%d")
	committedSealSize=$(kcn util decode-extra <(echo $output) | jq '.committedSealSize')
	echo "$i,$committedSealSize,$ts"
done

# for i in $(seq 1 9); do echo "$i $(output/cn$i/bin/kcn version)"; done
