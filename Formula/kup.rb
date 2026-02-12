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
      sha256 "6586ef1ea1b0baa33372849af5000a3a7d262d55c5ede2e8708f9364945c8ded"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-darwin-amd64.tar.gz"
      sha256 "52368a63b51b98a8e30c8845abf850e0d5581425b740fc9a81caaa4650e2cd14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-linux-arm64.tar.gz"
      sha256 "dd26b1376881f1269ac71674697a2935d63b0749da106212cdaa2e949cd08242"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/kup/#{version}/kup-linux-amd64.tar.gz"
      sha256 "2225af33984571b76c13c9aad0833c206728f6b50d34ba84b27881666c5fca3a"
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
