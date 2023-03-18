class Aarch64CtngLinuxMusl < Formula
  desc "aarch64 Linux MUSL Toolchain"
  homepage "https://github.com/novice79/homebrew-gcc-cross"
  url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v11.2.0/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
  sha256 "0b75eddd0c59f678a8db198b57b87891220ffe9d6224196fdbcf6eab0b4e8a22"
  version "12.2.0"


  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
