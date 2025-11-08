class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.0/mcpx-darwin-arm64"
    sha256 "c6acf812041ca1d138e6a7ad2e424f880452896c0fe52d296136e829aa3c635d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.0/mcpx-linux-arm64"
      sha256 "619f108593fec968bc193686d95433a7b5cf9d5b3ed5f3af43504debc2edca1b"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.0/mcpx-linux-x64"
      sha256 "84a3dd55b68466ca11ec49a1ab3a6e29843c24d093f3e6d73c2c5d7e1312d334"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
