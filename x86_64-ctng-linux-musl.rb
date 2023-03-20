class X8664CtngLinuxMusl < Formula
  desc "x86_64 Linux MUSL Toolchain"
  homepage "https://github.com/novice79/homebrew-gcc-cross"
  version "1.0.0"

  depends_on "bash"
  depends_on "xz"
  on_linux do
    # or if OS.mac? and OS.linux?
    url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/x86_64-ctng-linux-musl-x86_64-linux.tar.xz"
    sha256 "7e835d705a0258c9ef04d234f6e9ce6eb56c019c503a5cee3cc1b33c5e224e41"
  end
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/x86_64-ctng-linux-musl-arm64-macos.tar.xz"
      sha256 "810d2dd077059e11f03a69c25bf3ffc583bf68b91d9456750a8f1c970f918281"
    else
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/x86_64-ctng-linux-musl-x86_64-macos.tar.xz"
      sha256 "7dcc448a12b41423be5d0ed1a2f1eea4c1f2b1fd0c9d6ac50f7ba18fb1535d19"
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
