class Ij < Formula
  desc "Interactive EC2 Session Manager connection tool with fuzzy search"
  homepage "https://github.com/younsl/o/tree/main/box/tools/ij"
  version "0.2.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{ij/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-arm64.tar.gz"
      sha256 "7c75cd835882c23f5ba3515356f6ca7d3a63d6c7828e857eaf4ef3674c05e0a9"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "769fea1127e7e2717403859ca870f58fb8d524201f912765a4d65c4ac3c8620f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "6b74cab39a0d3423aebc7d3ef589622541e5af4bc05d84f3d8892a3c0b40ad2b"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "fa5dea2a1de257ee3479b938742cb50381af8a658254e7f4ae9fb5923eb59521"
    end
  end

  def install
    cpu = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "ij-#{os}-#{cpu}" => "ij"
  end

  def caveats
    <<~EOS
      ij requires AWS credentials and the AWS CLI:

        brew install awscli

      Configure credentials via:

        aws configure
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ij --version")
  end
end
