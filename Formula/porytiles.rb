class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250605152153-nightly-5098144f5455d5bd5b29a5112f87506ef6b12ea9"
  nightly = "nightly-5098144f5455d5bd5b29a5112f87506ef6b12ea9"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "b04b17cd855aad69533202a330549ac9eb873ff5b192efa26c472021ce9d5b3a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "0f9629124cc7a7782378b0e33399207cd0ac703a4a4444b92ec99d182d24c7cf"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "7fa62f3e2f98309c174feb17ad63391d5b556e51b44453a58987182045c720bc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "114f2b56448c886709f4fb4281196f3caa0c0db19efc1c2e38a30241fc430dff"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
