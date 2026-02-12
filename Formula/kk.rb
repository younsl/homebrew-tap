class Kk < Formula
  desc "Fast domain connectivity checker"
  homepage "https://github.com/younsl/o/tree/main/box/tools/kk"
  version "0.1.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{kk/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/kk/#{version}/kk-darwin-arm64.tar.gz"
      sha256 "71fbc9a0f8a3c33b7af7dc6bbca1b7b51f5b552babd8ee94114f1cbea7863c86"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kk/#{version}/kk-darwin-amd64.tar.gz"
      sha256 "69f237186ef9da5bf5128dd147fbd1057558af1b2c0661b55266fd72465f0677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/kk/#{version}/kk-linux-arm64.tar.gz"
      sha256 "452b1b605c2123d14f952e7926b274d461e042aca49770b78f9c93723c9886d0"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kk/#{version}/kk-linux-amd64.tar.gz"
      sha256 "7e7d142c035c934e09c608532a3853014d9a293a3c6c509c4d9ce5ab1b57ef6e"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "kk-#{os}-#{cpu}" => "kk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kk --version")
  end
end
