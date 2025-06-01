class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250601154109-nightly-76beaf9e5e4b4a1d4f3889dcbba9f88eb25a8d25"
  nightly = "nightly-76beaf9e5e4b4a1d4f3889dcbba9f88eb25a8d25"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "476eb299c1a6cdd6f67164ffefbbd3a08cce16305820334718675e35ad35169f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "293dfb480e813883055c92678d272ddf4e39c113a8b07253bd682d4b985dedf5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "c5320162913316679fcc2ab26b547c05c564f04a9ac7820f71451b96e4d57e50"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "386bc53672c6d38748acdf8b511c09fbb8c46ef9451c45a8ffe971b921b54bed"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
