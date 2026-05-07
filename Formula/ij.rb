class Ij < Formula
  desc "Interactive EC2 Session Manager connection tool with fuzzy search"
  homepage "https://github.com/younsl/o/tree/main/box/tools/ij"
  version "0.5.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{ij/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-arm64.tar.gz"
      sha256 "d2ec6c993ae57fb2d3cd41ebedf9fc6c7d2fbfcaa8cdb083ae186a0185d77f70"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "e7122b8207e307dbde41bd0c02610a63a60a4ee8432dff81fbad064d1c3e3523"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "ff9fd248e97f691c8cb4eda53f13ffae74c213307c73ed75d5fbee3ebf92d672"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "8791abe330fd26579a1204ab951137d371de66fe77611abe9a812be8f8f4d6c7"
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
