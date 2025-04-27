class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    version "nightly-f3806673ba359047d27e5f9607569149f78ca3a9"
  
    # Define URLs and checksums for different architectures
    if OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{version}/porytiles-macos-amd64.zip"
      sha256 "1eba0fa511e1b17ea1870fd3dd22eda5df5eea497606d51f0944a01f604b269b"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{version}/porytiles-macos-arm64.zip"
      sha256 "64d892992ebb0d56b9389bd97d0b0723c848c8c54b92df98f0dca73297a47c93"
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles" # Installs and renames the binary to 'supertool'
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end