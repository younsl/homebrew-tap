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
      sha256 "399a4af8196b82143a970eed7b2cc7dccb0e03c927b4c6344fae1470573b7e54"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-darwin-amd64.tar.gz"
      sha256 "b165b244742d9d1b90901f7d879a7b90809ff2e5b21cd604da8c55b47c978568"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-linux-arm64.tar.gz"
      sha256 "0c2468507e76b957cff6bec4d6a3c7be261979c7044ddee6331612b9c76bd366"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-linux-amd64.tar.gz"
      sha256 "76e55da34c7caa77c00eb9ce147278180720260345797b2484ea5a5f0697c8d6"
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
