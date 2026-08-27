class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # The version line is rewritten by the versioned_release.yml workflow when a vX.Y.Z tag is pushed.
  version "2.0.0"

  # Define URLs and checksums for different architectures.
  # The sha256 lines are rewritten by the versioned_release.yml workflow.
  # macos-amd64 (Intel) is deliberately unsupported - see porytiles repo CI configuration.
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-linux-amd64.zip"
    sha256 "68c904c3ff707ed2d6de0372073f165e627ec3ee7855eedbb3363184cc9212a4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-linux-arm64.zip"
    sha256 "92d0cd2c079ca1320ec1f5c0b3e3852533bc6d7804cd0a80bf35b53befdbd588"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-macos-arm64.zip"
    sha256 "43696d9c5c0d45537ac2c9c06057ae367fef390b32d7260b37398558df8fb5c0"
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
