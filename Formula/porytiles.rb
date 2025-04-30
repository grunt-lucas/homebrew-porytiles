class Porytiles < Formula
  desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
  homepage "https://github.com/grunt-lucas/porytiles"
  # version must be a monotonically increasing number for brew to pick up updates
  version "20250430191158-nightly-a81143c604c2a85972aaf47acbf2184b774697cd"
  nightly = "nightly-a81143c604c2a85972aaf47acbf2184b774697cd"

  # Define URLs and checksums for different architectures
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
    sha256 "74ff0f76d5ebed4d66673b2a44da67026458ed7520ab20a61d445c07bda6b245"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
    sha256 "ddcce0f46842ad33f01429ce991b06e84dff978462b270e8872584c3ca281706"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
    sha256 "4f7814191fe85e85ed81ae33d324553293afe4e9b60733670c302dbec6a413c8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
    sha256 "87a461193627e1188bd50c6349149f8b70871881d13fc5546babaac51e0303ee"
  end

  def install
    binary_name = "porytiles"
    bin.install binary_name => "porytiles"
  end

  test do
    system "#{bin}/porytiles", "--version"
  end
end
