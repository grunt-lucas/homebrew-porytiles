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
    sha256 "3ca4b6c428257eb7913e128fb6942db420d21055ae2d2b40b991a29750261f20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-linux-arm64.zip"
    sha256 "9a7bde93c773a42ccc64e336738075041808d448f0c843f0075660b061e1be48"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/v#{version}/porytiles-macos-arm64.zip"
    sha256 "3882b6ae2e1887318e8cf0a832cbf264ecf9735d63f87ccac34b8d382f55fcbf"
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
