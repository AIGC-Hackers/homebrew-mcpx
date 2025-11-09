class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.5.0"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-darwin-arm64"
    sha256 "2f18c3d6ac51c728d9011306d4d206265b9aac7a4e5eaa3de9127c4dc910249d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-linux-arm64"
      sha256 "92855753a227164f5e6114255f2e8903a89defe67b9d1970e66434433e308de9"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-linux-x64"
      sha256 "d640df917a7a2d1a7cd9925dd9d3c16f8c2432ca8aa9215b1e89003141fae275"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
