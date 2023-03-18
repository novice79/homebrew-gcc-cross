class Aarch64CtngLinuxMusl < Formula
  desc "aarch64 Linux MUSL Toolchain"
  homepage "https://github.com/novice79/homebrew-gcc-cross"
  version "1.0.0"

  depends_on "bash"
  depends_on "xz"
  on_linux do
    # or if OS.mac? and OS.linux?
    url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/aarch64-ctng-linux-musl-x86_64-linux.tar.xz"
    sha256 "efdeff8b459c6fad68623d47d36c7d4e079374501da260d4cf9ce60728de1438"
  end
  on_macos do
    if Hardware::CPU.arm?
      odie "Not support arm macos yet"
    else
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/aarch64-ctng-linux-musl-x86_64-macos.tar.xz"
      sha256 "7da7935155263f9504aec60f41e1371224758528b34fcf896db0787ec476b9a5"
    end
  end
  

  def install
    (prefix).install Dir["./*"]
    cd prefix do
      system "./init.sh"
    end
  end
end
