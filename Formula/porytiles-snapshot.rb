class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "2.0.0-snapshot.20260831193133.721ed0b2"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260831193133/porytiles-linux-amd64.zip"
    sha256 "7c669017787f274da88afd6af5c3d84f614bb1d1a87787f8fce01efb0e1e4e54"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260831193133/porytiles-linux-arm64.zip"
    sha256 "8d1775788bd7b309c777e01ab6245a609fbdea0e1324014148dd718ce4b7c40d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260831193133/porytiles-macos-arm64.zip"
    sha256 "5f1fdc3eaaa97d8ceaba533a1dfc603ef50fd3cba0bc8182ed1971188aa5f887"
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
