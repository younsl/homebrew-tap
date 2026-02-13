class Kup < Formula
  desc "Interactive EKS cluster upgrade CLI tool"
  homepage "https://github.com/younsl/o/tree/main/box/kubernetes/kup"
  version "0.3.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{kup/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-darwin-arm64.tar.gz"
      sha256 "f41bb21a6371bfd866d6195b1f0e0e8d87b596ce9d7cbb546f8c5642418cc52b"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-darwin-amd64.tar.gz"
      sha256 "16851d17240d0058279cdf9e9c3b5f1160701fe97540273f2bf622cb7498e033"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-linux-arm64.tar.gz"
      sha256 "71a57e8cafe39b9d189b59258956e1555315c8dc7baba44a527ec168023bb92e"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-linux-amd64.tar.gz"
      sha256 "81fe5560525c3475b05119be8910656e513ed710c2abd9e77bba741fecdbd185"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "kup-#{os}-#{cpu}" => "kup"
  end

  def caveats
    <<~EOS
      kup requires AWS credentials and the AWS CLI:

        brew install awscli

      Configure credentials via:

        aws configure
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kup --version")
  end
end
