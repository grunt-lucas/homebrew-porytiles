class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250429153714-nightly-d701e86a81fb7ecde908373701f238634b5925a4"
  nightly = "nightly-d701e86a81fb7ecde908373701f238634b5925a4"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "461fbe4c28abdb9bc38877f67d2db76a6a5dc4f27b9de6e9308f2c156491b976"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "8633f3c3efde897a5e1909d593c3563e9814e01f04fe51aec94e8bc0a6d65d87"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "65e902e03a34e29d80c861639355c7671095d985683855256569fe7587f5b3fc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "bf346564152a18fa6416952338b2ef70e34775a295eaaebc4d663b6f6d30fbce"  
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
