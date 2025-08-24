class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250824145114-nightly-3a9d31c67eab5ea6eb188143992a509a1339f164"
  nightly = "nightly-3a9d31c67eab5ea6eb188143992a509a1339f164"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "140c77228f463eefb1b1b5b02e70fed4aba66eba4c817821c8e02e8d32efe5bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "a8edf4752db63a2b4f85ffa6871721bbfdc8cee8d11e161119aed66f5257d8d1"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "300311eaceddd7b5ce501ffd0391dc5593205ace34ef16a553ed5b793e210714"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "8c51e113321ab8b084c127ddda2e7490965b987d7224d898cc4406dbc83cb00c"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
