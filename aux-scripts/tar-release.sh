#!/usr/bin/env bash
toDir=/Volumes/usb4t/gcc-release
mkdir -p $toDir
platform=( 
    gcc-x86_64-linux
    gcc-x86_64-macos
)
for i in "${platform[@]}";do
    cd "/Volumes/usb4t/$i" && echo $PWD
    target=( 
        aarch64-ctng-linux-musl
        arm-ctng-linux-musleabihf
        armv7-ctng-linux-musleabihf
        x86_64-ctng-linux-musl
    )
    for j in "${target[@]}";do
        # zip="$toDir/$j${i#gcc}.tgz"
        # # tar zcf "$zip" $j
        # tar c $j | gzip --best > "$zip"
        # openssl dgst -sha256 "$zip" | awk '{print $2}' | tee "$zip.sha256"

        # try xz
        zip="$toDir/$j${i#gcc}.tar.xz"
        # tar cfJ "$zip" $j
        tar c $j | xz -9 > "$zip"
        sha256sum "$zip" | tee >(awk '{print $1}' > "$zip.sha256")
    done
done