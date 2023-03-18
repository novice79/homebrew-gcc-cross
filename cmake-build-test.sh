#!/usr/bin/env bash

set -e 
# prerequisite:
# brew tap novice79/gcc-cross
# brew install arm-ctng-linux-musleabihf ...

dir=_build/test

target=( 
    arm-ctng-linux-musleabihf
    armv7-ctng-linux-musleabihf
    aarch64-ctng-linux-musl
    x86_64-ctng-linux-musl
)
for i in "${target[@]}";do
    brew list $i &>/dev/null || continue
    tcf="$(brew --prefix $i)/toolchain.cmake"
    [ -f "$tcf" ] && echo "use cmake toolchain file: $tcf" || continue

    rm -rf "$dir"
    PREFIX="dist/$i"
    cmake -H"test" -B"$dir" \
    -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=$tcf \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$PREFIX"

    cmake --build $dir --config Release
    cmake --install $dir

    ls -lh $PREFIX
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "${GREEN}"
    file $PREFIX/main*
    printf "${NC}"
done
