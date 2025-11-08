#!/bin/bash
set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.3.6"
  exit 1
fi

echo "Downloading binaries for v$VERSION..."

# 下载所有平台的二进制文件
mkdir -p /tmp/mcpx-downloads
cd /tmp/mcpx-downloads

curl -sL "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-darwin-arm64" -o mcpx-darwin-arm64
curl -sL "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-darwin-x64" -o mcpx-darwin-x64
curl -sL "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-linux-arm64" -o mcpx-linux-arm64
curl -sL "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-linux-x64" -o mcpx-linux-x64

echo "Calculating SHA256 checksums..."

# 计算 SHA256
DARWIN_ARM64_SHA=$(shasum -a 256 mcpx-darwin-arm64 | awk '{print $1}')
DARWIN_X64_SHA=$(shasum -a 256 mcpx-darwin-x64 | awk '{print $1}')
LINUX_ARM64_SHA=$(shasum -a 256 mcpx-linux-arm64 | awk '{print $1}')
LINUX_X64_SHA=$(shasum -a 256 mcpx-linux-x64 | awk '{print $1}')

echo "Darwin ARM64: $DARWIN_ARM64_SHA"
echo "Darwin x64:   $DARWIN_X64_SHA"
echo "Linux ARM64:  $LINUX_ARM64_SHA"
echo "Linux x64:    $LINUX_X64_SHA"

# 获取当前脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 更新 formula
cat > "$SCRIPT_DIR/Formula/mcpx.rb" << EOF
class Mcpx < Formula
  desc "Extended TypeScript runtime and CLI for Model Context Protocol"
  homepage "https://github.com/ethan-huo/mcpx"
  version "$VERSION"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-darwin-arm64"
      sha256 "$DARWIN_ARM64_SHA"
    else
      url "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-darwin-x64"
      sha256 "$DARWIN_X64_SHA"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-linux-arm64"
      sha256 "$LINUX_ARM64_SHA"
    else
      url "https://github.com/ethan-huo/mcpx/releases/download/v$VERSION/mcpx-linux-x64"
      sha256 "$LINUX_X64_SHA"
    end
  end

  def install
    bin.install Dir["*"].first => "mcpx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcpx --version")
  end
end
EOF

echo "✅ Formula updated: $SCRIPT_DIR/Formula/mcpx.rb"
echo ""
echo "Next steps:"
echo "1. cd $SCRIPT_DIR"
echo "2. git add Formula/mcpx.rb"
echo "3. git commit -m 'chore: update to v$VERSION'"
echo "4. git push"

# 清理
cd ..
rm -rf /tmp/mcpx-downloads
