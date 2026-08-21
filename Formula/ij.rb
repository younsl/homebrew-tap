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
      sha256 "839e04f89dab5a676e77267d352cb28a28b6d3a50fcd566db708e70cbe3af434"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "00297a90d57c34ce5b60cc74328484b99d33e17049e8a9c7c0921ba13e46633b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "813240a344222c6640b75fd9894712e81a97d6c8e5cfb9d5b32e9661f2b21e5e"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "fcf41ce6e785e538535d75ad49ec03ddcc31f1b079bcf060ec5c834c9e264770"
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
