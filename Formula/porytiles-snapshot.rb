class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "2.0.0-snapshot.20260905151933.4c244d58"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260905151933/porytiles-linux-amd64.zip"
    sha256 "e3cb0739db98fe1754e4bd498aad54ede91f92ecaf0018bfe24a46d14420e1b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260905151933/porytiles-linux-arm64.zip"
    sha256 "f44d3a1e479f52ca45312a6be7dd98ee6aabb929d0c3fcf349ed727e556d14bd"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260905151933/porytiles-macos-arm64.zip"
    sha256 "b18c17e6a5f5cb4f99fc119cbcf80de6f49321cb499d26b88264777cb5bc04c7"
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
