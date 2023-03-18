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
  

  def install
    (prefix).install Dir["./*"]
    cd prefix do
      system "./init.sh"
    end
  end
end
