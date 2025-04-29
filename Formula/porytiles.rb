class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250429171529-nightly-ec8acf435d9e4df926afdd82d41acd9bb409b8ca"
  nightly = "nightly-ec8acf435d9e4df926afdd82d41acd9bb409b8ca"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "3c9d25cd32d78c1cdc0d4fb9d8ff99fdf2eeadad114cf7288af85be56a4c906c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "b90428b5bb1c8bfeb8dcfaeac6ab396a502c66bb67f1554da144ec5aa818b92c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "fa7a7cd1fda19e96110038fcf7230da432f49f357608383946b2a49a0758da87"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "407e2b26e8092b407bacab1c3673f20a8f3047b5764636a8c12fdb5841592a72"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
