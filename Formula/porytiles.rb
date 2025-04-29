class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250429141928-nightly-f737f44f63e730bced23b1cb7ab76dd1c90d4620"
    nightly = "nightly-f737f44f63e730bced23b1cb7ab76dd1c90d4620"
  
    # Define URLs and checksums for different architectures
    if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
      sha256 "528c4954ea1a771b05ca2e4fd69c8c4b04daa1d5471fee2f88bfa52d9d50e7de"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
      sha256 "594c11e6ed4b7a52f1ad3a4d44bf37d921617fa649e281e1f27967cff1705db3"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "d5c1f2b390ffbf24a1f727716f9ccccb8f5efaf996cf9e799682ec2d4000d668"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "b0c939ba98a0883549f421de5f4b65ad6ad7301a4025a35862b41c2467f993d9"  
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles"
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
