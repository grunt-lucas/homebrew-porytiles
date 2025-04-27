class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250427220010-nightly-0e324768789ae011f18db8caad21e24a397d6cbb"
    nightly = "nightly-0e324768789ae011f18db8caad21e24a397d6cbb"
  
    # Define URLs and checksums for different architectures
    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "d465151f9f5e7a8255392d8c752b4ca43f06eee64623977a9cfae6634ee24e00"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "d3ef13078993c67c4152ed0e745eac286c455e73249f25be0fbc9e7a3c4aef2b"
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles" # Installs and renames the binary to 'supertool'
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
