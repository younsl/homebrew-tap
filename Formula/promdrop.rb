class Promdrop < Formula
  desc "Prometheus metric filter configuration generator"
  homepage "https://github.com/younsl/o/tree/main/box/kubernetes/promdrop"
  version "0.1.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{promdrop/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/promdrop/#{version}/promdrop-darwin-arm64.tar.gz"
      sha256 "f0bf993a61a23dd6d64f55598877362bd9e9d1fc34360d40781abb8458f5b5e7"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/promdrop/#{version}/promdrop-darwin-amd64.tar.gz"
      sha256 "8fdf42ddf475859f08d0289b84e666ce0cecc3bdb2f9c0c444f83cb77e59bb09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/promdrop/#{version}/promdrop-linux-arm64.tar.gz"
      sha256 "8df9cff2c729002bcd77b2810b3eede28aba9811b21ba06126020171d22b39db"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/promdrop/#{version}/promdrop-linux-amd64.tar.gz"
      sha256 "ac8eac4b78086146e0cac6510676fde7f0ef8d6456784bf5ed2ae7d17f217898"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "promdrop-#{os}-#{cpu}" => "promdrop"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/promdrop --version")
  end
end
