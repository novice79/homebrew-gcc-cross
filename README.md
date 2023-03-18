# Crosstool-NG build gcc musl toolchain

Forked from [homebrew-macos-cross-toolchains](https://github.com/messense/homebrew-macos-cross-toolchains.git),  
strip what I not need for now, and bump gcc version to 12.2

Remains:

- arm-ctng-linux-musleabihf
- armv7-ctng-linux-musleabihf
- aarch64-ctng-linux-musl
- x86_64-ctng-linux-musl


# Install using Homebrew(on x86_64 macos or linux)

```bash
brew tap novice79/gcc-cross

brew install arm-ctng-linux-musleabihf
brew install armv7-ctng-linux-musleabihf
brew install x86_64-ctng-linux-musl
brew install aarch64-ctng-linux-musl

```

# Usage

    armv7-ctng-linux-musleabihf-cc -static main.c -o main
    armv7-ctng-linux-musleabihf-c++ -static main.cpp -o main
    ...

Cmake/Meson cross build example in *test/* folder  
[cmake-build-test.sh](cmake-build-test.sh)   
[meson-build-test.sh](meson-build-test.sh)   