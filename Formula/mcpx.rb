class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.5.0"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-darwin-arm64"
    sha256 "13310aa8f07ab04699a485783eaebe79a2601e66d5ee83f334f45630d3c96fae"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-linux-arm64"
      sha256 "fd5cf443a4d3837d81729479a6624ccaf04c7023f5b0663ca98acadf5bfffccb"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-linux-x64"
      sha256 "d4f994b76f8c190c79cbb21bb061253cffd4a4404126eeba8bd85b12a4694e0f"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
