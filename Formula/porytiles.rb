class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250429145252-nightly-0aff3ddc103e4b569ecd2b65cf0e65f3e13c7f14"
    nightly = "nightly-0aff3ddc103e4b569ecd2b65cf0e65f3e13c7f14"
  
    # Define URLs and checksums for different architectures
    if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
      sha256 "4ff3d802779a79912c5d5d3f971f251c46eb75858b27063e9c5e0830ac185180"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
      sha256 "3ac293b59b85c142cd7e28779f30fc32e43a720cb3a59cc5bb7537ef3ec21020"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "b9a0d566d27bbd4ee7f647ef93cff17381955b12721894f7ba0eb030b5e86f70"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "745d726ea74d281baa931c28f14c5fee6d57ebfaa67d7f46cd407c5f9bc2068e"  
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles"
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
