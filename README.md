# Crosstool-NG build gcc musl toolchain

Forked from [homebrew-macos-cross-toolchains](https://github.com/messense/homebrew-macos-cross-toolchains.git), strip what I not need for now, and bump gcc version to 12.2

Remains:

- arm-ctng-linux-musleabihf
- armv7-ctng-linux-musleabihf
- aarch64-ctng-linux-musl
- x86_64-ctng-linux-musl

Or install using Homebrew:

```bash
brew tap novice79/gcc-cross
brew install x86_64-ctng-linux-musl
brew install aarch64-ctng-linux-musl
...
```

