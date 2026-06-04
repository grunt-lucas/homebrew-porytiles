class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # The version line is rewritten by the versioned_release.yml workflow when a vX.Y.Z tag is pushed.
  version "1.0.0"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the versioned_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-linux-amd64.zip"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-linux-arm64.zip"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-macos-arm64.zip"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
