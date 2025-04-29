class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250429165635-nightly-be3c3d56a4c4dd69363d43ff60d366005b3f13e9"
  nightly = "nightly-be3c3d56a4c4dd69363d43ff60d366005b3f13e9"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "ed5fa74634d166612eae44a95c8059b6a4fac979d41c77edc46da18131063ddb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "a3d7fb67ff51a4c879c30b93f7c449201912383e66994c61b6b9375af6f0a62b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "b1061fc95d89a7a802c2f9aebbcefb2459901347646d3d47ce43d56ae98784b4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "d542c941847363d35287be35241796c2e38dea807ce6dbdba5370f42b8e5592e"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
