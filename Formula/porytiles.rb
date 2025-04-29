class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250429150513-nightly-09d1f958756081ffb1ad0d36a7f64fc8a56078cb"
    nightly = "nightly-09d1f958756081ffb1ad0d36a7f64fc8a56078cb"
  
    # Define URLs and checksums for different architectures
    if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
      sha256 "734fe9b6b83fe6b5fd3c99134c402a6e541c5de3a47fee66a7fcee99b0586a82"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
      sha256 "9c5fe3cee402afd25f721db47d2bd69d31d86d1be062c22f2dac4a4e9b2e4810"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "6e48641220337fb0070d91c1fd17dad8bcb5e09202691cf9848420e1ee75357f"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "b9fe8e01a197d735e357ac602c7abec30000df48f218140eab01599f6c727539"  
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles"
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
