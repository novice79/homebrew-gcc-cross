#!/bin/sh

DIR=$( cd ${0%/*} && pwd -P )
declare -a tools=(
    arm-ctng-linux-musleabihf 
    armv7-ctng-linux-musleabihf 
    aarch64-ctng-linux-musl 
    x86_64-ctng-linux-musl 
)
for i in "${tools[@]}"; do
    # echo $i
    cd "$DIR/$i"
    ct-ng build -j $(($(nproc) - 1))
done