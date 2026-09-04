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
      sha256 "c3ab78b56fd5ab9079a8d2a5bafd517f97ec8c350879a9759c1dcde60bbf6c32"
    end
    on_intel do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-darwin-amd64.tar.gz"
      sha256 "f01f60fb3ca281632f35b184445cb73a08eb48afb765bde87591d03a10a57391"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-linux-arm64.tar.gz"
      sha256 "375bad6324ee5db030733cce47bdd06d39f5ea030a68ea94f6124f7bf0ae9796"
    end
    on_intel do
      url "https://github.com/younsl/addons/releases/download/ij/#{version}/ij-linux-amd64.tar.gz"
      sha256 "9744ee010ee6222d2b7bf3845dba0e24dfc268b4f7fca1914463a85a73c849f3"
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
