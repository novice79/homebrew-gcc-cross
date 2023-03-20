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
      # odie "Not support arm macos yet"
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/aarch64-ctng-linux-musl-arm64-macos.tar.xz"
      sha256 "212be698936f77befb7d1bbd9b17475f74e3533093a0399d31abe45c2ef92f12"
    else
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/aarch64-ctng-linux-musl-x86_64-macos.tar.xz"
      sha256 "7da7935155263f9504aec60f41e1371224758528b34fcf896db0787ec476b9a5"
    end
  end
  resource "init" do
    url "https://raw.githubusercontent.com/novice79/homebrew-gcc-cross/master/init.sh"
    sha256 "a6d02f32ca044089b4630b02e935247a9627caf122ca8dc701b97391569e2815"
  end

  def install
    tc = (prefix/"tc")
    tc.install Dir["./*"]
    resource("init").stage { tc.install "init.sh" }
    cd tc do
      system "chmod", "+x", "./init.sh"
      system "./init.sh"
    end
    Dir.glob(tc/"bin/*") {|file| bin.install_symlink file}
    prefix.install_symlink tc/"toolchain.cmake"
    prefix.install_symlink tc/"meson_cross.txt"
    prefix.install_symlink tc/"env.sh"
  end
end
