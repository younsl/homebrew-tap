class Karc < Formula
  desc "Karpenter NodePool consolidation manager CLI tool"
  homepage "https://github.com/younsl/o/tree/main/box/kubernetes/karc"
  version "0.1.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{karc/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-darwin-arm64.tar.gz"
      sha256 "1d405277870e23a562d95de597c1f21d9dd33584bfce15069795f71c332f4d2b"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-darwin-amd64.tar.gz"
      sha256 "49d97f900376aebb85b01255eab48ccf9958169320d129f616db32c856e10c3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-linux-arm64.tar.gz"
      sha256 "f4eb61c00d8d5e3d93ec2f91a4af7386e7900179087e02f003051beb52f6c6fa"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-linux-amd64.tar.gz"
      sha256 "c80ca32eb4cc5adf846fe7fd6a451c87684066dbe4a6a46e959ef2767e8e223f"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "karc-#{os}-#{cpu}" => "karc"
  end

  def caveats
    <<~EOS
      karc requires kubectl and a valid kubeconfig:

        brew install kubectl

      Ensure your kubeconfig is configured for the target cluster.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/karc --version")
  end
end
