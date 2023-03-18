class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7 Linux MUSL eabihf Toolchain"
  homepage "https://github.com/novice79/homebrew-gcc-cross"

  version "12.2.0"


  on_linux do
    # or if OS.mac? and OS.linux?
  end
  on_macos do
    if Hardware::CPU.arm?
      odie "Not support arm macos yet"
    else
      url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
      sha256 "68c6a53b4dbf6cba229efebe1d2768e087089291ac8cfb74b8cebca8ddd6bdfa"
    end
  end
  

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
