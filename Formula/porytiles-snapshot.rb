class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "1.0.0-snapshot.20260825040105.8f55680d"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot/porytiles-linux-amd64.zip"
    sha256 "70d3fb7cd3333ac0d4e0f67921357a8bc9061d5c3fc4d750638be6e9f02cb40b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot/porytiles-linux-arm64.zip"
    sha256 "3c854276f7c00e9752a3a93c8e9329505cafb352b81fd5db2c9ab0e36e65fff8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot/porytiles-macos-arm64.zip"
    sha256 "249e20baeb85cc5d77bb56eecbfe57b3cafc540dc27fd9978bfaf3b7b40ea823"
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
