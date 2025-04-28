class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250428150853-nightly-58f6f5dd4cb4c1f514ed0cdca47667424ad3d107"
    nightly = "nightly-58f6f5dd4cb4c1f514ed0cdca47667424ad3d107"
  
    # Define URLs and checksums for different architectures
    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "8a2abe74636f6c5d6296741e221492ba3d5ca1822fe2c3e46d6363e0787210fc"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "722fe7e399d65066ae05a7740060ad0e5825b7b3b7356a8852bd89fcdced6046"
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles" # Installs and renames the binary to 'supertool'
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
