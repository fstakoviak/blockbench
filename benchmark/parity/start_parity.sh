#!/bin/bash
CHAIN_DATA=$1
KEYS=$CHAIN_DATA/keys/PoA
HOST=$2
PORT=$3
LOGS=$4
PARITY=$5
IDX=$6
cd `dirname ${BASH_SOURCE-$0}`

# remove chain data
rm -rf $CHAIN_DATA
mkdir -p $KEYS
mkdir -p $LOGS
# copy keys
cp keys/key* $KEYS/

nohup ${PARITY} --config config.toml.$IDX --rpcport $PORT --rpcaddr $HOST > $LOGS/log 2>&1 & 
