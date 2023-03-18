class ArmCtngLinuxMusleabihf < Formula
  desc "arm Linux MUSL eabihf Toolchain"
  homepage "https://github.com/novice79/homebrew-gcc-cross"
  version "1.0.0"

  depends_on "bash"
  depends_on "xz"
  on_linux do
    # or if OS.mac? and OS.linux?
    url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/arm-ctng-linux-musleabihf-x86_64-linux.tar.xz"
    sha256 "6145ce1f75150b97b59358944a0036b96af1af452453d9b8a021c8877a6400f1"
  end
  on_macos do
    if Hardware::CPU.arm?
      odie "Not support arm macos yet"
    else
      url "https://github.com/novice79/homebrew-gcc-cross/releases/download/v1.0.0/arm-ctng-linux-musleabihf-x86_64-macos.tar.xz"
      sha256 "7e99c77da88e25cfc2005d5fcb2366c6ea3831a34b56c1fc6e2f13481296d245"
    end
  end
  

  def install
    (prefix).install Dir["./*"]
    cd prefix do
      system "./init.sh"
    end
  end
end
