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
      sha256 "eec8865202f2fa872756ed42965a921f4f639c63903bd18b93271d9f97723de6"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-darwin-amd64.tar.gz"
      sha256 "f29a31bccb09e8bd95e420de8bcd798752d59160082cef4322a59b09d065e16a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-linux-arm64.tar.gz"
      sha256 "928adeed52990f8f93af06168dbd09b79ab914d8857aa37556eac8ef6aa16140"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/karc/#{version}/karc-linux-amd64.tar.gz"
      sha256 "aa142b55b3371e7c0471c3bed9026c7df4dc3702637fbaccbf679ffc82b12a73"
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
