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
      sha256 "a51bcb7e7d5b35c597cf5263887f1b1d9477b681bea92141a5d564468123e778"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-darwin-amd64.tar.gz"
      sha256 "a575e0deb0c176b7410d5ae767ef633c747346607f67df45ba6fe42b9283f07b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-linux-arm64.tar.gz"
      sha256 "bc5736de4f38be2543c3012c09e97ae431e2ca1351c2dfa1bdeeb2b0df0675b6"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-linux-amd64.tar.gz"
      sha256 "e3a99df36d730616a059190ecab564102ab160ce7ba4d8427939455288e78dea"
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
