class Ij < Formula
  desc "Interactive EC2 Session Manager connection tool with fuzzy search"
  homepage "https://github.com/younsl/addons/tree/main/box/tools/ij"
  version "0.5.1"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/addons/releases"
    regex(%r{ij/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-darwin-arm64.tar.gz"
      sha256 "f82b8392d9fe547be7225e6e20e167d3c022f2f33ba1d2406b05fe53b5857758"
    end
    on_intel do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "900e39997e6c968818cb6be6d01d775062d26c486056095dd00f98ac2144858c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "a079f7b21df77314daec3e54fc9e802eb00da6d02fb74011802c61b1b74beb07"
    end
    on_intel do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "a7e40e8c182344d3ef7c4dde56429665a5ddb8cfd7fda855b799aa4204770f4c"
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
