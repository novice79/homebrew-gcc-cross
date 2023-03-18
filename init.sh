#!/usr/bin/env bash

target=$(ls | grep ctng)
# IFS='-' read -ra t <<< "$target"
t=(${target//-/ })
# echo ${t[@]} 
# [[ -z $target ]] && exit 1
BIN="$PWD/bin"
cat > $PWD/toolchain.cmake <<-EOF
set(CMAKE_SYSTEM_NAME ${t[2]})
set(CMAKE_SYSTEM_PROCESSOR ${t[0]%v7})

set(CMAKE_C_COMPILER \${CMAKE_CURRENT_LIST_DIR}/bin/${target}-gcc)
set(CMAKE_CXX_COMPILER \${CMAKE_CURRENT_LIST_DIR}/bin/${target}-g++)
set(CMAKE_AR \${CMAKE_CURRENT_LIST_DIR}/bin/${target}-ar)
set(CMAKE_STRIP \${CMAKE_CURRENT_LIST_DIR}/bin/${target}-strip)
set(CMAKE_EXE_LINKER_FLAGS "-static -s")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
EOF

cat > "$PWD/meson_cross.txt" <<-EOF
[binaries]
c = '$BIN/${target}-gcc'
cpp = '$BIN/${target}-g++'
ld = '$BIN/${target}-ld'
ar = '$BIN/${target}-ar'
objcopy = '$BIN/${target}-objcopy'
strip = '$BIN/${target}-strip'

[host_machine]
system = '${t[2]}'
cpu_family = '${t[0]%v7}'
cpu = '${t[0]}'
endian = 'little'
EOF

cat > "$PWD/env.sh" <<-EOF
CC="$BIN/${target}-gcc"
CXX="$BIN/${target}-g++"
AR="$BIN/${target}-ar"
AS="$BIN/${target}-as"
STRIP="$BIN/${target}-strip"
RANLIB="$BIN/${target}-runlib"
LD="$BIN/${target}-ld"
objdump="$BIN/${target}-objdump"

HOST=$target
export PATH="$BIN:$PATH"
EOF