class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.4.1"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.1/mcpx-darwin-arm64"
    sha256 "83dc173ec6bffb3ee988a1ecd2e90c950e9f48fbb98dfb2418634086f61d3b20"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.1/mcpx-linux-arm64"
      sha256 "d081657a32706822469ea8ea24bc06b999a61cffd22f6d7cf931400a95743165"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.1/mcpx-linux-x64"
      sha256 "36d522ede55d51119479844da9c65cc22cb0106a082c45ea8d1e723d3b45e6bd"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
