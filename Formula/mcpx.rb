class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.4.2"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.2/mcpx-darwin-arm64"
    sha256 "4487ae84a6a2339f63327d67c3cd884cfa3bacf122e4610bc77b5288da3e8438"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.2/mcpx-linux-arm64"
      sha256 "6683507ea76e3b26eee09e114a497a60fdc629b18a25f840929c5e9d23b4797b"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.2/mcpx-linux-x64"
      sha256 "9e358094ede7d9f563c834b8f9fb4c84b17925fc3af1368d65fdf489df4231a3"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
