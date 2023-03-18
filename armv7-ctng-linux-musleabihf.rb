class Armv7CtngLinuxMusleabihf < Formula
  desc "armv7 Linux MUSL eabihf Toolchain"
  homepage "https://github.com/novice79/homebrew-gcc-cross"
  version "1.0.0"

  depends_on "bash"
  depends_on "xz"
  on_linux do
    # or if OS.mac? and OS.linux?
    url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/armv7-ctng-linux-musleabihf-x86_64-linux.tar.xz"
    sha256 "59e09faa41a9b82a220e7843f9c7c398316b3f86951585f43d418ace042e71c3"
  end
  on_macos do
    if Hardware::CPU.arm?
      odie "Not support arm macos yet"
    else
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/armv7-ctng-linux-musleabihf-x86_64-macos.tar.xz"
      sha256 "b243f984d903c7214a89bd07935d92300ae8751efaeba0b7fe397fbc4a0019ab"
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
