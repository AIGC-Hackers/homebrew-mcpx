class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.4.0"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.0/mcpx-darwin-arm64"
    sha256 "69450258c732b0c34f23ac165fcbee51fe3f656d7df82c5da994f92bd6fa6485"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.0/mcpx-linux-arm64"
      sha256 "ff796c4cdb0b3a6d13556e555545cfd3a3e690322f22c36ed8026acd369e41eb"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.0/mcpx-linux-x64"
      sha256 "a75b7421d659e0bcf7472911e4e00a03eb5206ba9274797b9707219f8fe305fd"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
