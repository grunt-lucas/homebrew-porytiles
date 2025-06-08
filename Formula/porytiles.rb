class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250608133816-nightly-355f89dc2e72387293d243fd4e27bf6a653ab3ee"
  nightly = "nightly-355f89dc2e72387293d243fd4e27bf6a653ab3ee"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "e28b7cbcdf585db21cf1b54b526df3551297d69bd3a8448bd16c95a5bc1e05ff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "2f6c8170b01cf6106fac6bb6f919ed303865f7c5164c9c95d08247a19b78e78b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "ce2045979e8ef811365be58b58ada79320cd3931237ea6b6c42a4c0e4d99e27a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "b5b21c4d3e0f12866bdb73af18da130f2844b9d109d9c34f203e285b2b83e939"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
