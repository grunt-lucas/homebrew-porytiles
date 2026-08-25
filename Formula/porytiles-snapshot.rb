class PorytilesSnapshot < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects (rolling snapshot from develop)"
  homepage "https://github.com/grunt-lucas/porytiles"
  # Snapshot version: <project-version>-snapshot.<utc-timestamp>.<short-sha>
  # The version line is rewritten by the snapshot_release.yml workflow on every push to develop.
  version "1.0.0-snapshot.20260825144550.c15a2df8"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the snapshot_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260825144550/porytiles-linux-amd64.zip"
    sha256 "abb75bcf2ddccb15e0dd6aa917948bbe6dcb0001eb40998d8d6ad915beb7c391"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260825144550/porytiles-linux-arm64.zip"
    sha256 "72005a66f1594972f961571d1c06a536afec453c3f9420ea490f8d9d3cbd2b9f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/snapshot-20260825144550/porytiles-macos-arm64.zip"
    sha256 "0ff281da3e4e6508d44f7f21805537277e36040f1063217db1ddfabfb3aee0e3"
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
