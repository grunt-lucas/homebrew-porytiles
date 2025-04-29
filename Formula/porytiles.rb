class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250429144141-nightly-5e43f4c006cc8c30d35aa3c41d3908489920a685"
    nightly = "nightly-5e43f4c006cc8c30d35aa3c41d3908489920a685"
  
    # Define URLs and checksums for different architectures
    if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
      sha256 "bbbed5137abc1f7a649f899726315c39e0d285546aba0c8e15657a3b9c68bc4b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
      sha256 "a812dec7d478394c858e1b81857ff8979395f926bc9c0e8f440c8646696f0d63"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "2eb9ad7cc208da262e3d0778afd3d333fef3ddda939c0b10decbccb55d875e96"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "48b3260b70975ca6cd51977d10da8c942f04fd9e5f1c70106a48e0a1cae07f5d"  
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles"
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
