#!/usr/bin/env bash
set -e

DIR=$( cd ${0%/*} && pwd -P )
declare -a tools=(
    arm-ctng-linux-musleabihf 
    armv7-ctng-linux-musleabihf 
    aarch64-ctng-linux-musl 
    x86_64-ctng-linux-musl 
)
# sysctl -n hw.physicalcpu or $(sysctl -n hw.ncpu)
# hash nproc 2>/dev/null || alias nproc="sysctl -n hw.logicalcpu"
[[ $OSTYPE == 'darwin'* ]] && cores=$(sysctl -n hw.logicalcpu) || cores=`nproc`
for i in "${tools[@]}"; do
    # echo $i
    cd "$DIR/$i"
    ct-ng build -j $(($cores - 1))
done