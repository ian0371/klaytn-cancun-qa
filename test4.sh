#!/bin/bash
source ./lib.sh

block=$(getBlock)
echo "Upgrade start", $block

stop 2
stop 3
stop 4
stop 5

upgrade 2
upgrade 3
upgrade 4
upgrade 5
sleep 10

start 2
sleep 2

start 3
sleep 2

start 4
sleep 2

start 5
sleep 2

block=$(getBlock)
echo "Upgrade end", $block
