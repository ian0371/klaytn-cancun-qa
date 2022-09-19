#!/bin/bash

do_setup() {
    idx=$1
    mkdir -p conf data bin
    cp "$ROOTDIR/homi-output/scripts/genesis.json" .
    cp "$ROOTDIR/homi-output/scripts/static-nodes.json" .
    cp `which kcn` "$ROOTDIR/kcnd" bin/
    KEY="$ROOTDIR/homi-output/keys/validator$idx"
    DATA_DIR="$PWD/data"
    kcn --datadir "$DATA_DIR" init "$PWD/genesis.json"
    echo NETWORK= >> conf/kcnd.conf
    echo DATA_DIR=$DATA_DIR >> conf/kcnd.conf
    echo LOG_DIR=$DATA_DIR/log >> conf/kcnd.conf
    echo RPC_ENABLE=1 >> conf/kcnd.conf
    echo RPC_API=db,eth,klay,net,web3,miner,personal,txpool,debug,admin,istanbul,mainbridge,subbridge,governance >> conf/kcnd.conf
    echo NETWORK_ID=2018 >> conf/kcnd.conf
    echo NO_DISCOVER=1 >> conf/kcnd.conf
    ADDITIONAL=""
    ADDITIONAL="$ADDITIONAL --identity CN-$idx"
    ADDITIONAL="$ADDITIONAL --nodekeyhex $(cat $KEY | jq '.Nodekey')"
    ADDITIONAL="$ADDITIONAL --debug --metrics"
    ADDITIONAL="$ADDITIONAL --port $((idx+32323))"
    ADDITIONAL="$ADDITIONAL --rpcport $((idx+8551))"
    echo ADDITIONAL=\"$ADDITIONAL\" >> conf/kcnd.conf
    echo REWARDBASE=$(cat $KEY | jq '.Address') >> conf/kcnd.conf
}

setup() {
    vals=$(ls -1 $ROOTDIR/homi-output/keys/nodekey* | wc -l)

    mkdir "$ROOTDIR/output"
    pushd "$ROOTDIR/output"

    for i in $(seq 1 $vals); do
        mkdir cn$i
        pushd cn$i
        do_setup $i
        popd
    done

    popd
}