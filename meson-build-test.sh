#!/usr/bin/env bash

set -e
# prerequisite:
# brew tap novice79/gcc-cross
# brew install x86_64-ctng-linux-musl ...

dir=_build/test
target=( 
    arm-ctng-linux-musleabihf
    armv7-ctng-linux-musleabihf
    aarch64-ctng-linux-musl
    x86_64-ctng-linux-musl
)
for i in "${target[@]}";do
    brew list $i &>/dev/null || continue
    mcf="$(brew --prefix $i)/meson_cross.txt"
    [ -f "$mcf" ] && echo "use meson cross file: $mcf" || continue
    rm -rf "$dir"
    PREFIX="$PWD/dist/$i"
    meson setup $dir test \
    --prefix $PREFIX \
    --cross-file $mcf \
    --buildtype release
    meson compile -C $dir
    meson install -C $dir

    ls -lh $PREFIX
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    printf "${GREEN}"
    file $PREFIX/main*
    printf "${NC}"
done



