class Porytiles < Formula
    desc "Overworld tileset compiler for Pokémon Generation III decompilation projects"
    homepage "https://github.com/grunt-lucas/porytiles"
    # version must be a monotonically increasing number for brew to pick up updates
    version "20250429143152-nightly-74d2ff3fa98ff7de7ca78ea0bc07f9c09e0af435"
    nightly = "nightly-74d2ff3fa98ff7de7ca78ea0bc07f9c09e0af435"
  
    # Define URLs and checksums for different architectures
    if OS.linux? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-amd64.zip"
      sha256 "34e5750f149e3d7b729e2ee76dd41a0bba8fd90c69d716639cf96921b866afbd"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-linux-arm64.zip"
      sha256 "a7a6ab62bf1f245b6924018268662e732fa9ff889b8b118b611da54c94b3cecd"
    elsif OS.mac? && Hardware::CPU.intel?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-amd64.zip"
      sha256 "3ba60bd1acda9da671c302bb62c020a9d92adb31de6229bccdf74dcf3df00485"
    elsif OS.mac? && Hardware::CPU.arm?
      url "https://github.com/grunt-lucas/porytiles/releases/download/#{nightly}/porytiles-macos-arm64.zip"
      sha256 "f7cd2599269396f83fb7cd433d252e8903ad11c2f19f37fd35d6cfafdf35948c"  
    end

    def install
      binary_name = "porytiles"
      bin.install binary_name => "porytiles"
    end
  
    test do
      system "#{bin}/porytiles", "--version"
    end
  end
