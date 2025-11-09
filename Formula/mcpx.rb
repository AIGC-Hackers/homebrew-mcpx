class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.5.0"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-darwin-arm64"
    sha256 "d526654cfb7c292e4a5c96977dd084048db6d1064e7d9464320e5c69de6091cc"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-linux-arm64"
      sha256 "2f7fdd20c2baac3980ce225425721d15141371e84373c79266fb08be167d6e36"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.5.0/mcpx-linux-x64"
      sha256 "c72e607377355a3448eb24c42ef42dc8a0c452b5c13c470a9fdaf5b2e61145e9"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
