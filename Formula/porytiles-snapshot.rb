class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "1.0.0-snapshot.20260825180955.ce96ab1b"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260825180955/porytiles-linux-amd64.zip"
    sha256 "b8bf59f1b5f799fdc5490ff3499bc8edfb5b927e00f69a87f3a83c268d9aaa84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260825180955/porytiles-linux-arm64.zip"
    sha256 "4dd4889ae8d378443256f6550816956e65636309d9140033cf61fde0441f72df"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260825180955/porytiles-macos-arm64.zip"
    sha256 "c2e511480550f5bd041c14f2857dec4467dcb39015765486be4dbd6a1c88809d"
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
