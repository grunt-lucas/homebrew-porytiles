class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250517154210-nightly-2165d7da845dddee321f528c874d25af5a971cca"
  nightly = "nightly-2165d7da845dddee321f528c874d25af5a971cca"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "6762e4a5839f1b941334ddcde3e6bb3cfd69639bc5eaf16c41927a01e5e19791"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "3bd953072fd85ef686d633f3a2b8b48f8bcc7d28aff4d1a85c9a4dbf949c08f8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "9c824c44e693fda0d44851bf1f16ccd43561a6e83646fb6c8b9845351fc9f1c1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "2dbca98350aeb0a4b3540c759004192a9565059ef395fbd25456eacca7a63213"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
