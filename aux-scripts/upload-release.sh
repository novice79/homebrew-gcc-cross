#!/usr/bin/env bash

dir=$PWD

for i in /Volumes/usb4t/gcc-release/*.xz; do
   gh release delete-asset v1.0.0 ${i##*/} -y
   echo "upload ${i##*/}"
   gh release upload v1.0.0 $i
   cat "$i.sha256"
done
