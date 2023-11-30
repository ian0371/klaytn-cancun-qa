#!/bin/bash

ROOTDIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
RPC=http://localhost:8551

declare -a nodes=(
	"0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
	"0x70997970C51812dc3A010C7d01b50e0d17dc79C8"
	"0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC"
	"0x90F79bf6EB2c4f870365E785982E1f101E93b906"
	"0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65"
	"0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc"
	"0x976EA74026E726554dB657fA54763abd0C3a0aa9"
	"0x14dC79964da2C08b23698B3D3cc7Ca32193d9955"
	"0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f"
	"0xa0Ee7A142d267C1f36714E4a8F75612F20a79720"
)

loopUntilCommitteeSize() {
	# length of the rpc output from jq
	#
	while true; do
		if [ $1 -ne $(cast rpc klay_getCommittee -r $RPC | jq '. | length') ]; then
			sleep 1
		else
			break
		fi
	done
}

getBlock() {
	cast rpc klay_getBlockByNumber "latest" false -r $RPC | jq -r '.number' | xargs printf "%d"
}

upgrade() {
	pushd "$ROOTDIR/output/cn$(($1 + 1))" >/dev/null
	bin/kcnd stop >/dev/null
	rm -f bin/kcn
	ln -s $ROOTDIR/kcn-v1.12.0 bin/kcn
	bin/kcnd start >/dev/null
	popd >/dev/null
}

addVal() {
	cast rpc governance_vote governance.addvalidator ${nodes[$1]} -r $RPC
}

removeVal() {
	cast rpc governance_vote governance.removevalidator ${nodes[$1]} -r $RPC
}

getBlockWithConsensus() {
	local cn=$(($1 + 1))
	local blocknum=$2
	local fn="block-${blocknum}-from-cn$cn.json"
	cast rpc klay_getBlockWithConsensusInfoByNumber $blocknum -r http://localhost:$((8551 + cn - 1))
	# echo "[cn$cn] $blocknum"
	# echo "committeeSize=$(echo $output | jq '.committee | length')"
	# echo "committedSealSize=$(kcn util decode-extra <(echo $output) | jq ".committedSealSize")"
}