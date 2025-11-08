class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/AIGC-Hackers/mcpx"
  version "0.4.2"
  license "MIT"

  on_macos do
    url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.2/mcpx-darwin-arm64"
    sha256 "9bf9cb5afd4da9e3824ee0b9f4ddf0341f94769f4873e6a423eaaf63bd79a727"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.2/mcpx-linux-arm64"
      sha256 "81bc33ae9fda96bdebe3a159e2a325b399e6e43b55e5b3431225baefdd3669c5"
    else
      url "https://github.com/AIGC-Hackers/mcpx/releases/download/v0.4.2/mcpx-linux-x64"
      sha256 "fc1edd22bfc7968074f0fd301f90329e6258ad0534a42d2b48d054c1bc9db871"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
