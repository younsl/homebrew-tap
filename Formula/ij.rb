class Ij < Formula
  desc "Interactive EC2 Session Manager connection tool with fuzzy search"
  homepage "https://github.com/younsl/o/tree/main/box/tools/ij"
  version "0.1.0"
  license "MIT"

  livecheck do
    url "https://github.com/younsl/o/releases"
    regex(%r{ij/v?(\d+(?:\.\d+)+)}i)
  end

  on_macos do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-arm64.tar.gz"
      sha256 "03e90c6d17ee79d095f6ce8206d8857fd3f583bad33287e2f89733693d4ba647"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "6e71db08baad6f75b0dabef811f581230c15a1b185cd6410aa240c7c1f467433"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "667bbebd3ac903cefdad3136d842a4aa0b4d113d1a8c4b4f9e60573db4a3a85d"
    end
    on_intel do
      url "https://github.com/younsl/o/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "3149a358cee137b8afeeaf36d730769b895040b2233b6bc74d52ff9f59f37ab1"
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
