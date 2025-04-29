class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250429153714-nightly-d701e86a81fb7ecde908373701f238634b5925a4"
  nightly = "nightly-d701e86a81fb7ecde908373701f238634b5925a4"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "7e64fa0facab7a95c530be3eb11188992f6492d30bfeb3101f2602adfed38f34"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "73fa0f161bad790139b4da94f71413b862fc9c6c52f2655f851472f46c9a2d85"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "98668807f28d19257cb795a9eb367e306665573cf1b04f7f6f970d9f5bd5d467"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "90cc9b08038339850d920651c338d7b781efe7c1bec3822d7ca020765c08eb7a"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
