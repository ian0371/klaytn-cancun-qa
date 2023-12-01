#!/bin/bash
source ./lib.sh

block=$(getBlock)
echo "Upgrade start", $block

stop 2
stop 3
stop 4
stop 5
stop 6

upgrade 2
#upgrade 3 => skip
upgrade 4
upgrade 5
upgrade 6
sleep 10

start 2
sleep 2

start 3
sleep 2

start 4
sleep 2

start 5
sleep 2

start 6
sleep 2

block=$(getBlock)
echo "Upgrade end", $block
