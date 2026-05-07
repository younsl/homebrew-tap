class Ij < Formula
  desc "Interactive EC2 Session Manager connection tool with fuzzy search"
  homepage "https://github.com/younsl/o/tree/main/box/tools/ij"
  version "0.5.1"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{ij/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-arm64.tar.gz"
      sha256 "abb5a788635cfd7c6cf430b8115de9161e6c1483656d59bd66eb0aebb7bc419d"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "dd14ae628173dfc1d32a73fcdd7e15bfa9478f4b7e85735968a607bcf65afe5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "f39da57f829657cbd29d0e1b8be0bb81d4843bd4d44c99dfbe7bb94f06c548f8"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "b48f3f4a12fc83f8bb4ccb20d3ee5b0a6b4b77b090443cc094323db615138543"
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
