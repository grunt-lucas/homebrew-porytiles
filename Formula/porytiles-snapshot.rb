class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "1.0.0-snapshot.20260603181655.37606464"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot/porytiles-linux-amd64.zip"
    sha256 "f13d454a906c33dd7b81773023dd9aefda45038260fb133909d80354b41fb6d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot/porytiles-linux-arm64.zip"
    sha256 "c4862e5448a3929e413eda2453cf24474a88b9a8700cee1116beddcc175f1433"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot/porytiles-macos-arm64.zip"
    sha256 "01cac3cacb407528c9f9b014ac439efcbfd8d6183eed09f0c1af0ad285dc6e25"
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
