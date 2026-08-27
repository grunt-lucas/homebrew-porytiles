class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "1.0.0-snapshot.20260827161335.7ad350a4"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260827161335/porytiles-linux-amd64.zip"
    sha256 "b02f3ca5a40a8877f87a02d3474e74f1f144a596b9a27029ab08657d8dfa28fb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260827161335/porytiles-linux-arm64.zip"
    sha256 "f8aebcdccec02456c04ea7a197df9be02ea029fca6892695e653f19a94ec787c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260827161335/porytiles-macos-arm64.zip"
    sha256 "3ae4a3509c6d0180215922e4328a39faca60ceb8558813cf88c688459ba786e1"
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
