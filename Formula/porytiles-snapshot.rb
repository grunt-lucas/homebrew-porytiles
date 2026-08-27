class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "2.0.0-snapshot.20260827203809.29b9186a"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260827203809/porytiles-linux-amd64.zip"
    sha256 "0bfb6f4f8d52f99f07a9e74fbb7c100ed7e139e4f6cff2ba1fcd7499f924e928"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260827203809/porytiles-linux-arm64.zip"
    sha256 "88663447c4248215928b06a8830e7446b4e03bee63337ae134e2b0594180c126"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260827203809/porytiles-macos-arm64.zip"
    sha256 "f7e2eaac76c88c142f9684751cfdddbb773fa30331180c89d4bdf93e6a233ab0"
  end

  def install
    bin.install "porytiles"
    bin.install "porytiles-legacy"
  end

  test do
    system "#{bin}/porytiles", "--version"
    system "#{bin}/porytiles-legacy", "--version"
  end
end
